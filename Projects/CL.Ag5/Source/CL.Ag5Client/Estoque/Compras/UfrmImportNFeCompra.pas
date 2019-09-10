unit UfrmImportNFeCompra;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, Vcl.Mask, Tc.VCL.Extended.Mask,
  Tc.VCL.Edits, System.Actions, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid,
  UdtmCDSToXMLNFe, Vcl.DBCtrls,
  Tc.DBRTL.AbstractDB, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  XMLIntf, XMLDoc,
  SQLSuppl, Data.SqlExpr, Tc.VCL.Application, JvExStdCtrls, JvCombobox,
  System.ImageList, Vcl.ImgList, Wrappers  ;

type

  TNFeProduto = record
    KEST_PRODUTO      : string ;
    CodigoDoFornecedor  : string ;
    NomeDoFornecedor    : string ;
//    CodigoEstoque     : string ;
//    NomeEstoque       : string ;
    CFOP : string ;
    CST_CSOSN : string ;
    UnidadeCompra : string ;
    QtdeCompra : double ;
    UnitarioCompra : double ;
    ValorSeguro: double ;
    ValorFrete: double ;
    ValorDesconto: double ;
    ValorIPI : double;
    KCAD_PATRIMONIO: string;
  end;

  TNFeProdutoArray = TArray<TNFeProduto> ;

  TNFeDuplicata = record
    Documento : string ;
    Data  : TDateTime ;
    Valor    : double ;
  end;

  TNFeDuplicataArray = TArray<TNFeDuplicata> ;

  TNFeInfo = record
    ChaveNFe : string ;
    NotaFiscal : string ;
    Serie : string ;
    Modelo : integer ;
    Emissao : TDateTime ;
    KFornecedor : string ;
    NomeFornecedor : string ;
    Produtos : TNFeProdutoArray ;
    Duplicatas : TNFeDuplicataArray ;
    ValorSeguro: double ;
    ValorFrete: double ;
    ValorDesconto: double ;
    Observacoes : string ;
    XMLFileName : string ;
  end;

  TVinculoProduto = record
    KEST_PRODUTO      : string ;
    PANEL : TPanel ;
    LabelDescricao : TLabel ;
    ImgStatus      : TImage ;
    LabelStatus    : TLabel ;
    LabelVinculo   : TLabel ;
    jvcmbTipo      : TJvComboBox;
    LabelCadastro  : TLabel ;
    KCAD_PATRIMONIO   : string;
  end ;

  TVinculoProdutoArray = TArray<TVinculoProduto> ;

  TfrmImportNFeCompra = class(T_FormWizard)
    TabSheet1: TTabSheet;
    tbsNFOutroCNPJ: TTabSheet;
    tbsFornecedor: TTabSheet;
    TcFilenameEdit1: TTcFilenameEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet4: TTabSheet;
    DBEdit2: TLabel;
    DBEdit3: TLabel;
    TcGDIButton1: TTcGDIButton;
    DBEdit4: TLabel;
    TcGDIButton2: TTcGDIButton;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox2: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblCNPJFazenda: TLabel;
    Label12: TLabel;
    lblCNPJDestinario: TLabel;
    tbsNFExistente: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblDocumento: TLabel;
    lblSerie: TLabel;
    Label16: TLabel;
    lblNomeFornecedor: TLabel;
    edtEmitenteCNPJ: TLabel;
    edtEmitenteRazaoSocial: TLabel;
    edtEmitenteNomeFantasia: TLabel;
    JvComboBox1: TJvComboBox;
    ImgChkProduto: TImage;
    ImageList1: TImageList;
    Image1: TImage;
    Image2: TImage;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dtmCDSToXMLNFe : TdtmCDSToXMLNFe ;
    FXMLFileName : string ;
    FVinculoProdutoArray : TVinculoProdutoArray ;
    FKFornecedor : string ;
    FProximaDataFechamento : TDateTime ;
    FNomeFornecedor : string ;
    function GetEncerramentoMensal : TDateTime ;
    function SearchFornecedor( const ACNPJ : string; var ANomeFornecedor : string ): string ;
    function SearchProduto( const AChaveFornecedor, ACodigoProduto: string ; var ACodigoEstoque : string ; var ANomeEstoque : string ; var AUnidadeEstoque : string ) : string;
    procedure CreatePanelProdutos ;
    procedure FreePanelsProdutos;
    function CheckMesEncerrado : boolean ;
    procedure LabelCadastrarProduto ( Sender : TObject ) ;
    procedure LabelVincularProduto ( Sender : TObject ) ;
    procedure LabelMouseEnter ( Sender : TObject ) ;
    procedure LabelMouseLeave ( Sender : TObject ) ;
    procedure jvcmbTipoChange ( Sender : TObject );
    procedure GetProdutosCadastados( var NFeInfo : TNFeInfo ) ;
    procedure Processar( var NFeInfo : TNFeInfo ) ;
    function CheckCNPJDestinatario(ACNPJ: string ; out LCPFCNPJ : string ) : boolean ;
    procedure ImageStatus(const AImage: TImage; const AName : string ; const ACadastrado: boolean );
    function ValidNFe : boolean ;
  public
    { Public declarations }
    class function Execute( var NFeInfo : TNFeInfo ) : boolean; reintroduce ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses CLAg5SvcEntidadesCadastroFornecedores,
     CLAg5SvcEstoqueProdutos,
     CLAg5SvcEstoquePatrimonio,
     Data.SQLTimSt, Math, DateUtils,
     SpedUtil,
     SearchsFinanceiro ;

