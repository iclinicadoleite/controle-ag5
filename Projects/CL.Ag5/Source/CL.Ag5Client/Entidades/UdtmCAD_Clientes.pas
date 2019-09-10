unit UdtmCAD_Clientes;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Validates, Data.FMTBcd, Datasnap.Provider,
  Data.SqlExpr, Data.DBXCommon,
  CLAG5Types, Tc.DBRTL.AbstractDB,
  CLAg5SvcEntidadesCadastroClientes, Dialogs, Tc.Data.SQLExpr  ;

type
  TdtmCAD_Clientes = class(T_dtmBASEDBListEdit)
    cdsLstEntidades: TClientDataSet;
    cdsEntidade: TClientDataSet;
    dtsList: TDataSource;
    cdsEndereco: TClientDataSet;
    cdsEnderecoCobranca: TClientDataSet;
    cdsEnderecoEntrega: TClientDataSet;
    cdsEnderecoKGLB_ENDERECO: TStringField;
    cdsEnderecoENDERECO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCXPOSTAL: TStringField;
    cdsEnderecoCobrancaKGLB_ENDERECO: TStringField;
    cdsEnderecoCobrancaENDERECO: TStringField;
    cdsEnderecoCobrancaCOMPLEMENTO: TStringField;
    cdsEnderecoCobrancaBAIRRO: TStringField;
    cdsEnderecoCobrancaCEP: TStringField;
    cdsEnderecoCobrancaCIDADE: TStringField;
    cdsEnderecoCobrancaUF: TStringField;
    cdsEnderecoCobrancaCXPOSTAL: TStringField;
    cdsEnderecoEntregaKGLB_ENDERECO: TStringField;
    cdsEnderecoEntregaENDERECO: TStringField;
    cdsEnderecoEntregaCOMPLEMENTO: TStringField;
    cdsEnderecoEntregaBAIRRO: TStringField;
    cdsEnderecoEntregaCEP: TStringField;
    cdsEnderecoEntregaCIDADE: TStringField;
    cdsEnderecoEntregaUF: TStringField;
    cdsEnderecoEntregaCXPOSTAL: TStringField;
    cdsEnderecoTABLENAME: TStringField;
    cdsEnderecoTABLEKEY: TStringField;
    cdsEnderecoCobrancaTABLENAME: TStringField;
    cdsEnderecoCobrancaTABLEKEY: TStringField;
    cdsEnderecoEntregaTABLENAME: TStringField;
    cdsEnderecoEntregaTABLEKEY: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCobrancaNUMERO: TStringField;
    cdsEnderecoEntregaNUMERO: TStringField;
    cdsEntidadePESSOA: TStringField;
    cdsEntidadeCPF_CNPJ: TStringField;
    cdsOutrosEnderecos: TClientDataSet;
    cdsOutrosEnderecosKGLB_ENDERECO: TStringField;
    cdsOutrosEnderecosTABLENAME: TStringField;
    cdsOutrosEnderecosTABLEKEY: TStringField;
    cdsOutrosEnderecosENDERECO: TStringField;
    cdsOutrosEnderecosNUMERO: TStringField;
    cdsOutrosEnderecosCOMPLEMENTO: TStringField;
    cdsOutrosEnderecosBAIRRO: TStringField;
    cdsOutrosEnderecosCEP: TStringField;
    cdsOutrosEnderecosCIDADE: TStringField;
    cdsOutrosEnderecosUF: TStringField;
    cdsOutrosEnderecosCXPOSTAL: TStringField;
    cdsContatos: TClientDataSet;
    cdsContatosKCAD_CONTATO: TIntegerField;
    cdsContatosKCAD_ENTIDADE: TStringField;
    cdsContatosNOME: TStringField;
    cdsContatosDEPTO: TStringField;
    cdsContatosEMAIL: TStringField;
    cdsContatosCELULAR: TStringField;
    cdsContatosFONE1: TStringField;
    cdsContatosFONE2: TStringField;
    cdsContatosFAX: TStringField;
    sqlLstEntidades: TTcSQLDataSet;
    sqlEntidade: TTcSQLDataSet;
    dtsSQLEdit: TDataSource;
    sqlEndereco: TTcSQLDataSet;
    sqlEnderecoKGLB_ENDERECO: TStringField;
    sqlEnderecoENDERECO: TStringField;
    sqlEnderecoNUMERO: TStringField;
    sqlEnderecoCOMPLEMENTO: TStringField;
    sqlEnderecoBAIRRO: TStringField;
    sqlEnderecoCEP: TStringField;
    sqlEnderecoCIDADE: TStringField;
    sqlEnderecoUF: TStringField;
    sqlEnderecoCXPOSTAL: TStringField;
    sqlEnderecoCobranca: TTcSQLDataSet;
    sqlEnderecoCobrancaKGLB_ENDERECO: TStringField;
    sqlEnderecoCobrancaENDERECO: TStringField;
    sqlEnderecoCobrancaNUMERO: TStringField;
    sqlEnderecoCobrancaCOMPLEMENTO: TStringField;
    sqlEnderecoCobrancaBAIRRO: TStringField;
    sqlEnderecoCobrancaCEP: TStringField;
    sqlEnderecoCobrancaCIDADE: TStringField;
    sqlEnderecoCobrancaUF: TStringField;
    sqlEnderecoCobrancaCXPOSTAL: TStringField;
    sqlEnderecoEntrega: TTcSQLDataSet;
    sqlEnderecoEntregaKGLB_ENDERECO: TStringField;
    sqlEnderecoEntregaENDERECO: TStringField;
    sqlEnderecoEntregaNUMERO: TStringField;
    sqlEnderecoEntregaCOMPLEMENTO: TStringField;
    sqlEnderecoEntregaBAIRRO: TStringField;
    sqlEnderecoEntregaCEP: TStringField;
    sqlEnderecoEntregaCIDADE: TStringField;
    sqlEnderecoEntregaUF: TStringField;
    sqlEnderecoEntregaCXPOSTAL: TStringField;
    sqlOutrosEnderecos: TTcSQLDataSet;
    sqlOutrosEnderecosKGLB_ENDERECO: TStringField;
    sqlOutrosEnderecosENDERECO: TStringField;
    sqlOutrosEnderecosNUMERO: TStringField;
    sqlOutrosEnderecosCOMPLEMENTO: TStringField;
    sqlOutrosEnderecosBAIRRO: TStringField;
    sqlOutrosEnderecosCEP: TStringField;
    sqlOutrosEnderecosCIDADE: TStringField;
    sqlOutrosEnderecosUF: TStringField;
    sqlOutrosEnderecosCXPOSTAL: TStringField;
    sqlContatos: TTcSQLDataSet;
    sqlContatosKCAD_CONTATO: TIntegerField;
    sqlContatosKCAD_ENTIDADE: TStringField;
    sqlContatosNOME: TStringField;
    sqlContatosDEPTO: TStringField;
    sqlContatosEMAIL: TStringField;
    sqlContatosCELULAR: TStringField;
    sqlContatosFONE1: TStringField;
    sqlContatosFONE2: TStringField;
    sqlContatosFAX: TStringField;
    dspLstEntidades: TDataSetProvider;
    dspEntidade: TDataSetProvider;
    sqlEntidadeKSYSDOMAIN: TStringField;
    sqlEntidadeCODIGO: TStringField;
    sqlEntidadeAPELIDO: TStringField;
    sqlEntidadeNOME: TStringField;
    sqlEntidadeATIVO: TStringField;
    sqlEntidadeKENDERECO: TStringField;
    sqlEntidadePESSOA: TStringField;
    sqlEntidadeCPF_CNPJ: TStringField;
    sqlEntidadeRG_IE: TStringField;
    sqlEntidadeURL: TStringField;
    sqlEntidadeEMAIL: TStringField;
    sqlEntidadeIS_CLIENTE: TStringField;
    sqlEntidadeIS_FORNECEDOR: TStringField;
    sqlEntidadeIS_FUNCIONARIO: TStringField;
    sqlEntidadeIS_TRANSPORTADORA: TStringField;
    sqlEntidadeOBS: TMemoField;
    sqlEntidadeFONE: TStringField;
    sqlEntidadeRAMAL: TStringField;
    sqlEntidadeFAX: TStringField;
    sqlEnderecoTABLENAME: TStringField;
    sqlEnderecoTABLEKEY: TStringField;
    sqlEnderecoCobrancaTABLENAME: TStringField;
    sqlEnderecoCobrancaTABLEKEY: TStringField;
    sqlEnderecoEntregaTABLENAME: TStringField;
    sqlEnderecoEntregaTABLEKEY: TStringField;
    sqlOutrosEnderecosTABLENAME: TStringField;
    sqlOutrosEnderecosTABLEKEY: TStringField;
    cdsEntidadeKSYSDOMAIN: TStringField;
    cdsEntidadeCODIGO: TStringField;
    cdsEntidadeAPELIDO: TStringField;
    cdsEntidadeNOME: TStringField;
    cdsEntidadeATIVO: TStringField;
    cdsEntidadeKENDERECO: TStringField;
    cdsEntidadeRG_IE: TStringField;
    cdsEntidadeURL: TStringField;
    cdsEntidadeEMAIL: TStringField;
    cdsEntidadeIS_CLIENTE: TStringField;
    cdsEntidadeIS_FORNECEDOR: TStringField;
    cdsEntidadeIS_FUNCIONARIO: TStringField;
    cdsEntidadeIS_TRANSPORTADORA: TStringField;
    cdsEntidadeOBS: TMemoField;
    cdsEntidadeFONE: TStringField;
    cdsEntidadeRAMAL: TStringField;
    cdsEntidadeFAX: TStringField;
    cdsEntidadesqlOutrosEnderecos: TDataSetField;
    cdsEntidadesqlEndereco: TDataSetField;
    sqlEntidadeKCAD_ENTIDADE: TStringField;
    cdsEntidadeKCAD_ENTIDADE: TStringField;
    sqlEntidadeGRUPO_CLIENTE: TStringField;
    cdsEntidadeGRUPO_CLIENTE: TStringField;
    sqlEnderecoCONTATO: TStringField;
    cdsEnderecoCONTATO: TStringField;
    sqlOutrosEnderecosCONTATO: TStringField;
    cdsOutrosEnderecosCONTATO: TStringField;
    sqlEntidadeGRUPO: TStringField;
    cdsEntidadeGRUPO: TStringField;
    sqlDadosFinanceiro: TTcSQLDataSet;
    sqlDadosFinanceiroKCAD_ENTIDADE: TStringField;
    sqlDadosFinanceiroCODIGO: TStringField;
    sqlDadosFinanceiroAPELIDO: TStringField;
    sqlDadosFinanceiroNOME: TStringField;
    sqlDadosFinanceiroKFIN_PLANOCONTA: TStringField;
    dspDadosFinanceiro: TDataSetProvider;
    cdsDadosFinanceiro: TClientDataSet;
    cdsDadosFinanceiroKCAD_ENTIDADE: TStringField;
    cdsDadosFinanceiroCODIGO: TStringField;
    cdsDadosFinanceiroAPELIDO: TStringField;
    cdsDadosFinanceiroNOME: TStringField;
    cdsDadosFinanceiroKFIN_PLANOCONTA: TStringField;
    dtsEntidade: TDataSource;
    sqlOutrosEnderecosFONE: TStringField;
    cdsOutrosEnderecosFONE: TStringField;
    sqlEnderecoFONE: TStringField;
    cdsEnderecoFONE: TStringField;
    sqlLstEntidadesKCAD_ENTIDADE: TStringField;
    sqlLstEntidadesGRUPO: TStringField;
    sqlLstEntidadesCODIGO: TStringField;
    sqlLstEntidadesAPELIDO: TStringField;
    sqlLstEntidadesNOME: TStringField;
    sqlLstEntidadesCPF_CNPJ: TStringField;
    sqlLstEntidadesPESSOA: TStringField;
    sqlLstEntidadesFONE: TStringField;
    sqlLstEntidadesATIVO: TStringField;
    cdsLstEntidadesKCAD_ENTIDADE: TStringField;
    cdsLstEntidadesGRUPO: TStringField;
    cdsLstEntidadesCODIGO: TStringField;
    cdsLstEntidadesAPELIDO: TStringField;
    cdsLstEntidadesNOME: TStringField;
    cdsLstEntidadesCPF_CNPJ: TStringField;
    cdsLstEntidadesPESSOA: TStringField;
    cdsLstEntidadesFONE: TStringField;
    cdsLstEntidadesATIVO: TStringField;
    sqlDadosFinanceiroBANCO: TStringField;
    sqlDadosFinanceiroAGENCIA: TStringField;
    sqlDadosFinanceiroCONTA: TStringField;
    cdsDadosFinanceiroBANCO: TStringField;
    cdsDadosFinanceiroAGENCIA: TStringField;
    cdsDadosFinanceiroCONTA: TStringField;
    cdsApropriacaoEntidade: TClientDataSet;
    cdsApropriacaoEntidadeKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoEntidadeKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoEntidadeNOME: TStringField;
    cdsApropriacaoEntidadeCODIGO: TIntegerField;
    cdsApropriacaoEntidadeCLASSIFICACAO: TStringField;
    cdsApropriacaoEntidadePORCENTAGEM: TFloatField;
    cdsApropriacaoEntidadeTABLENAME: TStringField;
    cdsApropriacaoEntidadeTABLEKEY: TStringField;
    cdsApropriacaoEntidadeTOTAL_PORCENTAGEM: TAggregateField;
    sqlApropriacaoEntidade: TTcSQLDataSet;
    sqlApropriacaoEntidadeKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoEntidadeKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoEntidadePORCENTAGEM: TFloatField;
    sqlApropriacaoEntidadeNOME: TStringField;
    sqlApropriacaoEntidadeCODIGO: TIntegerField;
    sqlApropriacaoEntidadeCLASSIFICACAO: TStringField;
    sqlApropriacaoEntidadeTABLENAME: TStringField;
    sqlApropriacaoEntidadeTABLEKEY: TStringField;
    dtsSQLDadosFinanceiro: TDataSource;
    cdsDadosFinanceirosqlApropriacaoEntidade: TDataSetField;
    sqlDadosFinanceiroDESCR_PC_NOME: TStringField;
    sqlDadosFinanceiroDESCR_PC_CODIGO: TIntegerField;
    sqlDadosFinanceiroDESCR_PC_CLASSIFICACAO: TStringField;
    sqlDadosFinanceiroDESCR_PC_TIPO_APRD: TStringField;
    cdsDadosFinanceiroDESCR_PC_NOME: TStringField;
    cdsDadosFinanceiroDESCR_PC_CODIGO: TIntegerField;
    cdsDadosFinanceiroDESCR_PC_CLASSIFICACAO: TStringField;
    cdsDadosFinanceiroDESCR_PC_TIPO_APRD: TStringField;
    procedure cdsLstEntidadesNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoCobrancaNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoEntregaNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoCobrancaBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoEntregaBeforeInsert(DataSet: TDataSet);
    procedure cdsOutrosEnderecosBeforeInsert(DataSet: TDataSet);
    procedure cdsOutrosEnderecosNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeBeforeInsert(DataSet: TDataSet);
    procedure cdsContatosBeforeInsert(DataSet: TDataSet);
    procedure cdsContatosNewRecord(DataSet: TDataSet);
    procedure cdsEntidadePESSOAChange(Sender: TField);
    procedure cdsEntidadeCPF_CNPJValidate(Sender: TField);
    procedure cdsLstEntidadesBeforeOpen(DataSet: TDataSet);
    procedure cdsLstEntidadesATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsEntidadeCalcFields(DataSet: TDataSet);
    procedure cdsEntidadeDDSFATValidate(Sender: TField);
    procedure cdsEntidadeEMAILValidate(Sender: TField);
    procedure cdsLstEntidadesPESSOAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsEntidadeAPELIDOSetText(Sender: TField; const Text: string);
    procedure cdsEntidadeNOMESetText(Sender: TField; const Text: string);
    procedure cdsEntidadeFONESetText(Sender: TField; const Text: string);
    procedure cdsDadosFinanceiroBeforeEdit(DataSet: TDataSet);
