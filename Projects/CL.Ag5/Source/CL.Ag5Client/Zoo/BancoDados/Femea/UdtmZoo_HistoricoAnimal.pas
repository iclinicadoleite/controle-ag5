unit UdtmZoo_HistoricoAnimal;

//Alteração solicitada por Marsola e Vitor na data: 30/08/2012
//Alterar o cabeçaçho dos campos:
// - "Dias desde" passará para "Dias"
// - "o último parto" para "do último parto"
// - "o último evento" para "entre eventos"
// - "o hoje" para "do evento"

interface

uses
  System.SysUtils, System.Classes, UdtmSYS_BASE, Data.FMTBcd, Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, SqlExpr;

type
  TdtmZoo_HistoricoAnimal = class(T_dtmBASE)
    cdsHistoricoAnimal: TClientDataSet;
    cdsHistoricoAnimalLACTACAO: TIntegerField;
    cdsHistoricoAnimalEVENTO: TStringField;
    cdsHistoricoAnimalDESCRICAO: TStringField;
    cdsHistoricoAnimalDATA: TDateTimeField;
    cdsHistoricoAnimalDIAS: TADTField;
    cdsHistoricoAnimalDIASPARTO: TIntegerField;
    cdsHistoricoAnimalDIASEVENTO: TIntegerField;
    cdsHistoricoAnimalDIASHOJE: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    procedure cdsHistoricoAnimalNewRecord(DataSet: TDataSet);
    procedure cdsHistoricoAnimalDIASPARTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsHistoricoAnimalLACTACAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsHistoricoAnimalBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FInternalDataSource : TDataSource ;
    procedure SetMasterSource(const Value: TDataSource);
    procedure DoChangeHistorico(Sender: TObject; Field: TField);
  public
    { Public declarations }
    procedure ChangeHistorico ;
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, System.Variants, CLAg5Types;

{$R *.dfm}

{ TdtmZoo_HistoricoAnimal }

procedure TdtmZoo_HistoricoAnimal.cdsHistoricoAnimalBeforeOpen(DataSet: TDataSet);
begin
//  if UpperCase(cdsHistoricoAnimalEVENTO.AsString) = 'COLETA' then
//    begin
//      cdsHistoricoAnimalDESCRICAO.AsString := cdsHistoricoAnimalEVENTO.AsString ;
//      cdsHistoricoAnimalEVENTO.AsString    := 'Embrião' ;
//    end;
end;

procedure TdtmZoo_HistoricoAnimal.cdsHistoricoAnimalDIASPARTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.asInteger = -1 then
      text := ''
   else
      text := Sender.asString
end;

procedure TdtmZoo_HistoricoAnimal.cdsHistoricoAnimalLACTACAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    begin
     if ( cdsHistoricoAnimal.IsEmpty ) or ( Sender.AsInteger = 0 ) then
        Text := ''
     else
        Text := Sender.asString  ;
    end
  else
     Text := Sender.asString ;
end;

procedure TdtmZoo_HistoricoAnimal.cdsHistoricoAnimalNewRecord(
  DataSet: TDataSet);
begin
  inherited;
//  GetKey ( cdsCMTKZOO_ANIMAL_FEMEA_CMT ) ;
//  cdsCMTKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ) ; ;
end;

