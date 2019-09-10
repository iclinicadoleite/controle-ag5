unit UZoo_CfgProtocolosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TZoo_CfgProtocolosDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstProtocolos: TClientDataSet;
    cdsProtocolo: TClientDataSet;
    dspLstProtocolos: TDataSetProvider;
    dspProtocolo: TDataSetProvider;
    sqlLstProtocolos: TTcSQLDataSet;
    sqlProtocolo: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlTarefas: TTcSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsTarefas: TClientDataSet;
    sqlLstProtocolosKZOO_PROTOCOLO: TStringField;
    cdsLstProtocolosKZOO_PROTOCOLO: TStringField;
    sqlProtocoloKZOO_PROTOCOLO: TStringField;
    sqlProtocoloKCAD_FAZENDA: TStringField;
    cdsProtocoloKZOO_PROTOCOLO: TStringField;
    cdsProtocoloKCAD_FAZENDA: TStringField;
    sqlLstProtocolosCODIGO: TStringField;
    sqlLstProtocolosNOME: TStringField;
    sqlLstProtocolosATIVO: TStringField;
    cdsLstProtocolosCODIGO: TStringField;
    cdsLstProtocolosNOME: TStringField;
    cdsLstProtocolosATIVO: TStringField;
    sqlProtocoloCODIGO: TStringField;
    sqlProtocoloNOME: TStringField;
    sqlProtocoloDESCRICAO: TMemoField;
    sqlProtocoloATIVO: TStringField;
    sqlProtocoloINTERNAL: TStringField;
    cdsProtocoloCODIGO: TStringField;
    cdsProtocoloNOME: TStringField;
    cdsProtocoloDESCRICAO: TMemoField;
    cdsProtocoloATIVO: TStringField;
    cdsProtocoloINTERNAL: TStringField;
    sqlTarefasKZOO_PROTOCOLO_TAREFA: TStringField;
    sqlTarefasKZOO_PROTOCOLO: TStringField;
    sqlTarefasKZOO_TAREFA: TStringField;
    sqlTarefasNOME: TStringField;
    sqlTarefasREPLICAR: TIntegerField;
    sqlTarefasDIA: TIntegerField;
    cdsProtocolosqlTarefas: TDataSetField;
    cdsTarefasKZOO_PROTOCOLO_TAREFA: TStringField;
    cdsTarefasKZOO_PROTOCOLO: TStringField;
    cdsTarefasKZOO_TAREFA: TStringField;
    cdsTarefasNOME: TStringField;
    cdsTarefasREPLICAR: TIntegerField;
    cdsTarefasDIA: TIntegerField;
    cdsTiposProtocolo: TClientDataSet;
    cdsTiposProtocoloTIPO: TStringField;
    cdsTiposProtocoloVALOR: TStringField;
    cdsTiposProtocoloDESCRICAO: TStringField;
    cdsTiposProtocoloORDEM: TIntegerField;
    sqlLstProtocolosTIPOPROTOCOLO: TIntegerField;
    sqlLstProtocolosSYSUI: TStringField;
    sqlLstProtocolosSYSDI: TSQLTimeStampField;
    sqlLstProtocolosSYSUU: TStringField;
    sqlLstProtocolosSYSDU: TSQLTimeStampField;
    cdsLstProtocolosTIPOPROTOCOLO: TIntegerField;
    cdsLstProtocolosSYSUI: TStringField;
    cdsLstProtocolosSYSDI: TSQLTimeStampField;
    cdsLstProtocolosSYSUU: TStringField;
    cdsLstProtocolosSYSDU: TSQLTimeStampField;
    cdsLstProtocolosDESC_TIPOPROTOCOLO: TStringField;
    sqlProtocoloTIPOPROTOCOLO: TIntegerField;
    cdsProtocoloTIPOPROTOCOLO: TIntegerField;
    cdsProtocoloDESC_TIPOPROTOCOLO: TStringField;
    sqlTarefasVEZES: TIntegerField;
    cdsTarefasVEZES: TIntegerField;
    sqlTarefasATIVO: TStringField;
    cdsTarefasATIVO: TStringField;
    sqlTarefasCODIGO: TStringField;
    cdsTarefasCODIGO: TStringField;
    cdsTarefasEXAME: TStringField;
    sqlTarefasINTERVALO: TIntegerField;
    sqlTarefasOBS: TMemoField;
    cdsTarefasINTERVALO: TIntegerField;
    cdsTarefasOBS: TMemoField;
    cdsTarefasRECCOUNT: TStringField;
    procedure cdsLstProtocolosNewRecord(DataSet: TDataSet);
    procedure cdsProtocoloNewRecord(DataSet: TDataSet);
    procedure cdsTarefasNewRecord(DataSet: TDataSet);
    procedure cdsLstProtocolosBeforeOpen(DataSet: TDataSet);
    procedure cdsProtocoloCODIGOValidate(Sender: TField);
    procedure cdsTarefasBeforePost(DataSet: TDataSet);
    procedure cdsTarefasCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsTarefasNOMESetText(Sender: TField; const Text: string);
    procedure cdsProtocoloBeforeDelete(DataSet: TDataSet);
    procedure cdsTarefasEXAMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasDIAValidate(Sender: TField);
    procedure cdsProtocoloCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsProtocoloNOMESetText(Sender: TField; const Text: string);
    procedure cdsProtocoloNOMEValidate(Sender: TField);
    procedure cdsTarefasRECCOUNTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function CheckProtocoloInUse : boolean ;
    procedure insereTarefa ( Key : String ; Codigo, Nome : string ; Exame : Boolean ; Observacao : string ; AAppend : boolean = false );
    procedure DeleteTarefa ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico,
     Exceptions,
     Tc.RTL.StringUtils ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_CfgProtocolosDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( 'TIPO_PROTOCOLO', cdsTiposProtocolo ) ;
  inherited;
