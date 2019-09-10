unit UZoo_SanidadeBaixarTarefasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider ;

type
   TTipoLanctoTarefa = ( lpAnimal, lpTarefa, lpFuncionario  ) ;

  TZoo_SanidadeBaixarTarefasDatamodule = class(T_dtmBASE)
    cdsAnimaisTarefa: TClientDataSet;
    cdsTmp: TClientDataSet;
    sqlAnimaisTarefa: TTcSQLDataSet;
    cdsTarefasFuncionario: TClientDataSet;
    sqlTarefasFuncionario: TTcSQLDataSet;
    cdsTmpDATA: TSQLTimeStampField;
    sqlFuncionarios: TTcSQLDataSet;
    sqlTarefas: TTcSQLDataSet;
    dspFuncionarios: TDataSetProvider;
    dspTarefas: TDataSetProvider;
    cdsFuncionarios: TClientDataSet;
    cdsTarefas: TClientDataSet;
    dspTarefasAnimal: TDataSetProvider;
    dspAnimaisTarefa: TDataSetProvider;
    dspTarefasFuncionario: TDataSetProvider;
    sqlTarefasAnimalDATAPREVISTA: TSQLTimeStampField;
    sqlTarefasAnimalSTATUS: TIntegerField;
    sqlTarefasAnimalDATASTATUS: TSQLTimeStampField;
    cdsTarefasAnimal : TClientDataSet ;
    cdsTarefasAnimalCODIGO : TStringField ;
    cdsTarefasAnimalDATAPREVISTA: TSQLTimeStampField;
    cdsTarefasAnimalSTATUS: TIntegerField;
    cdsTarefasAnimalDATASTATUS: TSQLTimeStampField;
    sqlTarefasFuncionarioKZOO_TAREFA: TStringField;
    sqlTarefasFuncionarioBRINCO: TStringField;
    sqlTarefasFuncionarioNOMEESTABULO: TStringField;
    sqlTarefasFuncionarioCODIGO: TStringField;
    sqlTarefasFuncionarioNOME: TStringField;
    sqlTarefasFuncionarioDATAPREVISTA: TSQLTimeStampField;
    sqlTarefasFuncionarioSTATUS: TIntegerField;
    sqlTarefasFuncionarioDATASTATUS: TSQLTimeStampField;
    sqlTarefasFuncionarioKCAD_FUNCIONARIO: TStringField;
    sqlTarefasFuncionarioNOMEFUNCIONARIO: TStringField;
    cdsTarefasFuncionarioKZOO_TAREFA: TStringField;
    cdsTarefasFuncionarioBRINCO: TStringField;
    cdsTarefasFuncionarioNOMEESTABULO: TStringField;
    cdsTarefasFuncionarioCODIGO: TStringField;
    cdsTarefasFuncionarioNOME: TStringField;
    cdsTarefasFuncionarioDATAPREVISTA: TSQLTimeStampField;
    cdsTarefasFuncionarioSTATUS: TIntegerField;
    cdsTarefasFuncionarioDATASTATUS: TSQLTimeStampField;
    cdsTarefasFuncionarioKCAD_FUNCIONARIO: TStringField;
    cdsTarefasFuncionarioNOMEFUNCIONARIO: TStringField;
    sqlAnimaisTarefaKZOO_TAREFA: TStringField;
    sqlAnimaisTarefaBRINCO: TStringField;
    sqlAnimaisTarefaNOMEESTABULO: TStringField;
    sqlAnimaisTarefaCODIGO: TStringField;
    sqlAnimaisTarefaNOME: TStringField;
    sqlAnimaisTarefaDATAPREVISTA: TSQLTimeStampField;
    sqlAnimaisTarefaSTATUS: TIntegerField;
    sqlAnimaisTarefaDATASTATUS: TSQLTimeStampField;
    sqlAnimaisTarefaKCAD_FUNCIONARIO: TStringField;
    sqlAnimaisTarefaNOMEFUNCIONARIO: TStringField;
    cdsAnimaisTarefaKZOO_TAREFA: TStringField;
    cdsAnimaisTarefaBRINCO: TStringField;
    cdsAnimaisTarefaNOMEESTABULO: TStringField;
    cdsAnimaisTarefaCODIGO: TStringField;
    cdsAnimaisTarefaNOME: TStringField;
    cdsAnimaisTarefaDATAPREVISTA: TSQLTimeStampField;
    cdsAnimaisTarefaSTATUS: TIntegerField;
    cdsAnimaisTarefaDATASTATUS: TSQLTimeStampField;
    cdsAnimaisTarefaKCAD_FUNCIONARIO: TStringField;
    cdsAnimaisTarefaNOMEFUNCIONARIO: TStringField;
    sqlFuncionariosKCAD_FUNCIONARIO: TStringField;
    sqlFuncionariosNOMEFUNCIONARIO: TStringField;
    cdsFuncionariosKCAD_FUNCIONARIO: TStringField;
    cdsFuncionariosNOMEFUNCIONARIO: TStringField;
    sqlTarefasKZOO_TAREFA: TStringField;
    cdsTarefasKZOO_TAREFA: TStringField;
    cdsTmpKANIMAL: TStringField;
    cdsTmpKFUNCIONARIO: TStringField;
    cdsTmpKTAREFA: TStringField;
    cdsTmpNOMEFUNCIONARIO: TStringField;
    cdsStatusTarefa: TClientDataSet;
    cdsStatusTarefaTIPO: TStringField;
    cdsStatusTarefaVALOR: TStringField;
    cdsStatusTarefaDESCRICAO: TStringField;
    cdsStatusTarefaORDEM: TIntegerField;
    cdsTarefasAnimalDESCR_STATUS: TStringField;
    cdsAnimaisTarefaDESCR_STATUS: TStringField;
    cdsTarefasFuncionarioDESCR_STATUS: TStringField;
    sqlTarefasTAREFA: TStringField;
    cdsTarefasTAREFA: TStringField;
    cdsTmpDESCR_STATUS: TStringField;
    cdsTmpTAREFA: TStringField;
    cdsTmpSTATUS: TIntegerField;
    cdsTmpNOMEANIMAL: TStringField;
    sqlTarefasAnimalKZOO_ANIMAL_TAREFA: TStringField;
    sqlAnimaisTarefaKZOO_ANIMAL_TAREFA: TStringField;
    sqlTarefasFuncionarioKZOO_ANIMAL_TAREFA: TStringField;
    cdsTarefasAnimalKZOO_ANIMAL_TAREFA: TStringField;
    cdsAnimaisTarefaKZOO_ANIMAL_TAREFA: TStringField;
    cdsTarefasFuncionarioKZOO_ANIMAL_TAREFA: TStringField;
    sqlTarefasAnimalREEXECUTAR_EM: TSQLTimeStampField;
    sqlAnimaisTarefaREEXECUTAR_EM: TSQLTimeStampField;
    sqlTarefasFuncionarioREEXECUTAR_EM: TSQLTimeStampField;
    cdsTarefasAnimalREEXECUTAR_EM: TSQLTimeStampField;
    cdsAnimaisTarefaREEXECUTAR_EM: TSQLTimeStampField;
    cdsTarefasFuncionarioREEXECUTAR_EM: TSQLTimeStampField;
    sqlTarefasAnimalVEZAODIA: TIntegerField;
    sqlTarefasAnimalOBS: TMemoField;
    sqlAnimaisTarefaVEZAODIA: TIntegerField;
    sqlAnimaisTarefaOBS: TMemoField;
    sqlTarefasFuncionarioVEZAODIA: TIntegerField;
    sqlTarefasFuncionarioOBS: TMemoField;
    cdsTarefasAnimalVEZAODIA: TIntegerField;
    cdsTarefasAnimalOBS: TMemoField;
    cdsAnimaisTarefaVEZAODIA: TIntegerField;
    cdsAnimaisTarefaOBS: TMemoField;
    cdsTarefasFuncionarioVEZAODIA: TIntegerField;
    cdsTarefasFuncionarioOBS: TMemoField;
    procedure cdsTmpKFUNCIONARIOValidate(Sender: TField);
    procedure cdsTmpKTAREFAValidate(Sender: TField);
    procedure cdsTmpKANIMALValidate(Sender: TField);
    procedure cdsTarefasAnimalSTATUSValidate(Sender: TField);
    procedure cdsTarefasFuncionarioSTATUSValidate(Sender: TField);
    procedure cdsAnimaisTarefaSTATUSValidate(Sender: TField);
    procedure cdsTarefasAnimalDATASTATUSValidate(Sender: TField);
    procedure cdsAnimaisTarefaDATASTATUSValidate(Sender: TField);
    procedure cdsTarefasFuncionarioDATASTATUSValidate(Sender: TField);
    procedure cdsTmpDATAValidate(Sender: TField);
    procedure cdsTarefasAnimalNOMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnimaisTarefaNOMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasFuncionarioNOMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasAnimalOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnimaisTarefaOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasFuncionarioOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnimaisTarefaNOMEESTABULOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsTarefasAnimalBeforePost(DataSet: TDataSet);
    procedure cdsAnimaisTarefaBeforePost(DataSet: TDataSet);
    procedure cdsTarefasFuncionarioBeforePost(DataSet: TDataSet);
  private
    FTipoLanctoTarefa: TTipoLanctoTarefa;
    FData: TDateTime;
    { Private declarations }
    procedure SetTipoLanctoTarefa(const Value: TTipoLanctoTarefa);
    procedure SetData(const Value: TDateTime);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure cdsStatusTarefaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    function AddBrincoIndividual ( ABrinco : string  ) : boolean ;
    procedure ApplyUpdates ; override ;
    property TipoLanctoTarefa : TTipoLanctoTarefa  read FTipoLanctoTarefa write SetTipoLanctoTarefa;
    property Data : TDateTime  read FData write SetData;
    procedure SelectAllTarefasFuncionarios( AStatus : string ) ;
    procedure SelectAllTarefasColetivo( AStatus : string ) ;
    procedure ReOpen ;
  end;

