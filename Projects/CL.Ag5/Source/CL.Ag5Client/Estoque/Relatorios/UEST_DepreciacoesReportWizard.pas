// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UEST_DepreciacoesReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, UEST_DepreciacoesReportDatamodule, VCL.Mask,
  JvExMask, Tc.VCL.Edits, ReportTypes, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, Tc.RTL.Exceptions,
  System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, System.ImageList,
  Vcl.ImgList, Wrappers ;

type
  TEST_DepreciacoesReportWizard = class(T_FormWizard)
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
    ImageList1: TImageList;
    PnlChkCentroCusto: TPanel;
    ImgChkCentroCusto: TImage;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgResultadoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edSearchCentroCustoChange(Sender: TObject);
    procedure edSearchCentroCustoButtonClick(Sender: TObject);
    procedure rgCentroCustoClick(Sender: TObject);
    procedure edSearchCentroCustoEnter(Sender: TObject);
    procedure edSearchCentroCustoExit(Sender: TObject);
  private
    { Private declarations }
    FKeyCentroCusto : string ;
    EST_DepreciacoesReportDatamodule : TEST_DepreciacoesReportDatamodule ;
    RParams : TReportParamsEST_Depreciacoes ;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UEST_DepreciacoesReport;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TEST_DepreciacoesReportWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  FKeyCentroCusto        := '' ;

  EST_DepreciacoesReportDatamodule := TEST_DepreciacoesReportDatamodule.Create( Self ) ;

  dbgResultado.ShowHighlighter := True ;

  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', '' ) ;

  RParams := TReportParamsEST_Depreciacoes.Create;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;
end;

procedure TEST_DepreciacoesReportWizard.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

destructor TEST_DepreciacoesReportWizard.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TEST_DepreciacoesReportWizard.edSearchCentroCustoButtonClick(
  Sender: TObject);
begin
  with TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := edSearchCentroCusto.Text ;
      if Execute then
        begin
          edSearchCentroCusto.Text := Result.FieldByName( 'NOME' ).asString;
          FKeyCentroCusto          := Result.FieldByName( 'KFIN_CENTROCUSTO' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TEST_DepreciacoesReportWizard.edSearchCentroCustoChange(
  Sender: TObject);
begin
  FKeyCentroCusto := '' ;
  rgCentroCusto.ItemIndex := Ord ( TReportParamsEST_Depreciacoes.TTipoCentroCustoDepreciacoes.ccdSpecific ) ;
  ImageChkComboEdit(ImgChkCentroCusto, 'Centro de custo', FKeyCentroCusto ) ;
end;

procedure TEST_DepreciacoesReportWizard.edSearchCentroCustoEnter(
  Sender: TObject);
begin
  ImgChkCentroCusto.Visible :=  (edSearchCentroCusto.Text <> '')
                             or (rgCentroCusto.ItemIndex = 2) ;
end;

procedure TEST_DepreciacoesReportWizard.edSearchCentroCustoExit(
  Sender: TObject);
begin
  ImgChkCentroCusto.Visible :=  (edSearchCentroCusto.Text <> '')
                             or (rgCentroCusto.ItemIndex = 2) ;
end;

class function TEST_DepreciacoesReportWizard.Execute : boolean;
var
  ThisForm: TEST_DepreciacoesReportWizard;
begin
  ThisForm := TEST_DepreciacoesReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TEST_DepreciacoesReportWizard.ImageChkComboEdit(AImage: TImage; ANAme,
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

procedure TEST_DepreciacoesReportWizard.rgCentroCustoClick(Sender: TObject);
begin
  ImgChkCentroCusto.Visible := rgCentroCusto.ItemIndex = 2 ;
end;

procedure TEST_DepreciacoesReportWizard._actExecuteExecute(Sender: TObject);
begin
  dtsResultado.Enabled := False ;
  TEST_DepreciacoesReport.Execute( RParams );
  dtsResultado.Enabled := True ;
end;

procedure TEST_DepreciacoesReportWizard._actNextExecute(Sender: TObject);
begin

  if  ( rgCentroCusto.ItemIndex = Ord ( TReportParamsEST_Depreciacoes.TTipoCentroCustoDepreciacoes.ccdSpecific ) )
    and  (  FKeyCentroCusto = '' )  then
      Raise Warning.Create (  'Centro de custo inválido' ) ;

  RParams.ReportTitle      := 'Depreciações';
  RParams.StartDate        := deDataInicial.Date;
  RParams.EndDate          := deDataFinal.Date;
  RParams.TipoCentroCusto   := TReportParamsEST_Depreciacoes.TTipoCentroCustoDepreciacoes ( rgCentroCusto.ItemIndex) ;
  RParams.KCentroCusto      := FKeyCentroCusto  ;
  RParams.FDataModule      := EST_DepreciacoesReportDatamodule ;

  EST_DepreciacoesReportDatamodule.SetReportParams( RParams );
  EST_DepreciacoesReportDatamodule.OpenTables;

  inherited;
end;

procedure TEST_DepreciacoesReportWizard._actPriorExecute(Sender: TObject);
begin
  EST_DepreciacoesReportDatamodule.cdsDepreciacoes.Close ;

  inherited;
end;

initialization
   RegisterClass ( TEST_DepreciacoesReportWizard ) ;

end.
