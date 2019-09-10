unit ProtocolosAnimalClass;

interface

type
   TProtocolosAnimal = class
   private
      class procedure AddTarefasFromProtocolo ( AKAnimal : String ; AKProtocolo : string ; AKProtocoloAnimal : string ;AData : TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ) ;
   public
      class function AddProtocolo ( AKAnimal : String ; AKProtocolo : string ; AData : TDateTime ; AKDiagnosticoAnimal : string ; AKTarefaAnimal : string ; AKResultadoTarefa : string ; AResultado : Integer ; InsertTarefas : boolean ; ALote : string ; AGetLoteIfEmpty : boolean ; ANotify : boolean ) : string ;
      class function InterrompeProtocolo ( AKAnimal : String ; AKProtocolo : string ; AData : TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ) : string ;
   end;


implementation

uses System.SysUtils, ClAg5Types, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, GuidSuppl, Data.SQLTimSt, Math,
     TarefasAnimalClass, Exceptions,
     Tc.RTL.NotificationService,
     Tc.DBRTL.AbstractDB,
     Tc.VCL.Application,
     CL.Ag5.NSMsgs ;

class function TProtocolosAnimal.AddProtocolo ( AKAnimal : String ; AKProtocolo : string ; AData : TDateTime ; AKDiagnosticoAnimal : string ; AKTarefaAnimal : string ; AKResultadoTarefa : string ; AResultado : Integer ; InsertTarefas : Boolean ; ALote : string ; AGetLoteIfEmpty : boolean ;ANotify : boolean ) : string ;
const
  sql_get_protocolo =
          'CODIGO, NOME FROM ZOO_PROTOCOLOS'
   +#13#10'WHERE KZOO_PROTOCOLO = :KZOO_PROTOCOLO' ;

  sql_insert_protocolo =
  'INSERT INTO ZOO_ANIMAL_PROTOCOLOS'
  + #13#10'( KZOO_ANIMAL_PROTOCOLO, KZOO_ANIMAL_FEMEA, KZOO_PROTOCOLO, KZOO_ANIMAL_DIAGNOSTICO, KZOO_ANIMAL_TAREFA, KZOO_TAREFA_RESULTADO, RESULTADO, CODIGO, NOME, DATA, STATUS, LOTE )'
  + #13#10'VALUES ( :KZOO_ANIMAL_PROTOCOLO, :KZOO_ANIMAL_FEMEA, :KZOO_PROTOCOLO, :KZOO_ANIMAL_DIAGNOSTICO, :KZOO_ANIMAL_TAREFA, :KZOO_TAREFA_RESULTADO, :RESULTADO, :CODIGO, :NOME, :DATA, :STATUS, :LOTE )' ;

  sql_check_finalizar_protocolo =
   'EXECUTE PROCEDURE ZOO_ISFINISHED_PROTOCOLO( %s )' ;
var
  tmpProtocolo : TClientDataSet ;
  p : TParams ;
  CDS : TClientDataSet ;
