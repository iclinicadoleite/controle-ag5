// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Outras Receitas
//
// License      : veja readme.txt




// Obs          :

{
  02/02/13 - Em reunião com Angelica, Vitor e Caique Rodrigues
             ficou decidido retirar os filtros da tela "LISTA", e retirar "provisão" e "DUVIDOSO" das parcelas.
             Acrescentar o campo "PROVISÃO" na conta e o filtro na tela "LISTA".
}

unit UFIN_OutrasReceitasWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin,
  Data.DB, Tc.Data.DB.Helpers, VCL.Menus, VCL.Mask, VCL.DBCtrls, JvExExtCtrls, JvDBDotNetControls, JvExMask,
  JvToolEdit, JvExControls, JvXPCore, JvXPContainer, JvXPBar, JvExStdCtrls,
  JvDBCombobox, JvDBControls, JvDBCheckBox, JvExComCtrls, JvDateTimePicker,
  JvDBDateTimePicker, SysFormListaFicha, JvErrorIndicator, JvComponentBase,
  JvValidators, FIN_AReceberTypes, ReportTypes, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvImage, JvExtComponent, JvPanel, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Tc.VCL.Dialogs, VCL.ImgList, JvBaseEdits,
  Tc.VCL.Edits.Numbers, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  uImageListProvider, Wrappers ;

