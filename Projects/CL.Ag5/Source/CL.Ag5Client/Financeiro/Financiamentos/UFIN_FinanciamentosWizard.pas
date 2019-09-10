unit UFIN_FinanciamentosWizard;

interface

uses
  SysFormListaFicha,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Tc.Data.DB.Helpers, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  JvDBCheckBox,
  JvBaseEdits, JvDBControls, Tc.VCL.Edits.DBControls,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Extended.Mask, Tc.VCL.Edits,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  JvExMask, JvToolEdit,
  FIN_APagarTypes, ReportTypes,
  Tc.VCL.Application, uImageListProvider, Wrappers  ;


//JvExtComponent, JvPanel, Tc.VCL.Edits,
//  Tc.VCL.Edits.DBControls, Tc.VCL.Dialogs, JvBaseEdits,
//  Tc.VCL.Edits.Numbers, JvDBCheckBox, Tc.VCL.Controls.GDIButton,
//  Wrappers ;

type

  TFIN_FinanciamentosWizard = class(T_FormListaFicha)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    dtsParcelas: TDataSource;
    Button2: TTcGDIButton;
    edEntidade: TJvDBComboEdit;
    Label6: TLabel;
    edConta: TJvDBComboEdit;
    Desdobramento1: TMenuItem;
    actPrintDesdobramento: TAction;
    actPrintVencimento: TAction;
    actPrintDocumento: TAction;
    actPrintPagamento: TAction;
    actPrintLancamento: TAction;
    actPrintEntidade: TAction;
    actPrintDataBase: TAction;
    actPrintCompensacao: TAction;
    actPrintPlanoContas: TAction;
    actIncrementaAno: TAction;
    acDecrementaAno: TAction;
    actIncrementaMes: TAction;
    actDecrementaMes: TAction;
    chkContasPagas: TCheckBox;
    chkContasEmAtraso: TCheckBox;
    N3: TMenuItem;
    actPrintEmAtraso: TAction;
    dbgParcelas: TJvDBUltimGrid;
    DBMemo1: TDBMemo;
    dbDtVencimento: TTcDBDateEdit;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBMemo3: TDBMemo;
    edNaturezaFinanceira: TJvDBComboEdit;
    gbxProgramarParcelas: TGroupBox;
    lblTipoDespesa1: TLabel;
    btbProgramar: TTcGDIButton;
    lblTipoValorDespesa: TLabel;
    Label9: TLabel;
    porFornecedor1: TMenuItem;
    DBText1: TDBText;
    emAtraso1: TMenuItem;
    btnAdicionaParcela: TTcGDIButton;
    btnRemoveParcela: TTcGDIButton;
    dbedValor: TJvDBCalcEdit;
    deDataCompra: TTcDBDateEdit;
    cbProximoMes: TJvDBCheckBox;
    edtMeses: TJvDBCalcEdit;
    edtDia: TJvDBCalcEdit;
    dbValorTotalFinanciado: TJvDBCalcEdit;
    chkDuvidosos: TCheckBox;
    dbcbProvisao: TJvDBCheckBox;
    chkProvisionadas: TCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    deDtInicial: TTcDateEdit;
    deDtFinal: TTcDateEdit;
    btnAnexos: TTcGDIButton;
    ImageList1: TImageList;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    dbcbRecorrencia: TJvDBCheckBox;
    lblTipoDespesa2: TLabel;
    gbxPagamentoAVista: TGroupBox;
    Label5: TLabel;
    DBCheckBox1: TJvDBCheckBox;
    edtCheque: TDBEdit;
    dbcheckComCheque: TJvDBCheckBox;
    Label8: TLabel;
    dbValorParcelas: TJvDBCalcEdit;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbedAmortizacao: TJvDBCalcEdit;
    dbedJuros: TJvDBCalcEdit;
    cbAnual: TJvDBCheckBox;
    procedure edContaButtonClick(Sender: TObject);
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure actPrintDesdobramentoExecute(Sender: TObject);
    procedure actPrintVencimentoExecute(Sender: TObject);
    procedure actPrintDocumentoExecute(Sender: TObject);
    procedure actPrintPagamentoExecute(Sender: TObject);
    procedure actPrintLancamentoExecute(Sender: TObject);
    procedure actPrintEntidadeExecute(Sender: TObject);
    procedure actPrintDataBaseExecute(Sender: TObject);
    procedure actPrintCompensacaoExecute(Sender: TObject);
    procedure actPrintPlanoContasExecute(Sender: TObject);
    procedure actIncrementaAnoExecute(Sender: TObject);
    procedure acDecrementaAnoExecute(Sender: TObject);
    procedure actIncrementaMesExecute(Sender: TObject);
    procedure actDecrementaMesExecute(Sender: TObject);
    procedure btbProgramarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chkContasPagasClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: String): Boolean;
    function dbgParcelasCheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: String): Boolean;
    procedure chkContasEmAtrasoClick(Sender: TObject);
    procedure actPrintEmAtrasoExecute(Sender: TObject);
    procedure _dbgListaGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edNaturezaFinanceiraButtonClick(Sender: TObject);
    procedure dbgParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgParcelasEditButtonClick(Sender: TObject);
    procedure edContaEnter(Sender: TObject);
    procedure dbgParcelasShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actDeleteExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure btnRemoveParcelaClick(Sender: TObject);
    procedure btnAdicionaParcelaClick(Sender: TObject);
    procedure edContaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedValorEnter(Sender: TObject);
    procedure edNaturezaFinanceiraKeyPress(Sender: TObject; var Key: Char);
    procedure edNaturezaFinanceiraEnter(Sender: TObject);
    procedure edEntidadeEnter(Sender: TObject);
    procedure chkDuvidososClick(Sender: TObject);
    procedure chkProvisionadasClick(Sender: TObject);
    procedure deDtInicialChange(Sender: TObject);
    procedure deDtFinalChange(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure _dbgListaDblClick(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure btnAnexosClick(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure edEntidadeChange(Sender: TObject);
    procedure edNaturezaFinanceiraChange(Sender: TObject);
    procedure edContaChange(Sender: TObject);
    procedure DBCheckBox1Change(Sender: TObject);
  private
    { Private declarations }
    IsContaPref : Boolean ;
    procedure SearchFornecedor(TextToSearch : string);
    procedure SearchConta ( TextToSearch : string);
    procedure IncrementaAno ;
    procedure DecrementaAno ;
    procedure IncrementaMes ;
    procedure DecrementaMes ;
    procedure ChangePeriodo ( Sender : TObject ) ;
    procedure HiddingByFilter ( Sender : TObject ) ;
    function CheckDate ( ADate : TDateTime ) : boolean ;
    procedure ChangeFilter;
    procedure ExibeCamposCheque;
    procedure ImageStatus(const AImage: TImage; const AName : string; const AVisible: Boolean ; const ASelecionado: boolean );
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class var KFIN_FINANCIAMENTO_GERAL  : string ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

resourcestring
  SDiaInvalido     = 'Dia inválido' ;
  SPeriodoInvalido = 'Período inválido' ;
  SDataInvalida    = 'A data %s parece ser inválida.'#13#10'Deseja Continuar?' ;
  SHiddingByFilter = 'Nenhuma parcela satisfaz o período selecionado'#13#10 +
                     'Este lançamento não será exibido no período de %s' ;

implementation

uses SearchsFinanceiro, UFIN_FinanciamentosDatamodule, UnitPeriodo,
  UfqrFIN_APagar, UfqrFIN_APagarEntidade, //UfqrFIN_APagarDataBase,
  CL.Ag5.Exceptions, UfqrFIN_APagarCompensacao, //UfqrFIN_APagarPlanoContas,
  UfrmFIN_ApagarBaixaTitulo, UfqrFIN_APagarTitulo,
  UfqrFIN_APagarAtraso, UDBFinanceiro, DateUtils, SysTypes, Math, ThreadSuppl ,
  UFIN_AnexosWizard,
  CLAg5SvcFinanceiroApropriacao, CLAg5SvcFinanceiroEntradaDadosAPagar ;


{$R *.dfm}
{
type
  SvcFinanceiroEntradaDadosAPagarFactory = class( TInterfacedObject, ISvcFinanceiroEntradaDadosAPagar )
    function Execute(AKFIN_APAGAR : string) : string  ;
  end;}


procedure TFIN_FinanciamentosWizard.Pesquisar;
begin
  inherited ;
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ), TSearchFinanciamentoGeral.Create() do
    try
      //SetFiltro( BoolToChar( chkProvisionadas.Checked ), deDtInicial.Date , deDtFinal.Date );

      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
          cdsLstFinanciamento.Locate( 'KFIN_FINANCIAMENTO_GERAL', Result.FieldByName( 'KFIN_FINANCIAMENTO_GERAL' ).Value, [] ) ;
          ActiveFicha ;
        end ;
    finally
      free ;
    end ;
end;

procedure TFIN_FinanciamentosWizard.SearchFornecedor(TextToSearch: string);
begin
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ), TSearchFornecedorAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetEntidade(
            Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
            Result.FieldByName( 'NOME' ).asString
         ) ;

    finally
      ImageStatus(Image1, 'Fornecedor', edEntidade.Text <> '' , cdsFinanciamentoKCAD_ENTIDADE.asString <> '');
      free ;
    end ;
end ;


procedure TFIN_FinanciamentosWizard.SearchConta(TextToSearch: string);
var
  LKConta : string ;
  LConta  : string ;
begin
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ), TSearchContaAtiva.Create do
    try

      TextToFind := TextToSearch ;
      if Execute then
        begin
          LKConta := Result.FieldByName( 'KFIN_CONTA' ).asString ;
          LConta  := Result.FieldByName( 'NOME' ).asString ;

          SetConta( LKConta, LConta, IsContaPref );
        end;
    finally
      free ;
    end ;
