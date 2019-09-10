// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UEST_SaidasReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, UEST_SaidasReportDatamodule, VCL.Mask,
  JvExMask, Tc.VCL.Edits, ReportTypes, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers,
  Tc.RTL.Exceptions, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, System.ImageList, Vcl.ImgList, Wrappers ;

type
  TEST_SaidasReportWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    dbgResultado: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    rgGrupo: TRadioGroup;
    rgProduto: TRadioGroup;
    edSearchGrupo: TJvComboEdit;
    edSearchProduto: TJvComboEdit;
    ImageList1: TImageList;
    PnlChkGrupo: TPanel;
    ImgChkGrupo: TImage;
    PnlChkProduto: TPanel;
    ImgChkProduto: TImage;
    rgCentroCusto: TRadioGroup;
    edSearchCentroCusto: TJvComboEdit;
    ImgChkCCusto: TImage;
    rgContacontabil: TRadioGroup;
    ImgChkContaContabil: TImage;
    edSearchContacontabil: TJvComboEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgResultadoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchGrupoChange(Sender: TObject);
    procedure edSearchProdutoChange(Sender: TObject);
    procedure edSearchGrupoButtonClick(Sender: TObject);
    procedure edSearchProdutoButtonClick(Sender: TObject);
    procedure rgGrupoClick(Sender: TObject);
    procedure rgProdutoClick(Sender: TObject);
    procedure edSearchGrupoEnter(Sender: TObject);
    procedure edSearchGrupoExit(Sender: TObject);
    procedure edSearchProdutoEnter(Sender: TObject);
    procedure edSearchProdutoExit(Sender: TObject);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchCentroCustoExit(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure edSearchContacontabilButtonClick(Sender: TObject);
    procedure edSearchContacontabilChange(Sender: TObject);
    procedure edSearchContacontabilEnter(Sender: TObject);
    procedure edSearchContacontabilKeyPress(Sender: TObject; var Key: Char);
    procedure rgContacontabilClick(Sender: TObject);
  private
    { Private declarations }
    EST_SaidasReportDatamodule : TEST_SaidasReportDatamodule ;
    RParams : TReportParamsEST_Saidas ;
    FKeyGrupo : string ;
    FKeyProduto : string ;
    FKeyCentroCusto : string;
    FClassificacaoCC : string ;
    FKeyContaContabil : string;
    FClassificacaoContabil : string;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UEST_SaidasReport;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TEST_SaidasReportWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  EST_SaidasReportDatamodule := TEST_SaidasReportDatamodule.Create( Self ) ;

  dbgResultado.ShowHighlighter := True ;

  ImageChkComboEdit(ImgChkGrupo, 'Grupo', '' ) ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', '' ) ;

  RParams := TReportParamsEST_Saidas.Create;

  FKeyGrupo         := '' ;
  FKeyProduto       := '' ;
  FKeyCentroCusto   := '' ;
  FKeyContaContabil := '' ;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;
end;

procedure TEST_SaidasReportWizard.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

destructor TEST_SaidasReportWizard.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TEST_SaidasReportWizard.edSearchCentroCustoButtonClick(
  Sender: TObject);
begin
  rgCentroCusto.ItemIndex := 1;
  with TSearchCentroCusto.Create do
    try
      TextToFind := edSearchCentroCusto.Text ;
      if Execute then
        begin
          edSearchCentroCusto.Text := Result.FieldByName( 'NOME' ).asString;
          FKeyCentroCusto          := Result.FieldByName( 'KFIN_CENTROCUSTO' ).asString;
          FClassificacaoCC         := Result.FieldByName( 'CLASSIFICACAO' ).AsString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkCCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TEST_SaidasReportWizard.edSearchCentroCustoChange(Sender: TObject);
begin
  inherited;
  rgCentroCusto.ItemIndex := 1 ;
  Self.FKeyCentroCusto    := '';
  FClassificacaoCC        := '';
  ImageChkComboEdit(ImgChkCCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TEST_SaidasReportWizard.edSearchCentroCustoEnter(Sender: TObject);
begin
  inherited;
  edSearchCentroCusto.SelectAll ;
  ImgChkCCusto.Visible :=   (edSearchCentroCusto.Text <> '')
                         or (rgCentroCusto.ItemIndex = 1 ) ;
end;

procedure TEST_SaidasReportWizard.edSearchCentroCustoExit(Sender: TObject);
begin
  inherited;
  ImgChkCCusto.Visible :=   (edSearchCentroCusto.Text <> '')
                         or (rgCentroCusto.ItemIndex = 1 ) ;
end;

procedure TEST_SaidasReportWizard.edSearchCentroCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit( Sender ).DoClick ;
end;

procedure TEST_SaidasReportWizard.edSearchContacontabilButtonClick(
  Sender: TObject);
begin

  rgContacontabil.ItemIndex := 1 ;
  with TSearchPlanoContasNotHideByUser.Create do
    try
      TextToFind := edSearchContacontabil.Text ;
      if Execute then
        begin
          edSearchContacontabil.Text   := Result.FieldByName( 'NOME' ).asString;
          FKeyContacontabil            := Result.FieldByName( 'KFIN_PLANOCONTA' ).asString;
          FClassificacaoContabil       := Result.FieldByName( 'CLASSIFICACAO'   ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkContaContabil, 'Grupo', FKeyContaContabil ) ;
end;

procedure TEST_SaidasReportWizard.edSearchContacontabilChange(Sender: TObject);
begin
  inherited;
  rgContaContabil.ItemIndex := 1 ;
  Self.FKeyContacontabil := '';
  Self.FClassificacaoContabil := '';
  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FKeyContaContabil ) ;
end;

procedure TEST_SaidasReportWizard.edSearchContacontabilEnter(Sender: TObject);
begin
  inherited;
  edSearchContacontabil.SelectAll ;
  ImgChkContaContabil.Visible :=  (edSearchContacontabil.Text <> '')
                               or (rgContacontabil.ItemIndex = 1);
end;

procedure TEST_SaidasReportWizard.edSearchContacontabilKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit( Sender ).DoClick ;
end;

procedure TEST_SaidasReportWizard.edSearchGrupoButtonClick(Sender: TObject);
begin
  with TSearchTipoProduto.Create do
    try
      TextToFind := edSearchGrupo.Text ;
      if Execute then
        begin
          edSearchGrupo.Text := Result.FieldByName( 'DESCRICAO' ).asString;
          FKeyGrupo          := Result.FieldByName( 'KCAD_TIPOS' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKeyGrupo ) ;
end;

procedure TEST_SaidasReportWizard.edSearchGrupoChange(Sender: TObject);
begin
  FKeyGrupo := '' ;
  rgGrupo.ItemIndex := Ord ( TReportParamsEST_Saidas.TTipoGrupoProduto.gpsSpecific ) ;
  ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKeyGrupo ) ;