end;

procedure TZoo_CfgProtocolosDatamodule.SetParams;
begin
    cdsLstProtocolos.params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsLstProtocolosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsLstProtocolosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloBeforeDelete(
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
     p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsProtocoloKCAD_FAZENDA.asString ;
     p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := cdsProtocoloKZOO_PROTOCOLO.asString ;
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


procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloCODIGOSetText(Sender: TField;
  const Text: string);
begin
   Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text ) ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloCODIGOValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLOS WHERE KCAD_FAZENDA = :p1 and CODIGO collate pt_br = :p2 and KZOO_PROTOCOLO <> :p3' ;
   q.ParamByName('p1').asString := cdsProtocoloKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsProtocoloKZOO_PROTOCOLO.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Protocolo já existente.');
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsProtocoloKCAD_FAZENDA.Value            := LoggedUser.DomainID ;
//  cdsProtocoloKZOO_CFGTIPOPROTOCOLO.Value   := cdsTiposProtocoloKZOO_CFGTIPOPROTOCOLO.Value ;
  cdsProtocoloTIPOPROTOCOLO.AsInteger       := 1 ;
  cdsProtocoloATIVO.asString                := 'T' ;
  cdsProtocoloINTERNAL.asString             := 'F' ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloNOMESetText(Sender: TField;
  const Text: string);
begin
   Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text ) ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsProtocoloNOMEValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLOS WHERE KCAD_FAZENDA = :p1 and NOME collate pt_br = :p2 and KZOO_PROTOCOLO <> :p3' ;
   q.ParamByName('p1').asString := cdsProtocoloKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsProtocoloKZOO_PROTOCOLO.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Protocolo já existente com a mesma descrição.');
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasBeforePost(DataSet: TDataSet);
begin
  if cdsTarefasKZOO_TAREFA.asString = '' then
    raise Warning.Create('Tarefa não é válida. Execute a pesquisa de tarefas.');
//  if Pos( 'KZOO_TAREFA', E.Message ) <> 0 then
//     raise Warning.Create('Tarefa inválida, pesquise a tarefa.') ;
end;


procedure TZoo_CfgProtocolosDatamodule.cdsTarefasNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsTarefasKZOO_PROTOCOLO_TAREFA ) ;
  cdsTarefasDia.AsInteger         := 1 ;
  cdsTarefasVezes.AsInteger       := 1 ;
  cdsTarefasREPLICAR.AsInteger    := 0 ;
  cdsTarefasINTERVALO.AsInteger   := 1 ;
  cdsTarefasATIVO.asString        := 'T' ;
end;


procedure TZoo_CfgProtocolosDatamodule.DeleteTarefa;
begin
  if not cdsTarefas.Eof then
    cdsTarefas.Delete ;
end;

procedure TZoo_CfgProtocolosDatamodule.insereTarefa(Key, Codigo, Nome: string ; Exame : Boolean ; Observacao : string ; AAppend : boolean = false );
begin
    if AAppend then
      cdsTarefas.append
    else if not ( cdsTarefas.State in [dsInsert, dsEdit] ) then
      cdsTarefas.Edit ;
   cdsTarefasCODIGO.asString       := Codigo ;
   cdsTarefasNOME.asString         := Nome ;
   cdsTarefasOBS.asString          := Observacao ;
   if   Exame Then cdsTarefasEXAME.asString := 'T'
   else            cdsTarefasEXAME.asString := 'F' ;
   cdsTarefasKZOO_TAREFA.asString  := Key ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasCODIGOSetText(Sender: TField;
  const Text: string);
begin
  cdsTarefasKZOO_TAREFA.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasDIAValidate(Sender: TField);
begin
  if sender.AsInteger < 1 then
    raise Warning.Create('Valor inválido');
end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasNOMESetText(Sender: TField;
  const Text: string);
begin
  cdsTarefasKZOO_TAREFA.Clear ;
  Sender.AsString := Text ;
end;


procedure TZoo_CfgProtocolosDatamodule.cdsTarefasOBSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasRECCOUNTGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.DataSet.RecNo = -1 then
      Text := '<nova>'
   else
      Text := Format ( '%d/%d', [ Sender.DataSet.RecNo,Sender.DataSet.RecordCount ]  ) ;
end;

function TZoo_CfgProtocolosDatamodule.CheckProtocoloInUse: boolean;
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
  p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsProtocoloKCAD_FAZENDA.asString ;
  p.CreateParam ( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := cdsProtocoloKZOO_PROTOCOLO.asString ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_PROTOCOLO_EM_USO, p ) ;
  Result := cds.FieldByName( 'RESULT' ).asInteger = 1 ;
  cds.free ;
  p.Free ;

end;

procedure TZoo_CfgProtocolosDatamodule.cdsTarefasEXAMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.asBoolean then Text := 'Exame'
   else Text := 'Tarefa' ;
end;

end.
