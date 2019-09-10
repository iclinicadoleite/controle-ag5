// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UEST_EntradasReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, UEST_EntradasReportDatamodule, VCL.Mask,
  JvExMask, Tc.VCL.Edits, ReportTypes, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers,
  Tc.RTL.Exceptions, Tc.VCL.Extended.Mask, System.Actions,
  Tc.VCL.Application, System.ImageList, Vcl.ImgList, Wrappers ;

type
  TEST_EntradasReportWizard = class(T_FormWizard)
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
    ImgChkProduto: TImage;
    ImgChkGrupo: TImage;
    ImageList1: TImageList;
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
  private
    { Private declarations }
    FKeyGrupo : string ;
    FKeyProduto : string ;
    EST_EntradasReportDatamodule : TEST_EntradasReportDatamodule ;
    RParams : TReportParamsEST_Entradas ;
    procedure ImageChkComboEdit( AImage : TImage ; AName : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UEST_EntradasReport;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TEST_EntradasReportWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  EST_EntradasReportDatamodule := TEST_EntradasReportDatamodule.Create( Self ) ;

  dbgResultado.ShowHighlighter := True ;

  FKeyGrupo   := '' ;
  FKeyProduto := '' ;

  ImageChkComboEdit(ImgChkGrupo, 'Grupo', '' ) ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', '' ) ;

  RParams := TReportParamsEST_Entradas.Create;
  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;
end;

procedure TEST_EntradasReportWizard.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

destructor TEST_EntradasReportWizard.Destroy;
begin
  RParams.Free;
  inherited;
end;


procedure TEST_EntradasReportWizard.edSearchGrupoButtonClick(Sender: TObject);
begin
  with TSearchTipoProduto.Create do
    try
      TextToFind := edSearchGrupo.Text ;
      if Execute then
        begin
          edSearchGrupo.Text := Result.FieldByName( 'DESCRICAO' ).asString;
          FKeyGrupo            := Result.FieldByName( 'KCAD_TIPOS' ).asString;
        end;
    finally
      Free ;
    end ;
  ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKeyGrupo ) ;
end;

procedure TEST_EntradasReportWizard.edSearchGrupoChange(Sender: TObject);
begin
  FKeyGrupo := '' ;
  rgGrupo.ItemIndex := Ord ( TReportParamsEST_Entradas.TTipoGrupoProduto.gpeSpecific ) ;
  ImageChkComboEdit(ImgChkGrupo, 'Grupo', FKeyGrupo ) ;
end;

procedure TEST_EntradasReportWizard.edSearchGrupoEnter(Sender: TObject);
begin
  ImgChkGrupo.Visible := (edSearchGrupo.Text <> '')
                      or (rgGrupo.ItemIndex = 1)
end;

procedure TEST_EntradasReportWizard.edSearchGrupoExit(Sender: TObject);
begin
  ImgChkGrupo.Visible := (edSearchGrupo.Text <> '')
                      or (rgGrupo.ItemIndex = 1)
end;

procedure TEST_EntradasReportWizard.edSearchProdutoButtonClick(Sender: TObject);
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

procedure TEST_EntradasReportWizard.edSearchProdutoChange(Sender: TObject);
begin
  FKeyProduto := '' ;
  rgProduto.ItemIndex := Ord ( TReportParamsEST_Entradas.TTipoProduto.peSpecific ) ;
  ImageChkComboEdit(ImgChkProduto, 'Produto', FKeyProduto ) ;
end;

procedure TEST_EntradasReportWizard.edSearchProdutoEnter(Sender: TObject);
begin
  ImgChkProduto.Visible := (edSearchProduto.Text <> '')
                        or (rgProduto.ItemIndex = 1 )  ;
end;

procedure TEST_EntradasReportWizard.edSearchProdutoExit(Sender: TObject);
begin
  ImgChkProduto.Visible := (edSearchProduto.Text <> '')
                        or (rgProduto.ItemIndex = 1 )  ;
end;

class function TEST_EntradasReportWizard.Execute : boolean;
var
  ThisForm: TEST_EntradasReportWizard;
begin
  ThisForm := TEST_EntradasReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TEST_EntradasReportWizard.ImageChkComboEdit(AImage: TImage; AName,
  AKeyVar: string  );
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

procedure TEST_EntradasReportWizard.rgGrupoClick(Sender: TObject);
begin
  ImgChkGrupo.Visible := rgGrupo.ItemIndex = 1 ;
  edSearchGrupo.TabStop := ImgChkGrupo.Visible ;

end;

procedure TEST_EntradasReportWizard.rgProdutoClick(Sender: TObject);
begin
  ImgChkProduto.Visible := rgProduto.ItemIndex = 1 ;
end;

procedure TEST_EntradasReportWizard._actExecuteExecute(Sender: TObject);
begin
  TEST_EntradasReport.Execute( RParams );
end;

procedure TEST_EntradasReportWizard._actNextExecute(Sender: TObject);
begin

  if     ( rgGrupo.ItemIndex = Ord ( TReportParamsEST_Entradas.TTipoGrupoProduto.gpeSpecific ) )
    and  (  FKeyGrupo = '' )  then
      Raise Warning.Create (  'Grupo inválido' ) ;

  if     ( rgProduto.ItemIndex = Ord ( TReportParamsEST_Entradas.TTipoProduto.peSpecific ) )
    and  (  FKeyProduto = '' )  then
      Raise Warning.Create (  'Produto inválido' ) ;

  RParams.ReportTitle      := 'Entradas';
  RParams.StartDate        := deDataInicial.Date;
  RParams.EndDate          := deDataFinal.Date;
  RParams.TipoGrupoProduto := TReportParamsEST_Entradas.TTipoGrupoProduto ( rgGrupo.ItemIndex) ;
  RParams.KGrupoProduto    := FKeyGrupo  ;
  RParams.TipoProduto      := TReportParamsEST_Entradas.TTipoProduto ( rgProduto.ItemIndex) ;
  RParams.KProduto         := FKeyProduto  ;
  RParams.FDataModule      := EST_EntradasReportDatamodule ;

  EST_EntradasReportDatamodule.SetReportParams( RParams );
  EST_EntradasReportDatamodule.OpenTables;

  inherited;
end;

procedure TEST_EntradasReportWizard._actPriorExecute(Sender: TObject);
begin
  EST_EntradasReportDatamodule.cdsEntradas.Close ;

  inherited;
end;

initialization
   RegisterClass ( TEST_EntradasReportWizard ) ;

end.
