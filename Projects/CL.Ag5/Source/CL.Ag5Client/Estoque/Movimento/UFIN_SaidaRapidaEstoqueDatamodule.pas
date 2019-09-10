unit UFIN_SaidaRapidaEstoqueDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, MConnect, Data.SqlExpr,
  Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type
  TFIN_SaidaRapidaEstoqueDatamodule = class(T_dtmBASE)
    cdsEstoque: TClientDataSet;
    cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    cdsEstoqueKSYSDOMAIN: TStringField;
    cdsEstoqueCODIGO_LANCAMENTO: TStringField;
    cdsEstoqueDATA: TSQLTimeStampField;
    cdsEstoqueKEST_PRODUTO: TStringField;
    cdsEstoqueCODIGO: TStringField;
    cdsEstoqueNOME: TStringField;
    cdsEstoqueDESCRICAO: TMemoField;
    cdsEstoqueUNIDADE: TStringField;
    cdsEstoqueTIPO: TStringField;
    cdsEstoqueQTDE: TFloatField;
    cdsEstoqueCUSTO: TFloatField;
    cdsEstoqueOBS: TMemoField;
    cdsEstoqueKFIN_PLANOCONTA: TStringField;
    cdsEstoqueDESCR_PC_NOME: TStringField;
    cdsEstoqueDESCR_PC_CLASSIFICACAO: TStringField;
    cdsEstoqueDESCR_PC_CODIGO: TIntegerField;
    cdsEstoqueDESCR_PC_TIPO_APRD: TStringField;
    cdsEstoqueQTDE_PRODUTO: TFloatField;
    cdsEstoqueQTDE_MINIMA: TFloatField;
    cdsEstoquesqlApropriacao: TDataSetField;
    dspEstoque: TDataSetProvider;
    sqlEstoque: TTcSQLDataSet;
    sqlEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    sqlEstoqueKSYSDOMAIN: TStringField;
    sqlEstoqueCODIGO_LANCAMENTO: TStringField;
    sqlEstoqueDATA: TSQLTimeStampField;
    sqlEstoqueKEST_PRODUTO: TStringField;
    sqlEstoqueCODIGO: TStringField;
    sqlEstoqueNOME: TStringField;
    sqlEstoqueDESCRICAO: TMemoField;
    sqlEstoqueUNIDADE: TStringField;
    sqlEstoqueTIPO: TStringField;
    sqlEstoqueQTDE: TFloatField;
    sqlEstoqueCUSTO: TFloatField;
    sqlEstoqueOBS: TMemoField;
    sqlEstoqueKFIN_PLANOCONTA: TStringField;
    sqlEstoqueDESCR_PC_NOME: TStringField;
    sqlEstoqueDESCR_PC_CLASSIFICACAO: TStringField;
    sqlEstoqueDESCR_PC_CODIGO: TIntegerField;
    sqlEstoqueDESCR_PC_TIPO_APRD: TStringField;
    sqlEstoqueQTDE_PRODUTO: TFloatField;
    sqlEstoqueQTDE_MINIMA: TFloatField;
    cdsApropriacao: TClientDataSet;
    cdsApropriacaoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoCODIGO: TIntegerField;
    cdsApropriacaoCLASSIFICACAO: TStringField;
    cdsApropriacaoNOME: TStringField;
    cdsApropriacaoPORCENTAGEM: TFloatField;
    cdsApropriacaoTABLENAME: TStringField;
    cdsApropriacaoTABLEKEY: TStringField;
    cdsApropriacaoTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacao: TTcSQLDataSet;
    sqlApropriacaoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoCODIGO: TIntegerField;
    sqlApropriacaoCLASSIFICACAO: TStringField;
    sqlApropriacaoNOME: TStringField;
    sqlApropriacaoPORCENTAGEM: TFloatField;
    sqlApropriacaoTABLENAME: TStringField;
    sqlApropriacaoTABLEKEY: TStringField;
    dtsEstoque: TDataSource;
    cdsEstoqueTOTAL: TFloatField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    cdsEstoqueKTIPO_PRODUTO: TStringField;
    sqlEstoqueKTIPO_PRODUTO: TStringField;
    cdsEstoqueDESC_TIPO: TStringField;
    cdsEstoqueLISTA_CC: TStringField;
    procedure cdsEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueQTDEValidate(Sender: TField);
    procedure cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsApropriacaoNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueCalcFields(DataSet: TDataSet);
    procedure dspEstoqueGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure cdsEstoqueBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetParams ;
    procedure DataValidate ;
    procedure InitializeList ;
    procedure DateValidate( ADate : TDateTime );
    procedure ListaTiposCadastro( CDS: TClientDataSet; Tipo: Integer);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure AddProduto( Key, CodigoProduto, NomeProduto, Unidade, AKTIPO_PRODUTO,
    Descricao : String; Custo_Medio : Double ;
    AEstoqueAtual, AQtdeMinima : double ;
    AFIN_PLANOCONTA, ADescricaoPlanoConta  : string
    ; AAPRD : string
    );
    procedure SetListaCentroCusto;
    function Process( ADate : TDateTime ) : integer ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation


uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Data.SQLTimSt, Exceptions
     , DateUtils
     , DataSnap.DSConnect
     , CLAg5SvcEstoqueCadastroTipos
       ;

{$R *.dfm}

{ TrdmFIN_SaidaRapidaEstoqueDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_SaidaRapidaEstoqueDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
  ListaTiposCadastro( cdsTiposProduto, CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO );

end;
{$ENDIF}


{ TdtmCustomListaFicha }

procedure TFIN_SaidaRapidaEstoqueDatamodule.InitializeList ;
const
 _SELECT =
          'SELECT'
   +#13#10' P.KEST_PRODUTO,'
   +#13#10' P.CODIGO,'
   +#13#10' P.NOME,'
   +#13#10' P.UNIDADE,'
   +#13#10' P.DESCRICAO,'
   +#13#10' P.KTIPO_PRODUTO,'
   +#13#10' P.CUSTO_MEDIO,'
   +#13#10' P.QTDE_PRODUTO,'
   +#13#10' P.QTDE_MINIMA,'
   +#13#10' P.KFIN_PLANOCONTA,'
   +#13#10' PL.NOME DESCR_PLANOCONTA,'
   +#13#10' PL.TIPO_APRD'
   +#13#10'FROM EST_PRODUTOS P'
   +#13#10'LEFT JOIN FIN_PLANOCONTAS PL ON PL.KFIN_PLANOCONTA = P.KFIN_PLANOCONTA'
   +#13#10'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN'
   +#13#10'  AND P.ATIVO = ''T'''
   +#13#10'  AND P.BAIXA_ESTOQUE = ''T'''
   +#13#10'ORDER BY P.NOME' ;

var
  p : TParams;
  cds : TClientDataSet ;
begin
  cdsEstoque.DisableControls ;
  cdsEstoque.BeforePost := nil;

  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;

  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( CDS, _SELECT, p );



  with cds do
    begin
      first ;
      while not eof do
       begin
         AddProduto(
           cds.FieldByName( 'KEST_PRODUTO' ).asString,
           cds.FieldByName( 'CODIGO' ).asString,
           cds.FieldByName( 'NOME' ).asString,
           cds.FieldByName( 'UNIDADE' ).AsString,
           cds.FieldByName( 'KTIPO_PRODUTO' ).AsString,
           cds.FieldByName( 'DESCRICAO' ).AsString,
           cds.FieldByName( 'CUSTO_MEDIO' ).AsFloat,
           cds.FieldByName( 'QTDE_PRODUTO' ).AsFloat,
           cds.FieldByName( 'QTDE_MINIMA' ).AsFloat,
           cds.FieldByName( 'KFIN_PLANOCONTA' ).asString,
           cds.FieldByName( 'DESCR_PLANOCONTA' ).asString,
           cds.FieldByName( 'TIPO_APRD' ).AsString
         ) ;
         next ;
       end;
    end;

  p.Free;
  cds.Free ;

  cdsEstoque.EnableControls ;
  cdsEstoque.BeforePost := cdsEstoqueBeforePost;
end;


procedure TFIN_SaidaRapidaEstoqueDatamodule.OpenTables;
begin
  SetParams;
  //TCDSSuppl.CreateDataSet( cdsEstoque ) ;
  if cdsEstoque.Active then
     cdsEstoque.Close ;
  cdsEstoque.Open ;
  InitializeList ;
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.DateValidate( ADate : TDateTime );
var
  p : TParams ;
begin
  if YearOf( ADate ) < 1500 then
     raise Warning.Create('Data de movimentação inválida');

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN', ptInput ).asString       := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'DATA',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( ADate ) ;
  try
    sqlEstoque.SQLConnection.Execute ( 'EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KSYS$DOMAIN, :DATA, ''F'' )', p )
  finally
    p.free ;
  end;
end;


procedure TFIN_SaidaRapidaEstoqueDatamodule.dspEstoqueGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
    if DataSet = sqlEstoque then
      TableName := 'EST_OUTRAS_ENTRADAS_SAIDAS' ;
end;

function TFIN_SaidaRapidaEstoqueDatamodule.Process( ADate : TDateTime ) : integer ;
begin

  Result := 0 ;
  DateValidate( ADate );
  DataValidate ;

  with cdsEstoque do
    try
      DisableControls ;
      TCDSSuppl.ResetIndex( cdsEstoque );
      first ;
      while not eof do
        begin
        if  ( cdsEstoqueQTDE.IsNull )
         or ( cdsEstoqueQTDE.AsFloat = 0 ) then
         begin
            while not cdsApropriacao.IsEmpty do
              cdsApropriacao.Delete ;
            Delete ;
         end
        else if cdsEstoqueDATA.asDateTime <> ADate then
          begin
            Inc ( Result ) ;
            Edit ;
            cdsEstoqueDATA.asDateTime := ADate ;
            Next ;
          end
        else
          next ;
        end  ;

      TCDSSuppl.ApplyUpdates( cdsEstoque ) ;
      cdsEstoque.Close ;
    finally
      enableControls ;
    end;

end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.SetListaCentroCusto;
var
  cds : TClientDataSet;
  LListaCC: String;
begin
  LListaCC := '';
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsApropriacao, False, False);
  cds.Filter := Format( 'TABLEKEY = ''%s'' ', [ cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA.AsString ] );
  cds.Filtered := True;
  cds.First;
  while not cds.Eof do
   begin
     //LListaCC := Format('%s%s %3.2f,',[LListaCC, cds.FieldByName( 'NOME').AsString, cds.FieldByName( 'PORCENTAGEM').AsFloat]);
     LListaCC := Format('%s%s, ',[LListaCC, cds.FieldByName( 'NOME').AsString]);
     cds.Next;
   end;

  System.Delete( LListaCC, Length( LListaCC )-1, 2);

  cdsEstoque.Edit;
  cdsEstoqueLISTA_CC.AsString := LListaCC;
  cdsEstoque.Post;
  cds.Free;

