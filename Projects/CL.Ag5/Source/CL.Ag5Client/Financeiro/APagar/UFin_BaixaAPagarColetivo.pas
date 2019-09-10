// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Dar baixa em contas a pagar
//
// License      : veja readme.txt






unit UFin_BaixaAPagarColetivo;
interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExMask,
  VCL.Mask, Tc.VCL.Controls.GDIButton, Tc.VCL.Edits, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, UFin_BaixaAPagarColetivoDatamodule,
  JvToolEdit, Data.DB, Tc.Data.DB.Helpers, SysFormEditaLista, System.Actions,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TFIN_BaixaAPagarColetivo = class(T_FormWizard)
    dtsResultado: TDataSource;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicial: TTcDateEdit;
    edDataFinal: TTcDateEdit;
    GroupBox2: TGroupBox;
    edEntidade: TJvComboEdit;
    rbTodos: TRadioButton;
    rbEntidade: TRadioButton;
    DBGridResultados: TJvDBUltimGrid;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    edValor: TTcDBCalcEdit;
    edVencto: TTcDBDateEdit;
    edPago: TTcDBCalcEdit;
    edPagto: TTcDBDateEdit;
    TcDateEdit1: TTcDateEdit;
    rbBaixarNaData: TRadioButton;
    rbBaixarNoVencimento: TRadioButton;
    BitBtn3: TTcGDIButton;
    actBaixarTodosTitulos: TAction;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridResultadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    function DBGridResultadosCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure DBGridResultadosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure DBGridResultadosCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure DBGridResultadosEditButtonClick(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
    procedure actBaixarTodosTitulosExecute(Sender: TObject);
    procedure rbBaixarNaDataClick(Sender: TObject);
    procedure TcDateEdit1Change(Sender: TObject);
    procedure TcDateEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    Fin_BaixaAPagarColetivoDatamodule : TFin_BaixaAPagarColetivoDatamodule ;
    FDBGridResultados : TJvDBUltimGrid ;
    FKCad_Entidade : string ;
    FSelectedTipoTitulo : TTipoTitulo ;
    procedure SearchFornecedor;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsFinanceiro, FIN_APagarTypes,
     SysPrintGridDialog, UfrmFIN_ApagarBaixaApropriacao,
     CLAg5SvcFinanceiroEntradaDadosAPagar, CLAg5SvcEstoqueEntradaDadosCompras ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TFIN_BaixaAPagarColetivo.actBaixarTodosTitulosExecute(
  Sender: TObject);
begin
  Fin_BaixaAPagarColetivoDatamodule.BaixarTodos ;
end;

constructor TFIN_BaixaAPagarColetivo.Create(AOwner: TComponent);
begin
  inherited;
  Fin_BaixaAPagarColetivoDatamodule := TFin_BaixaAPagarColetivoDatamodule.Create( Self );
  TcDateEdit1.Date := Fin_BaixaAPagarColetivoDatamodule.DataDeBaixa ;
  FSelectedTipoTitulo := ttAPagar ;
  Fin_BaixaAPagarColetivoDatamodule.OpenTables;
  edDataInicial.Date  := Date;
  edDataFinal.Date    := Date + 7;
  _btbExecute.Caption := '&Processar' ;
  FDBGridResultados   := DBGridResultados ;
  DBGridResultados.ShowHighlighter := True ;
end;

destructor TFIN_BaixaAPagarColetivo.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFIN_BaixaAPagarColetivo.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  rbEntidade.Checked := True;
  SearchFornecedor;
end;

procedure TFIN_BaixaAPagarColetivo.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0;
      rbEntidade.Checked := True;
      SearchFornecedor;
    end;
end;

class function TFIN_BaixaAPagarColetivo.Execute : boolean;
var
  ThisForm: TFIN_BaixaAPagarColetivo ;
begin
  ThisForm := TFIN_BaixaAPagarColetivo.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFIN_BaixaAPagarColetivo.RadioButton1Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAPagar ;
end;

procedure TFIN_BaixaAPagarColetivo.RadioButton2Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttPagos ;
end;

procedure TFIN_BaixaAPagarColetivo.RadioButton3Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAmbos ;
end;

procedure TFIN_BaixaAPagarColetivo.rbBaixarNaDataClick(Sender: TObject);
begin
  Fin_BaixaAPagarColetivoDatamodule.BaixarNoVencimento := rbBaixarNoVencimento.Checked ;
end;

procedure TFIN_BaixaAPagarColetivo.DBGridResultadosCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  inherited;
  Enabled := True ;
end;

function TFIN_BaixaAPagarColetivo.DBGridResultadosCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;

  Result := (Field = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarBAIXAR)
         or (Field = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarPROVISAO) ;
  StringForTrue   := 'T' ;
  StringForFalse  := 'F' ;

end;

procedure TFIN_BaixaAPagarColetivo.DBGridResultadosDblClick(Sender: TObject);
begin

  if ( DBGridResultados.SelectedField = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarJURO_DESCONTO ) then
    begin
      if Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarJURO_DESCONTO.AsFloat <> 0 then
        TfrmFIN_ApagarBaixaApropriacao.Execute( Fin_BaixaAPagarColetivoDatamodule ) ;
    end
  else if ( Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarKCMP_PEDIDO.asString <> '' ) then
    begin
      if Assigned ( SvcEstoqueEntradaDadosCompras ) then
           SvcEstoqueEntradaDadosCompras.Execute ( Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarKCMP_PEDIDO.asString ) ;
    end
  else if Assigned ( SvcFinanceiroEntradaDadosAPagar ) then
         SvcFinanceiroEntradaDadosAPagar.Execute ( Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarKFIN_APAGAR.asString ) ;

end;

procedure TFIN_BaixaAPagarColetivo.DBGridResultadosEditButtonClick(
  Sender: TObject);
var
  T : boolean ;
begin
   with Fin_BaixaAPagarColetivoDatamodule, DBGridResultados do
       if ( SelectedField = cdsBaixaAPagarJURO_DESCONTO ) then
            TfrmFIN_ApagarBaixaApropriacao.Execute( Fin_BaixaAPagarColetivoDatamodule ) ;
end;

procedure TFIN_BaixaAPagarColetivo.DBGridResultadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin

  if Highlight then
    Exit;

  if not Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarPAGTO.isNull then
    AFont.Color := clBlack // clGray
  else if Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarVENCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarVENCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clNavy ;
end;

procedure TFIN_BaixaAPagarColetivo.DBGridResultadosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := (Field = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarBAIXAR)
      or (Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarBAIXAR.asBoolean) ;

  if not AllowEdit then
     exit ;

  if   ( Field = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarVENCTO )
    or ( Field = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarVALOR ) then
    AllowEdit := Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagarPROVISAO.asBoolean ;
end;

procedure TFIN_BaixaAPagarColetivo.rbTodosClick(Sender: TObject);
begin
  inherited;
  if rbTodos.Checked then
    begin
      FKCad_Entidade := EmptyStr;
      edEntidade.Clear;
    end;
end;

procedure TFIN_BaixaAPagarColetivo.SearchFornecedor;
begin
  with TSearchFornecedorAtivo.Create do
    try
      TextToFind := edEntidade.Text ;
      if Execute then
        begin
          FKCad_Entidade  := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
          edEntidade.Text := Result.FieldByName( 'NOME' ).asString ;
        end;
    finally
      free ;
    end ;
end;

procedure TFIN_BaixaAPagarColetivo.TcDateEdit1Change(Sender: TObject);
begin
  rbBaixarNaData.Checked := True ;
end;

procedure TFIN_BaixaAPagarColetivo.TcDateEdit1Exit(Sender: TObject);
begin
  Fin_BaixaAPagarColetivoDatamodule.DataDeBaixa := TcDateEdit1.Date ;
end;

procedure TFIN_BaixaAPagarColetivo._actExecuteExecute(Sender: TObject);
begin
  Fin_BaixaAPagarColetivoDatamodule.ApplyUpdates ;
  Fin_BaixaAPagarColetivoDatamodule.ReOpenTables;
end;

procedure TFIN_BaixaAPagarColetivo._actNextExecute(Sender: TObject);
var
 i : integer ;
begin
  with Fin_BaixaAPagarColetivoDatamodule do
    begin
      SetParam( edDataInicial.Date, edDataFinal.Date, FSelectedTipoTitulo, FKCad_Entidade );

      case FSelectedTipoTitulo of
       ttAPagar   : DBGridResultados.Title := Format( 'Titulos a pagar - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
       ttPagos    : DBGridResultados.Title := Format( 'Titulos a pagos - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
       ttAmbos    : DBGridResultados.Title := Format( 'Titulos a pagar/pagos - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
      end;

      ReOpenTables;
    end;

  inherited;
end;

procedure TFIN_BaixaAPagarColetivo._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFIN_BaixaAPagarColetivo ) ;

end.