implementation

uses Exceptions, CDSSuppl, UDBZootecnico, GuidSuppl, SQLTimSt ,
  ClAg5ClientZootecnicoCommonTypes,
  ProtocolosAnimalClass, CLAg5Types, ThreadSuppl ,
  TarefasAnimalClass, DateUtils ;

{$R *.dfm}

procedure TZoo_SanidadeBaixarTarefasDatamodule.OpenTables;
begin
   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_TAREFA, cdsStatusTarefa ) ;
   cdsStatusTarefa.OnFilterRecord := cdsStatusTarefaFilterRecord        ;
   cdsStatusTarefa.Filtered := True ;

   TCDSSuppl.CreateDataSet( cdsTmp ) ;
//  TCDSSuppl.CreateDataSet( cdsAnimalIndividual ) ;
//  TCDSSuppl.CreateDataSet( cdsTarefaColetivo   ) ;
end;


procedure TZoo_SanidadeBaixarTarefasDatamodule.ReOpen;
begin
  if cdsTarefasAnimal.Active then
    begin
     cdsTarefasAnimal.close;
     TCDSSuppl.Open (  cdsTarefasAnimal ) ;
    end;

  if cdsAnimaisTarefa.Active then
    begin
     cdsAnimaisTarefa.close;
     TCDSSuppl.Open (  cdsAnimaisTarefa ) ;
    end;

  if cdsTarefasFuncionario.Active then
    begin
     cdsTarefasFuncionario.close;
     TCDSSuppl.Open (  cdsTarefasFuncionario ) ;
    end;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.SelectAllTarefasColetivo(
  AStatus: string);
