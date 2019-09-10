unit UFIN_SaidaEstoqueDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TFIN_SaidaEstoqueDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstSaidaEstoque: TClientDataSet;
    dspLstSaidaEstoque: TDataSetProvider;
    sqlLstSaidaEstoque: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstSaidaEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    sqlLstSaidaEstoqueCODIGO_LANCAMENTO: TStringField;
    sqlLstSaidaEstoqueDATA: TSQLTimeStampField;
    sqlLstSaidaEstoqueCODIGO: TStringField;
    sqlLstSaidaEstoqueNOME: TStringField;
    sqlLstSaidaEstoqueDESCRICAO: TMemoField;
    sqlLstSaidaEstoqueUNIDADE: TStringField;
    sqlLstSaidaEstoqueQTDE: TFloatField;
    sqlLstSaidaEstoqueOBS: TMemoField;
    cdsLstSaidaEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    cdsLstSaidaEstoqueKSYSDOMAIN: TStringField;
    cdsLstSaidaEstoqueCODIGO_LANCAMENTO: TStringField;
    cdsLstSaidaEstoqueDATA: TSQLTimeStampField;
    cdsLstSaidaEstoqueCODIGO: TStringField;
    cdsLstSaidaEstoqueNOME: TStringField;
    cdsLstSaidaEstoqueDESCRICAO: TMemoField;
    cdsLstSaidaEstoqueUNIDADE: TStringField;
    cdsLstSaidaEstoqueQTDE: TFloatField;
    cdsLstSaidaEstoqueOBS: TMemoField;
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
    cdsEstoqueTOTAL: TFloatField;
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
    sqlApropriacao: TTcSQLDataSet;
    sqlApropriacaoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoCODIGO: TIntegerField;
    sqlApropriacaoCLASSIFICACAO: TStringField;
    sqlApropriacaoNOME: TStringField;
    sqlApropriacaoPORCENTAGEM: TFloatField;
    dtsEstoque: TDataSource;
    cdsApropriacao: TClientDataSet;
    cdsApropriacaoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoCODIGO: TIntegerField;
    cdsApropriacaoCLASSIFICACAO: TStringField;
    cdsApropriacaoNOME: TStringField;
    cdsApropriacaoPORCENTAGEM: TFloatField;
    cdsApropriacaoTOTAL_PORCENTAGEM: TAggregateField;
    cdsEstoquesqlApropriacao: TDataSetField;
    cdsLstSaidaEstoqueTOTAL: TFloatField;
    sqlLstSaidaEstoqueCUSTO_MEDIO: TFloatField;
    cdsLstSaidaEstoqueCUSTO_MEDIO: TFloatField;
    sqlApropriacaoTABLENAME: TStringField;
    sqlApropriacaoTABLEKEY: TStringField;
    cdsApropriacaoTABLENAME: TStringField;
    cdsApropriacaoTABLEKEY: TStringField;
    sqlLstSaidaEstoqueQTDE_PRODUTO: TFloatField;
    cdsLstSaidaEstoqueQTDE_PRODUTO: TFloatField;
    sqlEstoqueQTDE_PRODUTO: TFloatField;
    sqlEstoqueQTDE_MINIMA: TFloatField;
    cdsEstoqueQTDE_PRODUTO: TFloatField;
    cdsEstoqueQTDE_MINIMA: TFloatField;
    cdsEstoqueTOTAL_ESTOQUE: TFloatField;
    sqlLstSaidaEstoqueKSYSDOMAIN: TStringField;
    procedure cdsLstSaidaEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsLstSaidaEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsEstoqueCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsEstoqueNOMESetText(Sender: TField; const Text: string);
    procedure cdsEstoqueCUSTOValidate(Sender: TField);
    procedure cdsEstoqueQTDEValidate(Sender: TField);
    procedure cdsEstoqueDATAValidate(Sender: TField);
    procedure cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsEstoqueBeforePost(DataSet: TDataSet);
    procedure cdsApropriacaoNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueBeforeInsert(DataSet: TDataSet);
    procedure cdsEstoqueAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    FInserting : boolean ;
    FLastDate : TDateTime ;
    FInicioPeriodo : TDateTime ;
    FFimPeriodo    : TDateTime ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetProduto( Key, CodigoProduto, NomeProduto, Unidade, Descricao : String; Custo_Medio : Double ;
    AEstoqueAtual : double ;
    AFIN_PLANOCONTA, ADescricaoPlanoConta  : string
    ; AAPRD : string
    );
    procedure SetFilter ( DataInicial, DataFinal : TDateTime );
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Data.SQLTimSt, Exceptions
     , DateUtils
     , DataSnap.DSConnect
       ;