const
    _TIPO_ITEM_PRODUTO_SERVICO = 0;
    _TIPO_ITEM_PATRIMONIO      = 1;

{$R *.dfm}

{ TfrmCustomWizard }
{
function TfrmImportNFeCompra.CheckCNPJDestinatario(ACNPJ: string ; out LCPFCNPJ : string ) : boolean ;
const
  _SQL =
    'SELECT CPF_CNPJ FROM CAD_ENTIDADES WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE' ;
var
  p : TParams;
  CDS : TClientDataSet ;
begin
  p.CreateParam( ftString, 'KCAD_ENTIDADE',  ptInput ).AsString  := LoggedUser.DomainID;
  cds := nil ;
  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( CDS, _SQL, p );
  LCPFCNPJ := CDS.FieldByName('CPF_CNPJ').AsString ;
  cds.Free ;
  p.free ;
  Result := ACNPJ = LCPFCNPJ ;
end;
}


function TfrmImportNFeCompra.CheckCNPJDestinatario(ACNPJ: string ; out LCPFCNPJ : string ) : boolean ;
const
  _SQL =
    'SELECT CPF_CNPJ FROM CAD_ENTIDADES WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE' ;
var
  ISQL : ISQLSuppl ;
begin
  ISQL := TTcAbstractDB.GetByAlias('ENTIDADES').ISQL( _SQL ) ;
  ISQL.SQLParam ( 'KCAD_ENTIDADE' ).AsString  := LoggedUser.DomainID;
  LCPFCNPJ := ISQL.GetDS.FieldByName('CPF_CNPJ').AsString ;
  Result := ACNPJ = LCPFCNPJ ;
end;

constructor TfrmImportNFeCompra.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

procedure TfrmImportNFeCompra.FormShow(Sender: TObject);
begin
  inherited;
  TcFilenameEdit1.SetFocus ;
end;

procedure TfrmImportNFeCompra.FreePanelsProdutos;
var
   I : integer ;
begin
  for i := Low ( FVinculoProdutoArray ) to High( FVinculoProdutoArray ) do
      FVinculoProdutoArray[i].Panel.Free ;
  SetLength ( FVinculoProdutoArray, 0  ) ;
end;

function TfrmImportNFeCompra.GetEncerramentoMensal: TDateTime;
const
 _SELECT_ANO_MES =
   'SELECT MAX(ANO_MES) ANO_MES FROM EST_ENCERRAMENTO_MES WHERE ENCERRADO = ''T''' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  Result := 0 ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cds, _SELECT_ANO_MES );
  if ( not cds.IsEmpty ) and (cds.Fields[0].AsString.Trim <> '') then
    Result := IncMonth ( EncodeDate (
      Copy ( cds.Fields[0].AsString, 1, 4 ).ToInteger,
      Copy ( cds.Fields[0].AsString, 5, 2 ).ToInteger,
      1 ), 1 ) ;
  cds.Free ;
end;

procedure TfrmImportNFeCompra.ImageStatus(const AImage: TImage; const AName : string ; const ACadastrado: boolean );
begin

  if ACadastrado then
    begin
      AImage.Hint := AName + ' cadastrado.'  ;
      ImageList1.GetIcon( 0, AImage.Picture.Icon ) ;
    end
  else
    begin
      AImage.Hint := AName + ' não cadastrado.' ;
      ImageList1.GetIcon( 2, AImage.Picture.Icon ) ;
    end;
  AImage.Refresh ;
end;

procedure TfrmImportNFeCompra.jvcmbTipoChange(Sender: TObject);
var
  LIndex : Integer;
begin
  LIndex := TJvComboBox( Sender ).Tag ;
  if TJvComboBox ( Sender ).ItemIndex = _TIPO_ITEM_PATRIMONIO then
    begin
      FVinculoProdutoArray[ LIndex ].LabelVinculo.Visible := False ;
    end
  else
    begin
      FVinculoProdutoArray[ LIndex ].LabelVinculo.Visible := True ;
    end;

end;

procedure TfrmImportNFeCompra.CreatePanelProdutos;
var
  LPanel : TPanel ;
  LIndex : integer ;
  LCodigoEstoque : string ;
  LNomeEstoque : string ;
  LUnidadeEstoque : string ;