//    procedure dspDadosFinanceiroBeforeUpdateRecord(Sender: TObject;
//      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
//      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsDadosFinanceiroDESC_PLANOCONTASetText(Sender: TField; const Text: string);
    procedure cdsDadosFinanceiroBeforePost(DataSet: TDataSet);
    procedure cdsDadosFinanceiroAfterInsert(DataSet: TDataSet);
    procedure cdsDadosFinanceiroCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsEntidadeBeforeDelete(DataSet: TDataSet);
    procedure dspEntidadeBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    { Private declarations }
    FClienteInfo : PClienteInfo ;
    FShowInativos,
    FShowClientes,
    FShowFornecedores,
    FShowFuncionarios,
    FShowVendedores,
    FShowRepresentantes,
    FShowCompradores,
    FShowTransportadora : Boolean ;
    Fmask : String;
    procedure SetParams ;
  public
    { Public declarations }
    FNewCadastro     : Boolean ;
    procedure SetFilter ( ShowInativos, ShowClientes, ShowFornecedores,
       ShowFuncionarios, ShowVendedores,ShowRepresentantes, ShowCompradores, ShowTransportadora : Boolean );
    procedure OpenTables ; override ;
    procedure RefreshList ; override ;
    procedure SetGrupoCliente( Key: String; NomeGrupo: string ) ;
    // deprecated ...
    //procedure SetPlanoConta( Key, Nome, Classificacao: string; Codigo: Integer ) ;
    procedure InitDDSFat ;
    procedure SetValidateDDSFat ( Event : TFieldNotifyEvent  ) ;

    procedure SetCondPagto ( Key : integer ;Condicao : string ) ;
    procedure SetTransportadora(Key: integer; NomeTransportadora : string ) ;
    procedure SetRedespacho ( Key : integer ;NomeRedespacho : string ) ;
    procedure SetVendedor ( Key : integer ;NomeVendedor : string ) ;
    procedure ApplyUpdates ; override ;
    procedure CancelUpdates ; override ;
    procedure UpdateFromInfo ( var AClienteInfo : TClienteInfo ) ;
  end;

