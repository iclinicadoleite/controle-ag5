// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Dar baixa em contas a pagar
//
// License      : veja readme.txt





unit UFin_BaixaAPagarWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExMask,
  VCL.Mask, Tc.VCL.Controls.GDIButton, Tc.VCL.Edits, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, UFin_BaixaAPagarDatamodule,
  JvToolEdit, Data.DB, Tc.Data.DB.Helpers, SysFormEditaLista, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TFIN_BaixaAPagarWizard = class(T_FormWizard)
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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridResultadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridResultadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
    Fin_BaixaAPagarDatamodule : TFin_BaixaAPagarDatamodule ;
    FDBGridResultados : TJvDBUltimGrid ;
    FKCad_Entidade : string ;
    FSelectedTipoTitulo : TTipoTitulo ;
    procedure BaixarTitulo ;
    procedure SearchFornecedor;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsFinanceiro, FIN_APagarTypes, SysPrintGridDialog, UfrmFIN_ApagarBaixaTitulo;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TFIN_BaixaAPagarWizard.BaixarTitulo;
var
  BaixaTitulo : TBaixaTitulo ;
begin
//  inherited;
  if Fin_BaixaAPagarDatamodule.cdsBaixaAPagar.IsEmpty then
    Exit;

//  if not ( Fin_BaixaAPagarDatamodule.cdsBaixaAPagar.State in [dsInsert, dsEdit] ) then
//    Fin_BaixaAPagarDatamodule.cdsBaixaAPagar.Edit;

  BaixaTitulo.KParcela := Fin_BaixaAPagarDatamodule.cdsBaixaAPagarKFIN_APAGAR_PARCELA.asString ;
  { if } TfrmFIN_ApagarBaixaTitulo.Execute(  BaixaTitulo ) ; //then
     Fin_BaixaAPagarDatamodule.ReOpenTables ;
end;



constructor TFIN_BaixaAPagarWizard.Create(AOwner: TComponent);
begin
  inherited;
  Fin_BaixaAPagarDatamodule := TFin_BaixaAPagarDatamodule.Create( Self );
  FSelectedTipoTitulo := ttAPagar ;
  Fin_BaixaAPagarDatamodule.OpenTables;
  edDataInicial.Date  := Date;
  edDataFinal.Date    := Date + 7;
//  _actExecute.Caption := 'V&isualizar' ;
  _btbExecute.Caption := 'V&isualizar' ;
  FDBGridResultados   := DBGridResultados ;
  DBGridResultados.ShowHighlighter := True ;
end;

destructor TFIN_BaixaAPagarWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFIN_BaixaAPagarWizard.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  rbEntidade.Checked := True;
  SearchFornecedor;
end;

procedure TFIN_BaixaAPagarWizard.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0;
      rbEntidade.Checked := True;
      SearchFornecedor;
    end;
end;

class function TFIN_BaixaAPagarWizard.Execute : boolean;
var
  ThisForm: TFIN_BaixaAPagarWizard;
begin
  ThisForm := TFIN_BaixaAPagarWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFIN_BaixaAPagarWizard.RadioButton1Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAPagar ;
end;

procedure TFIN_BaixaAPagarWizard.RadioButton2Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttPagos ;
end;

procedure TFIN_BaixaAPagarWizard.RadioButton3Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAmbos ;
end;

procedure TFIN_BaixaAPagarWizard.DBGridResultadosDblClick(Sender: TObject);
begin
  BaixarTitulo
end;

procedure TFIN_BaixaAPagarWizard.DBGridResultadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Highlight then
    Exit;

  if not Fin_BaixaAPagarDatamodule.cdsBaixaAPagarPAGTO.isNull then
    AFont.Color := clBlack // clGray
  else if Fin_BaixaAPagarDatamodule.cdsBaixaAPagarVENCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if Fin_BaixaAPagarDatamodule.cdsBaixaAPagarVENCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clNavy ;
end;

procedure TFIN_BaixaAPagarWizard.DBGridResultadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
   begin
    Key := 0;
    BaixarTitulo
   end;
end;

procedure TFIN_BaixaAPagarWizard.rbTodosClick(Sender: TObject);
begin
  inherited;
  if rbTodos.Checked then
    begin
      FKCad_Entidade := EmptyStr;
      edEntidade.Clear;
    end;
end;

procedure TFIN_BaixaAPagarWizard.SearchFornecedor;
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

procedure TFIN_BaixaAPagarWizard._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( FDBGridResultados, DBGridResultados.Title );
  inherited;
end;

procedure TFIN_BaixaAPagarWizard._actNextExecute(Sender: TObject);
var
 i : integer ;
begin
  with Fin_BaixaAPagarDatamodule do
    begin
      SetParam( edDataInicial.Date, edDataFinal.Date, FSelectedTipoTitulo, FKCad_Entidade );

  case FSelectedTipoTitulo of
   ttAPagar   : DBGridResultados.Title := Format( 'Titulos a pagar - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
   ttPagos    : DBGridResultados.Title := Format( 'Titulos a pagos - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
   ttAmbos    : DBGridResultados.Title := Format( 'Titulos a pagar/pagos - %s a %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
  end;

//grid
  with Fin_BaixaAPagarDatamodule do
    begin              // Volts eh foda manooo... :D
      for i := 0 to DBGridResultados.Columns.Count - 1 do
        begin
          if DBGridResultados.Columns[i].FieldName = cdsBaixaAPagarPAGO.FieldName then
            DBGridResultados.Columns[i].Visible := FSelectedTipoTitulo >= ttPagos ;

          if DBGridResultados.Columns[i].FieldName = cdsBaixaAPagarPAGTO.FieldName then
            DBGridResultados.Columns[i].Visible := FSelectedTipoTitulo >= ttPagos ;
        end;
    end;

      ReOpenTables;
    end;

  inherited;
end;

procedure TFIN_BaixaAPagarWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFIN_BaixaAPagarWizard ) ;

end.