type
  TFIN_OutrasReceitasWizard = class( T_FormListaFicha )
    dbgParcelas :TJvDBUltimGrid;
    DBMemo1 :TDBMemo;
    Button2: TTcGDIButton;
    dtsParcelas: TDataSource;
    Label1 :TLabel;
    Label2 :TLabel;
    Label3 :TLabel;
    Label4 :TLabel;
    Label6 :TLabel;
    Label7 :TLabel;
    Label8 :TLabel;
    DBEdit2 :TDBEdit;
    DBEdit3 :TDBEdit;
    edEntidade :TJvDBComboEdit;
    DBMemo3 :TDBMemo;
    edNaturezaFinanceira :TJvDBComboEdit;
    actPrintPlanoContas :TAction;
    actDecrementaAno :TAction;
    chkContasRecebidas :TCheckBox;
    chkContasEmAtraso :TCheckBox;
    N3 :TMenuItem;
    actPrintEmAtraso :TAction;
    JvDBDateEdit1 :TTcDBDateEdit;
    edConta :TJvDBComboEdit;
    Label10 :TLabel;
    PorCliente1 :TMenuItem;
    DBText1 :TDBText;
    emAtraso1 :TMenuItem;
    btnRemoveParcela: TTcGDIButton;
    btnAdicionaParcela: TTcGDIButton;
    dbedValor :TJvDBCalcEdit;
    TcMPDBDateEdit1 :TTcDBDateEdit;
    chkDuvidosos: TCheckBox;
    dbcbProvisao: TDBCheckBox;
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
    gbxProgramarParcelas: TGroupBox;
    lblTipoReceita1: TLabel;
    lblTipoValorReceita: TLabel;
    Label11: TLabel;
    lblTipoReceita2: TLabel;
    cbProximoMes: TJvDBCheckBox;
    edtMeses: TJvDBCalcEdit;
    edtDia: TJvDBCalcEdit;
    dbValorReceita: TJvDBCalcEdit;
    btbProgramar: TTcGDIButton;
    gbxPagamentoAVista: TGroupBox;
    Label5: TLabel;
    DBCheckBox1: TJvDBCheckBox;
    edtCheque: TDBEdit;
    dbcheckComCheque: TJvDBCheckBox;
    cbAnual: TJvDBCheckBox;
    procedure edEntidadeButtonClick( Sender :TObject );
    procedure edNaturezaFinanceiraButtonClick( Sender :TObject );
    procedure edContaButtonClick( Sender :TObject );
    procedure actPrintDesdobramentoExecute( Sender :TObject );
    procedure actPrintVencimentoExecute( Sender :TObject );
    procedure actPrintDocumentoExecute( Sender :TObject );
    procedure actPrintPagamentoExecute( Sender :TObject );
    procedure actPrintLancamentoExecute( Sender :TObject );
    procedure actPrintEntidadeExecute( Sender :TObject );
    procedure actPrintDataBaseExecute( Sender :TObject );
    procedure actPrintPlanoContasExecute( Sender :TObject );
    procedure actIncrementaAnoExecute( Sender :TObject );
    procedure actDecrementaAnoExecute( Sender :TObject );
    procedure actIncrementaMesExecute( Sender :TObject );
    procedure actDecrementaMesExecute( Sender :TObject );
    procedure Button2Click( Sender :TObject );
    procedure chkContasRecebidasClick( Sender :TObject );
    function _dbgListaCheckIfBooleanField( Grid :TJvDBGrid; Field :TField; var StringForTrue, StringForFalse :String )
      :Boolean;
    function dbgParcelasCheckIfBooleanField( Grid :TJvDBGrid; Field :TField; var StringForTrue, StringForFalse :String )
      :Boolean;
    procedure chkContasEmAtrasoClick( Sender :TObject );
    procedure _dbgListaGetCellParams( Sender :TObject; Field :TField; AFont :TFont; var Background :TColor;
      Highlight :Boolean );
    procedure actPrintEmAtrasoExecute( Sender :TObject );
    procedure btbProgramarClick( Sender :TObject );
    procedure edNaturezaFinanceiraKeyPress( Sender :TObject; var Key :Char );
    procedure dbgParcelasShowEditor( Sender :TObject; Field :TField; var AllowEdit :Boolean );
    procedure edContaEnter( Sender :TObject );
    procedure _actDeleteExecute( Sender :TObject );
    procedure _actSaveExecute( Sender :TObject );
    procedure dbgParcelasEditButtonClick( Sender :TObject );
    procedure dbgParcelasKeyPress( Sender :TObject; var Key :Char );
    procedure btnRemoveParcelaClick( Sender :TObject );
    procedure btnAdicionaParcelaClick( Sender :TObject );
    procedure edContaKeyPress( Sender :TObject; var Key :Char );
    procedure dbedValorEnter( Sender :TObject );
    procedure edNaturezaFinanceiraEnter( Sender :TObject );
    procedure edEntidadeEnter( Sender :TObject );
    procedure edEntidadeKeyPress( Sender :TObject; var Key :Char );
    procedure chkDuvidososClick(Sender: TObject);
    procedure chkProvisionadasClick(Sender: TObject);
    procedure btnAnexosClick(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
    procedure _dbgListaDblClick(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure edEntidadeChange(Sender: TObject);
    procedure edNaturezaFinanceiraChange(Sender: TObject);
    procedure edContaChange(Sender: TObject);
    procedure DBCheckBox1Change(Sender: TObject);
    procedure deDtInicialExit(Sender: TObject);
    procedure deDtFinalExit(Sender: TObject);
  private
    { Private declarations }
    IsContaPref :Boolean;
    procedure SearchCliente( TextToSearch :string );
    procedure SearchConta( TextToSearch :string );
    procedure IncrementaAno;
    procedure DecrementaAno;
    procedure IncrementaMes;
    procedure DecrementaMes;
    procedure HiddingByFilter( Sender :TObject );
    function CheckDate( ADate :TDateTime ) :Boolean;
    procedure ChangeFilter;
    procedure ExibeCamposCheque;
  protected
    { Protected declarations }
    procedure Pesquisar; override;
  public
    { Public declarations }
    class var KFIN_ARECEBER  : string ;
    constructor Create( AOwner :TComponent ); override;
  end;

resourcestring
  SDiaInvalido     = 'Dia inválido';
  SPeriodoInvalido = 'Período inválido';
  SDataInvalida    = 'A data %s parece ser inválida.'#13#10'Deseja Continuar?';
  SHiddingByFilter = 'Nenhuma parcela satisfaz o período selecionado'#13#10 +
                     'Este lançamento não será exibido no período de %s';

implementation

uses SearchsFinanceiro, UFIN_OutrasReceitasDatamodule, UfqrFIN_AReceber, UDBFinanceiro, // UnitPeriodo,
  UfrmFIN_AReceberBaixaTitulo, UfqrFIN_AReceberEntidade, DateUtils,
  UfqrFIN_AReceberTitulo, UfqrFIN_AReceberAtraso,
  Exceptions, Math, SysTypes, ThreadSuppl, UFIN_AnexosWizard,
  CLAg5SvcFinanceiroApropriacao, CLAg5SvcFinanceiroEntradaDadosAReceber ;

{$R *.dfm}

type
  SvcFinanceiroEntradaDadosAReceberFactory = class( TInterfacedObject, ISvcFinanceiroEntradaDadosAReceber )
    function Execute(AKFIN_ARECEBER : string) : string  ;
  end;


procedure TFIN_OutrasReceitasWizard.Pesquisar;
begin
  inherited;
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ), TSearchContaAReceber.Create do
    try
      SetFiltro( BoolToChar( chkProvisionadas.Checked ), deDtInicial.Date, deDtFinal.Date );

      TextToFind := _edtSearch.Text;
      if Execute then
        begin
          cdsLstAReceber.Locate( 'KFIN_ARECEBER', Result.FieldByName( 'KFIN_ARECEBER' ).Value, [ ] );
          ActiveFicha;
        end;
    finally
      free;
    end;
end;

procedure TFIN_OutrasReceitasWizard.SearchCliente( TextToSearch :string );
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ), TSearchClienteAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetEntidade( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'NOME' ).asString );
    finally
      free;
    end;
