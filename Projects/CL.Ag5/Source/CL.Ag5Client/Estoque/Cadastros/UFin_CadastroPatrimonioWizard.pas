unit UFin_CadastroPatrimonioWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes, JvExExtCtrls,
  JvImage, JvExtComponent, JvPanel, VCL.ImgList, VCL.DBCtrls, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvDBLookup, UFin_CadastroPatrimonioDatamodule, JvBaseEdits, JvDBControls,
  Tc.VCL.Controls.GDIButton, System.Actions, System.ImageList,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, CLAg5SvcEstoquePatrimonio,
  uImageListProvider, Wrappers ;

type
  TFin_CadastroPatrimonioWizard = class(T_FormListaFicha)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    TcMPDBDateEdit1: TTcDBDateEdit;
    dtsDepreciacao: TDataSource;
    dgbDepreciacao: TJvDBUltimGrid;
    edtData: TTcDBDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    TcMPDBDateEdit2: TTcDBDateEdit;
    Label12: TLabel;
    Label13: TLabel;
    cbStatus: TJvDBComboBox;
    Label14: TLabel;
    cbxInativos: TCheckBox;
    Label15: TLabel;
    lblUnidade: TLabel;
    dblkUnidade: TJvDBLookupCombo;
    Label16: TLabel;
    TcMPDBDateEdit3: TTcDBDateEdit;
    actFichaDepreciacao: TAction;
    actListaDepreciacao: TAction;
    DepreciacaoFicha1: TMenuItem;
    ListaDepreciao1: TMenuItem;
    btnRemoveItem: TTcGDIButton;
    Label17: TLabel;
    DBEdit3: TJvDBCalcEdit;
    DBText1: TDBText;
    DBEdit4: TJvDBCalcEdit;
    Label19: TLabel;
    edCategoria: TJvDBComboEdit;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    edSetor: TJvDBComboEdit;
    Panel2: TPanel;
    Label21: TLabel;
    DBText2: TDBText;
    edContaDepreciacao: TJvDBComboEdit;
    Label18: TLabel;
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    procedure _actSaveExecute(Sender: TObject);
    procedure cbxInativosClick(Sender: TObject);
    procedure lblUnidadeClick(Sender: TObject);
    procedure actFichaDepreciacaoExecute(Sender: TObject);
    procedure actListaDepreciacaoExecute(Sender: TObject);
    procedure btnRemoveItemClick(Sender: TObject);
    procedure edContaDepreciacaoButtonClick(Sender: TObject);
    procedure edCategoriaButtonClick(Sender: TObject);
    procedure edCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure edSetorButtonClick(Sender: TObject);
    procedure edSetorKeyPress(Sender: TObject; var Key: Char);
    procedure cbStatusChange(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
    procedure edContaDepreciacaoChange(Sender: TObject);
  private
    { Private declarations }
    FKCAD_PATRIMONIO : string;
    FCodigo          : string;
    FDescricao       : String;
    FDataCompra      : TDateTime;
    FUnidade         : String;
    FValor           : Double;
    FKFin_PlanoConta : String;
    FDescrPlanoConta : String;
    FKFin_Categoria  : String;
    FDescrcategoria  : String;
    procedure CheckCC ;
  protected
    { Protected declarations }
    procedure ChangeFilter ;
    procedure Pesquisar ; override ;
    procedure SearchPlanoDepreciacao( TextToSearch : string);
    procedure SearchSetor( TextToSearch : string);
    function  SearchCategoria(TextToSearch: string) : boolean ;
  public
    { Public declarations }
    class function Execute: string;
    class procedure NovoCadastro(var APatrimonioInfo : TPatrimonioInfo ) ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsFinanceiro, UCAD_PatrimonioReport, Exceptions,
     ThreadSuppl, UDBFinanceiro,
     CLAg5SvcEntidadesCadastroTipos,
     CLAg5SvcEstoqueCadastroTipos, //UCAD_TiposWizard,
     CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

type
  SvcEstoquePatrimonioCadastroFactory = class( TInterfacedObject, ISvcEstoquePatrimonioCadastro )
    function Execute : string  ;
    procedure NovoCadastro( var APatrimonioInfo : TPatrimonioInfo ) ;
  end;

procedure TFin_CadastroPatrimonioWizard.actFichaDepreciacaoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsPatrimonio ;
begin
  PReport := ReportTypes.TReportParamsPatrimonio.Create ;
  PReport.KCAD_PATRIMONIO := TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).cdsLstCadPatrimonioKCAD_PATRIMONIO.AsString ;
  PReport.KSYS_DOMAIN    := LoggedUser.DomainID ;
  PReport.ATIVO           := BoolToChar( cbxInativos.Checked );
  PReport.ReportTitle     := 'Relação de patrimonios';
  TqrCAD_PatrimonioReport.Execute( PReport );
  PReport.Free;
