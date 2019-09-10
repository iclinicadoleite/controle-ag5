unit UDBFinanceiro;

{ DONE 5 -oCaique -cInfra-Extrutura do Sistema : - Problemas conexão FB Embedded }

{.$D-}

// 192.168.100.102/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\ControleLeiteiro4

interface

uses
  WinApi.Windows,
  VCL.Consts,
  System.Classes,
  System.SysUtils,
  System.WideStrings, DBXFirebird, Data.SqlExpr, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.RTL.NotificationService,
  CDSSuppl, SQLSuppl,
  Tc.VCL.Application,
{$IFNDEF _DSServer}
  Tc.VCL.Dialogs,
{$ENDIF}
  VCL.Graphics, Tc.DBRTL.AbstractDB, Tc.DBRTL.AbstractDB.DBX,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  Data.DBXCompressionFilter ;

type


  TDBFinanceiro = class(TDatamodule {, IDBResources } )
    SQLDB: TSQLConnection;
    ADBFinanceiro: TTcadb_DBX;
    SQLDB_ENTIDADES: TSQLConnection;
    procedure SQLDBBeforeConnect(Sender: TObject);
    procedure SQLDBAfterConnect(Sender: TObject);
    procedure ADBFinanceiroInitSystemTypes(AbstractDB: ITcAbstractDB;
      ASysTypes: TCustomClientDataSet);
    procedure SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
    procedure SQLDB_ENTIDADESAfterConnect(Sender: TObject);
  private
    { Private declarations }
    FUserName : string ;
    procedure InitFirebirdConnection ;
    procedure InitFirebirdConnectionEntidades ;
    procedure InitDB  ;
    procedure LoggedUserChanged( ASender : TTcNSMSg );
    {$IFNDEF _DSServer}
    procedure CheckCentroCusto ;
    procedure CheckCFOP ;
    {$ENDIF}

    //procedure RecreateInitPlano ;
    //procedure InitBancos ;
  public
    { Public declarations }
    class function LoggedUser: TLoggedUser;
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

  TCdsSuppl = class ( CDSSuppl.TCdsSuppl ) ;
  TSQLSuppl = class ( SQLSuppl.TSQLSuppl ) ;

  TObjProcedure = procedure of object;

function TryVarToFloat ( Value : Variant ) : double ;

function BoolToChar ( Value : boolean ) : Char ;
function BooleanFieldToText ( Field : TField ) : string ;

function PercentToFloat ( Percent : double ) : double ;
function FloatToPercent ( Valor : double ) : double ;
function PercentToStr ( Percent : double ; AddSymbol : boolean = True ) : string ;
function PercentStrToFloat ( PercentStr : String ) : double ;
function FloatToPercentStr ( Valor : double ; AddSymbol : boolean = True ) : string ;

function PutMaskPlanoConta( Valor : string ) : string ;
function PutMaskCentroCusto( Valor : string ) : string ;

implementation

uses
  DBXFirebirdSuppl,
  CLAG5.DatabaseIntf,
  DateUtils, System.Variants, DSIntf, Tc.RTL.StringUtils, ParamsSuppl, GuidSuppl, Tc.RTL.MD5 ,
//  CLAg5Types,
  Data.SQLTimSt,
  Tc.RTL.Files.Scan, Tc.VCL.Graphics  , UDBFinanceiro.Update,
  CL.Ag5.NSMsgs
  , UDBFinanceiro_InitCFOP
  , CLAg5SvcFinanceiroApropriacao ;

{$R *.DFM}


//function  SQLDB : TSQLConnection ;
//begin
//    result := DBFinanceiro.SQLDB ;
//end ;

function TryVarToFloat( Value : Variant ): double ;
begin
    if VarIsFloat( Value ) then
       Result := Value
    else
       Result := 0 ;
end;

function BoolToChar ( Value : boolean ) : Char ;
begin
  Result := 'F' ;
  if Value then
     Result := 'T' ;
end ;

function BooleanFieldToText ( Field : TField ) : string ;
begin
  if ( not Field.DataSet.Active ) or ( Field.DataSet.isEmpty ) then
     exit ;

  if Field.asBoolean then
     Result := 'Sim'
  else
     Result := 'Não'
end ;

function PercentToFloat ( Percent : double ) : double ;
begin
   Result := StrToFloat ( format ( '%.5f', [ Percent ] ) ) + 1 ;
end ;

function PercentStrToFloat ( PercentStr : String ) : double ;
begin
   Result := ( StrToFloat ( format ( '%.5f', [ StrToFloat ( PercentStr ) ] ) ) / 100 ) + 1 ;
end ;


function FloatToPercent ( Valor : double ) : double ;
begin
  Result := ( Valor - 1 ) ;
end ;

function PercentToStr ( Percent : double ; AddSymbol : boolean = True ) : string ;
var
  Symbol : string ;
begin
  if AddSymbol then
     Symbol := '%' ;

  Result :=  Format ( '%.4f%s', [ Percent * 100, Symbol ] ) ;
end ;