implementation
{.$DEFINE _NEVER_COMPILE}

uses UDBEntidades, Exceptions, Data.SQLTimSt, MaskUtils
    {$IFDEF _NEVER_COMPILE}, UDBFinanceiro {$ENDIF},
     CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

resourcestring
  _CPF_JACADASTRADO  = 'CPF ''%s'' ja cadastrado' ;
  _CNPJ_JACADASTRADO = 'CNPJ ''%s'' ja cadastrado' ;

const
   _MASK_CPF = '999\.999\.999\-99' ;
   _MASK_CNPJ = '99\.999\.999\/9999\-99' ;

{ TdtmCAD_Entidades }

procedure TdtmCAD_Clientes.OpenTables;
var
  FinanceiroInitialized : boolean ;
begin
   if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    Fmask :=  SvcFinanceiroMascaraPlanoContas.GetMascara
   else
    Fmask :=  _ST_PLANO_CONTAS_MASK ;

  inherited;

  FinanceiroInitialized := Assigned ( TTcAbstractDB.GetByAlias('FINANCEIRO') ) ;

  if not FinanceiroInitialized then
     cdsDadosFinanceiro.MasterSource := nil ;

  if not cdsLstEntidades.IsEmpty then
     cdsEntidade.RefreshRecord ;

  if FinanceiroInitialized then
     begin
       sqlDadosFinanceiro.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
       cdsDadosFinanceiro.Open ;
     end;