end;

procedure TFin_CadastroPatrimonioWizard.actListaDepreciacaoExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsPatrimonio ;
begin
  PReport := ReportTypes.TReportParamsPatrimonio.Create ;
  PReport.KCAD_PATRIMONIO := '' ;
  PReport.KSYS_DOMAIN    := LoggedUser.DomainID ;
  PReport.ATIVO           := BoolToChar( cbxInativos.Checked );
  PReport.ReportTitle     := 'Depreciação do patrimonio';
  TqrCAD_PatrimonioReport.Execute( PReport );
  PReport.Free;
end;

procedure TFin_CadastroPatrimonioWizard.btnRemoveItemClick(Sender: TObject);
begin
  inherited;
  TFin_CadastroPatrimonioDatamodule ( DataModuleBase ).RemoveItem ;
end;

constructor TFin_CadastroPatrimonioWizard.Create(AOwner: TComponent);
begin
  inherited;

  TFin_CadastroPatrimonioDatamodule.Create ( self ) ;
  dtsDepreciacao.DataSet :=  TFin_CadastroPatrimonioDatamodule(DatamoduleBase).cdsDepreciacao ;

  try
    DatamoduleBase.OpenTables ;
    ChangeFilter  ;
  finally
//    UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
  end ;
end;

procedure TFin_CadastroPatrimonioWizard.dtsListaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not Assigned (TFin_CadastroPatrimonioDatamodule( DatamoduleBase )) then
    exit;

  TcMPDBDateEdit3.Visible := cbStatus.ItemIndex = 1;
  Label16.Visible := cbStatus.ItemIndex = 1;
end;

procedure TFin_CadastroPatrimonioWizard.edContaDepreciacaoButtonClick(Sender: TObject);
begin
  SearchPlanoDepreciacao( TTcDBComboEdit ( Sender ).Text );
end;

procedure TFin_CadastroPatrimonioWizard.edContaDepreciacaoChange(
  Sender: TObject);
begin
  inherited;
  if not Assigned ( TFin_CadastroPatrimonioDatamodule(DatamoduleBase) ) then
     exit ;

  if ( edContaDepreciacao.Text <> TFin_CadastroPatrimonioDatamodule(DatamoduleBase).cdsCadPatrimonioDESCR_PC_NOME.asString )
  and not TFin_CadastroPatrimonioDatamodule(DatamoduleBase).cdsCadPatrimonioKFIN_PLANOCONTA.isNull then
  TFin_CadastroPatrimonioDatamodule(DatamoduleBase).cdsCadPatrimonioKFIN_PLANOCONTA.Clear ;
end;

procedure TFin_CadastroPatrimonioWizard.edSetorButtonClick(Sender: TObject);
begin
  SearchSetor(TJvDBComboEdit(Sender).Text);
end;

procedure TFin_CadastroPatrimonioWizard.edSetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      TJvDBComboEdit( Sender ).DoClick;
    end;
end;

procedure TFin_CadastroPatrimonioWizard.edCategoriaButtonClick(
  Sender: TObject);
begin
     SearchCategoria(TJvDBComboEdit(Sender).Text);
end;

procedure TFin_CadastroPatrimonioWizard.edCategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      TJvDBComboEdit( Sender ).DoClick;
    end;
end;

class function TFin_CadastroPatrimonioWizard.Execute: string;
var
  ThisForm: TFin_CadastroPatrimonioWizard;
  ModalResult: Integer;
  Results: Boolean;

begin
  ThisForm := TFin_CadastroPatrimonioWizard.Create( nil );

  try
    ThisForm.DatamoduleBase.NewRecord;
    Results := ThisForm.ShowModal = mrOK ;
    if Results then
      {ThisForm.DoSomething};

    Result := ThisForm.FKCAD_PATRIMONIO;
  finally
    ThisForm.free ;
  end ;
end;

procedure TFin_CadastroPatrimonioWizard.lblUnidadeClick(Sender: TObject);
const
  UNIDADE_MEDIDA = 2;
begin
  inherited;
  {SvcCadastroTipos.NovoTipo( UNIDADE_MEDIDA );
  TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).cdsLstUnidades.Refresh;}
  SvcEstoqueCadastroTipos.NovoTipo( CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA );
  TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).cdsLstUnidades.Refresh;
end;