begin
  LPanel :=  TPanel.Create( nil );
  LPanel.Color := clWhite ;
  LPanel.Parent := ScrollBox1 ;

  LIndex := Length ( FVinculoProdutoArray ) ;
  SetLength( FVinculoProdutoArray, LIndex + 1 ) ;
  FVinculoProdutoArray[ LIndex ].PANEL := LPanel ;
  FVinculoProdutoArray[ LIndex ].KEST_PRODUTO := SearchProduto( FKFornecedor, dtmCDSToXMLNFe.ProdutoCodigo.asString,
                                LCodigoEstoque, LNomeEstoque, LUnidadeEstoque ) ;


  with LPanel do
    begin
     if Odd ( LIndex ) then
       Color := clSilver ;
     Left := 3 ;
     Top := 46 * (LIndex + 1) ;
     Width := 774 ;
     Height := 46 ;
     Caption := ' ';
     TabOrder := 1 ;
     Align := alTop ;
     Tag := LIndex ;
    end ;

  with TLabel.Create( LPanel ) do
    begin
     Parent := LPanel ;
     Left := 90 ;
     Top := 2 ;
     Width := 262 ;
     Height := 32 ;
     AutoSize := False ;
     Caption := dtmCDSToXMLNFe.ProdutoCodigo.asString
     + ' - ' +  dtmCDSToXMLNFe.ProdutoNome.AsString ;
     Tag := LIndex ;
    end ;

  FVinculoProdutoArray[ LIndex ].LabelDescricao := TLabel.Create( LPanel ) ;
  with FVinculoProdutoArray[ LIndex ].LabelDescricao do
    begin
     Parent := LPanel ;
     Left := 409 ;
     Top := 0 ;
     Width := 262 ;
     Height := 32 ;
     AutoSize := False ;

     if FVinculoProdutoArray[ LIndex ].KEST_PRODUTO = '' then
       Caption := dtmCDSToXMLNFe.ProdutoCodigo.asString
       + ' - ' +  dtmCDSToXMLNFe.ProdutoNome.AsString
     else
       Caption := LCodigoEstoque
       + ' - ' +  LNomeEstoque ;

     Tag := LIndex ;
    end ;

  FVinculoProdutoArray[ LIndex ].ImgStatus := TImage.Create( LPanel ) ;
  with FVinculoProdutoArray[ LIndex ].ImgStatus do
    begin
       Parent := LPanel ;
       Left := 390 ;
       Top := 27 ;
       Width := 16 ;
       Height := 16 ;
       Cursor := crHelp ;
       ParentShowHint := False ;
       ShowHint := True ;
       Transparent := True ;
       Visible := True ;
    end ;
  ImageStatus(
      FVinculoProdutoArray[ LIndex ].ImgStatus
    , ''
    ,   (FVinculoProdutoArray[ LIndex ].KEST_PRODUTO <> '')
     or (FVinculoProdutoArray[ LIndex ].KCAD_PATRIMONIO <> '')
  );

  FVinculoProdutoArray[ LIndex ].LabelStatus := TLabel.Create( LPanel ) ;
  with FVinculoProdutoArray[ LIndex ].LabelStatus do
    begin
     Parent := LPanel ;
     Left := 409 ;
     Top := 28 ;
     Width := 45 ;
     Height := 13 ;
     StyleElements := StyleElements - [seFont] ;
     if FVinculoProdutoArray[ LIndex ].KEST_PRODUTO = '' then
       begin
         Font.Color := clMaroon ;
         Caption := 'não cadastrado'
       end
     else
       begin
         Font.Color := clNavy ;
         Caption := 'cadastrado' ;
       end;
     Tag := LIndex ;
    end ;



  FVinculoProdutoArray[ LIndex ].LabelVinculo := TLabel.Create( LPanel ) ;
  // with TLabel.Create( LPanel ) do
  with FVinculoProdutoArray[ LIndex ].LabelVinculo do
    begin
     Parent := LPanel ;
     Left := 491 ;
     Top := 28 ;
     Width := 68 ;
     Height := 13 ;
     Caption := 'alterar v'#237'nculo' ;
     Cursor := crHandPoint ;
     Font.Color := clNavy ;
     OnClick := LabelVincularProduto ;
     OnMouseEnter := LabelMouseEnter ;
     OnMouseLeave := LabelMouseLeave ;
     Tag := LIndex ;
     Visible := FVinculoProdutoArray[ LIndex ].KEST_PRODUTO = '' ;
    end ;


  FVinculoProdutoArray[ LIndex ].jvcmbTipo := TJvComboBox.Create( LPanel ) ;
  with FVinculoProdutoArray[ LIndex ].jvcmbTipo do
    begin
     Parent := LPanel ;
     Left := 572 ;
     Top := 23 ;
     Width := 105 ;
     Items.Add('Produto/Serviço');
     Items.Add('Patrimônio');
     ItemIndex:= 0;
     OnChange := jvcmbTipoChange;
     Style:= csDropDownList;
     Font.Color := clNavy ;
     Tag := LIndex ;
     Visible := FVinculoProdutoArray[ LIndex ].KEST_PRODUTO = '' ;
    end ;

  FVinculoProdutoArray[ LIndex ].LabelCadastro := TLabel.Create( LPanel ) ;
  with FVinculoProdutoArray[ LIndex ].LabelCadastro do
    begin
     Parent := LPanel ;
     //Left := 589 ;
     Left := 687 ;
     Top := 28 ;
     Width := 46 ;
     Height := 13 ;
     Cursor := crHandPoint ;
     Font.Color := clNavy ;
     Caption := 'cadastrar' ;
     OnClick := LabelCadastrarProduto ;
     OnMouseEnter := LabelMouseEnter ;
     OnMouseLeave := LabelMouseLeave ;
     Tag := LIndex ;
     Visible := FVinculoProdutoArray[ LIndex ].KEST_PRODUTO = '' ;
    end ;

end;

destructor TfrmImportNFeCompra.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TfrmImportNFeCompra.Execute ( var NFeInfo : TNFeInfo ) : boolean;
var
  ThisForm: TfrmImportNFeCompra;
begin
  ThisForm := TfrmImportNFeCompra.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;

      if Result then
         ThisForm.Processar ( NFeInfo )
      else
         ThisForm.GetProdutosCadastados( NFeInfo ) ;
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TfrmImportNFeCompra.LabelCadastrarProduto(Sender: TObject);
var
  ProdutoInfo : TProdutoInfo ;
  PatrimonioInfo: TPatrimonioInfo;
  LIndex : integer ;
