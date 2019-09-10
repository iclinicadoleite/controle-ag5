unit UdtmFIN_PlanoContasEspeciais;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Data.FMTBcd, Data.SqlExpr, Provider, Tc.Data.SQLExpr ;

type
  TdtmFIN_PlanoContasEspeciais = class(T_dtmBase)
    sqlPlanoContasEspeciais: TTcSQLDataSet;
    dspPlanoContasEspeciais: TDataSetProvider;
    cdsPlanoContasEspeciais: TClientDataSet;
    sqlPlanoContasEspeciaisKFIN_PLANOCONTA_ESPECIAL: TStringField;
    sqlPlanoContasEspeciaisNOME: TStringField;
    sqlPlanoContasEspeciaisKDEF_PLANOCONTA: TStringField;
    sqlPlanoContasEspeciaisTIPO_PLANOCONTAS: TIntegerField;
    sqlPlanoContasEspeciaisCLASSIFICACAO: TStringField;
    sqlPlanoContasEspeciaisKFIN_PLANOCONTA: TStringField;
    sqlPlanoContasEspeciaisEQV_TIPO_PLANOCONTAS: TIntegerField;
    sqlPlanoContasEspeciaisDESCR_PC_CODIGO: TIntegerField;
    sqlPlanoContasEspeciaisDESCR_PC_NOME: TStringField;
    sqlPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO: TStringField;
    cdsPlanoContasEspeciaisKFIN_PLANOCONTA_ESPECIAL: TStringField;
    cdsPlanoContasEspeciaisNOME: TStringField;
    cdsPlanoContasEspeciaisKDEF_PLANOCONTA: TStringField;
    cdsPlanoContasEspeciaisTIPO_PLANOCONTAS: TIntegerField;
    cdsPlanoContasEspeciaisCLASSIFICACAO: TStringField;
    cdsPlanoContasEspeciaisKFIN_PLANOCONTA: TStringField;
    cdsPlanoContasEspeciaisDESCR_PC_CODIGO: TIntegerField;
    cdsPlanoContasEspeciaisDESCR_PC_NOME: TStringField;
    cdsPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO: TStringField;
    cdsPlanoContasEspeciaisEQV_TIPO_PLANOCONTAS: TIntegerField;
    sqlPlanoContasEspeciaisDESCR_PC_TIPO_APRD: TStringField;
    cdsPlanoContasEspeciaisDESCR_PC_TIPO_APRD: TStringField;
    sqlPlanoContasEspeciaisKFIN_PLANOCONTA_OLD: TStringField;
    sqlPlanoContasEspeciaisDESCR_PC_NOME_OLD: TStringField;
    cdsPlanoContasEspeciaisKFIN_PLANOCONTA_OLD: TStringField;
    cdsPlanoContasEspeciaisDESCR_PC_NOME_OLD: TStringField;
    procedure cdsPlanoContasEspeciaisBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetParams;
    procedure SetNullPlanoContasEquivalente;
    procedure SetNewPlanoContaEquivalente;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates;
    procedure SetContaEquivalente( AKFin_PlanoConta, AClassificacao, ANome: String);
    function GetTipoPlanoContas: Integer;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Exceptions, GuidSuppl
     , DataSnap.DSConnect
     , CLAg5SvcFinanceiroApropriacao
     , UFIN_PlanoContasReceitasDespesasClass ;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmFIN_PlanoContasEspeciais }


procedure TdtmFIN_PlanoContasEspeciais.ApplyUpdates;
begin

  cdsPlanoContasEspeciais.DisableControls;
  try

    SetNullPlanoContasEquivalente;

    SetNewPlanoContaEquivalente;

  finally
    cdsPlanoContasEspeciais.EnableControls;

    OpenTables;
  end;


end;

procedure TdtmFIN_PlanoContasEspeciais.cdsPlanoContasEspeciaisBeforePost(
  DataSet: TDataSet);
begin
  if (cdsPlanoContasEspeciaisDESCR_PC_NOME.IsNull) or
     (cdsPlanoContasEspeciaisDESCR_PC_NOME.AsString = '')  then
   begin
     cdsPlanoContasEspeciaisKFIN_PLANOCONTA.Clear;
     cdsPlanoContasEspeciaisDESCR_PC_CODIGO.Clear;
     cdsPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO.Clear;
   end;

end;


function TdtmFIN_PlanoContasEspeciais.GetTipoPlanoContas: Integer;
const
  _SQL = 'SELECT GEN_ID( TIPO_PLANOCONTAS, 0 ) AS RESULT FROM RDB$DATABASE' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL ) ;
  Result := cds.Fields[0].AsInteger ;
  if Result = 0 then
     Result := -3 ;
  cds.Free ;
end;

procedure TdtmFIN_PlanoContasEspeciais.OpenTables;
begin
  inherited;
  SetParams;
  TcdsSuppl.Open( cdsPlanoContasEspeciais );
end;

procedure TdtmFIN_PlanoContasEspeciais.SetContaEquivalente(AKFin_PlanoConta,
  AClassificacao, ANome: String);
begin
  cdsPlanoContasEspeciais.Edit;
  cdsPlanoContasEspeciaisKFIN_PLANOCONTA.AsString := AKFin_PlanoConta;
  cdsPlanoContasEspeciaisDESCR_PC_CLASSIFICACAO.AsString := AClassificacao;
  cdsPlanoContasEspeciaisDESCR_PC_NOME.AsString := ANome;
end;

procedure TdtmFIN_PlanoContasEspeciais.SetNewPlanoContaEquivalente;
const
  _UPDATE_NEW_PLANOCONTA_EQUIVALENTE =
           'UPDATE FIN_PLANOCONTAS SET KEQV_PLANOCONTA = :KFIN_PLANOCONTA_ESPECIAL'
    +#13#10' WHERE KFIN_PLANOCONTA = :KFIN_PLANOCONTA';