end ;

procedure TFIN_FinanciamentosWizard.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  SearchFornecedor( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_FinanciamentosWizard.edEntidadeChange(Sender: TObject);
begin
  if not Assigned ( TFIN_FinanciamentosDatamodule( DataModuleBase ) ) then
     exit ;

  if ( edEntidade.Text <> TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoNOMEENTIDADE.asString )
  and not TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKCAD_ENTIDADE.isNull then
  TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKCAD_ENTIDADE.Clear ;

  ImageStatus(Image1, 'Fornecedor', edEntidade.Text <> '' ,
              TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKCAD_ENTIDADE.AsString <> '');
end;

procedure TFIN_FinanciamentosWizard.edEntidadeEnter(Sender: TObject);
begin
  inherited;
  edEntidade.SelectAll ;
end;

procedure TFIN_FinanciamentosWizard.edEntidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      TJvDBComboEdit( Sender ).DoClick;
    end;
end;

procedure TFIN_FinanciamentosWizard.edNaturezaFinanceiraButtonClick(Sender: TObject);
begin
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ) do
    begin

      SvcFinanceiroApropriacaoEdit.ExecuteTela( 'FIN_FINANCIAMENTOS_GERAL',
                                          cdsFinanciamento,
                                          cdsApropriacaoFinanciamento,
                                          TelaPatrimonio,
                                          [tpAtivo, tpDespesas,
                                           tpPassivo ] );
    end;
