unit ClAg5ClientCommonTypes;

interface



type
  ClAg5MigrationType = ( mtClAg5_AGENDA3, mtClAg5_IDEAGRI, mtClAg5_PRODAP, mtClAg5_UNIFORM ) ;

type

  TLogCallBack = procedure(Log: String) of object;
  TStatusCallBack = procedure(AStaus : String) of object;

  IParametrosFazenda = interface
  ['{7E4D10D7-60F7-496B-8D84-2523FB7F334A}']
    function GetCiosProxDias: integer;
    function GetDSA_EstoqueMacho: Boolean;
    function GetEscalaGraficoProducao: Integer;
    function GetExibirPartoSemconfirmacao: Boolean;
    function GetSecagensProxDias: Integer;
    function GetTarefasProxDias: integer;
    function GetDiasPreSecagemBST : integer ;
    function GetPermiteExcluirTarefasDescarte : boolean ;
    function GetConsiderarNaoPrenheReinseminada : boolean;
    function GetConsiderarNaoPrenheDescartada   : boolean ;
//    function GetIntervaloBST   : integer ;
    property CiosProxDias              : integer read GetCiosProxDias               ;
    property TarefasProxDias           : integer read GetTarefasProxDias            ;
    property SecagensProxDias          : Integer read GetSecagensProxDias           ;
    property DSA_EstoqueMacho          : Boolean read GetDSA_EstoqueMacho           ;
    property ExibirPartoSemconfirmacao : Boolean read GetExibirPartoSemconfirmacao  ;
    property EscalaGraficoProducao     : Integer read GetEscalaGraficoProducao      ;
    property DiasPreSecagemBST         : Integer read GetDiasPreSecagemBST          ;
    property PermiteExcluirTarefasDescarte : Boolean read GetPermiteExcluirTarefasDescarte ;
    property ConsiderarNaoPrenheReinseminada : Boolean read GetConsiderarNaoPrenheReinseminada;
    property ConsiderarNaoPrenheDescartada : Boolean read GetConsiderarNaoPrenheDescartada;


    //    property IntervaloBST              : Integer read GetIntervaloBST   ;
  end ;


  TFazendaParams = class
  public
    class function GetDSA_ESTQ_MACHO : boolean ;
    class procedure SetDSA_ESTQ_MACHO ;
  end ;

  TUsuarioParams = class
  public
    class function VerificaLogin (ULogin : String; UKey : String = '') : boolean;
  end;

  function ParametrosFazenda ( ADomainID : string ) : IParametrosFazenda ;

implementation

Uses Data.DB, Tc.Data.DB.Helpers,
     DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
     Tc.DBRTL.AbstractDB,
     Tc.RTL.NotificationService,
     Tc.VCL.Application,
     CL.Ag5.NSMsgs ;

type

{ TParametrosFazenda }

  TParametrosFazenda = class ( TInterfacedObject, IParametrosFazenda )
  private
    FDomainID : string ;
    FExibirPartoSemconfirmacao: Boolean;
    FEscalaGraficoProducao: Integer;
    FSecagensProxDias: Integer;
    FDSA_EstoqueMacho: Boolean;
    FTarefasProxDias: integer;
    FCiosProxDias: integer;
    FIntervaloBST   : integer ;
    FDiasPreSecagemBST : integer ;
    FPermiteExcluirTarefasDescarte : boolean ;
    FConsiderarNaoPrenheReinseminada : boolean;
    FConsiderarNaoPrenheDescartada   : boolean;
    procedure InitParametrosFazenda;
    procedure ParametrosFazendaChanged(Sender: TCLAg5NSMsg);
    function GetCiosProxDias: integer;
    function GetDSA_EstoqueMacho: Boolean;
    function GetEscalaGraficoProducao: Integer;
    function GetExibirPartoSemconfirmacao: Boolean;
    function GetSecagensProxDias: Integer;
    function GetTarefasProxDias: integer;
    function GetIntervaloBST   : integer ;
    function GetDiasPreSecagemBST : integer ;
    function GetPermiteExcluirTarefasDescarte : boolean ;
    function GetConsiderarNaoPrenheReinseminada : boolean;
    function GetConsiderarNaoPrenheDescartada   : boolean ;
  public
    constructor Create ( ADomainID : string ) ;
    destructor Destroy ; override ;
  end ;

