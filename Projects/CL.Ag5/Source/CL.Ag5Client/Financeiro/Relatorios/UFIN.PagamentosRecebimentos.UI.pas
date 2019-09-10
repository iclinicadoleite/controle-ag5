// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UFIN.PagamentosRecebimentos.UI;

interface

uses
    WinApi.Windows
  , WinApi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , VCL.Graphics
  , VCL.Controls
  , VCL.Forms
  , VCL.ActnList
  , VCL.StdCtrls
  , VCL.Buttons
  , VCL.ComCtrls
  , VCL.ExtCtrls
  , SysFormWizard
  , Data.DB, Tc.Data.DB.Helpers
  , System.Actions
  , System.ImageList
  , Vcl.ImgList
  , Vcl.Grids
  , Vcl.DBGrids
  , JvExComCtrls
  , JvComCtrls
  , JvExDBGrids
  , JvDBGrid
  , JvDBUltimGrid
  , JvExMask
  , JvToolEdit
  , Vcl.Mask
  , Tc.VCL.Extended.Mask
  , Tc.VCL.Edits
  , Tc.VCL.Application
  , Tc.VCL.Controls.GDIButton
  , Tc.RTL.Exceptions
  , JvExExtCtrls
  , JvExtComponent
  , JvPanel
  , ReportTypes
  , UFIN.PagamentosRecebimentos.Data
  , Wrappers, Vcl.DBCtrls ;