begin

  try
    tmpProtocolo := nil ;

    cds := nil ;
    p := TParams.Create ;

    if ( ALote = '' ) and ( AGetLoteIfEmpty )then
      begin
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
        TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, 'LOTE FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA', p );
        ALote := cds.fieldByName ( 'LOTE' ).asString;
        FreeAndNil ( cds ) ;
      end;

    p.Clear ;
    p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := AKProtocolo ;

    try
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet ( tmpProtocolo, sql_get_protocolo, p )
    finally
      p.free ;
    end;

    with tmpProtocolo do
     try

        Result := GuidSuppl.GuidStr20 ;
        p := TParams.Create ;
        p.CreateParam ( ftString,   'KZOO_ANIMAL_PROTOCOLO',   ptInput ).asString := Result ;
        p.CreateParam ( ftString,   'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
        p.CreateParam ( ftString,   'KZOO_PROTOCOLO',          ptInput ).asString := AKProtocolo ;
        if AKDiagnosticoAnimal = '' then
          p.CreateParam ( ftString,   'KZOO_ANIMAL_DIAGNOSTICO', ptInput ).Bound := False
        else
          p.CreateParam ( ftString,   'KZOO_ANIMAL_DIAGNOSTICO', ptInput ).asString       := AKDiagnosticoAnimal ;

        if AKTarefaAnimal = '' then
          begin
            p.CreateParam ( ftString,   'KZOO_ANIMAL_TAREFA',    ptInput ).Bound := False ;
            p.CreateParam ( ftString,   'KZOO_TAREFA_RESULTADO', ptInput ).Bound := False ;
            p.CreateParam ( ftInteger,  'RESULTADO',             ptInput ).Bound := False ;
          end
        else
          begin
            p.CreateParam ( ftString,   'KZOO_ANIMAL_TAREFA',    ptInput ).asString  := AKTarefaAnimal ;
            p.CreateParam ( ftString,   'KZOO_TAREFA_RESULTADO', ptInput ).asString  := AKResultadoTarefa ;
            p.CreateParam ( ftInteger,  'RESULTADO',             ptInput ).asInteger := AResultado ;
          end ;

        p.CreateParam   ( ftString,   'CODIGO',                  ptInput ).asString       := fieldByName ( 'CODIGO' ).asString;
        p.CreateParam   ( ftString,   'NOME',                    ptInput ).asString       := fieldByName ( 'NOME' ).asString;
        p.CreateParam   ( ftDateTime, 'DATA',                    ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData ) ; //fieldByName ( 'DATA' ).asString;
        p.CreateParam   ( ftInteger,  'STATUS',                  ptInput ).asInteger      := _ST_STATUS_PROTOCOLO_ABERTO ;
        if ALote = '' then
           p.CreateParam ( ftString, 'LOTE',                     ptInput ).Bound := False
        else
           p.CreateParam ( ftString, 'LOTE',                     ptInput ).asString := ALote ;

        TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').Execute ( sql_insert_protocolo, p ) ;

        if InsertTarefas then
          begin
           AddTarefasFromProtocolo ( AKAnimal, AKProtocolo, p.ParamByName ( 'KZOO_ANIMAL_PROTOCOLO' ).asString,  AData, ALote, False ) ;
           TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').ExecuteDirect ( Format ( sql_check_finalizar_protocolo,
              [ QuotedStr ( p.ParamByName ( 'KZOO_ANIMAL_PROTOCOLO' ).asString ) ] ) ) ;
          end;

        if ANotify then
           TCLAg5NSMsgEVT_Sanidade.CreateAndDispatch( nil );
     finally
       p.free ;
       tmpProtocolo.Free ;
     end;
  except on E : Exception do
       RaiseException( E, UnitName, ClassName,  'AddProtocolo' )
  end;
end ;

class procedure TProtocolosAnimal.AddTarefasFromProtocolo ( AKAnimal : String ; AKProtocolo : string ; AKProtocoloAnimal : string ;AData : TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ) ;
const
  sql_get_tarefas =
         'TP.KZOO_TAREFA, TP.EXAME, TP.DIA, TP.VEZES, TP.REPLICAR, TP.INTERVALO, TP.OBS, T.CODIGO, T.NOME, T.DESCARTELEITE, T.DESCARTECARNE, T.KCAD_FUNCIONARIO, T.NOMEFUNCIONARIO'
  +#13#10'FROM ZOO_PROTOCOLO_TAREFAS TP'
  +#13#10'LEFT JOIN ZOO_TAREFAS T ON T.KZOO_TAREFA = TP.KZOO_TAREFA'
  +#13#10'WHERE TP.KZOO_PROTOCOLO = :KZOO_PROTOCOLO AND T.KCAD_FAZENDA = :KCAD_FAZENDA AND T.ATIVO = ''T''' ;

