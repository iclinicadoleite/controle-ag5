unit UFIN_EntradaEstoqueDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TFIN_EntradaEstoqueDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstEstoque: TClientDataSet;
    dspLstEstoque: TDataSetProvider;
    sqlLstEstoque: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    sqlLstEstoqueKSYSDOMAIN: TStringField;
    sqlLstEstoqueCODIGO_LANCAMENTO: TStringField;
    sqlLstEstoqueCODIGO: TStringField;
    sqlLstEstoqueNOME: TStringField;
    sqlLstEstoqueDESCRICAO: TMemoField;
    sqlLstEstoqueUNIDADE: TStringField;
    sqlLstEstoqueTIPO: TStringField;
    sqlLstEstoqueQTDE: TFloatField;
    sqlLstEstoqueCUSTO: TFloatField;
    cdsLstEstoqueKEST_OUTRA_ENTRADA_SAIDA: TStringField;
    cdsLstEstoqueKSYSDOMAIN: TStringField;
    cdsLstEstoqueCODIGO_LANCAMENTO: TStringField;
    cdsLstEstoqueCODIGO: TStringField;
    cdsLstEstoqueNOME: TStringField;
    cdsLstEstoqueDESCRICAO: TMemoField;
    cdsLstEstoqueUNIDADE: TStringField;
    cdsLstEstoqueTIPO: TStringField;
    cdsLstEstoqueQTDE: TFloatField;
    cdsLstEstoqueCUSTO: TFloatField;
    sqlLstEstoqueDATA: TSQLTimeStampField;
    cdsLstEstoqueDATA: TSQLTimeStampField;
    sqlLstEstoqueOBS: TMemoField;
    cdsLstEstoqueOBS: TMemoField;
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
    cdsLstEstoqueTOTAL: TFloatField;
    sqlEstoqueKCAD_ENTIDADE: TStringField;
    sqlEstoqueNOMEENTIDADE: TStringField;
    cdsEstoqueKCAD_ENTIDADE: TStringField;
    cdsEstoqueNOMEENTIDADE: TStringField;
    sqlLstEstoqueKCAD_ENTIDADE: TStringField;
    sqlLstEstoqueNOMEENTIDADE: TStringField;
    cdsLstEstoqueKCAD_ENTIDADE: TStringField;
    cdsLstEstoqueNOMEENTIDADE: TStringField;
    sqlEstoqueCUSTO: TFloatField;
    sqlApropriacaoTABLENAME: TStringField;
    sqlApropriacaoTABLEKEY: TStringField;
    cdsApropriacaoTABLENAME: TStringField;
    cdsApropriacaoTABLEKEY: TStringField;
    sqlEstoqueCUSTO_MEDIO: TFloatField;
    sqlEstoqueQTDE_PRODUTO: TFloatField;
    sqlEstoqueQTDE_MINIMA: TFloatField;
    cdsEstoqueCUSTO_MEDIO: TFloatField;
    cdsEstoqueQTDE_PRODUTO: TFloatField;
    cdsEstoqueQTDE_MINIMA: TFloatField;
    cdsEstoqueTOTAL_ESTOQUE: TFloatField;
    procedure cdsLstEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsLstEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsEstoqueCUSTOValidate(Sender: TField);
    procedure cdsEstoqueNOMEENTIDADESetText(Sender: TField; const Text: string);
    procedure cdsEstoqueNOMESetText(Sender: TField; const Text: string);
    procedure cdsEstoqueQTDEValidate(Sender: TField);
    procedure cdsEstoqueDATAValidate(Sender: TField);
    procedure cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsEstoqueBeforePost(DataSet: TDataSet);
    procedure cdsEstoqueBeforeInsert(DataSet: TDataSet);
    procedure cdsEstoqueAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    FInserting : boolean ;
    FLastDate : TDateTime ;
    FK_PLANOESTOQUE : string ;
    FInicioPeriodo : TDateTime ;
    FFimPeriodo    : TDateTime ;
    procedure SetParams;
    procedure InitPlanoContaEstoque ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetProduto( Key, CodigoProduto, NomeProduto, Unidade, Descricao : String ;
    Custo_Medio : Double ; AEstoqueAtual : double ;
    AFIN_PLANOCONTA, ADescricaoPlanoConta  : string ; AControlaEstoque : boolean );
    procedure SetEntidade( Key, Nome : String );
    procedure SetFilter ( DataInicial, DataFinal : TDateTime );
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, DateUtils, Exceptions
     , SQLTimSt
     , DataSnap.DSConnect
      ;

{$R *.dfm}