end;


procedure TFIN_OutrasReceitasWizard.SearchConta( TextToSearch :string );
var
  LKConta : string ;
  LConta  : string ;
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin
          LKConta := Result.FieldByName( 'KFIN_CONTA' ).asString ;
          LConta  := Result.FieldByName( 'NOME' ).asString ;

          SetConta( LKConta, LConta, IsContaPref ) ;
        end;
    finally
      free ;
    end ;
end ;

procedure TFIN_OutrasReceitasWizard.edEntidadeButtonClick( Sender :TObject );
begin
  inherited;
  SearchCliente( TJvDBComboEdit( Sender ).Text );
end;

procedure TFIN_OutrasReceitasWizard.edEntidadeChange(Sender: TObject);
begin
  if not Assigned ( TFIN_OutrasReceitasDatamodule( DatamoduleBase ) ) then
     exit ;

  if ( edEntidade.Text <> TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberNOMEENTIDADE.asString )
  and not TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKCAD_ENTIDADE.isNull then
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKCAD_ENTIDADE.Clear ;
end;

procedure TFIN_OutrasReceitasWizard.edEntidadeEnter( Sender :TObject );
begin
  inherited;
  edEntidade.SelectAll;
end;

procedure TFIN_OutrasReceitasWizard.edEntidadeKeyPress( Sender :TObject; var Key :Char );
begin
  if Key = #13 then
    begin
      Key := #0 ;
      TJvDBComboEdit( Sender ).DoClick;
    end;
end;

procedure TFIN_OutrasReceitasWizard.edNaturezaFinanceiraButtonClick( Sender :TObject );
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    SvcFinanceiroApropriacaoEdit.ExecuteTela(
        'FIN_ARECEBER'
      , cdsAReceber
      , cdsApropriacaoAReceber
      , TelaPatrimonio
      //, [tpAtivo, tpReceitas, tpDespesas, tpPassivo]
      , [tpAtivo, tpReceitas]
  ) ;
end;

procedure TFIN_OutrasReceitasWizard.edNaturezaFinanceiraChange(Sender: TObject);
begin
  if not Assigned ( TFIN_OutrasReceitasDatamodule( DatamoduleBase ) ) then
     exit ;

  if ( edNaturezaFinanceira.Text <> TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberDESCR_PC_NOME.asString )
  and not TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKFIN_PLANOCONTA.isNull then
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKFIN_PLANOCONTA.Clear ;
end;

procedure TFIN_OutrasReceitasWizard.edNaturezaFinanceiraEnter( Sender :TObject );
begin
  inherited;
  edNaturezaFinanceira.SelectAll;
end;

procedure TFIN_OutrasReceitasWizard.edNaturezaFinanceiraKeyPress( Sender :TObject; var Key :Char );
begin
  if Key = #13 then
   begin
    Key := #0 ;
    TJvDBComboEdit( Sender ).DoClick;
   end;
end;

procedure TFIN_OutrasReceitasWizard.ExibeCamposCheque;
begin
  dbcheckComCheque.Visible := TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberPAGTO_AVISTA.AsBoolean;
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

procedure TFIN_OutrasReceitasWizard.edContaButtonClick( Sender :TObject );
begin
  inherited;
  IsContaPref := True;
  SearchConta( TJvDBComboEdit( Sender ).Text );
end;

procedure TFIN_OutrasReceitasWizard.edContaChange(Sender: TObject);
begin
  if not Assigned ( TFIN_OutrasReceitasDatamodule( DatamoduleBase ) ) then
     exit ;

  if ( edConta.Text <> TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberNOMECONTA.asString )
  and not TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKFIN_CONTA_PREF.isNull then
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceberKFIN_CONTA_PREF.Clear ;
end;