var
  cds, tmpTarefas : TClientDataSet ;
  p : TParams ;
  IterateReplicar, IterateVezes : integer ;
  DiaExecucao, VezesAoDia, Replicas, IntervaloDias : integer ;
begin

  try
    tmpTarefas := nil  ;

    cds := nil ;
    p := TParams.Create ;

    if ( ALote = '' ) and ( AGetLoteIfEmpty )then
      begin
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
        TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, 'LOTE FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA', p );
        ALote := cds.fieldByName ( 'LOTE' ).asString;
        FreeAndNil ( cds ) ;
      end;

     p.Clear ;
     p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := AKProtocolo ;
     p.CreateParam ( ftString, 'KCAD_FAZENDA',   ptInput ).asString :=
         Tc.VCL.Application.TTcCustomApplication.Instance.LoggedUser.DomainID ;
       // LoggedUser.DomainID ;
     try
          TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet ( tmpTarefas, sql_get_tarefas, p ) ;
     finally
       p.free ;
     end;

     with tmpTarefas do
       begin
          First ;
          while not eof do
            begin
              //DiaExecucao   := Max ( fieldByName('DIA').asInteger,           1 ) ; // no 1o dia ou posterior
              DiaExecucao   := Max ( fieldByName('DIA').asInteger,           0 ) ; // considerar dia 0
              VezesAoDia    := Max ( fieldByName('VEZES').asInteger,         1 ) ; // pelo menos 1 vez ao dia
              Replicas      := Max ( fieldByName('REPLICAR').asInteger + 1,  1 ) ; // pelo menos 1 tarefa ( = 0, inclui 1x, = 1 inclui 2x... )
              IntervaloDias := Max ( fieldByName('INTERVALO').asInteger,     1 ) ; // menor intervalo 1 dia

              for IterateReplicar := 1 to Replicas do
                  begin
                    for IterateVezes := 1 To VezesAoDia do
                      begin
                        TTarefasAnimal.AddTarefa (
                                     '' // AKDiagnosticoAnimal
                                   , AKProtocoloAnimal
                                   , AKAnimal
                                   , fieldByName ( 'KZOO_TAREFA' ).asString
                                   , fieldByName ( 'EXAME' ).asBoolean
                                   , DiaExecucao
//                                   , AData + DiaExecucao - 1 // as tarefas do 1o dia no 1o dia..
                                   , AData + DiaExecucao // as tarefas do 0
                                   , IterateVezes
                                   , fieldByName ( 'CODIGO' ).asString
                                   , fieldByName ( 'NOME' ).asString
                                   , fieldByName ( 'DESCARTELEITE' ).asInteger
                                   , fieldByName ( 'DESCARTECARNE' ).asInteger
                                   , fieldByName ( 'KCAD_FUNCIONARIO' ).AsString
                                   , fieldByName ( 'NOMEFUNCIONARIO' ).AsString
                                   , fieldByName ( 'OBS' ).AsString
                                   , ALote
                                   , AGetLoteIfEmpty
                        ) ;
                      end;
                      Inc ( DiaExecucao, IntervaloDias ) ;
                  end;
              next ;
            end;
       end;
   except on E : Exception do
       RaiseException( E, UnitName, ClassName,  'AddTarefasFromProtocolo' )
  end;

end;


class function TProtocolosAnimal.InterrompeProtocolo(AKAnimal, AKProtocolo: string;
  AData: TDateTime ; ALote : string ; AGetLoteIfEmpty : boolean ): string;