procedure TdtmZoo_HistoricoAnimal.ChangeHistorico ;
const

 _SELECT_EVENTOS =
 'E.DATAEVENTO, E.KZOO_ANIMAL_MACHO, COALESCE ( A.BRINCO || '' - '', '''' ) || COALESCE ( A.NOMEESTABULO, A.NOMECOMPLETO ) NOMEMACHO, E.TIPOEVENTO, E.PRENHEZ, E.DATATOQUE, E.ABORTOPARTO,'
 +#13#10'E.DATAABORTOPARTO from ZOO_EVENTOS_ZOOTECNICOS e'
 +#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'
 +#13#10'WHERE E.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL' ;

 _SELECT_LACTACOES =
 'E.DATAABORTOPARTO, L.DATA_SECAGEM, L.NL, DE.SYS$DESCRIPTION DESCR_CAUSASECAGEM  FROM ZOO_LACTACOES L'
 +#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
 +#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''%s'', L.CAUSA_SECAGEM ) DE ON ( 1=1 )'
 +#13#10'WHERE L.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
 +#13#10'ORDER BY E.DATAABORTOPARTO DESC' ;

_SELECT_PESAGENS =
 'LP.DATA, Coalesce ( P.ORD1,0 ) + Coalesce ( P.ORD2,0 ) + Coalesce ( P.ORD1,3 ) TOT FROM ZOO_LACTACOES L'
 +#13#10'LEFT JOIN ZOO_PESAGEM_LEITE P ON P.KZOO_LACTACAO = L.KZOO_LACTACAO'
 +#13#10'LEFT JOIN ZOO_LOTEPESAGEM_LEITE LP ON LP.KZOO_LOTEPESAGEM_LEITE = P.KZOO_LOTEPESAGEM_LEITE'
 +#13#10'WHERE L.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL' ;
                (*
_SELECT_SANITARIO = 'SELECT'
 +#13#10'   D.KZOO_ANIMAL_DIAGNOSTICO,'
 +#13#10'   CAST ( D.DATA  AS DATE ) DATA,'
 +#13#10'   Cast ( SubString ( ''Diagnóstico : '' || D.CODIGO || '' - ''|| D.NOME FROM 1 FOR 60 ) AS VARCHAR ( 60 )) EVENTO,'
 +#13#10'   CAST ( SUBSTRING ( LIST ( COALESCE ( P.CODIGO  || '' - '', '''' ) || COALESCE ( P.NOME, '''' ) ) FROM 1 FOR 1024 ) AS VARCHAR ( 1024 )) ITEMS'
 +#13#10'FROM ZOO_ANIMAL_DIAGNOSTICOS D'
 +#13#10'LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_DIAGNOSTICO = D.KZOO_ANIMAL_DIAGNOSTICO'
 +#13#10'WHERE D.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL'
 +#13#10'GROUP BY 1,2,3'
 +#13#10'Union all'
 +#13#10'SELECT'
 +#13#10'   P.KZOO_ANIMAL_PROTOCOLO,'
 +#13#10'   CAST ( P.DATA AS DATE ) DATA,'
 +#13#10'   Cast ( SubString ( ''Protocolo : '' || P.CODIGO || '' - ''|| P.NOME FROM 1 FOR 60 ) AS VARCHAR ( 60 ))  EVENTO,'
// +#13#10'   CAST ( SUBSTRING ( LIST ( COALESCE ( P.CODIGO  || '' - '', '''' ) || COALESCE ( T.NOME, '''' ) ) FROM 1 FOR 1024 ) AS VARCHAR ( 1024 )) ITEMS'
 +#13#10'   CAST ( SUBSTRING ( LIST ( COALESCE ( T.CODIGO  || '' - '', '''' ) || COALESCE ( T.NOME, '''' ) ) FROM 1 FOR 1024 ) AS VARCHAR ( 1024 )) ITEMS'
 +#13#10'FROM ZOO_ANIMAL_PROTOCOLOS P'
 +#13#10'LEFT JOIN ZOO_ANIMAL_TAREFAS T ON T.KZOO_ANIMAL_PROTOCOLO = P.KZOO_ANIMAL_PROTOCOLO'
 +#13#10'WHERE P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL AND T.DATASTATUS IS NOT NULL'
 +#13#10'GROUP BY 1,2,3' ;
              *)

_SELECT_SANITARIO = 'SELECT'
 +#13#10'   D.KZOO_ANIMAL_DIAGNOSTICO,'
 +#13#10'   CAST ( D.DATA  AS DATE ) DATA,'
 +#13#10'   Cast ( ''Diagnóstico'' AS VARCHAR ( 15 ) )  EVENTO,'
 +#13#10'   CAST ( SUBSTRING ( D.NOME || COALESCE('' no quarto '' ||STD.SYS$DESCRIPTION,'''' ) FROM 1 FOR 60 ) AS VARCHAR ( 60 )) ITEMS'
 +#13#10'FROM ZOO_ANIMAL_DIAGNOSTICOS D'
 +#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''TIPO_SIGLAQUARTO'', D.QUARTO ) STS ON 1=1'
 +#13#10'LEFT JOIN SYS$TYPES_GETDESCRIPTION( ''TIPO_QUARTO'', D.QUARTO ) STD ON 1=1'
 +#13#10'WHERE D.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL  AND D.EXCLUIDO = ''F'''
 +#13#10'Union all'
 +#13#10'SELECT'
 +#13#10'   P.KZOO_ANIMAL_PROTOCOLO,'
 +#13#10'   CAST ( P.DATA AS DATE ) DATA,'
 +#13#10'   Cast ( ''Protocolo'' AS VARCHAR ( 15 ) )  EVENTO,'
 +#13#10'   Cast ( SubString (  P.CODIGO FROM 1 FOR 60 ) AS VARCHAR ( 60 )) ITEMS'
 +#13#10'FROM ZOO_ANIMAL_PROTOCOLOS P'
 +#13#10'WHERE P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL AND P.EXCLUIDO = ''F'''
 +#13#10'ORDER BY 3' ;