function FloatToPercentStr ( Valor : double ; AddSymbol : boolean = True ) : string ;
begin
  Result := PercentToStr ( ( Valor - 1 ), AddSymbol ) ;
end ;


constructor TDBFinanceiro.Create(AOwner: TComponent);
begin
  inherited;
  TTcNSMsgLoggedUserChanged.Subscribe ( LoggedUserChanged );

end;

destructor TDBFinanceiro.Destroy;
begin
  inherited;
end;


class function TDBFinanceiro.LoggedUser: TLoggedUser;
begin
   Result := Tc.VCL.Application.TTcApplication.Instance.LoggedUser ;
end;

procedure TDBFinanceiro.LoggedUserChanged( ASender : TTcNSMSg );
var
  LUserName : string ;
begin
  LUserName := Trim( LoggedUser.Login ) ;
  if LUserName = '' then
     LUserName := 'SYSTEM' ;
  LUserName := QuotedStr ( LUserName ) ;
  if ( SQLDB.Connected ) and ( LUserName <> FUserName ) then
    begin
     FUserName := LUserName ;
     SQLDB.ExecuteDirect( Format ( 'EXECUTE PROCEDURE LOG$USER( %s )', [ FUserName ] ) )
    end;
end;

(*
procedure TDBFinanceiro.InitBancos;
var
  cmd : TStringList ;
  SQL : string ;
  cds : TClientDataSet ;
  count : integer ;
begin
  cds := nil ;
  AbstractDB.populateClientDataSet( cds, 'SELECT COUNT( * ) RESULT FROM FIN_BANCOS' );
  count := cds.FieldByName ( 'RESULT' ).asInteger ;
  cds.free;

  if Count > 50 then
    exit ;

  SQLDB.ExecuteDirect( 'DELETE FROM FIN_BANCOS' ) ;

 cmd := TStringList.Create ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''7#TsF/RLGwY;jm]`xje3'', ''---'', ''Banco CSF S.A'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, ''2012-07-07 12:05:14'')' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''[1IswJklA;KJ/jvn*8Gn'', ''---'', ''Banco Itaucard S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''eTE*2j@pjaReIxdb]YDX'', ''---'', ''Banco da China Brasil S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''9-a\Sma,o=X.!P)!6s}J'', ''---'', ''Banco Fidis S.A.'', ''www.bancofidis.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''xR\urc]ABv[q!U:N4y::'', ''---'', ''Concórdia Banco S.A.'', ''www.concordiabanco.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''0q)d`P:L06N*4+P!/cEZ'', ''---'', ''Banco Topázio S.A.'', ''www.bancotopazio.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''EL68i6wRWSX[pOiObE1Z'', ''---'', ''Banco Yamaha Motor S.A.'', ''www.yamaha-motor.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''XI9K(Feo.-Ki#,J0IXCB'', ''---'', ''Standard Chartered Bank (Brasil) S/A–Bco Invest.'', ''www.standardchartered.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''bRF4=8vTiJN*QsAVb2a+'', ''000'', ''Banco Bankpar S.A.'', ''www.aexp.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''@iHSg0T+=NV8cFQX^3^H'', ''001'', ''Banco do Brasil S.A.'', ''www.bb.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''^HKX(vu/,,RFm?T,po:Z'', ''003'', ''Banco da Amazônia S.A.    '', ''www.bancoamazonia.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''(,4Um5O\\IZRP9T`(`p)'', ''004'', ''Banco do Nordeste do Brasil S.A.'', ''www.banconordeste.gov.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''e!fFY/IGHDO6)5#!jCl!'', ''012'', ''Banco Standard de Investimentos S.A.'', ''www.standardbank.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''v*jObYy2]qK\Bep2)26w'', ''021'', ''BANESTES S.A. Banco do Estado do Espírito Santo'', ''www.banestes.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''fWer85=CxpWXCmE@1Vks'', ''024'', ''Banco de Pernambuco S.A. - BANDEPE'', ''www.bandepe.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''3oHGH^jdOs^3l+|1(d7t'', ''025'', ''Banco Alfa S.A.'', ''www.bancoalfa.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''v0$|\\Wb9,Rf3T?-x[}s'', ''029'', ''Banco Banerj S.A.'', ''www.banerj.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Q717{B+Dv:U-OV2e`E7B'', ''031'', ''Banco Beg S.A.'', ''www.itau.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''eeZy*{+YYdYYb0t6Puu-'', ''033'', ''Banco Santander (Brasil) S.A.'', ''www.santander.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''yrSYYE`3oG]b^`aquN7{'', ''036'', ''Banco Bradesco BBI S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''cPd[{aoOFg^G4\ar@Jqe'', ''037'', ''Banco do Estado do Pará S.A.'', ''www.banparanet.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''22[*n}t[XWZ[1PCvPGc0'', ''040'', ''Banco Cargill S.A.'', ''www.bancocargill.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''{W(!ghK=*:RNw*^;+`u|'', ''041'', ''Banco do Estado do Rio Grande do Sul S.A.'', ''www.banrisul.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''TBE;Lw+x*LY76D@8nl03'', ''044'', ''Banco BVA S.A.'', ''www.bancobva.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Yr,;Byg`F(Q:S@mx(sXa'', ''045'', ''Banco Opportunity S.A.'', ''www.opportunity.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''x2/c;-FL?WYR)YCObqFW'', ''047'', ''Banco do Estado de Sergipe S.A.'', ''www.banese.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''6b.$:UD7*/L+f]8{:UlN'', ''062'', ''Hipercard Banco Múltiplo S.A.'', ''www.hipercard.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''n;HwBy6yj}Pf}Zi.6|uR'', ''063'', ''Banco Ibi S.A. Banco Múltiplo'', ''www.ibi.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''kyZ-1rfe]r\J:7c!.\T4'', ''064'', ''Goldman Sachs do Brasil Banco Múltiplo S.A.'', ''www.goldmansachs.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''H*WDaEC`MbZCS0R8-o1/'', ''065'', ''Banco Bracce S.A.'', ''www.bancobracce.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Ui194JJBDwQEokT6VpgV'', ''069'', ''BPN Brasil Banco Múltiplo S.A.'', ''www.bpnbrasil.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''9*1BbN/d-k\QqRr!#TCd'', ''070'', ''BRB - Banco de Brasília S.A.'', ''www.brb.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''U-eiKK^=dqZ`fg9oe#{r'', ''072'', ''Banco Rural Mais S.A.'', ''www.rural.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''.V]mMZrkF8Nxm3^T8!!@'', ''073'', ''BB Banco Popular do Brasil S.A.'', ''www.bancopopulardobrasil.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''v(rq0)YQEbJh@WIOolOF'', ''074'', ''Banco J. Safra S.A.'', ''www.jsafra.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''@P|4}:|/acY*4{kSKamT'', ''078'', ''BES Investimento do Brasil S.A.-Banco de Investimento'', ''www.besinvestimento.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Gl@!4rMY36NRM*gmy76['', ''079'', ''Banco Original do Agronegócio S.A.'', ''www.bancooriginal.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''n6DnFR2li5[.EEggtrZ#'', ''096'', ''Banco BM&F de Serviços de Liquidação e Custódia S.A'', ''www.bmf.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''R]=A59(Ch)O[fgfdHj{('', ''104'', ''Caixa Econômica Federal'', ''www.caixa.gov.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''5;YR({)@+$JEYwC;2Sig'', ''107'', ''Banco BBM S.A.'', ''www.bbmbank.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''vjPYqQo*bpU#3;iE`qx.'', ''119'', ''Banco Western Union do Brasil S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''ECq^Hmg1.)SFZ@DwK^l6'', ''184'', ''Banco Itaú BBA S.A.'', ''www.itaubba.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''C(ifDacP+@WXlT[#V|NR'', ''204'', ''Banco Bradesco Cartões S.A.'', ''www.iamex.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''|8a^99MyRuK@78`FN6eP'', ''208'', ''Banco BTG Pactual S.A.'', ''www.pactual.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''y*?Ds\[^HfY;}YMOQuJ-'', ''214'', ''Banco Dibens S.A.'', ''www.bancodibens.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Os#6oxF-2aLPL6$-a;47'', ''215'', ''Banco Comercial e de Investimento Sudameris S.A.'', ''www.sudameris.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''larBmUb)X8ZEb^#H.nSo'', ''217'', ''Banco John Deere S.A.'', ''www.johndeere.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Y^C{x$T9|5Nx*+iVk=PV'', ''218'', ''Banco Bonsucesso S.A.'', ''www.bancobonsucesso.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''wH2P8V4=kXZd*,H671CY'', ''222'', ''Banco Credit Agricole Brasil S.A.'', ''www.calyon.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''6G\+q@ABxPTbA@`{9+2l'', ''224'', ''Banco Fibra S.A.'', ''www.bancofibra.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''0Jm$vA+xPNVxF:C8utx-'', ''225'', ''Banco Brascan S.A.'', ''www.bancobrascan.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''eMov;]Vo72^$sHa?N9(;'', ''229'', ''Banco Cruzeiro do Sul S.A.'', ''www.bcsul.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Al|o#do`kDOC$`{cG#CX'', ''230'', ''Unicard Banco Múltiplo S.A.'', ''www.unicard.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Gp3[REKU|qSKig.//xP)'', ''233'', ''Banco Cifra S.A.'', ''www.bancocifra.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''7!yhS8iWY9\O{aX0FgC?'', ''237'', ''Banco Bradesco S.A.'', ''www.bradesco.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Yt1Q|4MbAkM|y*uUx[}s'', ''246'', ''Banco ABC Brasil S.A.'', ''www.abcbrasil.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''vnAB#Q-e;ZXj\?9q*6uH'', ''248'', ''Banco Boavista Interatlântico S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''f#V9;v77j8RKEC+Mk0UT'', ''249'', ''Banco Investcred Unibanco S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('')`vrj+Eb+gWj{[c5]lxD'', ''250'', ''Banco Schahin S.A.'', ''www.bancoschahin.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''xQZ5Qs.{IaNluS#|K,f`'', ''263'', ''Banco Cacique S.A.'', ''www.bancocacique.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''mOowEO.o69QJT|oyv/;#'', ''265'', ''Banco Fator S.A.'', ''www.bancofator.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('',WQGoX-tD,T3Zre*sYA.'', ''318'', ''Banco BMG S.A.'', ''www.bancobmg.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''BxUgxg1;^x]?E)mq`.ci'', ''320'', ''Banco Industrial e Comercial S.A.'', ''www.bicbanco.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''2YPVGQmv+LY@(]n8?Ble'', ''341'', ''Itaú Unibanco S.A.'', ''www.itau.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''fqjN;mx8f5O8Zj9bXe|='', ''356'', ''Banco Real S.A.'', ''www.bancoreal.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''rZm8M5EeT,NC8\sJOG`n'', ''366'', ''Banco Société Générale Brasil S.A.'', ''www.sgbrasil.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''aZ:*!]oD\UO{}?]AqJ?@'', ''370'', ''Banco WestLB do Brasil S.A.'', ''www.westlb.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Y@/Xjp=O:SJRt6brXGJ*'', ''376'', ''Banco J. P. Morgan S.A.'', ''www.jpmorgan.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''/$=+/!vp}}Pm+HFBNSJI'', ''389'', ''Banco Mercantil do Brasil S.A.'', ''www.mercantil.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''+YY/tA8iJUW69{^=kNd0'', ''394'', ''Banco Finasa BMC S.A.'', ''www.bmc.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''JO4NBfw(R-]`(sjY:GL/'', ''394'', ''Banco Bradesco Financiamentos S.A.'', ''www.bmc.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''ImCtr9.hkjJk$fgQ]hES'', ''399'', ''HSBC Bank Brasil S.A. - Banco Múltiplo'', ''www.hsbc.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''rl=@Ow.hb9WbFVj8DK2n'', ''409'', ''UNIBANCO - União de Bancos Brasileiros S.A.'', ''www.unibanco.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''lVf@n4Hv8HLT[fS]]uh5'', ''422'', ''Banco Safra S.A.'', ''www.safra.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''4?ou.vA`K!X2@fy#.D$^'', ''453'', ''Banco Rural S.A.'', ''www.rural.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''M.JV40-,I:M|v@Sy:cN/'', ''456'', ''Banco de Tokyo-Mitsubishi UFJ Brasil S.A.'', ''www.btm.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''ks4a6.u+s4KK@{b-!n7y'', ''464'', ''Banco Sumitomo Mitsui Brasileiro S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''6#gN0jtH6qRJb-1JP}!5'', ''473'', ''Banco Caixa Geral - Brasil S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''JfbjiO0:*#O$I|/hqZ5/'', ''477'', ''Citibank S.A.'', ''www.citibank.com/brasil'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''UX-oXQRvU\\ky!F=UJ)g'', ''479'', ''Banco ItaúBank S.A'', ''www.itaubank.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Cse-U]\(IqV(o$=3ot.:'', ''487'', ''Deutsche Bank S.A. - Banco Alemão'', ''www.deutsche-bank.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''5jkW`hq^4VZ7yE2i:SAs'', ''488'', ''JPMorgan Chase Bank'', ''www.jpmorganchase.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''#;Hb--3K6yXTt1II?Q[k'', ''492'', ''ING Bank N.V.'', ''www.ing.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''}NQko=j=lRR$?NFvF)wv'', ''505'', ''Banco Credit Suisse (Brasil) S.A.'', ''www.csfb.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''7AUlh48@i$Pm1Te)5.{b'', ''600'', ''Banco Luso Brasileiro S.A.'', ''www.lusobrasileiro.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('']mams\Cv,@P(+jUWNLd{'', ''604'', ''Banco Industrial do Brasil S.A.'', ''www.bancoindustrial.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Hj6AZoCND|Y::)Oopehl'', ''610'', ''Banco VR S.A.'', ''www.vr.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''{M:4*2uF1\UY[xxhBU!*'', ''611'', ''Banco Paulista S.A.'', ''www.bancopaulista.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''JB1|Dm4/iE[U[QFJ-?(O'', ''612'', ''Banco Guanabara S.A.'', ''www.bcoguan.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''x;yiC{^J9)[htWT`+sdt'', ''623'', ''Banco Panamericano S.A.'', ''www.panamericano.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''4fI$K70R$oS4\\N5vgP$'', ''626'', ''Banco Ficsa S.A.'', ''www.ficsa.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('':kdj:[I-RNTKZ\LFWbgj'', ''633'', ''Banco Rendimento S.A.'', ''www.rendimento.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''h$(NPm5=T0R#PI1knCX-'', ''634'', ''Banco Triângulo S.A.'', ''www.tribanco.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''6DjDdiw9+;J^h9bYsQ/x'', ''637'', ''Banco Sofisa S.A.'', ''www.sofisa.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''8Z5$24B=j?V`d]v|Ir0+'', ''638'', ''Banco Prosper S.A.'', ''www.bancoprosper.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''!r8rt(AE8PQEJ0SJ@wJp'', ''641'', ''Banco Alvorada S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''-\Aaw(t#c|]+.[@RYj4]'', ''643'', ''Banco Pine S.A.'', ''www.bancopine.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''}3iYWAvk56JVbKiq-py5'', ''652'', ''Itaú Unibanco Holding S.A.'', ''www.itau.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('']X=`/vkW?}Z6f`T-\E|7'', ''653'', ''Banco Indusval S.A.'', ''www.indusval.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''fC0?CHyUroSO/#USo;xM'', ''655'', ''Banco Votorantim S.A.'', ''www.bancovotorantim.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''i\$],gR]yEKK.GMWVkW3'', ''707'', ''Banco Daycoval S.A.'', ''www.daycoval.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Q7#E#PB92`Wdh(aX!Kdl'', ''719'', ''Banif-Banco Internacional do Funchal (Brasil)S.A.'', ''www.banif.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''=e72!m?)EVZxrnaIll|Z'', ''739'', ''Banco BGN S.A.'', ''www.bgn.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''iL1(5ym^?`ZH4RCf@Stv'', ''740'', ''Banco Barclays S.A.'', ''www.barclays.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''f6$ab!8{T3ZV;3Wo8=v7'', ''745'', ''Banco Citibank S.A.'', ''www.citibank.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''D2cxoa|WLtK}yB(X?KBD'', ''746'', ''Banco Modal S.A.'', ''www.bancomodal.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('':==QeM[RdwZsLI?5562I'', ''747'', ''Banco Rabobank International Brasil S.A.'', ''www.rabobank.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''Jw!j`RxiYMWUXkDyHI4s'', ''748'', ''Banco Cooperativo Sicredi S.A.'', ''www.sicredi.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''q*\?*,UL3#NOc5N,||D`'', ''749'', ''Banco Simples S.A.'', ''www.bancosimples.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''BssbXR8b|2Z-p81Ke$OG'', ''751'', ''Scotiabank Brasil S.A. Banco Múltiplo'', ''www.br.scotiabank.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''8}^nl1`*#SUS?A)BDxwR'', ''752'', ''Banco BNP Paribas Brasil S.A.'', ''www.bnpparibas.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''7(?[y[EvLuK5TrN7KQnu'', ''755'', ''Bank of America Merrill Lynch Banco Múltiplo S.A.'', ''www.ml.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''`I.45?hQWVWCARTRU$Ly'', ''756'', ''Banco Cooperativo do Brasil S.A. - BANCOOB'', ''www.bancoob.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''DjXH$4GHydMs]d+.nuB['', ''M03'', ''Banco Fiat S.A.'', ''www.bancofiat.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''UZtG}Ciye[RUQxtOw5G]'', ''M06'', ''Banco de Lage Landen Brasil S.A.'', ''www.delagelanden.com'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''6snK2M5!L/Rj*^/ThN(X'', ''M07'', ''Banco GMAC S.A.'', ''www.bancogm.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''/.,b1EHPYaZKFjIf]o`s'', ''M08'', ''Banco Citicard S.A.'', ''www.credicardbanco.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''$}[qnnu6qwRhx5:!i0xm'', ''M09'', ''Banco Itaucred Financiamentos S.A.'', ''www.itaucred.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''MKT8QM-9F8O\n/3kf.VO'', ''M11'', ''Banco IBM S.A.'', ''www.ibm.com/br/financing/'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''aq^qbXI@s3\wI|Rws2XW'', ''M14'', ''Banco Volkswagen S.A.'', ''www.bancovw.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''GogL/P,-i.^Bi}||NwuX'', ''M16'', ''Banco Rodobens S.A.'', ''www.rodobens.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''L{4]YLhn,$TpU4+g^m;]'', ''M18'', ''Banco Ford S.A.'', ''www.bancoford.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''r#u]7CU417]iB)ElehcT'', ''M19'', ''Banco CNH Capital S.A.'', ''www.bancocnh.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''`{V/DR/T?ELc\}s*4]..'', ''M20'', ''Banco Toyota do Brasil S.A.'', ''www.bancotoyota.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES ('')ZDTUk2ZS9WQp@xmx$v!'', ''M22'', ''Banco Honda S.A.'', ''www.bancohonda.com.br'', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 cmd.Add ( 'INSERT INTO FIN_BANCOS (KFIN_BANCO, CODIGO, NOME, HOMEPAGE, FEBRABAN, SYS$UI, SYS$DI, SYS$UU, SYS$DU)'
+#13#10' VALUES (''kaW}^nN$S6\\M3|I@`\.'', ''M23'', ''Banco Volvo (Brasil) S.A.'', '''', ''T'', NULL, ''2012-06-22 14:23:09'', NULL, NULL)' ) ;

 for SQL in cmd  do
     SQLDB.ExecuteDirect( SQL ) ;

 cmd.free ;

end;
*)