const

  sql_select_interrompe_protocolo =
          'SELECT KZOO_ANIMAL_PROTOCOLO FROM ZOO_ANIMAL_PROTOCOLOS'
  + #13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
  + #13#10'  AND KZOO_PROTOCOLO = :KZOO_PROTOCOLO'
  + #13#10'  AND STATUS = :STATUSABERTO' ;

  sql_update_interrompe_protocolo =
          'UPDATE ZOO_ANIMAL_PROTOCOLOS'
  + #13#10'SET'
  + #13#10' DATASTATUS = :DATASTATUS,'
  + #13#10' STATUS     = :STATUSINTERROMPIDO,'
  + #13#10' LOTESTATUS = :LOTESTATUS'
  + #13#10'WHERE KZOO_ANIMAL_PROTOCOLO = :KZOO_ANIMAL_PROTOCOLO' ;

  sql_update_interrompe_tarefas =
          'UPDATE ZOO_ANIMAL_TAREFAS'
  + #13#10'SET'
  + #13#10' DATASTATUS = :DATASTATUS,'
  + #13#10' STATUS     = :STATUSINTERROMPIDO,'
  + #13#10' LOTESTATUS = :LOTESTATUS'
  + #13#10'WHERE KZOO_ANIMAL_PROTOCOLO = :KZOO_ANIMAL_PROTOCOLO'
  + #13#10'  AND STATUS = :STATUSPENDENTE' ;


var
  cds : TClientDataSet ;
  p : TParams ;
begin

  try
    cds := nil ;
    p := TParams.Create ;

    if ( ALote = '' ) and ( AGetLoteIfEmpty )then
      begin
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',       ptInput ).asString := AKAnimal ;
        TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, 'LOTE FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA', p );
        ALote := cds.fieldByName ( 'LOTE' ).asString;
        FreeAndNil ( cds ) ;
      end;

    p.Clear ;
    p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := AKAnimal ;
    p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString    := AKProtocolo ;
    p.CreateParam ( ftString, 'STATUSABERTO', ptInput ).asInteger     := _ST_STATUS_PROTOCOLO_ABERTO ;

    try
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet ( cds, sql_select_interrompe_protocolo, p ) ;

      with cds do
        while not eof  do
          begin
              p.Clear ;
              p.CreateParam ( ftString, 'DATASTATUS',            ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData ) ;
              p.CreateParam ( ftString, 'STATUSINTERROMPIDO',    ptInput ).asInteger      := _ST_STATUS_TAREFA_INTERROMPIDA ;
              if ALote = '' then
                 p.CreateParam ( ftString, 'LOTESTATUS',                    ptInput ).Bound := False
              else
                 p.CreateParam ( ftString, 'LOTESTATUS',                    ptInput ).asString := ALote ;

              p.CreateParam ( ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput ).asString       := cds.FieldByName( 'KZOO_ANIMAL_PROTOCOLO' ).AsString ;
              p.CreateParam ( ftString, 'STATUSPENDENTE',        ptInput ).asInteger       := _ST_STATUS_TAREFA_PENDENTE ;

              TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').Execute ( sql_update_interrompe_tarefas, p ) ;

              p.Clear ;
              p.CreateParam ( ftString, 'DATASTATUS',            ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( AData ) ;
              p.CreateParam ( ftString, 'STATUSINTERROMPIDO',    ptInput ).asInteger      := _ST_STATUS_PROTOCOLO_INTERROMPIDO ;
              if ALote = '' then
                 p.CreateParam ( ftString, 'LOTESTATUS',                    ptInput ).Bound := False
              else
                 p.CreateParam ( ftString, 'LOTESTATUS',                    ptInput ).asString := ALote ;

              p.CreateParam ( ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput ).asString       := cds.FieldByName( 'KZOO_ANIMAL_PROTOCOLO' ).AsString ;

              TTcAbstractDB.GetByAlias ( 'ZOOTECNICO').Execute ( sql_update_interrompe_protocolo, p ) ;

              next ;
          end;
    finally
       p.Free ;
       if Assigned ( cds ) then
          cds.Free ;
    end;

  except on E : Exception do
     RaiseException( E, UnitName, ClassName,  'InterrompeProtocolo' )
  end;

end;

end.