_SELECT_DESMAME = 'SELECT'
 +#13#10'  A.KZOO_ANIMAL, '
 +#13#10'  A.DATADESMAME "DATA", '
 +#13#10'  Cast ( ''Desmame'' AS VARCHAR ( 15 ) )  EVENTO '
 +#13#10'FROM ZOO_ANIMAIS A '
 +#13#10'WHERE A.KZOO_ANIMAL = :KZOO_ANIMAL'
 +#13#10'  AND A.DATADESMAME IS NOT NULL ';

_SELECT_TOQUES = 'SELECT '
+#13#10'  E.KZOO_ANIMAL_FEMEA KZOO_ANIMAL,'
+#13#10'  H.DATATOQUE "DATA", '
+#13#10' Cast ( ''Toque'' AS VARCHAR ( 15 ) )  EVENTO, '
+#13#10'  (SELECT CAST ( SYS$DESCRIPTION AS VARCHAR ( 15 ) ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''STATUS_PRENHEZ'', H.PRENHEZ )) "DIAGNOSTICO" '
+#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'
+#13#10'INNER JOIN ZOO_HISTORICO_TOQUE H ON H.KZOO_EVENTO_ZOOTECNICO = E.KZOO_EVENTO_ZOOTECNICO'
+#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
+#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO'
+#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = E.KZOO_ANIMAL_FEMEA'
+#13#10'WHERE E.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL';

var
 AKAnimal : string ;
 cds, cdsLactacoes, cdsSanitario : TClientDataSet ;
 p : TParams ;
 hoje : TDateTime ;
 FS : TFormatSettings ;

   function GetNL ( ADate : TDateTime ; var ADataParto : TDateTime ) : integer ;
   begin
      Result := 0 ;
      ADataParto := 0 ;
      with cdsLactacoes do
        begin
            first ;
            while not eof do
               begin
                 if ADate >= fieldByName ( 'DATAABORTOPARTO' ).AsDateTime then
                   begin
                      ADataParto := fieldByName ( 'DATAABORTOPARTO' ).asDateTime ;
                      Result := fieldByName ( 'NL' ).asInteger ;
                      exit ;
                   end  ;
                 next ;
               end;
        end ;
   end ;

   procedure AddRecord ( ADataEvento : TDateTime ;  AEvento, ADescricao : String ) ;
   var
     DataParto : TDateTime ;
     NL : integer ;
   begin
      NL := GetNL ( ADataEvento, DataParto ) ;
      if DataParto = 0 then
        cdsHistoricoAnimal.AppendRecord ( [ NL, AEvento, ADescricao, ADataEvento,
                     VarArrayOf ( [ -1, 0, Hoje - ADataEvento ] ) ] )
      else
        cdsHistoricoAnimal.AppendRecord ( [ NL, AEvento, ADescricao, ADataEvento,
                     VarArrayOf ( [ ADataEvento - DataParto, 0, Hoje - ADataEvento ] ) ] ) ;
   end;

   procedure CalcDiasEventos ;
   var
     LastEvent : TDateTime ;
   begin
    with cdsHistoricoAnimal do
       begin
          AddIndex( '__Idx', 'DATA', [ixNonMaintained], 'DATA' ) ;
          IndexName := '__Idx' ;
          first ;
          while not eof  do
            begin
              next ;
              if not eof then
                begin
                 LastEvent := cdsHistoricoAnimalDATA.AsDateTime ;
                 prior ;
                 edit ;
                 cdsHistoricoAnimalDIASEVENTO.asInteger := Trunc ( cdsHistoricoAnimalDATA.AsDateTime - LastEvent ) ;
                 next ;
                end;
            end ;
       end ;
   end;



begin
   FS.DecimalSeparator := ',' ;
   AKAnimal := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString ;

   hoje := Date ;

   cds := nil ;
   cdsLactacoes := nil ;

   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKAnimal ;

   with cdsHistoricoAnimal do
     begin
        DisableControls ;
        if IndexName = '__Idx' then
           DeleteIndex('__Idx') ;
        EmptyDataSet ;
     end ;

   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_DESMAME, p ) ;
    with cds do
     begin
        while not eof do
          begin
            cdsHistoricoAnimal.AppendRecord ( [ 0, FieldByName ( 'EVENTO' ).asString, '', FieldByName ( 'DATA' ).AsDateTime] ) ;
            next ;
          end;
     end ;
   FreeAndNil ( cds ) ;



   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsLactacoes, Format ( _SELECT_LACTACOES, [ _ST_STATUS_PRODUCAO ] ), p ) ;
   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_EVENTOS, p ) ;

   with cds do
     begin
        while not eof do
          begin
            cdsTipoEvento.Locate ( 'VALOR', FieldByName('TIPOEVENTO').AsString, [] ) ;

            AddRecord ( FieldByName ( 'DATAEVENTO' ).AsDateTime, cdsTipoEventoDESCRICAO.AsString, fieldByName ( 'NOMEMACHO' ).asString ) ;

            if ( not fieldByName ( 'ABORTOPARTO' ).isNull ) and ( fieldByName ( 'ABORTOPARTO' ).asInteger <> 0 ) then
              begin
