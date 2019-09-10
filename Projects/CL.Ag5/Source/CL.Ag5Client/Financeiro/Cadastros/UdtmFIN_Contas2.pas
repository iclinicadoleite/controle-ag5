unit UdtmFIN_Contas2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Form, Tc.Data.SQLExpr;

type
  TdtmFIN_Contas2 = class(T_dtmBASEDBListEdit)
    cdsLstContas: TClientDataSet;
    cdsConta: TClientDataSet;
    dspLstContas: TDataSetProvider;
    dspConta: TDataSetProvider;
    sqlLstContas: TTcSQLDataSet;
    sqlConta: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstContasKFIN_CONTA: TStringField;
    sqlLstContasKSYSDOMAIN: TStringField;
    sqlLstContasKFIN_BANCO: TStringField;
    sqlLstContasCODIGO: TStringField;
    sqlLstContasBANCO: TStringField;
    sqlLstContasCONTA_BANCARIA: TStringField;
    sqlLstContasAGENCIA: TStringField;
    sqlLstContasCONTA_CORRENTE: TStringField;
    sqlLstContasNOME: TStringField;
    sqlLstContasSALDO_ATUAL: TFloatField;
    sqlLstContasDATA_SALDO: TSQLTimeStampField;
    sqlLstContasATIVA: TStringField;
    cdsLstContasKFIN_CONTA: TStringField;
    cdsLstContasKSYSDOMAIN: TStringField;
    cdsLstContasKFIN_BANCO: TStringField;
    cdsLstContasCODIGO: TStringField;
    cdsLstContasBANCO: TStringField;
    cdsLstContasCONTA_BANCARIA: TStringField;
    cdsLstContasAGENCIA: TStringField;
    cdsLstContasCONTA_CORRENTE: TStringField;
    cdsLstContasNOME: TStringField;
    cdsLstContasSALDO_ATUAL: TFloatField;
    cdsLstContasDATA_SALDO: TSQLTimeStampField;
    cdsLstContasATIVA: TStringField;
    sqlContaKFIN_CONTA: TStringField;
    sqlContaKSYSDOMAIN: TStringField;
    sqlContaKFIN_BANCO: TStringField;
    sqlContaCODIGO: TStringField;
    sqlContaCONTA_BANCARIA: TStringField;
    sqlContaAGENCIA: TStringField;
    sqlContaCONTA_CORRENTE: TStringField;
    sqlContaSALDOINICIAL: TFloatField;
    sqlContaSALDO_ATUAL: TFloatField;
    sqlContaDATASALDOINICIAL: TSQLTimeStampField;
    sqlContaATIVA: TStringField;
    sqlContaBANCO: TStringField;
    sqlContaNOME: TStringField;
    cdsContaKFIN_CONTA: TStringField;
    cdsContaKSYSDOMAIN: TStringField;
    cdsContaKFIN_BANCO: TStringField;
    cdsContaCODIGO: TStringField;
    cdsContaBANCO: TStringField;
    cdsContaCONTA_BANCARIA: TStringField;
    cdsContaAGENCIA: TStringField;
    cdsContaNOME: TStringField;
    cdsContaCONTA_CORRENTE: TStringField;
    cdsContaSALDOINICIAL: TFloatField;
    cdsContaSALDO_ATUAL: TFloatField;
    cdsContaDATASALDOINICIAL: TSQLTimeStampField;
    cdsContaATIVA: TStringField;
    sqlLstContasCONTA_FAVORITA: TStringField;
    cdsLstContasCONTA_FAVORITA: TStringField;
    procedure cdsLstContasNewRecord(DataSet: TDataSet);
    procedure cdsContaNewRecord(DataSet: TDataSet);
    procedure cdsContaBeforeInsert(DataSet: TDataSet);
    procedure cdsLstContasBeforeOpen(DataSet: TDataSet);
    procedure cdsContaNOMEValidate(Sender: TField);
    procedure cdsContaDATASALDOINICIALValidate(Sender: TField);
    procedure cdsContaAGENCIAValidate(Sender: TField);
    procedure cdsContaCONTA_CORRENTEValidate(Sender: TField);
    procedure cdsContaKFIN_BANCOValidate(Sender: TField);
    procedure cdsContaSALDOINICIALValidate(Sender: TField);
    procedure cdsLstContasATIVAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsContaBANCOSetText( Sender: TField; const Text: string);
    procedure cdsLstContasCONTA_FAVORITAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FShowInativos : Boolean;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetFilter ( ShowInativos : Boolean );
    procedure SetBanco( AKey : String ; ACodigoBanco, ANomeBanco : string );
    procedure SetContaFavorita;
    function ContaComMovimento : Boolean;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation


uses UDBFinanceiro, Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}

const
  _ST_DOMAIN_CONTA_FAVORITA = 'CONTA_FAVORITA';

{ TrdmdtmFIN_Contas2 }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_Contas2.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}

{ TdtmCustomListaFicha }

procedure TdtmFIN_Contas2.OpenTables;
begin
  inherited;
end;

procedure TdtmFIN_Contas2.SetBanco( AKey : string ; ACodigoBanco, ANomeBanco : string );
begin
  if not ( cdsConta.State in [dsInsert,dsEdit] ) then
    cdsConta.Edit ;

  cdsContaKFIN_BANCO.AsString     := AKey  ;
  cdsContaCODIGO.AsString         := ACodigoBanco ;
  cdsContaBANCO.AsString          := ANomeBanco;
  cdsContaCONTA_BANCARIA.AsString := 'T';
end;

procedure TdtmFIN_Contas2.SetContaFavorita;
const
  _SQL_CONTA_FAVORITA = 'SELECT C.KFIN_CONTA, C.NOME FROM FIN_CONTAS C'
                +#13#10' INNER JOIN SYS$DOMAIN_TYPES T ON T.SYS$VALUE = C.KFIN_CONTA AND T.SYS$TYPE = ''%s''';

  _UPDATE_CONTA_FAVORITA =
               'UPDATE OR INSERT INTO SYS$DOMAIN_TYPES (KSYS$DOMAIN, SYS$TYPE, SYS$VALUE, SYS$DESCRIPTION, SYS$ORDER, SYS$TYPEID)'
        +#13#10'VALUES (:KSYS$DOMAIN, :SYS$TYPE, :SYS$VALUE, :SYS$DESCRIPTION, :SYS$ORDER, :SYS$TYPEID) MATCHING (KSYS$DOMAIN,SYS$TYPE)';

var
  p: TParams;
  cds: TClientDataSet;
begin
  cds := nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, Format(_SQL_CONTA_FAVORITA,[_ST_DOMAIN_CONTA_FAVORITA]));
  p:= TParams.Create(nil);
  p.CreateParam(ftString ,  'KSYS$DOMAIN'     , ptInput).AsString   := LoggedUser.DomainID;
  p.CreateParam(ftString ,  'SYS$TYPE'        , ptInput).AsString   := _ST_DOMAIN_CONTA_FAVORITA;

  if ( not cds.IsEmpty ) and ( cds.FieldByName('KFIN_CONTA').AsString = cdsLstContasKFIN_CONTA.AsString )  then
   begin
     p.CreateParam(ftString ,  'SYS$VALUE'       , ptInput).Clear;
   end
  else
    p.CreateParam(ftString ,  'SYS$VALUE'       , ptInput).AsString   := cdsLstContasKFIN_CONTA.AsString;

  p.CreateParam(ftString ,  'SYS$DESCRIPTION' , ptInput).AsString   := 'Conta Favorita';
  p.CreateParam(ftInteger , 'SYS$ORDER'       , ptInput).AsInteger  := 0;
  p.CreateParam(ftString ,  'SYS$TYPEID'      , ptInput).AsString   := '_ST_DOMAIN_CONTA_FAVORITA';
  TTcAbstractDB.GetByAlias('FINANCEIRO').Execute(_UPDATE_CONTA_FAVORITA, p);
  p.Free;
  cds.Free;
end;

procedure TdtmFIN_Contas2.SetFilter(ShowInativos: Boolean);
begin
  FShowInativos := ShowInativos ;
  SetParams ;
  self.RefreshList ;
end;

procedure TdtmFIN_Contas2.SetParams;
begin
   cdsLstContas.Params.ParamByName( 'SYS_TYPE'     ).asString := _ST_DOMAIN_CONTA_FAVORITA ;
   cdsLstContas.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
   cdsLstContas.Params.ParamByName( 'DSP_INATIVO'  ).asString := BoolToChar ( FShowInativos ) ;
