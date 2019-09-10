unit DiagnosticosAnimalClass;

interface

const

  _AUTO_EVT_CIO                      =   'AUTO_EVT_CIO'                    ;
  _AUTO_EVT_COBERTURA_INSEMINACAO    =   'AUTO_EVT_COBERTURA_INSEMINACAO'  ;
  _AUTO_EVT_COBERTURA_MONTA          =   'AUTO_EVT_COBERTURA_MONTA'        ;
  _AUTO_EVT_COBERTURA_IMPLANTE       =   'AUTO_EVT_COBERTURA_IMPLANTE'     ;

  _AUTO_EVT_CHECVET_LIB_REPRODUCAO   =   'AUTO_EVT_CHECVET_LIB_REPRODUCAO' ;
  _AUTO_EVT_CHECVET_DIAGGESTACAO_P   =   'AUTO_EVT_CHECVET_DIAGGESTACAO_P'  ;
  _AUTO_EVT_CHECVET_DIAGGESTACAO_N   =   'AUTO_EVT_CHECVET_DIAGGESTACAO_N'  ;
  _AUTO_EVT_CHECVET_REEXAMINAR       =   'AUTO_EVT_CHECVET_REEXAMINAR'     ;
  _AUTO_EVT_CHECVET_RECEMPARIDA      =   'AUTO_EVT_CHECVET_RECEMPARIDA'    ;

  _AUTO_EVT_PARTO_MATRIZ             =   'AUTO_EVT_PARTO_MATRIZ'           ;
  _AUTO_EVT_PARTO_CRIA               =   'AUTO_EVT_PARTO_CRIA'             ;

  _AUTO_EVT_COLETA_EMBRIAO           =   'AUTO_EVT_COLETA_EMBRIAO'         ;

  _AUTO_EVT_SECAGEM                  =   'AUTO_EVT_SECAGEM'                ;
  _AUTO_EVT_INTENCAO_DESCARTE        =   'AUTO_EVT_INTENCAO_DESCARTE'      ;


type
   TDiagnosticosAnimal = class
   private
      class function IniciarProtocolos ( AKAnimal, AKZOO_DIAGNOSTICO, AKZOO_DIAGNOSTICO_ANIMAL : string ; AData : TDateTime ; ALote : string ) : boolean ;
      class function FinalizarProtocolos ( AKAnimal, AKZOO_DIAGNOSTICO, AKZOO_DIAGNOSTICO_ANIMAL : string ; AData : TDateTime ; ALote : string ) : boolean ;
   public
      class function AddDiagnostico ( AKAnimal : String ; AKDiagnostico: string ; AQuarto : Integer ; AData : TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ; AIniciarProtocolos : boolean = True ; AFinalizarProtocolos : boolean = True  ) : string ;
   end;

   TEventosAnimal = class
   private
      class function GetDiagnoticoEvento  ( ATipoEvento : integer ; AIDEvento : string  ): string;
   public
      class procedure AddCio           ( AKAnimal: String ; AData : TDateTime );  // _ST_AUTO_EVT_CIO
      class procedure AddInseminacao   ( AKAnimal: String ; AData : TDateTime );  // _ST_AUTO_EVT_COBERTURA
      class procedure AddMonta         ( AKAnimal: String ; AData : TDateTime );  // _ST_AUTO_EVT_COBERTURA
      class procedure AddImplante      ( AKAnimal: String ; AData : TDateTime );  // _ST_AUTO_EVT_COBERTURA
      class procedure AddLiberacaoReproducao ( AKAnimal: String ; AData : TDateTime ); //_ST_AUTO_EVT_VETERINARIO
      class procedure AddDiagnosticoGestacaoPositivo ( AKAnimal: String ; AData : TDateTime ); //_ST_AUTO_EVT_VETERINARIO
      class procedure AddDiagnosticoGestacaoNegativo ( AKAnimal: String ; AData : TDateTime ); //_ST_AUTO_EVT_VETERINARIO
      class procedure AddReexaminar ( AKAnimal: String ; AData : TDateTime );          //_ST_AUTO_EVT_VETERINARIO
      class procedure AddRecemParida ( AKAnimal: String ; AData : TDateTime );         //_ST_AUTO_EVT_VETERINARIO
      class procedure AddPartoMatriz   ( AKAnimal: String ; AData : TDateTime );       //_ST_AUTO_EVT_PARTO
      class procedure AddPartoCria     ( AKAnimal: String ; AData : TDateTime );       //_ST_AUTO_EVT_PARTO
      class procedure AddColeta        ( AKAnimal: String ; AData : TDateTime );       //_ST_AUTO_EVT_COLETA
      class procedure AddSecagem       ( AKAnimal: String ; AData : TDateTime );       //_ST_AUTO_EVT_SECAGEM
      class procedure AddIntencaoDescarte    ( AKAnimal: String ; AData : TDateTime ); //_ST_AUTO_EVT_INTENCAO_DESCARTE
   end;

