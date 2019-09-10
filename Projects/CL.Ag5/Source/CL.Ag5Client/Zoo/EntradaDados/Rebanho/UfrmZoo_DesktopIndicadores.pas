unit UfrmZoo_DesktopIndicadores;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.ExtCtrls, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, JvExStdCtrls, JvCombobox, TabControlDeskTop, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfrmGlb_Desktop, System.Actions,
  Tc.VCL.Application, JvComponentBase ;

type
  TfrmZoo_DesktopIndicadores = class(TfrmGlb_Desktop)
  private
    { Private declarations }
    FIndicadorTableName : TStringList ;
    FIndicadorKey : TStringList ;
  protected
    procedure GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass ) ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, UZoo_IndicadoresWizard ;



{$R *.dfm}

constructor TfrmZoo_DesktopIndicadores.Create(AOwner: TComponent);
var
  CDS : TClientDataSet ;
begin
  inherited;

  FIndicadorTableName := TStringList.Create ;
  FIndicadorKey := TStringList.Create ;

  cds := nil ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet ( cds, '* FROM ZOO_CFGINDICADORES' ) ;

  with cds do
    begin
      first ;
      while not eof do
        begin
           FDesktop.AddTab ( FieldByName('SIGLA').asString ) ;
           if FieldByName('TIPOINDICADOR').asString = 'C' then
             FIndicadorTableName.Add ( 'ZOO_I_C' + FieldByName('TABLE_ID').asString )
           else
             FIndicadorTableName.Add ( 'ZOO_I_F' + FieldByName('TABLE_ID').asString ) ;
           FIndicadorKey.Add ( FieldByName ( 'KZOO_CFGINDICADOR' ).asString ) ;
           next ;
        end ;
    end;
  cds.free ;
end;

destructor TfrmZoo_DesktopIndicadores.Destroy;
begin
  FIndicadorTableName.free ;
  FIndicadorKey.Free ;
  inherited;
end;

procedure TfrmZoo_DesktopIndicadores.GetClass ( TabIndex : integer ; out ObjectClass : TComponentClass );
begin
  inherited;
  case TabIndex of
   -1 : ;
  else
    begin
     TZoo_IndicadoresWizard ( FDesktop.NewForm( TZoo_IndicadoresWizard, 'Zoo_IndicadoresWizard_' + FIndicadorTableName[ TabIndex ] ) ).KeyIndicador := FIndicadorKey[ TabIndex  ]
    end;
  end;
end;

initialization
  RegisterClass ( TfrmZoo_DesktopIndicadores ) ;

end.