begin
  LIndex := TLabel( Sender ).Tag  ;
  dtmCDSToXMLNFe.Detalhe.RecNo := LIndex + 1 ;
  if FVinculoProdutoArray[ LIndex ].jvcmbTipo.ItemIndex = _TIPO_ITEM_PRODUTO_SERVICO then
    begin
      ProdutoInfo.Nome := dtmCDSToXMLNFe.ProdutoNOME.AsString;
      ProdutoInfo.TipoProduto := tpInsumo ;

      if FProximaDataFechamento > 0 then
        ProdutoInfo.DataEstoque := Min ( dtmCDSToXMLNFe.IdentificacaoEMISSAO.AsDateTime, FProximaDataFechamento )
      else
        ProdutoInfo.DataEstoque := StartOfTheMonth( dtmCDSToXMLNFe.IdentificacaoEMISSAO.AsDateTime ) ;

      SvcEstoqueProdutosCadastro.NovoCadastro( ProdutoInfo );
      if ProdutoInfo.KEST_PRODUTO <> ''  then
        begin
          FVinculoProdutoArray[ LIndex ].KEST_PRODUTO     := ProdutoInfo.KEST_PRODUTO ;
          FVinculoProdutoArray[ LIndex ].LabelDescricao.Caption := ProdutoInfo.CODIGO + ' - ' + ProdutoInfo.NOME;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Font.Color := clNavy ;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Caption := 'cadastrado' ;
          FVinculoProdutoArray[ LIndex ].jvcmbTipo.Enabled := False;
          FVinculoProdutoArray[ LIndex ].LabelCadastro.Visible := False ;
          ImageStatus(FVinculoProdutoArray[ LIndex ].ImgStatus, 'Produto', True );

        end;
    end
  else
  if FVinculoProdutoArray[ LIndex ].jvcmbTipo.ItemIndex = _TIPO_ITEM_PATRIMONIO then
    begin
      PatrimonioInfo.Descricao  := dtmCDSToXMLNFe.ProdutoNOME.AsString;
      /////////PatrimonioInfo.Codigo     := dtmCDSToXMLNFe.ProdutoCodigo.AsString;
      PatrimonioInfo.DataCompra := dtmCDSToXMLNFe.IdentificacaoDataSaidaEntrada.AsDateTime;
      PatrimonioInfo.Unidade    := dtmCDSToXMLNFe.ProdutoUnidComercial.AsString;
      PatrimonioInfo.Valor      := dtmCDSToXMLNFe.ProdutoValorUnitarioComercial.AsFloat;
      SvcEstoquePatrimonioCadastro.NovoCadastro( PatrimonioInfo );

      if PatrimonioInfo.KCAD_PATRIMONIO <> ''  then
        begin
          FVinculoProdutoArray[ LIndex ].KCAD_PATRIMONIO:= PatrimonioInfo.KCAD_PATRIMONIO;
          FVinculoProdutoArray[ LIndex ].LabelDescricao.Caption := PatrimonioInfo.Codigo + ' - ' + PatrimonioInfo.Descricao;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Font.Color := clNavy ;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Caption := 'Patrimônio' ;
          FVinculoProdutoArray[ LIndex ].jvcmbTipo.Enabled := False;
          FVinculoProdutoArray[ LIndex ].LabelCadastro.Visible := False ;
          ImageStatus(FVinculoProdutoArray[ LIndex ].ImgStatus, 'Patrimônio', True );
        end;
    end;
end;

procedure TfrmImportNFeCompra.LabelMouseEnter(Sender: TObject);
begin
  TLabel ( Sender ).Font.Style :=  TLabel ( Sender ).Font.Style + [fsUnderline] ;
end;

procedure TfrmImportNFeCompra.LabelMouseLeave(Sender: TObject);
begin
  TLabel ( Sender ).Font.Style :=  TLabel ( Sender ).Font.Style - [fsUnderline] ;
end;

procedure TfrmImportNFeCompra.LabelVincularProduto(Sender: TObject);
var
  LIndex : integer ;
begin
  LIndex := TLabel( Sender ).Tag ;

  dtmCDSToXMLNFe.Detalhe.RecNo := LIndex + 1 ;

  with TSearchProdutoInsumoServicoAtivo.Create do
    try
      UseOrOnWhere := True ;
      TextToFind := dtmCDSToXMLNFe.ProdutoNOME.AsString; ;
      if Execute then
        begin
          FVinculoProdutoArray[ LIndex ].KEST_PRODUTO    := Result.FieldByName( 'KEST_PRODUTO' ).AsString ;
          FVinculoProdutoArray[ LIndex ].LabelDescricao.Caption := Result.FieldByName( 'CODIGO' ).AsString + ' - ' + Result.FieldByName( 'NOME' ).AsString  ;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Font.Color := clNavy ;
          FVinculoProdutoArray[ LIndex ].LabelStatus.Caption := 'cadastrado' ;
          FVinculoProdutoArray[ LIndex ].LabelCadastro.Visible := False ;
          ImageStatus(FVinculoProdutoArray[ LIndex ].ImgStatus, 'Produto', True );
        end ;
    finally
      free ;
    end ;
end;


