unit UZoo_RelatorioInventarioDetail;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, Tc.VCL.Controls.GDIButton, JvExExtCtrls, JvImage,
  VCL.ExtCtrls, VCL.StdCtrls, JvExtComponent, JvPanel, VCL.ActnList, Data.FMTBcd, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioInventarioDetail = class(T_FormDialog)
    _btbCancel: TTcGDIButton;
    _btbSave: TTcGDIButton;
    cdsInventario: TClientDataSet;
    dspInventario: TDataSetProvider;
    sqlInventario: TTcSQLDataSet;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    JvDBUltimGrid1: TJvDBUltimGrid;
    sqlInventarioKZOO_CFGCATEGORIA: TStringField;
    sqlInventarioKZOO_ANIMAL: TStringField;
    sqlInventarioBRINCO: TStringField;
    sqlInventarioSTATUS_ANIMAL: TIntegerField;
    sqlInventarioSEXO_ANIMAL: TStringField;
    sqlInventarioIDADE_DIAS: TIntegerField;
    sqlInventarioNL: TIntegerField;
    sqlInventarioDEL: TIntegerField;
    cdsInventarioKZOO_CFGCATEGORIA: TStringField;
    cdsInventarioKZOO_ANIMAL: TStringField;
    cdsInventarioBRINCO: TStringField;
    cdsInventarioSTATUS_ANIMAL: TIntegerField;
    cdsInventarioSEXO_ANIMAL: TStringField;
    cdsInventarioIDADE_DIAS: TIntegerField;
    cdsInventarioNL: TIntegerField;
    cdsInventarioDEL: TIntegerField;
    DataSource1: TDataSource;
    sqlInventarioNOMECOMPLETO: TStringField;
    sqlInventarioNOMEESTABULO: TStringField;
    cdsInventarioNOMECOMPLETO: TStringField;
    cdsInventarioNOMEESTABULO: TStringField;
    cdsInventarioDESCR_STATUS: TStringField;
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute( ATipo : Integer ; ACategoria : String  ) : boolean ;
  end;

var
  Zoo_RelatorioInventarioDetail: TZoo_RelatorioInventarioDetail;

implementation

{$R *.dfm}

uses Tc.DBRTL.AbstractDB, CLAg5Types, ClAg5ClientZootecnicoCommonTypes ;

{ TZoo_RelatorioInventarioDetail }

class function TZoo_RelatorioInventarioDetail.Execute( ATipo : Integer ; ACategoria : String  ) : boolean ;
var
  ThisForm: TZoo_RelatorioInventarioDetail;
  ModalResult : integer ;
begin

  ThisForm := TZoo_RelatorioInventarioDetail.Create( nil );
  try
    TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_SIGLA_CATEGORIA_FEMEA, ThisForm.cdsStatusAnimal );

    if Trim ( ACategoria ) = '' then
      begin
       ThisForm.cdsInventario.Params.ParamByName('KZOO_CFGCATEGORIA').Clear ;
       ThisForm.cdsInventario.Params.ParamByName('KZOO_CFGCATEGORIA').Bound := True ;
      end
    else
       ThisForm.cdsInventario.Params.ParamByName('KZOO_CFGCATEGORIA').asString := ACategoria ;

    ThisForm.JvDBUltimGrid1.ShowHighlighter := True ;

    ThisForm.cdsInventario.Open ;
    ModalResult := ThisForm.ShowModal;
    Result := ( ModalResult = mrOK );
    if Result then
      { ThisForm.  } ;
  finally
    ThisForm.free;
  end;
end;

procedure TZoo_RelatorioInventarioDetail.JvDBUltimGrid1DblClick(
  Sender: TObject);
begin
  if not cdsInventario.IsEmpty then
    TShowFichaAnimal.Execute( cdsInventarioKZOO_ANIMAL.AsString );
end;

end.