var
  p_new_pc: TParams;
begin
  p_new_pc := TParams.Create( nil );
  p_new_pc.CreateParam(ftString, 'KFIN_PLANOCONTA_ESPECIAL' , ptInput);
  p_new_pc.CreateParam(ftString, 'KFIN_PLANOCONTA' , ptInput);

  try

    cdsPlanoContasEspeciais.First;
    while not cdsPlanoContasEspeciais.Eof do
     begin
       if (cdsPlanoContasEspeciaisKFIN_PLANOCONTA.AsString <> cdsPlanoContasEspeciaisKFIN_PLANOCONTA_OLD.AsString) and
          ((not cdsPlanoContasEspeciaisKFIN_PLANOCONTA.IsNull) and
           (cdsPlanoContasEspeciaisKFIN_PLANOCONTA.AsString <> '') ) then
        begin
          p_new_pc.ParamByName('KFIN_PLANOCONTA_ESPECIAL').AsString := cdsPlanoContasEspeciaisKFIN_PLANOCONTA_ESPECIAL.AsString;
          p_new_pc.ParamByName('KFIN_PLANOCONTA').AsString := cdsPlanoContasEspeciaisKFIN_PLANOCONTA.AsString;
          DBResources['FINANCEIRO'].Execute( _UPDATE_NEW_PLANOCONTA_EQUIVALENTE, p_new_pc );
        end;
       cdsPlanoContasEspeciais.Next;
     end;
  finally
    p_new_pc.Free;
  end;
end;

procedure TdtmFIN_PlanoContasEspeciais.SetNullPlanoContasEquivalente;
const
    _UPDATE_SET_NULL_PLANOCONTA_EQUIVALENTE =
    'UPDATE FIN_PLANOCONTAS SET KEQV_PLANOCONTA = NULL WHERE KFIN_PLANOCONTA = :KFIN_PLANOCONTA_OLD';
var
  p_set_null: TParams;
begin
  p_set_null := TParams.Create( nil );
  p_set_null.CreateParam(ftString, 'KFIN_PLANOCONTA_OLD' , ptInput);

  try
    cdsPlanoContasEspeciais.First;
    while not cdsPlanoContasEspeciais.Eof do
     begin
       if cdsPlanoContasEspeciaisKFIN_PLANOCONTA.AsString <> cdsPlanoContasEspeciaisKFIN_PLANOCONTA_OLD.AsString then
        begin
          p_set_null.ParamByName('KFIN_PLANOCONTA_OLD').AsString := cdsPlanoContasEspeciaisKFIN_PLANOCONTA_OLD.AsString;
          DBResources['FINANCEIRO'].Execute( _UPDATE_SET_NULL_PLANOCONTA_EQUIVALENTE, p_set_null );
        end;
       cdsPlanoContasEspeciais.Next;
     end;
  finally
    p_set_null.Free;
  end;
end;

procedure TdtmFIN_PlanoContasEspeciais.SetParams;
const
  _DEF_BANCOS               = '17^Q$Ea7-cL9K][5-:Hx' ; // 1.1.2  'Contas corrente bancos'
  _DEF_ESTOQUE              = 'XpnViioBT#Osw}pC86v:' ; // 1.2.1  'Estoque'
  _DEF_FINANCIAMENTOS       = '\`WDl{hX.rMS5@KKGo0?' ; // 2.1.1  'Amortização de empréstimos'
  _DEF_LEITE                = 'n|jy3]wFJX\Ew,l2uv0R' ; // 3.1.1.1 'Venda de leite'
  _DEF_OUTRAS_RECEITAS      = 'LQ+UynfMU8KY+p@Xr7At' ; // 3.1.3.1 'Outras receitas'
  _DEF_IMPOSTOS_TAXAS       = 'eIMM=ywc):R4*#{2*JJ;' ; //4.1.1   'Deduções de vendas'
  _DEF_DEPRECIACAO          = '0SZ[Rh;TMC[5l*N`$TRJ' ; //4.2.15.1 Depreciação
  _DEF_RECEITAS             = 'FiTl`TM-IuQUC.(`P\?P' ; //3.2.1.1 'Receitas financeiras'
  _DEF_DESPESAS             = 'DV$VVifn7MZ.+us!j-,I' ; //4.3.1.1 'Tarifas, taxas, impostos, juros por atraso e multas'
  _DEF_JUROS_FINANCIAMENTOS = '\?21Gl|m{AX+IA5!aW}E' ; //4.3.1.2 'Juros de empréstimos'
begin
  cdsPlanoContasEspeciais.ParamByName('TIPO_PLANOCONTAS_PADRAO'  ).AsInteger :=  -3 ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_BANCOS'              ).AsString :=  _DEF_BANCOS            ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_ESTOQUE'             ).AsString :=  _DEF_ESTOQUE           ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_FINANCIAMENTOS'      ).AsString :=  _DEF_FINANCIAMENTOS    ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_LEITE'               ).AsString :=  _DEF_LEITE             ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_OUTRAS_RECEITAS'     ).AsString :=  _DEF_OUTRAS_RECEITAS   ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_IMPOSTOS_TAXAS'      ).AsString :=  _DEF_IMPOSTOS_TAXAS    ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_DEPRECIACAO'         ).AsString :=  _DEF_DEPRECIACAO       ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_RECEITAS'            ).AsString :=  _DEF_RECEITAS          ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_DESPESAS'            ).AsString :=  _DEF_DESPESAS          ;
  cdsPlanoContasEspeciais.ParamByName('_DEF_JUROS_FINANCIAMENTOS').AsString :=  _DEF_JUROS_FINANCIAMENTOS ;
end;

end.
