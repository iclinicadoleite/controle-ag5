unit UEST_CompraEstoqueMinimoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, MConnect, Data.SqlExpr,
  Provider, Tc.Data.SQLExpr;

type
  TEST_CompraEstoqueMinimoDatamodule = class(T_dtmBASE)
    cdsProdutosQtdeMinima: TClientDataSet;
    dspProdutosQtdeMinima: TDataSetProvider;
    sqlProdutosQtdeMinima: TTcSQLDataSet;
    sqlProdutosQtdeMinimaCODIGO: TStringField;
    sqlProdutosQtdeMinimaNOME: TStringField;
    sqlProdutosQtdeMinimaUNIDADE: TStringField;
    sqlProdutosQtdeMinimaKTIPO_PRODUTO: TStringField;
    sqlProdutosQtdeMinimaQTDE_MINIMA: TFloatField;
    sqlProdutosQtdeMinimaQTDE_PRODUTO: TFloatField;
    cdsProdutosQtdeMinimaCODIGO: TStringField;
    cdsProdutosQtdeMinimaNOME: TStringField;
    cdsProdutosQtdeMinimaUNIDADE: TStringField;
    cdsProdutosQtdeMinimaKTIPO_PRODUTO: TStringField;
    cdsProdutosQtdeMinimaQTDE_MINIMA: TFloatField;
    cdsProdutosQtdeMinimaQTDE_PRODUTO: TFloatField;
    cdsProdutosQtdeMinimaQTDE_COMPRAR: TFloatField;
    sqlProdutosQtdeMinimaSELECTED: TStringField;
    cdsProdutosQtdeMinimaSELECTED: TStringField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    cdsProdutosQtdeMinimaDESC_TIPO: TStringField;
    procedure cdsProdutosQtdeMinimaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
  public
    { Public declarations }
    procedure Filter ;
    procedure UnFilter ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

uses Exceptions, Tc.DBRTL.AbstractDB,   CLAg5SvcEstoqueCadastroTipos ;

{$R *.dfm}

{ TEST_CompraEstoqueMinimoDatamodule }

procedure TEST_CompraEstoqueMinimoDatamodule.cdsProdutosQtdeMinimaBeforeOpen(
  DataSet: TDataSet);
begin
  cdsProdutosQtdeMinima.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID;
end;

constructor TEST_CompraEstoqueMinimoDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  ListaTiposCadastro( cdsTiposProduto,   CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );
end;

procedure TEST_CompraEstoqueMinimoDatamodule.Filter;
begin
    cdsProdutosQtdeMinima.Filtered := True ;
end;

procedure TEST_CompraEstoqueMinimoDatamodule.ListaTiposCadastro(
  CDS: TClientDataSet; Tipo: Integer);
const
  SQL_LISTA = 'SELECT ' +
              ' KCAD_TIPOS, ' +
              ' DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = :TIPO ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;

begin
  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;
  p.CreateParam( ftInteger, 'TIPO',        ptInput ).AsInteger := Tipo;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( CDS, SQL_LISTA, p );

  p.Free;
end;

procedure TEST_CompraEstoqueMinimoDatamodule.UnFilter;
begin
    cdsProdutosQtdeMinima.Filtered := False ;
end;

end.