//                cdsTipoPartoAborto.Locate ( 'VALOR', FieldByName('ABORTOPARTO').AsString, [] ) ;

                if fieldByName ( 'ABORTOPARTO' ).AsInteger = _ST_TIPO_PARTOABORTO_PARTO then
                   AddRecord ( FieldByName ( 'DATAABORTOPARTO' ).AsDateTime, 'Parto', '' )
                else if fieldByName ( 'ABORTOPARTO' ).AsInteger = _ST_TIPO_PARTOABORTO_COLETA then
                  AddRecord ( FieldByName ( 'DATAABORTOPARTO' ).AsDateTime, 'Embrião', 'Coleta' )
                else if fieldByName ( 'ABORTOPARTO' ).AsInteger = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO then
                  AddRecord ( FieldByName ( 'DATAABORTOPARTO' ).AsDateTime, 'Aborto', 'com lactação' )
                else if fieldByName ( 'ABORTOPARTO' ).AsInteger = _ST_TIPO_PARTOABORTO_ABORTO then
                  AddRecord ( FieldByName ( 'DATAABORTOPARTO' ).AsDateTime, 'Aborto', 'sem lactação' ) ;
              end;
            next ;
          end;
     end ;
   FreeAndNil ( cds ) ;

   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_SANITARIO, p ) ;

   with cds do
     begin
        while not eof do
          begin
            AddRecord ( FieldByName ( 'DATA' ).AsDateTime, FieldByName ( 'EVENTO' ).asString, fieldByName ( 'ITEMS' ).asString ) ;
            next ;
          end;
     end ;
   FreeAndNil ( cds ) ;

   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_TOQUES, p ) ;

   with cds do
     begin
        while not eof do
          begin
            AddRecord ( FieldByName ( 'DATA' ).AsDateTime, FieldByName ( 'EVENTO' ).asString, fieldByName ( 'DIAGNOSTICO' ).asString ) ;
            next ;
          end;
     end ;
   FreeAndNil ( cds ) ;



(* retirado - solicitacao augusto
   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_PESAGENS, p ) ;
   with cds do
     begin
        while not eof do
          begin
            AddRecord ( FieldByName ( 'DATA' ).AsDateTime, 'Pesagem', FormatFloat ( '0.##', FieldByName ( 'TOT' ).asFloat, FS ) ) ;
            next ;
          end;
     end ;
   FreeAndNil ( cds ) ;
*)

   with cdsLactacoes do
     begin
        while not eof do
          begin
             if FieldByName ( 'DATA_SECAGEM' ).AsDateTime > 1 then
                cdsHistoricoAnimal.AppendRecord ( [ FieldByName ( 'NL' ).asInteger, 'Secagem', FieldByName ( 'DESCR_CAUSASECAGEM' ).AsString, FieldByName ( 'DATA_SECAGEM' ).AsDateTime,
                   VarArrayOf ( [ FieldByName ( 'DATA_SECAGEM' ).AsDateTime - FieldByName ( 'DATAABORTOPARTO' ).AsDateTime, 0, Hoje - FieldByName ( 'DATA_SECAGEM' ).AsDateTime ] ) ] ) ;
             Next ;
          end;
     end;
   cdsLactacoes.Free ;

   CalcDiasEventos ;
   cdsHistoricoAnimal.First ;
   cdsHistoricoAnimal.EnableControls ;

end;


procedure TdtmZoo_HistoricoAnimal.DoChangeHistorico(Sender: TObject; Field: TField);
begin
  ChangeHistorico ;
end;

procedure TdtmZoo_HistoricoAnimal.OpenTables;
begin
   TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_TIPO_EVENTO_ZOO,  cdsTipoEvento );
   TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_TIPO_PARTOABORTO, cdsTipoPartoAborto );

   cdsHistoricoAnimal.CreateDataSet ;
   cdsHistoricoAnimal.LogChanges := False ;

   FInternalDataSource := TDataSource.Create ( self ) ;
   FInternalDataSource.DataSet := FMasterSource.DataSet ;
   FInternalDataSource.OnDataChange := DoChangeHistorico ;

   ChangeHistorico ;

end;

procedure TdtmZoo_HistoricoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
