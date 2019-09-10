unit ResultadoExamesClass;

interface


type

   TResultadosExameAnimal = class
   private
      class function IniciarProtocolos ( AKAnimal : string ; AResultado : integer ; AKZOO_TAREFA_RESULTADO, AKZOO_TAREFA_ANIMAL : string ; AData : TDateTime ) : boolean ;
      class function FinalizarProtocolos ( AKAnimal : string ; AKZOO_TAREFA_RESULTADO : string ; AData : TDateTime ) : boolean ;
   public
      class function SetResultado ( AKAnimal : String ; AResultado : integer ; AKResultado: string ; AKZOO_TAREFA_ANIMAL : string ; AData : TDateTime ; AIniciarProtocolos : boolean = True ; AFinalizarProtocolos : boolean = True  ) : string ;
   end;


const
  sql_get_protocolos_iniciar =
            'P.KZOO_PROTOCOLO, P.CODIGO, P.NOME'
     +#13#10'FROM ZOO_RESULTADO_PROTOCOLOS RP'
     +#13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = RP.KZOO_PROTOCOLO'
     +#13#10'WHERE  RP.KZOO_TAREFA_RESULTADO = :KZOO_TAREFA_RESULTADO AND P.ATIVO = ''T'' AND INICIAR = ''T''' ;

  sql_get_protocolos_finalizar =
            'P.KZOO_PROTOCOLO, P.CODIGO, P.NOME'
     +#13#10'FROM ZOO_RESULTADO_PROTOCOLOS RP'
     +#13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = RP.KZOO_PROTOCOLO'
     +#13#10'WHERE  RP.KZOO_TAREFA_RESULTADO = :KZOO_TAREFA_RESULTADO AND P.ATIVO = ''T'' AND INICIAR = ''F''' ;


implementation

uses System.SysUtils, Exceptions, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, GuidSuppl, Data.SQLTimSt,
     ProtocolosAnimalClass,
     CLAg5Types,
     Tc.RTL.NotificationService,
     Tc.DBRTL.AbstractDB ;



class function TResultadosExameAnimal.SetResultado ( AKAnimal : String ; AResultado : integer ; AKResultado: string ; AKZOO_TAREFA_ANIMAL : string ; AData : TDateTime ; AIniciarProtocolos : boolean = True ; AFinalizarProtocolos : boolean = True  ) : string ;
begin
  try
      if AIniciarProtocolos then
         IniciarProtocolos ( AKAnimal, AResultado, AKResultado, AKZOO_TAREFA_ANIMAL, AData ) ;

      if AFinalizarProtocolos then
         FinalizarProtocolos ( AKAnimal, AKResultado, AData ) ;

  except on E : Exception do
       RaiseException( E, UnitName, ClassName,  'SetResultado' )
  End;
end ;


class function TResultadosExameAnimal.IniciarProtocolos ( AKAnimal : string ;  AResultado : integer ; AKZOO_TAREFA_RESULTADO, AKZOO_TAREFA_ANIMAL : string ; AData : TDateTime ) : boolean ;
var
   p : TParams ;
   cdsTmpProtocolos : TClientDataSet ;
begin

   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_TAREFA_RESULTADO', ptInput ).asString := AKZOO_TAREFA_RESULTADO ;

   try
     cdsTmpProtocolos := nil ;
     TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cdsTmpProtocolos, sql_get_protocolos_iniciar, p  ) ;

     Result := not cdsTmpProtocolos.IsEmpty ;

     with cdsTmpProtocolos do
         while not eof do
            begin
              TProtocolosAnimal.AddProtocolo ( AKAnimal, fieldByName ( 'KZOO_PROTOCOLO' ).asString, AData, '', AKZOO_TAREFA_ANIMAL, AKZOO_TAREFA_RESULTADO, AResultado, True, '', True, False ) ;
              Next ;
            end ;
   finally
     p.Free ;
     if Assigned ( cdsTmpProtocolos )  then
        cdsTmpProtocolos.Free ;
   end;
end;

class function TResultadosExameAnimal.FinalizarProtocolos(AKAnimal : string ;  AKZOO_TAREFA_RESULTADO : string ; AData : TDateTime ) : boolean ;
var
   p : TParams ;
   cdsTmpProtocolos : TClientDataSet ;
begin
   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_TAREFA_RESULTADO', ptInput ).asString := AKZOO_TAREFA_RESULTADO ;

   try
     cdsTmpProtocolos := nil ;
     TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cdsTmpProtocolos, sql_get_protocolos_finalizar, p  ) ;

     Result := not cdsTmpProtocolos.IsEmpty ;

     with cdsTmpProtocolos do
         while not eof do
            begin
              TProtocolosAnimal.InterrompeProtocolo ( AKAnimal, fieldByName ( 'KZOO_PROTOCOLO' ).asString, AData, '', False  ) ;
              Next ;
            end ;
   finally
     p.Free ;
     if Assigned ( cdsTmpProtocolos )  then
        cdsTmpProtocolos.Free ;
   end;
end;

end.
