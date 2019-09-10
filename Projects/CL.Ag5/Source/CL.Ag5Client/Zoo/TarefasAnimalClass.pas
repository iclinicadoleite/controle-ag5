unit TarefasAnimalClass;

interface

type
   TTarefasAnimal = class
   public
      class procedure AddTarefa (
       const AKDiagnosticoAnimal
           , AKProtocoloAnimal
           , AKAnimal
           , AKTarefa : string ;
       const AExame : boolean ;
       const ADia : Integer ;
       const AData : TDateTime ;
       const VezAoDia : integer ;
       const ACodigo
           , ANome : string ;
       const ADescarteLeite
           , ADescarteCarne  : integer ;
       const ACAD_FUNCIONARIO
           , ANomeFuncionario
           , Observacao
           , ALote : string ;
       const AGetLoteIfEmpty : boolean
       ) ;
   end;

implementation

uses System.SysUtils, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, GuidSuppl, Data.SQLTimSt, Math, Exceptions, CLAg5Types,
     Tc.DBRTL.AbstractDB ;


class procedure TTarefasAnimal.AddTarefa (
   const AKDiagnosticoAnimal
       , AKProtocoloAnimal
       , AKAnimal
       , AKTarefa : string ;
   const AExame : boolean ;
   const ADia : Integer ;
   const AData : TDateTime ;
   const VezAoDia : integer ;
   const ACodigo
       , ANome : string ;
   const ADescarteLeite
       , ADescarteCarne  : integer ;
   const ACAD_FUNCIONARIO
       , ANomeFuncionario
       , Observacao
       , ALote : string ;
   const AGetLoteIfEmpty : boolean
  ) ;
const
  sql_insert_tarefas =
           'INSERT INTO ZOO_ANIMAL_TAREFAS'
    +#13#10'('
    +#13#10'  KZOO_ANIMAL_TAREFA'           //  :KZOO_ANIMAL_TAREFA
    +#13#10', KZOO_ANIMAL'                  //  :KZOO_ANIMAL
    +#13#10', KZOO_ANIMAL_DIAGNOSTICO'      //  :KZOO_ANIMAL_DIAGNOSTICO
    +#13#10', KZOO_ANIMAL_PROTOCOLO'        //  :KZOO_ANIMAL_PROTOCOLO
    +#13#10', KZOO_TAREFA'                  //  :KZOO_TAREFA
    +#13#10', CODIGO'                       //  :CODIGO
    +#13#10', NOME'                         //  :NOME
    +#13#10', DATAPREVISTA'                 //  :DATAPREVISTA
    +#13#10', VEZAODIA'                     //  :VEZAODIA
    +#13#10', STATUS'                       //  :STATUS
    +#13#10', DATASTATUS'                   //  :DATASTATUS
    +#13#10', DESCARTELEITE'                //  :DESCARTELEITE
    +#13#10', DESCARTECARNE'                //  :DESCARTECARNE
    +#13#10', KCAD_FUNCIONARIO'             //  :KCAD_FUNCIONARIO
    +#13#10', NOMEFUNCIONARIO'              //  :NOMEFUNCIONARIO
    +#13#10', EXAME'                        //  :EXAME
    +#13#10', OBS'                          //  :OBS
    +#13#10', LOTE'                         //  :LOTE
    +#13#10') VALUES ('
    +#13#10'  :KZOO_ANIMAL_TAREFA'
    +#13#10', :KZOO_ANIMAL'
    +#13#10', :KZOO_ANIMAL_DIAGNOSTICO'
    +#13#10', :KZOO_ANIMAL_PROTOCOLO'
    +#13#10', :KZOO_TAREFA'
    +#13#10', :CODIGO'
    +#13#10', :NOME'
    +#13#10', :DATAPREVISTA'
    +#13#10', :VEZAODIA'
    +#13#10', :STATUS'
    +#13#10', :DATASTATUS'
    +#13#10', :DESCARTELEITE'
    +#13#10', :DESCARTECARNE'
    +#13#10', :KCAD_FUNCIONARIO'
    +#13#10', :NOMEFUNCIONARIO'
    +#13#10', :EXAME'
    +#13#10', :OBS'
    +#13#10', :LOTE'
    +#13#10')' ;