procedure TFIN_OutrasReceitasWizard.edContaEnter( Sender :TObject );
begin
  inherited;
  edConta.SelectAll;
end;

procedure TFIN_OutrasReceitasWizard.edContaKeyPress( Sender :TObject; var Key :Char );
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
  begin
    if Key <> #13 then
    begin
      if not ( cdsAReceber.State in [ dsInsert, dsEdit ] ) then
        cdsAReceber.Edit;

      cdsAReceberKFIN_CONTA_PREF.Clear;
    end
    else
      begin
        Key := #0 ;
        TJvDBComboEdit( Sender ).DoClick;
      end;
  end;

end;

procedure TFIN_OutrasReceitasWizard.actPrintDesdobramentoExecute( Sender :TObject );
begin
  inherited;
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsLstAReceberKFIN_ARECEBER do
    TfqrFIN_AReceberTitulo.Execute2( asString );
end;

procedure TFIN_OutrasReceitasWizard.actPrintVencimentoExecute( Sender :TObject );
begin
  inherited;
  TfqrFIN_AReceber.ExecuteDialog;
end;

procedure TFIN_OutrasReceitasWizard.btbProgramarClick( Sender :TObject );
var
  Parcela, FDiferenca :Double;
  DT_Vcto, Data_final :TDate;
  totalParcelas :Double;
begin
  Parcela := 0;
  FDiferenca := 0;
  totalParcelas := 0;
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsParcelas do
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
            raise Warning.Create( 'Exite parcela(s) já baixada(s)' );
          Next;
        end;
      finally
        First;
        EnableControls;
      end;
    end;
  end;

  if dbValorReceita.Text = EmptyStr then
  begin
    dbValorReceita.SetFocus;
    raise Warning.Create( 'Favor digitar o valor da receita' );
  end;

  if Trim( edtMeses.Text ) = EmptyStr then
  begin
    edtMeses.SetFocus;
    raise Warning.Create( 'Favor digitar o número de parcelas' );
  end;

  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
  begin
    cdsParcelas.First;
    while not cdsParcelas.Eof do
      cdsParcelas.Delete;

    if not ( cdsAReceber.State in [ dsInsert, dsEdit ] ) then
      cdsAReceber.Edit;

    cdsAReceberVALOR.AsFloat := StrToFloat( dbValorReceita.Text );

    if StrToIntDef( edtDia.Text, 0 ) <> 0 then
       DT_Vcto :=  DateUtils.StartOfTheMonth( cdsAReceberDATALANCTO.AsDateTime ) + StrToInt( edtDia.Text ) - 1
    else
       DT_Vcto := cdsAReceberDATALANCTO.AsDateTime ;

    if cbProximoMes.Checked then
       DT_Vcto := IncMonth( DT_Vcto, 1 ) ;

    if cbAnual.Checked then
      Data_final := IncMonth( DT_Vcto, (StrToInt( edtMeses.Text ) - 1) * 12 )
    else
      Data_final := IncMonth( DT_Vcto, StrToInt( edtMeses.Text ) - 1 );

    if dbcbRecorrencia.Checked then
      Parcela := cdsAReceberVALOR.AsFloat
    else
      Parcela := RoundTo( cdsAReceberVALOR.AsFloat / StrToInt( edtMeses.Text ), - 2 );

    if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
      cdsParcelas.Edit;

    while DT_Vcto <= Data_final do
    begin
      cdsParcelas.Append;

      if DT_Vcto > cdsAReceberDATALANCTO.AsDateTime then
        cdsParcelasVENCTO.AsDateTime := DT_Vcto
      else
        cdsParcelasVENCTO.AsDateTime := cdsAReceberDATALANCTO.AsDateTime;

      cdsParcelasDOCUMENTO.asString := cdsAReceberDOCUMENTO.asString;
      cdsParcelasVALOR.AsFloat := Parcela;

      if ( not ( cdsAReceberKFIN_CONTA_PREF.IsNull ) or not ( cdsAReceberKFIN_CONTA_PREF.asString = '' ) ) then
      begin
        cdsParcelasKFIN_CONTA.asString := cdsAReceberKFIN_CONTA_PREF.asString;
        cdsParcelasNOMECONTA.asString := cdsAReceberNOMECONTA.asString;
      end;

      if cbAnual.Checked then
        DT_Vcto := IncMonth( DT_Vcto, 12 )
      else
        DT_Vcto := IncMonth( DT_Vcto, 1 );
    end;

    totalParcelas := totalParcelas + cdsParcelasVALOR.AsFloat;
    cdsParcelas.Post;

    if ( RoundTo( totalParcelas, - 2 ) <> RoundTo( cdsAReceberVALOR.AsFloat, - 2 ) ) and ( not dbcbRecorrencia.Checked )
      then
    begin
      FDiferenca := cdsAReceberVALOR.AsFloat - cdsParcelasTOTAL.AsVariant;
      cdsParcelas.First;
      cdsParcelas.Edit;
      cdsParcelasVALOR.AsFloat := cdsParcelasVALOR.AsFloat + FDiferenca;
      cdsParcelas.Post;
    end;

    cdsParcelas.First;
    cdsParcelas.EnableControls;
  end;
