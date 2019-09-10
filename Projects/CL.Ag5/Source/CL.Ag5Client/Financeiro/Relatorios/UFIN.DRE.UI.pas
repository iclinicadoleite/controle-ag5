// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : DRE
//
// License      : veja readme.txt





unit UFIN.DRE.UI;

interface

uses
    WinApi.Windows
  , WinApi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.Generics.Collections
  , System.Actions
  , System.ImageList
  , WinApi.ShellAPI
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
  , Vcl.ImgList
  , JvExComCtrls
  , JvComCtrls
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
  , UFIN.DRE.Data
  , Vcl.DBCtrls
  , VirtualTrees
  , Vcl.WinXPickers
  , Vcl.Grids
  , Vcl.DBGrids
  , UFIN.DRE.Caixa
  , UFIN.DRE.Competencia
  , Wrappers, Vcl.Dialogs ;

type


 TfrmFIN_DRE = class(T_FormWizard)
    TabSheet1: TTabSheet;
    tbsCaixa: TTabSheet;
    gbxPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtsResultado: TDataSource;
    rgCentroCusto: TRadioGroup;
    edSearchCentroCusto: TJvComboEdit;
    ImageList1: TImageList;
    PnlChkCentroCusto: TPanel;
    ImgChkCentroCusto: TImage;
    gbxIncluir: TGroupBox;
    chkProvisao: TCheckBox;
    chkProgramacao: TCheckBox;
    gbxTipo: TGroupBox;
    rbCaixa: TRadioButton;
    rbCompetencia: TRadioButton;
    tbsCompetencia: TTabSheet;
    VSTCompetencia: TVirtualStringTree;
    VSTCaixa: TVirtualStringTree;
    deDataInicial: TDatePicker;
    deDataFinal: TDatePicker;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    SaveDialog: TSaveDialog;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoExit(Sender: TObject);
    procedure rbTipoClick(Sender: TObject);


  private
    { Private declarations }
    FDRECaixa : TDRECaixa ;
    FDRECompetencia : TDRECompetencia ;
    FdtmFIN_DRE : TdtmFIN_DRE ;
    RParams : TReportParamsFIN_DRE ;
    FFilterDescription : string ;
    FKeyCentroCusto : string ;
    FClassificacaoCC : string ;
    FCentroCustoDefault : boolean ;

    procedure FillTreeViewCaixa ;
    procedure FillTreeViewCompetencia ;

    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
    function GetFilterDescription: String;
    procedure DoExport;

  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;

    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses
    DateUtils
  , SearchsFinanceiro
  , UFIN.DRE.Rpt ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TfrmFIN_DRE.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  FdtmFIN_DRE := TdtmFIN_DRE.Create( Self ) ;
//  dtsResultado.DataSet         :=  FdtmFIN_DRE.cdsPagamentosRecebimentos ;
//  dtsDespesasNoCC.DataSet      :=  Fin_DespesasReportDatamodule.cdsDespesasNoCC ;

  RParams := TReportParamsFIN_DRE.Create;
  FDRECaixa := TDRECaixa.Create ( VSTCaixa, FdtmFIN_DRE ) ;
  FDRECompetencia := TDRECompetencia.Create ( VSTCompetencia, FdtmFIN_DRE ) ;

  FKeyCentroCusto        := '' ;
  FClassificacaoCC       := '' ;

  ImageChkComboEdit(ImgChkCentroCusto,   'Centro de custo', '' ) ;

  deDataFinal.Date          := StartOfTheMonth( Date ) ;
  deDataInicial.Date        := IncMonth( deDataFinal.Date, -11 ) ;

  _btbExecute.Caption       := '&Exportar' ;

end;