procedure TfrmImportNFeCompra.GetProdutosCadastados( var NFeInfo : TNFeInfo ) ;
var
  I : integer ;
  LIndex : integer ;
begin

  LIndex := -1 ;

  for I := Low( FVinculoProdutoArray ) to High( FVinculoProdutoArray ) do
     begin
       if   ( FVinculoProdutoArray[ LIndex ].KEST_PRODUTO    <> '' )
         or ( FVinculoProdutoArray[ LIndex ].KCAD_PATRIMONIO <> '' ) then
         begin
           LIndex := Length( NFeInfo.Produtos );

           dtmCDSToXMLNFe.Detalhe.RecNo := LIndex + 1 ;
           SetLength ( NFeInfo.Produtos, LIndex + 1 ) ;

           NFeInfo.Produtos[ LIndex ].KEST_PRODUTO        := FVinculoProdutoArray[ LIndex ].KEST_PRODUTO;

           NFeInfo.Produtos[ LIndex ].KCAD_PATRIMONIO     := FVinculoProdutoArray[ LIndex ].KCAD_PATRIMONIO;

           NFeInfo.Produtos[ LIndex ].CodigoDoFornecedor  := dtmCDSToXMLNFe.ProdutoCODIGO.asString ;
           NFeInfo.Produtos[ LIndex ].NomeDoFornecedor    := dtmCDSToXMLNFe.ProdutoNOME.asString ;
         end;

     end;

  if LIndex >  -1 then
    begin
      NFeInfo.KFornecedor    := FKFornecedor ;
      NFeInfo.NomeFornecedor := FNomeFornecedor;
    end;

end;

procedure TfrmImportNFeCompra.Processar( var NFeInfo : TNFeInfo ) ;
var
  I : integer ;
  LIndex : integer ;
begin

  NFeInfo.ChaveNFe       := dtmCDSToXMLNFe.ChaveAcesso ;
  NFeInfo.NotaFiscal     := dtmCDSToXMLNFe.IdentificacaoDocumento.asString ;
  NFeInfo.Serie          := dtmCDSToXMLNFe.IdentificacaoSerie.asString ;
  NFeInfo.Modelo         := dtmCDSToXMLNFe.IdentificacaoModelo.asInteger ;
  NFeInfo.Emissao        := dtmCDSToXMLNFe.IdentificacaoEMISSAO.AsDateTime ;
  NFeInfo.KFornecedor    := FKFornecedor ;
  NFeInfo.NomeFornecedor := FNomeFornecedor;

  NFeInfo.ValorSeguro   := dtmCDSToXMLNFe.NF_IcmsValorSeguro.asFloat ;
  NFeInfo.ValorFrete    := dtmCDSToXMLNFe.NF_IcmsValorFrete.asFloat ;
  NFeInfo.ValorDesconto := dtmCDSToXMLNFe.NF_IcmsValorDesconto.asFloat ;

  NFeInfo.XMLFileName := FXMLFileName ;

  NFeInfo.Observacoes := '' ;
  dtmCDSToXMLNFe.DadosAdicionais.First ;
  while not dtmCDSToXMLNFe.DadosAdicionais.Eof do
    begin
     NFeInfo.Observacoes := NFeInfo.Observacoes + dtmCDSToXMLNFe.DadosAdicionaisInfComplementar.AsString ;
     dtmCDSToXMLNFe.DadosAdicionais.next ;
    end;


  for I := Low( FVinculoProdutoArray ) to High( FVinculoProdutoArray ) do
     begin
       LIndex := Length( NFeInfo.Produtos );
       dtmCDSToXMLNFe.Detalhe.RecNo := LIndex + 1 ;
       SetLength ( NFeInfo.Produtos, LIndex + 1 ) ;

       NFeInfo.Produtos[ LIndex ].KEST_PRODUTO        := FVinculoProdutoArray[ LIndex ].KEST_PRODUTO;

       NFeInfo.Produtos[ LIndex ].KCAD_PATRIMONIO     := FVinculoProdutoArray[ LIndex ].KCAD_PATRIMONIO;

       NFeInfo.Produtos[ LIndex ].CodigoDoFornecedor  := dtmCDSToXMLNFe.ProdutoCODIGO.asString ;
       NFeInfo.Produtos[ LIndex ].NomeDoFornecedor    := dtmCDSToXMLNFe.ProdutoNOME.asString ;

       NFeInfo.Produtos[ LIndex ].ValorIPI            := dtmCDSToXMLNFe.IPITributadoValorIPI.AsFloat;

       NFeInfo.Produtos[ LIndex ].CFOP              := dtmCDSToXMLNFe.ProdutoCFOP.asString ;

       if not dtmCDSToXMLNFe.ICMS00.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS00Origem.asString + '00' ;
       if not dtmCDSToXMLNFe.ICMS10.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS10Origem.asString + '10' ;
       if not dtmCDSToXMLNFe.ICMS20.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS20Origem.asString + '20' ;
       if not dtmCDSToXMLNFe.ICMS30.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS30Origem.asString + '30' ;
       if not dtmCDSToXMLNFe.ICMS40.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS40Origem.asString + '40' ;
       if not dtmCDSToXMLNFe.ICMS51.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS51Origem.asString + '51' ;
       if not dtmCDSToXMLNFe.ICMS60.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS60Origem.asString + '60' ;
       if not dtmCDSToXMLNFe.ICMS70.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS70Origem.asString + '70' ;
       if not dtmCDSToXMLNFe.ICMS90.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMS90Origem.asString + '90' ;

       if not dtmCDSToXMLNFe.ICMSSN101.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN101Orig.asString + '101' ;
       if not dtmCDSToXMLNFe.ICMSSN102.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN102Orig.asString + '102' ;
       if not dtmCDSToXMLNFe.ICMSSN201.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN201Orig.asString + '201' ;
       if not dtmCDSToXMLNFe.ICMSSN202.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN202Orig.asString + '202' ;
       if not dtmCDSToXMLNFe.ICMSSN500.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN500Orig.asString + '500' ;
       if not dtmCDSToXMLNFe.ICMSSN900.IsEmpty then NFeInfo.Produtos[ LIndex ].CST_CSOSN         := dtmCDSToXMLNFe.ICMSSN900Orig.asString + '900' ;

       NFeInfo.Produtos[ LIndex ].UnidadeCompra     := dtmCDSToXMLNFe.ProdutoUnidComercial.asString ;
       NFeInfo.Produtos[ LIndex ].QtdeCompra        := dtmCDSToXMLNFe.ProdutoQtdeComercial.asFloat ;
       NFeInfo.Produtos[ LIndex ].UnitarioCompra    := dtmCDSToXMLNFe.ProdutoValorUnitarioComercial.asFloat ;

       NFeInfo.Produtos[ LIndex ].ValorSeguro       := dtmCDSToXMLNFe.ProdutoValorSeguro.asfloat ;
       NFeInfo.Produtos[ LIndex ].ValorFrete        := dtmCDSToXMLNFe.ProdutoValorFrete.asfloat ;
       NFeInfo.Produtos[ LIndex ].ValorDesconto     := dtmCDSToXMLNFe.ProdutoValorDesconto.asfloat ;
     end;

  SetLength ( NFeInfo.Duplicatas, dtmCDSToXMLNFe.Duplicata.RecordCount  ) ;
  for LIndex := Low( NFeInfo.Duplicatas ) to High( NFeInfo.Duplicatas ) do
     begin
       dtmCDSToXMLNFe.Duplicata.RecNo := LIndex + 1 ;

       NFeInfo.Duplicatas[ LIndex ].Documento  :=     dtmCDSToXMLNFe.DuplicataNumero.asString ;
       NFeInfo.Duplicatas[ LIndex ].Data       :=     dtmCDSToXMLNFe.DuplicataVencimento.AsDateTime ;
       NFeInfo.Duplicatas[ LIndex ].Valor      :=     dtmCDSToXMLNFe.DuplicataValor.asFloat ;
     end;