{$R *.dfm}

{ TrdmFIN_SaidaEstoqueDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_SaidaEstoqueDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  FLastDate := 0 ;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TdtmCustomListaFicha }

procedure TFIN_SaidaEstoqueDatamodule.OpenTables;
begin
  SetParams;
  inherited;
end;

procedure TFIN_SaidaEstoqueDatamodule.SetFilter( DataInicial, DataFinal: TDateTime);
begin
  FInicioPeriodo := StartOfTheDay ( DataInicial ) ;
  FFimPeriodo    := EndOfTheDay ( DataFinal ) ;
  SetParams ;
  self.RefreshList ;
end;

procedure TFIN_SaidaEstoqueDatamodule.SetParams;
begin
  cdsLstSaidaEstoque.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID;
  cdsLstSaidaEstoque.ParamByName ( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FInicioPeriodo ) ) ;
  cdsLstSaidaEstoque.ParamByName ( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay   (  FFimPeriodo  ) ) ;
end;

procedure TFIN_SaidaEstoqueDatamodule.SetProduto(Key, CodigoProduto, NomeProduto, Unidade, Descricao: String;
          Custo_Medio : Double ; AEstoqueAtual : double ; AFIN_PLANOCONTA, ADescricaoPlanoConta  : string
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
  LQtdeIsNull : boolean ;
begin


  if not ( cdsEstoque.State in [dsInsert, dsEdit] ) then
    cdsEstoque.Edit;

  cdsEstoqueKEST_PRODUTO.asString := Key;
  cdsEstoqueCODIGO.asString       := CodigoProduto;
  cdsEstoqueNOME.asString         := NomeProduto;
  cdsEstoqueUNIDADE.AsString      := Unidade;
  cdsEstoqueDESCRICAO.AsString    := Descricao;
  cdsEstoqueCUSTO.AsFloat         := Custo_Medio;
  cdsEstoqueQTDE_PRODUTO.AsFloat  := AEstoqueAtual ;


  if not AFIN_PLANOCONTA.Trim.IsEmpty then
    begin
      LQtdeIsNull := cdsEstoqueQTDE.IsNull ;
      if LQtdeIsNull then
         cdsEstoqueQTDE.asFloat := 1 ;

      cdsEstoqueDESCR_PC_NOME.asString      := ADescricaoPlanoConta ;
      cdsEstoqueDESCR_PC_TIPO_APRD.asString := AAPRD ;
      cdsEstoqueKFIN_PLANOCONTA.asString    := AFIN_PLANOCONTA ;

      //add rateio ....

      LCDSApropriacao := nil ;
      p := TParams.Create ;
      p.CreateParam( ftString, 'TABLEKEY', ptInput ).asString := Key ;
      TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SQL_APROPRIACAO, p ) ;
      p.Free ;

      cdsEstoque.BeforePost := nil;

      with CDSApropriacao do
       begin
         First ;
         while not Eof do Delete ;
       end ;

      with LCDSApropriacao do
        while not eof do
          begin
            cdsApropriacao.Append;
            cdsApropriacaoCODIGO.asString           := FieldByName( 'CODIGO').AsString  ;
            cdsApropriacaoNOME.asString             := FieldByName( 'NOME').AsString  ;
            cdsApropriacaoPORCENTAGEM.asFloat       := FieldByName( 'PORCENTAGEM').AsFloat  ;
            cdsApropriacaoKFIN_CENTROCUSTO.asString := FieldByName( 'KFIN_CENTROCUSTO').AsString  ;
            cdsApropriacao.Post;
            next ;
          end;
      LCDSApropriacao.Free ;

      cdsEstoque.BeforePost := cdsEstoqueBeforePost;

      if LQtdeIsNull then
        begin
         cdsEstoqueQTDE.OnValidate := nil ;
         cdsEstoqueQTDE.Clear ;
         cdsEstoqueQTDE.OnValidate := cdsEstoqueQTDEValidate ;
        end;

    end;