end;

procedure TdtmFIN_Contas2.cdsLstContasATIVAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = 'F' then
    Text := 'Inativo'
  else
    Text := 'Ativo';
end;

procedure TdtmFIN_Contas2.cdsLstContasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;

procedure TdtmFIN_Contas2.cdsLstContasCONTA_FAVORITAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := 'X'
  else
    Text := '';
end;

procedure TdtmFIN_Contas2.cdsLstContasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

function TdtmFIN_Contas2.ContaComMovimento: Boolean;
const
  SQL_MOVIMENTACAO = 'SELECT CASE COALESCE( F.VALOR_INJETADO, F.VALOR_UTILIZADO ) ' +
                     '   WHEN ''0'' THEN ''False''' +
                     '   ELSE ''True'' ' +
                     '  END TEM_MOVIMENTO ' +
                     'FROM FIN_CONTAS F ' +
                     'WHERE F.KFIN_CONTA = :KFIN_CONTA';
var
  cds : TClientDataSet;
  p   : TParams;
begin
  cds := nil;
  p   := TParams.Create;

  p.CreateParam( ftString, 'KFIN_CONTA', ptInput ).AsString := cdsContaKFIN_CONTA.AsString;

  DBResources['FINANCEIRO'].populateClientDataSet( cds, SQL_MOVIMENTACAO, p );

  Result := cds.FieldByName('TEM_MOVIMENTO').AsBoolean ;

  cds.Free;
  p.Free;
end;

procedure TdtmFIN_Contas2.cdsContaAGENCIAValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsString = EmptyStr) then
    raise Warning.Create('Agência deve ser digitada');
end;

procedure TdtmFIN_Contas2.cdsContaBANCOSetText(Sender: TField; const Text: string);
begin
  cdsContaKFIN_BANCO.Clear;
  cdsContaCODIGO.Clear;
  cdsContaBANCO.Clear;
end;

procedure TdtmFIN_Contas2.cdsContaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstContas.IsEmpty ) and not ( cdsLstContas.State in [dsInsert,dsEdit] )  then
     cdsLstContas.Append ;
end;

procedure TdtmFIN_Contas2.cdsContaCONTA_CORRENTEValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsString = EmptyStr) then
    raise Warning.Create('Conta corrente deve ser digitada');
end;

procedure TdtmFIN_Contas2.cdsContaDATASALDOINICIALValidate(Sender: TField);
begin
  if (Sender.IsNull) or (Sender.AsDateTime < 1) then
    raise Warning.Create('Deve selecionar uma data de saldo inicial');

  if Sender.AsDateTime > Date then
    raise Warning.Create('Data do saldo incial nao pode ser maior que data atual');
end;

procedure TdtmFIN_Contas2.cdsContaKFIN_BANCOValidate(Sender: TField);
begin
  if not Sender.IsNull then
    begin
      cdsContaAGENCIA.Required := True;
      cdsContaCONTA_CORRENTE.Required := True;
      cdsContaCONTA_BANCARIA.AsString := 'T'
    end
  else if (Sender.IsNull) or (Sender.AsString = EmptyStr) then
    begin
      cdsContaAGENCIA.Required := False;
      cdsContaCONTA_CORRENTE.Required := False;
      cdsContaCONTA_BANCARIA.AsString := 'F';
    end;
end;

procedure TdtmFIN_Contas2.cdsContaNewRecord(DataSet: TDataSet);
begin
  self.CopyKeysFromMaster ;
  cdsContaKSYSDOMAIN.Value := LoggedUser.DomainID ;
  cdsContaATIVA.AsString := 'T';
  cdsContaSALDOINICIAL.AsFloat := 0;

  if cdsContaKFIN_BANCO.IsNull then
    cdsContaCONTA_BANCARIA.AsString := 'F'
  else
    cdsContaCONTA_BANCARIA.AsString := 'T'
end;

procedure TdtmFIN_Contas2.cdsContaNOMEValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or (Sender.AsString = EmptyStr)then
    raise Warning.Create('Nome da conta deve ser digitado');
end;

procedure TdtmFIN_Contas2.cdsContaSALDOINICIALValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Saldo inicial inválido');
end;

end.