end;

procedure TFIN_FinanciamentosWizard.edNaturezaFinanceiraChange(Sender: TObject);
begin
  if not Assigned ( TFIN_FinanciamentosDatamodule( DataModuleBase ) ) then
     exit ;

  if ( edNaturezaFinanceira.Text <> TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoDESCR_PC_NOME.asString )
  and not TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKFIN_PLANOCONTA.isNull then
  TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKFIN_PLANOCONTA.Clear ;
end;

procedure TFIN_FinanciamentosWizard.edNaturezaFinanceiraEnter(Sender: TObject);
begin
  inherited;
  edNaturezaFinanceira.SelectAll ;
end;

procedure TFIN_FinanciamentosWizard.edNaturezaFinanceiraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   begin
    Key := #0 ;
    TJvDBComboEdit( Sender ).DoClick ;
   end;
end;


procedure TFIN_FinanciamentosWizard.ExibeCamposCheque;
begin
  //dbcheckComCheque.Visible := TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsAPagarPAGTO_AVISTA.AsBoolean;
  if ( dbcheckComCheque.Visible ) then
    begin
      edtCheque.Visible := True;
      Label5.Visible := True;
    end
  else
    begin
      dbcheckComCheque.Checked := False;
      edtCheque.Clear;
      edtCheque.Visible := False;
      Label5.Visible := False;
    end;
end;

procedure TFIN_FinanciamentosWizard.edContaButtonClick(Sender: TObject);
begin
  inherited;
  IsContaPref := True ;
  SearchConta( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TFIN_FinanciamentosWizard.edContaChange(Sender: TObject);
begin
  if not Assigned ( TFIN_FinanciamentosDatamodule( DataModuleBase ) ) then
     exit ;

  if ( edConta.Text <> TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoNOMECONTA.asString )
  and not TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKFIN_CONTA_PREF.isNull then
  TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKFIN_CONTA_PREF.Clear ;
end;

procedure TFIN_FinanciamentosWizard.edContaEnter(Sender: TObject);
begin
  inherited;
  edConta.SelectAll;
end;

procedure TFIN_FinanciamentosWizard.edContaKeyPress(Sender: TObject; var Key: Char);
begin
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ) do
    begin
      if Key <> #13  then
        begin
          if not( cdsFinanciamento.State in [dsInsert, dsEdit] ) then
            cdsFinanciamento.Edit;

          cdsFinanciamentoKFIN_CONTA_PREF.Clear;
        end
      else
        begin
          Key := #0 ;
          TJvDBComboEdit( Sender ).DoClick;
        end;
    end;

end;

procedure TFIN_FinanciamentosWizard.actPrintDesdobramentoExecute(Sender: TObject);
begin
  inherited;
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL do
    TfqrFIN_APagarTitulo.Execute2( AsString ) ;
end;

procedure TFIN_FinanciamentosWizard.actPrintVencimentoExecute(Sender: TObject);
begin
  TfqrFIN_APagar.ExecuteDialog  ;
end;

procedure TFIN_FinanciamentosWizard.actPrintDocumentoExecute(Sender: TObject);
begin
  TfqrFIN_APagar.ExecuteDialogPorDocumento;
end;

procedure TFIN_FinanciamentosWizard.actPrintPagamentoExecute(Sender: TObject);
begin
  TfqrFIN_APagar.ExecuteDialogPorPagamento;
end;

procedure TFIN_FinanciamentosWizard.actPrintLancamentoExecute(Sender: TObject);
var
  Parameters : TReportParamsFIN_APagar ;
begin
  inherited;
  Parameters := TReportParamsFIN_APagar.Create ;

  try
//    frmPeriodo := TfrmPeriodo.Create(Self);
//    frmPeriodo.cbxPagos.Checked := True;
//    frmPeriodo.cbxPagos.Visible := False;
//    If frmPeriodo.ShowModal <> mrOk then
//      Exit;

    Parameters.ReportTitle := 'Titulos Lançados';
    Parameters.Ordem := 'P.VENCTO';
    Parameters.Filtro := 'A.DATALANCTO';
    TfqrFIN_APagar.Execute ( Parameters ) ;
  finally