var
  IInternalParametrosFazenda : IParametrosFazenda ;

function ParametrosFazenda ( ADomainID : string ) : IParametrosFazenda ;
begin
  if not Assigned (  IInternalParametrosFazenda  ) then
     IInternalParametrosFazenda := TParametrosFazenda.Create ( ADomainID ) ;
  Result := IInternalParametrosFazenda ;
end;

constructor TParametrosFazenda.Create ( ADomainID : string ) ;
begin
  FDomainID := ADomainID ;
  InitParametrosFazenda ;
  TCLAg5NSMsgParamsChanged.Subscribe( ParametrosFazendaChanged  );
end;

destructor TParametrosFazenda.Destroy;
begin
  TCLAg5NSMsgParamsChanged.UnSubscribe( ParametrosFazendaChanged  );
  Inherited ;
end;

function TParametrosFazenda.GetCiosProxDias: integer;
begin
  Result := self.FCiosProxDias ;
end;

function TParametrosFazenda.GetConsiderarNaoPrenheDescartada: boolean;
begin
  Result := SElf.FConsiderarNaoPrenheDescartada;
end;

function TParametrosFazenda.GetConsiderarNaoPrenheReinseminada: boolean;
begin
  Result := SElf.FConsiderarNaoPrenheReinseminada;
end;

function TParametrosFazenda.GetDSA_EstoqueMacho: Boolean;
begin
  Result := self.FDSA_EstoqueMacho ;
end;

function TParametrosFazenda.GetEscalaGraficoProducao: Integer;
begin
  Result := self.FEscalaGraficoProducao ;
end;

function TParametrosFazenda.GetExibirPartoSemconfirmacao: Boolean;
begin
  Result := self.FExibirPartoSemconfirmacao ;
end;

function TParametrosFazenda.GetIntervaloBST: integer;
begin
  Result := FIntervaloBST ;
end;

function TParametrosFazenda.GetPermiteExcluirTarefasDescarte: boolean;
begin
  Result := FPermiteExcluirTarefasDescarte ;
end;

function TParametrosFazenda.GetDiasPreSecagemBST: integer;
begin
  Result := FDiasPreSecagemBST ;
end;

function TParametrosFazenda.GetSecagensProxDias: Integer;
begin
  Result := self.FSecagensProxDias ;
end;

function TParametrosFazenda.GetTarefasProxDias: integer;
begin
  Result := self.FTarefasProxDias ;
end;

procedure TParametrosFazenda.InitParametrosFazenda;
const
  _SELECT_DIAS_TAREFAS =
          'DIAS_PROX_CIOSCOB, '
   +#13#10'DIAS_PROX_TAREFAS, '
   +#13#10'DIAS_PROX_SECAGENS, '
   +#13#10'DIAS_INTERVALO_BST, '
   +#13#10'DIAS_PRE_SECAGEM_BST, '
   +#13#10'DSA_ESTQ_MACHO, '
   +#13#10'EXIBIR_PARTOS_SEMCONFIRMACAO, '
   +#13#10'ESCALA_PRODUCAO,'
   +#13#10'EXCLUIR_TAREFAS_DESCARTE,'
   +#13#10'CONSIDERAR_NAOPRENHE_SEMCONFIRM,'
   +#13#10'CONSIDERAR_NAOPRENHE_DESCARTADO'
   +#13#10'FROM CAD_FAZENDA_PARAMETROS '
   +#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA' ;

var
  AbstractDB : ITcAbstractDB ;
  cds : TClientDataSet ;
  p : TParams ;