(*
procedure TDBFinanceiro.RecreateInitPlano;
const

 _CREATE_PROC = 'CREATE OR ALTER PROCEDURE SYS$INIT_PLANOCONTAS ('
+#13#10'    PKCAD_FAZENDA TYPE OF SYS$FKGUID20_NN)'
+#13#10'AS'
+#13#10'  DECLARE KDEF_PLANOCONTA      SYS$FKGUID20 ;'
+#13#10'  DECLARE CODIGO               SYS$INT_NN ;'
+#13#10'  DECLARE NOME                 FIN$DESCPLANCONTAS_NN ;'
+#13#10'  DECLARE KMDEF_PLANOCONTA     SYS$FKGUID20 ;'
+#13#10'  DECLARE KMFIN_PLANOCONTA     SYS$FKGUID20 ;'
+#13#10'  DECLARE ANALITICO_SINTETICO  FIN$ANALITICO_SINTETICO ;'
+#13#10'  DECLARE DEVEDORA_CREDORA     FIN$DEVEDORA_CREDORA ;'
+#13#10'  DECLARE FLUXOCAIXA           FIN$FLUXOCAIXA ;'
+#13#10'  DECLARE TIPO_APRD            FIN$TIPO_APRD ;'
+#13#10'  DECLARE FIXA_VARIAVEL        FIN$FIXA_VARIAVEL ;'
+#13#10'  DECLARE CLASSIFICACAO        SYS$CODE_NN ;'
+#13#10'  DECLARE ATIVO                SYS$BOOL_T ;'
+#13#10'  DECLARE SYS$DU               SYS$DATE;'
+#13#10'  DECLARE PATH VARCHAR( 256 );'
+#13#10'BEGIN'
+#13#10''
+#13#10'   PATH = SU$EXTRACTFILEPATH ( RDB$GET_CONTEXT( ''SYSTEM'', ''DB_NAME'' ) ) ;'
+#13#10'   PATH = SU$EXTRACTFILEPATH ( SUBSTRING ( PATH FROM 1 FOR CHAR_LENGTH( PATH )- 1 ) ) ;'
+#13#10'   PATH = SU$EXTRACTFILEPATH ( SUBSTRING ( PATH FROM 1 FOR CHAR_LENGTH( PATH )- 1 ) ) ;'
+#13#10''
+#13#10'   IF ( SU$FILEEXISTS( PATH || ''CLAG5.DB'' ) <> 1) THEN'
+#13#10'     EXIT ;'
+#13#10''
+#13#10'   FOR EXECUTE STATEMENT ('
+#13#10'         ''SELECT '''
+#13#10'       ||'' KDEF_PLANOCONTA, CODIGO, NOME, KMDEF_PLANOCONTA, '''
+#13#10'       ||'' ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA, '''
+#13#10'       ||'' TIPO_APRD, FIXA_VARIAVEL, CLASSIFICACAO, ATIVO, SYS$DU '''
+#13#10'       ||''FROM DEF_PLANOCONTAS'''
+#13#10'       ) ON EXTERNAL DATA SOURCE PATH || ''CLAG5.DB'''
+#13#10'       WITH COMMON TRANSACTION'
+#13#10'       INTO :KDEF_PLANOCONTA, :CODIGO, :NOME, :KMDEF_PLANOCONTA,'
+#13#10'            :ANALITICO_SINTETICO, :DEVEDORA_CREDORA, :FLUXOCAIXA,'
+#13#10'            :TIPO_APRD, :FIXA_VARIAVEL, :CLASSIFICACAO, :ATIVO, :SYS$DU'
+#13#10'   DO'
+#13#10'     BEGIN'
+#13#10'        IF ( KMDEF_PLANOCONTA IS NULL ) THEN'
+#13#10'           KMFIN_PLANOCONTA = NULL ;'
+#13#10'        ELSE'
+#13#10'           BEGIN'
+#13#10'             SELECT KFIN_PLANOCONTA FROM FIN_PLANOCONTAS'
+#13#10'             WHERE KCAD_FAZENDA = :pKCAD_FAZENDA AND KDEF_PLANOCONTA = :KMDEF_PLANOCONTA'
+#13#10'             INTO KMFIN_PLANOCONTA ;'
+#13#10'           END'
+#13#10''
+#13#10'        IF ( EXISTS (SELECT 1 FROM FIN_PLANOCONTAS WHERE KCAD_FAZENDA = :pKCAD_FAZENDA AND KDEF_PLANOCONTA = :KDEF_PLANOCONTA ) ) THEN'
+#13#10'           UPDATE FIN_PLANOCONTAS'
+#13#10'           SET'
+#13#10'               CODIGO           = :CODIGO,'
+#13#10'               NOME             = :NOME,'
+#13#10'               KMFIN_PLANOCONTA = :KMFIN_PLANOCONTA,'
+#13#10'               SYS$DU           = :SYS$DU'
+#13#10'            WHERE ( KCAD_FAZENDA = :pKCAD_FAZENDA  AND KDEF_PLANOCONTA = :KDEF_PLANOCONTA )'
+#13#10'             AND (   (SYS$DU IS NULL)'
+#13#10'                  OR (SYS$DU < :SYS$DU)'
+#13#10'                  OR ( KMFIN_PLANOCONTA IS DISTINCT FROM :KMFIN_PLANOCONTA )'
+#13#10'               ) ;'
+#13#10'        ELSE'
+#13#10'          BEGIN'
+#13#10''
+#13#10'            INSERT INTO FIN_PLANOCONTAS ( KFIN_PLANOCONTA, KCAD_FAZENDA, CODIGO, NOME, KMFIN_PLANOCONTA, KDEF_PLANOCONTA, KMDEF_PLANOCONTA,'
+#13#10'                ANALITICO_SINTETICO, DEVEDORA_CREDORA, FLUXOCAIXA,'
+#13#10'                TIPO_APRD, FIXA_VARIAVEL, CLASSIFICACAO, ATIVO, SYS$DU )'
+#13#10'            VALUES ( Guid20(), :pKCAD_FAZENDA, :CODIGO, :NOME, :KMFIN_PLANOCONTA, :KDEF_PLANOCONTA, :KMDEF_PLANOCONTA,'
+#13#10'                :ANALITICO_SINTETICO, :DEVEDORA_CREDORA, :FLUXOCAIXA,'
+#13#10'                :TIPO_APRD, :FIXA_VARIAVEL, :CLASSIFICACAO, :ATIVO, :SYS$DU );'
+#13#10''
+#13#10'          END'
+#13#10'     END'
+#13#10''
+#13#10'END' ;

  _ALTER = 'ALTER TABLE FIN_PLANOCONTAS ADD KMDEF_PLANOCONTA SYS$FKGUID20' ;

  _INIT = 'EXECUTE PROCEDURE SYS$INIT_PLANOCONTAS ( %s )' ;

var
  cmd : TStringList ;
  SQL: string ;
  cds : TClientDataSet ;
  count : integer ;
begin
  cds := nil ;
  AbstractDB.populateClientDataSet( cds, 'SELECT COUNT( * ) RESULT FROM FIN_PLANOCONTAS' );
  count := cds.FieldByName ( 'RESULT' ).asInteger ;
  cds.free;

  if Count > 50 then
    exit ;

  try
    SQLDB.ExecuteDirect( 'DELETE FROM FIN_PLANOCONTAS' ) ;
    SQLDB.ExecuteDirect( _ALTER ) ;
  except on E : Exception do
    showMessage ( E.Message ) ;
     // none
  end;

  SQLDB.ExecuteDirect( _CREATE_PROC ) ;

  SQLDB.ExecuteDirect( Format ( _INIT, [ QuotedStr ( LoggedUser.DomainID ) ] ) ) ;


end;
*)