//    frmPeriodo.Free;
  end;

end;

procedure TFIN_FinanciamentosWizard.actPrintEntidadeExecute(Sender: TObject);
begin
  inherited;
  TfqrFIN_APagarEntidade.ExecuteDialog ;
end;

procedure TFIN_FinanciamentosWizard.actPrintDataBaseExecute(Sender: TObject);
begin
  inherited;
{
  try
    frmData := TfrmData.Create(self);
    If frmData.ShowModal <> mrOk then
      Exit;

    try
      fqrFIN_APagarDataBase := TfqrFIN_APagarDataBase.Create(self);
      fqrFIN_APagarDataBase.OpenQuery(frmData.deDate.Date);
      fqrFIN_APagarDataBase.QuickRep.Preview;
    finally
      FreeAndNil(fqrFIN_APagarDataBase);
    end;

  finally
    frmData.Free;
  end;
}
end;

procedure TFIN_FinanciamentosWizard.actPrintCompensacaoExecute(Sender: TObject);
var
   fqrFIN_APagarCompensacao : TfqrFIN_APagarCompensacao ;
begin
  inherited;

  try
    frmPeriodo := TfrmPeriodo.Create(Self);
    frmPeriodo.cbxPagos.Visible := False;
    If frmPeriodo.ShowModal <> mrOk then
      Exit;
    try
      fqrFIN_APagarCompensacao := TfqrFIN_APagarCompensacao.Create(self);
      fqrFIN_APagarCompensacao.OpenQuery(frmPeriodo.deIni.Date,frmPeriodo.deFim.Date);
      fqrFIN_APagarCompensacao.QuickRep.Preview;
    finally
      FreeAndNil(fqrFIN_APagarCompensacao);
    end;
  finally
    frmPeriodo.Free;
  end;

end;

procedure TFIN_FinanciamentosWizard.actPrintPlanoContasExecute(Sender: TObject);
//var
   //fqrFIN_APagarPlanoContas : TfqrFIN_APagarPlanoContas ;
begin
  inherited;
                             (*
  try
    frmPeriodo := TfrmPeriodo.Create(Self);
    frmPeriodo.cbxPagos.Checked := True;
    frmPeriodo.cbxPagos.Visible := False;
    If frmPeriodo.ShowModal <> mrOk then
      Exit;
    try
      fqrFIN_APagarPlanoContas := TfqrFIN_APagarPlanoContas.Create(self);
      fqrFIN_APagarPlanoContas.OpenQuery(frmPeriodo.deIni.Date,frmPeriodo.deFim.Date);
      fqrFIN_APagarPlanoContas.QuickRep.Preview;
    finally
      FreeAndNil(fqrFIN_APagarPlanoContas);
    end;
  finally
    frmPeriodo.Free;
  end;
                           *)
end;

procedure TFIN_FinanciamentosWizard.DecrementaAno;
begin
   TFIN_FinanciamentosDatamodule( DataModuleBase ).DecrementaAno;
end;

procedure TFIN_FinanciamentosWizard.DecrementaMes;
begin
   TFIN_FinanciamentosDatamodule( DataModuleBase ).DecrementaMes;
end;