end;

procedure TdtmCAD_Clientes.cdsLstEntidadesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmCAD_Clientes.cdsLstEntidadesPESSOAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'PESSOA' ).asString = 'F' then
      Text := 'Física'
    else
      Text := 'Jurídica';
end;

procedure TdtmCAD_Clientes.cdsEntidadeNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsEntidadePESSOA.AsString            := 'F' ;
  cdsEntidadeATIVO.AsString             := 'T' ;
  cdsEntidadeIS_CLIENTE.AsString        := 'T' ;
  cdsEntidadeIS_FORNECEDOR.AsString     := 'F' ;
  cdsEntidadeIS_FUNCIONARIO.AsString    := 'F' ;
  cdsEntidadeIS_TRANSPORTADORA.AsString := 'F' ;
  cdsEntidadeKSYSDOMAIN.Value           := LoggedUser.DomainID ;

//  cdsEntidadeDDSFAT.asString            := 'FTTTTTF' ; // - dom, sab

//  cdsEntidadeDATACADASTRO.AsDateTime   := Now ;

end;

procedure TdtmCAD_Clientes.cdsEntidadeNOMESetText(Sender: TField; const Text: string);
begin
  if Trim ( Text ) = EmptyStr then
    Sender.Clear
  else
    Sender.asString := Trim ( Text ) ;

  if ( Sender.AsString <> '' ) and (Trim ( cdsEntidadeAPELIDO.AsString ) = '')  then
      cdsEntidadeAPELIDO.AsString := Sender.AsString ;
end;

procedure TdtmCAD_Clientes.cdsEntidadeAPELIDOSetText(Sender: TField; const Text: string);
begin
  if Trim ( Text ) = EmptyStr then
    Sender.Clear
  else
    Sender.asString := Trim ( Text ) ;
end;

procedure TdtmCAD_Clientes.cdsEntidadeBeforeDelete(DataSet: TDataSet);

const

   // Verificar se o cliente possui registros em compra
   _SQL_COMPRA   = 'DISTINCT C.KCAD_ENTIDADE FROM CMP_PEDIDOS C ' +
   #13#10'WHERE C.KCAD_ENTIDADE = :KEY ROWS 1' ;

   // Verificar se o cliente possui registros em venda
   _SQL_VENDA    = 'DISTINCT V.KCAD_ENTIDADE FROM VND_PEDIDOS V ' +
   #13#10'WHERE V.KCAD_ENTIDADE = :KEY ROWS 1' ;

   // Verificar se o cliente possui contas a pagar
   _SQL_APAGAR   = 'DISTINCT P.KCAD_ENTIDADE FROM FIN_APAGAR P ' +
   #13#10'WHERE P.KCAD_ENTIDADE = :KEY ROWS 1' ;

   // Verificar se o cliente possui contas a receber
   _SQL_ARECEBER = 'DISTINCT R.KCAD_ENTIDADE FROM FIN_ARECEBER R ' +
   #13#10'WHERE R.KCAD_ENTIDADE = :KEY ROWS 1' ;

var
  cds : TClientDataSet ;
  total : integer;
  p : TParams ;
begin

  try
    //contador de registros encontrados
    total := 0;

    {
        Popula cada uma das tabelas procurando por registros e incrementado o
      contador total
    }
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsEntidadeKCAD_ENTIDADE.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_COMPRA, p ) ;
    total := total + cds.RecordCount;

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsEntidadeKCAD_ENTIDADE.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_VENDA, p ) ;
    total := total + cds.RecordCount;

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsEntidadeKCAD_ENTIDADE.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_APAGAR, p ) ;
    total := total + cds.RecordCount;

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KEY', ptInput ).asString := cdsEntidadeKCAD_ENTIDADE.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_ARECEBER, p ) ;
    total := total + cds.RecordCount;

    // Se total for maior que zero, o cliente possui alguma movimentação
    if total > 0 then
      raise Warning.Create('Cliente possui movimentação.'+ #10#13 + 'Não é possível excluir.');

  finally
    p.free ;
    cds.free ;
  end;

end;

procedure TdtmCAD_Clientes.cdsEntidadeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstEntidades.IsEmpty ) and not ( cdsLstEntidades.State in [dsInsert,dsEdit] )  then
     cdsLstEntidades.Append ;