var
  p : TParams ;
  CDS : TClientDataSet ;
  LLote : string ;
begin

  try
    cds := nil ;
    p := TParams.Create ;

    LLote := ALote ;
    if ( LLote = '' ) and ( AGetLoteIfEmpty )then
      begin
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
        TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').populateClientDataSet( cds, 'LOTE FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA', p );
        LLote := cds.fieldByName ( 'LOTE' ).asString;
        FreeAndNil ( cds ) ;
      end;

     p.Clear ;

      p.CreateParam ( ftString, 'KZOO_ANIMAL_TAREFA',    ptInput ).asString          := GuidSuppl.GuidStr20 ;
      p.CreateParam ( ftString, 'KZOO_ANIMAL',           ptInput ).asString          := AKAnimal ;

      if AKDiagnosticoAnimal = ''  then
         p.CreateParam ( ftString, 'KZOO_ANIMAL_DIAGNOSTICO', ptInput ).bound := False
      else
         p.CreateParam ( ftString, 'KZOO_ANIMAL_DIAGNOSTICO', ptInput ).asString       := AKDiagnosticoAnimal   ;

      if AKProtocoloAnimal = ''  then
         p.CreateParam ( ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput ).bound := False
      else
         p.CreateParam ( ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput ).asString       := AKProtocoloAnimal   ;

      p.CreateParam ( ftString,    'KZOO_TAREFA',           ptInput ).asString       := AKTarefa ;
      p.CreateParam ( ftString,    'CODIGO',                ptInput ).asString       := ACodigo  ;
      p.CreateParam ( ftString,    'NOME',                  ptInput ).asString       := ANOME    ;
      p.CreateParam ( ftTimeStamp, 'DATAPREVISTA',          ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData  ) ;
      p.CreateParam ( ftInteger,   'VEZAODIA',              ptInput ).asInteger      := Max ( VezAoDia, 1 ) ; // pelo menos 1 vez ao dia

      if ( ADia < 1 ) and ( AData <= Date ) then
        begin
          p.CreateParam ( ftInteger,   'STATUS',             ptInput ).asInteger        := _ST_STATUS_TAREFA_EXECUTADA ; // Executada
          p.CreateParam ( ftTimeStamp, 'DATASTATUS',         ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData  ) ; // Executada
        end
      else
        begin
          p.CreateParam ( ftInteger,   'STATUS',             ptInput ).asInteger    := _ST_STATUS_TAREFA_PENDENTE ; // Não Executada
          p.CreateParam ( ftTimeStamp, 'DATASTATUS',         ptInput ).bound        := False ; // Executada
        end ;

      p.CreateParam ( ftString, 'DESCARTELEITE',         ptInput ).asInteger      := ADescarteLeite  ;
      p.CreateParam ( ftString, 'DESCARTECARNE',         ptInput ).asInteger      := ADescarteCarne  ;

      if ACAD_FUNCIONARIO = '' then
        begin
          p.CreateParam ( ftString, 'KCAD_FUNCIONARIO',      ptInput ).bound := False ;
          p.CreateParam ( ftString, 'NOMEFUNCIONARIO',       ptInput ).bound := False ;
        end
      else
        begin
          p.CreateParam ( ftString, 'KCAD_FUNCIONARIO',      ptInput ).asString      :=  ACAD_FUNCIONARIO ;
          p.CreateParam ( ftString, 'NOMEFUNCIONARIO',       ptInput ).asString      :=  ANomeFuncionario ;
        end;


      if AExame then
         p.CreateParam ( ftString, 'EXAME',       ptInput ).asString      :=  'T'
      else
         p.CreateParam ( ftString, 'EXAME',       ptInput ).asString      :=  'F' ;

      if Observacao = '' then
          p.CreateParam ( ftString, 'OBS',       ptInput ).Bound := False
      else
          p.CreateParam ( ftString, 'OBS',       ptInput ).asString := Observacao ;

      if LLote = '' then
         p.CreateParam ( ftString, 'LOTE',                    ptInput ).Bound := False
      else
         p.CreateParam ( ftString, 'LOTE',                    ptInput ).asString := LLote ;

      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').Execute ( sql_insert_tarefas, p ) ;
  except on E : Exception do
       RaiseException( E, UnitName, ClassName, 'AddTarefa' );
  end;
end ;

end.
