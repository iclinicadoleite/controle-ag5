unit UZoo_CfgExamesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TZoo_CfgExamesDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstExames: TClientDataSet;
    cdsExame: TClientDataSet;
    dspLstExames: TDataSetProvider;
    dspExame: TDataSetProvider;
    sqlLstExames: TTcSQLDataSet;
    sqlExame: TTcSQLDataSet;
    dtsList: TDataSource;
    dtsSQLEdit: TDataSource;
    sqlLstExamesKZOO_TAREFA: TStringField;
    cdsLstExamesKZOO_TAREFA: TStringField;
    sqlExameKZOO_TAREFA: TStringField;
    sqlExameKCAD_FAZENDA: TStringField;
    cdsExameKZOO_TAREFA: TStringField;
    cdsExameKCAD_FAZENDA: TStringField;
    sqlExameCODIGO: TStringField;
    sqlExameNOME: TStringField;
    sqlExameDESCARTECARNE: TIntegerField;
    sqlExameDESCARTELEITE: TIntegerField;
    sqlExameDESCRICAO: TMemoField;
    sqlExameATIVO: TStringField;
    sqlExameINTERNAL: TStringField;
    cdsExameCODIGO: TStringField;
    cdsExameNOME: TStringField;
    cdsExameDESCARTECARNE: TIntegerField;
    cdsExameDESCARTELEITE: TIntegerField;
    cdsExameDESCRICAO: TMemoField;
    cdsExameATIVO: TStringField;
    cdsExameINTERNAL: TStringField;
    sqlLstExamesCODIGO: TStringField;
    sqlLstExamesNOME: TStringField;
    sqlLstExamesATIVO: TStringField;
    cdsLstExamesCODIGO: TStringField;
    cdsLstExamesNOME: TStringField;
    cdsLstExamesATIVO: TStringField;
    sqlLstExamesTIPOTAREFA: TIntegerField;
    sqlLstExamesDESCARTECARNE: TIntegerField;
    sqlLstExamesDESCARTELEITE: TIntegerField;
    sqlLstExamesSYSUI: TStringField;
    sqlLstExamesSYSDI: TSQLTimeStampField;
    sqlLstExamesSYSUU: TStringField;
    sqlLstExamesSYSDU: TSQLTimeStampField;
    cdsLstExamesTIPOTAREFA: TIntegerField;
    cdsLstExamesDESCARTECARNE: TIntegerField;
    cdsLstExamesDESCARTELEITE: TIntegerField;
    cdsLstExamesSYSUI: TStringField;
    cdsLstExamesSYSDI: TSQLTimeStampField;
    cdsLstExamesSYSUU: TStringField;
    cdsLstExamesSYSDU: TSQLTimeStampField;
    sqlExameTIPOTAREFA: TIntegerField;
    cdsExameTIPOTAREFA: TIntegerField;
    sqlLstExamesNOMEFUNCIONARIO: TStringField;
    sqlExameKCAD_FUNCIONARIO: TStringField;
    sqlExameNOMEFUNCIONARIO: TStringField;
    cdsExameKCAD_FUNCIONARIO: TStringField;
    cdsExameNOMEFUNCIONARIO: TStringField;
    sqlItens: TTcSQLDataSet;
    cdsItens: TClientDataSet;
    sqlItensKZOO_TAREFA_ITEM: TStringField;
    sqlItensKZOO_TAREFA: TStringField;
    sqlItensITEM: TStringField;
    sqlItensQTDE: TIntegerField;
    cdsExamesqlItens: TDataSetField;
    cdsItensKZOO_TAREFA_ITEM: TStringField;
    cdsItensKZOO_TAREFA: TStringField;
    cdsItensITEM: TStringField;
    cdsItensQTDE: TIntegerField;
    cdsLstExamesNOMEFUNCIONARIO: TStringField;
    cdsResultados: TClientDataSet;
    sqlResultados: TTcSQLDataSet;
    sqlResultadosKZOO_TAREFA_RESULTADO: TStringField;
    sqlResultadosKZOO_TAREFA: TStringField;
    sqlResultadosNOME: TStringField;
    sqlResultadosATIVO: TStringField;
    sqlResultadosINTERNAL: TStringField;
    cdsExamesqlResultados: TDataSetField;
    cdsResultadosKZOO_TAREFA_RESULTADO: TStringField;
    cdsResultadosKZOO_TAREFA: TStringField;
    cdsResultadosNOME: TStringField;
    cdsResultadosATIVO: TStringField;
    cdsResultadosINTERNAL: TStringField;
    sqlItensATIVO: TStringField;
    sqlItensINTERNAL: TStringField;
    cdsItensATIVO: TStringField;
    cdsItensINTERNAL: TStringField;
    procedure cdsLstExamesNewRecord(DataSet: TDataSet);
    procedure cdsExameNewRecord(DataSet: TDataSet);
    procedure cdsLstExamesBeforeOpen(DataSet: TDataSet);
    procedure cdsExameCODIGOValidate(Sender: TField);
    procedure sqlExameNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsLstExamesDESCARTECARNESetText(Sender: TField;
      const Text: string);
    procedure cdsLstExamesDESCARTELEITESetText(Sender: TField;
      const Text: string);
    procedure cdsItensNewRecord(DataSet: TDataSet);
    procedure cdsExameBeforeEdit(DataSet: TDataSet);
    procedure cdsExameNOMEValidate(Sender: TField);
    procedure cdsExameBeforeDelete(DataSet: TDataSet);
    procedure cdsExameBeforeInsert(DataSet: TDataSet);
    procedure cdsExameNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsExameCODIGOSetText(Sender: TField; const Text: string);
    procedure cdsExameNOMESetText(Sender: TField; const Text: string);
    procedure cdsItensITEMValidate(Sender: TField);
    procedure cdsItensITEMSetText(Sender: TField; const Text: string);
    procedure cdsItensBeforeInsert(DataSet: TDataSet);
    procedure cdsResultadosNewRecord(DataSet: TDataSet);
    procedure cdsResultadosBeforeInsert(DataSet: TDataSet);
    procedure cdsResultadosNOMEValidate(Sender: TField);
    procedure cdsResultadosNOMESetText(Sender: TField; const Text: string);
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
    procedure RemoveItem ;
    procedure RemoveResultado ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, Tc.RTL.StringUtils, UDBZootecnico, Exceptions;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_CfgExamesDatamodule.OpenTables;
