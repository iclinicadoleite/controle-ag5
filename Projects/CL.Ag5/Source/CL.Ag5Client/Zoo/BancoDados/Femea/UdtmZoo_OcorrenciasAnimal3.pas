unit UdtmZoo_OcorrenciasAnimal3;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr, Provider ;

type
  TdtmZoo_OcorrenciasAnimal = class(T_dtmBase)
    cdsOcorrenciasGroup: TClientDataSet;
    dspOcorrenciasGroup: TDataSetProvider;
    sqlOcorrenciasGroup: TTcSQLDataSet;
    cdsStatusTarefas: TClientDataSet;
    cdsStatusTarefasTIPO: TStringField;
    cdsStatusTarefasVALOR: TStringField;
    cdsStatusTarefasDESCRICAO: TStringField;
    cdsStatusTarefasORDEM: TIntegerField;
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
    sqlOcorrenciasCronologica: TTcSQLDataSet;
    sqlOcorrenciasCronologicaTIPO: TStringField;
    sqlOcorrenciasCronologicaRECORDKEY: TStringField;
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
    sqlOcorrenciasCronologicaDATA: TDateField;
    sqlOcorrenciasGroupKZOO_OCORRENCIA: TStringField;
    sqlOcorrenciasGroupKMZOO_OCORRENCIA: TStringField;
    sqlOcorrenciasGroupDATA: TSQLTimeStampField;
    sqlOcorrenciasGroupCODIGO: TStringField;
    sqlOcorrenciasGroupDESCRICAO: TStringField;
    sqlOcorrenciasGroupSTATUS: TIntegerField;
    sqlOcorrenciasGroupDATATAREFA: TSQLTimeStampField;
    sqlOcorrenciasGroupKCAD_FUNCIONARIO: TStringField;
    sqlOcorrenciasGroupKZOO_TAREFA: TStringField;
    sqlOcorrenciasGroupNOMEFUNCIONARIO: TStringField;
    sqlOcorrenciasGroupSTATUSTAREFA: TIntegerField;
    sqlOcorrenciasGroupVEZAODIA: TIntegerField;
    sqlOcorrenciasGroupDL: TIntegerField;
    sqlOcorrenciasGroupNDC: TIntegerField;
    sqlOcorrenciasGroupOBS: TMemoField;
    cdsOcorrenciasGroupKZOO_OCORRENCIA: TStringField;
    cdsOcorrenciasGroupKMZOO_OCORRENCIA: TStringField;
    cdsOcorrenciasGroupDATA: TSQLTimeStampField;
    cdsOcorrenciasGroupCODIGO: TStringField;
    cdsOcorrenciasGroupDESCRICAO: TStringField;
    cdsOcorrenciasGroupSTATUS: TIntegerField;
    cdsOcorrenciasGroupDATATAREFA: TSQLTimeStampField;
    cdsOcorrenciasGroupKCAD_FUNCIONARIO: TStringField;
    cdsOcorrenciasGroupKZOO_TAREFA: TStringField;
    cdsOcorrenciasGroupNOMEFUNCIONARIO: TStringField;
    cdsOcorrenciasGroupSTATUSTAREFA: TIntegerField;
    cdsOcorrenciasGroupVEZAODIA: TIntegerField;
    cdsOcorrenciasGroupDL: TIntegerField;
    cdsOcorrenciasGroupNDC: TIntegerField;
    cdsOcorrenciasGroupOBS: TMemoField;
    cdsOcorrenciasGroupDESCRICAO_VEZES: TStringField;
    sqlOcorrenciasGroupDESCR_STATUS: TStringField;
    cdsOcorrenciasGroupDESCR_STATUS: TStringField;
    sqlOcorrenciasGroupTIPO: TStringField;
    cdsOcorrenciasGroupTIPO: TStringField;
    sqlOcorrenciasCronologicaOCORRENCIA: TStringField;
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
    procedure dspOcorrenciasGroupBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FInternalDataSource : TDataSource ;
    FOnAfterRefresh: TNotifyEvent;
    procedure SetMasterSource(const Value: TDataSource);
    procedure DoChangeOcorrencias(Sender: TObject; Field: TField);
    procedure SetOnAfterRefresh(const Value: TNotifyEvent);
    procedure InitDESCR_TIPO ;
    procedure SetDESCR_STATUS ;
  public
    { Public declarations }
   procedure ChangeOcorrencias ;
   procedure OpenTables ; Override ;
   procedure ApplyUpdates ; Override ;
   property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
   property OnAfterRefresh : TNotifyEvent   read FOnAfterRefresh write SetOnAfterRefresh;
   procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
   procedure ShowExclued ( AShow : boolean  ) ;
   procedure DeleteFromGroup ;

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
   if cdsOcorrenciasGroupTIPO.asString = 'D' then
      cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s', [ cdsOcorrenciasGroupDESCRICAO.asString ] )
   else if cdsOcorrenciasGroupTIPO.asString = 'P' then
      cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s', [ cdsOcorrenciasGroupCODIGO.asString ] )
   else if cdsOcorrenciasGroupVEZAODIA.asInteger > 1 then
    begin
      if cdsOcorrenciasGroupKZOO_TAREFA.IsNull then
        cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s (%da vez)', [ cdsOcorrenciasGroupDESCRICAO.asString, cdsOcorrenciasGroupVEZAODIA.asInteger ] )
      else
        cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s (%da vez)', [ cdsOcorrenciasGroupCODIGO.asString, cdsOcorrenciasGroupVEZAODIA.asInteger ] )
    end
   else
    begin
      if cdsOcorrenciasGroupKZOO_TAREFA.IsNull then
        cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s', [ cdsOcorrenciasGroupDESCRICAO.asString ] )
      else
        cdsOcorrenciasGroupDESCRICAO_VEZES.asString := Format ( '%s', [ cdsOcorrenciasGroupCODIGO.asString ] )
    end;
