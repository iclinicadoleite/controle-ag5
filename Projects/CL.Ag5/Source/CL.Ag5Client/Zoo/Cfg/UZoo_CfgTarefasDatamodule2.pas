unit UZoo_CfgTarefasDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TZoo_CfgTarefasDatamodule = class(T_dtmBASE)
    cdsTarefas: TClientDataSet;
    dspTarefas: TDataSetProvider;
    sqlTarefas: TTcSQLDataSet;
    sqlTarefasKZOO_TAREFA: TStringField;
    cdsTarefasKZOO_TAREFA: TStringField;
    sqlTarefasCODIGO: TStringField;
    sqlTarefasNOME: TStringField;
    sqlTarefasATIVO: TStringField;
    cdsTarefasCODIGO: TStringField;
    cdsTarefasNOME: TStringField;
    cdsTarefasATIVO: TStringField;
    cdsTiposTarefa: TClientDataSet;
    cdsTiposTarefaTIPO: TStringField;
    cdsTiposTarefaVALOR: TStringField;
    cdsTiposTarefaDESCRICAO: TStringField;
    cdsTiposTarefaORDEM: TIntegerField;
    sqlTarefasTIPOTAREFA: TIntegerField;
    sqlTarefasDESCARTECARNE: TIntegerField;
    sqlTarefasDESCARTELEITE: TIntegerField;
    cdsTarefasTIPOTAREFA: TIntegerField;
    cdsTarefasDESCARTECARNE: TIntegerField;
    cdsTarefasDESCARTELEITE: TIntegerField;
    cdsTarefasDESC_TIPOTAREFA: TStringField;
    sqlTarefasNOMEFUNCIONARIO: TStringField;
    cdsTarefasNOMEFUNCIONARIO: TStringField;
    sqlTarefasKCAD_FAZENDA: TStringField;
    sqlTarefasDESCRICAO: TMemoField;
    sqlTarefasKCAD_FUNCIONARIO: TStringField;
    sqlTarefasINTERNAL: TStringField;
    cdsTarefasKCAD_FAZENDA: TStringField;
    cdsTarefasDESCRICAO: TMemoField;
    cdsTarefasKCAD_FUNCIONARIO: TStringField;
    cdsTarefasINTERNAL: TStringField;
    procedure cdsTarefasNewRecord(DataSet: TDataSet);
    procedure cdsTarefasBeforeOpen(DataSet: TDataSet);
    procedure cdsItensBeforeInsert(DataSet: TDataSet);
    procedure cdsTarefasBeforeDelete(DataSet: TDataSet);
    procedure cdsTarefasBeforeEdit(DataSet: TDataSet);
    procedure cdsTarefasBeforeInsert(DataSet: TDataSet);
    procedure cdsTarefasCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsTarefasCODIGOValidate(Sender: TField);
    procedure cdsTarefasNOMESetText(Sender: TField; const Text: string);
    procedure cdsTarefasNOMEValidate(Sender: TField);
    procedure cdsTarefasNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
  private
    FAllowChangeCodigo: boolean;
    { Private declarations }
    procedure SetParams ;
    procedure SetAllowChangeCodigo(const Value: boolean);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    property AllowChangeCodigo : boolean  read FAllowChangeCodigo write SetAllowChangeCodigo;
  end;

implementation

uses Tc.DBRTL.AbstractDB, Tc.RTL.StringUtils, UDBZootecnico, Exceptions;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_CfgTarefasDatamodule.OpenTables;
begin
  self.FAllowChangeCodigo := True ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( 'TIPO_TAREFA', cdsTiposTarefa );

  inherited;
  //
end;


procedure TZoo_CfgTarefasDatamodule.SetAllowChangeCodigo(const Value: boolean);
begin
  FAllowChangeCodigo := Value;
end;

procedure TZoo_CfgTarefasDatamodule.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsTarefas.State in [dsInsert, dsEdit] ) then
      cdsTarefas.Edit ;
   cdsTarefasNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsTarefasKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_CfgTarefasDatamodule.SetParams;
begin
  cdsTarefas.Params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsItensBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsTarefas.Bof and cdsTarefas.Eof ) then
    cdsTarefas.Append ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasBeforeDelete(
  DataSet: TDataSet);
const
   _SQL_PROTOCOLOS_ASSOCIDADOS =
         'DISTINCT P.CODIGO, P.NOME, P.ATIVO FROM ZOO_PROTOCOLO_TAREFAS T' +
   #13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = T.KZOO_PROTOCOLO' +
   #13#10'WHERE P.KCAD_FAZENDA = :KCAD_FAZENDA and T.KZOO_TAREFA = :KZOO_TAREFA' ;

var
  cds : TClientDataSet ;
  ErrStr : String ;
  p : TParams ;
begin
   ErrStr :='' ;

   try
     cds := nil ;
     p := TParams.Create ;
     p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsTarefasKCAD_FAZENDA.asString ;
     p.CreateParam ( ftString, 'KZOO_TAREFA', ptInput ).asString := cdsTarefasKZOO_TAREFA.asString ; ;
     DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_PROTOCOLOS_ASSOCIDADOS, p ) ;

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
        raise Warning.Create('Tarefa associada a protocolo(s). Não é possível excluir.'#13#10 + ErrStr );
   finally
         p.free ;
         cds.free ;
   end;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasBeforeEdit(DataSet: TDataSet);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLO_TAREFAS T' +
     #13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = T.KZOO_PROTOCOLO' +
     #13#10'WHERE P.KCAD_FAZENDA = :p1 and T.KZOO_TAREFA = :p2' ;
   q.ParamByName('p1').asString := cdsTarefasKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := cdsTarefasKZOO_TAREFA.asString ;
   q.Open ;
   FAllowChangeCodigo := q.FieldByName( 'RESULT' ).asInteger <> 1 ;
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasBeforeInsert(
  DataSet: TDataSet);
begin
  AllowChangeCodigo := True ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasCODIGOSetText(Sender: TField;
  const Text: string);
begin
   Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text ) ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasCODIGOValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_TAREFAS WHERE KCAD_FAZENDA = :p1 and CODIGO collate pt_br = :p2 and KZOO_TAREFA <> :p3 AND TIPOTAREFA <> -1' ;
   q.ParamByName('p1').asString := cdsTarefasKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsTarefasKZOO_TAREFA.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Tarefa já existente.');
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsTarefasKCAD_FAZENDA.Value       := LoggedUser.DomainID ;
  cdsTarefasATIVO.asString           := 'T' ;
  cdsTarefasINTERNAL.asString        := 'F' ;
  cdsTarefasTIPOTAREFA.asInteger     := 1 ;
  cdsTarefasDESCARTECARNE.asInteger  := 0 ;
  cdsTarefasDESCARTELEITE.asInteger  := 0 ;
end;




procedure TZoo_CfgTarefasDatamodule.cdsTarefasNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
   Sender.AsString := Text ;
   cdsTarefasKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasNOMESetText(Sender: TField;
  const Text: string);
begin
    Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( Text ) ;
end;

procedure TZoo_CfgTarefasDatamodule.cdsTarefasNOMEValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_TAREFAS WHERE KCAD_FAZENDA = :p1 and NOME collate pt_br = :p2 and KZOO_TAREFA <> :p3 AND TIPOTAREFA <> -1' ;
   q.ParamByName('p1').asString := cdsTarefasKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsTarefasKZOO_TAREFA.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Tarefa já existente com a mesma descrição.');
 finally
    q.free ;
 end;
end;


end.