begin
  self.FAllowChangeCodigo := True ;
  inherited;
  //
end;

procedure TZoo_CfgExamesDatamodule.RemoveItem;
begin
  if not cdsItens.isEmpty then
    cdsItens.Delete ;
end;

procedure TZoo_CfgExamesDatamodule.RemoveResultado;
begin
  if not cdsResultados.isEmpty then
    cdsResultados.Delete ;
end;

procedure TZoo_CfgExamesDatamodule.SetAllowChangeCodigo(const Value: boolean);
begin
  FAllowChangeCodigo := Value;
end;

procedure TZoo_CfgExamesDatamodule.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsExame.State in [dsInsert, dsEdit] ) then
      cdsExame.Edit ;
   cdsExameNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsExameKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_CfgExamesDatamodule.SetParams;
begin
  cdsLstExames.Params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgExamesDatamodule.sqlExameNOMEFUNCIONARIOSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  Sender.asString := Text ;
  cdsExameKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_CfgExamesDatamodule.cdsItensBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsExame.Bof and cdsExame.Eof ) then
    cdsExame.Append ;
end;

procedure TZoo_CfgExamesDatamodule.cdsItensITEMSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( Text ) ;
end;

procedure TZoo_CfgExamesDatamodule.cdsItensITEMValidate(Sender: TField);
var
   Clone : TClientDataSet ;
   DescricaoItem : string ;
begin

  DescricaoItem := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsItens, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_TAREFA_ITEM' ).Value <> cdsItensKZOO_TAREFA_ITEM.Value ) then
            begin

             if    ( FieldByName( 'ITEM' ).asString = DescricaoItem ) then
                 raise Warning.Create('Item já existente com a mesma descrição para este exame.');

            end;
          Next ;
        end;
    finally
      Clone.free ;
    end;
end ;


procedure TZoo_CfgExamesDatamodule.cdsItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetKey( cdsItensKZOO_TAREFA_ITEM );
  cdsItensKZOO_TAREFA.AsString := cdsExameKZOO_TAREFA.asString ;
  cdsItensATIVO.AsString := 'T' ;
  cdsItensINTERNAL.AsString := 'F' ;
end;

procedure TZoo_CfgExamesDatamodule.cdsLstExamesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_CfgExamesDatamodule.cdsLstExamesDESCARTECARNESetText(Sender: TField;
  const Text: string);
begin
  cdsLstExamesDESCARTECARNE.Text := Text  ;
  cdsExame.Edit ;
  cdsExameDESCARTECARNE.Text := Text  ;
  ApplyUpdates ;
end;

procedure TZoo_CfgExamesDatamodule.cdsLstExamesDESCARTELEITESetText(Sender: TField;
  const Text: string);
begin
  cdsLstExamesDESCARTELEITE.Text := Text  ;
  cdsExame.Edit ;
  cdsExameDESCARTELEITE.Text := Text  ;
  ApplyUpdates ;
end;