const
  _ST_CENTROS_CUSTO_MASK                            = '000.00.00' ; // Mascara do Centro de Custo

function PutMaskPlanoConta(Valor: string): string;
var
  Values, Maskes : TStringList;
  Width, Value, IterateValue : integer;
  Fmask : String;
begin
   if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    Fmask :=  SvcFinanceiroMascaraPlanoContas.GetMascara
   else
    Fmask :=  _ST_PLANO_CONTAS_MASK ;

  Maskes               := TStringList.Create;
  Maskes.Delimiter     := '.';
  Maskes.DelimitedText := Fmask;

  Values               := TStringList.Create;
  Values.Delimiter     := '.';
  Values.DelimitedText := Valor ;

  Result := '' ;

  IterateValue := 0;
  while ( IterateValue < Values.Count  )  do
    begin
       if ( IterateValue < Maskes.Count  ) then
          Width  :=  Length ( Maskes[ IterateValue ] )
       else
          Width  := 0 ;
       Value := StrToIntDef ( Values[ IterateValue ], 0 ) ;
       Result := Format ( '%s%.*d.', [ Result, Width, Value ] );
       Inc(IterateValue,1)
    end;

  Result := Copy ( Result, 1, Length ( Result ) -1 )  ;

  Maskes.free ;
  Values.free ;