destructor TfrmFIN_DRE.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TfrmFIN_DRE.edSearchCentroCustoButtonClick(
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
          FCentroCustoDefault      := Result.FieldByName( 'KDEF_CENTROCUSTO' ).asString.Trim <> '' ;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TfrmFIN_DRE.edSearchCentroCustoChange(Sender: TObject);
begin
  FKeyCentroCusto         := '' ;
  FClassificacaoCC        := '' ;
  FCentroCustoDefault     := False ;
  rgCentroCusto.ItemIndex := Ord ( TReportParamsFIN_Despesas.TTipoCentroCustoDespesa.ccdSpecific ) ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TfrmFIN_DRE.edSearchCentroCustoEnter(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

procedure TfrmFIN_DRE.edSearchCentroCustoExit(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := (edSearchCentroCusto.Text <> '')
                              or (rgCentroCusto.ItemIndex = 2)  ;
end;

class function TfrmFIN_DRE.Execute : boolean;
var
  ThisForm: TfrmFIN_DRE;
begin
  ThisForm := TfrmFIN_DRE.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


function TfrmFIN_DRE.GetFilterDescription: String;
begin
  Result:= '';

  if ( deDatainicial.Date > 0 ) or ( deDataFinal.Date > 0 )then
   begin
     if ( deDatainicial.Date > 0 ) then
       Result := Result + ' Período inical : ' + FormatDateTime( 'mm.yyyy', deDatainicial.Date ) +',';
     if ( deDataFinal.Date > 0 ) then
       Result := Result + ' Período final : ' + FormatDateTime( 'mm.yyyy', deDataFinal.Date )+',';
   end;


  case rgCentroCusto.ItemIndex of
   0 : Result := Result + ' Centro de custos : Todos,' ;
   1 : Result := Result + ' Centro de custos : Sem centro de custo,' ;
   2 : Result := Result + ' Centro de custos : ' + edSearchCentroCusto.Text + ',';
  end ;

  if chkProvisao.Checked then
    Result := Result + ' Provisões, ' ;
  if chkProgramacao.Checked then
    Result := Result + ' Programados,' ;

  Delete( Result, Result.Length, 1 ) ;
end;

procedure TfrmFIN_DRE.ImageChkComboEdit(AImage: TImage; ANAme,
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

procedure TfrmFIN_DRE.rbTipoClick(Sender: TObject);
begin
  chkProgramacao.Visible := rbCaixa.Checked ;
end;

procedure TfrmFIN_DRE.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := rgCentroCusto.ItemIndex = 2 ;
end;

procedure TfrmFIN_DRE._actExecuteExecute(Sender: TObject);
begin
  DoExport ;
end;

procedure TfrmFIN_DRE._actNextExecute(Sender: TObject);
begin

  if     ( rgCentroCusto.ItemIndex = Ord ( TReportParamsFIN_Despesas.TTipoCentroCustoDespesa.ccdSpecific ) )
    and  (  FKeyCentroCusto = '' )  then
      Raise Warning.Create (  'Centro de custo inválido' ) ;

  RParams.ReportTitle       := 'D.R.E.' ;
  RParams.Description       := FFilterDescription ;
  RParams.StartDate         := deDataInicial.Date ;
  RParams.EndDate           := deDataFinal.Date   ;
  RParams.TipoCentroCusto   := TReportParamsFIN_DRE.TTipoCentroCusto ( rgCentroCusto.ItemIndex) ;
  RParams.FDataModule       := FdtmFIN_DRE ;

  if rgCentroCusto.ItemIndex in [ 0, 1 ] then
    begin
     RParams.KCentroCusto        := ''  ;
     RParams.ClassificacaoCC     := ''  ;
     RParams.CentroCustoDefault  := rgCentroCusto.ItemIndex = 0 ;
    end
  else
    begin
     RParams.KCentroCusto        := FKeyCentroCusto  ;
     RParams.ClassificacaoCC     := FClassificacaoCC  ;
     RParams.CentroCustoDefault  := FCentroCustoDefault ;
    end;

  RParams.Provisao     := chkProvisao.Checked ;
  RParams.Programacao  := chkProgramacao.Checked ;

  FdtmFIN_DRE.SetReportParams( RParams );
//  FdtmFIN_DRE.OpenTables;

//  TabSheet2.Enabled := chkRatearCC.Checked ;
//  TabSheet3.Enabled := not chkRatearCC.Checked ;

  DBGrid1.Visible := debugHook <> 0 ;
  DBGrid2.Visible := debugHook <> 0 ;

  if rbCaixa.Checked then
    FillTreeViewCaixa
  else
    FillTreeViewCompetencia ;

  inherited;

  FFilterDescription := GetFilterDescription ;
//  dbgResultado.Title := Self.Caption + ' - ' + FFilterDescription ;

end;

procedure TfrmFIN_DRE._actPriorExecute(Sender: TObject);
begin
  FdtmFIN_DRE.cdsDRE_Caixa.Close ;
  inherited;
end;

procedure TfrmFIN_DRE.FillTreeViewCaixa ;
begin
  tbsCaixa.Enabled := True ;
  tbsCompetencia.Enabled := False ;
  FDRECaixa.FillTreeView ;
end;

procedure TfrmFIN_DRE.FillTreeViewCompetencia ;
begin
  tbsCaixa.Enabled := False ;
  tbsCompetencia.Enabled := True ;
  FDRECompetencia.FillTreeView ;
end;

procedure TfrmFIN_DRE.DoExport;
begin
  SaveDialog.Title      := 'Exportar para Excel' ;
  SaveDialog.Filter     := 'Arquivos Excel|*.xlsx' ;
  SaveDialog.DefaultExt := '.xlsx' ;

  if not SaveDialog.Execute then
    exit ;

  var LExportFileName := SaveDialog.FileName ;

  if FileExists ( LExportFileName ) then
    if not DeleteFile( LExportFileName ) then
      Raise Fail.Create( 'Não foi possível exportar o arquivo. '
           +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
(*       Raise Fail.CreateFmt( 'Não é possível exportar para o arquivo: '
           +#13#10'%s'
           +#13#10'Verifique se possui permissão de escrita na pasta'
           +#13#10'ou se o arquivo não esta sendo utilizado por outro processo.', [ FExportFileName ] ) ;
*)
  if rbCaixa.Checked then
     FDRECaixa.ExportTreeView( LExportFileName )
  else
    FDRECompetencia.ExportTreeView( LExportFileName ) ;

  ShellExecute(0,'open',PChar(LExportFileName),'','',SW_SHOWNORMAL);

end ;


initialization
  RegisterClass ( TfrmFIN_DRE ) ;

end.