procedure TZoo_CfgExamesDatamodule.cdsLstExamesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_CfgExamesDatamodule.cdsResultadosBeforeInsert(DataSet: TDataSet);
begin
  if ( cdsExame.Bof and cdsExame.Eof ) then
    cdsExame.Append ;
end;

procedure TZoo_CfgExamesDatamodule.cdsResultadosNewRecord(DataSet: TDataSet);
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetKey( cdsResultadosKZOO_TAREFA_RESULTADO );
  cdsResultadosKZOO_TAREFA.AsString := cdsExameKZOO_TAREFA.asString ;
  cdsResultadosATIVO.AsString := 'T' ;
  cdsResultadosINTERNAL.AsString := 'F' ;
end;

procedure TZoo_CfgExamesDatamodule.cdsResultadosNOMESetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( Text ) ;
end;

procedure TZoo_CfgExamesDatamodule.cdsResultadosNOMEValidate(Sender: TField);
var
   Clone : TClientDataSet ;
   DescricaoItem : string ;
begin

  DescricaoItem := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsResultados, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_TAREFA_RESULTADO' ).Value <> cdsResultadosKZOO_TAREFA_RESULTADO.Value ) then
            begin

             if    ( FieldByName( 'NOME' ).asString = DescricaoItem ) then
                 raise Warning.Create('Resultado já existente para este exame.');

            end;
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameBeforeDelete(DataSet: TDataSet);
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
     p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := cdsExameKCAD_FAZENDA.asString ;
     p.CreateParam ( ftString, 'KZOO_TAREFA', ptInput ).asString := cdsExameKZOO_TAREFA.asString ; ;
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
        raise Warning.Create('Exame associado a protocolo(s). Não é possível excluir.'#13#10 + ErrStr );
   finally
         p.free ;
         cds.free ;
   end;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameBeforeEdit(DataSet: TDataSet);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_PROTOCOLO_TAREFAS T' +
     #13#10'LEFT JOIN ZOO_PROTOCOLOS P ON P.KZOO_PROTOCOLO = T.KZOO_PROTOCOLO' +
     #13#10'WHERE P.KCAD_FAZENDA = :p1 and T.KZOO_TAREFA = :p2' ;
   q.ParamByName('p1').asString := cdsExameKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := cdsLstExamesKZOO_TAREFA.asString ;
   q.Open ;
   FAllowChangeCodigo := q.FieldByName( 'RESULT' ).asInteger <> 1 ;
 finally
    q.free ;
 end;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  AllowChangeCodigo := True ;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameCODIGOSetText(Sender: TField;
  const Text: string);
begin
   Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( text )
end;

procedure TZoo_CfgExamesDatamodule.cdsExameCODIGOValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_TAREFAS WHERE KCAD_FAZENDA = :p1 and CODIGO collate pt_br = :p2 and KZOO_TAREFA <> :p3 AND TIPOTAREFA = -1' ;
   q.ParamByName('p1').asString := cdsExameKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsLstExamesKZOO_TAREFA.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Exame já existente.');
 finally
    q.free ;
 end;
end;


procedure TZoo_CfgExamesDatamodule.cdsExameNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsExameKCAD_FAZENDA.Value       := LoggedUser.DomainID ;
  cdsExameATIVO.asString           := 'T' ;
  cdsExameINTERNAL.asString        := 'F' ;
  cdsExameTIPOTAREFA.asInteger     := -1 ;
  cdsExameDESCARTECARNE.asInteger  := 0 ;
  cdsExameDESCARTELEITE.asInteger  := 0 ;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
   Sender.AsString := Text ;
   cdsExameKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameNOMESetText(Sender: TField;
  const Text: string);
begin
   Sender.asString := TStringSuppl.DoubleSpaceTrimmer ( Text ) ;
end;

procedure TZoo_CfgExamesDatamodule.cdsExameNOMEValidate(Sender: TField);
var
  q : TSQLQuery ;
begin
 try
   q := TSQLQuery.Create ( nil )  ;
   q.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ) ;
   q.sql.text := 'select FIRST 1 1 RESULT FROM ZOO_TAREFAS WHERE KCAD_FAZENDA = :p1 and NOME collate pt_br = :p2 and KZOO_TAREFA <> :p3 AND TIPOTAREFA = -1' ;
   q.ParamByName('p1').asString := cdsExameKCAD_FAZENDA.asString ;
   q.ParamByName('p2').asString := TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) ;
   q.ParamByName('p3').asString := cdsLstExamesKZOO_TAREFA.asString ;
   q.Open ;
   if q.FieldByName( 'RESULT' ).asInteger = 1 then
      raise Warning.Create('Exame já existente com a mesma descrição.');
 finally
    q.free ;
 end;
end;

end.