begin
  cdsAnimaisTarefa.DisableControls ;
  cdsAnimaisTarefa.First ;
  while not cdsAnimaisTarefa.Eof do
    begin
      cdsAnimaisTarefa.Edit ;
      cdsAnimaisTarefaDATASTATUS.asDateTime := Date ;
      cdsAnimaisTarefaSTATUS.AsString := AStatus ;
      cdsAnimaisTarefa.Post ;
      cdsAnimaisTarefa.Next ;
    end;
  cdsAnimaisTarefa.EnableControls ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.SelectAllTarefasFuncionarios(
  AStatus: string);
begin
  cdsTarefasFuncionario.DisableControls ;
  cdsTarefasFuncionario.First ;
  while not cdsTarefasFuncionario.Eof do
    begin
      cdsTarefasFuncionario.Edit ;
      cdsTarefasFuncionarioDATASTATUS.asDateTime := Date ;
      cdsTarefasFuncionarioSTATUS.AsString := AStatus ;
      cdsTarefasFuncionario.Post ;
      cdsTarefasFuncionario.Next ;
    end;
  cdsTarefasFuncionario.EnableControls ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.SetTipoLanctoTarefa(
  const Value: TTipoLanctoTarefa);
begin
  FTipoLanctoTarefa := Value;

  if cdsFuncionarios.Active then
    cdsFuncionarios.Close ;

  cdsFuncionarios.Params.ParamByName ( 'KCAD_FAZENDA' ).AsString := LoggedUser.DomainID ;
  cdsFuncionarios.Params.ParamByName ( 'DATA' ).AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay ( FData ) ) ;
  TCDSSuppl.Open (  cdsFuncionarios ) ;

  if cdsTarefas.Active then
    cdsTarefas.Close ;

  cdsTarefas.Params.ParamByName ( 'KCAD_FAZENDA' ).AsString := LoggedUser.DomainID ;
  cdsTarefas.Params.ParamByName ( 'DATA' ).AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay ( FData ) ) ;
  TCDSSuppl.Open (  cdsTarefas ) ;
