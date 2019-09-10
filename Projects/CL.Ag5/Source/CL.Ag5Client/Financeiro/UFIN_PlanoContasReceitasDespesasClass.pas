unit UFIN_PlanoContasReceitasDespesasClass;

interface

type
  TPlanoContasDespesasReceitas = class
  strict private
    class var Initialized : boolean ;
    class var KeyDespesas : string ;
    class var KeyReceitas : string ;
    class var DescricaoDespesas : string ;
    class var DescricaoReceitas : string ;
    class var KeyBancos : string ;
    class var DescricaoBancos : string ;
    class var KeyDepreciacao : string ;
    class var DescricaoDepreciacao : string ;
    class var KeyEstoque : string ;
    class var DescricaoEstoque : string ;
    class var KeyFinanciamentos : string ;
    class var DescricaoFinanciamentos : string ;
    class var KeyJurosFinanciamentos : string ;
    class var DescricaoJurosFinanciamentos : string ;
    class var KeyImpostosTaxas : string ;
    class var DescricaoImpostosTaxas : string ;

    class var KeyOutrasReceitas : string ;
    class var DescricaoOutrasReceitas : string ;

    class var KeyLeite : string ;
    class var DescricaoLeite : string ;

    class procedure CheckValues ;
  public
    class function GetKeyBancos : string ;
    class function GetKeyDepreciacao : string ;
    class function GetKeyEstoque : string ;
    class function GetKeyFinanciamentos : string ;
    class function GetKeyJurosFinanciamentos : string ;
    class function GetKeyDespesas : string ;
    class function GetKeyReceitas : string;
    class function GetKeyImpostosTaxas: string;

    class function GetKeyOutrasReceitas : string ;

    class function GetKeyLeite : string ;

    class function GetDescricaoEstoque : string ;
    class function GetDescricaoBancos : string ;
    class function GetDescricaoDepreciacao : string ;
    class function GetDescricaoFinanciamentos : string ;
    class function GetDescricaoJurosFinanciamentos : string ;
    class function GetDescricaoDespesas : string ;
    class function GetDescricaoReceitas : string;
    class function GetDescricaoImpostosTaxas: string;

    class function GetDescricaoOutrasReceitas: string;

    class function GetDescricaoLeite: string;


  end;

implementation

uses
     System.SysUtils
   , Tc.DBRTL.AbstractDB
   , DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers
   , CDSSuppl ;


{ TPlanoContasDespesasReceitas }

class function TPlanoContasDespesasReceitas.GetKeyBancos: string;
begin
   CheckValues;
   Result := KeyBancos
end;

class function TPlanoContasDespesasReceitas.GetKeyDepreciacao: string;
begin
   CheckValues;
   Result := KeyDepreciacao
end;

class function TPlanoContasDespesasReceitas.GetKeyEstoque: string;
begin
   CheckValues;
   Result := KeyEstoque
end;

class function TPlanoContasDespesasReceitas.GetKeyFinanciamentos: string;
begin
   CheckValues;
   Result := KeyFinanciamentos
end;

class function TPlanoContasDespesasReceitas.GetKeyJurosFinanciamentos: string;
begin
   CheckValues;
   Result := KeyJurosFinanciamentos
end;

class function TPlanoContasDespesasReceitas.GetKeyOutrasReceitas: string;
begin
   CheckValues;
   Result := KeyOutrasReceitas
end;

class function TPlanoContasDespesasReceitas.GetKeyLeite: string;
begin
   CheckValues;
   Result := KeyLeite
end;

class function TPlanoContasDespesasReceitas.GetKeyReceitas: string;
begin
   CheckValues;
   Result := KeyReceitas
end;

class function TPlanoContasDespesasReceitas.GetKeyDespesas: string;
begin
   CheckValues;
   Result := KeyDespesas
end;

class function TPlanoContasDespesasReceitas.GetKeyImpostosTaxas: string;
begin
   CheckValues;
   Result := KeyImpostosTaxas
end;

class function TPlanoContasDespesasReceitas.GetDescricaoBancos: string;
begin
   CheckValues;
   Result := DescricaoBancos
end;

class function TPlanoContasDespesasReceitas.GetDescricaoDepreciacao: string;
begin
   CheckValues;
   Result := DescricaoDepreciacao
end;

class function TPlanoContasDespesasReceitas.GetDescricaoEstoque: string;
begin
   CheckValues;
   Result := DescricaoEstoque
end;

class function TPlanoContasDespesasReceitas.GetDescricaoFinanciamentos: string;
begin
   CheckValues;
   Result := DescricaoFinanciamentos ;
end;

class function TPlanoContasDespesasReceitas.GetDescricaoJurosFinanciamentos: string;
begin
   CheckValues;
   Result := DescricaoJurosFinanciamentos ;
end;

class function TPlanoContasDespesasReceitas.GetDescricaoReceitas: string;
begin
   CheckValues;
   Result := DescricaoReceitas
end;

