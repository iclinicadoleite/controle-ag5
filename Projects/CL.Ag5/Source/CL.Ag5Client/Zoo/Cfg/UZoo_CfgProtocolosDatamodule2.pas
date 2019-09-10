unit UZoo_CfgProtocolosDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TZoo_CfgProtocolosDatamodule2 = class(T_dtmBASE)
    cdsProtocolos: TClientDataSet;
    dspProtocolos: TDataSetProvider;
    sqlProtocolos: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlTarefas: TTcSQLDataSet;
    cdsTarefas: TClientDataSet;
    sqlProtocolosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosKZOO_PROTOCOLO: TStringField;
    sqlProtocolosCODIGO: TStringField;
    sqlProtocolosNOME: TStringField;
    sqlProtocolosATIVO: TStringField;
    cdsProtocolosCODIGO: TStringField;
    cdsProtocolosNOME: TStringField;
    cdsProtocolosATIVO: TStringField;
    cdsTiposProtocolo: TClientDataSet;
    cdsTiposProtocoloTIPO: TStringField;
    cdsTiposProtocoloVALOR: TStringField;
    cdsTiposProtocoloDESCRICAO: TStringField;
    cdsTiposProtocoloORDEM: TIntegerField;
    cdsProtocolosTIPOPROTOCOLO: TIntegerField;
    cdsProtocolosDESC_TIPOPROTOCOLO: TStringField;
    sqlProtocolosKCAD_FAZENDA: TStringField;
    sqlProtocolosINTERNAL: TStringField;
    cdsProtocolosKCAD_FAZENDA: TStringField;
    cdsProtocolosINTERNAL: TStringField;
    sqlTarefasKZOO_PROTOCOLO_TAREFA: TStringField;
    sqlTarefasKZOO_PROTOCOLO: TStringField;
    sqlTarefasKZOO_TAREFA: TStringField;
    sqlTarefasCODIGO: TStringField;
    sqlTarefasNOME: TStringField;
    sqlTarefasEXAME: TStringField;
    sqlTarefasATIVO: TStringField;
    sqlTarefasDIA: TIntegerField;
    sqlTarefasVEZES: TIntegerField;
    sqlTarefasREPLICAR: TIntegerField;
    sqlTarefasINTERVALO: TIntegerField;
    sqlTarefasOBS: TMemoField;
    sqlTarefasTIPOREC: TIntegerField;
    cdsTarefasTIPOREC: TIntegerField;
    cdsTarefasKZOO_PROTOCOLO_TAREFA: TStringField;
    cdsTarefasKZOO_PROTOCOLO: TStringField;
    cdsTarefasKZOO_TAREFA: TStringField;
    cdsTarefasCODIGO: TStringField;
    cdsTarefasNOME: TStringField;
    cdsTarefasEXAME: TStringField;
    cdsTarefasATIVO: TStringField;
    cdsTarefasDIA: TIntegerField;
    cdsTarefasVEZES: TIntegerField;
    cdsTarefasREPLICAR: TIntegerField;
    cdsTarefasINTERVALO: TIntegerField;
    cdsTarefasOBS: TMemoField;
    cdsTarefasKMZOO_PROTOCOLO_TAREFA: TStringField;
    DataSource1: TDataSource;
    cdsProtocolossqlTarefas: TDataSetField;
    cdsTarefasTAREFAS_NO_DIA: TAggregateField;
    sqlProtocolosTIPOPROTOCOLO: TIntegerField;
    sqlTarefasKMZOO_PROTOCOLO_TAREFA: TStringField;
    procedure cdsProtocolosNewRecord(DataSet: TDataSet);
    procedure cdsTarefasNewRecord(DataSet: TDataSet);
    procedure cdsProtocolosBeforeOpen(DataSet: TDataSet);
    procedure cdsTarefasBeforePost(DataSet: TDataSet);
    procedure cdsTarefasCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsTarefasNOMESetText(Sender: TField; const Text: string);
    procedure cdsTarefasEXAMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasDIAValidate(Sender: TField);
    procedure cdsProtocolosBeforeDelete(DataSet: TDataSet);
    procedure cdsProtocolosCODIGOValidate(Sender: TField);
    procedure cdsProtocolosCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsProtocolosNOMEValidate(Sender: TField);
    procedure cdsProtocolosNOMESetText(Sender: TField; const Text: string);
    procedure dtsListDataChange(Sender: TObject; Field: TField);
    procedure cdsTarefasCODIGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dspProtocolosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsTarefasATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dspProtocolosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
  private
    FOnNofifyTarefasUpdate: TNotifyEvent;
    { Private declarations }
    procedure SetParams ;
    procedure SetOnNofifyTarefasUpdate(const Value: TNotifyEvent);
    procedure DoNotifyTarefasUpdate ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function CheckProtocoloInUse : boolean ;
    procedure insereTarefa (
     const ADia : integer
   ; const AKey
         , ACodigo
         , ANome: string
   ; const AExame : Boolean
   ; const AObservacao : string
   ; const AAppend : boolean = false
   );
    procedure DeleteTarefa ;
    property OnNofifyTarefasUpdate : TNotifyEvent  read FOnNofifyTarefasUpdate write SetOnNofifyTarefasUpdate;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico,
     GuidSuppl,
     Exceptions,
     Tc.RTL.StringUtils, CdsSuppl ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_CfgProtocolosDatamodule2.OpenTables;