const
  sql_get_protocolos_iniciar =
            'P.KZOO_PROTOCOLO, P.CODIGO, P.NOME'
     +#13#10'FROM ZOO_DIAGNOSTICO_PROTOCOLOS DP'
     +#13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = DP.KZOO_PROTOCOLO'
     +#13#10'WHERE  DP.KZOO_DIAGNOSTICO = :KZOO_DIAGNOSTICO AND P.ATIVO = ''T'' AND INICIAR = ''T''' ;

  sql_get_protocolos_finalizar =
            'P.KZOO_PROTOCOLO, P.CODIGO, P.NOME'
     +#13#10'FROM ZOO_DIAGNOSTICO_PROTOCOLOS DP'
     +#13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = DP.KZOO_PROTOCOLO'
     +#13#10'WHERE  DP.KZOO_DIAGNOSTICO = :KZOO_DIAGNOSTICO AND P.ATIVO = ''T'' AND INICIAR = ''F''' ;


implementation

uses System.SysUtils, Exceptions, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, GuidSuppl, Data.SQLTimSt,
     ProtocolosAnimalClass,
     CLAg5Types,
     Tc.RTL.NotificationService,
     Tc.DBRTL.AbstractDB,
     CL.Ag5.NSMsgs ;



class function TDiagnosticosAnimal.AddDiagnostico ( AKAnimal : String ; AKDiagnostico: string ; AQuarto : integer ; AData : TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ; AIniciarProtocolos : boolean = True ; AFinalizarProtocolos : boolean = True  ) : string ;
const
    sql_insert_diganostico =
    'INSERT INTO ZOO_ANIMAL_DIAGNOSTICOS'
    + #13#10'( KZOO_ANIMAL_DIAGNOSTICO, KZOO_ANIMAL_FEMEA, KZOO_DIAGNOSTICO, CODIGO, NOME, QUARTO, DATA, LOTE, STATUS )'
    + #13#10'VALUES ( :KZOO_ANIMAL_DIAGNOSTICO, :KZOO_ANIMAL_FEMEA, :KZOO_DIAGNOSTICO, :CODIGO, :NOME, :QUARTO, :DATA, :LOTE, 1 )' ;
var
  p  : TParams ;
  cds : TClientDataSet ;
  Lote : string ;