end;

procedure TFIN_OutrasReceitasWizard.btnAdicionaParcelaClick( Sender :TObject );
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
  begin
    if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
      cdsParcelas.Edit;

    cdsParcelas.Append;
    dbgParcelas.SetFocus;
    dbgParcelas.SelectedIndex := 0;
  end;
end;

procedure TFIN_OutrasReceitasWizard.btnAnexosClick(Sender: TObject);
begin
  with TFIN_OutrasReceitasDatamodule( DataModuleBase ) do
    TFIN_AnexosWizard.ExecuteWizard( 'FIN_ARECEBER', cdsAReceberKFIN_ARECEBER.AsString );
end;

procedure TFIN_OutrasReceitasWizard.btnRemoveParcelaClick( Sender :TObject );
begin
  inherited;
  if TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsParcelas.Eof then
    Exit;

  if not ( TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsParcelasPAGTO.IsNull ) then
    raise Warning.Create( 'Parcela não pode ser excluída' )
  else
    TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsParcelas.Delete;
end;

procedure TFIN_OutrasReceitasWizard.actPrintDocumentoExecute( Sender :TObject );
begin
  inherited;
  TfqrFIN_AReceber.ExecuteDialogPorDocumento;
end;

procedure TFIN_OutrasReceitasWizard.actPrintPagamentoExecute( Sender :TObject );
begin
  inherited;
  TfqrFIN_AReceber.ExecuteDialogPorPagamento;
end;

procedure TFIN_OutrasReceitasWizard.actPrintLancamentoExecute( Sender :TObject );
var
  Parameters :TReportParamsFIN_AReceber;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create;

  try
    // frmPeriodo := TfrmPeriodo.Create(Self);
    // frmPeriodo.cbxPagos.Checked := True;
    // frmPeriodo.cbxPagos.Visible := False;
    // If frmPeriodo.ShowModal <> mrOk then
    // Exit;

    Parameters.ReportTitle := 'Titulos Lançados';
    Parameters.Ordem := 'd.Vencto';
    Parameters.Filtro := 't.Lancto';
    TfqrFIN_AReceber.Execute( Parameters );
  finally
    // frmPeriodo.Free;
  end;

end;

procedure TFIN_OutrasReceitasWizard.actPrintEntidadeExecute( Sender :TObject );
begin
  inherited;
  TfqrFIN_AReceberEntidade.ExecuteDialog;
end;

procedure TFIN_OutrasReceitasWizard.actPrintDataBaseExecute( Sender :TObject );
begin
  inherited;
  {
    try
    frmData := TfrmData.Create(self);
    If frmData.ShowModal <> mrOk then
    Exit;

    try
    fqrFIN_AReceberDataBase := TfqrFIN_AReceberDataBase.Create(self);
    fqrFIN_AReceberDataBase.OpenQuery(frmData.deDate.Date);
    fqrFIN_AReceberDataBase.QuickRep.Preview;
    finally
    FreeAndNil(fqrFIN_AReceberDataBase);
    end;

    finally
    frmData.Free;
    end;
    }
end;

procedure TFIN_OutrasReceitasWizard.actPrintPlanoContasExecute( Sender :TObject );
begin
  inherited;
  {
    try
    frmPeriodo := TfrmPeriodo.Create(Self);
    frmPeriodo.cbxPagos.Checked := True;
    frmPeriodo.cbxPagos.Visible := False;
    If frmPeriodo.ShowModal <> mrOk then
    Exit;
    try
    frmQRTitPagPlano := TfrmQRTitPagPlano.Create(self);
    frmQRTitPagPlano.OpenQuery(frmPeriodo.deIni.Date,frmPeriodo.deFim.Date);
    frmQRTitPagPlano.QuickRep.Preview;
    finally
    FreeAndNil(frmQRTitPagPlano);
    end;
    finally
    frmPeriodo.Free;
    end;
  }