type
  TfrmFIN_PagamentosRecebimentos = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gbxPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    dbgResultado: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    rgCentroCusto: TRadioGroup;
    edSearchCentroCusto: TJvComboEdit;
    rgDebitos: TRadioGroup;
    edSearchFornecedor: TJvComboEdit;
    chkRatearCC: TCheckBox;
    rgContaContabil: TRadioGroup;
    edSearchContaContabil: TJvComboEdit;
    ImageList1: TImageList;
    PnlChkCentroCusto: TPanel;
    ImgChkCentroCusto: TImage;
    PnlChkContaContabil: TPanel;
    ImgChkContaContabil: TImage;
    PnlChkEntidade: TPanel;
    ImgChkFornecedor: TImage;
    rgCreditos: TRadioGroup;
    edSearchCliente: TJvComboEdit;
    Panel1: TPanel;
    ImgChkCliente: TImage;
    chkDebitos: TCheckBox;
    chkCreditos: TCheckBox;
    GroupBox1: TGroupBox;
    dbgSelectContas: TJvDBUltimGrid;
    Panel4: TPanel;
    cbSelectAll: TCheckBox;
    dtsContas: TDataSource;
    chkProvisaoDebitos: TCheckBox;
    chkProgramacaoDebitos: TCheckBox;
    chkProvisaoCreditos: TCheckBox;
    chkProgramacaoCreditos: TCheckBox;
    Panel2: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label4: TLabel;
    chkRatearContaContabil: TCheckBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgResultadoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);

    procedure edSearchFornecedorButtonClick(Sender: TObject);
    procedure edSearchFornecedorChange(Sender: TObject);
    procedure edSearchFornecedorEnter(Sender: TObject);
    procedure edSearchFornecedorExit(Sender: TObject);

    procedure edSearchClienteButtonClick(Sender: TObject);
    procedure edSearchClienteChange(Sender: TObject);
    procedure edSearchClienteEnter(Sender: TObject);
    procedure edSearchClienteExit(Sender: TObject);

    procedure chkRatearCCClick(Sender: TObject);
    procedure edSearchContaContabilButtonClick(Sender: TObject);
    procedure edSearchContaContabilChange(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure rgContaContabilClick(Sender: TObject);
    procedure rgDebitosClick(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoExit(Sender: TObject);
    procedure edSearchContaContabilEnter(Sender: TObject);
    procedure edSearchContaContabilExit(Sender: TObject);
    procedure rgCreditosClick(Sender: TObject);
    procedure chkDebitosClick(Sender: TObject);
    procedure chkCreditosClick(Sender: TObject);
    procedure dbgSelectContasCellClick(Column: TColumn);
    function dbgSelectContasCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgSelectContasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSelectContasShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure cbSelectAllClick(Sender: TObject);
    procedure chkRatearContaContabilClick(Sender: TObject);
  private
    { Private declarations }
    FdtmFIN_PagamentosRecebimentos : TdtmFIN_PagamentosRecebimentos ;
    RParams : TReportParamsFIN_PagamentosRecebimentos ;
    FFilterDescription : string ;
    FKCAD_FORNECEDOR : string ;
    FKCAD_CLIENTE : string ;
    FKeyCentroCusto : string ;
    FClassificacaoCC : string ;
    FKeyContaContabil : string ;
    FClassificacaoContabil : string ;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
    procedure SearchFornecedor( TextToSearch :string );
    procedure SearchCliente( TextToSearch :string );
    function GetFilterDescription: String;
  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UFIN.PagamentosRecebimentos.Rpt ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TfrmFIN_PagamentosRecebimentos.chkRatearCCClick(Sender: TObject);
begin
  rgCentroCusto.Enabled       := chkRatearCC.Checked ;
  edSearchCentroCusto.Enabled := chkRatearCC.Checked ;
end;

procedure TfrmFIN_PagamentosRecebimentos.chkDebitosClick(Sender: TObject);
begin
  rgDebitos.Enabled             := chkDebitos.Checked ;
  chkProvisaoDebitos.Enabled    := chkDebitos.Checked ;
  chkProgramacaoDebitos.Enabled := chkDebitos.Checked ;
  edSearchFornecedor.Enabled    := chkDebitos.Checked ;
end;

procedure TfrmFIN_PagamentosRecebimentos.cbSelectAllClick(Sender: TObject);
begin
  FdtmFIN_PagamentosRecebimentos.InvertAllContas( cbSelectAll.Checked ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.chkRatearContaContabilClick(Sender: TObject);
begin
  rgContaContabil.Enabled       := chkRatearContaContabil.Checked ;
  edSearchContaContabil.Enabled := chkRatearContaContabil.Checked ;
end;

procedure TfrmFIN_PagamentosRecebimentos.chkCreditosClick(Sender: TObject);
begin
  rgCreditos.Enabled             := chkCreditos.Checked ;
  chkProvisaoCreditos.Enabled    := chkCreditos.Checked ;
  chkProgramacaoCreditos.Enabled := chkCreditos.Checked ;
  edSearchCliente.Enabled        := chkCreditos.Checked ;
end;

constructor TfrmFIN_PagamentosRecebimentos.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  FdtmFIN_PagamentosRecebimentos := TdtmFIN_PagamentosRecebimentos.Create( Self ) ;
  dtsResultado.DataSet         :=  FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentos ;
//  dtsDespesasNoCC.DataSet      :=  Fin_DespesasReportDatamodule.cdsDespesasNoCC ;

  RParams := TReportParamsFIN_PagamentosRecebimentos.Create;

  FKeyCentroCusto        := '' ;
  FClassificacaoCC       := '' ;
  FKeyContaContabil      := '' ;
  FClassificacaoContabil := '' ;

  dbgResultado.ShowHighlighter := True ;
//  JvDBUltimGrid1.ShowHighlighter := True ;

  ImageChkComboEdit(ImgChkCentroCusto,   'Centro de custo', '' ) ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil',  '' ) ;
  ImageChkComboEdit(ImgChkFornecedor,    'Fornecedor',      '' ) ;
  ImageChkComboEdit(ImgChkCliente,       'Cliente',         '' ) ;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;

  cbSelectAll.Checked := True;
end;

procedure TfrmFIN_PagamentosRecebimentos.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

procedure TfrmFIN_PagamentosRecebimentos.dbgSelectContasCellClick(
  Column: TColumn);
begin
  if not ( FdtmFIN_PagamentosRecebimentos.cdsLstContas.IsEmpty )
   and ( Column.Field =  FdtmFIN_PagamentosRecebimentos.cdsLstContasSELECT ) then
     FdtmFIN_PagamentosRecebimentos.InvertSelecaoContas ;
end;

function TfrmFIN_PagamentosRecebimentos.dbgSelectContasCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  with FdtmFIN_PagamentosRecebimentos do
    Result := ( Field = cdsLstContasSELECT  ) ;

  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TfrmFIN_PagamentosRecebimentos.dbgSelectContasKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key = #32 ) and (  dbgSelectContas.SelectedField <> FdtmFIN_PagamentosRecebimentos.cdsLstContasSELECT  ) then
    FdtmFIN_PagamentosRecebimentos.InvertSelecaoContas ;
end;

procedure TfrmFIN_PagamentosRecebimentos.dbgSelectContasShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

destructor TfrmFIN_PagamentosRecebimentos.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TfrmFIN_PagamentosRecebimentos.edSearchCentroCustoButtonClick(
  Sender: TObject);
begin
  if rgCentroCusto.ItemIndex <> 2 then
    rgCentroCusto.ItemIndex := 2;

  with TSearchCentroCusto.Create do
    try
      TextToFind := edSearchCentroCusto.Text ;
      if Execute then
        begin
          edSearchCentroCusto.Text := Result.FieldByName( 'NOME' ).asString;
          FKeyCentroCusto          := Result.FieldByName( 'KFIN_CENTROCUSTO' ).asString;
          FClassificacaoCC         := Result.FieldByName( 'CLASSIFICACAO' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchCentroCustoChange(Sender: TObject);
begin
  FKeyCentroCusto         := '' ;
  FClassificacaoCC        := '' ;
  rgCentroCusto.ItemIndex := Ord ( TReportParamsFIN_Despesas.TTipoCentroCustoDespesa.ccdSpecific ) ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchCentroCustoEnter(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchCentroCustoExit(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchFornecedorButtonClick(
  Sender: TObject);
begin
  if rgDebitos.ItemIndex = 0 then
    rgDebitos.ItemIndex := 1;

  SearchFornecedor( TTcComboEdit( Sender ).Text );
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchFornecedorChange(Sender: TObject);
begin
  FKCAD_FORNECEDOR  := '' ;
  rgDebitos.ItemIndex := 1 ;
  edSearchFornecedor.Font.Color := clMaroon ;
  ImageChkComboEdit(ImgChkFornecedor, 'Fornecedor', FKCAD_FORNECEDOR ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchFornecedorEnter(Sender: TObject);
begin
  ImgChkFornecedor.Visible := (edSearchFornecedor.Text <> '')
                           or (rgDebitos.ItemIndex = 1) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchFornecedorExit(Sender: TObject);
begin
  ImgChkFornecedor.Visible := (edSearchFornecedor.Text <> '')
                           or (rgDebitos.ItemIndex = 1) ;
end;


procedure TfrmFIN_PagamentosRecebimentos.edSearchClienteButtonClick(
  Sender: TObject);
begin
  if rgCreditos.ItemIndex = 0 then
    rgCreditos.ItemIndex := 1;

  SearchCliente( TTcComboEdit( Sender ).Text );
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchClienteChange(Sender: TObject);
begin
  FKCAD_CLIENTE  := '' ;
  rgCreditos.ItemIndex := 1 ;
  edSearchCliente.Font.Color := clMaroon ;
  ImageChkComboEdit(ImgChkCliente, 'Cliente', FKCAD_CLIENTE ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchClienteEnter(Sender: TObject);
begin
  ImgChkCliente.Visible := (edSearchCliente.Text <> '')
                           or (rgCreditos.ItemIndex = 1) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchClienteExit(Sender: TObject);
begin
  ImgChkCliente.Visible := (edSearchCliente.Text <> '')
                           or (rgCreditos.ItemIndex = 1) ;
end;

class function TfrmFIN_PagamentosRecebimentos.Execute : boolean;
var
  ThisForm: TfrmFIN_PagamentosRecebimentos;
begin
  ThisForm := TfrmFIN_PagamentosRecebimentos.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TfrmFIN_PagamentosRecebimentos.edSearchContaContabilButtonClick(Sender: TObject);
begin
  if rgContaContabil.ItemIndex = 0 then
    rgContaContabil.ItemIndex := 1;

  with TSearchPlanoContasNotHideByUser.Create do
    try
      TextToFind := edSearchContaContabil.Text ;
      if Execute then
        begin
          edSearchContaContabil.Text := Result.FieldByName( 'NOME' ).asString;
          FKeyContaContabil          := Result.FieldByName( 'KFIN_PLANOCONTA' ).asString;
          FClassificacaoContabil     := Result.FieldByName( 'CLASSIFICACAO' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKeyContaContabil ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchContaContabilChange(Sender: TObject);
begin
  FKeyContaContabil         := '' ;
  FClassificacaoContabil    := '' ;
  rgContaContabil.ItemIndex := 1 ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKeyContaContabil ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchContaContabilEnter(Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContaContabil.ItemIndex = 1 )  ;
end;

procedure TfrmFIN_PagamentosRecebimentos.edSearchContaContabilExit(Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContaContabil.ItemIndex = 1 )  ;
end;

procedure TfrmFIN_PagamentosRecebimentos.SearchFornecedor(TextToSearch: string);
begin
    with TSearchFornecedorAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edSearchFornecedor.Text := Result.FieldByName( 'APELIDO' ).AsString ;
               FKCAD_FORNECEDOR  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
               edSearchFornecedor.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
  ImageChkComboEdit(ImgChkFornecedor, 'Fornecedor', FKCAD_FORNECEDOR ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.SearchCliente(TextToSearch: string);
begin
    with TSearchClienteAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edSearchCliente.Text := Result.FieldByName( 'APELIDO' ).AsString ;
               FKCAD_CLIENTE  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
               edSearchCliente.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
  ImageChkComboEdit(ImgChkCliente, 'Cliente', FKCAD_CLIENTE ) ;
end;

function TfrmFIN_PagamentosRecebimentos.GetFilterDescription: String;
begin
  Result:= '';

  if ( deDatainicial.Date > 0 ) or ( deDataFinal.Date > 0 )then
   begin
     if ( deDatainicial.Date > 0 ) then
       Result := Result + ' Data inical : ' + FormatDateTime( 'dd.mm.yyyy', deDatainicial.Date ) +',';
     if ( deDataFinal.Date > 0 ) then
       Result := Result + ' Data final : ' + FormatDateTime( 'dd.mm.yyyy', deDataFinal.Date )+',';
   end;


  if (chkRatearCC.Checked) then
    case rgCentroCusto.ItemIndex of
     0 : Result := Result + ' Centro de custos : Todos,' ;
     1 : Result := Result + ' Centro de custos : Sem centro de custo,' ;
     2 : Result := Result + ' Centro de custos : ' + edSearchCentroCusto.Text + ',';
    end ;


  if chkRatearContaContabil.Checked then
   case rgContacontabil.ItemIndex of
    0 : Result := Result + ' Conta contábil : Todos,';
    1 : Result := Result + ' Conta contábil : ' + edSearchContacontabil.Text + ',';
   end ;

  if chkCreditos.Checked then
    begin
      Result := Result + ' Créditos :' ;
      if chkProvisaoCreditos.Checked then
         Result := Result + ' Provisões, ' ;
      if chkProgramacaoCreditos.Checked then
         Result := Result + ' Programados,' ;
      case rgCreditos.ItemIndex of
         0 : Result := Result + ' Todos clientes,';
         1 : Result := Result + ' Cliente : ' + edSearchCliente.Text + ',';
       end ;

    end;

  if chkDebitos.Checked then
    begin
      Result := Result + ' Débitos :' ;
      if chkProvisaoDebitos.Checked then
         Result := Result + ' Provisões,' ;
      if chkProgramacaoDebitos.Checked then
         Result := Result + ' Programados,' ;
      case rgDebitos.ItemIndex of
         0 : Result := Result + ' Todos fornecedores,';
         1 : Result := Result + ' Fornecedor : ' + edSearchFornecedor.Text + ',';
      end ;
    end;

  if cbSelectAll.Checked then
    Result := Result + ' Todas as contas : '
  else
    Result := Result + ' Contas : ' + FdtmFIN_PagamentosRecebimentos.SubTitleContas + ',' ;

  Delete( Result, Result.Length, 1 ) ;
end;

procedure TfrmFIN_PagamentosRecebimentos.ImageChkComboEdit(AImage: TImage; ANAme,
  AKeyVar: string );
begin
  Case AKeyVar.IsEmpty of True :
      begin
        AImage.Hint := AName + ' não associado ao cadastro.'
                      +#13#10'Efetue a pesquisa.'  ;
        ImageList1.GetBitmap( 2, AImage.Picture.Bitmap ) ;
      end;
  else
    AImage.Hint := AName + ' associado ao cadastro.'  ;
    ImageList1.GetBitmap( 0, AImage.Picture.Bitmap )
  end;
  AImage.Refresh ;
end;

procedure TfrmFIN_PagamentosRecebimentos.rgContaContabilClick(Sender: TObject);
begin
  ImgChkContaContabil.Visible := rgContaContabil.ItemIndex = 1 ;
end;

procedure TfrmFIN_PagamentosRecebimentos.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := rgCentroCusto.ItemIndex = 2 ;
end;

procedure TfrmFIN_PagamentosRecebimentos.rgDebitosClick(Sender: TObject);
begin
  ImgChkFornecedor.Visible := rgDebitos.ItemIndex = 1 ;
end;

procedure TfrmFIN_PagamentosRecebimentos.rgCreditosClick(Sender: TObject);
begin
  ImgChkCliente.Visible := rgCreditos.ItemIndex = 1 ;
end;


procedure TfrmFIN_PagamentosRecebimentos._actExecuteExecute(Sender: TObject);
begin
  dtsResultado.DataSet.DisableControls ;
  TrptFIN_PagamentosRecebimentos.Execute( RParams ) ;
  dtsResultado.DataSet.EnableControls ;
//  -SysPrintGridDialog.TPrintGridDialog.Execute( dbgResultado, Caption );
end;

procedure TfrmFIN_PagamentosRecebimentos._actNextExecute(Sender: TObject);
var
 I : integer  ;
begin

  if     (chkRatearCC.Checked)
    and  ( rgCentroCusto.ItemIndex = Ord ( TReportParamsFIN_Despesas.TTipoCentroCustoDespesa.ccdSpecific ) )
    and  (  FKeyCentroCusto = '' )  then
      Raise Warning.Create (  'Centro de custo inválido' ) ;

  if     ( rgContaContabil.ItemIndex = 1 )
    and  (  FKeyContaContabil = '' )  then
      Raise Warning.Create (  'Conta contábil inválida' ) ;


  RParams.ReportTitle       := 'Pagamentos e Recebimentos' ;
  RParams.Description       := FFilterDescription ;
  RParams.StartDate         := deDataInicial.Date;
  RParams.EndDate           := deDataFinal.Date;
  RParams.RatearCentroCusto := chkRatearCC.Checked ;
  RParams.TipoCentroCusto   := TReportParamsFIN_PagamentosRecebimentos.TTipoCentroCusto ( rgCentroCusto.ItemIndex) ;
  RParams.FDataModule       := FdtmFIN_PagamentosRecebimentos ;

  RParams.RatearCentroCusto := chkRatearCC.Checked ;
  if rgCentroCusto.ItemIndex in [ 0, 1 ] then
    begin
     RParams.KCentroCusto      := ''  ;
     RParams.ClassificacaoCC   := ''  ;
    end
  else
    begin
     RParams.KCentroCusto      := FKeyCentroCusto  ;
     RParams.ClassificacaoCC   := FClassificacaoCC  ;
    end;

  RParams.RatearContaContabil := chkRatearContaContabil.Checked ;
  if rgContaContabil.ItemIndex = 0 then
    begin
      RParams.KPlanoContas  := '' ;
      RParams.Classificacao := '' ;
    end
  else
    begin
     RParams.KPlanoContas  := FKeyContaContabil  ;
     RParams.Classificacao := FClassificacaoContabil ;  //FKeyContaContabil  ;
    end;

  RParams.IncluirDebitos  := chkDebitos.Checked ;
  if rgDebitos.ItemIndex = 0 then
    RParams.KCAD_FORNECEDOR := ''
  else
    RParams.KCAD_FORNECEDOR := FKCAD_FORNECEDOR ;
  RParams.ProvisaoDebitos     := chkProvisaoDebitos.Checked ;
  RParams.ProgramacaoDebitos  := chkProgramacaoDebitos.Checked ;


  RParams.IncluirCreditos  := chkCreditos.Checked ;
  if rgCreditos.ItemIndex = 0 then
    RParams.KCAD_CLIENTE := ''
  else
    RParams.KCAD_CLIENTE := FKCAD_CLIENTE ;

  RParams.ProvisaoCreditos     := chkProvisaoCreditos.Checked ;
  RParams.ProgramacaoCreditos  := chkProgramacaoCreditos.Checked ;

  FdtmFIN_PagamentosRecebimentos.SetReportParams( RParams );
  FdtmFIN_PagamentosRecebimentos.OpenTables;

//  TabSheet2.Enabled := chkRatearCC.Checked ;
//  TabSheet3.Enabled := not chkRatearCC.Checked ;

  inherited;

  FFilterDescription := GetFilterDescription ;
  dbgResultado.Title := Self.Caption + ' - ' + FFilterDescription ;
//  JvDBUltimGrid1.Title := Self.Caption + ' - ' + FFilterDescription ;

  with dbgResultado do
    begin              // Volts eh foda manooo... :D
      for i := 0 to Columns.Count - 1 do
        begin
          if Columns[i].FieldName = 'CONTACONTABIL' then
            Columns[i].Visible := chkRatearContaContabil.Checked ;

          if Columns[i].FieldName = 'CENTROCUSTO' then
            Columns[i].Visible := chkRatearCC.Checked ;

          if Columns[i].FieldName = 'PORCENTAGEM' then
            Columns[i].Visible := {chkRatearContaContabil.Checked or } chkRatearCC.Checked ;
        end;
    end;

end;

procedure TfrmFIN_PagamentosRecebimentos._actPriorExecute(Sender: TObject);
begin
  FdtmFIN_PagamentosRecebimentos.cdsPagamentosRecebimentos.Close ;

  inherited;
end;

initialization
  RegisterClass ( TfrmFIN_PagamentosRecebimentos ) ;

end.