end;




function TZoo_SanidadeBaixarTarefasDatamodule.AddBrincoIndividual(ABrinco: string): boolean;
var
    KeyAnimal : string ;
begin
    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;
    if Result then
     begin
       cdsTmp.Edit ;
       cdsTmpKANIMAL.AsString := KeyAnimal ;
       if cdsTmpSTATUS.isNull then
          cdsTmpSTATUS.asInteger := _ST_STATUS_TAREFA_EXECUTADA  ;

     end;
end;


procedure TZoo_SanidadeBaixarTarefasDatamodule.ApplyUpdates;
begin

  if TipoLanctoTarefa = lpAnimal then
    begin
      TCDSSuppl.ApplyUpdates ( cdsTarefasAnimal ) ;
    end
  else if TipoLanctoTarefa = lpTarefa then
    begin
      TCDSSuppl.ApplyUpdates ( cdsAnimaisTarefa ) ;
    end
  else  //lpFuncionario
    begin
      TCDSSuppl.ApplyUpdates ( cdsTarefasFuncionario ) ;
    end
end;


procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaBeforePost(
  DataSet: TDataSet);
begin
   if   ( DataSet.fieldByName ( 'STATUS' ).asInteger <> _ST_STATUS_TAREFA_PENDENTE )
   and  ( DataSet.fieldByName ( 'DATASTATUS' ).IsNull ) then
      raise Warning.Create('Informar a data de baixa da tarefa');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaDATASTATUSValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data não pode ser superior a data atual');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaNOMEESTABULOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsAnimaisTarefaVEZAODIA.asInteger > 1 then
      Text := Format ( '%s (%da vez)', [ Sender.asString, cdsAnimaisTarefaVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s', [ Sender.asString ] )
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaNOMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsAnimaisTarefaVEZAODIA.asInteger > 1 then
      Text := Format ( '%s (%da vez)', [ Sender.asString, cdsAnimaisTarefaVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s', [ Sender.asString ] )
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaOBSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsAnimaisTarefaSTATUSValidate(
  Sender: TField);
begin
  if Sender.asInteger = _ST_STATUS_TAREFA_PENDENTE then
    cdsAnimaisTarefaDATASTATUS.Clear
  else
    if not ( cdsTmpDATA.IsNull ) or ( cdsTmpDATA.AsDateTime > 1 ) then
      cdsAnimaisTarefaDATASTATUS.AsDateTime := cdsTmpDATA.AsDateTime
    else
      cdsAnimaisTarefaDATASTATUS.AsDateTime := Date ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsStatusTarefaFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept :=  (cdsStatusTarefaTIPO.asString = _ST_STATUS_TAREFA)
          and (cdsStatusTarefaVALOR.asInteger < _ST_STATUS_TAREFA_INTERROMPIDA) ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimalBeforePost(
  DataSet: TDataSet);
begin
   if   ( DataSet.fieldByName ( 'STATUS' ).asInteger <> _ST_STATUS_TAREFA_PENDENTE )
   and  ( DataSet.fieldByName ( 'DATASTATUS' ).IsNull ) then
      raise Warning.Create('Informar a data de baixa da tarefa');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimalDATASTATUSValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data não pode ser superior a data atual');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimalNOMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsTarefasAnimalVEZAODIA.asInteger > 1 then
      Text := Format ( '%s - %s (%da vez)', [ cdsTarefasAnimalCODIGO.asString, Sender.asString, cdsTarefasAnimalVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s - %s', [ cdsTarefasAnimalCODIGO.asString, Sender.asString ] )
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimalOBSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasAnimalSTATUSValidate(
  Sender: TField);
begin
  if Sender.asInteger =  _ST_STATUS_TAREFA_PENDENTE then
    cdsTarefasAnimalDATASTATUS.Clear
  else
    if not ( cdsTmpDATA.IsNull ) or ( cdsTmpDATA.AsDateTime > 1 ) then
      cdsTarefasAnimalDATASTATUS.AsDateTime := cdsTmpDATA.AsDateTime
    else
      cdsTarefasAnimalDATASTATUS.AsDateTime := Date ;

end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionarioBeforePost(
  DataSet: TDataSet);
begin
   if   ( DataSet.fieldByName ( 'STATUS' ).asInteger <> _ST_STATUS_TAREFA_PENDENTE )
   and  ( DataSet.fieldByName ( 'DATASTATUS' ).IsNull ) then
      raise Warning.Create('Informar a data de baixa da tarefa');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionarioDATASTATUSValidate(
  Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data não pode ser superior a data atual');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionarioNOMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsTarefasFuncionarioVEZAODIA.asInteger > 1 then
      Text := Format ( '%s - %s (%da vez)', [ cdsTarefasFuncionarioCODIGO.asString, Sender.asString, cdsTarefasFuncionarioVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s - %s', [ cdsTarefasFuncionarioCODIGO.asString, Sender.asString ] )
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionarioOBSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTarefasFuncionarioSTATUSValidate(
  Sender: TField);
begin
  if Sender.asInteger =  _ST_STATUS_TAREFA_PENDENTE then
    cdsTarefasFuncionarioDATASTATUS.Clear
  else
    if not ( cdsTmpDATA.IsNull ) or ( cdsTmpDATA.AsDateTime > 1 ) then
      cdsTarefasFuncionarioDATASTATUS.AsDateTime := cdsTmpDATA.AsDateTime
    else
      cdsTarefasFuncionarioDATASTATUS.AsDateTime := Date ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTmpDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime < 1 then
    raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
    raise Warning.Create('Data superior a data atual');
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTmpKANIMALValidate(Sender: TField);
var
  cds : TClientDataSet ;
  p : TParams ;
const
  _DADOS_ANIMAL = 'SELECT BRINCO, NOMEESTABULO, NOMECOMPLETO FROM ZOO_ANIMAIS WHERE KZOO_ANIMAL = :KZOO_ANIMAL' ;
begin
//   ThreadSuppl.TSyncThread.Create(  UpdateListaDadosIndividual )

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).AsString := cdsTmpKANIMAL.asString ;

  cds := nil ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cds, _DADOS_ANIMAL, p ) ;
  cdsTmpNOMEANIMAL.AsString := Format ( '%s - %s ( %s )',
   [ cds.FieldByName( 'BRINCO' ).AsString,
     cds.FieldByName( 'NOMEESTABULO' ).AsString,
     cds.FieldByName( 'NOMECOMPLETO' ).AsString ] ) ;
  p.Free ;

  cdsTarefasAnimal.Close ;
  cdsTarefasAnimal.Params.ParamByName ( 'KZOO_ANIMAL'     ).AsString        := cdsTmpKANIMAL.asString ;
  cdsTarefasAnimal.Params.ParamByName ( 'DATA'            ).AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay ( FData ) ) ;
  cdsTarefasAnimal.Params.ParamByName ( 'STATUS_PENDENTE' ).asInteger       := _ST_STATUS_TAREFA_PENDENTE ;
  TCDSSuppl.Open (  cdsTarefasAnimal ) ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTmpKFUNCIONARIOValidate(Sender: TField);
begin
  cdsTarefasFuncionario.Close ;
  cdsTarefasFuncionario.Params.ParamByName ( 'KCAD_FAZENDA'      ).AsString       := LoggedUser.DomainID ;
  cdsTarefasFuncionario.Params.ParamByName ( 'STATUS_DESCARTADO' ).asInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
  cdsTarefasFuncionario.Params.ParamByName ( 'KCAD_FUNCIONARIO'  ).AsString       := cdsTmpKFUNCIONARIO.AsString ;
  cdsTarefasFuncionario.Params.ParamByName ( 'DATA'              ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay ( FData ) ) ;
  cdsTarefasFuncionario.Params.ParamByName ( 'STATUS_PENDENTE'   ).asInteger      := _ST_STATUS_TAREFA_PENDENTE ;
  TCDSSuppl.Open (  cdsTarefasFuncionario )  ;
end;

procedure TZoo_SanidadeBaixarTarefasDatamodule.cdsTmpKTAREFAValidate(Sender: TField);
begin
  cdsAnimaisTarefa.Close ;
  cdsAnimaisTarefa.Params.ParamByName ( 'KCAD_FAZENDA'      ).AsString        := LoggedUser.DomainID ;
  cdsAnimaisTarefa.Params.ParamByName ( 'STATUS_DESCARTADO' ).asInteger       := _ST_STATUS_ANIMAL_DESCARTADO ;
  cdsAnimaisTarefa.Params.ParamByName ( 'KZOO_TAREFA'       ).AsString        := cdsTmpKTAREFA.AsString ;
  cdsAnimaisTarefa.Params.ParamByName ( 'DATA'              ).AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay ( FData ) ) ;
  cdsAnimaisTarefa.Params.ParamByName ( 'STATUS_PENDENTE'   ).asInteger       := _ST_STATUS_TAREFA_PENDENTE ;
  TCDSSuppl.Open (  cdsAnimaisTarefa );
end;

end.