{ TrdmFIN_EntradaEstoqueDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_EntradaEstoqueDatamodule.Create(AOwner: TComponent);
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

procedure TFIN_EntradaEstoqueDatamodule.OpenTables;
begin
  InitPlanoContaEstoque ;
  SetParams;
  inherited;
end;

procedure TFIN_EntradaEstoqueDatamodule.SetParams;
begin
  cdsLstEstoque.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID;
  cdsLstEstoque.ParamByName ( 'DI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  FInicioPeriodo ) ) ;
  cdsLstEstoque.ParamByName ( 'DF' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay   (  FFimPeriodo  ) ) ;
end;

procedure TFIN_EntradaEstoqueDatamodule.SetEntidade(Key, Nome: String);
begin
  if not ( cdsEstoque.State in [dsInsert, dsEdit] ) then
    cdsEstoque.Edit;

  cdsEstoqueKCAD_ENTIDADE.asString := Key;
  cdsEstoqueNOMEENTIDADE.asString  := Nome;
end;

procedure TFIN_EntradaEstoqueDatamodule.SetFilter( DataInicial, DataFinal: TDateTime);
begin
  FInicioPeriodo := StartOfTheDay ( DataInicial ) ;
  FFimPeriodo    := EndOfTheDay ( DataFinal ) ;
  SetParams ;
  self.RefreshList ;
end;

procedure TFIN_EntradaEstoqueDatamodule.SetProduto(Key, CodigoProduto, NomeProduto, Unidade, Descricao : String ;
     Custo_Medio : Double ; AEstoqueAtual : double ; AFIN_PLANOCONTA, ADescricaoPlanoConta  : string ; AControlaEstoque : boolean );
begin
  if not ( cdsEstoque.State in [dsInsert, dsEdit] ) then
    cdsEstoque.Edit;

  cdsEstoqueKEST_PRODUTO.asString := Key;
  cdsEstoqueCODIGO.asString       := CodigoProduto;
  cdsEstoqueNOME.asString         := NomeProduto;
  cdsEstoqueUNIDADE.AsString      := Unidade;
  cdsEstoqueDESCRICAO.AsString    := Descricao;
  cdsEstoqueCUSTO_MEDIO.asFloat   := Custo_Medio ;
  cdsEstoqueQTDE_PRODUTO.asFloat  := AEstoqueAtual ;

  if AControlaEstoque then
    begin
      cdsEstoqueDESCR_PC_NOME.asString   := 'Estoque' ;
      cdsEstoqueKFIN_PLANOCONTA.asString := FK_PLANOESTOQUE ;
    end
//  else if not AFIN_PLANOCONTA.Trim.IsEmpty then
//    begin
//      cdsEstoqueDESCR_PC_NOME.asString   := ADescricaoPlanoConta ;
//      cdsEstoqueKFIN_PLANOCONTA.asString := AFIN_PLANOCONTA ;
//    end;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsLstEstoqueCalcFields(DataSet: TDataSet);
begin
  cdsLstEstoqueTOTAL.AsFloat := ( cdsLstEstoqueCUSTO.AsFloat * cdsLstEstoqueQTDE.AsFloat );
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsLstEstoqueNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TFIN_EntradaEstoqueDatamodule.InitPlanoContaEstoque;
const
 _SELECT_PLANOESTOQUE =
    'SELECT KFIN_PLANOCONTA FROM FIN_PLANOCONTAS WHERE KDEF_PLANOCONTA = ''W@)uq2^5:hOF:p/?aUmm''' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANOESTOQUE ) ;
  FK_PLANOESTOQUE := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  cds.Free ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueAfterCancel(
  DataSet: TDataSet);
begin
  FInserting := False ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsLstEstoque.IsEmpty ) and not ( cdsLstEstoque.State in [dsInsert,dsEdit] )  then
     cdsLstEstoque.Append ;
  FInserting := True ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueBeforePost(DataSet: TDataSet);
var
  LErrMsg : TStringBuilder ;
begin
  LErrMsg := TStringBuilder.Create ;

  if cdsEstoqueKFIN_PLANOCONTA.IsNull then
    LErrMsg.AppendLine('Conta contábil deve ser pesquisada/selecionada.');

  try
    if LErrMsg.Length > 0 then
       raise Warning.Create( LErrMsg.ToString )
  finally
    LErrMsg.Free ;
  end;

  if FInserting then
    FLastDate := self.cdsEstoqueDATA.AsDateTime ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueCalcFields(DataSet: TDataSet);
begin
try
  if DataSet.State in [ dsInternalCalc ] then
    begin
      cdsEstoqueTOTAL_ESTOQUE.AsFloat := cdsEstoqueQTDE_PRODUTO.AsFloat * cdsEstoqueCUSTO_MEDIO.AsFloat ;
      exit ;
    end ;

  cdsEstoque.OnCalcFields := nil ;
  cdsEstoqueTOTAL.asFloat := cdsEstoqueQTDE.asFloat * cdsEstoqueCUSTO.asFloat ;
  cdsEstoqueTOTAL_ESTOQUE.AsFloat := cdsEstoqueQTDE_PRODUTO.AsFloat * cdsEstoqueCUSTO_MEDIO.AsFloat ;
  cdsEstoque.OnCalcFields := cdsEstoqueCalcFields ;
except

end;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueCUSTOValidate(Sender: TField);
begin
  if ( Sender.AsFloat < 0 ) or ( Sender.IsNull ) then
    raise Warning.Create( 'Valor unitário inválido.' );
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime > EndOfTheDay( Date ) then
    raise Warning.Create('Data não pode ser superior a data atual.');
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsEstoqueKSYSDOMAIN.AsString   := LoggedUser.DomainID;
  cdsEstoqueTIPO.AsString         := 'E'  ;

  if FLastDate = 0 then
     cdsEstoqueDATA.AsDateTime       := Now
  else
     cdsEstoqueDATA.AsDateTime       := FLastDate ;
end;


procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueNOMEENTIDADESetText(Sender: TField; const Text: string);
begin
  cdsEstoqueNOMEENTIDADE.Clear  ;
  cdsEstoqueKCAD_ENTIDADE.Clear ;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueNOMESetText(Sender: TField; const Text: string);
begin
  cdsEstoqueNOME.Clear;
  cdsEstoqueKEST_PRODUTO.Clear;
end;

procedure TFIN_EntradaEstoqueDatamodule.cdsEstoqueQTDEValidate(Sender: TField);
begin
  if ( Sender.AsFloat < 0 ) or ( Sender.IsNull ) then
    raise Warning.Create( 'Quantidade inválida.' );
end;


end.
