unit UdtmZoo_OcorrenciasAnimal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr, Provider ;

type
  TdtmZoo_OcorrenciasAnimal = class(T_dtmBase)
    cdsOcorrenciasGroup: TClientDataSet;
    dspOcorrenciasGroup: TDataSetProvider;
    sqlOcorrenciasGroup: TTcSQLDataSet;
    sqlOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    sqlOcorrenciasGroupDATADIAGNOSTICO: TSQLTimeStampField;
    sqlOcorrenciasGroupCODIGODIAGNOSTICO: TStringField;
    sqlOcorrenciasGroupNOMEDIAGNOSTICO: TStringField;
    sqlOcorrenciasGroupOBSDIAGNOSTICO: TMemoField;
    sqlOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO: TStringField;
    sqlOcorrenciasGroupCODIGOPROTOCOLO: TStringField;
    sqlOcorrenciasGroupNOMEPROTOCOLO: TStringField;
    sqlOcorrenciasGroupDATAPROTOCOLO: TSQLTimeStampField;
    sqlOcorrenciasGroupOBSPROTOCOLO: TMemoField;
    sqlOcorrenciasGroupKZOO_ANIMAL_TAREFA: TStringField;
    sqlOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO_1: TStringField;
    sqlOcorrenciasGroupCODIGOTAREFA: TStringField;
    sqlOcorrenciasGroupNOMETAREFA: TStringField;
    sqlOcorrenciasGroupDATAPREVISTA: TSQLTimeStampField;
    sqlOcorrenciasGroupDATATAREFA: TSQLTimeStampField;
    sqlOcorrenciasGroupKCAD_FUNCIONARIO: TStringField;
    sqlOcorrenciasGroupKZOO_TAREFA: TStringField;
    sqlOcorrenciasGroupNOMEFUNCIONARIO: TStringField;
    sqlOcorrenciasGroupOBS: TMemoField;
    cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    cdsOcorrenciasGroupDATADIAGNOSTICO: TSQLTimeStampField;
    cdsOcorrenciasGroupCODIGODIAGNOSTICO: TStringField;
    cdsOcorrenciasGroupNOMEDIAGNOSTICO: TStringField;
    cdsOcorrenciasGroupOBSDIAGNOSTICO: TMemoField;
    cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO: TStringField;
    cdsOcorrenciasGroupCODIGOPROTOCOLO: TStringField;
    cdsOcorrenciasGroupNOMEPROTOCOLO: TStringField;
    cdsOcorrenciasGroupDATAPROTOCOLO: TSQLTimeStampField;
    cdsOcorrenciasGroupOBSPROTOCOLO: TMemoField;
    cdsOcorrenciasGroupKZOO_ANIMAL_TAREFA: TStringField;
    cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO_1: TStringField;
    cdsOcorrenciasGroupCODIGOTAREFA: TStringField;
    cdsOcorrenciasGroupNOMETAREFA: TStringField;
    cdsOcorrenciasGroupDATAPREVISTA: TSQLTimeStampField;
    cdsOcorrenciasGroupDATATAREFA: TSQLTimeStampField;
    cdsOcorrenciasGroupKCAD_FUNCIONARIO: TStringField;
    cdsOcorrenciasGroupKZOO_TAREFA: TStringField;
    cdsOcorrenciasGroupNOMEFUNCIONARIO: TStringField;
    cdsOcorrenciasGroupOBS: TMemoField;
    cdsStatusTarefas: TClientDataSet;
    cdsStatusTarefasTIPO: TStringField;
    cdsStatusTarefasVALOR: TStringField;
    cdsStatusTarefasDESCRICAO: TStringField;
    cdsStatusTarefasORDEM: TIntegerField;
    cdsOcorrenciasGroupST_TAREFA: TStringField;
    cdsStatusDiagnostico: TClientDataSet;
    cdsStatusDiagnosticoTIPO: TStringField;
    cdsStatusDiagnosticoVALOR: TStringField;
    cdsStatusDiagnosticoDESCRICAO: TStringField;
    cdsStatusDiagnosticoORDEM: TIntegerField;
    cdsStatusProtocolo: TClientDataSet;
    cdsStatusProtocoloTIPO: TStringField;
    cdsStatusProtocoloVALOR: TStringField;
    cdsStatusProtocoloDESCRICAO: TStringField;
    cdsStatusProtocoloORDEM: TIntegerField;
    sqlOcorrenciasGroupSTATUSDIAGNOSTICO: TIntegerField;
    sqlOcorrenciasGroupSTATUSPROTOCOLO: TIntegerField;
    sqlOcorrenciasGroupSTATUSTAREFA: TIntegerField;
    cdsOcorrenciasGroupSTATUSDIAGNOSTICO: TIntegerField;
    cdsOcorrenciasGroupSTATUSPROTOCOLO: TIntegerField;
    cdsOcorrenciasGroupSTATUSTAREFA: TIntegerField;
    cdsOcorrenciasGroupDESC_STDIAGNOSTICO: TStringField;
    cdsOcorrenciasGroupDESC_STPROTOCOLO: TStringField;
    sqlOcorrenciasCronologica: TTcSQLDataSet;
    sqlOcorrenciasCronologicaTIPO: TStringField;
    sqlOcorrenciasCronologicaRECORDKEY: TStringField;
    sqlOcorrenciasCronologicaOCORRENCIA: TStringField;
    sqlOcorrenciasCronologicaORIGEM: TStringField;
    sqlOcorrenciasCronologicaSTATUS: TIntegerField;
    sqlOcorrenciasCronologicaDATAEXECUCAO: TSQLTimeStampField;
    sqlOcorrenciasCronologicaKCAD_FUNCIONARIO: TStringField;
    sqlOcorrenciasCronologicaNOMEFUNCIONARIO: TStringField;
    sqlOcorrenciasCronologicaOBS: TMemoField;
    cdsOcorrenciasCronologica: TClientDataSet;
    dspOcorrenciasCronologica: TDataSetProvider;
    sqlOcorrenciasCronologicaEXCLUIDO: TStringField;
    cdsOcorrenciasCronologicaTIPO: TStringField;
    cdsOcorrenciasCronologicaRECORDKEY: TStringField;
    cdsOcorrenciasCronologicaDATA: TDateField;
    cdsOcorrenciasCronologicaOCORRENCIA: TStringField;
    cdsOcorrenciasCronologicaORIGEM: TStringField;
    cdsOcorrenciasCronologicaSTATUS: TIntegerField;
    cdsOcorrenciasCronologicaDATAEXECUCAO: TSQLTimeStampField;
    cdsOcorrenciasCronologicaKCAD_FUNCIONARIO: TStringField;
    cdsOcorrenciasCronologicaNOMEFUNCIONARIO: TStringField;
    cdsOcorrenciasCronologicaOBS: TMemoField;
    cdsOcorrenciasCronologicaEXCLUIDO: TStringField;
    cdsOcorrenciasCronologicaDESCR_STATUS: TStringField;
    cdsOcorrenciasCronologicaDESCR_TIPO: TStringField;
    sqlOcorrenciasCronologicaREEXECUTAR_EM: TSQLTimeStampField;
    cdsOcorrenciasCronologicaREEXECUTAR_EM: TSQLTimeStampField;
    sqlOcorrenciasCronologicaVEZAODIA: TIntegerField;
    cdsOcorrenciasCronologicaVEZAODIA: TIntegerField;
    sqlOcorrenciasGroupVEZAODIA: TIntegerField;
    cdsOcorrenciasGroupVEZAODIA: TIntegerField;
    cdsOcorrenciasGroupNOMETAREFA_VEZES: TStringField;
    cdsTipoQuarto: TClientDataSet;
    cdsTipoQuartoTIPO: TStringField;
    cdsTipoQuartoVALOR: TStringField;
    cdsTipoQuartoDESCRICAO: TStringField;
    cdsTipoQuartoORDEM: TIntegerField;
    sqlOcorrenciasCronologicaQUARTO: TSmallintField;
    cdsOcorrenciasCronologicaQUARTO: TSmallintField;
    cdsOcorrenciasCronologicaDESCR_QUARTO: TStringField;
    sqlOcorrenciasCronologicaPOR_QUARTO: TStringField;
    cdsOcorrenciasCronologicaPOR_QUARTO: TStringField;
    sqlOcorrenciasGroupDL: TIntegerField;
    sqlOcorrenciasGroupNDC: TIntegerField;
    cdsOcorrenciasGroupDL: TIntegerField;
    cdsOcorrenciasGroupNDC: TIntegerField;
    sqlOcorrenciasCronologicaDATA: TDateField;
    procedure cdsOcorrenciasCronologicaBeforeInsert(DataSet: TDataSet);
    procedure dspOcorrenciasCronologicaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsOcorrenciasCronologicaCalcFields(DataSet: TDataSet);
    procedure cdsOcorrenciasCronologicaSTATUSValidate(Sender: TField);
    procedure cdsOcorrenciasCronologicaOCORRENCIAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure sqlOcorrenciasGroupNOMETAREFAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsOcorrenciasGroupCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FInternalDataSource : TDataSource ;
    FOnRebuildGridCells: TNotifyEvent;
    procedure SetMasterSource(const Value: TDataSource);
    procedure DoChangeOcorrencias(Sender: TObject; Field: TField);
    procedure SetOnRebuildGridCells(const Value: TNotifyEvent);
    procedure InitDESCR_TIPO ;
    procedure SetDESCR_STATUS ;
  public
    { Public declarations }
   procedure ChangeOcorrencias ;
   procedure OpenTables ; Override ;
   procedure ApplyUpdates ; Override ;
   property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
   property OnRebuildGridCells : TNotifyEvent   read FOnRebuildGridCells write SetOnRebuildGridCells;
   procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
   procedure ShowExclued ( AShow : boolean  ) ;
  end;