class function TPlanoContasDespesasReceitas.GetDescricaoDespesas: string;
begin
   CheckValues;
   Result := DescricaoDespesas
end;


class function TPlanoContasDespesasReceitas.GetDescricaoImpostosTaxas: string;
begin
   CheckValues;
   Result := DescricaoImpostosTaxas
end;


class function TPlanoContasDespesasReceitas.GetDescricaoOutrasReceitas: string;
begin
   CheckValues;
   Result := DescricaoOutrasReceitas
end;

class function TPlanoContasDespesasReceitas.GetDescricaoLeite: string;
begin
   CheckValues;
   Result := DescricaoLeite
end;

const
  _DEF_BANCOS               = '17^Q$Ea7-cL9K][5-:Hx' ; // 1.1.2  'Contas corrente bancos'
  _DEF_ESTOQUE              = 'XpnViioBT#Osw}pC86v:' ; // 1.2.1  'Estoque'
  _DEF_FINANCIAMENTOS       = '\`WDl{hX.rMS5@KKGo0?' ; // 2.1.1  'Amortização de empréstimos'

  _DEF_LEITE               = 'n|jy3]wFJX\Ew,l2uv0R' ; // 3.1.1.1 'Venda de leite'

  _DEF_OUTRAS_RECEITAS     = 'LQ+UynfMU8KY+p@Xr7At' ; // 3.1.3.1 'Outras receitas'


  _DEF_IMPOSTOS_TAXAS       = 'eIMM=ywc):R4*#{2*JJ;' ; //4.1.1   'Deduções de vendas'
  _DEF_DEPRECIACAO          = '0SZ[Rh;TMC[5l*N`$TRJ' ; //4.2.15.1 Depreciação
  _DEF_RECEITAS             = 'FiTl`TM-IuQUC.(`P\?P' ; //3.2.1.1 'Receitas financeiras'
  _DEF_DESPESAS             = 'DV$VVifn7MZ.+us!j-,I' ; //4.3.1.1 'Tarifas, taxas, impostos, juros por atraso e multas'
  _DEF_JUROS_FINANCIAMENTOS = '\?21Gl|m{AX+IA5!aW}E' ; //4.3.1.2 'Juros de empréstimos'


(* Planos de contas antigos
  _DEF_BANCOS               = ',N{1=;W0c1WELfVg?xrH' ; // 1.4.2 'Contas corrente bancos'
  _DEF_ESTOQUE              = 'W@)uq2^5:hOF:p/?aUmm' ; // 1.2.1 'Estoque'
  _DEF_FINANCIAMENTOS       = ':Cj8nv+=TJ[];xvnvgGO' ; // 2.2.1 'Financiamentos'

  _DEF_OUTRAS_RECEITAS     = 'Lbk17wWM\GUWdA*1Z)KK' ; // 3.4 'Outras receitas: esterco, poupança leite, etc.'

  _DEF_IMPOSTOS_TAXAS       = '?0-X)NethDJufCMj:XS(' ; //4.1.1 'Impostos e taxas: Incra, Funrural, Sindicatos, DER, etc.'
  _DEF_RECEITAS             = 'x}xXQqVlKaPQj5+Y|=k6' ; //4.19.1 'Despesas financeiras (juros, taxa bancaria'
  _DEF_DESPESAS             = 'S9Va(*(.t@NHAVg2bL?m' ; //4.20.1 'Despesas financeiras (juros, taxa bancaria'
  _DEF_JUROS_FINANCIAMENTOS = 'Sx|lxs,C,LTC22`}@T[@' ; //4.15.1 'Juros relativos à financiamentos'

//-- Importar financiamentos :  apropriação - default Conta 2.0.01 - Financiamentos. :Cj8nv+=TJ[];xvnvgGO
//-- Importar financiamentos : a apropriação do "dados a receber" - automizando para 1.04.02 - Conta corrente banco".  ,N{1=;W0c1WELfVg?xrH    Contas corrente bancos
*)
class procedure TPlanoContasDespesasReceitas.CheckValues;
const
(*
  _BANCOS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _DEPRECIACAO  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _ESTOQUE  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _FINANCIAMENTOS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _JUROS_FINANCIAMENTOS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _IMPOSTOS_TAXAS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _OUTRAS_RECEITAS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _LEITE  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _DESPESAS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
//      +#13#10'    KDEF_PLANOCONTA = (SELECT SYS$VALUE FROM SYS$TYPES_GETVALUE ( ''DEF_PLANOCONTAS'', ''DESPESAS'' ))'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  _RECEITAS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
//      +#13#10'    KDEF_PLANOCONTA = (SELECT SYS$VALUE FROM SYS$TYPES_GETVALUE ( ''DEF_PLANOCONTAS'', ''RECEITAS'' ))'
      +#13#10'    KDEF_PLANOCONTA = %s'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;
*)

  _NEW  =
             'SELECT'
      +#13#10'   PC.KFIN_PLANOCONTA'
      +#13#10' , PC.NOME'
      +#13#10'FROM FIN_PLANOCONTAS PC'
      +#13#10'LEFT JOIN FIN_PLANOCONTAS EQV ON EQV.KFIN_PLANOCONTA  = PC.KEQV_PLANOCONTA'
      +#13#10'WHERE '
      +#13#10'  (      ( PC.KDEF_PLANOCONTA = %0:s   )'
      +#13#10'      OR ( EQV.KDEF_PLANOCONTA = %0:s  )'
      +#13#10'  )'
      +#13#10'  AND ( PC.TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 ) )' ;