end;

procedure TdtmZoo_OcorrenciasAnimal.ChangeOcorrencias;
var
  LRecordGroup, LRecordCronologica : integer ;
begin
    if FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString = '' then
       exit ;

    LRecordGroup         := 0 ;
    LRecordCronologica   := 0 ;

    if (   cdsOcorrenciasGroup.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString
         = FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString
       ) then
       LRecordGroup         := cdsOcorrenciasGroup.Recno - 1;

    if (   cdsOcorrenciasCronologica.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString
         = FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString
       ) then
      LRecordCronologica   :=  cdsOcorrenciasCronologica.Recno - 1 ;

    cdsOcorrenciasGroup.Close ;
    cdsOcorrenciasGroup.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString :=
       FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString ;
    TCDSSuppl.Open ( cdsOcorrenciasGroup ) ;

    cdsOcorrenciasCronologica.Close ;
    cdsOcorrenciasCronologica.Params.ParamByName('KZOO_ANIMAL_FEMEA').AsString :=
       FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).asString ;

    TCDSSuppl.Open ( cdsOcorrenciasCronologica ) ;

    if Assigned ( self.FOnAfterRefresh ) then
       FOnAfterRefresh ( self ) ;

    if    ( LRecordGroup > 0 )
      and ( LRecordGroup <= cdsOcorrenciasGroup.RecordCount ) then
    cdsOcorrenciasGroup.Recno        := LRecordGroup ;

    if    ( LRecordCronologica > 0 )
      and ( LRecordCronologica <= cdsOcorrenciasCronologica.RecordCount ) then
    cdsOcorrenciasCronologica.Recno  := LRecordCronologica ;


end;

procedure TdtmZoo_OcorrenciasAnimal.DeleteFromGroup;
begin
     cdsOcorrenciasGroup.Delete ;
     CDSSuppl.TCDSSuppl.ApplyUpdates( cdsOcorrenciasGroup );
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
  LTableName : string ;
  LKeyField : string ;
  LKeyValue : string ;
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

  if (UpdateKind = ukInsert) then
    exit ;


  p := TParams.Create ;
  UpdateList := TStringList.Create ;

  if DeltaDS.FieldByName('TIPO').OldValue = 'D' then
    begin
     LTableName := 'ZOO_ANIMAL_DIAGNOSTICOS' ;
     LKeyField  := 'KZOO_ANIMAL_DIAGNOSTICO' ;
     if (UpdateKind = ukModify) then
       SetFieldsDiagnosticos ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'P' then
    begin
     LTableName := 'ZOO_ANIMAL_PROTOCOLOS' ;
     LKeyField  := 'KZOO_ANIMAL_PROTOCOLO' ;
     if (UpdateKind = ukModify) then
       SetFieldsProtocolos ;
    end
  else if ( DeltaDS.FieldByName('TIPO').OldValue = 'E' )
       or ( DeltaDS.FieldByName('TIPO').OldValue = 'T' )  then
    begin
     LTableName := 'ZOO_ANIMAL_TAREFAS' ;
     LKeyField  := 'KZOO_ANIMAL_TAREFA' ;
     if (UpdateKind = ukModify) then
       SetFieldsTarefas ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'X' then
    begin
     LTableName := 'ZOO_ANIMAL_TAREFAS' ;
     LKeyField  := 'KZOO_ANIMAL_TAREFA' ;
     if (UpdateKind = ukModify) then
       SetFieldsDescartes ;
    end
  else
    RaiseException( nil, UnitName, ClassName, 'Tipo de tabela ocorrências inválido' ) ;


  if (UpdateKind = ukDelete) then
    begin
      TTcAbstractDB.GetByAlias('ZOOTECNICO')
        .ISQL (
           Format (  'DELETE FROM %s WHERE %s = :%s'
                   , [
                       LTableName
                     , LKeyField
                     , LKeyField
                     ]
           )
        )
        .SQLParamValues(
                          LKeyField
                        , DeltaDS.FieldByName('RECORDKEY').OldValue
        )
        .SQLExec ;
      exit;
    end ;


  if p.Count <> 0  then
    begin
       p.CreateParam ( ftFixedChar, 'w' + LKeyField, ptInput ).AsString := DeltaDS.FieldByName('RECORDKEY').OldValue ;
       q := TSQLQuery.Create ( nil ) ;
       q.SQLConnection := sqlOcorrenciasCronologica.SQLConnection ;

       s := '' ;
       for x := 0 to UpdateList.Count - 1 do
         s := format ( '%s, %s', [s, UpdateList[ x ] ] ) ;

       System.Delete (s, 1, 1 ) ;

       q.SQL.Text := Format ( 'UPDATE %s SET %s WHERE %s = :w%s', [ LTableName, s, LKeyField, LKeyField ] ) ;
       q.Params.AssignValues( p ) ;
       q.ExecSQL ;
       q.free ;
    end ;

  p.free ;
  UpdateList.free ;

