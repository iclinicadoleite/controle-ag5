unit UFIN_FinanceiroMascaraPlanoContasClass;

interface

implementation

uses
  Data.DB, Tc.Data.DB.Helpers,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  CLAg5Types,
  Tc.VCL.Application,
  Tc.DBRTL.AbstractDB,
  CLAg5SvcFinanceiroApropriacao ;

type
  SvcFinanceiroMascaraPlanoContasFactory = class( TInterfacedObject, ISvcFinanceiroMascaraPlanoContas )
  private
    FMascara : string ;
    procedure GetFromDB ;
    procedure SetMascara( AMascara : string ) ;
    function GetMascara : string ;
  end;

{ SvcFinanceiroMascaraPlanoContasFactory }

function SvcFinanceiroMascaraPlanoContasFactory.GetMascara: string;
begin
  if FMascara = '' then
     GetFromDB ;
  Result := FMascara ;
end;

procedure SvcFinanceiroMascaraPlanoContasFactory.GetFromDB ;
const
  _SQL_GETMASK =
     'SYS$VALUE FROM SYS$DOMAIN_TYPES_GETVALUE ( :SYS$DOMAIN, :SYS$TYPE, :SYS$TYPEID )' ;
var
 LCDS : TClientDataSet ;
 p : TParams ;
begin
  LCDS := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'SYS$DOMAIN', ptInput ).asString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'SYS$TYPE',   ptInput ).asString := _ST_PLANO_CONTAS ;
  p.CreateParam( ftString, 'SYS$TYPEID', ptInput ).asString := 'MASK' ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDS, _SQL_GETMASK, p ) ;
  FMascara := LCDS.Fields[0].AsString ;
  p.Free ;
  LCDS.Free ;
end;

procedure SvcFinanceiroMascaraPlanoContasFactory.SetMascara(AMascara: string);
const
  _SQL_GETMASK =
         'UPDATE OR INSERT'
  +#13#10'INTO SYS$DOMAIN_TYPES'
  +#13#10'( KSYS$DOMAIN, SYS$TYPE, SYS$DESCRIPTION, SYS$VALUE, SYS$TYPEID )'
  +#13#10'VALUES'
  +#13#10'( :KSYS$DOMAIN, ''PLANO_CONTAS'', ''Mascara do plano de contas'', :SYS$VALUE, ''MASK'' )'
  +#13#10'MATCHING ( KSYS$DOMAIN, SYS$TYPE, SYS$TYPEID )' ;
var
 p : TParams ;
begin
  FMascara := AMascara ;
  try
    p := TParams.Create ;
    p.CreateParam( ftString, 'KSYS$DOMAIN',       ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'SYS$VALUE',        ptInput ).asString := FMascara ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').Execute( _SQL_GETMASK, p );
  finally
    p.Free ;
  end;
end;

initialization
    SvcFinanceiroMascaraPlanoContas := SvcFinanceiroMascaraPlanoContasFactory.Create ;
finalization
    SvcFinanceiroMascaraPlanoContas := nil ;

end.