end;

procedure TFIN_OutrasReceitasWizard.DecrementaAno;
begin
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).DecrementaAno;
end;

procedure TFIN_OutrasReceitasWizard.DecrementaMes;
begin
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).DecrementaMes;
end;

procedure TFIN_OutrasReceitasWizard.deDtFinalExit(Sender: TObject);
begin
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_OutrasReceitasWizard.deDtInicialExit(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

procedure TFIN_OutrasReceitasWizard.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin

  if not Assigned ( TFIN_OutrasReceitasDatamodule( DataModuleBase ) ) then
     exit ;

  if not Assigned ( Field )
    or (Field = TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberRECORRENCIA) then
  begin
    if TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberRECORRENCIA.asBoolean then
      begin
        lblTipoValorReceita.Caption := 'Valor da receita' ;
        lblTipoReceita1.Caption := 'Recorrente ' ;
        lblTipoReceita2.Caption := 'vez(es)' ;
      end
    else
      begin
        lblTipoValorReceita.Caption := 'Total da receita' ;
        lblTipoReceita1.Caption := 'Dividido em ' ;
        lblTipoReceita2.Caption := 'parcela(s)' ;
      end;
  end;


  if not Assigned ( Field )
    or (Field = TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKCAD_ENTIDADE) then
     begin
       Image1.Picture := nil ;
       if not TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKCAD_ENTIDADE.isNull then
         begin
            edEntidade.Font.Color := clNavy ;
            Image1.Hint := 'Cliente associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
         end
       else if ( TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberNOMEENTIDADE.asString <> '' ) then
         begin
            edEntidade.Font.Color := clRed ;
            Image1.Hint := 'Cliente não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, Image1.Picture.Bitmap ) ;
         end;
     end;

  if not Assigned ( Field )
    or (Field = TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKFIN_PLANOCONTA) then
     begin
       Image2.Picture := nil ;
       if not TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKFIN_PLANOCONTA.isNull then
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
    or (Field = TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKFIN_CONTA_PREF) then
     begin
       Image3.Picture := nil ;
       if not TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsAReceberKFIN_CONTA_PREF.isNull then
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

procedure TFIN_OutrasReceitasWizard.IncrementaAno;
begin
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).IncrementaAno;
end;

procedure TFIN_OutrasReceitasWizard.IncrementaMes;
begin
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).IncrementaMes;
end;

procedure TFIN_OutrasReceitasWizard.actIncrementaAnoExecute( Sender :TObject );
begin
  inherited;
  IncrementaAno;
end;

procedure TFIN_OutrasReceitasWizard.actDecrementaAnoExecute( Sender :TObject );
begin
  inherited;
  DecrementaAno;
end;

procedure TFIN_OutrasReceitasWizard.actIncrementaMesExecute( Sender :TObject );
begin
  inherited;
  IncrementaMes
end;

procedure TFIN_OutrasReceitasWizard.actDecrementaMesExecute( Sender :TObject );
begin
  inherited;
  DecrementaMes
end;

procedure TFIN_OutrasReceitasWizard.ChangeFilter;
begin
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).SetFilter( chkProvisionadas.Checked, deDtInicial.Date, deDtFinal.Date );
end;

function TFIN_OutrasReceitasWizard.CheckDate( ADate :TDateTime ) :Boolean;
begin
  Result := ( ADate >= Date - 30 ) or ( MessageDlg( SDataInvalida, [ formatDateTime( 'dd/mm/yyyy', ADate ) ], mtWarning,
      [ mbYes, mbNo ] ) = mrYes );
end;

procedure TFIN_OutrasReceitasWizard.HiddingByFilter( Sender :TObject );
begin
//  MessageDlg( SHiddingByFilter, [ TFIN_OutrasReceitasDatamodule( DatamoduleBase ).StringPeriodo ] );
end;

procedure TFIN_OutrasReceitasWizard.Button2Click( Sender :TObject );
var
  BaixaTitulo :TBaixaTitulo;