end;

procedure TdtmCAD_Clientes.cdsEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

  TCDSSuppl.PostIfNeed ( cdsDadosFinanceiro ) ;

  if cdsEntidadeKENDERECO.isNull then
     begin
         cdsEntidade.edit ;
         GetKey ( cdsEntidadeKENDERECO, 'KGLB_ENDERECO' ) ;
     end ;

end;

procedure TdtmCAD_Clientes.cdsEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEnderecoKGLB_ENDERECO.Value := cdsEntidadeKENDERECO.Value ;
  cdsEnderecoTABLENAME.asString  := 'CAD_ENTIDADES' ;
  cdsEnderecoTABLEKEY.Value      := cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Clientes.cdsEnderecoCobrancaBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;

  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

//  if cdsEntidadeKENDERECOCOBRANCA.isNull then
//     begin
//         cdsEntidade.edit ;
//         GetKey ( cdsEntidadeKENDERECOCOBRANCA, 'KGLB_ENDERECO' ) ;
//     end ;
end;

procedure TdtmCAD_Clientes.cdsEnderecoCobrancaNewRecord(
  DataSet: TDataSet);
begin
  inherited;
//  cdsEnderecoCobrancaKGLB_ENDERECO.Value := cdsEntidadeKENDERECOCOBRANCA.Value ;
//  cdsEnderecoCobrancaTABLENAME.asString      := 'CAD_ENTIDADES' ;
//  cdsEnderecoCobrancaTABLEKEY.Value      := cdsEntidadeKCAD_ENTIDADE.Value ; ;
end;


procedure TdtmCAD_Clientes.cdsEnderecoEntregaBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;

  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

//  if cdsEntidadeKENDERECOENTREGA.isNull then
//    begin
//       cdsEntidade.Edit ;
//       GetKey ( cdsEntidadeKENDERECOENTREGA, 'KGLB_ENDERECO' ) ;
//    end ;

end;

procedure TdtmCAD_Clientes.cdsEnderecoEntregaNewRecord(DataSet: TDataSet);
begin
  inherited;
//  cdsEnderecoEntregaKGLB_ENDERECO.Value := cdsEntidadeKENDERECOENTREGA.Value ;
//  cdsEnderecoEntregaTABLENAME.asString      := 'CAD_ENTIDADES' ;
//  cdsEnderecoEntregaTABLEKEY.Value      :=  cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Clientes.cdsOutrosEnderecosNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsOutrosEnderecosKGLB_ENDERECO, 'KGLB_ENDERECO' ) ;
  cdsOutrosEnderecosTABLENAME.asString := 'CAD_ENTIDADES' ;
  cdsOutrosEnderecosTABLEKEY.Value     :=  cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Clientes.dspEntidadeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  if ( UpdateKind = ukDelete ) and  ( SourceDS = sqlEntidade ) then
    begin
      Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias('ENTIDADES')
        .ExecuteDirect( Format ( 'UPDATE CAD_ENTIDADES SET SYS$DELETED = ''T'' WHERE KCAD_ENTIDADE = %s',
          [ QuotedStr ( DeltaDS.FieldByName('KCAD_ENTIDADE').OldValue ) ] ) ) ;
      Applied := True
    end;
end;

(*
procedure TdtmCAD_Clientes.dspDadosFinanceiroBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
 p : TParams ;
begin
  p := TParams.Create ;
  if ( UpdateKind = ukInsert ) then
    begin
       if VarIsNull ( DeltaDS.FieldByName('KFIN_PLANOCONTA').NewValue ) then
         p.CreateParam( ftString, 'KFIN_PLANOCONTA', ptInput ).Bound := False
       else
         p.CreateParam( ftString, 'KFIN_PLANOCONTA', ptInput ).asString := DeltaDS.FieldByName('KFIN_PLANOCONTA').NewValue ;

       p.CreateParam( ftString, 'KCAD_ENTIDADE', ptInput ).asString   := DeltaDS.FieldByName('KCAD_ENTIDADE').NewValue ;
       sqlDadosFinanceiro.SQLConnection.Execute( 'UPDATE CAD_ENTIDADES SET KFIN_PLANOCONTA = :KFIN_PLANOCONTA WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE', p ) ;
       Applied := True ;
    end
  else if ( UpdateKind = ukModify ) then
    begin
       if VarIsNull ( DeltaDS.FieldByName('KFIN_PLANOCONTA').NewValue ) then
         p.CreateParam( ftString, 'KFIN_PLANOCONTA', ptInput ).Bound := False
       else
         p.CreateParam( ftString, 'KFIN_PLANOCONTA', ptInput ).asString := DeltaDS.FieldByName('KFIN_PLANOCONTA').NewValue ;

       p.CreateParam( ftString, 'KCAD_ENTIDADE', ptInput ).asString   := DeltaDS.FieldByName('KCAD_ENTIDADE').OldValue ;
       sqlDadosFinanceiro.SQLConnection.Execute( 'UPDATE CAD_ENTIDADES SET KFIN_PLANOCONTA = :KFIN_PLANOCONTA WHERE KCAD_ENTIDADE = :KCAD_ENTIDADE', p ) ;
       Applied := True ;
    end;
  p.free ;
end;
*)

procedure TdtmCAD_Clientes.cdsOutrosEnderecosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

  TCDSSuppl.PostIfNeed ( cdsDadosFinanceiro ) ;
//     cdsEntidade.Edit ;
end;