end;

function TfrmImportNFeCompra.SearchFornecedor( const ACNPJ : string ; var ANomeFornecedor : string ) : string;
const
  _SELECT =
         'SELECT'
  +#13#10'  KCAD_ENTIDADE, NOME'
  +#13#10'FROM CAD_ENTIDADES'
  +#13#10'WHERE CPF_CNPJ = :CPF_CNPJ'
  +#13#10' AND  ATIVO = ''T'''
  +#13#10' AND  SYS$DELETED = ''F'''
  +#13#10' AND  IS_FORNECEDOR = ''T''' ;
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  cds := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'CPF_CNPJ', ptInput ).AsString := ACNPJ ;
  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cds, _SELECT, p );
  p.Free ;
  Result :=cds.FieldByName( 'KCAD_ENTIDADE' ).asString ;
  ANomeFornecedor := cds.FieldByName( 'NOME' ).asString ;
  cds.Free ;
end;


function TfrmImportNFeCompra.SearchProduto( const AChaveFornecedor, ACodigoProduto: string ; var ACodigoEstoque : string ; var ANomeEstoque : string ; var AUnidadeEstoque : string ) : string;
const
  _SELECT =
         'SELECT'
  +#13#10'   P.KEST_PRODUTO'
  +#13#10' , P.CODIGO'
  +#13#10' , P.NOME'
  +#13#10' , P.UNIDADE'
  +#13#10'FROM EST_PRODUTO_FORNECEDORES PF'
  +#13#10'LEFT JOIN EST_PRODUTOS P ON ( P.KEST_PRODUTO = PF.KEST_PRODUTO )'
  +#13#10'WHERE PF.KCAD_FORNECEDOR = :KCAD_FORNECEDOR'
  +#13#10'  AND PF.CODIGO = :CODIGO'
  +#13#10'  AND P.ATIVO = ''T''' ;
var
  ISQL : ISQLSuppl ;
begin

  ISQL := TTcAbstractDB.GetByAlias('FINANCEIRO')
    .ISQL( _SELECT ) ;

  ISQL.SQLParam( 'KCAD_FORNECEDOR' ).AsString := AChaveFornecedor ;
  ISQL.SQLParam( 'CODIGO'          ).AsString := ACodigoProduto ;
  with ISQL.GetDS do
    begin
      Result          := FieldByName( 'KEST_PRODUTO' ).asString ;
      ACodigoEstoque  := FieldByName( 'CODIGO' ).asString ;
      ANomeEstoque    := FieldByName( 'NOME' ).asString ;
      AUnidadeEstoque := FieldByName( 'NOME' ).asString ;
    end;

end;

procedure TfrmImportNFeCompra.TcGDIButton1Click(Sender: TObject);
var
  FornecedorInfo : TFornecedorInfo ;
