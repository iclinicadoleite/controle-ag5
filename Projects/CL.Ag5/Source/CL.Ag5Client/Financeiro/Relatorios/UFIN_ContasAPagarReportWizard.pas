unit UFIN_ContasAPagarReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, VCL.Mask, JvExMask, Tc.VCL.Edits, JvToolEdit, JvDBControls,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, SysPrintGridDialog,
  UFIN_ContasAPagarReportDataModule,
  Data.DB, Tc.Data.DB.Helpers, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  JvComponentBase, JvDBGridExport, System.ImageList, Vcl.ImgList, Wrappers,
  Vcl.DBCtrls ;

type
  TFIN_ContasAPagarReportWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    rgFornecedores: TRadioGroup;
    rgContacontabil: TRadioGroup;
    rgCentroCusto: TRadioGroup;
    edtSearchEntidade: TJvComboEdit;
    edSearchContacontabil: TJvComboEdit;
    edSearchCentroCusto: TJvComboEdit;
    dtsFIN_APAGAR: TDataSource;
    dbGridFIN_APAGAR: TJvDBUltimGrid;
    ImageList1: TImageList;
    PnlChkCentroCusto: TPanel;
    ImgChkCentroCusto: TImage;
    PnlChkContaContabil: TPanel;
    ImgChkContaContabil: TImage;
    PnlChkEntidade: TPanel;
    ImgChkEntidade: TImage;
    Panel1: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchContacontabilButtonClick(Sender: TObject);
    procedure edSearchContacontabilChange(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);
    procedure edtSearchEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchContacontabilKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchEntidadeChange(Sender: TObject);
    procedure edtSearchEntidadeButtonClick(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure rgFornecedoresClick(Sender: TObject);
    procedure rgContacontabilClick(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure edtSearchEntidadeEnter(Sender: TObject);
    procedure edtSearchEntidadeExit(Sender: TObject);
    procedure edSearchContacontabilEnter(Sender: TObject);
    procedure edSearchContacontabilExit(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoExit(Sender: TObject);
  private
    { Private declarations }
    FFilterDescription : string ;
    FKContacontabil : string ;
    FKCentroCusto   : string ;
    FKCad_Entidade  : string ;
    FIN_ContasAPagarReportDataModule: TFIN_ContasAPagarReportDataModule;
    procedure SetParams;
    function GetFilterDescription: String;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses DateUtils, SearchsFinanceiro, ReportTypes, UFIN_APagarReport; //UFIN_ContasAPagarReport ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TFIN_ContasAPagarReportWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui

  FIN_ContasAPagarReportDataModule:= TFIN_ContasAPagarReportDataModule.Create( Self );
  dtsFIN_APAGAR.DataSet := FIN_ContasAPagarReportDataModule.cdsFIN_APAGAR;

  DBGridFIN_APAGAR.ShowHighlighter := True ;

  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', ''  ) ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', '' ) ;
  ImageChkComboEdit(ImgChkEntidade, 'Fornecedor', ''  ) ;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  rgContacontabil.ItemIndex := 0 ;
  rgCentroCusto.ItemIndex   := 0 ;
{  _actNext.Enabled          := False ;
  _actPrior.Enabled         := False ;
  _actExecute.Enabled       := True ;}
  _btbExecute.Caption       := 'V&isualizar' ;
end;

destructor TFIN_ContasAPagarReportWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchCentroCustoButtonClick(Sender: TObject);
begin
  inherited;
  with TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := edSearchCentroCusto.Text ;
      if Execute then
        begin
          rgCentroCusto.ItemIndex    := 1;
          edSearchContacontabil.Text := Result.FieldByName( 'NOME' ).asString;
          FKContacontabil            := Result.FieldByName( 'KFIN_CENTROCUSTO' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKCentroCusto ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchCentroCustoChange(Sender: TObject);
begin
  inherited;
  Self.FKCentroCusto := '';
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKCentroCusto ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchCentroCustoEnter(
  Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 1)   ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchCentroCustoExit(
  Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 1)   ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchCentroCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit ( Sender ).DoClick ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchContacontabilButtonClick(Sender: TObject);
begin
  inherited;
  with TSearchPlanoContasNotHideByUser.Create do
    try
      TextToFind := edSearchContacontabil.Text ;
      if Execute then
        begin
          rgContacontabil.ItemIndex  := 1 ;
          edSearchContacontabil.Text := Result.FieldByName( 'NOME' ).asString;
          FKContacontabil            := Result.FieldByName( 'KFIN_PLANOCONTA' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKContacontabil ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchContacontabilChange(Sender: TObject);
begin
  inherited;
  Self.FKContacontabil := '';
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKContacontabil ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchContacontabilEnter(
  Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContacontabil.ItemIndex =1)  ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchContacontabilExit(
  Sender: TObject);
begin
  ImgChkContaContabil.Visible := (edSearchContaContabil.Text <> '')
                               or (rgContacontabil.ItemIndex =1)  ;
end;

procedure TFIN_ContasAPagarReportWizard.edSearchContacontabilKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit ( Sender ).DoClick ;
end;

procedure TFIN_ContasAPagarReportWizard.edtSearchEntidadeButtonClick(Sender: TObject);
begin
  if rgFornecedores.ItemIndex = 0 then
    rgFornecedores.ItemIndex := 1;

  with TSearchFornecedorAtivo.Create do
    try
      TextToFind := edtSearchEntidade.Text ;
      if Execute then
        begin
          edtSearchEntidade.Text := Result.FieldByName( 'NOME' ).asString;
          FKCad_Entidade         := Result.FieldByName( 'KCAD_ENTIDADE' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkEntidade, 'Fornecedor', FKCad_Entidade ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edtSearchEntidadeChange(Sender: TObject);
begin
  inherited;
  Self.FKCad_Entidade := '';
  rgFornecedores.ItemIndex := 1 ;
  edtSearchEntidade.Font.Color := clMaroon ;
  ImageChkComboEdit(ImgChkEntidade, 'Fornecedor', FKCad_Entidade ) ;
end;

procedure TFIN_ContasAPagarReportWizard.edtSearchEntidadeEnter(Sender: TObject);
begin
  ImgChkEntidade.Visible := (edtSearchEntidade.Text <> '')
                          or (rgFornecedores.ItemIndex = 1)   ;
end;

procedure TFIN_ContasAPagarReportWizard.edtSearchEntidadeExit(Sender: TObject);
begin
  ImgChkEntidade.Visible := (edtSearchEntidade.Text <> '')
                          or (rgFornecedores.ItemIndex = 1)   ;
end;

procedure TFIN_ContasAPagarReportWizard.edtSearchEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit ( Sender ).DoClick ;
end;

class function TFIN_ContasAPagarReportWizard.Execute : boolean;
var
  ThisForm: TFIN_ContasAPagarReportWizard;
begin
  ThisForm := TFIN_ContasAPagarReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

function TFIN_ContasAPagarReportWizard.GetFilterDescription: String;
begin
  Result:= '';

  if ( deDatainicial.Date > 0 ) or ( deDataFinal.Date > 0 )then
   begin
     if ( deDatainicial.Date > 0 ) then
       Result := Result + ' Data inical : ' + FormatDateTime( 'dd.mm.yyyy', deDatainicial.Date ) +',';
     if ( deDataFinal.Date > 0 ) then
       Result := Result + ' Data final : ' + FormatDateTime( 'dd.mm.yyyy', deDataFinal.Date ) +',';
   end;

  case rgFornecedores.ItemIndex of
     0 : Result := Result + ' Fornecedor : Todos,' ;
     1 : Result := Result + ' Fornecedor : ' + edtSearchEntidade.Text + ',';
  end ;

  if rgContacontabil.Visible then
   case rgContacontabil.ItemIndex of
    0 : Result := Result + ' Conta contábil : Todos,';
    1 : Result := Result + ' Conta contábil : ' + edSearchContacontabil.Text + ',';
   end ;

  if rgCentroCusto.Visible then
   case rgCentroCusto.ItemIndex of
     0 : Result := Result + ' Centro de custos : Todos,' ;
     1 : Result := Result + ' Centro de custos : ' + edSearchCentroCusto.Text + ',';
   end ;

  Delete( Result, Result.Length, 1 ) ;

end;

procedure TFIN_ContasAPagarReportWizard.ImageChkComboEdit(AImage: TImage; ANAme,
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

procedure TFIN_ContasAPagarReportWizard.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := rgCentroCusto.ItemIndex = 1 ;
end;

procedure TFIN_ContasAPagarReportWizard.rgContacontabilClick(Sender: TObject);
begin
  ImgChkContaContabil.Visible := rgContacontabil.ItemIndex = 1 ;
end;

procedure TFIN_ContasAPagarReportWizard.rgFornecedoresClick(Sender: TObject);
begin
  ImgChkEntidade.Visible := rgFornecedores.ItemIndex = 1 ;
end;

procedure TFIN_ContasAPagarReportWizard.SetParams;
begin
  FIN_ContasAPagarReportDataModule.Dataini   := deDataInicial.Date;
  FIN_ContasAPagarReportDataModule.DataFim   := deDataFinal.Date;
  FIN_ContasAPagarReportDataModule.Todos     := rgFornecedores.ItemIndex = 0;
  FIN_ContasAPagarReportDataModule.Entidade  := FKCad_Entidade;
  FIN_ContasAPagarReportDataModule.Fazenda   := LoggedUser.DomainID;
end;

procedure TFIN_ContasAPagarReportWizard._actExecuteExecute(Sender: TObject);
var
  RParams : TReportParamsFIN_APagar ;
begin

  RParams := TReportParamsFIN_APagar.Create;
  RParams.StartDate      := deDataInicial.Date;
  RParams.EndDate        := deDataFinal.Date;
  RParams.ExibirQuitados := False;
  RParams.FTODOS         := rgFornecedores.ItemIndex = 0;
  RParams.KCAD_ENTIDADE  := FKCad_Entidade ;
  RParams.ReportTitle    := 'Contas a pagar por período';
  RParams.Description    := FFilterDescription ;
  RParams.FDataModule    := FIN_ContasAPagarReportDataModule;

  TFIN_APagarReport.Execute( RParams );
  RParams.Free;

  //SysPrintGridDialog.TPrintGridDialog.Execute( DBGridFIN_APAGAR, Caption);

  inherited;
end;

procedure TFIN_ContasAPagarReportWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

  FFilterDescription := GetFilterDescription ;
  dbGridFIN_APAGAR.Title := Self.Caption + ' - ' + FFilterDescription ;
  SetParams;
  FIN_ContasAPagarReportDataModule.OpenTables;

end;

procedure TFIN_ContasAPagarReportWizard._actNextUpdate(Sender: TObject);
begin
  _actNExt.Enabled := (deDataInicial.Date > 0) and (deDataInicial.Date <= deDataFinal.Date);
end;

procedure TFIN_ContasAPagarReportWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFIN_ContasAPagarReportWizard ) ;

end.