begin
  try
      cds := nil ;
      p := TParams.Create ;
    try
      if ( ALote = '' ) and ( AGetLoteIfEmpty )then
        begin
          p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
          TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, 'LOTE FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA', p );
          Lote := cds.fieldByName ( 'LOTE' ).asString;
          FreeAndNil ( cds ) ;
        end;


      p.Clear ;
      p.CreateParam ( ftString,   'KZOO_DIAGNOSTICO',        ptInput ).asString := AKDiagnostico ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, 'CODIGO, NOME FROM ZOO_DIAGNOSTICOS WHERE KZOO_DIAGNOSTICO = :KZOO_DIAGNOSTICO', p );

      Result := GuidSuppl.GuidStr20 ;
      p.Clear ;
      p.CreateParam ( ftString,   'KZOO_ANIMAL_DIAGNOSTICO', ptInput ).asString := Result ;
      p.CreateParam ( ftString,   'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
      p.CreateParam ( ftString,   'KZOO_DIAGNOSTICO',        ptInput ).asString := AKDiagnostico ;
      p.CreateParam ( ftString,   'CODIGO',                  ptInput ).asString := cds.fieldByName ( 'CODIGO' ).asString;
      p.CreateParam ( ftString,   'NOME',                    ptInput ).asString := cds.fieldByName ( 'NOME' ).asString;

      if AQuarto > 0 then
        p.CreateParam ( ftInteger,  'QUARTO',                  ptInput ).asInteger := AQuarto
      else
        p.CreateParam ( ftInteger,  'QUARTO',                  ptInput ).Bound := False ;

      p.CreateParam ( ftDateTime, 'DATA',                    ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData ) ;

      if ALote = '' then
         p.CreateParam ( ftString, 'LOTE',                    ptInput ).Bound := False
      else
         p.CreateParam ( ftString, 'LOTE',                    ptInput ).asString := Lote ;

      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute ( sql_insert_diganostico, p ) ;

      if AIniciarProtocolos then
         IniciarProtocolos ( AKAnimal, AKDiagnostico, Result, AData, Lote ) ;

      if AFinalizarProtocolos then
         FinalizarProtocolos ( AKAnimal, AKDiagnostico, Result, AData, Lote ) ;
    finally
      p.Free ;
      cds.Free;
    end ;

  except on E : Exception do
       RaiseException( E, UnitName, ClassName,  'AddDiagnostico' )
  End;
end ;


class function TDiagnosticosAnimal.IniciarProtocolos ( AKAnimal, AKZOO_DIAGNOSTICO, AKZOO_DIAGNOSTICO_ANIMAL : string ; AData : TDateTime ; ALote : string  ) : boolean ;
var
   p : TParams ;
   cdsTmpProtocolos : TClientDataSet ;
begin

   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_DIAGNOSTICO', ptInput ).asString := AKZOO_DIAGNOSTICO ;

   try
     cdsTmpProtocolos := nil ;
     TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cdsTmpProtocolos, sql_get_protocolos_iniciar, p  ) ;

     Result := not cdsTmpProtocolos.IsEmpty ;

     with cdsTmpProtocolos do
         while not eof do
            begin
              TProtocolosAnimal.AddProtocolo ( AKAnimal, fieldByName ( 'KZOO_PROTOCOLO' ).asString, AData, AKZOO_DIAGNOSTICO_ANIMAL, '', '', 0, True, ALote, False, False ) ;
              Next ;
            end ;
   finally
     p.Free ;
     if Assigned ( cdsTmpProtocolos )  then
        cdsTmpProtocolos.Free ;
   end;
end;


class function TDiagnosticosAnimal.FinalizarProtocolos(AKAnimal,
  AKZOO_DIAGNOSTICO, AKZOO_DIAGNOSTICO_ANIMAL: string; AData: TDateTime ; ALote : string ) : boolean ;
var
   p : TParams ;
   cdsTmpProtocolos : TClientDataSet ;
begin
   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_DIAGNOSTICO', ptInput ).asString := AKZOO_DIAGNOSTICO ;

   try
     cdsTmpProtocolos := nil ;
     TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cdsTmpProtocolos, sql_get_protocolos_finalizar, p  ) ;

     Result := not cdsTmpProtocolos.IsEmpty ;

     with cdsTmpProtocolos do
         while not eof do
            begin
              TProtocolosAnimal.InterrompeProtocolo ( AKAnimal, fieldByName ( 'KZOO_PROTOCOLO' ).asString, AData, ALote, False  ) ;
              Next ;
            end ;
   finally
     p.Free ;
     if Assigned ( cdsTmpProtocolos )  then
        cdsTmpProtocolos.Free ;
   end;
end;

{ TEventosAnimal }


class function TEventosAnimal.GetDiagnoticoEvento ( ATipoEvento : integer ; AIDEvento : string  ): string;
var
  cds : TClientDataSet ;
  p : TParams ;
