// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Dar baixa em contas a receber
//
// License      : veja readme.txt





unit UFin_BaixaAReceberColetivo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExMask,
  VCL.Mask, Tc.VCL.Controls.GDIButton, Tc.VCL.Edits, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, UFin_BaixaAReceberColetivoDatamodule,
  JvToolEdit, Data.DB, Tc.Data.DB.Helpers, SysFormEditaLista, System.Actions,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TFIN_BaixaAReceberColetivo = class(T_FormWizard)
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
    edRecebido: TTcDBCalcEdit;
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
    Fin_BaixaAReceberColetivoDatamodule : TFin_BaixaAReceberColetivoDatamodule ;
    FDBGridResultados : TJvDBUltimGrid ;
    FKCad_Entidade : string ;
    FSelectedTipoTitulo : TTipoTitulo ;
    procedure SearchCliente;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsFinanceiro, FIN_AReceberTypes,
     SysPrintGridDialog, UfrmFIN_AReceberBaixaApropriacao,
     CLAg5SvcFinanceiroEntradaDadosAReceber, CLAg5SvcEstoqueEntradaDadosVendas ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TFIN_BaixaAReceberColetivo.actBaixarTodosTitulosExecute(
  Sender: TObject);
begin
  Fin_BaixaAReceberColetivoDatamodule.BaixarTodos ;
end;

constructor TFIN_BaixaAReceberColetivo.Create(AOwner: TComponent);
begin
  inherited;
  Fin_BaixaAReceberColetivoDatamodule := TFin_BaixaAReceberColetivoDatamodule.Create( Self );
  TcDateEdit1.Date := Fin_BaixaAReceberColetivoDatamodule.DataDeBaixa ;
  FSelectedTipoTitulo := ttAReceber ;
  Fin_BaixaAReceberColetivoDatamodule.OpenTables;
  edDataInicial.Date  := Date;
  edDataFinal.Date    := Date + 7;
  _btbExecute.Caption := '&Processar' ;
  FDBGridResultados   := DBGridResultados ;
  DBGridResultados.ShowHighlighter := True ;
end;

destructor TFIN_BaixaAReceberColetivo.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFIN_BaixaAReceberColetivo.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  rbEntidade.Checked := True;
  SearchCliente;
end;

procedure TFIN_BaixaAReceberColetivo.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0;
      rbEntidade.Checked := True;
      SearchCliente;
    end;
end;

class function TFIN_BaixaAReceberColetivo.Execute : boolean;
var
  ThisForm: TFIN_BaixaAReceberColetivo ;
begin
  ThisForm := TFIN_BaixaAReceberColetivo.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFIN_BaixaAReceberColetivo.RadioButton1Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAReceber ;
end;

procedure TFIN_BaixaAReceberColetivo.RadioButton2Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttRecebidos ;
end;

procedure TFIN_BaixaAReceberColetivo.RadioButton3Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAmbos ;
end;

procedure TFIN_BaixaAReceberColetivo.rbBaixarNaDataClick(Sender: TObject);
begin
  Fin_BaixaAReceberColetivoDatamodule.BaixarNoVencimento := rbBaixarNoVencimento.Checked ;
end;

procedure TFIN_BaixaAReceberColetivo.DBGridResultadosCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  inherited;
  Enabled := True ;
end;

function TFIN_BaixaAReceberColetivo.DBGridResultadosCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;

  Result := (Field = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberBAIXAR)
         or (Field = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberPROVISAO) ;
  StringForTrue   := 'T' ;
  StringForFalse  := 'F' ;

end;

procedure TFIN_BaixaAReceberColetivo.DBGridResultadosDblClick(Sender: TObject);
begin

  if ( DBGridResultados.SelectedField = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberJURO_DESCONTO ) then
    begin
      if Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberJURO_DESCONTO.AsFloat <> 0 then
        TfrmFIN_AreceberBaixaApropriacao.Execute( Fin_BaixaAReceberColetivoDatamodule ) ;
    end
  else if ( Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberKVND_PEDIDO.asString <> '' ) then
    begin
      if Assigned ( SvcEstoqueEntradaDadosVendas ) then
           SvcEstoqueEntradaDadosVendas.Execute ( Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberKVND_PEDIDO.asString ) ;
    end
  else if Assigned ( SvcFinanceiroEntradaDadosAReceber ) then
         SvcFinanceiroEntradaDadosAReceber.Execute ( Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberKFIN_ARECEBER.asString ) ;

end;

procedure TFIN_BaixaAReceberColetivo.DBGridResultadosEditButtonClick(
  Sender: TObject);
var
  T : boolean ;
begin
   with Fin_BaixaAReceberColetivoDatamodule, DBGridResultados do
       if ( SelectedField = cdsBaixaAReceberJURO_DESCONTO ) then
            TfrmFIN_AreceberBaixaApropriacao.Execute( Fin_BaixaAReceberColetivoDatamodule ) ;
end;

procedure TFIN_BaixaAReceberColetivo.DBGridResultadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin

  if Highlight then
    Exit;

  if not Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberPAGTO.isNull then
    AFont.Color := clBlack // clGray
  else if Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberVENCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberVENCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clNavy ;
end;

procedure TFIN_BaixaAReceberColetivo.DBGridResultadosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := (Field = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberBAIXAR)
      or (Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberBAIXAR.asBoolean) ;

  if not AllowEdit then
     exit ;

  if   ( Field = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberVENCTO )
    or ( Field = Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberVALOR ) then
    AllowEdit := Fin_BaixaAReceberColetivoDatamodule.cdsBaixaAReceberPROVISAO.asBoolean ;
end;

procedure TFIN_BaixaAReceberColetivo.rbTodosClick(Sender: TObject);
begin
  inherited;
  if rbTodos.Checked then
    begin
      FKCad_Entidade := EmptyStr;
      edEntidade.Clear;
    end;
end;

procedure TFIN_BaixaAReceberColetivo.SearchCliente;
begin
  with TSearchClienteAtivo.Create do
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

procedure TFIN_BaixaAReceberColetivo.TcDateEdit1Change(Sender: TObject);
begin
  rbBaixarNaData.Checked := True ;
end;

procedure TFIN_BaixaAReceberColetivo.TcDateEdit1Exit(Sender: TObject);
begin
  Fin_BaixaAReceberColetivoDatamodule.DataDeBaixa := TcDateEdit1.Date ;
end;

procedure TFIN_BaixaAReceberColetivo._actExecuteExecute(Sender: TObject);
begin
  Fin_BaixaAReceberColetivoDatamodule.ApplyUpdates ;
  Fin_BaixaAReceberColetivoDatamodule.ReOpenTables;
end;

procedure TFIN_BaixaAReceberColetivo._actNextExecute(Sender: TObject);
var
 i : integer ;
begin
  with Fin_BaixaAReceberColetivoDatamodule do
    begin
      SetParam( edDataInicial.Date, edDataFinal.Date, FSelectedTipoTitulo, FKCad_Entidade );

      case FSelectedTipoTitulo of
       ttAReceber  : DBGridResultados.Title := Format( 'Titulos a receber - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
       ttRecebidos : DBGridResultados.Title := Format( 'Titulos a recebidos - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
       ttAmbos     : DBGridResultados.Title := Format( 'Titulos a receber/recebidos - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
      end;

      ReOpenTables;
    end;

  inherited;
end;

procedure TFIN_BaixaAReceberColetivo._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFIN_BaixaAReceberColetivo ) ;

end.