class procedure TFin_CadastroPatrimonioWizard.NovoCadastro(
  var APatrimonioInfo: TPatrimonioInfo);
var
  ThisForm: TFin_CadastroPatrimonioWizard;
  ModalResult: Integer;
  Results: Boolean;

begin
  ThisForm := TFin_CadastroPatrimonioWizard.Create( nil );

  try
    ThisForm.DatamoduleBase.NewRecord;

    with TFin_CadastroPatrimonioDatamodule(ThisForm.DataModuleBase) do
     begin
       ////cdsCadPatrimonioCODIGO.AsString             := APatrimonioInfo.Codigo;
       cdsCadPatrimonioDESCRICAO.AsString          := APatrimonioInfo.Descricao;
       cdsCadPatrimonioDATA_COMPRA.AsDateTime      := APatrimonioInfo.DataCompra;
       cdsCadPatrimonioUNIDADE.AsString            := APatrimonioInfo.Unidade;
       cdsCadPatrimonioVALOR_UNITARIO.AsFloat      := APatrimonioInfo.Valor;
       cdsCadPatrimonioDATA_IMOBILIZADO.AsDateTime := APatrimonioInfo.DataCompra;
     end;

    Results := ThisForm.ShowModal = mrOK ;
    if Results then
      {ThisForm.DoSomething};

    APatrimonioInfo.KCAD_PATRIMONIO := ThisForm.FKCAD_PATRIMONIO;
    APatrimonioInfo.Codigo          := ThisForm.FCodigo;
    APatrimonioInfo.Descricao       := ThisForm.FDescricao;
    APatrimonioInfo.DataCompra      := ThisForm.FDataCompra;
    APatrimonioInfo.Valor           := ThisForm.FValor;
    APatrimonioInfo.KFin_PlanoConta := ThisForm.FKFin_PlanoConta;
    APatrimonioInfo.DescrPlanoConta := ThisForm.FDescrPlanoConta;
    APatrimonioInfo.KFin_Categoria  := ThisForm.FKFin_Categoria;
    APatrimonioInfo.DescrCategoria  := ThisForm.FDescrCategoria;

  finally
    ThisForm.free ;
  end ;
end;

procedure TFin_CadastroPatrimonioWizard.Pesquisar;
begin
  inherited ;

  if cbxInativos.checked then
  begin
    with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ), TSearchPatrimonio.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsLstCadPatrimonio.Locate( 'KCAD_PATRIMONIO',
                     Result.FieldByName( 'KCAD_PATRIMONIO' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
  end
  else
  begin
    with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ), TSearchPatrimonioAtivo.Create do
       try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsLstCadPatrimonio.Locate( 'KCAD_PATRIMONIO',
                       Result.FieldByName( 'KCAD_PATRIMONIO' ).Value, [] ) ;
               ActiveFicha ;
            end ;
       finally
          free ;
       end ;
  end
end;

function TFin_CadastroPatrimonioWizard.SearchCategoria(
  TextToSearch: string): boolean;
var
  p : TParams;
  LTIPO_APRD : string ;
begin

  with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ), TSearchPlanoContasCategoriaPatrimonioNotHideByUser.Create do
    try
      TextToFind := TextToSearch;
      APRD := [tpAtivo] ;
      if Execute then
       begin
         SetCategoria( Result.FieldByName( 'KFIN_PLANOCONTA' ).asString, Result.FieldByName( 'NOME' ).asString );
         if (cdsCadPatrimonioKFIN_CATEGORIA.asString = KAnimais_matrizes) or
            (cdsCadPatrimonioKFIN_CATEGORIA.asString = KAnimais_novilhas) or
            (cdsCadPatrimonioKFIN_CATEGORIA.asString = KTerra           ) then
          begin
            DBEdit5.ReadOnly := True;
            DBEdit4.ReadOnly := True;
          end
         else
          begin
            DBEdit5.ReadOnly := False;
            DBEdit4.ReadOnly := False;
          end;

       end;
    finally
      free;
    end;
end;

procedure TFin_CadastroPatrimonioWizard.SearchPlanoDepreciacao(TextToSearch: string);
begin
  TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).CheckCentroCustoPadrao() ;

  with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ) do
    begin
          SvcFinanceiroApropriacaoEdit.ExecuteTela( 'CAD_PATRIMONIOS',
                                              cdsCADPatrimonio,
                                              cdsApropriacao,
                                              TelaPatrimonio,
                                              [tpDespesas] );
    end ;
end;

