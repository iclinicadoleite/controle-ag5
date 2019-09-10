unit UFIN_ApropriacaoClass;

interface

uses
  DBClient ;

type
    TApropriacao = class
     class function ForceCC : boolean ;
     class function NeedCC( KFIN_PLANOCONTA : string ) : boolean ;
     class function AddCentroCustoFromTo( AOrigem : string ; AOrigemKey : string ;
                         ADestino : string ; ADestinoKey : string ;  ACDSApropriacao : TClientDataSet ; AIsNeedCC : boolean ) : boolean ;
     class function  AddCentroCustoPadrao( ACDSApropriacao : TClientDataSet ) : boolean ;
    end;


implementation

uses System.Generics.Collections,
     Data.DB, Tc.Data.DB.Helpers,
     Tc.DBRTL.AbstractDB,
     Tc.VCL.Application,
     CLAg5SvcFinanceiroApropriacao ;

type

  SvcFinanceiroApropriacaoDefaultFactory = class( TInterfacedObject, ISvcFinanceiroApropriacaoDefault )
     function ForceCC : boolean ;
     function NeedCC( KFIN_PLANOCONTA : string ) : boolean ;
     function AddCentroCustoFromTo( AOrigem : string ; AOrigemKey : string ;
                         ADestino : string ; ADestinoKey : string ;
                         ACDSApropriacao : TClientDataSet ;
                         AIsNeedCC : boolean ) : boolean ;
     function  AddCentroCustoPadrao( ACDSApropriacao : TClientDataSet ) : boolean ;
  end;


     TUsedPlanoContas = class( TDictionary<string,string> )
     strict private
       class var
        UsedPlanoContas : TUsedPlanoContas;
       procedure AddPlano( KFIN_PLANOCONTA : string ; var AResult : string ) ;
     public
       class function GetAPRD( KFIN_PLANOCONTA : string ) : string;
     end;


class function TApropriacao.NeedCC( KFIN_PLANOCONTA : string ) : boolean ;
var
  LAPRD : string ;
begin

  if ForceCC then
     Exit ( True ) ;

  LAPRD := TUsedPlanoContas.GetAPRD( KFIN_PLANOCONTA ) ;

  Result :=(     (LAPRD <> '')
             and ( not ( LAPRD[ 1 ] in [ 'A', 'P' ] ) )
           ) ;

end;


class function  TApropriacao.AddCentroCustoPadrao( ACDSApropriacao : TClientDataSet ) : boolean ;
const
  _DEF_PECUARIA_LEITE = 'La;m;0+smOQ+4RnK^6as' ;
  _SELECT_DEF_CC =
         'SELECT'
  +#13#10' CC.KFIN_CENTROCUSTO,'
  +#13#10' CC.CODIGO,'
  +#13#10' CC.NOME'
  +#13#10'FROM FIN_CENTROSCUSTO CC'
  +#13#10'WHERE CC.KDEF_CENTROCUSTO = :CC_PECUARIALEITE' ;

  _SELECT_UNQ_CC =
         'SELECT'
  +#13#10' CC.KFIN_CENTROCUSTO,'
  +#13#10' CC.CODIGO,'
  +#13#10' CC.NOME'
  +#13#10'FROM FIN_CENTROSCUSTO CC'
  +#13#10'ROWS 2' ;
var
 LCDSApropriacao : TClientDataSet ;
 p : TParams ;
begin
  LCDSApropriacao := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'CC_PECUARIALEITE', ptInput ).asString := _DEF_PECUARIA_LEITE ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SELECT_DEF_CC, p ) ;
  p.Free ;

  if LCDSApropriacao.IsEmpty then
     TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SELECT_UNQ_CC ) ;

  with LCDSApropriacao do
    try
      if LCDSApropriacao.RecordCount <> 1 then
        exit ;

      AcdsApropriacao.Append;
      AcdsApropriacao.FieldByName( 'CODIGO') .asString           := FieldByName( 'CODIGO').AsString  ;
      AcdsApropriacao.FieldByName( 'NOME').asString              := FieldByName( 'NOME').AsString  ;
      AcdsApropriacao.FieldByName( 'PORCENTAGEM').asFloat        := 100 ;
      AcdsApropriacao.FieldByName( 'KFIN_CENTROCUSTO' ).asString := FieldByName( 'KFIN_CENTROCUSTO').AsString  ;
      AcdsApropriacao.Post;
    finally
      LCDSApropriacao.Free ;
    end;
end;

class function TApropriacao.ForceCC: boolean;
begin
  Result := (LoggedUser.DomainCode = '000508')
        or  (LoggedUser.DomainCode = '009991')
//        or  (LoggedUser.DomainCode = '010059') Trello #929
        or  (LoggedUser.DomainCode = '001907')
        or  (LoggedUser.DomainCode = '004957') ;
end;

class function TApropriacao.AddCentroCustoFromTo( AOrigem : string ; AOrigemKey : string ;
                  ADestino : string ; ADestinoKey : string ;
                  ACDSApropriacao : TClientDataSet ;
                  AIsNeedCC : boolean ) : boolean ;
