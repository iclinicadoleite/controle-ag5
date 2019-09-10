unit UZoo_AtividadesProtocolosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, UZoo_AtividadesBaseWizard,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls, JvExtComponent, JvPanel, JvImage,
  SysFormWizard, JvExExtCtrls, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, Tc.VCL.Edits, UZoo_AtividadesProtocolosDatamodule,
  VCL.DBCtrls, Tc.VCL.Controls.GDIButton, System.Actions, Wrappers ;

type
  TZoo_AtividadesProtocolosWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesProtocolosDatamodule : TZoo_AtividadesProtocolosDatamodule;
    procedure OpenTables ; override ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses ThreadSuppl ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesProtocolosWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

destructor TZoo_AtividadesProtocolosWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_AtividadesProtocolosWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesProtocolosWizard;
begin
  ThisForm := TZoo_AtividadesProtocolosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething};
  finally
     ThisForm.free ;
  end ;
end ;

procedure TZoo_AtividadesProtocolosWizard.OpenTables;
begin
   Zoo_AtividadesProtocolosDatamodule := TZoo_AtividadesProtocolosDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesProtocolosDatamodule.cdsAProtocolos ;
end;

procedure TZoo_AtividadesProtocolosWizard._actNextExecute(Sender: TObject);
begin
  Caption := 'Atividades - Protocolos' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesProtocolosDatamodule.Ate := deAte.date ;
  inherited;
end;

procedure TZoo_AtividadesProtocolosWizard._actPriorExecute(Sender: TObject);
begin
  inherited;
  Caption := 'Atividades - Protocolos' ;
end;

initialization
  RegisterClass ( TZoo_AtividadesProtocolosWizard )
end.