begin
  inherited;
  if not ( TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceber.State in [ dsInsert, dsEdit ] ) then
    TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceber.Edit;

  // BaixaTitulo.KParcela := TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsLstAReceberKFIN_ARECEBER_PARCELA.asString ;
  // if TfrmFIN_AReceberBaixaTitulo.Execute(  BaixaTitulo ) then
  // TFIN_OutrasReceitasDatamodule( DataModuleBase ).RefreshBaixa ( BaixaTitulo ) ;
end;

procedure TFIN_OutrasReceitasWizard.chkContasRecebidasClick( Sender :TObject );
begin
  inherited;
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).ShowPago := chkContasRecebidas.Checked
end;

procedure TFIN_OutrasReceitasWizard.chkDuvidososClick(Sender: TObject);
begin
  inherited;
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).ShowDuvidoso := chkDuvidosos.Checked
end;

procedure TFIN_OutrasReceitasWizard.chkProvisionadasClick(Sender: TObject);
begin
  inherited;
  ThreadSuppl.TSyncThread.Create( ChangeFilter );
end;

constructor TFIN_OutrasReceitasWizard.Create( AOwner :TComponent );
begin

  inherited;
  if DebugHook = 0 then
    chkContasEmAtraso.Visible := False ;


  deDtInicial.OnChange := nil ;
  deDtFinal.OnChange   := nil ;

  deDtInicial.Date := StartOfTheMonth( Date ) ;
  deDtFinal.Date   := EndOfTheMonth( Date ) ;


  TFIN_OutrasReceitasDatamodule.Create( self );


  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).KFIN_ARECEBER := TFIN_OutrasReceitasWizard.KFIN_ARECEBER ;
  dtsLista.DataSet         := TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsLstAReceber ;
  dtsFicha.DataSet         := TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsAReceber ;
  dtsParcelas.DataSet      := TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsParcelas ;


  if KFIN_ARECEBER <> '' then
    _pageControl.ActivePage := _tbsFicha ;

  KFIN_ARECEBER := '' ;

  DatamoduleBase.OpenTables;

//  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).OnCheckDate := CheckDate;
//  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).OnHiddingByFilter := HiddingByFilter;
  ChangeFilter;
  ExibeCamposCheque;

end;

procedure TFIN_OutrasReceitasWizard.DBCheckBox1Change(Sender: TObject);
begin
  inherited;
  ExibeCamposCheque;
end;

procedure TFIN_OutrasReceitasWizard._actDeleteExecute( Sender :TObject );
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
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