const
  _SQL_APROPRIACAO_FROM =
         'SELECT'
  +#13#10' CC.KFIN_CENTROCUSTO,'
  +#13#10' CC.CODIGO,'
  +#13#10' CC.NOME,'
  +#13#10' AP.PORCENTAGEM'
  +#13#10'FROM FIN_APROPRIACAO AP'
  +#13#10'LEFT JOIN FIN_CENTROSCUSTO CC ON CC.KFIN_CENTROCUSTO = AP.KFIN_CENTROCUSTO'
  +#13#10'WHERE AP.TABLENAME = :TABLENAME AND AP.TABLEKEY = :TABLEKEY' ;
var
 LCDSApropriacao : TClientDataSet ;
 p : TParams ;
begin

  LCDSApropriacao := nil ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'TABLENAME', ptInput ).asString := AOrigem ;
  p.CreateParam( ftString, 'TABLEKEY',  ptInput ).asString := AOrigemKey ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( LCDSApropriacao, _SQL_APROPRIACAO_FROM, p ) ;
  p.Free ;

  if ( LCDSApropriacao.IsEmpty and AIsNeedCC ) then
    AddCentroCustoPadrao( ACDSApropriacao )
  else
    with LCDSApropriacao do
      while not eof do
        begin
          ACDSApropriacao.Append;
          ACDSApropriacao.FieldByName( 'TABLENAME'        ).asString := ADestino ;
          ACDSApropriacao.FieldByName( 'TABLEKEY'         ).asString := ADestinoKey ;
          ACDSApropriacao.FieldByName( 'CODIGO'           ).asString := FieldByName( 'CODIGO').AsString  ;
          ACDSApropriacao.FieldByName( 'NOME'             ).asString := FieldByName( 'NOME').AsString  ;
          ACDSApropriacao.FieldByName( 'PORCENTAGEM'      ).asFloat  := FieldByName( 'PORCENTAGEM').AsFloat  ;
          ACDSApropriacao.FieldByName( 'KFIN_CENTROCUSTO' ).asString := FieldByName( 'KFIN_CENTROCUSTO').AsString  ;
          ACDSApropriacao.Post;
          next ;
        end;
  LCDSApropriacao.Free ;

end;

{ TUsedPlanoContas }

procedure TUsedPlanoContas.AddPlano(KFIN_PLANOCONTA: string ; var AResult : string ) ;
const
  _SELECT_PLANO =
     'SELECT TIPO_APRD FROM FIN_PLANOCONTAS WHERE KFIN_PLANOCONTA = :KFIN_PLANOCONTA' ;
var
  CDS : TClientDataSet ;
  p : TParams ;
begin
  cds := nil ;
  p := TParams.create ;
  p.CreateParam( ftString, 'KFIN_PLANOCONTA', ptInput ).asString := KFIN_PLANOCONTA ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, _SELECT_PLANO, p );
  p.free ;
  AResult := cds.fields[0].asString ;
  if AResult <> '' then
     Add( KFIN_PLANOCONTA, AResult ) ;
  cds.Free ;
end;

class function TUsedPlanoContas.GetAPRD( KFIN_PLANOCONTA : string ) : string;
begin
    if not Assigned ( UsedPlanoContas ) then
      UsedPlanoContas := Create ;

    if not UsedPlanoContas.TryGetValue( KFIN_PLANOCONTA, Result) then
       UsedPlanoContas.AddPlano( KFIN_PLANOCONTA, Result ) ;
end;

{ SvcFinanceiroApropriacaoDefaultFactory }

function SvcFinanceiroApropriacaoDefaultFactory.AddCentroCustoFromTo(AOrigem,
  AOrigemKey, ADestino, ADestinoKey: string;
  ACDSApropriacao: TClientDataSet ;
  AIsNeedCC : boolean ): boolean;
begin
    Result := TApropriacao.AddCentroCustoFromTo( AOrigem , AOrigemKey,
                         ADestino, ADestinoKey, ACDSApropriacao, AIsNeedCC  ) ;
end;

function SvcFinanceiroApropriacaoDefaultFactory.AddCentroCustoPadrao(
  ACDSApropriacao: TClientDataSet): boolean;
begin
    Result := TApropriacao.AddCentroCustoPadrao( ACDSApropriacao ) ;
end;

function SvcFinanceiroApropriacaoDefaultFactory.ForceCC: boolean;
begin
    Result := TApropriacao.ForceCC ;
end;

function SvcFinanceiroApropriacaoDefaultFactory.NeedCC(
  KFIN_PLANOCONTA: string): boolean;
begin
            Result := TApropriacao.NeedCC( KFIN_PLANOCONTA );
end;

initialization
    SvcFinanceiroApropriacaoDefault := SvcFinanceiroApropriacaoDefaultFactory.Create ;
finalization
    SvcFinanceiroApropriacaoDefault := nil ;
end.