implementation

uses CDSSuppl, UDBZootecnico, Exceptions, System.Variants, CLAg5Types, Data.SQLTimSt,
   Tc.DBRTL.AbstractDB ;

{$R *.dfm}

{ TdtmZoo_OcorrenciasAninal }

procedure TdtmZoo_OcorrenciasAnimal.ApplyUpdates;
begin
  inherited;
  ChangeOcorrencias
end;

procedure TdtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaBeforeInsert(
  DataSet: TDataSet);
begin
   Abort ;
end;

procedure TdtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaCalcFields( DataSet: TDataSet ) ;
begin

  if DataSet.State = dsInternalCalc then
    begin
      InitDESCR_TIPO ;
      SetDESCR_STATUS ;
    end;


end;

procedure TdtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaOCORRENCIAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsOcorrenciasCronologicaVEZAODIA.asInteger > 1 then
      Text := Format ( '%s (%da vez)', [ Sender.asString, cdsOcorrenciasCronologicaVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s', [ Sender.asString ] )
end;

procedure TdtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaSTATUSValidate(
  Sender: TField);
begin
  SetDESCR_STATUS ;
end;

procedure TdtmZoo_OcorrenciasAnimal.cdsOcorrenciasGroupCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc  then
   if cdsOcorrenciasGroupVEZAODIA.asInteger > 1 then
      cdsOcorrenciasGroupNOMETAREFA_VEZES.asString := Format ( '%s (%da vez)', [ cdsOcorrenciasGroupNOMETAREFA.asString, cdsOcorrenciasGroupVEZAODIA.asInteger ] )
   else
      cdsOcorrenciasGroupNOMETAREFA_VEZES.asString := Format ( '%s', [ cdsOcorrenciasGroupNOMETAREFA.asString ] )
end;

procedure TdtmZoo_OcorrenciasAnimal.ChangeOcorrencias;
begin
    if FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString = '' then
       exit ;

    cdsOcorrenciasGroup.Close ;
    cdsOcorrenciasGroup.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString :=
       FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString ;
    TCDSSuppl.Open ( cdsOcorrenciasGroup ) ;

    cdsOcorrenciasCronologica.Close ;
    cdsOcorrenciasCronologica.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString :=
       FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString ;

    TCDSSuppl.Open ( cdsOcorrenciasCronologica ) ;

    if Assigned ( self.FOnRebuildGridCells ) then
       FOnRebuildGridCells ( self ) ;
end;

procedure TdtmZoo_OcorrenciasAnimal.DoChangeOcorrencias(Sender: TObject;
  Field: TField);
begin
  ChangeOcorrencias ;
end;

procedure TdtmZoo_OcorrenciasAnimal.dspOcorrenciasCronologicaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  TableName : string ;
  KeyField : string ;
  KeyValue : string ;
  q : TSQLQuery ;
  s : string ;
  x : integer ;


  p : TParams ;
  UpdateList : TStringList ;

  procedure AddToFieldList ( TableField : string ; DeltaField : TField ) ;
  begin
      if not varIsEmpty ( DeltaField.NewValue ) then
         begin
           UpdateList.Add ( Format( '%s = :%s', [ TableField, TableField ] ) ) ;
           p.CreateParam ( DeltaField.DataType, TableField, ptInput ).Bound := False ;
           if not varIsNull ( DeltaField.NewValue ) then
               p.ParamByName ( TableField ).Value := DeltaField.Value ;
         end;
  end;

  procedure SetFieldsDescartes ;
  begin
     AddToFieldList (  'EXCLUIDO',         DeltaDS.FieldByName( 'EXCLUIDO'         ) ) ;
  end;

  procedure SetFieldsTarefas ;
  begin
     AddToFieldList (  'KCAD_FUNCIONARIO', DeltaDS.FieldByName( 'KCAD_FUNCIONARIO' ) ) ;
     AddToFieldList (  'NOMEFUNCIONARIO',  DeltaDS.FieldByName( 'NOMEFUNCIONARIO'  ) ) ;
     AddToFieldList (  'DATAPREVISTA',     DeltaDS.FieldByName( 'DATA'             ) ) ;
     AddToFieldList (  'STATUS',           DeltaDS.FieldByName( 'STATUS'           ) ) ;
     AddToFieldList (  'DATASTATUS',       DeltaDS.FieldByName( 'DATAEXECUCAO'     ) ) ;
     AddToFieldList (  'OBS',              DeltaDS.FieldByName( 'OBS'              ) ) ;
     AddToFieldList (  'EXCLUIDO',         DeltaDS.FieldByName( 'EXCLUIDO'         ) ) ;
     AddToFieldList (  'REEXECUTAR_EM',    DeltaDS.FieldByName( 'REEXECUTAR_EM'    ) ) ;
  end;

  procedure SetFieldsProtocolos ;
  begin
     AddToFieldList (  'DATA',             DeltaDS.FieldByName( 'DATA'             ) ) ;
     AddToFieldList (  'DATASTATUS',       DeltaDS.FieldByName( 'DATAEXECUCAO'     ) ) ;
     AddToFieldList (  'STATUS',           DeltaDS.FieldByName( 'STATUS'           ) ) ;
     AddToFieldList (  'OBS',              DeltaDS.FieldByName( 'OBS'              ) ) ;
     AddToFieldList (  'EXCLUIDO',         DeltaDS.FieldByName( 'EXCLUIDO'         ) ) ;
  end;

  procedure SetFieldsDiagnosticos ;
  begin
     AddToFieldList (  'DATA',             DeltaDS.FieldByName( 'DATA'             ) ) ;
     AddToFieldList (  'DATASTATUS',       DeltaDS.FieldByName( 'DATAEXECUCAO'     ) ) ;
     AddToFieldList (  'STATUS',           DeltaDS.FieldByName( 'STATUS'           ) ) ;
     AddToFieldList (  'OBS',              DeltaDS.FieldByName( 'OBS'              ) ) ;
     AddToFieldList (  'EXCLUIDO',         DeltaDS.FieldByName( 'EXCLUIDO'         ) ) ;
  end;

begin
  Applied := True ;

  if (UpdateKind = ukInsert) or (UpdateKind = ukDelete)then
    exit ;


  p := TParams.Create ;
  UpdateList := TStringList.Create ;

  if DeltaDS.FieldByName('TIPO').OldValue = 'D' then
    begin
     TableName := 'ZOO_ANIMAL_DIAGNOSTICOS' ;
     KeyField  := 'KZOO_ANIMAL_DIAGNOSTICO' ;
     SetFieldsDiagnosticos ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'P' then
    begin
     TableName := 'ZOO_ANIMAL_PROTOCOLOS' ;
     KeyField  := 'KZOO_ANIMAL_PROTOCOLO' ;
     SetFieldsProtocolos ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'T' then
    begin
     TableName := 'ZOO_ANIMAL_TAREFAS' ;
     KeyField  := 'KZOO_ANIMAL_TAREFA' ;
     SetFieldsTarefas ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'X' then
    begin
     TableName := 'ZOO_ANIMAL_TAREFAS' ;
     KeyField  := 'KZOO_ANIMAL_TAREFA' ;
     SetFieldsDescartes ;
    end
  else
    RaiseException( nil, UnitName, ClassName, 'Tipo de tabela ocorrências inválido' ) ;

  if p.Count <> 0  then
    begin
       p.CreateParam ( ftFixedChar, 'w' + KeyField, ptInput ).AsString := DeltaDS.FieldByName('RECORDKEY').OldValue ;
       q := TSQLQuery.Create ( nil ) ;
       q.SQLConnection := sqlOcorrenciasCronologica.SQLConnection ;

       s := '' ;
       for x := 0 to UpdateList.Count - 1 do
         s := format ( '%s, %s', [s, UpdateList[ x ] ] ) ;

       System.Delete (s, 1, 1 ) ;

       q.SQL.Text := Format ( 'UPDATE %s SET %s WHERE %s = :w%s', [ TableName, s, KeyField, KeyField ] ) ;
       q.Params.AssignValues( p ) ;
       q.ExecSQL ;
       q.free ;
    end ;

  p.free ;
  UpdateList.free ;

end;

procedure TdtmZoo_OcorrenciasAnimal.InitDESCR_TIPO;
begin
  if cdsOcorrenciasCronologicaTIPO.asString = 'D' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Diagnóstico'
  else if cdsOcorrenciasCronologicaTIPO.asString = 'P' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Protocolo'
  else if cdsOcorrenciasCronologicaTIPO.asString = 'T' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Tarefa'
  else if cdsOcorrenciasCronologicaTIPO.asString = 'X' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Descarte' ;
end;

procedure TdtmZoo_OcorrenciasAnimal.OpenTables;
begin

   TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).GetSystemTypes ( _ST_STATUS_DIAGNOSTICO, cdsStatusDiagnostico );
   TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).GetSystemTypes ( _ST_STATUS_PROTOCOLO,   cdsStatusProtocolo   );
   TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).GetSystemTypes ( _ST_STATUS_TAREFA,      cdsStatusTarefas     );
   TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsTipoQuarto        );

   FInternalDataSource := TDataSource.Create ( self ) ;
   FInternalDataSource.DataSet := FMasterSource.DataSet ;
   FInternalDataSource.OnDataChange := DoChangeOcorrencias ;
   ChangeOcorrencias ;