procedure TdtmCAD_Clientes.ApplyUpdates;
begin

  if not ( cdsEntidade.bof and cdsEntidade.Eof ) then
    begin
      if not (cdsEntidadeIS_CLIENTE.asBoolean
          or cdsEntidadeIS_FORNECEDOR.asBoolean
          or cdsEntidadeIS_FUNCIONARIO.asBoolean
          or cdsEntidadeIS_TRANSPORTADORA.asBoolean ) then
          raise Warning.Create('é necessário escolher pelo menos um tipo de relacionamento');
    end;

  if  ( not ((cdsEntidade.State in [dsInsert,dsEdit]) or (cdsEntidade.ChangeCount <> 0)) )
   and( not ((cdsDadosFinanceiro.State in [dsInsert,dsEdit]) or (cdsDadosFinanceiro.ChangeCount <> 0)) ) then
   exit ;

  TCDSSuppl.PostIfNeed (cdsDadosFinanceiro) ;
  TCDSSuppl.PostIfNeed (cdsEntidade) ;

  if ( cdsDadosFinanceiroKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsDadosFinanceiroKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacaoEntidade.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');

  if (cdsDadosFinanceiro.ChangeCount <> 0) then
    TCDSSuppl.ApplyUpdates( cdsDadosFinanceiro ) ;

  inherited;

  if Assigned ( FClienteInfo )  then
    begin
      FClienteInfo.KCAD_Cliente    := cdsEntidadeKCAD_ENTIDADE.AsString   ;
      FClienteInfo.Razao           := cdsEntidadeNOME.AsString   ;
      FClienteInfo.Fantasia        := cdsEntidadeAPELIDO.AsString   ;

      FClienteInfo.CPF_CNPJ := cdsEntidadeCPF_CNPJ.AsString  ;
    end;

end;

procedure TdtmCAD_Clientes.CancelUpdates;
begin
  cdsDadosFinanceiro.CancelUpdates ;
  inherited;

end;

procedure TdtmCAD_Clientes.cdsContatosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;
end;

procedure TdtmCAD_Clientes.cdsContatosNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsContatosKCAD_CONTATO ) ;
end;

procedure TdtmCAD_Clientes.cdsDadosFinanceiroAfterInsert(DataSet: TDataSet);
begin
  cdsDadosFinanceiroKCAD_ENTIDADE.asString :=  cdsEntidadeKCAD_ENTIDADE.asString ;
end;

procedure TdtmCAD_Clientes.cdsDadosFinanceiroBeforeEdit(DataSet: TDataSet);
begin
  if not ( cdsEntidade.State in [dsInsert, dsEdit ] ) then
    cdsEntidade.Edit;
end;

procedure TdtmCAD_Clientes.cdsDadosFinanceiroBeforePost(DataSet: TDataSet);
begin
  if cdsDadosFinanceiroKCAD_ENTIDADE.asString <> cdsEntidadeKCAD_ENTIDADE.asString then
     cdsDadosFinanceiroKCAD_ENTIDADE.asString :=  cdsEntidadeKCAD_ENTIDADE.asString ;

  if cdsDadosFinanceiroCODIGO.asString <> cdsEntidadeCODIGO.asString then
     cdsDadosFinanceiroCODIGO.asString := cdsEntidadeCODIGO.asString ;

  if cdsDadosFinanceiroAPELIDO.asString <> cdsEntidadeAPELIDO.asString then
     cdsDadosFinanceiroAPELIDO.asString := cdsEntidadeAPELIDO.asString ;

  if cdsDadosFinanceiroNOME.asString <> cdsEntidadeNOME.asString then
     cdsDadosFinanceiroNOME.asString := cdsEntidadeNOME.asString ;
end;

procedure TdtmCAD_Clientes.cdsDadosFinanceiroCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  aux, codigo : String;
  list : TStringList;
  listMask : TStringList;
  tamanho, i : integer;
begin
  if (DisplayText) then
  begin

    try
      listMask := TStringList.Create;
      listMask.Delimiter := '.';
      listMask.DelimitedText := Fmask;

      list := TStringList.Create;
      list.Delimiter := '.';
      list.DelimitedText := Sender.AsString;

      codigo := '';
      for i := 0 to list.Count - 1 do
      begin
        tamanho := length(listMask[i]);

        aux := '0000000000' + list[i];
        aux := copy(aux,  length(aux)-tamanho+1 , tamanho);

        if codigo = EmptyStr then
          codigo := aux
        else
          codigo := codigo + '.' + aux;
      end;

      Text := codigo;

    except
      Text := Sender.AsString;
    end;
  end;
end;

procedure TdtmCAD_Clientes.cdsDadosFinanceiroDESC_PLANOCONTASetText(Sender: TField; const Text: string);
begin
  cdsDadosFinanceiroKFIN_PLANOCONTA.Clear;
  cdsDadosFinanceiroDESCR_PC_NOME.Clear;
  cdsDadosFinanceiroDESCR_PC_CODIGO.Clear;
  cdsDadosFinanceiroDESCR_PC_CLASSIFICACAO.Clear;
  cdsDadosFinanceiroDESCR_PC_TIPO_APRD.Clear;
end;

function RemoveCharMask(const s: string): string;
begin

   Result := s;
   Result := StringReplace(Result, '.', '', [rfReplaceAll]);
   Result := StringReplace(Result, '/', '', [rfReplaceAll]);
   Result := StringReplace(Result, '-', '', [rfReplaceAll]);
   Result := StringReplace(Result, ' ', '', [rfReplaceAll]);

end;


procedure TdtmCAD_Clientes.cdsEntidadePESSOAChange(Sender: TField);
var
  CPF_CNPJ : string ;
begin
  inherited;
  if Sender.AsString = 'F' then
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CPF + ';1'
  else
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CNPJ + ';1';

  CPF_CNPJ := RemoveCharMask ( cdsEntidadeCPF_CNPJ.asString ) ;


  cdsEntidade.DisableConstraints ;
  if Sender.AsString = 'F' then
   cdsEntidadeCPF_CNPJ.asString := FormatMaskText( _MASK_CPF+ ';0', CPF_CNPJ  )
  else
   cdsEntidadeCPF_CNPJ.asString := FormatMaskText(_MASK_CNPJ+ ';0', CPF_CNPJ  ) ;
  cdsEntidade.EnableConstraints ;
end;


procedure TdtmCAD_Clientes.cdsEntidadeCPF_CNPJValidate(Sender: TField);
begin
  inherited;

  if RemoveCharMask(Sender.AsString) = '' then
     exit ;

  if cdsEntidadePESSOA.asString = 'J' then
     begin