end;

procedure TEST_SaidasReportWizard.edSearchGrupoEnter(Sender: TObject);
begin
  ImgChkGrupo.Visible :=  (edSearchGrupo.Text <> '')
                       or (rgGrupo.ItemIndex = 1);
end;

procedure TEST_SaidasReportWizard.edSearchGrupoExit(Sender: TObject);
begin
  ImgChkGrupo.Visible :=  (edSearchGrupo.Text <> '')
                       or (rgGrupo.ItemIndex = 1);
end;

procedure TEST_SaidasReportWizard.edSearchProdutoButtonClick(Sender: TObject);
begin
  with TSearchProdutoInsumo.Create do
    try
      TextToFind := edSearchProduto.Text ;
      if Execute then
        begin
          edSearchProduto.Text := Result.FieldByName( 'NOME' ).asString;
          FKeyProduto          := Result.FieldByName( 'KEST_PRODUTO' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', FKeyProduto ) ;
end;

procedure TEST_SaidasReportWizard.edSearchProdutoChange(Sender: TObject);
begin
  FKeyProduto := '' ;
  rgProduto.ItemIndex := Ord ( TReportParamsEST_Saidas.TTipoProduto.psSpecific ) ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', FKeyProduto ) ;
end;

procedure TEST_SaidasReportWizard.edSearchProdutoEnter(Sender: TObject);
begin
  ImgChkProduto.Visible := (edSearchProduto.Text <> '')
                         or (rgProduto.ItemIndex =1 ) ;
end;

procedure TEST_SaidasReportWizard.edSearchProdutoExit(Sender: TObject);
begin
  ImgChkProduto.Visible := (edSearchProduto.Text <> '')
                         or (rgProduto.ItemIndex =1 ) ;
end;

class function TEST_SaidasReportWizard.Execute : boolean;
var
  ThisForm: TEST_SaidasReportWizard;
begin
  ThisForm := TEST_SaidasReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TEST_SaidasReportWizard.ImageChkComboEdit(AImage: TImage; ANAme,
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

procedure TEST_SaidasReportWizard.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCCusto.Visible := rgCentroCusto.ItemIndex = 1 ;
  if rgCentroCusto.ItemIndex = 0 then
    begin
      edSearchCentroCusto.Text := '' ;
      FKeyCentroCusto          := '' ;
      rgCentroCusto.ItemIndex  := 0;
      ImgChkCCusto.Visible     := False;
    end;
end;

procedure TEST_SaidasReportWizard.rgContacontabilClick(Sender: TObject);
begin
  ImgChkContaContabil.Visible := rgContaContabil.ItemIndex = 1 ;
  if rgContaContabil.ItemIndex = 0 then
    begin
      edSearchContaContabil.Text := '' ;
      FKeyContaContabil          := '' ;
      rgContaContabil.ItemIndex  := 0;
      ImgChkContaContabil.Visible     := False;
    end;
end;

procedure TEST_SaidasReportWizard.rgGrupoClick(Sender: TObject);
begin
  ImgChkGrupo.Visible := rgGrupo.ItemIndex = 1 ;
  if rgGrupo.ItemIndex = 0 then
    begin
      edSearchGrupo.Text  := '' ;
      FKeyGrupo           := '' ;
      rgGrupo.ItemIndex   := 0;
      ImgChkGrupo.Visible := False;
    end;
end;

procedure TEST_SaidasReportWizard.rgProdutoClick(Sender: TObject);
begin
  ImgChkProduto.Visible := rgProduto.ItemIndex = 1 ;
  if rgProduto.ItemIndex = 0 then
    begin
      edSearchProduto.Text  := '' ;
      FKeyProduto           := '' ;
      rgProduto.ItemIndex   := 0;
      ImgChkProduto.Visible := False;
    end;
end;

procedure TEST_SaidasReportWizard._actExecuteExecute(Sender: TObject);
begin
  TEST_SaidasReport.Execute( RParams );
end;

procedure TEST_SaidasReportWizard._actNextExecute(Sender: TObject);
begin

  if     ( rgGrupo.ItemIndex > Ord ( TReportParamsEST_Saidas.TTipoGrupoProduto.gpsdAll ) )
    and  (  FKeyGrupo = '' )  then
      Raise Warning.Create (  'Grupo inválido' ) ;

  if     ( rgProduto.ItemIndex > Ord ( TReportParamsEST_Saidas.TTipoProduto.psdAll ) )
    and  (  FKeyProduto = '' )  then
      Raise Warning.Create (  'Produto inválido' ) ;

  if     ( rgCentroCusto.ItemIndex > Ord ( TReportParamsEST_Saidas.TTipoCentroCusto.ccdAll ) )
    and  ( ( FKeyCentroCusto = '') and (FClassificacaoCC = '') )  then
      Raise Warning.Create (  'Centro de custo inválido' ) ;

  if     ( rgContacontabil.ItemIndex > Ord ( TReportParamsEST_Saidas.TTipoContaContabil.ccdAll ) )
    and  ( ( FKeyContaContabil = '' ) and ( FClassificacaoContabil = '' ) )  then
      Raise Warning.Create (  'Conta contábil inválida' ) ;

  RParams.ReportTitle           := 'Saídas';
  RParams.StartDate             := deDataInicial.Date;
  RParams.EndDate               := deDataFinal.Date;
  RParams.TipoGrupoProduto      := TReportParamsEST_Saidas.TTipoGrupoProduto ( rgGrupo.ItemIndex) ;
  RParams.KGrupoProduto         := FKeyGrupo  ;
  RParams.TipoProduto           := TReportParamsEST_Saidas.TTipoProduto ( rgProduto.ItemIndex) ;
  RParams.KProduto              := FKeyProduto  ;
  RParams.TipoCentroCusto       := TReportParamsEST_Saidas.TTipoCentroCusto ( rgCentroCusto.ItemIndex );
  RParams.KCentroCusto          := FKeyCentroCusto;
  RParams.ClassificacaoCC       := FClassificacaoCC;
  RParams.TipoContaContabil     := TReportParamsEST_Saidas.TTipoContaContabil ( rgContacontabil.ItemIndex );
  RParams.KContaContabil        := FKeyContaContabil;
  RParams.ClassificacaoContabil := FClassificacaoContabil;
  RParams.FDataModule           := EST_SaidasReportDatamodule ;

  EST_SaidasReportDatamodule.SetReportParams( RParams );
  EST_SaidasReportDatamodule.OpenTables;

  inherited;
end;

procedure TEST_SaidasReportWizard._actPriorExecute(Sender: TObject);
begin
  EST_SaidasReportDatamodule.cdsSaidas.Close ;

  inherited;
end;

initialization
   RegisterClass ( TEST_SaidasReportWizard ) ;

end.