const
  _GET_EVENT_ID  = 'KZOO_DIAGNOSTICO FROM ZOO_DIAGNOSTICOS'
      +#13#10'WHERE TIPOEVENTO = :TIPOEVENTO AND SYS$EVENTOID = :EVENTOID' ;

  _GET_AUTOMATED  = '1 ISAUTOMATED FROM ZOO_DIAGNOSTICO_PROTOCOLOS'
      +#13#10'WHERE KZOO_DIAGNOSTICO = :KZOO_DIAGNOSTICO'
      +#13#10'ROWS 1' ;

begin

  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam( ftInteger, 'TIPOEVENTO', ptInput ).asInteger := ATipoEvento ;
    p.CreateParam( ftInteger, 'EVENTOID', ptInput ).asString    := AIDEvento ;
    TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _GET_EVENT_ID, p );
    if cds.IsEmpty then
       raise Fail.Create('Não foi possível encontrar o evento ' + AIDEvento );

    Result := cds.FieldByName('KZOO_DIAGNOSTICO').AsString ;

    FreeAndNil ( cds ) ;

    p.Clear ;
    p.CreateParam( ftInteger, 'KZOO_DIAGNOSTICO', ptInput ).asString := Result ;
    TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _GET_AUTOMATED, p );
    if ( cds.FieldByName('ISAUTOMATED').asInteger = 0 ) then
       Result := '' ;

  finally
    p.Free ;
    cds.Free ;
  end;

end;


{_ST_AUTO_EVT_CIO}
class procedure TEventosAnimal.AddCio( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_CIO, _AUTO_EVT_CIO ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
end;


{_ST_AUTO_EVT_COBERTURA}
class procedure TEventosAnimal.AddInseminacao( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_COBERTURA, _AUTO_EVT_COBERTURA_INSEMINACAO  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
end;

class procedure TEventosAnimal.AddMonta( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_COBERTURA, _AUTO_EVT_COBERTURA_MONTA ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

class procedure TEventosAnimal.AddImplante( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_COBERTURA, _AUTO_EVT_COBERTURA_IMPLANTE ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

{_ST_AUTO_EVT_VETERINARIO}
class procedure TEventosAnimal.AddLiberacaoReproducao(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_VETERINARIO, _AUTO_EVT_CHECVET_LIB_REPRODUCAO  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

{_ST_AUTO_EVT_PARTO}
class procedure TEventosAnimal.AddDiagnosticoGestacaoPositivo(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_VETERINARIO, _AUTO_EVT_CHECVET_DIAGGESTACAO_P  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

class procedure TEventosAnimal.AddDiagnosticoGestacaoNegativo(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_VETERINARIO, _AUTO_EVT_CHECVET_DIAGGESTACAO_N  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

class procedure TEventosAnimal.AddReexaminar(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_VETERINARIO, _AUTO_EVT_CHECVET_REEXAMINAR  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

class procedure TEventosAnimal.AddRecemParida(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_VETERINARIO, _AUTO_EVT_CHECVET_RECEMPARIDA  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;


class procedure TEventosAnimal.AddPartoMatriz( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_PARTO, _AUTO_EVT_PARTO_MATRIZ ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;


class procedure TEventosAnimal.AddPartoCria( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_PARTO, _AUTO_EVT_PARTO_CRIA  ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;

{_ST_AUTO_EVT_COLETA}
class procedure TEventosAnimal.AddColeta(AKAnimal: String; AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_COLETA, _AUTO_EVT_COLETA_EMBRIAO ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end ;


{_ST_AUTO_EVT_SECAGEM}
class procedure TEventosAnimal.AddSecagem( AKAnimal: String ; AData : TDateTime );
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_SECAGEM, _AUTO_EVT_SECAGEM ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;


{_ST_AUTO_EVT_INTENCAO_DESCARTE}
class procedure TEventosAnimal.AddIntencaoDescarte(AKAnimal: String;
  AData: TDateTime);
var
  KeyEvento : String ;
begin
  KeyEvento := GetDiagnoticoEvento ( _ST_AUTO_EVT_INTENCAO_DESCARTE, _AUTO_EVT_INTENCAO_DESCARTE ) ;
  if KeyEvento = '' then
     Exit ;
  TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, KeyEvento, 0, AData, '', True ) ;
  TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch ( nil ) ;
end;


end.