var
  cds : TClientDataSet ;
begin
  if Initialized then
    exit ;

  try
    cds := nil ;
(*
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _BANCOS, [ QuotedStr( _DEF_BANCOS ) ] ) ) ;
    KeyBancos :=  cds.Fields[0].asString ;
    DescricaoBancos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _DEPRECIACAO, [ QuotedStr( _DEF_DEPRECIACAO ) ] ) ) ;
    KeyDepreciacao :=  cds.Fields[0].asString ;
    DescricaoDepreciacao :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _ESTOQUE, [ QuotedStr( _DEF_ESTOQUE ) ] ) ) ;
    KeyEstoque :=  cds.Fields[0].asString ;
    DescricaoEstoque :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _FINANCIAMENTOS, [ QuotedStr( _DEF_FINANCIAMENTOS ) ] ) ) ;
    KeyFinanciamentos :=  cds.Fields[0].asString ;
    DescricaoFinanciamentos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _JUROS_FINANCIAMENTOS, [ QuotedStr( _DEF_JUROS_FINANCIAMENTOS ) ] ) ) ;
    KeyJurosFinanciamentos :=  cds.Fields[0].asString ;
    DescricaoJurosFinanciamentos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _IMPOSTOS_TAXAS, [ QuotedStr( _DEF_IMPOSTOS_TAXAS ) ] ) ) ;
    KeyImpostosTaxas :=  cds.Fields[0].asString ;
    DescricaoImpostosTaxas :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _LEITE, [ QuotedStr( _DEF_LEITE ) ] ) ) ;
    KeyLeite :=  cds.Fields[0].asString ;
    DescricaoLeite :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _OUTRAS_RECEITAS, [ QuotedStr( _DEF_OUTRAS_RECEITAS ) ] ) ) ;
    KeyOutrasReceitas :=  cds.Fields[0].asString ;
    DescricaoOutrasReceitas :=  cds.Fields[1].asString ;


    //TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _DESPESAS ) ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _DESPESAS, [QuotedStr( _DEF_DESPESAS ) ] ) ) ;
    KeyDespesas :=  cds.Fields[0].asString ;
    DescricaoDespesas :=  cds.Fields[1].asString ;

    //TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _RECEITAS ) ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _RECEITAS, [QuotedStr( _DEF_RECEITAS ) ] ) ) ;
    KeyReceitas :=  cds.Fields[0].asString ;
    DescricaoReceitas :=  cds.Fields[1].asString ;

*)

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_BANCOS ) ] ) ) ;
    KeyBancos :=  cds.Fields[0].asString ;
    DescricaoBancos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_DEPRECIACAO ) ] ) ) ;
    KeyDepreciacao :=  cds.Fields[0].asString ;
    DescricaoDepreciacao :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_ESTOQUE ) ] ) ) ;
    KeyEstoque :=  cds.Fields[0].asString ;
    DescricaoEstoque :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_FINANCIAMENTOS ) ] ) ) ;
    KeyFinanciamentos :=  cds.Fields[0].asString ;
    DescricaoFinanciamentos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_JUROS_FINANCIAMENTOS ) ] ) ) ;
    KeyJurosFinanciamentos :=  cds.Fields[0].asString ;
    DescricaoJurosFinanciamentos :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_IMPOSTOS_TAXAS ) ] ) ) ;
    KeyImpostosTaxas :=  cds.Fields[0].asString ;
    DescricaoImpostosTaxas :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_LEITE ) ] ) ) ;
    KeyLeite :=  cds.Fields[0].asString ;
    DescricaoLeite :=  cds.Fields[1].asString ;

    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [ QuotedStr( _DEF_OUTRAS_RECEITAS ) ] ) ) ;
    KeyOutrasReceitas :=  cds.Fields[0].asString ;
    DescricaoOutrasReceitas :=  cds.Fields[1].asString ;


    //TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _DESPESAS ) ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [QuotedStr( _DEF_DESPESAS ) ] ) ) ;
    KeyDespesas :=  cds.Fields[0].asString ;
    DescricaoDespesas :=  cds.Fields[1].asString ;

    //TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _RECEITAS ) ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, Format ( _NEW, [QuotedStr( _DEF_RECEITAS ) ] ) ) ;
    KeyReceitas :=  cds.Fields[0].asString ;
    DescricaoReceitas :=  cds.Fields[1].asString ;


  finally
    cds.free ;
  end;

  Initialized :=  True ;
end;

end.