end;


procedure TFIN_SaidaEstoqueDatamodule.cdsApropriacaoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoKFIN_APROPRIACAO );
  cdsApropriacaoTABLENAME.AsString := 'EST_OUTRAS_ENTRADAS_SAIDAS' ;
  cdsApropriacaoTABLEKEY.AsString  := cdsEstoqueKEST_OUTRA_ENTRADA_SAIDA.AsString;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueAfterCancel(DataSet: TDataSet);
begin
   FInserting := False ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsLstSaidaEstoque.IsEmpty ) and not ( cdsLstSaidaEstoque.State in [dsInsert,dsEdit] )  then
     cdsLstSaidaEstoque.Append ;
  FInserting := True ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin
  LErrMsg := TStringBuilder.Create ;

  if cdsEstoqueKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  if (cdsApropriacao.IsEmpty) then
    LErrMsg.AppendLine('Centro de custo deve ser pesquisado/selecionado.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

  if FInserting  then
    FLastDate := self.cdsEstoqueDATA.AsDateTime ;

end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueCalcFields(DataSet: TDataSet);
begin
try
  if DataSet.State in [ dsInternalCalc ] then
    begin
      cdsEstoqueTOTAL_ESTOQUE.AsFloat := cdsEstoqueQTDE_PRODUTO.AsFloat * cdsEstoqueCUSTO.AsFloat ;
      exit ;
    end ;

  cdsEstoque.OnCalcFields := nil ;
  cdsEstoqueTOTAL.AsFloat := cdsEstoqueQTDE.AsFloat * cdsEstoqueCUSTO.AsFloat ;
  cdsEstoqueTOTAL_ESTOQUE.AsFloat := cdsEstoqueQTDE_PRODUTO.AsFloat * cdsEstoqueCUSTO.AsFloat ;
  cdsEstoque.OnCalcFields := cdsEstoqueCalcFields ;
except

end;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueCODIGOSetText(Sender: TField; const Text: string);
begin
  cdsEstoqueKEST_PRODUTO.Clear;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueCUSTOValidate(Sender: TField);
begin
  if (Sender.AsFloat < 0 ) or (Sender.IsNull) then
    Sender.AsFloat := 0 ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date + 1 then
    raise Warning.Create('Data não pode ser superior a data atual.');
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsLstSaidaEstoqueCalcFields(DataSet: TDataSet);
begin
  cdsLstSaidaEstoqueTOTAL.AsFloat := cdsLstSaidaEstoqueQTDE.AsFloat * cdsLstSaidaEstoqueCUSTO_MEDIO.AsFloat ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsLstSaidaEstoqueNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsEstoqueKSYSDOMAIN.AsString := LoggedUser.DomainID;
  cdsEstoqueTIPO.AsString         := 'S';
  cdsEstoqueQTDE.asFloat          := 1.00 ;

  if FLastDate = 0 then
     cdsEstoqueDATA.AsDateTime       := Now
  else
     cdsEstoqueDATA.AsDateTime       := FLastDate ;

end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueNOMESetText(Sender: TField; const Text: string);
begin
  cdsEstoqueNOME.Clear;
  cdsEstoqueKEST_PRODUTO.Clear;
end;

procedure TFIN_SaidaEstoqueDatamodule.cdsEstoqueQTDEValidate(Sender: TField);
begin
  if ( Sender.AsFloat < 0 ) or ( Sender.IsNull ) then
    raise Warning.Create( 'Quantidade inválida.' );
end;

end.