end;

procedure TdtmZoo_OcorrenciasAnimal.dspOcorrenciasGroupBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
   LTableName : string ;
   LKeyField  : string ;
begin

  Applied := True ;

  if (UpdateKind <> ukDelete)then
    exit ;

  if DeltaDS.FieldByName('TIPO').OldValue = 'D' then
    begin
     LTableName := 'ZOO_ANIMAL_DIAGNOSTICOS' ;
     LKeyField  := 'KZOO_ANIMAL_DIAGNOSTICO' ;
    end
  else if DeltaDS.FieldByName('TIPO').OldValue = 'P' then
    begin
     LTableName := 'ZOO_ANIMAL_PROTOCOLOS' ;
     LKeyField  := 'KZOO_ANIMAL_PROTOCOLO' ;
    end
  else if ( DeltaDS.FieldByName('TIPO').OldValue = 'E' )
       or ( DeltaDS.FieldByName('TIPO').OldValue = 'T' )
       or ( DeltaDS.FieldByName('TIPO').OldValue = 'X' )  then
    begin
     LTableName := 'ZOO_ANIMAL_TAREFAS' ;
     LKeyField  := 'KZOO_ANIMAL_TAREFA' ;
    end
  else
    RaiseException( nil, UnitName, ClassName, 'Tipo de tabela ocorrências inválido' ) ;


  TTcAbstractDB.GetByAlias('ZOOTECNICO')
    .ISQL (
       Format (  'DELETE FROM %s WHERE %s = :%s'
               , [
                   LTableName
                 , LKeyField
                 , LKeyField
                 ]
       )
    )
    .SQLParamValues(
                      LKeyField
                    , DeltaDS.FieldByName('KZOO_OCORRENCIA').OldValue
    )
    .SQLExec ;

end;

procedure TdtmZoo_OcorrenciasAnimal.InitDESCR_TIPO;
begin
  if cdsOcorrenciasCronologicaTIPO.asString = 'D' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Diagnóstico'
  else if cdsOcorrenciasCronologicaTIPO.asString = 'P' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Protocolo'
  else if cdsOcorrenciasCronologicaTIPO.asString = 'E' then
      cdsOcorrenciasCronologicaDESCR_TIPO.asString := 'Exame'
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

procedure TdtmZoo_OcorrenciasAnimal.SetOnAfterRefresh(const Value: TNotifyEvent);
begin
  FOnAfterRefresh := Value;
end;


procedure TdtmZoo_OcorrenciasAnimal.ShowExclued(AShow: boolean);
begin
   self.cdsOcorrenciasCronologica.Filtered := not AShow ;
end;

procedure TdtmZoo_OcorrenciasAnimal.sqlOcorrenciasGroupNOMETAREFAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
(*    KIQ
   if cdsOcorrenciasGroupVEZAODIA.asInteger > 1 then
      Text := Format ( '%s (%da vez)', [ cdsOcorrenciasGroupNOMETAREFA.asString, cdsOcorrenciasGroupVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s', [ cdsOcorrenciasGroupNOMETAREFA.asString ] )
    *)
end;


end.