end;

function PutMaskCentroCusto(Valor: string): string;
var
  aux, codigo : String;
  list : TStringList;
  listMask : TStringList;
  tamanho, i : integer;
  Fmask : String;
begin
  Fmask := _ST_CENTROS_CUSTO_MASK ;

  try
    listMask := TStringList.Create;
    listMask.Delimiter := '.';
    listMask.DelimitedText := Fmask;

    list := TStringList.Create;
    list.Delimiter := '.';
    list.DelimitedText := Valor;

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

    Result := codigo;
  except
    Result := '';
  end;
end;

procedure TDBFinanceiro.InitFirebirdConnection ;
begin
   with SQLDB,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbFinanceiro ] ;
     end ;
end ;

procedure TDBFinanceiro.InitFirebirdConnectionEntidades ;
begin
   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.ENT'
   with SQLDB,Params do
     begin
       DriverName := 'Firebird250' ;
       TTCDBXFirebirdDriver.InitFirebidParams( DriverName, Params );
       Values[ 'Database'      ] := DatabaseCfgFactory.Path[ dbEntidades ] ;
     end ;

end ;

procedure TDBFinanceiro.InitDB  ;
begin
 try
   TDBFinanceiroUpdate.Execute( ADBFinanceiro );
 except on E :Exception do
   raise Exception.Create('TDBFinanceiro.InitDB ' + E.Message);
 end;