begin

  with FornecedorInfo do
    begin
     if dtmCDSToXMLNFe.EmitenteCNPJ.asString = '' then
       CPF_CNPJ        := SpedUtils.Mask_CPF( dtmCDSToXMLNFe.EmitenteCPF.asString )
     else
       CPF_CNPJ        := SpedUtils.Mask_CNPJ( dtmCDSToXMLNFe.EmitenteCNPJ.asString ) ;

      Razao           := dtmCDSToXMLNFe.EmitenteRazao.asString ;
      Fantasia        := dtmCDSToXMLNFe.EmitenteFantasia.asString ;
      IE              := dtmCDSToXMLNFe.EmitenteIE.asString ;
      IEST            := dtmCDSToXMLNFe.EmitenteIEST.asString ;
      IM              := dtmCDSToXMLNFe.EmitenteIM.asString ;
      CNAE            := dtmCDSToXMLNFe.EmitenteCNAE.asString ;
      Logradouro      := dtmCDSToXMLNFe.EnderecoEmitente_Logradouro.asString ;
      Numero          := dtmCDSToXMLNFe.EnderecoEmitente_Numero.asString ;
      Complemento     := dtmCDSToXMLNFe.EnderecoEmitente_xComplemento.asString ;
      Bairro          := dtmCDSToXMLNFe.EnderecoEmitente_Bairro.asString ;
      CodigoMunicipio := dtmCDSToXMLNFe.EnderecoEmitente_CodigoMunicipio.asInteger ;
      NomeMunicipio   := dtmCDSToXMLNFe.EnderecoEmitente_NomeMun.asString ;
      UF              := dtmCDSToXMLNFe.EnderecoEmitente_UF.asString ;
      CEP             := dtmCDSToXMLNFe.EnderecoEmitente_CEP.asString ;
      CodigoPais      := dtmCDSToXMLNFe.EnderecoEmitente_CodigoPais.asInteger ;
      NomePais        := dtmCDSToXMLNFe.EnderecoEmitente_NomePais.asString ;
      Fone            := dtmCDSToXMLNFe.EnderecoEmitente_Fone.asString ;
    end ;

    SvcCadastroFornecedores.NovoFornecedor( FornecedorInfo );

    if FornecedorInfo.KCAD_FORNECEDOR <> '' then
       begin
          FKFornecedor     := FornecedorInfo.KCAD_FORNECEDOR ;
          FNomeFornecedor  := FornecedorInfo.Razao ;
          _actNext.Execute ;
       end;
end;

function TfrmImportNFeCompra.ValidNFe: boolean;
var
  Doc : IXMLDocument ;
  LName : string ;
  ErrMsg : string ;
const
  _MSG =
     'Este arquivo não pode ser importado. O tipo de arquivo "%s" não é suportado.' ;
begin
  ErrMsg := '' ;

  Doc := TXMLDocument.Create( nil ) ;

  Try
    Doc.LoadFromFile( TcFilenameEdit1.Text );
    LName := Doc.DocumentElement.NodeName.ToUpper ;
    if  ( LName = 'NFSE' )
     or ( LName = 'NFS' )
     or ( LName = 'RPS' )
     or ( LName = 'LOTERPS' )
     or ( LName = 'INFRPS' ) then
       ErrMsg := 'Este arquivo não pode ser importado pois é uma NFS-e ( Nota Fiscal Eletrônica de Serviços ).'#13#10'Apenas NF-e podem ser importadas.'
  //  else if Doc.DocumentElement.NodeName = 'NFe' then
  //     ErrMsg := 'Este arquivo não pode ser importado pois não possui o protocolo. Apenas NF-e com protocolo podem ser importadas'.
    else if ( LName <> 'NFEPROC' ) and ( LName <> 'NFE' ) then
       ErrMsg := Format( _MSG, [ LName ] ) ;
  except
     ErrMsg := 'Este arquivo não pode ser importado. Não é um arquivo no padrão NF-e.' ;
  End;

  Result := ErrMsg = '' ;

  if not Result then
    ShowMessage ( ErrMsg ) ;

end;