procedure TFIN_FinanciamentosWizard.deDtFinalChange(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_FinanciamentosWizard.deDtInicialChange(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_FinanciamentosWizard.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin

  if not Assigned ( TFIN_FinanciamentosDatamodule( DataModuleBase ) ) then
     exit ;

 { if not Assigned ( Field )
    or (Field = TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsAPagarRECORRENCIA) then
  begin
    if TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsAPagarRECORRENCIA.asBoolean then
      begin
        lblTipoValorDespesa.Caption := 'Valor da despesa' ;
        lblTipoDespesa1.Caption := 'Recorrente ' ;
        lblTipoDespesa2.Caption := 'vez(es)' ;
      end
    else
      begin
        lblTipoValorDespesa.Caption := 'Total da despesa' ;
        lblTipoDespesa1.Caption := 'Dividido em ' ;
        lblTipoDespesa2.Caption := 'parcela(s)' ;
      end;
  end;}

  if not Assigned ( Field )
    or (Field = TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKCAD_ENTIDADE) then
     begin
       Image1.Picture := nil ;
       //if not TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKCAD_ENTIDADE.isNull then
       if TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKCAD_ENTIDADE.AsString <> '' then
         begin
            edEntidade.Font.Color := clNavy ;
            Image1.Hint := 'Fornecedor associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
         end
       else if ( TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoNOMEENTIDADE.asString <> '' ) then
         begin
            edEntidade.Font.Color := clRed ;
            Image1.Hint := 'Fornecedor não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, Image1.Picture.Bitmap ) ;
         end;
     end;

  if not Assigned ( Field )
    or (Field = TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKFIN_PLANOCONTA) then
     begin
       Image2.Picture := nil ;
       if not TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKFIN_PLANOCONTA.isNull then
         begin
            edNaturezaFinanceira.Font.Color := clNavy ;
            Image2.Hint := 'Apropriação associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, Image2.Picture.Bitmap )
         end
       else
         begin
            edNaturezaFinanceira.Font.Color := clRed ;
            Image2.Hint := 'Apropriação não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, Image2.Picture.Bitmap ) ;
         end;
     end;

       if not Assigned ( Field )
    or (Field = TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKFIN_CONTA_PREF) then
     begin
       Image3.Picture := nil ;
       if not TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsFinanciamentoKFIN_CONTA_PREF.isNull then
         begin
            edConta.Font.Color := clNavy ;
            Image3.Hint := 'Conta associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, Image3.Picture.Bitmap )
         end
       else
         begin
            edConta.Font.Color := clRed ;
            Image3.Hint := 'Conta não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, Image3.Picture.Bitmap ) ;
         end;
     end;

end;

procedure TFIN_FinanciamentosWizard.ImageStatus(const AImage: TImage;
  const AName: string; const AVisible, ASelecionado: boolean);
begin
  AImage.Visible := AVisible;

  if ASelecionado then
    begin
      AImage.Hint := AName + ' selecionado.'  ;
      ImageList1.GetIcon( 0, AImage.Picture.Icon ) ;
    end
  else
    begin
      AImage.Hint := AName + ' não selecionado.' ;
      ImageList1.GetIcon( 2, AImage.Picture.Icon ) ;
    end;
  AImage.Refresh ;
end;

procedure TFIN_FinanciamentosWizard.IncrementaAno;
begin
   TFIN_FinanciamentosDatamodule( DataModuleBase ).IncrementaAno;
end;

procedure TFIN_FinanciamentosWizard.IncrementaMes;
begin
   TFIN_FinanciamentosDatamodule( DataModuleBase ).IncrementaMes;
end;

procedure TFIN_FinanciamentosWizard.actIncrementaAnoExecute(Sender: TObject);
begin
  inherited;
  IncrementaAno;
end;

procedure TFIN_FinanciamentosWizard.acDecrementaAnoExecute(Sender: TObject);
begin
  inherited;
  DecrementaAno ;
end;

procedure TFIN_FinanciamentosWizard.actIncrementaMesExecute(Sender: TObject);
begin
  inherited;
  IncrementaMes
end;

procedure TFIN_FinanciamentosWizard.actDecrementaMesExecute(Sender: TObject);
begin
  inherited;
  DecrementaMes
end;

procedure TFIN_FinanciamentosWizard.ChangeFilter;
begin
  TFIN_FinanciamentosDatamodule( DatamoduleBase ).SetFilter( chkProvisionadas.Checked, deDtInicial.Date, deDtFinal.Date );
end;

procedure TFIN_FinanciamentosWizard.ChangePeriodo(Sender: TObject);
begin
   //Caption := TFIN_OutrasDespesasDatamodule( DataModuleBase ).StringPeriodo ;
end;

procedure TFIN_FinanciamentosWizard.btbProgramarClick(Sender: TObject);
var
  Amortizacao, Juros, ValorParcela, LDiferenca : Double;
  temp : Extended;
  DT_Vcto, Data_final : TDate;
  totalParcelas : Double;
begin
  Amortizacao   := 0 ;
  Juros         := 0 ;
  LDiferenca    := 0 ;
  ValorParcela  := 0 ;
  totalParcelas := 0 ;

  with TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsParcelas do
    begin

      if State in [dsInsert, dsEdit] then
        Cancel;

      if not IsEmpty then
        begin
          First;
          DisableControls;
          try
            while not Eof do
              begin
                if not FieldByName( 'PAGTO' ).IsNull then
                  raise Warning.Create('Exite parcela(s) já baixada(s)');
                Next;
              end;
          finally
            First;
            EnableControls;
          end;
        end;
    end;

  with TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    begin
      if ( cdsFinanciamentoVALOR.IsNull ) or ( cdsFinanciamentoVALOR.AsFloat < 0 ) then
        begin
          dbValorTotalFinanciado.SetFocus;
          raise Warning.Create('Favor digitar o valor total financiado');
        end;

      if ( cdsFinanciamentoVALOR_PARCELAS.IsNull ) or ( cdsFinanciamentoVALOR_PARCELAS.AsFloat < 0 ) then
        begin
          dbValorTotalFinanciado.SetFocus;
          raise Warning.Create('Favor digitar o valor das parcelas');
        end;

      if ( cdsFinanciamentoNUM_PARCELAS.IsNull ) or ( cdsFinanciamentoNUM_PARCELAS.AsFloat < 0 ) then
        begin
          edtMeses.SetFocus;
          raise Warning.Create('Favor digitar o número de parcelas');
        end;

       if ( cdsFinanciamentoNUM_PARCELAS.AsFloat * cdsFinanciamentoVALOR_PARCELAS.AsFloat) <
          ( cdsFinanciamentoVALOR.AsFloat )  then
        begin
          edtMeses.SetFocus;
          raise Warning.Create('O valor da parcela deve ser igual ao valor da amortização + juros');
        end;

      try
        btbProgramar.Enabled := False;
        cdsParcelas.DisableControls;
        cdsParcelas.First;
        while not cdsParcelas.Eof do
          cdsParcelas.Delete;

        if not ( cdsFinanciamento.State in [ dsInsert, dsEdit ] ) then
          cdsFinanciamento.Edit;

        if cdsFinanciamentoDIA_VENCTO.AsInteger > 0 then
          DT_Vcto :=  DateUtils.StartOfTheMonth( cdsFinanciamentoDATALANCTO.AsDateTime ) + cdsFinanciamentoDIA_VENCTO.AsInteger - 1
        else
          DT_Vcto := cdsFinanciamentoDATALANCTO.AsDateTime ;

        if cbProximoMes.Checked then
          DT_Vcto := IncMonth( DT_Vcto, 1 ) ;

//      Data_final := IncMonth( DT_Vcto, StrToInt( edtMeses.Text ) - 1  );

        if cbAnual.Checked then
          Data_final := IncMonth( DT_Vcto, (cdsFinanciamentoNUM_PARCELAS.AsInteger - 1) * 12  )
        else
          Data_final := IncMonth( DT_Vcto, cdsFinanciamentoNUM_PARCELAS.AsInteger - 1  );

     // if dbcbRecorrencia.Checked then
     //   Amortizacao := cdsFinanciamentoVALOR.AsFloat
     // else
//        Parcela := RoundTo( cdsAPagarVALOR.AsFloat / StrToInt( edtMeses.Text ), -2 );
        Amortizacao  := RoundTo( cdsFinanciamentoVALOR.AsFloat / cdsFinanciamentoNUM_PARCELAS.AsInteger, -2 );
        ValorParcela := RoundTo( cdsFinanciamentoVALOR_PARCELAS.AsFloat, -2 );
        Juros        := RoundTo( ValorParcela - Amortizacao, -2 );
        if Juros < 0 then
          Juros := 0;

        if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
          cdsParcelas.Edit;

        while DT_Vcto <= Data_final do
          begin
            cdsParcelas.Append;

            if DT_Vcto > cdsFinanciamentoDATALANCTO.AsDateTime then
              cdsParcelasVENCTO.AsDateTime := DT_Vcto
            else
              cdsParcelasVENCTO.AsDateTime := cdsFinanciamentoDATALANCTO.AsDateTime ;

            cdsParcelasDOCUMENTO.AsString  := cdsFinanciamentoDOCUMENTO.AsString;
            cdsParcelasAMORTIZACAO.AsFLoat := Amortizacao;
            cdsParcelasVALOR.AsFloat       := ValorParcela;
            cdsParcelasJUROS.AsFloat       := Juros;

            if ( not ( cdsFinanciamentoKFIN_CONTA_PREF.IsNull ) or not ( cdsFinanciamentoKFIN_CONTA_PREF.AsString = '' ) ) then
              begin
                cdsParcelasKFIN_CONTA.AsString := cdsFinanciamentoKFIN_CONTA_PREF.AsString ;
                cdsParcelasNOMECONTA.AsString  := cdsFinanciamentoNOMECONTA.AsString ;
              end;

            if cbAnual.Checked then
              DT_Vcto := IncMonth( DT_Vcto, 12 )
            else
              DT_Vcto := IncMonth( DT_Vcto, 1 ) ;
          end;

        totalParcelas := totalParcelas + cdsParcelasVALOR.AsFloat;
        cdsParcelas.Post;

        if RoundTo(  cdsParcelasTOTAL_AMORTIZACAO.Value, -2 ) <> RoundTo(  cdsFinanciamentoVALOR.Value, -2 ) then
         begin
           cdsParcelas.First;
           cdsParcelas.Edit;
           LDiferenca := (cdsParcelasTOTAL_AMORTIZACAO.Value - cdsFinanciamentoVALOR.Value);
           cdsParcelasAMORTIZACAO.AsFloat := cdsParcelasAMORTIZACAO.AsFloat - LDiferenca;
           cdsParcelasJUROS.AsFloat := cdsParcelasJUROS.AsFloat + LDiferenca;
           cdsParcelas.Post;
         end;

        cdsFinanciamento.Post;


      finally
        cdsParcelas.First;
        cdsParcelas.EnableControls;
        btbProgramar.Enabled := True;
      end;

    end;
end;

procedure TFIN_FinanciamentosWizard.btnAdicionaParcelaClick(Sender: TObject);
begin
  with TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    begin
      if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      cdsParcelas.Append;
      dbgParcelas.SetFocus;
      dbgParcelas.SelectedIndex := 0 ;
    end;
end;

procedure TFIN_FinanciamentosWizard.btnAnexosClick(Sender: TObject);
begin
  with TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    TFIN_AnexosWizard.ExecuteWizard( 'FIN_FINANCIAMENTOS_GERAL', cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.AsString );
end;

procedure TFIN_FinanciamentosWizard.btnRemoveParcelaClick(Sender: TObject);
begin
  inherited;
  if TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsParcelas.Eof then
    Exit;

  if not ( TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsParcelasPAGTO.IsNull )  then
    raise Warning.Create('Parcela não pode ser excluída')
  else
    TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsParcelas.Delete;
end;

procedure TFIN_FinanciamentosWizard.chkProvisionadasClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

function TFIN_FinanciamentosWizard.CheckDate(ADate: TDateTime) : boolean ;
begin
    Result := ( ADate >= Date - 30 ) or
              (MessageDlg ( SDataInvalida, [formatDateTime ( 'dd/mm/yyyy', ADate ) ],
                            mtWarning, [mbYes, mbNo] ) = mrYes)  ;
end;

procedure TFIN_FinanciamentosWizard.HiddingByFilter(Sender: TObject);
begin
//    MessageDlg ( SHiddingByFilter, [ TFIN_OutrasDespesasDatamodule( DataModuleBase ).StringPeriodo ] ) ;
end;

procedure TFIN_FinanciamentosWizard.Button2Click(Sender: TObject);
var
  BaixaTitulo : TBaixaTitulo ;
begin
  inherited;
//  if not ( TFIN_OutrasDespesasDatamodule( DataModuleBase ).cdsAPagar.State in [dsInsert, dsEdit] ) then
//    TFIN_OutrasDespesasDatamodule( DataModuleBase ).cdsAPagar.Edit;
//
//  BaixaTitulo.KParcela := TFIN_OutrasDespesasDatamodule( DataModuleBase ).cdsLstApagarKFIN_APAGAR_PARCELA.asString ;
//  if TfrmFIN_ApagarBaixaTitulo.Execute(  BaixaTitulo ) then
//     TFIN_OutrasDespesasDatamodule( DataModuleBase ).RefreshBaixa ( BaixaTitulo ) ;
end;

procedure TFIN_FinanciamentosWizard.chkContasPagasClick(Sender: TObject);
begin
  inherited;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).ShowPago := chkContasPagas.Checked
end;

procedure TFIN_FinanciamentosWizard.chkDuvidososClick(Sender: TObject);
begin
  inherited;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).ShowDuvidoso := chkDuvidosos.Checked