end ;



{$IFDEF _DSServer}
{$ELSE}

procedure TDBFinanceiro.SQLDBBeforeConnect(Sender: TObject);
begin
   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterBeforeConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   // 'TC-NBDV71/30250:T:\CDL\Sistemas\ControleLeiteiro\Data\Client\CL-%s\DB\CLAG5.%s.FIN'

   InitFirebirdConnection ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitBeforeConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

end;

procedure TDBFinanceiro.SQLDBAfterConnect(Sender: TObject);
begin
   LoggedUserChanged (nil);
   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitDB  ;

   CheckCentroCusto ;
   CheckCFOP ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

end;

procedure TDBFinanceiro.CheckCentroCusto;
const
  _DEF_PECUARIA_LEITE = 'La;m;0+smOQ+4RnK^6as' ;
 _SELECT_DEF_CC = 'SELECT 1 RESULT FROM FIN_CENTROSCUSTO WHERE KDEF_CENTROCUSTO = :CC_PECUARIALEITE' ;
var
 p : TParams ;
 cds : TClientDataSet ;
 LHasCC_PecuariaLeite : boolean ;
begin


  p := TParams.Create ;
  p.CreateParam( ftString, 'CC_PECUARIALEITE', ptInput ).asString := _DEF_PECUARIA_LEITE ;

  cds := nil ;
  ADBFinanceiro.populateClientDataSet( cds, _SELECT_DEF_CC, p ) ;
  p.free ;
  LHasCC_PecuariaLeite := cds.FieldByName ( 'RESULT' ).asInteger = 1 ;
  cds.Free ;

  if not LHasCC_PecuariaLeite then
     ShowMessage ( 'Não existe um Centro de Custo marcado como pecuária de leite'
            +#13#10'Configure o centro de custo de pecuária de leite na opção:'
            +#13#10
            +#13#10'Inicial/Configurações/Financeiro/Centro de Custo'
            +#13#10
            +#13#10 ) ;

end;

procedure TDBFinanceiro.CheckCFOP;
const
 _SELECT1_CFOP = 'SELECT 1 RESULT FROM FAT_CFOP ROWS 1' ;
var
 cds : TClientDataSet ;
 LHasCFOP : boolean ;
begin

  cds := nil ;
  ADBFinanceiro.populateClientDataSet( cds, _SELECT1_CFOP ) ;
  LHasCFOP := not cds.IsEmpty ;
  cds.Free ;

  if not LHasCFOP then
     TInitCFOP.Execute ( ADBFinanceiro ) ;
end;

procedure TDBFinanceiro.SQLDB_ENTIDADESBeforeConnect(Sender: TObject);
begin

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterBeforeConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;

   InitFirebirdConnectionEntidades ;

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitBeforeConnect ;
       SQLConnection := SQLDB_ENTIDADES ;
       Dispatch ;
     end;

end;

procedure TDBFinanceiro.SQLDB_ENTIDADESAfterConnect(Sender: TObject);
begin
try
   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := EnterAfterConnect ;
       SQLConnection := SQLDB_ENTIDADES ;
       Dispatch ;
     end;

   //   InitDBEntidades ;

   //self.ImageFazendaChanged( nil );

   with TCLAg5NSMsgDBSession.Create(self) do
     begin
       EventType := ExitAfterConnect ;
       SQLConnection := SQLDB ;
       Dispatch ;
     end;
except On E : Exception do
   raise Exception.Create('TDBEntidades.SQLDBAfterConnect:' + E.Message );
end;
end ;


{$ENDIF}

procedure TDBFinanceiro.ADBFinanceiroInitSystemTypes(AbstractDB: ITcAbstractDB;
  ASysTypes: TCustomClientDataSet);
const
  _SQL_SYSTYPES = '"SYS$TYPE" TIPO,'
          + #13#10'"SYS$VALUE" VALOR,'
          + #13#10'"SYS$DESCRIPTION" DESCRICAO,'
          + #13#10'"SYS$ORDER" ORDEM'
          + #13#10'from "SYS$TYPES"'
          + #13#10'order by "SYS$TYPE" , "SYS$ORDER" , "SYS$VALUE"' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
//  AbstractDB.populateClientDataSet( cds, _SQL_SYSTYPES );
  Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias('SESSION').populateClientDataSet( cds, _SQL_SYSTYPES );
  TCDSSuppl.InsertAllRecordsFromDataSet( cds, ASysTypes ) ;
  cds.free;
end;


initialization
   RegisterClass ( TDBFinanceiro ) ;

end.