procedure TFIN_OutrasReceitasWizard._actEditExecute(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
  ExibeCamposCheque;
end;

procedure TFIN_OutrasReceitasWizard._actNewExecute(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := False ;
  ExibeCamposCheque;
end;

procedure TFIN_OutrasReceitasWizard._actSaveExecute( Sender :TObject );
var
  FKConta : string ;
begin
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    begin
      TCdsSuppl.PostIfNeed( cdsParcelas );

      if cdsParcelas.IsEmpty then
        raise Warning.Create('A receita deve ter ao menos uma parcela.');

      cdsParcelas.DisableControls;
      cdsParcelas.First;
      try
        while not cdsParcelas.Eof do
          begin
            if ( cdsParcelasKFIN_CONTA.IsNull ) or ( cdsParcelasKFIN_CONTA.AsString = EmptyStr ) then
            begin
                if cdsAReceberKFIN_CONTA_PREF.asString <> '' then
                 begin
                  cdsParcelas.Edit;
                  cdsParcelasKFIN_CONTA.asString := cdsAReceberKFIN_CONTA_PREF.asString ;
                  cdsParcelasNOMECONTA.asString  := cdsAReceberNOMECONTA.asString ;
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

      FKConta := cdsAReceberKFIN_ARECEBER.AsString ;

      inherited;

      //cdsLstAReceber.Locate('KFIN_ARECEBER', FKConta, [] );

    end;

    btnAnexos.Enabled := True ;
end;

function TFIN_OutrasReceitasWizard._dbgListaCheckIfBooleanField( Grid :TJvDBGrid; Field :TField;
  var StringForTrue, StringForFalse :String ) :Boolean;
begin
  inherited;
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    Result := Assigned( Field ) and ( ( Field = cdsLstAReceberATIVO ) or ( Field = cdsLstAReceberPROVISAO ) );

  StringForTrue := 'T';
  StringForFalse := 'F';
end;

procedure TFIN_OutrasReceitasWizard._dbgListaDblClick(Sender: TObject);
begin
  inherited;
  btnAnexos.Enabled := True ;
end;

procedure TFIN_OutrasReceitasWizard.dbedValorEnter( Sender :TObject );
begin
  inherited;
  dbedValor.SelectAll;
end;

function TFIN_OutrasReceitasWizard.dbgParcelasCheckIfBooleanField( Grid :TJvDBGrid; Field :TField;
var StringForTrue, StringForFalse :String ) :Boolean;
begin
  inherited;
  with TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    Result := Assigned( Field ) and (( Field = cdsParcelasDUVIDOSO ) or ( Field = cdsParcelasPREVISAO ) );

  StringForTrue  := 'T';
  StringForFalse := 'F';
end;

procedure TFIN_OutrasReceitasWizard.dbgParcelasEditButtonClick( Sender :TObject );
begin
  inherited;
  with dbgParcelas, TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    if ( SelectedField = cdsParcelasNOMECONTA ) then
      begin
        if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
          cdsParcelas.Edit;

        SearchConta( InplaceEditor.Text );
      end;
end;

procedure TFIN_OutrasReceitasWizard.dbgParcelasKeyPress( Sender :TObject; var Key :Char );
begin
  // inherited;
  with dbgParcelas, TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    begin
      if not ( cdsParcelas.State in [ dsInsert, dsEdit ] ) then
        cdsParcelas.Edit;

      if ( SelectedField = cdsParcelasNOMECONTA ) then
        begin
          if ( Key = #13 ) and Assigned( InplaceEditor ) and ( InplaceEditor.Visible ) then
            begin
              IsContaPref := False;
              SearchConta( InplaceEditor.Text );
            end;
        end;
    end;
end;

procedure TFIN_OutrasReceitasWizard.dbgParcelasShowEditor( Sender :TObject; Field :TField; var AllowEdit :Boolean );
begin
  // inherited;
  with TJvDBUltimGrid( Sender ), TFIN_OutrasReceitasDatamodule( DatamoduleBase ) do
    AllowEdit := cdsParcelasPAGTO.IsNull;
end;

procedure TFIN_OutrasReceitasWizard.chkContasEmAtrasoClick( Sender :TObject );
begin
  inherited;
  TFIN_OutrasReceitasDatamodule( DatamoduleBase ).ShowEmAtraso := chkContasEmAtraso.Checked
end;

procedure TFIN_OutrasReceitasWizard._dbgListaGetCellParams( Sender :TObject; Field :TField; AFont :TFont;
  var Background :TColor; Highlight :Boolean );
begin
//  inherited;
  if Highlight then
    Exit;

  // if not TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsLstAReceberPAGTO.isNull then
  // AFont.Color := clGray
  if TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsLstAReceberDATALANCTO.AsDateTime < Date then
    AFont.Color := clMaroon
  else if TFIN_OutrasReceitasDatamodule( DatamoduleBase ).cdsLstAReceberDATALANCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clBlack;

  (*
  if not TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsLstAReceberPAGTO.isNull then
    AFont.Color := clBlack // clGray
  else if TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsLstAReceberDATALANCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if TFIN_OutrasReceitasDatamodule( DataModuleBase ).cdsLstAReceberDATALANCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clNavy ;
  *)
end;

procedure TFIN_OutrasReceitasWizard.actPrintEmAtrasoExecute( Sender :TObject );
var
  Parameters :TReportParamsFIN_AReceber;
begin
  inherited;
  Parameters := TReportParamsFIN_AReceber.Create;
  Parameters.ExibirQuitados := False;
  TfqrFIN_AReceberAtraso.Execute( Parameters );
  Parameters.Free;
end;

{ SvcFinanceiroEntradaDadosAReceberFactory }
function SvcFinanceiroEntradaDadosAReceberFactory.Execute(AKFIN_ARECEBER : string) : string  ;
begin
   TFIN_OutrasReceitasWizard.KFIN_ARECEBER := AKFIN_ARECEBER ;
   with TFIN_OutrasReceitasWizard.Create ( nil ) do
     try
       ShowModal ;
     finally
       Free ;
     end;
end;

initialization
  RegisterClass( TFIN_OutrasReceitasWizard );
  SvcFinanceiroEntradaDadosAReceber := SvcFinanceiroEntradaDadosAReceberFactory.Create ;

finalization
  SvcFinanceiroEntradaDadosAReceber := nil ;

end.
