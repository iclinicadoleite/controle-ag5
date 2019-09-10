unit UFIN.DRE.Utils;

interface

uses
    System.Classes
  , CL.Ag5.NSMsgs
  , Tc.DBRTL.AbstractDB
  ;

type

  TPlanoContasDRE =
  (
     pcdreReceitaBruta
   , pcdreDeducoesVenda
   , pcdreDespesaCusto
   , pcdreAmortizacao
   , pcdreInvestimentos
   , pcdreDepreciacao
   , pcdreResultadoFinanceiro
   , pcdreResultadoNaoOperacional
  ) ;

  TPlanoContasDREHelper = record helper for TPlanoContasDRE
  private
    class var FPlanos : TStrings ;
    class var FInitialized : boolean ;
    procedure LoadPlanos ;
    procedure SetList ( AMsg : CL.Ag5.NSMsgs.TCLAg5NSMsg )  ;
    procedure ResetMsg ( AMsg : CL.Ag5.NSMsgs.TCLAg5NSMsg ) ;
    procedure GetList  ( AMsg : CL.Ag5.NSMsgs.TCLAg5NSMsg ) ;
  public
    function GetPlanos : string ;
    class constructor Create ;
    class destructor Destroy ;
  end ;

implementation

uses
     Tc.VCL.Application
   , Data.DB
  ;


{ TPlanoContasDREHelper }
const
 StrValoresDefaultContasDRE : array [ TPlanoContasDRE ] of string =
 (
     '3.1'                  // 'ReceitaBruta'
   , '4.1'                  // 'DeducoesVenda'
   , '4.2, -4.2.15'         // 'DespesaCusto'
   , '2.1'                  // 'Amortizacao'
   , '1.3'                  // 'Investimentos'
   , '4.2.15'               // 'Depreciacao'
   , '3.2.1, (4.3.1)'       // 'ResultadoFinanceiro'
   , '3.2.2, (4.3.2)'       // 'ResultadoNaoOperacional'
 ) ;

class constructor TPlanoContasDREHelper.Create;
begin
   FPlanos := TStringList.Create ;
   TCLAg5NSMsgResetDRE.Subscribe( ResetMsg );
   TCLAg5NSMsgGetListPlanosDRE.Subscribe( GetList );
   TCLAg5NSMsgSetListPlanosDRE.Subscribe( SetList );
end;

class destructor TPlanoContasDREHelper.Destroy;
begin
//  TCLAg5NSMsgResetDRE.UnSubscribe( ResetMsg );
//  TCLAg5NSMsgGetListPlanosDRE.UnSubscribe( GetList );
//  TCLAg5NSMsgSetListPlanosDRE.UnSubscribe( SetList );
  FPlanos.disposeOf ;
end;

procedure TPlanoContasDREHelper.GetList(AMsg: CL.Ag5.NSMsgs.TCLAg5NSMsg);
begin
 LoadPlanos ;
 with TCLAg5NSMsgGetResultListPlanosDRE.Create( nil  ) do
   begin
     Planos := FPlanos.Text ;
     Dispatch ;
   end;
end;

function TPlanoContasDREHelper.GetPlanos: string;
begin
   LoadPlanos ;

  if Ord( self ) >= FPlanos.Count then
    Exit ( StrValoresDefaultContasDRE[ self ] ) ;

  Result := FPlanos[ Ord( self ) ] ;
end;

procedure TPlanoContasDREHelper.LoadPlanos;
const
  _SELECT_DRE_PLANOS =
         'SELECT'
  +#13#10'  SYS$DESCRIPTION'
  +#13#10'FROM SYS$DOMAIN_TYPES'
  +#13#10'WHERE'
  +#13#10'     KSYS$DOMAIN = :KSYS$DOMAIN'
  +#13#10' AND SYS$TYPE    = ''DRE'''
  +#13#10' AND SYS$VALUE   = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )'
  +#13#10'ROWS 1' ;

begin
  if FInitialized then
     exit ;

  FPlanos.BeginUpdate ;
  FPlanos.Clear ;
  TTcAbstractDB
    .GetByAlias('FINANCEIRO')
    .ISQL ( _SELECT_DRE_PLANOS )
    .SQLParamValues( 'KSYS$DOMAIN',     LoggedUser.DomainID )
    .GetDS
    .Iterate(
      procedure ( const ADataSet : TDataSet ; var AContinue : boolean )
      begin
         FPlanos.Text := ADataSet.FieldByName('SYS$DESCRIPTION').asString ;
      end
    ) ;
  for var I := TPlanoContasDRE( FPlanos.Count ) to High( TPlanoContasDRE ) do
    FPlanos.Add( StrValoresDefaultContasDRE[ I ] ) ;
  FPlanos.EndUpdate ;
  FInitialized := True ;
end;

procedure TPlanoContasDREHelper.ResetMsg(AMsg: CL.Ag5.NSMsgs.TCLAg5NSMsg);
begin
   FInitialized := False ;
end;



procedure TPlanoContasDREHelper.SetList( AMsg : CL.Ag5.NSMsgs.TCLAg5NSMsg ) ;
const

  _UPDATE_DRE_PLANOS =
         'UPDATE OR INSERT'
  +#13#10'  INTO SYS$DOMAIN_TYPES'
  +#13#10'('
  +#13#10'  KSYS$DOMAIN'
  +#13#10', SYS$TYPE'
  +#13#10', SYS$VALUE'
  +#13#10', SYS$DESCRIPTION'
  +#13#10', SYS$ORDER'
  +#13#10')'
  +#13#10'VALUES'
  +#13#10'('
  +#13#10'  :KSYS$DOMAIN'
  +#13#10', ''DRE'''
  +#13#10', COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )'
  +#13#10', :SYS$DESCRIPTION'
  +#13#10', COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )'
  +#13#10')'
  +#13#10'MATCHING (KSYS$DOMAIN,SYS$TYPE,SYS$VALUE)';
begin
  TTcAbstractDB
    .GetByAlias('FINANCEIRO')
    .ISQL ( _UPDATE_DRE_PLANOS )
    .SQLParamValues( 'KSYS$DOMAIN',     LoggedUser.DomainID )
    .SQLParamValues( 'SYS$DESCRIPTION', TCLAg5NSMsgSetListPlanosDRE( AMsg ).Planos )
    .SQLExec ;
  FInitialized := False ;
end;



end.
