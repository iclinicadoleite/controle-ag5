unit UFIN_CadastroTarifaBancariaWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.DBCtrls,
  Tc.VCL.Controls.GDIButton, JvToolEdit, JvDBControls, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvBaseEdits, VCL.Mask, JvExMask, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, SearchsFinanceiro, SysFormDialog,
  UFIN_OutrasDespesasDatamodule,
  UFIN_OutrasReceitasDataModule,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TFIN_CadastroTarifaBancariaWizard = class(T_FormDialog)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    dbDt_Emissao: TTcDBDateEdit;
    DBEdit1: TDBEdit;
    dbDt_Compensacao: TJvDBDateEdit;
    DBMemo1: TDBMemo;
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    dbcbCheque: TDBCheckBox;
    dtsConta: TDataSource;
    dtsParcela: TDataSource;
    dbcbNomeConta: TJvDBComboEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbcbNomeContaKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbNomeContaButtonClick(Sender: TObject);
    procedure _btbSaveClick(Sender: TObject);
    procedure dbDt_EmissaoExit(Sender: TObject);
  private
    { Private declarations }
    FDataModuleAPagar   : TFIN_OutrasDespesasDatamodule;
    FDataModuleAReceber : TFIN_OutrasReceitasDataModule;
//    FKFIN_CONTA : string;
    FTipoReceitaDespesa : TTipoReceitaDespesa;
    procedure SearchConta( TextToSearch : string );
    procedure OpenTables ;
  public
    { Public declarations }
    class function Execute( ATipoReceitaDespesa : TTipoReceitaDespesa ) : Boolean ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses Exceptions,
     CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TFIN_CadastroTarifaBancariaWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TFIN_CadastroTarifaBancariaWizard.Destroy;
begin
  FDataModuleAPagar.Free;
  FDataModuleAReceber.Free;
  inherited;
end;

class function TFIN_CadastroTarifaBancariaWizard.Execute( ATipoReceitaDespesa : TTipoReceitaDespesa ) : Boolean ;
var
  ThisForm: TFIN_CadastroTarifaBancariaWizard;
  ModalResult : integer ;
begin
  ThisForm := TFIN_CadastroTarifaBancariaWizard.Create ( nil ) ;
  try
      ThisForm.FTipoReceitaDespesa := ATipoReceitaDespesa ;
      ThisForm.OpenTables ;
      ModalResult := ThisForm.ShowModal ;
      Result  := ( ModalResult = mrOK ) ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

procedure TFIN_CadastroTarifaBancariaWizard.OpenTables;
begin
  case FTipoReceitaDespesa of
    toaReceita : //Credito
      begin
        Caption := 'Cadastro de novas receitas';

        FDataModuleAReceber := TFIN_OutrasReceitasDataModule.Create( Self );

        with FDataModuleAReceber do
          begin
            dtsConta.DataSet    := cdsAReceber;
            dtsParcela.DataSet  := cdsParcelas;

            cdsParcelasKFIN_CONTA.Required     := True;
            cdsParcelasPAGTO.Required          := True;
            cdsParcelasVALOR.Required          := True;
            cdsParcelasDT_COMPENSACAO.Required := True;

            OpenTables;
            NewRecord;
            cdsAReceberHISTORICO.AsString      := ' ' ;
            cdsParcelas.Edit;
          end;
      end;
    toaDespesa : //Debito
      begin
        Caption := 'Cadastro de novas despesas';

        FDataModuleAPagar  := TFIN_OutrasDespesasDatamodule.Create( Self );

        with FDataModuleAPagar do
          begin
            dtsConta.DataSet   := cdsAPagar;
            dtsParcela.DataSet := cdsParcelas;

            cdsParcelasKFIN_CONTA.Required     := True;
            cdsParcelasPAGTO.Required          := True;
            cdsParcelasVALOR.Required          := True;
            cdsParcelasDT_COMPENSACAO.Required := True;

            OpenTables;
            NewRecord;
            cdsAPagarHISTORICO.AsString      := ' ' ;
            cdsParcelas.Edit;
          end;
      end;
  end;
end;

procedure TFIN_CadastroTarifaBancariaWizard.dbcbNomeContaButtonClick(Sender: TObject);
begin
  inherited;
  SearchConta( TJvDBComboEdit( Sender ).Text ) ;
end;

procedure TFIN_CadastroTarifaBancariaWizard.dbcbNomeContaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     TJvComboEdit( Sender ).DoClick ;
end;

procedure TFIN_CadastroTarifaBancariaWizard.dbDt_EmissaoExit(Sender: TObject);
begin
  inherited;
  dbDt_Compensacao.Date := dbDt_Emissao.Date ;
end;

procedure TFIN_CadastroTarifaBancariaWizard.SearchConta(TextToSearch: string);
begin
  with TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        begin
          dtsConta.DataSet.FieldByName( 'HISTORICO' ).AsString := ' ';

          if not ( dtsParcela.DataSet.State in [ dsInsert, dsEdit ] ) then
            dtsParcela.DataSet.Edit;

          with dtsParcela.DataSet do
            begin
              FieldByName( 'KFIN_CONTA' ).AsString := Result.FieldByName( 'KFIN_CONTA' ).asString;
              FieldByName( 'NOMECONTA' ).AsString := Result.FieldByName( 'NOME' ).asString;
            end;
        end;
    finally
      free ;
    end ;
end;

procedure TFIN_CadastroTarifaBancariaWizard._actNextExecute(Sender: TObject);
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

procedure TFIN_CadastroTarifaBancariaWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //
  inherited;
end;

procedure TFIN_CadastroTarifaBancariaWizard._btbSaveClick(Sender: TObject);
begin
  if dbDt_Emissao.Date > Date then
    raise Warning.Create('Data de emissão não pode ser superior a data atual.');

  if dbDt_Compensacao.Date < dbDt_Emissao.Date then
    raise Warning.Create('Data de compensação não pode ser inferior a data de emissão.');

  if dbDt_Compensacao.Date > Date then
    raise Warning.Create('Data de compensação não pode ser superior a data atual.');

  case FTipoReceitaDespesa of
    toaCancel:
      begin
        Exit;
      end;
    toaReceita:
      begin
        with FDataModuleAReceber do
          begin
            cdsParcelasVENCTO.AsDateTime := cdsParcelasPAGTO.AsDateTime ;
            cdsParcelasPAGO.AsFloat      := cdsParcelasVALOR.AsFloat ;
            ApplyUpdates ;
            NewRecord;
          end;
      end;
    toaDespesa:
      begin
        with FDataModuleAPagar do
          begin
            cdsParcelasVENCTO.AsDateTime := cdsParcelasPAGTO.AsDateTime;
            cdsParcelasPAGO.AsFloat      := cdsParcelasVALOR.AsFloat ;
            ApplyUpdates ;
            NewRecord;
          end;
      end;
  end;
end;

initialization
   RegisterClass ( TFIN_CadastroTarifaBancariaWizard ) ;

end.