//       if not ValidCNPJ ( Sender.AsString ) then
//          Raise Warning.Create ( 'CNPJ Inválido' ) ;
     end
  else
     begin
//        if not TestaCPF ( Sender.AsString ) then
//           Raise Warning.Create ( 'CPF Inválido' ) ;
     end ;

  if cdsEntidadePESSOA.asString = 'F' then
   begin
     if TSQLSuppl.CheckExistsIn( 'CAD_ENTIDADES',
                                 'CPF_CNPJ;IS_CLIENTE', VarArrayOf ( [ Copy ( Sender.AsString, 1, 14 ), 'T' ] ),
                                 Format ( 'KCAD_ENTIDADE <> %s AND SYS$DELETED = ''F'' ', [ QuotedStr ( cdsEntidadeKCAD_ENTIDADE.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'ENTIDADES' ].Connection ) ) then
        Raise Warning.CreateFmt( _CPF_JACADASTRADO, [ Copy ( Sender.AsString, 1 ,14 ) ] )
   end
  else
    begin
     if TSQLSuppl.CheckExistsIn( 'CAD_ENTIDADES',
                                 'CPF_CNPJ;IS_CLIENTE', VarArrayOf ( [ Sender.AsString, 'T' ] ) ,
                                 Format ( 'KCAD_ENTIDADE <> %s AND SYS$DELETED = ''F'' ', [ QuotedStr ( cdsEntidadeKCAD_ENTIDADE.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'ENTIDADES' ].Connection ) ) then
        Raise Warning.CreateFmt( _CNPJ_JACADASTRADO, [ Sender.AsString ] ) ;

    end;
end;

procedure TdtmCAD_Clientes.SetParams;
begin

//   cdsLstEntidades.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;

   cdsLstEntidades.Params.ParamByName( 'DSP_INATIVO'         ).asString := BoolToChar ( FShowInativos        ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_CLIENTE'         ).asString := BoolToChar ( FShowClientes        ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_FORNECEDOR'      ).asString := BoolToChar ( FShowFornecedores    ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_FUNCIONARIO'     ).asString := BoolToChar ( FShowFuncionarios    ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_VENDEDOR'        ).asString := BoolToChar ( FShowVendedores      ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_REPRESENTANTE'   ).asString := BoolToChar ( FShowRepresentantes  ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_COMPRADOR'       ).asString := BoolToChar ( FShowCompradores     ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_TRANSPORTADORA'  ).asString := BoolToChar ( FShowTransportadora  ) ;

end;

//deprecated
(*
procedure TdtmCAD_Clientes.SetPlanoConta( Key, Nome, Classificacao: string; Codigo: Integer ) ;
begin
  if not ( cdsDadosFinanceiro.State in [dsInsert,dsEdit] ) then
    cdsDadosFinanceiro.Edit ;

  cdsDadosFinanceiroDESCR_PC_NOME.AsString           := Nome ;
  cdsDadosFinanceiroKFIN_PLANOCONTA.asString         := Key ;
  cdsDadosFinanceiroDESCR_PC_CLASSIFICACAO.AsString  := Classificacao ;
  cdsDadosFinanceiroDESCR_PC_CODIGO.AsInteger        := Codigo ;
  //cdsDadosFinanceiroDESCR_PC_TIPO_APRD.Clear;

  if SvcFinanceiroApropriacaoDefault.NeedCC ( Key ) then
    if cdsApropriacaoEntidade.IsEmpty then
       SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( cdsApropriacaoEntidade )

end;
*)

procedure TdtmCAD_Clientes.cdsLstEntidadesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;

procedure TdtmCAD_Clientes.SetFilter(ShowInativos, ShowClientes,
  ShowFornecedores, ShowFuncionarios, ShowVendedores, ShowRepresentantes,
  ShowCompradores, ShowTransportadora: Boolean);
begin
    FShowInativos         := ShowInativos       ;
    FShowClientes         := ShowClientes       ;
    FShowFornecedores     := ShowFornecedores   ;
    FShowFuncionarios     := ShowFuncionarios   ;
    FShowVendedores       := ShowVendedores     ;
    FShowRepresentantes   := ShowRepresentantes ;
    FShowCompradores      := ShowCompradores    ;
    FShowTransportadora   := ShowTransportadora ;
    SetParams ;
    self.RefreshList ;
//    ThreadSuppl.TSyncThread.Create ( self.RefreshList ) ;
end;

procedure TdtmCAD_Clientes.SetGrupoCliente(Key, NomeGrupo: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

   cdsEntidadeGRUPO_CLIENTE.asString := Key ;
   cdsEntidadeGRUPO.AsString         := NomeGrupo ;
end;

procedure TdtmCAD_Clientes.cdsLstEntidadesATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
    if ( Sender.DataSet.FieldByName ( 'ATIVO' ).AsString = 'F' ) then
      Text := 'Inativo'
    else
      Text := 'Ativo';
end;

procedure TdtmCAD_Clientes.RefreshList;
begin
  inherited;
end;

procedure TdtmCAD_Clientes.SetCondPagto(Key: integer; Condicao: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEnt-idadeDESCRCONDPAGTO.asString := Condicao ;
//   cdsEntidadeKFIN_CONDPAGTO.Value := Key ;
end;


procedure TdtmCAD_Clientes.SetTransportadora(Key: integer;
  NomeTransportadora : string ) ;
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMETRANSPORTADORA.asString := NomeTransportadora ;
//   cdsEntidadeKCAD_TRANSPORTADORA.Value := Key ;
end;

procedure TdtmCAD_Clientes.SetRedespacho(Key: integer;
  NomeRedespacho: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMEREDESPACHO.asString := NomeRedespacho ;
//   cdsEntidadeKCAD_REDESPACHO.Value := Key ;
end;

procedure TdtmCAD_Clientes.SetVendedor(Key: integer;
  NomeVendedor: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMEVENDEDOR.asString := NomeVendedor ;
//   cdsEntidadeKCAD_VENDEDOR.Value := Key ;
end;

procedure TdtmCAD_Clientes.UpdateFromInfo(var AClienteInfo: TClienteInfo);
begin

  FClienteInfo := @AClienteInfo ;

  try
    if AClienteInfo.KCAD_CLIENTE <> '' then
      begin
        cdsLstEntidadesKCAD_ENTIDADE.AsString  := AClienteInfo.KCAD_CLIENTE ;
        cdsEntidade.Edit ;
        cdsEntidadeKCAD_ENTIDADE.AsString  := AClienteInfo.KCAD_CLIENTE ;
        AClienteInfo.KCAD_CLIENTE := '' ;
      end;

    if AClienteInfo.Razao <> '' then
      cdsEntidadeNOME.AsString  := AClienteInfo.Razao ;

    if AClienteInfo.Fantasia <> '' then
      cdsEntidadeAPELIDO.AsString  := AClienteInfo.Fantasia   ;

    if AClienteInfo.CPF_CNPJ <> '' then
      begin
        if Length ( AClienteInfo.CPF_CNPJ ) < 18 then
           cdsEntidadePESSOA.AsString  := 'F'
        else
          cdsEntidadePESSOA.AsString   :=  'J' ;
        cdsEntidadeCPF_CNPJ.AsString  := AClienteInfo.CPF_CNPJ  ;
      end;

    if AClienteInfo.IE <> '' then
      ;
    if AClienteInfo.IEST <> '' then
      ;
    if AClienteInfo.IM <> '' then
      ;
    if AClienteInfo.CNAE <> '' then
      ;

    if AClienteInfo.Fone <> '' then
        cdsEntidadeFONE.AsString  := AClienteInfo.Fone
    else
        cdsEntidadeFONE.AsString  := '0000000000' ;

    cdsEndereco.Edit ;

    if AClienteInfo.Logradouro <> '' then
       cdsEnderecoENDERECO.AsString := AClienteInfo.Logradouro ;
    if AClienteInfo.Numero <> '' then
       cdsEnderecoNUMERO.AsString := AClienteInfo.Numero ;

    if AClienteInfo.Complemento <> '' then
       cdsEnderecoCOMPLEMENTO.AsString := AClienteInfo.Complemento ;

    if AClienteInfo.Bairro <> '' then
       cdsEnderecoBAIRRO.AsString := AClienteInfo.Bairro ;
      ;
    if AClienteInfo.CodigoMunicipio <> 0 then
      ;
    if AClienteInfo.NomeMunicipio <> '' then
       cdsEnderecoCIDADE.AsString := AClienteInfo.NomeMunicipio ;

    if AClienteInfo.UF <> '' then
       cdsEnderecoUF.AsString := AClienteInfo.UF ;
      ;
    if AClienteInfo.CEP <> '' then
       cdsEnderecoCEP.AsString := AClienteInfo.CEP ;
      ;
    if AClienteInfo.CodigoPais <> 0 then
      ;
    if AClienteInfo.NomePais <> '' then
      ;
    if AClienteInfo.Fone <> '' then
        cdsEnderecoFONE.AsString  := AClienteInfo.Fone ;

    cdsEndereco.Post ;

  except On E: Exception do
     ShowMessage ( E.Message ) ;

  end;

end;

procedure TdtmCAD_Clientes.cdsEntidadeCalcFields(DataSet: TDataSet);
begin
  inherited;

  if cdsEntidade.state = dsInternalCalc then
     begin
//        InitDDSFat ;
     end ;

end;

procedure TdtmCAD_Clientes.cdsEntidadeDDSFATValidate(Sender: TField);
begin
  inherited;
  {
  cdsEntidadeDDSFAT.asString :=
         cdsEntidadeFATDOM.asString
       + cdsEntidadeFATSEG.asString
       + cdsEntidadeFATTER.asString
       + cdsEntidadeFATQUA.asString
       + cdsEntidadeFATQUI.asString
       + cdsEntidadeFATSEX.asString
       + cdsEntidadeFATSAB.asString ;
  }
end;

procedure TdtmCAD_Clientes.cdsEntidadeEMAILValidate(Sender: TField);
begin
  if not TValidates.ValidaEMail( Sender.AsString ) then
    raise Warning.Create('Email inválido - Ex: nome@dominio.com.br');
end;

procedure TdtmCAD_Clientes.cdsEntidadeFONESetText(Sender: TField; const Text: string);
begin
  if Trim ( Text ) = EmptyStr then
    Sender.Clear
  else
    Sender.asString := Text ;
end;

procedure TdtmCAD_Clientes.InitDDSFat;
begin
    {
      SetValidateDDSFat ( nil ) ;

      cdsEntidadeFATDOM.asString := cdsEntidadeDDSFAT.asString [ 1 ] ;
      cdsEntidadeFATSEG.asString := cdsEntidadeDDSFAT.asString [ 2 ] ;
      cdsEntidadeFATTER.asString := cdsEntidadeDDSFAT.asString [ 3 ] ;
      cdsEntidadeFATQUA.asString := cdsEntidadeDDSFAT.asString [ 4 ] ;
      cdsEntidadeFATQUI.asString := cdsEntidadeDDSFAT.asString [ 5 ] ;
      cdsEntidadeFATSEX.asString := cdsEntidadeDDSFAT.asString [ 6 ] ;
      cdsEntidadeFATSAB.asString := cdsEntidadeDDSFAT.asString [ 7 ] ;

      SetValidateDDSFat ( cdsEntidadeDDSFATValidate ) ;
   }
end;

procedure TdtmCAD_Clientes.SetValidateDDSFat(Event: TFieldNotifyEvent ) ;
begin
     { cdsEntidadeFATDOM.OnValidate := Event ;
      cdsEntidadeFATSEG.OnValidate := Event ;
      cdsEntidadeFATTER.OnValidate := Event ;
      cdsEntidadeFATQUA.OnValidate := Event ;
      cdsEntidadeFATQUI.OnValidate := Event ;
      cdsEntidadeFATSEX.OnValidate := Event ;
      cdsEntidadeFATSAB.OnValidate := Event ;
     }
end;

end.

