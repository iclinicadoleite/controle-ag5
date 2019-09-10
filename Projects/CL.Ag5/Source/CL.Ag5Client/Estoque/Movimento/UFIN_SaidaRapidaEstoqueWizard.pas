unit UFIN_SaidaRapidaEstoqueWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, System.Actions, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.Mask,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits,
  Tc.VCL.Edits.Numbers,
  UFIN_SaidaRapidaEstoqueDatamodule,
  JvExMask, JvToolEdit, JvBaseEdits, JvDBControls, Vcl.DBCtrls,
  Tc.VCL.Form,
  Tc.VCL.Application, Wrappers ;

type
  TFIN_SaidaRapidaEstoqueWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    dbgSaidas: TJvDBUltimGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DataSource1: TDataSource;
    dbItensQtde: TJvDBCalcEdit;
    DBMemo1: TDBMemo;
    Button1: TButton;
    deDataMovto: TTcDateEdit;
    actSelecionarItens: TAction;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgSaidasEditButtonClick(Sender: TObject);
    procedure dbgSaidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgSaidasKeyPress(Sender: TObject; var Key: Char);
    procedure actSelecionarItensExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
    FFIN_SaidaRapidaEstoqueDatamodule : TFIN_SaidaRapidaEstoqueDatamodule ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses CLAg5SvcFinanceiroApropriacao,
     CLAg5SvcEstoqueProdutosEstoqueMinimo ;


{ TfrmCustomWizard }


procedure TFIN_SaidaRapidaEstoqueWizard.actSelecionarItensExecute(
  Sender: TObject);
begin
  if  FFIN_SaidaRapidaEstoqueDatamodule.cdsEstoque.Active
  and not FFIN_SaidaRapidaEstoqueDatamodule.cdsEstoque.IsEmpty
  and (MessageDlg ( 'Os itens não serão processados. Deseja continuar', mtWarning, [mbYes,mbNo] ) <> mrYes)  then
    exit ;

  FFIN_SaidaRapidaEstoqueDatamodule.OpenTables ;
end;

constructor TFIN_SaidaRapidaEstoqueWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  FFIN_SaidaRapidaEstoqueDatamodule := TFIN_SaidaRapidaEstoqueDatamodule.Create( self );
  DataSource1.DataSet := FFIN_SaidaRapidaEstoqueDatamodule.cdsEstoque ;
end;

destructor TFIN_SaidaRapidaEstoqueWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TFIN_SaidaRapidaEstoqueWizard.Execute : boolean;
var
  ThisForm: TFIN_SaidaRapidaEstoqueWizard ;
begin
  ThisForm := Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFIN_SaidaRapidaEstoqueWizard.dbgSaidasEditButtonClick(
  Sender: TObject);
begin
  with dbgSaidas, FFIN_SaidaRapidaEstoqueDatamodule do
    begin

      if ( SelectedField = cdsEstoqueDESCR_PC_NOME ) or
         ( SelectedField = cdsEstoqueLISTA_CC ) then
        begin
          SvcFinanceiroApropriacaoEdit.ExecuteTela( 'EST_OUTRAS_ENTRADAS_SAIDAS',
                                              cdsEstoque,
                                              cdsApropriacao,
                                              TelaProduto,
                                              [ tpDespesas ] ) ;
                                              //[tpAtivo, tpPassivo, tpReceitas, tpDespesas ] );

          FFIN_SaidaRapidaEstoqueDatamodule.SetListaCentroCusto ;
        end;
    end;
end;

procedure TFIN_SaidaRapidaEstoqueWizard.dbgSaidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (  Key = VK_INSERT ) and not dbgSaidas.EditorMode then
    Key := 0 ;
end;

procedure TFIN_SaidaRapidaEstoqueWizard.dbgSaidasKeyPress(Sender: TObject;
  var Key: Char);
begin
  with dbgSaidas, FFIN_SaidaRapidaEstoqueDatamodule do
    begin
      if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
        begin
          if ( SelectedField = cdsEstoqueDESCR_PC_NOME ) or
             ( SelectedField = cdsEstoqueLISTA_CC )  then
            begin

              SvcFinanceiroApropriacaoEdit.ExecuteTela( 'EST_OUTRAS_ENTRADAS_SAIDAS',
                                                  cdsEstoque,
                                                  cdsApropriacao,
                                                  TelaProduto,
                                                  [ tpDespesas ] ) ;
                                                  //[tpAtivo, tpPassivo, tpReceitas, tpDespesas ] );
              FFIN_SaidaRapidaEstoqueDatamodule.SetListaCentroCusto ;
            end;
        end;
    end;
end;

procedure TFIN_SaidaRapidaEstoqueWizard._actExecuteExecute(Sender: TObject);
var
  LRecords : integer ;
begin
  LRecords := FFIN_SaidaRapidaEstoqueDatamodule.Process ( deDataMovto.Date );

  if Assigned( SvcEstoqueProdutosEstoqueMinimo ) then
   begin
      if MessageDlg (
                    'Processado com sucesso'
            +#13#10'%d registro(s) de saída de estoque'
            +#13#10''
            +#13#10'Deseja emitir solicitação de compras ?',
            [ LRecords ], mtConfirmation ) = mrYes then
               SvcEstoqueProdutosEstoqueMinimo.ShowEstoqueMinimo ;
   end
  else

  ShowMessageFmt ( 'Processado com sucesso'
            +#13#10'%d registro(s) de saída de estoque', [ LRecords ] )
end;

procedure TFIN_SaidaRapidaEstoqueWizard._actExecuteUpdate(Sender: TObject);
begin
  _actExecute.Enabled := ( deDataMovto.Date > 0 )
                  and FFIN_SaidaRapidaEstoqueDatamodule.cdsEstoque.Active
end;

procedure TFIN_SaidaRapidaEstoqueWizard._actNextExecute(Sender: TObject);
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

procedure TFIN_SaidaRapidaEstoqueWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFIN_SaidaRapidaEstoqueWizard ) ;

end.
