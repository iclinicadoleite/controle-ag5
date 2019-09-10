// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Inventário
//
// License      : veja readme.txt


unit UZoo_RelatorioInventario;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioInventario = class(T_FormWizard)
    GroupBox1: TGroupBox;
    dtsInventario: TDataSource;
    dspInventario: TDataSetProvider;
    sqlInventario: TTcSQLDataSet;
    cdsInventario: TClientDataSet;
    DBGridResultados: TJvDBUltimGrid;
    TabSheet1: TTabSheet;
    sqlInventarioSUMMARY_TYPE: TIntegerField;
    sqlInventarioKZOO_CFGCATEGORIA: TStringField;
    sqlInventarioDESCRICAO: TStringField;
    sqlInventarioSTATUS: TIntegerField;
    sqlInventarioIDADE_INFERIOR: TIntegerField;
    sqlInventarioIDADE_SUPERIOR: TIntegerField;
    sqlInventarioDEL_INFERIOR: TIntegerField;
    sqlInventarioDEL_SUPERIOR: TIntegerField;
    sqlInventarioNL_INFERIOR: TIntegerField;
    sqlInventarioNL_SUPERIOR: TIntegerField;
    sqlInventarioITEMCOUNT: TIntegerField;
    sqlInventarioREPEAT: TStringField;
    cdsInventarioSUMMARY_TYPE: TIntegerField;
    cdsInventarioKZOO_CFGCATEGORIA: TStringField;
    cdsInventarioDESCRICAO: TStringField;
    cdsInventarioSTATUS: TIntegerField;
    cdsInventarioIDADE_INFERIOR: TIntegerField;
    cdsInventarioIDADE_SUPERIOR: TIntegerField;
    cdsInventarioNL_INFERIOR: TIntegerField;
    cdsInventarioNL_SUPERIOR: TIntegerField;
    cdsInventarioDEL_INFERIOR: TIntegerField;
    cdsInventarioDEL_SUPERIOR: TIntegerField;
    cdsInventarioITEMCOUNT: TIntegerField;
    cdsInventarioREPEAT: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsInventarioDESCR_STATUS: TStringField;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure cdsInventarioBeforeOpen(DataSet: TDataSet);
    procedure cdsInventarioREPEATGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsInventarioDESCRICAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetParams;
    procedure OpenTables ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses Tc.DBRTL.AbstractDB, CDSSuppl,
     CLAg5Types, UDBZootecnico, DateUtils, SysPrintGridDialog ,
     JvDBGridSuppl,
  UZoo_RelatorioInventarioDetail;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_RelatorioInventario.cdsInventarioBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_RelatorioInventario.cdsInventarioDESCRICAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case cdsInventarioSUMMARY_TYPE.asInteger of
   1  : Text := 'Outros'   ;
   2  : Text := 'Subtotal  (=)' ;
   3  : Text := 'Repetidos (-)' ;
   4  : Text := 'Total     (=)' ;
  else
     Text := Sender.asString ;
  end


end;

procedure TZoo_RelatorioInventario.cdsInventarioREPEATGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.asBoolean then
    Text := '*'
  else
    Text := ''
end;

constructor TZoo_RelatorioInventario.Create(AOwner: TComponent);
begin
  inherited;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_SIGLA_CATEGORIA_FEMEA, cdsStatusAnimal );
  lblTotalLinhas.Caption :='';
  DBGridResultados.ShowHighlighter := True ;
  OpenTables ;
end;

procedure TZoo_RelatorioInventario.DBGridResultadosDblClick(Sender: TObject);
begin
   if ( cdsInventarioSUMMARY_TYPE.asInteger = 0 ) or ( cdsInventarioSUMMARY_TYPE.asInteger = 1 ) then
     TZoo_RelatorioInventarioDetail.Execute( cdsInventarioSUMMARY_TYPE.asInteger, cdsInventarioKZOO_CFGCATEGORIA.asString ) ;
end;

destructor TZoo_RelatorioInventario.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_RelatorioInventario.Execute : boolean;
var
  ThisForm: TZoo_RelatorioInventario;
begin
  ThisForm := TZoo_RelatorioInventario.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_RelatorioInventario.OpenTables;
begin

  sqlInventario.SQLConnection.ExecuteDirect( 'EXECUTE PROCEDURE ZOO_EXEC_INVENTARIO ( '''' )' ) ;
  TCDSSuppl.Open ( cdsInventario ) ;
  //lblTotalLinhas.Caption := Format('Total de linhas: %d',[cdsInventario.RecordCount]);
end;

procedure TZoo_RelatorioInventario.SetParams;
begin
(*
  cdsInventario.Params.paramByName ( 'DESCARTADA' ).asInteger  := _ST_STATUS_FEMEA_DESCARTADO ;
  cdsInventario.Params.paramByName ( 'VL' ).asInteger  := _ST_STATUS_FEMEA_VACALACTACAO ;
  cdsInventario.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
*)
end;

procedure TZoo_RelatorioInventario._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption );
  inherited;
end;

procedure TZoo_RelatorioInventario._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TZoo_RelatorioInventario._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TZoo_RelatorioInventario ) ;


end.