procedure TfrmImportNFeCompra._actNextExecute(Sender: TObject);
var
 LCPFCNPJ : string ;
 LErrMsg : string ;
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  if PageControl.ActivePageIndex = 0 then
   begin
     if Assigned (  dtmCDSToXMLNFe ) then
        FreeAndNIL ( dtmCDSToXMLNFe ) ;

     if not ValidNFe then
       abort ;

     dtmCDSToXMLNFe := TdtmCDSToXMLNFe.Create( nil );
     try
        FXMLFileName :=  TcFilenameEdit1.Text ;
        dtmCDSToXMLNFe.XMLToCDSNFe( TcFilenameEdit1.Text );
     except On E : Exception do
       begin
        LErrMsg := E.Message ;
        FreeAndNIL ( dtmCDSToXMLNFe ) ;
       end;
     end;

     if not Assigned ( dtmCDSToXMLNFe ) then
       begin
        ShowMessage ( 'Erro ao importar nota'
                      +#13#10
                      +LErrMsg ) ;
        exit ;
       end;

     FProximaDataFechamento := GetEncerramentoMensal ;

     if ( FProximaDataFechamento > 0 ) and ( dtmCDSToXMLNFe.IdentificacaoEMISSAO.AsDateTime < FProximaDataFechamento ) then
       begin
        ShowMessageFmt (    'Mês "%s" já encerrado'
                     +#13#10'É necessário reabrir o mês'
                     +#13#10'para importar esta NFe', [ FormatDateTime( 'mm/yyyy', FProximaDataFechamento - 1 ) ] ) ;
        FreeAndNIL ( dtmCDSToXMLNFe ) ;
        exit ;
       end;

     if dtmCDSToXMLNFe.EmitenteCNPJ.asString = '' then
       edtEmitenteCNPJ.Caption         := SpedUtils.Mask_CPF( dtmCDSToXMLNFe.EmitenteCPF.asString )
     else
       edtEmitenteCNPJ.Caption         := SpedUtils.Mask_CNPJ( dtmCDSToXMLNFe.EmitenteCNPJ.asString ) ;

     edtEmitenteRAZAOSOCIAL.Caption  := dtmCDSToXMLNFe.EmitenteRazao.asString  ;
     edtEmitenteNOMEFANTASIA.Caption := dtmCDSToXMLNFe.EmitenteFantasia.asString  ;

     //dataSource1.DataSet := dtmCDSToXMLNFe.Emitente ;

     if dtmCDSToXMLNFe.EmitenteCNPJ.asString = '' then
       FKFornecedor :=  SearchFornecedor( SpedUtils.Mask_CPF( dtmCDSToXMLNFe.EmitenteCPF.asString ), FNomeFornecedor )
     else
       FKFornecedor :=  SearchFornecedor( SpedUtils.Mask_CNPJ( dtmCDSToXMLNFe.EmitenteCNPJ.asString ), FNomeFornecedor ) ;

     if dtmCDSToXMLNFe.DestinatarioCNPJ.asString = '' then
      tbsNFOutroCNPJ.Enabled := not CheckCNPJDestinatario( SpedUtils.Mask_CPF( dtmCDSToXMLNFe.DestinatarioCPF.asString ), LCPFCNPJ )
     else
      tbsNFOutroCNPJ.Enabled := not CheckCNPJDestinatario( SpedUtils.Mask_CNPJ( dtmCDSToXMLNFe.DestinatarioCNPJ.asString ), LCPFCNPJ ) ;


     lblCNPJFazenda.Caption    := LCPFCNPJ ;

     if dtmCDSToXMLNFe.DestinatarioCNPJ.asString = '' then
       lblCNPJDestinario.Caption := SpedUtils.Mask_CPF( dtmCDSToXMLNFe.DestinatarioCPF.asString )
     else
       lblCNPJDestinario.Caption := SpedUtils.Mask_CNPJ( dtmCDSToXMLNFe.DestinatarioCNPJ.asString ) ;

     tbsFornecedor.Enabled := FKFornecedor = '' ;

     tbsNFExistente.Enabled :=
           TSQLSuppl.CheckExistsIn(
             'CMP_PEDIDOS',
             'KCAD_ENTIDADE;NOTA_FISCAL;SERIE',
             VarArrayOf( [ FKFornecedor, dtmCDSToXMLNFe.IdentificacaoDocumento.asString, dtmCDSToXMLNFe.IdentificacaoSERIE.asString ] ),
             '',
             TSQLConnection ( TTcAbstractDB.GetByAlias ( 'FINANCEIRO' ).Connection ) )
       or  TSQLSuppl.CheckExistsIn(
             'CMP_PEDIDOS',
             'CHAVENFE',
             VarArrayOf( [ SpedUtils.Digits ( dtmCDSToXMLNFe.ChaveAcesso ) ] ),
             '',
             TSQLConnection ( TTcAbstractDB.GetByAlias ( 'FINANCEIRO' ).Connection ) ) ;

     lblNomeFornecedor.Caption := FNomeFornecedor ;
     lblDocumento.Caption      := dtmCDSToXMLNFe.IdentificacaoDocumento.asString ;
     lblSerie.Caption          := dtmCDSToXMLNFe.IdentificacaoSERIE.asString ;


     FreePanelsProdutos ;
     with dtmCDSToXMLNFe.Detalhe do
       begin
           First ;
           while not eof do
             begin
               CreatePanelProdutos ;
               next ;
             end;
       end;

   end;

  if PageControl.ActivePage = tbsNFOutroCNPJ then
     begin
       if not CheckBox1.Checked then
          begin
            ShowMessage ( 'Não é possível continuar'
                   +#13#10'sem confirmar autorização' );
            exit ;
          end;
     end;

  if PageControl.ActivePage = tbsFornecedor then
     begin
       if FKFornecedor = '' then
          begin
            ShowMessage ( 'Não é possível continuar sem'
                   +#13#10'cadastrar o fornecedor.'
                   +#13#10 );
            exit ;
          end;
     end;

  if PageControl.ActivePage = tbsNFExistente then
     begin
       ShowMessage ( 'Não é possível continuar'
              +#13#10'nota já cadastrada' );
            exit ;
     end;

  inherited;

end;

function TfrmImportNFeCompra.CheckMesEncerrado : boolean ;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'DATA',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( dtmCDSToXMLNFe.IdentificacaoEMISSAO.AsDateTime ) ;

  try
   try
    TTcAbstractDB.GetByAlias ( 'FINANCEIRO' ).Execute ( 'EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KSYS$DOMAIN, :DATA, ''F'' )', p ) ;
   except
     Result := True ;
   end;
  finally
    p.free ;
  end;
end;

procedure TfrmImportNFeCompra._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TfrmImportNFeCompra ) ;

end.