(*
   TCDSSuppl.SetMasterSource(cdsOcorrenciasGroup, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   exit ;
   TCDSSuppl.Open (  cdsOcorrenciasGroup ) ;
*)
end;

procedure TdtmZoo_OcorrenciasAnimal.SetDESCR_STATUS;
begin
   if ( cdsOcorrenciasCronologicaTIPO.asString = 'D' )
       and cdsStatusDiagnostico.Locate( 'TIPO;VALOR', VarArrayOf ( [_ST_STATUS_DIAGNOSTICO, cdsOcorrenciasCronologicaSTATUS.asInteger] ), [] ) then
    cdsOcorrenciasCronologicaDESCR_STATUS.asString := cdsStatusDiagnosticoDESCRICAO.asString
  else if ( cdsOcorrenciasCronologicaTIPO.asString = 'P' )
        and cdsStatusProtocolo.Locate( 'TIPO;VALOR', VarArrayOf ( [_ST_STATUS_PROTOCOLO, cdsOcorrenciasCronologicaSTATUS.asInteger] ), []  ) then
    cdsOcorrenciasCronologicaDESCR_STATUS.asString := cdsStatusProtocoloDESCRICAO.asString
  else if ( cdsOcorrenciasCronologicaTIPO.asString = 'T' )
        and cdsStatusTarefas.Locate( 'TIPO;VALOR', VarArrayOf ( [_ST_STATUS_TAREFA, cdsOcorrenciasCronologicaSTATUS.asInteger] ), [] )  then
    cdsOcorrenciasCronologicaDESCR_STATUS.asString := cdsStatusTarefasDESCRICAO.asString
  else
    cdsOcorrenciasCronologicaDESCR_STATUS.Clear
end;

procedure TdtmZoo_OcorrenciasAnimal.SetFuncionario(AKFuncionario,
  ANomeFuncionario: string);
begin
  if not ( cdsOcorrenciasCronologica.State in [dsInsert, dsEdit] ) then
    cdsOcorrenciasCronologica.Edit ;

  cdsOcorrenciasCronologicaNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
  cdsOcorrenciasCronologicaKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TdtmZoo_OcorrenciasAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TdtmZoo_OcorrenciasAnimal.SetOnRebuildGridCells(const Value: TNotifyEvent);
begin
  FOnRebuildGridCells := Value;
end;


procedure TdtmZoo_OcorrenciasAnimal.ShowExclued(AShow: boolean);
begin
   self.cdsOcorrenciasCronologica.Filtered := not AShow ;
end;

procedure TdtmZoo_OcorrenciasAnimal.sqlOcorrenciasGroupNOMETAREFAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsOcorrenciasGroupVEZAODIA.asInteger > 1 then
      Text := Format ( '%s (%da vez)', [ cdsOcorrenciasGroupNOMETAREFA.asString, cdsOcorrenciasGroupVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s', [ cdsOcorrenciasGroupNOMETAREFA.asString ] )
end;

(*
BKP SELECT OCORRENCIAS

SELECT
D.KZOO_ANIMAL_DIAGNOSTICO,   D.DATA DATADIAGNOSTICO,
D.CODIGO CODIGODIAGNOSTICO,  D.NOME NOMEDIAGNOSTICO,
D.OBS OBSDIAGNOSTICO,        P.KZOO_ANIMAL_PROTOCOLO,
P.CODIGO CODIGOPROTOCOLO,    P.NOME NOMEPROTOCOLO,
P.DATA DATAPROTOCOLO, 	     P.OBS OBSPROTOCOLO,
T.KZOO_ANIMAL_TAREFA, 	     T.KZOO_ANIMAL_PROTOCOLO,
T.CODIGO CODIGOTAREFA, 	     T.NOME NOMETAREFA,
T.DATAPREVISTA DATAPREVISTA, T.DATASTATUS DATATAREFA,
T.KCAD_FUNCIONARIO, 	       T.KZOO_TAREFA,
T.NOMEFUNCIONARIO, 	         T.OBS,
T.STATUS

FROM ZOO_ANIMAL_TAREFAS T
LEFT JOIN  ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO
LEFT JOIN  ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO

WHERE T.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA
*)



end.



(*


UNION ALL
SELECT DISTINCT -- DIAGNOSTICOS,PROTOCOLOS,TAREFAS DE DECARTE
    COALESCE ( D.KZOO_ANIMAL_DIAGNOSTICO, E.KZOO_ANIMAL_TAREFA ) KZOO_ANIMAL_DIAGNOSTICO,
    COALESCE ( D.DATA, E.DATA_RESULTADO ) DATADIAGNOSTICO,
    COALESCE ( D.CODIGO || COALESCE(  ' (' ||  STS.SYS$DESCRIPTION ||  ')',''), E.CODIGO ) CODIGODIAGNOSTICO,
    COALESCE ( D.NOME     || COALESCE('  no quarto ' ||STD.SYS$DESCRIPTION,''), 'Exame: ' || E.NOME   ) NOMEDIAGNOSTICO,
    COALESCE ( D.STATUS, E.STATUS ) STATUSDIAGNOSTICO,
    COALESCE ( D.OBS, E.OBS_EXAME ) OBSDIAGNOSTICO,
    P.KZOO_ANIMAL_PROTOCOLO,
    P.CODIGO CODIGOPROTOCOLO,
    P.NOME NOMEPROTOCOLO,
    P.DATA DATAPROTOCOLO,
    P.STATUS STATUSPROTOCOLO,
    P.OBS OBSPROTOCOLO,
    NULL KZOO_ANIMAL_TAREFA,
    T.KZOO_ANIMAL_PROTOCOLO,
    T.CODIGO CODIGOTAREFA,
    T.NOME NOMETAREFA,
    COALESCE ( T.DATASTATUS, T.DATAPREVISTA ) DATAORDER,
    T.DATAPREVISTA DATAPREVISTA,
    T.DATASTATUS DATATAREFA,
    T.KCAD_FUNCIONARIO,
    T.KZOO_TAREFA,
    T.NOMEFUNCIONARIO,
    T.STATUS STATUSTAREFA,
    T.VEZAODIA,
    T.OBS
FROM ZOO_ANIMAL_PROTOCOLOS P
LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS D ON D.KZOO_ANIMAL_DIAGNOSTICO = P.KZOO_ANIMAL_DIAGNOSTICO
LEFT JOIN ZOO_ANIMAL_TAREFAS  E ON E.KZOO_ANIMAL_TAREFA = P.KZOO_ANIMAL_TAREFA
LEFT JOIN ZOO_ANIMAL_TAREFAS T ON T.KZOO_ANIMAL_PROTOCOLO = P.KZOO_ANIMAL_PROTOCOLO
LEFT JOIN SYS$TYPES_GETDESCRIPTION( 'TIPO_SIGLAQUARTO', D.QUARTO ) STS ON 1=1
LEFT JOIN SYS$TYPES_GETDESCRIPTION( 'TIPO_QUARTO', D.QUARTO ) STD ON 1=1
WHERE P.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA
  AND P.EXCLUIDO = 'F' AND COALESCE ( D.EXCLUIDO, 'F' ) = 'F'
  AND T.KMZOO_ANIMAL_TAREFA IS NOT NULL AND T.EXCLUIDO = 'F'


*)