end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.SetParams;
begin
//  cdsEstoque.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID;
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.AddProduto(Key, CodigoProduto, NomeProduto, Unidade,
          AKTIPO_PRODUTO, Descricao: String;
          Custo_Medio : Double ; AEstoqueAtual, AQtdeMinima : double ; AFIN_PLANOCONTA, ADescricaoPlanoConta  : string
            ; AAPRD : string
           );
const
  _SQL_APROPRIACAO =
         'SELECT'
  +#13#10' CC.KFIN_CENTROCUSTO,'
  +#13#10' CC.CODIGO,'
  +#13#10' CC.NOME,'
  +#13#10' AP.PORCENTAGEM'
  +#13#10'FROM FIN_APROPRIACAO AP'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE AP.TABLENAME = ''EST_PRODUTOS'' AND AP.TABLEKEY = :TABLEKEY' ;

var
  LCDSApropriacao : TClientDataSet ;
  p : TParams ;
  LListaCC: String;
begin

  LListaCC := '';
  cdsEstoque.Append ;

  cdsEstoqueKEST_PRODUTO.asString  := Key;
  cdsEstoqueCODIGO.asString        := CodigoProduto;
  cdsEstoqueNOME.asString          := NomeProduto;
  cdsEstoqueUNIDADE.AsString       := Unidade;
  cdsEstoqueKTIPO_PRODUTO.asString := AKTIPO_PRODUTO ;
  cdsEstoqueDESCRICAO.AsString     := Descricao;
  cdsEstoqueCUSTO.AsFloat          := Custo_Medio;
  cdsEstoqueQTDE_PRODUTO.AsFloat   := AEstoqueAtual ;
  cdsEstoqueQTDE_MINIMA.AsFloat    := AQtdeMinima ;


  if not AFIN_PLANOCONTA.Trim.IsEmpty then
    begin

      cdsEstoqueDESCR_PC_NOME.asString      := ADescricaoPlanoConta ;
      cdsEstoqueDESCR_PC_TIPO_APRD.asString := AAPRD ;
      cdsEstoqueKFIN_PLANOCONTA.asString    := AFIN_PLANOCONTA ;

      //add rateio ....

      LCDSApropriacao := nil ;
      p := TParams.Create ;
      p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := Key ;
      TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SQL_APROPRIACAO, p ) ;
      p.Free ;

      with LCDSApropriacao do
        while not eof do
          begin
            cdsApropriacao.Append;
            cdsApropriacaoCODIGO.asString           := FieldByName( 'CODIGO').AsString  ;
            cdsApropriacaoNOME.asString             := FieldByName( 'NOME').AsString  ;
            cdsApropriacaoPORCENTAGEM.asFloat       := FieldByName( 'PORCENTAGEM').AsFloat  ;
            cdsApropriacaoKFIN_CENTROCUSTO.asString := FieldByName( 'KFIN_CENTROCUSTO').AsString  ;
            cdsApropriacao.Post;
            //LListaCC := Format('%s%s %3.2f,',[LListaCC, FieldByName( 'NOME').AsString, FieldByName( 'PORCENTAGEM').AsFloat]);
            LListaCC := Format('%s%s, ',[LListaCC, FieldByName( 'NOME').AsString]);
            next ;
          end;
      LCDSApropriacao.Free ;

      System.Delete( LListaCC, Length( LListaCC )-1, 2);
      cdsEstoque.Edit;
      cdsEstoqueLISTA_CC.AsString := LListaCC;
      cdsEstoque.Post;
    end;
  cdsEstoque.First ;