begin

  cds := nil ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := FDomainID ;


  AbstractDB := TTcAbstractDB.GetByAlias ( 'ENTIDADES' ) ;

  Assert ( Assigned ( AbstractDB ), 'necessário AbstractDB ''ENTIDADES''' ) ;

  AbstractDB.populateClientDataSet( cds, _SELECT_DIAS_TAREFAS, p ) ;

  FCiosProxDias                  := cds.FieldByName('DIAS_PROX_CIOSCOB' ).AsInteger;
  FTarefasProxDias               := cds.FieldByName('DIAS_PROX_TAREFAS' ).AsInteger;
  FSecagensProxDias              := cds.FieldByName('DIAS_PROX_SECAGENS').AsInteger;
  FDSA_EstoqueMacho              := cds.FieldByName('DSA_ESTQ_MACHO').asBoolean ;
  FExibirPartoSemconfirmacao     := cds.FieldByName('EXIBIR_PARTOS_SEMCONFIRMACAO').asBoolean ;
  FIntervaloBST                  := cds.FieldByName('DIAS_INTERVALO_BST').asInteger ;
  FEscalaGraficoProducao         := cds.FieldByName('ESCALA_PRODUCAO').asInteger ;
  FDiasPreSecagemBST             := cds.FieldByName('DIAS_PRE_SECAGEM_BST').asInteger ;
  FPermiteExcluirTarefasDescarte := cds.FieldByName('EXCLUIR_TAREFAS_DESCARTE').asBoolean ;
  FConsiderarNaoPrenheReinseminada := cds.FieldByName('CONSIDERAR_NAOPRENHE_SEMCONFIRM').asBoolean ;
  FConsiderarNaoPrenheDescartada := cds.FieldByName('CONSIDERAR_NAOPRENHE_DESCARTADO').asBoolean ;

  cds.Free ;

  TCLAg5NSMsgParamsRefresh.CreateAndDispatch( self ) ;

end;

procedure TParametrosFazenda.ParametrosFazendaChanged(Sender: TCLAg5NSMsg );
begin
  InitParametrosFazenda ;
end;

{ TFazendaParams }

class function TFazendaParams.GetDSA_ESTQ_MACHO: boolean;
var
   p : TParams ;
   cds : TClientDataSet ;
begin
   p := TParams.Create ;
   p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
   cds := nil ;
   TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet ( cds, 'DSA_ESTQ_MACHO FROM CAD_FAZENDA_PARAMETROS WHERE KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
   Result := cds.FieldByName( 'DSA_ESTQ_MACHO' ).AsBoolean ;
   p.Free ;
   cds.free;
end;

class procedure TFazendaParams.SetDSA_ESTQ_MACHO;
var
   p : TParams ;
begin
   p := TParams.Create ;
   p.CreateParam ( ftString, 'DSA', ptInput ).asString := 'T' ;
   p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
   TTcAbstractDB.GetByAlias('ENTIDADES').Execute ( 'UPDATE CAD_FAZENDA_PARAMETROS SET DSA_ESTQ_MACHO = :DSA WHERE KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
   p.free ;
end;

{ TUsuarioParams }

class function TUsuarioParams.VerificaLogin(ULogin, UKey: String): boolean;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin
  p := TParams.Create ;

  try
  sql :='FIRST 1 1 RESULT'
     +#13#10'FROM SYS$USERS'
     +#13#10'WHERE LOGIN = :LOGIN ';

  if UKey <> '' then
    sql :=  sql + ' AND ( KSYS$USER <> :KSYS$USER )' ;

  p.CreateParam( ftString, 'LOGIN', ptInput).asString := ULogin ;

  if uKey <> '' then
      p.CreateParam( ftString, 'KSYS$USER',    ptInput ).asString := UKey ;

  cds := nil ;
  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cds,  sql, p );

  result := cds.FieldByName( 'RESULT' ).asInteger = 1 ;
  finally
   cds.free ;
   p.free ;
 end;
end;

initialization
  IInternalParametrosFazenda := nil ;
end.