end;

constructor TFIN_FinanciamentosWizard.Create(AOwner: TComponent);
begin
  inherited;

  deDtInicial.OnChange := nil ;
  deDtFinal.OnChange   := nil ;

  deDtInicial.Date := StartOfTheMonth( Date ) ;
  deDtFinal.Date   := EndOfTheMonth( Date ) ;

  deDtInicial.OnChange := deDtInicialChange ;
  deDtFinal.OnChange   := deDtFinalChange ;

  TFIN_FinanciamentosDatamodule.Create( Self );

  TFIN_FinanciamentosDatamodule( DatamoduleBase ).KFIN_FINANCIAMENTO_GERAL := TFIN_FinanciamentosWizard.KFIN_FINANCIAMENTO_GERAL ;

  dtsLista.DataSet         := TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsLstFinanciamento ;
  dtsFicha.DataSet         := TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsFinanciamento;
  dtsParcelas.DataSet      := TFIN_FinanciamentosDatamodule( DatamoduleBase ).cdsParcelas ;

  if KFIN_FINANCIAMENTO_GERAL <> '' then
    _pageControl.ActivePage := _tbsFicha ;

  KFIN_FINANCIAMENTO_GERAL := '' ;

  DatamoduleBase.OpenTables ;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).OnChangePeriodo   := ChangePeriodo ;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).OnCheckDate       := CheckDate ;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).OnHiddingByFilter := HiddingByFilter ;
  ChangeFilter;
  IsContaPref  := False;
  ExibeCamposCheque;
