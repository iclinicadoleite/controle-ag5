unit UEST_ProdutosInsumosReportDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Provider, Tc.Data.SQLExpr;

type
  TEST_ProdutosInsumosReportDatamodule = class( T_dtmBASE )
    cdsProdutosInsumos :TClientDataSet;
    dspProdutosInsumos :TDataSetProvider;
    sqlProdutosInsumos: TTcSQLDataSet;
    sqlProdutosInsumosKEST_PRODUTO: TStringField;
    sqlProdutosInsumosKTIPO_PRODUTO: TStringField;
    sqlProdutosInsumosCODIGO: TStringField;
    sqlProdutosInsumosNOME: TStringField;
    sqlProdutosInsumosDESCRICAO: TMemoField;
    sqlProdutosInsumosUNIDADE: TStringField;
    sqlProdutosInsumosNOMEENTIDADE: TStringField;
    sqlProdutosInsumosBAIXA_ESTOQUE: TStringField;
    cdsProdutosInsumosKEST_PRODUTO: TStringField;
    cdsProdutosInsumosKTIPO_PRODUTO: TStringField;
    cdsProdutosInsumosCODIGO: TStringField;
    cdsProdutosInsumosNOME: TStringField;
    cdsProdutosInsumosDESCRICAO: TMemoField;
    cdsProdutosInsumosUNIDADE: TStringField;
    cdsProdutosInsumosNOMEENTIDADE: TStringField;
    cdsProdutosInsumosBAIXA_ESTOQUE: TStringField;
    sqlProdutosInsumosQTDE_ENTRADA: TFloatField;
    sqlProdutosInsumosVALOR_ENTRADA: TFloatField;
    sqlProdutosInsumosQTDE_SAIDA: TFloatField;
    sqlProdutosInsumosVALOR_SAIDA: TFloatField;
    cdsProdutosInsumosQTDE_ENTRADA: TFloatField;
    cdsProdutosInsumosVALOR_ENTRADA: TFloatField;
    cdsProdutosInsumosQTDE_SAIDA: TFloatField;
    cdsProdutosInsumosVALOR_SAIDA: TFloatField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    cdsProdutosInsumosDESCR_GRUPO: TStringField;
    sqlProdutosInsumosTOTAL_LANCAMENTO: TFloatField;
    sqlProdutosInsumosPLANO_CONTA: TStringField;
    sqlProdutosInsumosCENTRO_CUSTO: TStringField;
    cdsProdutosInsumosTOTAL_LANCAMENTO: TFloatField;
    cdsProdutosInsumosPLANO_CONTA: TStringField;
    cdsProdutosInsumosCENTRO_CUSTO: TStringField;
    sqlProdutosInsumosDATA: TSQLTimeStampField;
    cdsProdutosInsumosDATA: TSQLTimeStampField;
    procedure cdsProdutosInsumosBAIXA_ESTOQUEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FDataInicial   : TDateTime;
    FDataFinal     : TDateTime;
    FTipoTodosGrupoProduto : integer ;
    FProdutoInsumo : integer ;
    FKGRupo        : string ;
    FKProduto      : string ;
    procedure SetParams;
    procedure ListaTipos;
  public
    { Public declarations }
    procedure SetFiltro( ADataInicial, ADataFinal : TDateTime ; ATipoTodosGrupoProduto,
    AProdutoInsumo : Integer; AKGrupo, AKProduto : string  );

    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB,Exceptions, UDBFinanceiro, Data.SQLTimSt, DateUtils;
{$R *.dfm}
{ TEST_ProdutosInsumosReportDatamodule }

procedure TEST_ProdutosInsumosReportDatamodule.cdsProdutosInsumosBAIXA_ESTOQUEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'BAIXA_ESTOQUE' ).asString = 'T' then
      Text := 'Sim'
    else if Sender.DataSet.FieldByName ( 'BAIXA_ESTOQUE' ).asString = 'F' then
      Text := 'Não';
end;

constructor TEST_ProdutosInsumosReportDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  ListaTipos;
end;

procedure TEST_ProdutosInsumosReportDatamodule.ListaTipos;
const
  SQL_LISTA = 'SELECT KCAD_TIPOS, DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = 3 ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;
begin
  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cdsTiposProduto, SQL_LISTA, p );

  if cdsTiposProduto.IsEmpty then
    Exit;

  p.Free;
end;

procedure TEST_ProdutosInsumosReportDatamodule.SetFiltro(
    ADataInicial, ADataFinal : TDateTime ; ATipoTodosGrupoProduto,
    AProdutoInsumo : Integer; AKGrupo, AKProduto : string  );
begin
  FDataInicial           := ADataInicial;
  FDataFinal             := ADataFinal;
  FTipoTodosGrupoProduto := ATipoTodosGrupoProduto ;
  FProdutoInsumo         := AProdutoInsumo ;
  FKGrupo                := AKGrupo ;
  FKProduto              := AKProduto ;

  if cdsProdutosInsumos.Active then
    cdsProdutosInsumos.Close;

  SetParams;

  TCdsSuppl.Open( cdsProdutosInsumos );
end;

procedure TEST_ProdutosInsumosReportDatamodule.SetParams;
begin

  with cdsProdutosInsumos.Params do
    begin
      paramByName( 'KSYS$DOMAIN'     ).AsString       := LoggedUser.DomainID;
      paramByName( 'DATAINI'         ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay( FDataInicial ) );
      paramByName( 'DATAFIM'         ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay( FDataFinal ) );
      paramByName( 'TIPO'            ).asInteger      := FTipoTodosGrupoProduto ;
      paramByName( 'TIPO_PRODUTO'    ).AsInteger      := FProdutoInsumo ;
      paramByName( 'KGRUPO'          ).AsString       := FKGrupo;
      paramByName( 'KEST_PRODUTO'    ).AsString       := FKProduto ;
    end;
end;

end.