procedure TFin_CadastroPatrimonioWizard.SearchSetor(TextToSearch: string);
begin
  with TFin_CadastroPatrimonioDatamodule(DataModuleBase), TSearchCentroCustoSetorAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        SetSetor ( Result.FieldByName('KFIN_CENTROCUSTO').asString, Result.FieldByName('NOME').asString )  ;
    finally
      free;
    end;
end;

procedure TFin_CadastroPatrimonioWizard._actSaveExecute(Sender: TObject);
begin
  with TFin_CadastroPatrimonioDatamodule(DataModuleBase) do
  begin
    if cdsCadPatrimonio.State in [dsEdit, dsInsert] then
      begin
        //FKCAD_PATRIMONIO := cdsCadPatrimonioKCAD_PATRIMONIO.AsString;
        ValidaCampos;
        cdsCadPatrimonio.Post;
      end;

    FKCAD_PATRIMONIO := cdsCadPatrimonioKCAD_PATRIMONIO.AsString;
    FCodigo          := cdsCadPatrimonioCODIGO.AsString;
    FDescricao       := cdsCadPatrimonioDESCRICAO.AsString;
    FDataCompra      := cdsCadPatrimonioDATA_COMPRA.AsDateTime;
    FUnidade         := cdsCadPatrimonioUNIDADE.AsString;
    FValor           := cdsCadPatrimonioVALOR_UNITARIO.AsFloat;
    FKFin_PlanoConta := cdsCadPatrimonioKFIN_PLANOCONTA.AsString;
    FDescrPlanoConta := cdsCadPatrimonioDESCR_PC_NOME.AsString;
    FKFin_Categoria  := cdsCadPatrimonioKFIN_CATEGORIA.AsString;
    FDescrcategoria  := cdsCadPatrimonioNOMECATEGORIA.AsString;
    gerarDepreciacao;
{
    cdsDepreciacao.First ;
    cdsDepreciacao.DisableControls ;
    try
      while not cdsDepreciacao.Eof do
        begin
          if cdsDepreciacaoKFIN_PLANOCONTA.IsNull then
            raise Warning.Create('Existe(m) depreciação(ções) sem conta bancária definida.');

          cdsDepreciacao.Next;
        end;
    finally
      cdsDepreciacao.First ;
      cdsDepreciacao.EnableControls ;
    end;
}  end;
  checkCC ;

  inherited;

  if fsModal in FormState then
       ModalResult := mrOK ;
end;

function TFin_CadastroPatrimonioWizard._dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  with TFin_CadastroPatrimonioDatamodule(DataModuleBase) do
    Result := Assigned (Field) and (Field = cdsLstCadPatrimonioATIVO);

  StringForTrue := 'T';
  StringForFalse := 'F';
end;

procedure TFin_CadastroPatrimonioWizard.cbStatusChange(Sender: TObject);
begin
  TcMPDBDateEdit3.Visible := cbStatus.ItemIndex = 1;
  Label16.Visible := cbStatus.ItemIndex = 1;
end;

procedure TFin_CadastroPatrimonioWizard.cbxInativosClick(Sender: TObject);
begin
  inherited;
//  UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;
  ThreadSuppl.TSyncThread.Create (  ChangeFilter ) ;
end;

procedure TFin_CadastroPatrimonioWizard.ChangeFilter;
begin
  TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).SetFilter(cbxInativos.Checked);
end;

procedure TFin_CadastroPatrimonioWizard.CheckCC;
begin

  with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ) do
    if cdsApropriacao.IsEmpty then
       SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( TFin_CadastroPatrimonioDatamodule( DatamoduleBase ).cdsApropriacao )
{
  with TFin_CadastroPatrimonioDatamodule( DatamoduleBase ) do
    if ( cdsCadPatrimonioKFIN_PLANOCONTA.AsString.Trim <> '' ) then
      if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsCadPatrimonioKFIN_PLANOCONTA.AsString ) then
        if cdsApropriacao.IsEmpty then
          SearchPlanoDepreciacao('');
}
end;

{ SvcFinanceiroPatrimonioFactory }

function SvcEstoquePatrimonioCadastroFactory.Execute: string;
begin
   Result := TFin_CadastroPatrimonioWizard.Execute ;
end;

procedure SvcEstoquePatrimonioCadastroFactory.NovoCadastro(
  var APatrimonioInfo: TPatrimonioInfo);
begin
  TFin_CadastroPatrimonioWizard.NovoCadastro( APatrimonioInfo );
end;

initialization
  RegisterClass ( TFin_CadastroPatrimonioWizard ) ;
  SvcEstoquePatrimonioCadastro := SvcEstoquePatrimonioCadastroFactory.Create ;
finalization
  SvcEstoquePatrimonioCadastro := nil ;
end.