end;

procedure TFIN_FinanciamentosWizard.DBCheckBox1Change(Sender: TObject);
begin
  inherited;
  ExibeCamposCheque;
end;

procedure TFIN_FinanciamentosWizard.dbedValorEnter(Sender: TObject);
begin
  inherited;
  dbedValor.SelectAll;
end;

procedure TFIN_FinanciamentosWizard._actDeleteExecute(Sender: TObject);
begin
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ) do
    begin
      cdsParcelas.First;
      cdsParcelas.DisableControls;
      try
        while not cdsParcelas.Eof do
          begin
            if not cdsParcelasPAGTO.IsNull then
              raise Warning.Create('Conta não pode ser excluída por ter parcela já baixada.');

            cdsParcelas.Next;
          end;
      finally
        cdsParcelas.First;
        cdsParcelas.EnableControls;
      end;
    end;

  inherited;
end;

procedure TFIN_FinanciamentosWizard._actEditExecute(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  ExibeCamposCheque;
end;

procedure TFIN_FinanciamentosWizard._actNewExecute(Sender: TObject);
begin

  inherited;

  btnAnexos.Enabled := False ;
  ExibeCamposCheque;


end;

procedure TFIN_FinanciamentosWizard._actSaveExecute(Sender: TObject);
var
  FKConta : string ;
begin
  with TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    begin
      TCdsSuppl.PostIfNeed( cdsParcelas );

      if cdsParcelas.IsEmpty then
        raise Warning.Create('A despesa deve ter ao menos uma parcela.');

      cdsParcelas.DisableControls;
      cdsParcelas.First;
      try
        while not cdsParcelas.Eof do
          begin
            if ( cdsParcelasKFIN_CONTA.IsNull ) or ( cdsParcelasKFIN_CONTA.AsString = EmptyStr ) then
              begin
                if cdsFinanciamentoKFIN_CONTA_PREF.asString <> '' then
                 begin
                  cdsParcelas.Edit;
                  cdsParcelasKFIN_CONTA.asString := cdsFinanciamentoKFIN_CONTA_PREF.asString ;
                  cdsParcelasNOMECONTA.asString  := cdsFinanciamentoNOMECONTA.asString ;
                  cdsParcelas.Post;
                 end
                else
                 raise Warning.Create('Existe(m) parcela(s) sem conta definida');
              end;

            cdsParcelas.Next;
          end;
      finally
        cdsParcelas.First;
        cdsParcelas.EnableControls;
      end;

      FKConta := cdsFinanciamentoKFIN_FINANCIAMENTO_GERAL.AsString ;

      inherited;

      cdsLstFinanciamento.Locate('KFIN_FINANCIAMENTO_GERAL', FKConta, [] );
    end;
    btnAnexos.Enabled := True ;

end;

function TFIN_FinanciamentosWizard._dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
  var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TFIN_FinanciamentosDatamodule( DatamoduleBase ) do
    Result := Assigned( Field ) and ( ( Field = cdsLstFinanciamentoATIVO ) {or (Field = cdsLstFinanciamentoPROVISAO )} ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TFIN_FinanciamentosWizard._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
end;

function TFIN_FinanciamentosWizard.dbgParcelasCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: String): Boolean;
begin
  inherited;
  with TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    Result := Assigned( Field ) and (( Field = cdsParcelasDUVIDOSO ) or ( Field = cdsParcelasPREVISAO ) ) ;

  StringForTrue  := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TFIN_FinanciamentosWizard.dbgParcelasEditButtonClick(Sender: TObject);
begin
  inherited;
  with dbgParcelas, TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    if ( SelectedField = cdsParcelasNOMECONTA ) then
      begin
        if not ( cdsParcelas.State in [dsInsert, dsEdit] ) then
          cdsParcelas.Edit;

        IsContaPref := False;
        SearchConta( InplaceEditor.Text );
      end;
end;

procedure TFIN_FinanciamentosWizard.dbgParcelasKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
  with dbgParcelas, TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    begin
      if not( cdsParcelas.State in [dsInsert, dsEdit ] ) then
        cdsParcelas.Edit ;

      if ( SelectedField = cdsParcelasNOMECONTA ) then
        begin
          if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
            begin
              IsContaPref := False ;
              SearchConta( InplaceEditor.Text );
            end;
        end;
    end;
end;

procedure TFIN_FinanciamentosWizard.dbgParcelasShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
//  inherited;
  with TJvDBUltimGrid( Sender ), TFIN_FinanciamentosDatamodule( DataModuleBase ) do
    AllowEdit := cdsParcelasPAGTO.IsNull ;
end;

procedure TFIN_FinanciamentosWizard.chkContasEmAtrasoClick(Sender: TObject);
begin
  inherited;
  TFIN_FinanciamentosDatamodule( DataModuleBase ).ShowEmAtraso := chkContasEmAtraso.Checked
end;

procedure TFIN_FinanciamentosWizard._dbgListaGetCellParams( Sender: TObject; Field: TField; AFont: TFont;
  var Background: TColor; Highlight: Boolean);
begin
//  inherited;
  if Highlight then
    Exit ;

//  if not TFIN_OutrasDespesasDatamodule( DataModuleBase ).cdsLstApagarPAGTO.isNull then
//     AFont.Color  := clGray
  if TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsLstFinanciamentoDATALANCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if TFIN_FinanciamentosDatamodule( DataModuleBase ).cdsLstFinanciamentoDATALANCTO.asDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clBlack ;
end;

procedure TFIN_FinanciamentosWizard.actPrintEmAtrasoExecute(Sender: TObject);
var
  Parameters : TReportParamsFIN_AReceber ;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create ;
  Parameters.ExibirQuitados := False ;
  TfqrFIN_APagarAtraso.Execute( Parameters );
  Parameters.Free ;
end;


{ SvcFinanceiroEntradaDadosAPagarFactory }
{function SvcFinanceiroEntradaDadosAPagarFactory.Execute(AKFIN_APAGAR : string) : string  ;
begin
   TFIN_FinanciamentosWizard.KFIN_APAGAR := AKFIN_APAGAR ;
   with TFIN_FinanciamentosWizard.Create ( nil ) do
     try
       ShowModal ;
     finally
       Free ;
     end;
end;}

initialization
  RegisterClass ( TFIN_FinanciamentosWizard ) ;
 // SvcFinanceiroEntradaDadosAPagar := SvcFinanceiroEntradaDadosAPagarFactory.Create ;

finalization
 // SvcFinanceiroEntradaDadosAPagar := nil ;

end.

