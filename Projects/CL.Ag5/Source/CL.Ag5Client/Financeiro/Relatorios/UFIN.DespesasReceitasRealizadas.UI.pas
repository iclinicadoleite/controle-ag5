// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UFIN.DespesasReceitasRealizadas.UI ;

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
  , JvExComCtrls
  , JvComCtrls
  , VCL.ExtCtrls
  , SysFormWizard
  , JvExExtCtrls
  , JvExtComponent
  , JvPanel
  , JvImage
  , Tc.VCL.Controls.GDIButton
  , UFin.DespesasReceitasRealizadas.Data
  , VCL.Mask
  , JvExMask
  , Tc.VCL.Edits
  , ReportTypes
  , VCL.Grids
  , VCL.DBGrids
  , JvExDBGrids
  , JvDBGrid
  , JvDBUltimGrid
  , JvToolEdit
  , Data.DB, Tc.Data.DB.Helpers
  , Tc.RTL.Exceptions
  , VCL.DBCtrls
  , System.Actions
  , Tc.VCL.Extended.Mask
  , Tc.VCL.Application
  , System.ImageList
  , Vcl.ImgList
  , Wrappers ;

type
  TfrmFIN_DespesasReceitas = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    dbgResultado: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    rgCentroCusto: TRadioGroup;
    edSearchCentroCusto: TJvComboEdit;
    Panel1: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    rgDespesas: TRadioGroup;
    edSearchFornecedor: TJvComboEdit;
    chkRatearCC: TCheckBox;
    rgContaContabil: TRadioGroup;
    edSearchContaContabil: TJvComboEdit;
    ImageList1: TImageList;
    PnlChkCentroCusto: TPanel;
    ImgChkCentroCusto: TImage;
    PnlChkContaContabil: TPanel;
    ImgChkContaContabil: TImage;
    PnlChkFornecedor: TPanel;
    ImgChkFornecedor: TImage;
    chkDespesas: TCheckBox;
    rgClientes: TRadioGroup;
    edSearchCliente: TJvComboEdit;
    PnlChkCliente: TPanel;
    ImgChkCliente: TImage;
    chkReceitas: TCheckBox;
    DBText2: TDBText;
    Label4: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgResultadoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);
    procedure chkRatearCCClick(Sender: TObject);
    procedure edSearchContaContabilButtonClick(Sender: TObject);
    procedure edSearchContaContabilChange(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure rgContaContabilClick(Sender: TObject);
    procedure rgDespesasClick(Sender: TObject);
    procedure rgClientesClick(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoExit(Sender: TObject);
    procedure edSearchContaContabilEnter(Sender: TObject);
    procedure edSearchContaContabilExit(Sender: TObject);
    procedure edSearchFornecedorButtonClick(Sender: TObject);
    procedure edSearchFornecedorChange(Sender: TObject);
    procedure edSearchFornecedorEnter(Sender: TObject);
    procedure edSearchFornecedorExit(Sender: TObject);
    procedure edSearchClienteButtonClick(Sender: TObject);
    procedure edSearchClienteChange(Sender: TObject);
    procedure edSearchClienteEnter(Sender: TObject);
    procedure edSearchClienteExit(Sender: TObject);
    procedure chkDespesasClick(Sender: TObject);
    procedure chkReceitasClick(Sender: TObject);
  private
    { Private declarations }  
    dtmFin_DespesasReceitasRealizadas : TdtmFin_DespesasReceitasRealizadas ;
    FFilterDescription : string ;
    RParams : TReportParamsFIN_DespesasReceitas ;
    FKCAD_Fornecedor : string ;
    FKCAD_Cliente : string ;
    FKeyCentroCusto : string ;
    FClassificacaoCC : string ;
    FKeyContaContabil : string ;
    FClassificacaoContabil : string ;
    procedure SearchFornecedor( TextToSearch :string );
    procedure SearchCliente( TextToSearch :string );
    function GetFilterDescription: String;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UFIN.DespesasReceitasRealizadas.Rpt,
    SysPrintGridDialog;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TfrmFIN_DespesasReceitas.chkDespesasClick(Sender: TObject);
begin
  rgDespesas.Enabled             := chkDespesas.Checked ;
//  chkProvisaoDespesas.Enabled    := chkDespesas.Checked ;
//  chkProgramacaoDespesas.Enabled := chkDespesas.Checked ;
  edSearchFornecedor.Enabled    := chkDespesas.Checked ;
end;

procedure TfrmFIN_DespesasReceitas.chkReceitasClick(Sender: TObject);
begin
  rgClientes.Enabled             := chkReceitas.Checked ;
//  chkProvisaoReceitas.Enabled    := chkReceitas.Checked ;
//  chkProgramacaoReceitas.Enabled := chkReceitas.Checked ;
  edSearchFornecedor.Enabled     := chkReceitas.Checked ;
end;

procedure TfrmFIN_DespesasReceitas.chkRatearCCClick(Sender: TObject);
begin
  rgCentroCusto.Enabled       := chkRatearCC.Checked ;
  edSearchCentroCusto.Enabled := chkRatearCC.Checked ;
end;

constructor TfrmFIN_DespesasReceitas.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  dtmFin_DespesasReceitasRealizadas := TdtmFin_DespesasReceitasRealizadas.Create( Self ) ;
  dtsResultado.DataSet         :=  dtmFin_DespesasReceitasRealizadas.cdsDespesasReceitas ;

  RParams := TReportParamsFIN_DespesasReceitas.Create;

  FKeyCentroCusto        := '' ;
  FClassificacaoCC       := '' ;
  FKeyContaContabil      := '' ;
  FClassificacaoContabil := '' ;

  dbgResultado.ShowHighlighter := True ;

  ImageChkComboEdit(ImgChkCentroCusto,   'Centro de custo', '' ) ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', '' ) ;
  ImageChkComboEdit(ImgChkFornecedor,    'Fornecedor', '' ) ;
  ImageChkComboEdit(ImgChkCliente,       'Cliente', '' ) ;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;
end;

procedure TfrmFIN_DespesasReceitas.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

destructor TfrmFIN_DespesasReceitas.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TfrmFIN_DespesasReceitas.edSearchCentroCustoButtonClick(
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

procedure TfrmFIN_DespesasReceitas.edSearchCentroCustoChange(Sender: TObject);
begin
  FKeyCentroCusto         := '' ;
  FClassificacaoCC        := '' ;
  rgCentroCusto.ItemIndex := Ord ( TReportParamsFIN_DespesasReceitas.TTipoCentroCustoDespesa.ccdSpecific ) ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchCentroCustoEnter(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchCentroCustoExit(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchFornecedorButtonClick(
  Sender: TObject);
begin
  if rgDespesas.ItemIndex = 0 then
    rgDespesas.ItemIndex := 1;

  SearchFornecedor( TTcComboEdit( Sender ).Text );
end;

procedure TfrmFIN_DespesasReceitas.edSearchFornecedorChange(Sender: TObject);
begin
  FKCAD_Fornecedor  := '' ;
  rgDespesas.ItemIndex := 1 ;
  edSearchFornecedor.Font.Color := clMaroon ;
  ImageChkComboEdit(ImgChkFornecedor, 'Fornecedor', FKCAD_Fornecedor ) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchFornecedorEnter(Sender: TObject);
begin
  ImgChkFornecedor.Visible := (edSearchFornecedor.Text <> '')
                           or (rgDespesas.ItemIndex = 1) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchFornecedorExit(Sender: TObject);
begin
  ImgChkFornecedor.Visible := (edSearchFornecedor.Text <> '')
                           or (rgDespesas.ItemIndex = 1) ;
end;


procedure TfrmFIN_DespesasReceitas.edSearchClienteButtonClick(
  Sender: TObject);
begin
  if rgClientes.ItemIndex = 0 then
    rgClientes.ItemIndex := 1;

  SearchCliente( TTcComboEdit( Sender ).Text );
end;

procedure TfrmFIN_DespesasReceitas.edSearchClienteChange(Sender: TObject);
begin
  FKCAD_Cliente  := '' ;
  rgClientes.ItemIndex := 1 ;
  edSearchCliente.Font.Color := clMaroon ;
  ImageChkComboEdit(ImgChkCliente, 'Cliente', FKCAD_Cliente ) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchClienteEnter(Sender: TObject);
begin
  ImgChkCliente.Visible := (edSearchCliente.Text <> '')
                           or (rgClientes.ItemIndex = 1) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchClienteExit(Sender: TObject);
begin
  ImgChkCliente.Visible := (edSearchCliente.Text <> '')
                           or (rgClientes.ItemIndex = 1) ;
end;

class function TfrmFIN_DespesasReceitas.Execute : boolean;
var
  ThisForm: TfrmFIN_DespesasReceitas;
begin
  ThisForm := TfrmFIN_DespesasReceitas.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TfrmFIN_DespesasReceitas.edSearchContaContabilButtonClick(Sender: TObject);
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

procedure TfrmFIN_DespesasReceitas.edSearchContaContabilChange(Sender: TObject);
begin
  FKeyContaContabil         := '' ;
  FClassificacaoContabil    := '' ;
  rgContaContabil.ItemIndex := 1 ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKeyContaContabil ) ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchContaContabilEnter(Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContaContabil.ItemIndex = 1 )  ;
end;

procedure TfrmFIN_DespesasReceitas.edSearchContaContabilExit(Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContaContabil.ItemIndex = 1 )  ;
end;

procedure TfrmFIN_DespesasReceitas.SearchFornecedor(TextToSearch: string);
begin
    with TSearchFornecedorAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edSearchFornecedor.Text := Result.FieldByName( 'APELIDO' ).AsString ;
               FKCAD_Fornecedor  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
               edSearchFornecedor.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
  ImageChkComboEdit(ImgChkFornecedor, 'Fornecedor', FKCAD_Fornecedor ) ;
end;


procedure TfrmFIN_DespesasReceitas.SearchCliente(TextToSearch: string);
begin
    with TSearchClienteAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edSearchCliente.Text := Result.FieldByName( 'APELIDO' ).AsString ;
               FKCAD_Cliente  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
               edSearchCliente.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
  ImageChkComboEdit(ImgChkCliente, 'Cliente', FKCAD_Cliente ) ;
end;

function TfrmFIN_DespesasReceitas.GetFilterDescription: String;
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


  case rgContacontabil.ItemIndex of
    0 : Result := Result + ' Conta contábil : Todos,';
    1 : Result := Result + ' Conta contábil : ' + edSearchContacontabil.Text + ',';
  end ;


  case rgDespesas.ItemIndex of
    0 : Result := Result + ' Fornecedor : Todos,';
    1 : Result := Result + ' Fornecedor : ' + edSearchFornecedor.Text + ',';
  end ;

  case rgClientes.ItemIndex of
    0 : Result := Result + ' Cliente : Todos,';
    1 : Result := Result + ' Cliente : ' + edSearchCliente.Text + ',';
  end ;

  Delete( Result, Result.Length, 1 ) ;
end;

procedure TfrmFIN_DespesasReceitas.ImageChkComboEdit(AImage: TImage; ANAme,
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

procedure TfrmFIN_DespesasReceitas.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := rgCentroCusto.ItemIndex = 2 ;
end;

procedure TfrmFIN_DespesasReceitas.rgContaContabilClick(Sender: TObject);
begin
  ImgChkContaContabil.Visible := rgContaContabil.ItemIndex = 1 ;
end;

procedure TfrmFIN_DespesasReceitas.rgDespesasClick(Sender: TObject);
begin
  ImgChkFornecedor.Visible := rgDespesas.ItemIndex = 1 ;
end;

procedure TfrmFIN_DespesasReceitas.rgClientesClick(Sender: TObject);
begin
  ImgChkCliente.Visible := rgClientes.ItemIndex = 1 ;
end;

procedure TfrmFIN_DespesasReceitas._actExecuteExecute(Sender: TObject);
begin
  dtsResultado.DataSet.DisableControls ;
  TFIN_DespesasReceitasReport.Execute( RParams ) ;
  dtsResultado.DataSet.EnableControls ;
//  -SysPrintGridDialog.TPrintGridDialog.Execute( dbgResultado, Caption );
end;

procedure TfrmFIN_DespesasReceitas._actNextExecute(Sender: TObject);
begin

  if     (chkRatearCC.Checked)
    and  ( rgCentroCusto.ItemIndex = Ord ( TReportParamsFIN_DespesasReceitas.TTipoCentroCustoDespesa.ccdSpecific ) )
    and  (  FKeyCentroCusto = '' )  then
      Raise Warning.Create (  'Centro de custo inválido' ) ;

  if     ( rgContaContabil.ItemIndex = 1 )
    and  (  FKeyContaContabil = '' )  then
      Raise Warning.Create (  'Conta contábil inválida' ) ;

  FFilterDescription := GetFilterDescription ;
  dbgResultado.Title := Self.Caption + ' - ' + FFilterDescription ;

  RParams.ReportTitle       := 'Despesas e Receitas Realizadas';
  RParams.Description       := FFilterDescription ;
  RParams.StartDate         := deDataInicial.Date;
  RParams.EndDate           := deDataFinal.Date;
  RParams.RatearCentroCusto := chkRatearCC.Checked ;
  RParams.TipoCentroCusto   := TReportParamsFIN_DespesasReceitas.TTipoCentroCustoDespesa ( rgCentroCusto.ItemIndex) ;
  RParams.FDataModule       := dtmFin_DespesasReceitasRealizadas ;

  RParams.Despesas := chkDespesas.Checked ;
  RParams.Receitas := chkReceitas.Checked ;

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

  if rgDespesas.ItemIndex = 0 then
    RParams.KCAD_FORNECEDOR := ''
  else
    RParams.KCAD_FORNECEDOR := FKCAD_FORNECEDOR ;

  if rgClientes.ItemIndex = 0 then
    RParams.KCAD_CLIENTE := ''
  else
    RParams.KCAD_CLIENTE := FKCAD_CLIENTE ;

  dtmFin_DespesasReceitasRealizadas.SetReportParams( RParams );
  dtmFin_DespesasReceitasRealizadas.OpenTables;

  inherited;
end;

procedure TfrmFIN_DespesasReceitas._actPriorExecute(Sender: TObject);
begin
  dtmFin_DespesasReceitasRealizadas.cdsDespesasReceitas.Close ;
  inherited;
end;

initialization
   RegisterClass ( TfrmFIN_DespesasReceitas ) ;

end.