begin
//  inherited;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( 'TIPO_PROTOCOLO', cdsTiposProtocolo ) ;
//  TCDSSuppl.Open ( cdsProtocolos );
  cdsProtocolos.Open ;
//  TCDSSuppl.Open ( cdsTarefas );
end;


procedure TZoo_CfgProtocolosDatamodule2.SetOnNofifyTarefasUpdate(
  const Value: TNotifyEvent);
begin
  FOnNofifyTarefasUpdate := Value;
end;

procedure TZoo_CfgProtocolosDatamodule2.SetParams;
begin
    cdsProtocolos.params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosBeforeDelete(
  DataSet: TDataSet);
const
   _SQL_DIAGNOSTICOS_ASSOCIDADOS =
         'DISTINCT D.CODIGO, D.NOME, D.ATIVO FROM ZOO_DIAGNOSTICO_PROTOCOLOS P' +
   #13#10'LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = P.KZOO_DIAGNOSTICO' +
   #13#10'WHERE D.KCAD_FAZENDA = :KCAD_FAZENDA and P.KZOO_PROTOCOLO = :KZOO_PROTOCOLO' ;

var
  cds : TClientDataSet ;
  ErrStr : String ;
  p : TParams ;
begin
   ErrStr :='' ;

   try
     cds := nil ;
     p := TParams.Create ;
     p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsProtocolosKCAD_FAZENDA.asString ;
     p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := cdsProtocolosKZOO_PROTOCOLO.asString ;
     DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_DIAGNOSTICOS_ASSOCIDADOS, p ) ;

     with cds do
         while not cds.eof do
           begin
              ErrStr := ErrStr + FieldByName( 'CODIGO' ).AsString + ' - ' + FieldByName( 'NOME' ).AsString ;
              if not FieldByName( 'ATIVO' ).asBoolean then
                 ErrStr := ErrStr + ' (Inativo)';
              ErrStr := ErrStr + #13#10;
              next ;
           end;
     if ErrStr <> '' then
        raise Warning.Create('Protocolo associado a Diagnóstico(s)/Evento(s). Não é possível excluir.' + #13#10 + ErrStr );
   finally
         p.free ;
         cds.free ;
   end;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosCODIGOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text ) ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosCODIGOValidate(
  Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLOS WHERE KCAD_FAZENDA = :p1 and CODIGO collate pt_br = :p2 and KZOO_PROTOCOLO <> :p3' ;
   q.ParamByName('p1').asString := cdsProtocolosKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsProtocolosKZOO_PROTOCOLO.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Protocolo já existente.');
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsProtocolosKCAD_FAZENDA.Value            := LoggedUser.DomainID ;
//  cdsProtocoloKZOO_CFGTIPOPROTOCOLO.Value   := cdsTiposProtocoloKZOO_CFGTIPOPROTOCOLO.Value ;
  cdsProtocolosTIPOPROTOCOLO.AsInteger       := 1 ;
  cdsProtocolosATIVO.asString                := 'T' ;
  cdsProtocolosINTERNAL.asString             := 'F' ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosNOMESetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text ) ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsProtocolosNOMEValidate(
  Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLOS WHERE KCAD_FAZENDA = :p1 and NOME collate pt_br = :p2 and KZOO_PROTOCOLO <> :p3' ;
   q.ParamByName('p1').asString := cdsProtocolosKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsProtocolosKZOO_PROTOCOLO.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Protocolo já existente com a mesma descrição.');
 finally
    q.free ;
 end;

end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.DataSet.IsEmpty then
    exit ;
  if DisplayText then
    begin
    if Sender.AsString = 'T' then
      Text := ' X '
    else
      Text := '   '
    end
  else
    Text := Sender.AsString ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasBeforePost(DataSet: TDataSet);
begin
  if  (cdsTarefasTIPOREC.asInteger <> 1) and (cdsTarefasKZOO_TAREFA.asString = '') then
    raise Warning.Create('Tarefa não é válida. Execute a pesquisa de tarefas.');
//  if Pos( 'KZOO_TAREFA', E.Message ) <> 0 then
//     raise Warning.Create('Tarefa inválida, pesquise a tarefa.') ;
end;


procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasNewRecord(DataSet: TDataSet);
begin
  inherited;
  //GetKey ( cdsTarefasKZOO_PROTOCOLO_TAREFA ) ;
  cdsTarefasKZOO_PROTOCOLO_TAREFA.asString := GuidSuppl.GuidStr20 ;
  cdsTarefasKZOO_PROTOCOLO.asString := cdsProtocolosKZOO_PROTOCOLO.asString ;
  cdsTarefasTIPOREC.AsInteger     := 2 ;
  cdsTarefasDIA.AsInteger         := 1 ;
  cdsTarefasVEZES.AsInteger       := 1 ;
  cdsTarefasREPLICAR.AsInteger    := 0 ;
  cdsTarefasINTERVALO.AsInteger   := 1 ;
  cdsTarefasATIVO.asString        := 'T' ;
end;


procedure TZoo_CfgProtocolosDatamodule2.DeleteTarefa;
var
  KM : string ;
  LRecNo : integer ;
  LVezes : integer ;
begin
  if cdsTarefas.Eof then
    exit ;

  LRecNo := cdsTarefas.RecNo ;
  cdsProtocolos.Edit ;
  cdsTarefas.RecNo := LRecNo ;

  cdsTarefas.DisableControls ;
  KM := cdsTarefasKMZOO_PROTOCOLO_TAREFA.asString ;
  cdsTarefas.Delete ;
  LRecNo := cdsTarefas.RecNo ;
  cdsTarefas.Locate('KZOO_PROTOCOLO_TAREFA', KM, []) ;
  cdsTarefas.Edit ;
  cdsTarefasVEZES.asInteger := cdsTarefasVEZES.asInteger - 1 ;
  cdsTarefas.Post ;
  LVezes := cdsTarefasVEZES.asInteger ;
  if LVezes = 0 then
    cdsTarefas.Delete
  else
    cdsTarefas.RecNo := LRecNo  ;
  cdsTarefas.EnableControls ;
  cdsTarefas.Close ;
  cdsTarefas.Open ;
  if LRecNo < cdsTarefas.RecordCount then
    cdsTarefas.RecNo := LRecNo  ;
  DoNotifyTarefasUpdate ;
end;

procedure TZoo_CfgProtocolosDatamodule2.DoNotifyTarefasUpdate;
begin
   if Assigned ( FOnNofifyTarefasUpdate ) then
      FOnNofifyTarefasUpdate( self ) ;
end;

procedure TZoo_CfgProtocolosDatamodule2.dspProtocolosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
const
  _INSERT =
         'UPDATE OR INSERT INTO ZOO_PROTOCOLO_TAREFAS'
  +#13#10'('
  +#13#10'   KZOO_PROTOCOLO_TAREFA'
  +#13#10',  KZOO_PROTOCOLO'
  +#13#10',  KZOO_TAREFA'
  +#13#10',  EXAME'
  +#13#10',  DIA'
  +#13#10',  VEZES'
  +#13#10',  REPLICAR'
  +#13#10',  INTERVALO'
  +#13#10')'
  +#13#10'VALUES'
  +#13#10'('
  +#13#10'  :KZOO_PROTOCOLO_TAREFA'
  +#13#10', :KZOO_PROTOCOLO'
  +#13#10', :KZOO_TAREFA'
  +#13#10', :EXAME'
  +#13#10', :DIA'
  +#13#10', :VEZES'
  +#13#10', :REPLICAR'
  +#13#10', :INTERVALO'
  +#13#10')'
  +#13#10'MATCHING'
  +#13#10'('
  +#13#10' KZOO_PROTOCOLO_TAREFA'
  +#13#10')' ;

 _DELETE =
         'DELETE'
  +#13#10'FROM ZOO_PROTOCOLO_TAREFAS'
  +#13#10'WHERE'
  +#13#10' KZOO_PROTOCOLO_TAREFA = :KZOO_PROTOCOLO_TAREFA' ;

begin

 if (SourceDS = sqlTarefas) then
   begin
    Applied := (DeltaDS.FieldByName('TIPOREC' ).asInteger = 0)
          or   (DeltaDS.FieldByName('TIPOREC' ).asInteger = 1) ;

    if not Applied then

     case UpdateKind of
       ukInsert, ukModify:
          TTcAbstractDB.GetByAlias('ZOOTECNICO')
            .ISQL( _INSERT )
            .SQLParamValues( 'KZOO_PROTOCOLO_TAREFA',   DeltaDS.FieldByName( 'KZOO_PROTOCOLO_TAREFA' ).asString )
            .SQLParamValues( 'KZOO_PROTOCOLO',          DeltaDS.FieldByName( 'KZOO_PROTOCOLO'        ).asString )
            .SQLParamValues( 'KZOO_TAREFA',             DeltaDS.FieldByName( 'KZOO_TAREFA'           ).asString )
            .SQLParamValues( 'EXAME',                   DeltaDS.FieldByName( 'EXAME'                 ).asString )
            .SQLParamValues( 'DIA',                     DeltaDS.FieldByName( 'DIA'                   ).asInteger )
            .SQLParamValues( 'VEZES',                   DeltaDS.FieldByName( 'VEZES'                 ).asInteger )
            .SQLParamValues( 'REPLICAR',                DeltaDS.FieldByName( 'REPLICAR'              ).asInteger )
            .SQLParamValues( 'INTERVALO',               DeltaDS.FieldByName( 'INTERVALO'             ).asInteger )
            .SQLExec ;
       ukDelete:
          TTcAbstractDB.GetByAlias('ZOOTECNICO')
            .ISQL( _DELETE )
            .SQLParamValues( 'KZOO_PROTOCOLO_TAREFA',   DeltaDS.FieldByName( 'KZOO_PROTOCOLO_TAREFA' ).OldValue )
            .SQLExec ;
     end;

    Applied := True ;

   end;

end;

procedure TZoo_CfgProtocolosDatamodule2.dspProtocolosGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin

  if DataSet = sqlTarefas then
   TableName := 'ZOO_PROTOCOLO_TAREFAS' ;

end;

procedure TZoo_CfgProtocolosDatamodule2.dtsListDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned(Field) then
   begin
     cdsTarefas.Close ;
     cdsTarefas.Open  ;
     DoNotifyTarefasUpdate ;
   end;
end;

procedure TZoo_CfgProtocolosDatamodule2.insereTarefa(
     const ADia : integer
   ; const AKey
         , ACodigo
         , ANome: string
   ; const AExame : Boolean
   ; const AObservacao : string
   ; const AAppend : boolean = false
   );
var
  KM : string ;
begin

    dtsList.OnDataChange := nil ;
    if cdsTarefas.Locate('TIPOREC;DIA', VarArrayOf( [ 1, ADia ] ), []) then
      begin
        cdsTarefas.Edit ;
        cdsTarefasVEZES.asInteger := cdsTarefasVEZES.asInteger + 1 ;
        KM := cdsTarefasKZOO_PROTOCOLO_TAREFA.asString ;
        cdsTarefas.Post ;
      end
    else
      begin
        cdsTarefas.Append ;
        cdsTarefasTIPOREC.asInteger := 1 ;
        cdsTarefasDIA.asInteger := ADia ;
        cdsTarefasNOME.asString := ADia.ToString ;
        cdsTarefasVEZES.asInteger := 1 ;
        KM := cdsTarefasKZOO_PROTOCOLO_TAREFA.asString ;
        //KM :=             ADia.ToString.PadLeft( 3, '0' ) + cdsTarefasKZOO_PROTOCOLO_TAREFA.asString ;
        //cdsTarefasKMZOO_PROTOCOLO_TAREFA.asString := KM ;
        cdsTarefas.Post ;
      end;

    if AAppend then
      cdsTarefas.append
    else if not ( cdsTarefas.State in [dsInsert, dsEdit] ) then
      cdsTarefas.Edit ;

   cdsTarefasKMZOO_PROTOCOLO_TAREFA.asString := KM ;
   cdsTarefasKZOO_TAREFA.asString  := AKey ;
   cdsTarefasTIPOREC.asInteger     := 2 ;
   cdsTarefasDIA.asInteger         := ADia ;
   cdsTarefasCODIGO.asString       := ACodigo ;
   cdsTarefasNOME.asString         := ANome ;
   cdsTarefasOBS.asString          := AObservacao ;
   if   AExame Then cdsTarefasEXAME.asString := 'T'
   else            cdsTarefasEXAME.asString := 'F' ;
   cdsTarefas.Post ;

   cdsTarefas.Close ;
   cdsTarefas.Open ;
   DoNotifyTarefasUpdate ;
   dtsList.OnDataChange :=  dtsListDataChange
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasCODIGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  LTipoRec, x : integer ;
  LAggTarefas : TAggregateField ;
begin
  LTipoRec := Sender.DataSet.FieldByName( 'TIPOREC' ).asInteger ;
  x := Sender.DataSet.FieldByName( 'VEZES' ).asInteger ;

//  LAggTarefas := TAggregateField ( Sender.DataSet.FieldByName( 'TAREFAS_NO_DIA' ) )  ;

  if (LTipoRec = 1) then
   begin
    if x = 0 then
      Text := 'nenhuma tarefa'
    else if x = 1 then
       Text := '1 Tarefa'
    else
       Text := Format ( '%d Tarefas', [ x ] )
   end
  else if (LTipoRec = 2) then
    Text := Sender.asString ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasCODIGOSetText(Sender: TField;
  const Text: string);
begin
  cdsTarefasKZOO_TAREFA.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasDIAValidate(Sender: TField);
begin
  if sender.AsInteger < 1 then
    raise Warning.Create('Valor inválido');
end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasNOMESetText(Sender: TField;
  const Text: string);
begin
  cdsTarefasKZOO_TAREFA.Clear ;
  Sender.AsString := Text ;
end;


procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasOBSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

function TZoo_CfgProtocolosDatamodule2.CheckProtocoloInUse: boolean;
const
 _SQL_PROTOCOLO_EM_USO =
         'SELECT 1 RESULT FROM ZOO_ANIMAL_PROTOCOLOS P'
  +#13#10'LEFT JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = P.KZOO_ANIMAL_FEMEA'
  +#13#10'WHERE P.KZOO_PROTOCOLO = :KZOO_PROTOCOLO AND A.KCAD_FAZENDA = :KCAD_FAZENDA'
  +#13#10'ROWS 1' ;
var

  CDS : TClientDataSet ;
  p : TParams ;

begin

  cds := nil ;
  p := TParams.Create ;
  p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsProtocolosKCAD_FAZENDA.asString ;
  p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := cdsProtocolosKZOO_PROTOCOLO.asString ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_PROTOCOLO_EM_USO, p ) ;
  Result := cds.FieldByName( 'RESULT' ).asInteger = 1 ;
  cds.free ;
  p.Free ;

end;

procedure TZoo_CfgProtocolosDatamodule2.cdsTarefasEXAMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.asBoolean then Text := 'Exame'
   else Text := 'Tarefa' ;
end;

end.