end;


procedure TFIN_SaidaRapidaEstoqueDatamodule.DataValidate;
var
  LErrMsg : TStringBuilder ;
  bm : TBookmark ;
begin
  LErrMsg := TStringBuilder.Create ;

  with   cdsEstoque do
    try
      bm := Bookmark ;
      DisableControls ;
      first ;
      while not eof do
       begin
        if ( cdsEstoqueQTDE.asFloat > 0 )  and cdsEstoqueKFIN_PLANOCONTA.IsNull then
           LErrMsg.AppendLine(  cdsEstoqueNOME.AsString +  ' - Conta contábil deve ser pesquisada/selecionada.' ) ;
        next ;
       end;
      Bookmark := bm ;
      if LErrMsg.Length > 0 then
         raise Warning.Create( LErrMsg.ToString ) ;

    finally
      LErrMsg.Free ;
      enableControls ;
    end;

end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsApropriacaoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoKFIN_APROPRIACAO );
  cdsApropriacaoTABLENAME.AsString := 'EST_OUTRAS_ENTRADAS_SAIDAS' ;
  cdsApropriacaoTABLEKEY.AsString  := cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA.AsString;
end;


procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsEstoqueBeforePost(
  DataSet: TDataSet);
begin
  if (cdsApropriacao.IsEmpty) and
     ((not cdsEstoqueQTDE.IsNull) and (cdsEstoqueQTDE.AsFloat <> 0)) then
    raise Warning.Create('Centro de custo deve ser pesquisado/selecionado.');
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsEstoqueCalcFields(DataSet: TDataSet);
begin
  try
    cdsEstoque.OnCalcFields := nil ;
    cdsEstoqueTOTAL.AsFloat := cdsEstoqueQTDE.AsFloat * cdsEstoqueCUSTO.AsFloat ;
    cdsEstoque.OnCalcFields := cdsEstoqueCalcFields ;
  except

  end;
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsEstoqueNewRecord(DataSet: TDataSet);
begin
  inherited;
//  self.InitializeKeys ;
  GetKey( cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA );
  cdsEstoqueKSYSDOMAIN.AsString := LoggedUser.DomainID;
  cdsEstoqueTIPO.AsString         := 'S';

end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.cdsEstoqueQTDEValidate(Sender: TField);
begin
  if ( Sender.AsFloat < 0 ) then
    raise Warning.Create( 'Quantidade inválida.' );
end;

procedure TFIN_SaidaRapidaEstoqueDatamodule.ListaTiposCadastro(
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


end.

