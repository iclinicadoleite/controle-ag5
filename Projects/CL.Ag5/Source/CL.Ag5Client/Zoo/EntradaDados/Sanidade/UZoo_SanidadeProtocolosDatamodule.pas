unit UZoo_SanidadeProtocolosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, Tc.VCL.Dialogs ;

type
   TTipoLanctoProtocolo = ( lpIndividual, lpColetivo ) ;

  TZoo_SanidadeProtocolosDatamodule = class(T_dtmBASE)
    cdsFichaAnimalColetivo: TClientDataSet;
    cdsFichaAnimalColetivoBRINCO: TStringField;
    cdsFichaAnimalColetivoNOMEESTABULO: TStringField;
    cdsProtocoloIndividual: TClientDataSet;
    dspProtocolosAplicados: TDataSetProvider;
    sqlProtocoloIndividual: TTcSQLDataSet;
    sqlTarefasIndividual: TTcSQLDataSet;
    dtsSQLProtocoloIndividual: TDataSource;
    cdsTarefasIndividual: TClientDataSet;
    cdsProtocolosAplicados: TClientDataSet;
    dspProtocoloColetivo: TDataSetProvider;
    sqlFichaAnimalColetivo: TTcSQLDataSet;
    sqlProtocolosAplicados: TTcSQLDataSet;
    dtsSQLProtocoloColetivo: TDataSource;
    dtsFichaAnimal: TDataSource;
    sqlProtocoloIndividualKZOO_PROTOCOLO: TStringField;
    cdsProtocoloIndividualKZOO_PROTOCOLO: TStringField;
    sqlProtocolosAplicadosKZOO_ANIMAL_PROTOCOLO: TStringField;
    sqlProtocolosAplicadosKZOO_PROTOCOLO: TStringField;
    sqlProtocolosAplicadosCODIGO: TStringField;
    sqlProtocolosAplicadosNOME: TStringField;
    cdsProtocolosAplicadosKZOO_ANIMAL_PROTOCOLO: TStringField;
    cdsProtocolosAplicadosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosAplicadosCODIGO: TStringField;
    cdsProtocolosAplicadosNOME: TStringField;
    sqlProtocolosAplicadosKZOO_ANIMAL_FEMEA: TStringField;
    cdsProtocolosAplicadosKZOO_ANIMAL_FEMEA: TStringField;
    cdsProtocoloColetivo: TClientDataSet;
    cdsProtocoloColetivoKZOO_PROTOCOLO: TStringField;
    sqlProtocoloColetivo: TTcSQLDataSet;
    sqlProtocoloColetivoKZOO_PROTOCOLO: TStringField;
    dspProtocoloIndividual: TDataSetProvider;
    sqlTarefasColetivo: TTcSQLDataSet;
    cdsTarefasColetivo: TClientDataSet;
    cdsTarefasColetivoKZOO_TAREFA: TStringField;
    cdsTarefasColetivoCODIGO: TStringField;
    cdsTarefasColetivoNOME: TStringField;
    sqlProtocoloIndividualDATA: TSQLTimeStampField;
    cdsProtocoloIndividualBRINCO: TStringField;
    cdsProtocoloIndividualNOMEESTABULO: TStringField;
    cdsProtocoloIndividualsqlTarefasIndividual: TDataSetField;
    cdsProtocoloIndividualPROTOCOLO: TStringField;
    cdsProtocoloColetivoPROTOCOLO: TStringField;
    sqlProtocoloColetivoDATA: TSQLTimeStampField;
    cdsTarefasColetivoDIA: TSmallintField;
    cdsTarefasColetivoPREVISAO: TDateTimeField;
    cdsTarefasColetivoDESCARTELEITE: TSmallintField;
    cdsTarefasColetivoDESCARTECARNE: TSmallintField;
    cdsTarefasColetivoKCAD_FUNCIONARIO: TStringField;
    cdsTarefasColetivoNOMEFUNCIONARIO: TStringField;
    sqlFichaAnimalColetivoKZOO_ANIMAL_FEMEA: TStringField;
    cdsProtocoloColetivosqlTarefasColetivo: TDataSetField;
    cdsProtocoloColetivosqlFichaAnimalColetivo: TDataSetField;
    cdsProtocoloColetivoDATA: TSQLTimeStampField;
    cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA: TStringField;
    cdsTarefasIndividualKZOO_TAREFA: TStringField;
    cdsTarefasIndividualCODIGO: TStringField;
    cdsTarefasIndividualNOME: TStringField;
    cdsTarefasIndividualDIA: TSmallintField;
    cdsTarefasIndividualPREVISAO: TDateTimeField;
    cdsTarefasIndividualDESCARTELEITE: TSmallintField;
    cdsTarefasIndividualDESCARTECARNE: TSmallintField;
    cdsTarefasIndividualKCAD_FUNCIONARIO: TStringField;
    cdsTarefasIndividualNOMEFUNCIONARIO: TStringField;
    sqlTarefasIndividualKZOO_TAREFA: TStringField;
    sqlTarefasIndividualKCAD_FUNCIONARIO: TStringField;
    sqlTarefasIndividualNOMEFUNCIONARIO: TStringField;
    sqlProtocoloIndividualKZOO_ANIMAL_FEMEA: TStringField;
    cdsProtocoloIndividualKZOO_ANIMAL_FEMEA: TStringField;
    cdsProtocoloIndividualDATA: TSQLTimeStampField;
    sqlTarefasIndividualCODIGO: TStringField;
    sqlTarefasIndividualNOME: TStringField;
    sqlTarefasIndividualDIA: TSmallintField;
    sqlTarefasIndividualDESCARTELEITE: TSmallintField;
    sqlTarefasIndividualDESCARTECARNE: TSmallintField;
    sqlTarefasColetivoKZOO_TAREFA: TStringField;
    sqlTarefasColetivoCODIGO: TStringField;
    sqlTarefasColetivoNOME: TStringField;
    sqlTarefasColetivoDIA: TSmallintField;
    sqlTarefasColetivoDESCARTELEITE: TSmallintField;
    sqlTarefasColetivoDESCARTECARNE: TSmallintField;
    sqlTarefasColetivoKCAD_FUNCIONARIO: TStringField;
    sqlTarefasColetivoNOMEFUNCIONARIO: TStringField;
    cdsProtocolosDisponiveis: TClientDataSet;
    cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField;
    cdsProtocolosDisponiveisPROTOCOLO: TStringField;
    dspProtocolosDisponiveis: TDataSetProvider;
    sqlProtocolosDisponiveis: TTcSQLDataSet;
    sqlProtocolosDisponiveisKZOO_PROTOCOLO: TStringField;
    sqlProtocolosDisponiveisPROTOCOLO: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlProtocolosAplicadosDATA: TSQLTimeStampField;
    cdsProtocolosAplicadosDATA: TSQLTimeStampField;
    dspResumoAnimal: TDataSetProvider;
    cdsResumoAnimal: TClientDataSet;
    sqlResumoAnimal: TTcSQLDataSet;
    sqlResumoAnimalKZOO_ANIMAL: TStringField;
    sqlResumoAnimalBRINCO: TStringField;
    sqlResumoAnimalTIPOEVENTO: TIntegerField;
    sqlResumoAnimalULTIMAPESAGEM: TFloatField;
    sqlResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField;
    sqlResumoAnimalSTATUS: TIntegerField;
    sqlResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField;
    sqlResumoAnimalDPP: TIntegerField;
    cdsResumoAnimalKZOO_ANIMAL: TStringField;
    cdsResumoAnimalBRINCO: TStringField;
    cdsResumoAnimalTIPOEVENTO: TIntegerField;
    cdsResumoAnimalULTIMAPESAGEM: TFloatField;
    cdsResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField;
    cdsResumoAnimalSTATUS: TIntegerField;
    cdsResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField;
    cdsResumoAnimalDPP: TIntegerField;
    cdsResumoAnimalDESC_STATUS: TStringField;
    cdsResumoAnimalDESC_EVENTO: TStringField;
    cdsFichaAnimalColetivoSTATUS: TIntegerField;
    cdsFichaAnimalColetivoLOTE: TStringField;
    cdsFichaAnimalColetivoDESCR_STATUS: TStringField;
    dtsProtocolosDisponiveis: TDataSource;
    sqlResumoAnimalLOTE: TStringField;
    cdsResumoAnimalLOTE: TStringField;
    sqlTarefasColetivoEXAME: TStringField;
    cdsTarefasColetivoEXAME: TStringField;
    sqlTarefasIndividualEXAME: TStringField;
    cdsTarefasIndividualEXAME: TStringField;
    cdsTarefasIndividualVEZAODIA: TIntegerField;
    cdsTarefasColetivoVEZAODIA: TIntegerField;
    sqlTarefasIndividualVEZAODIA: TIntegerField;
    sqlTarefasIndividualDESCRICAO: TMemoField;
    cdsTarefasIndividualOBS: TMemoField;
    cdsTarefasColetivoOBS: TMemoField;
    sqlTarefasColetivoOBS: TMemoField;
    procedure dspProtocoloColetivoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspProtocoloIndividualBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsProtocoloIndividualKZOO_PROTOCOLOValidate(Sender: TField);
    procedure cdsProtocoloColetivoKZOO_PROTOCOLOValidate(Sender: TField);
    procedure cdsTarefasIndividualNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsTarefasColetivoNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsTarefasIndividualPREVISAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsTarefasColetivoPREVISAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dtsFichaAnimalDataChange(Sender: TObject; Field: TField);
    procedure cdsProtocoloColetivoDATAValidate(Sender: TField);
    procedure cdsProtocoloIndividualDATAValidate(Sender: TField);
    procedure dtsProtocolosDisponiveisDataChange(Sender: TObject; Field: TField);
    procedure cdsTarefasIndividualNOMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasColetivoNOMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasIndividualDIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasColetivoDIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasIndividualDESCARTELEITEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsTarefasIndividualOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasColetivoOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasColetivoDESCARTELEITEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    FTipoLanctoProtocolo: TTipoLanctoProtocolo;
    { Private declarations }
    procedure UpdateProtocolosColetivo   ( AKPrototocolo : string ; AData : TDateTime ; AAnimais, ATarefas : TCustomClientDataSet);
    procedure UpdateProtocolosIndividual ( AKPrototocolo, AKAnimal: string; AData : TDateTime ; ATarefas : TCustomClientDataSet);
    procedure UpdateListaTarefasIndividual ;
    procedure UpdateListaTarefasColetivo ;
    procedure GetListaTarefas ( AProtocolo : string ; ACDSTarefas : TClientDataSet ) ;
    procedure SetTipoLanctoProtocolo(const Value: TTipoLanctoProtocolo);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function AddBrincoColetivo ( ABrinco : string  ) : boolean ;
    function AddBrincoIndividual ( ABrinco : string  ) : boolean ;
    function AddByKeyColetivo ( AKey : string  ) : boolean ;
    function AddByKeyIndividual ( AKey : string ) : boolean ;
    function LocateBrincoColetivo ( ABrinco : string  ) : boolean ;
    function LocateKeyColetivo ( AKey : string  ) : boolean ;
    procedure ApplyUpdates ; override ;
    property TipoLanctoProtocolo : TTipoLanctoProtocolo  read FTipoLanctoProtocolo write SetTipoLanctoProtocolo;
    procedure SetFuncionarioIndividual ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure SetFuncionarioColetivo ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure RemoveBrincoSelecionado ;
    procedure ClearAnimalIndividual ;
    procedure TrocaFuncionarioIndividual ( AKFuncionario, ANomeFuncionario : string ) ;
    procedure TrocaFuncionarioColetivo ( AKFuncionario, ANomeFuncionario : string ) ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, GuidSuppl,
  SQLTimSt , Math, ProtocolosAnimalClass, CLAg5Types, ThreadSuppl,
  ClAg5ClientZootecnicoCommonTypes,
  TarefasAnimalClass;

{$R *.dfm}

procedure TZoo_SanidadeProtocolosDatamodule.OpenTables;
begin
  cdsProtocolosDisponiveis.Params.ParamByName(  'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
  TCDSSuppl.Open (  cdsProtocolosDisponiveis ) ;
  TCDSSuppl.CreateDataSet( cdsProtocoloIndividual ) ;
  TCDSSuppl.CreateDataSet( cdsProtocoloColetivo   ) ;

  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_FEMEA,    cdsStatusAnimal ) ;
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento   );

end;

procedure TZoo_SanidadeProtocolosDatamodule.RemoveBrincoSelecionado;
begin
  if not cdsFichaAnimalColetivo.isEmpty then
         cdsFichaAnimalColetivo.Delete ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.SetFuncionarioIndividual(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsTarefasIndividual.State in [dsInsert, dsEdit] ) then
      cdsTarefasIndividual.Edit ;

   cdsTarefasIndividualNOMEFUNCIONARIO.Clear ;
   cdsTarefasIndividualKCAD_FUNCIONARIO.Clear ;

   if AKFuncionario <> '' then
     begin
       cdsTarefasIndividualNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
       cdsTarefasIndividualKCAD_FUNCIONARIO.asString := AKFuncionario ;
     end ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.SetFuncionarioColetivo(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsTarefasColetivo.State in [dsInsert, dsEdit] ) then
      cdsTarefasColetivo.Edit ;

   cdsTarefasColetivoNOMEFUNCIONARIO.Clear ;
   cdsTarefasColetivoKCAD_FUNCIONARIO.Clear ;

   if AKFuncionario <> '' then
     begin
       cdsTarefasColetivoNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
       cdsTarefasColetivoKCAD_FUNCIONARIO.asString := AKFuncionario ;
     end ;
end;


procedure TZoo_SanidadeProtocolosDatamodule.SetTipoLanctoProtocolo(
  const Value: TTipoLanctoProtocolo);
begin
  FTipoLanctoProtocolo := Value;
  if FTipoLanctoProtocolo = lpIndividual then
     dtsFichaAnimal.DataSet := cdsProtocoloIndividual
  else
     dtsFichaAnimal.DataSet := cdsFichaAnimalColetivo
end;

procedure TZoo_SanidadeProtocolosDatamodule.TrocaFuncionarioColetivo(
  AKFuncionario, ANomeFuncionario: string);
begin
    try
      with cdsTarefasColetivo do
        begin
          DisableControls ;
          First ;
          while not eof do
            begin
              SetFuncionarioColetivo(AKFuncionario, ANomeFuncionario );
              Next ;
            end;
        end;
    finally
        cdsTarefasColetivo.First ;
        cdsTarefasColetivo.EnableControls ;
    end;
end;

procedure TZoo_SanidadeProtocolosDatamodule.TrocaFuncionarioIndividual( AKFuncionario, ANomeFuncionario : string );
begin
    try
      with cdsTarefasIndividual do
        begin
          DisableControls ;
          First ;
          while not eof do
            begin
              SetFuncionarioIndividual(AKFuncionario, ANomeFuncionario );
              Next ;
            end;
        end;
    finally
        cdsTarefasIndividual.First ;
        cdsTarefasIndividual.EnableControls ;
    end;
end;

procedure TZoo_SanidadeProtocolosDatamodule.UpdateListaTarefasColetivo;
begin
   while not cdsTarefasColetivo.eof do
     cdsTarefasColetivo.delete ;

   if not cdsProtocoloColetivoKZOO_PROTOCOLO.IsNull then
      GetListaTarefas ( cdsProtocoloColetivoKZOO_PROTOCOLO.asString, cdsTarefasColetivo )  ;

end;

procedure TZoo_SanidadeProtocolosDatamodule.UpdateListaTarefasIndividual;
begin
   while not cdsTarefasIndividual.eof do
     cdsTarefasIndividual.delete ;

   if not cdsProtocoloIndividualKZOO_PROTOCOLO.IsNull then
      GetListaTarefas ( cdsProtocoloIndividualKZOO_PROTOCOLO.asString, cdsTarefasIndividual )  ;

end;

procedure TZoo_SanidadeProtocolosDatamodule.UpdateProtocolosColetivo( AKPrototocolo : string ; AData : TDateTime ; AAnimais, ATarefas : TCustomClientDataSet);
var
  protocolo : string ;
begin
   // inclui protocolo, sem tarefas
   while not AAnimais.Eof do
     begin
        protocolo := TProtocolosAnimal.AddProtocolo ( AAnimais.fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString, AKPrototocolo, AData, '', '', '', 0, False, '', True, False ) ;

        ATarefas.First ;
        with ATarefas do
            while not eof do
              begin
                 TTarefasAnimal.AddTarefa(
                    '' // diagnostico
                   , protocolo
                   , AAnimais.fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString
                   , fieldByName ( 'KZOO_TAREFA' ).AsString
                   , fieldByName ( 'EXAME' ).asBoolean
                   , fieldByName ( 'DIA' ).asInteger
                   , AData + fieldByName ( 'DIA'   ).asInteger {-1} // considerar dia 0
                   , fieldByName ( 'VEZAODIA'        ).asInteger
                   , fieldByName ( 'CODIGO'        ).asString
                   , fieldByName ( 'NOME'          ).asString
                   , fieldByName ( 'DESCARTELEITE'    ).asInteger
                   , fieldByName ( 'DESCARTECARNE'    ).asInteger
                   , fieldByName ( 'KCAD_FUNCIONARIO' ).asString
                   , fieldByName ( 'NOMEFUNCIONARIO'  ).asString
                   , fieldByName ( 'OBS'              ).asString
                   , ''
                   , True
                 ) ;
                 Next ;
              end ;
        AAnimais.Next ;
     end;

end ;

procedure TZoo_SanidadeProtocolosDatamodule.UpdateProtocolosIndividual( AKPrototocolo, AKAnimal: string; AData : TDateTime ; ATarefas : TCustomClientDataSet);
var
  protocolo : string ;
begin
   // inclui protocolo, sem tarefas
   protocolo := TProtocolosAnimal.AddProtocolo ( AKAnimal, AKPrototocolo, AData, '', '', '', 0, False, '', True, False ) ;

   with ATarefas do
       while not eof do
         begin
            TTarefasAnimal.AddTarefa(
               '' // diagnostico
              , protocolo
              , AKAnimal
              , fieldByName ( 'KZOO_TAREFA' ).AsString
              , fieldByName ( 'EXAME' ).asBoolean
              , fieldByName ( 'DIA' ).asInteger
              , AData + fieldByName ( 'DIA'      ).asInteger {-1} // considerar dia 0
              , fieldByName ( 'VEZAODIA'      ).asInteger
              , fieldByName ( 'CODIGO'           ).asString
              , fieldByName ( 'NOME'        ).asString
              , fieldByName ( 'DESCARTELEITE'    ).asInteger
              , fieldByName ( 'DESCARTECARNE'    ).asInteger
              , fieldByName ( 'KCAD_FUNCIONARIO' ).asString
              , fieldByName ( 'NOMEFUNCIONARIO'  ).asString
              , fieldByName ( 'OBS'      ).asString
              , ''
              , True
            ) ;
            Next ;
         end ;
end ;

function TZoo_SanidadeProtocolosDatamodule.AddBrincoColetivo(ABrinco: string): boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrincoColetivo ( ABrinco ) ;

    if Result then
      begin
         cdsFichaAnimalColetivo.Edit ;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKeyColetivo ( KeyAnimal )
end;

function TZoo_SanidadeProtocolosDatamodule.AddBrincoIndividual(ABrinco: string): boolean;
var
    KeyAnimal : string ;
begin
    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKeyIndividual ( KeyAnimal )
end;

function TZoo_SanidadeProtocolosDatamodule.AddByKeyColetivo(AKey: string): boolean;
var
    cdsTmpAnimal : TClientDataSet ;
    p : TParams ;

begin
    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString  := AKey ;
    cdsTmpAnimal := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cdsTmpAnimal,
              'AF.KZOO_ANIMAL, AF.BRINCO, AF.NOMEESTABULO, AF.STATUS, DAF.LOTE'
       +#13#10'FROM ZOO_ANIMAIS AF'
       +#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
       +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( AF.KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;
       Result := not cdsTmpAnimal.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cdsTmpAnimal.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       with cdsTmpAnimal do
         begin
           cdsFichaAnimalColetivo.Append ;
           cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA.asString  := fieldByName ( 'KZOO_ANIMAL' ).asString ;
           cdsFichaAnimalColetivoBRINCO.asString             := fieldByName ( 'BRINCO' ).asString ;
           cdsFichaAnimalColetivoNOMEESTABULO.asString       := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsFichaAnimalColetivoSTATUS.AsInteger            := fieldByName ( 'STATUS' ).AsInteger ;
           cdsFichaAnimalColetivoLOTE.asString               := fieldByName ( 'LOTE' ).asString ;
           cdsFichaAnimalColetivo.Post ;
         end ;

    finally
       cdsTmpAnimal.Free ;
       p.free ;
    end;
end;

function TZoo_SanidadeProtocolosDatamodule.AddByKeyIndividual(AKey: string ): boolean;
var
    cdsTmpAnimal : TClientDataSet ;
    p : TParams ;

begin
    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString  := AKey ;
    cdsTmpAnimal := nil ;

    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cdsTmpAnimal,
              'AF.KZOO_ANIMAL, AF.BRINCO, AF.NOMEESTABULO, AF.STATUS, DAF.LOTE'
       +#13#10'FROM ZOO_ANIMAIS AF'
       +#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA DAF ON DAF.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
       +#13#10'WHERE ( AF.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( AF.KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;
       Result := not cdsTmpAnimal.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cdsTmpAnimal.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       with cdsTmpAnimal do
         begin
           cdsProtocoloIndividual.Edit ;
           cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.asString  := FieldByName ( 'KZOO_ANIMAL' ).asString ;
           cdsProtocoloIndividualBRINCO.asString             := FieldByName ( 'BRINCO' ).asString ;
           cdsProtocoloIndividualNOMEESTABULO.asString       := FieldByName ( 'BRINCO' ).asString +
                                                                              ' - ' + FieldByName ( 'NOMEESTABULO' ).asString ;
//           cdsProtocoloIndividualLOTE.asString               := FieldByName ( 'LOTEn' ).asString;
//           cdsProtocoloIndividualSTATUS.asString             := FieldByName ( 'STATUS' ).asString;

           //++kiq - atualiza a lista de tarefas
           dtsProtocolosDisponiveisDataChange(nil,nil);
         end ;

    finally
       cdsTmpAnimal.Free ;
       p.free ;
    end;

end;

function TZoo_SanidadeProtocolosDatamodule.LocateBrincoColetivo(ABrinco: string): boolean;
begin
    Result := cdsFichaAnimalColetivo.Locate( 'BRINCO', ABrinco, [] ) ;
end;

function TZoo_SanidadeProtocolosDatamodule.LocateKeyColetivo(
  AKey: string): boolean;
begin
    Result := cdsFichaAnimalColetivo.Locate( 'KZOO_ANIMAL_FEMEA', AKey, [] ) ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.ApplyUpdates;
begin

  if TipoLanctoProtocolo = lpIndividual then
    begin
      TCDSSuppl.PostIfNeed( cdsTarefasIndividual );
      TCDSSuppl.PostIfNeed( cdsProtocoloIndividual );

      if ( cdsProtocoloIndividualDATA.asDateTime < 1 )  then
         raise Warning.Create('Data do protocolo inválido');

      with cdsTarefasIndividual do
        begin
          first ;
          while not eof do
            begin
             if Trim ( cdsTarefasIndividualKCAD_FUNCIONARIO.asString ) = '' then
               raise Warning.Create('Existe(m) tarefa(s) sem funcionário');

               //cdsTarefasIndividual.Edit ;
               //cdsTarefasIndividualPREVISAO.asDateTime := cdsProtocoloIndividualDATA.asDateTime + cdsTarefasIndividualDIA.AsInteger - 1 ;
               //cdsTarefasIndividual.Post ;
               next ;
            end;
        end;

      TCDSSuppl.ApplyUpdates ( cdsProtocoloIndividual ) ;
      TCDSSuppl.CreateDataSet( cdsProtocoloIndividual ) ;
    end
  else
    begin
      TCDSSuppl.PostIfNeed( cdsFichaAnimalColetivo );
      TCDSSuppl.PostIfNeed( cdsTarefasColetivo );

      if ( cdsProtocoloColetivoKZOO_PROTOCOLO.AsString = EmptyStr )  then
         raise Warning.Create('Selecione um protocolo');

      if ( cdsProtocoloColetivoDATA.asDateTime < 1 )  then
         raise Warning.Create('Data do protocolo inválido');

      if ( cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA.AsString = EmptyStr )  then
         raise Warning.Create('Selecione os animais');

      with cdsTarefasColetivo do
        begin
          first ;
          while not eof do
            begin
               if Trim ( cdsTarefasColetivoKCAD_FUNCIONARIO.asString ) = '' then
                 raise Warning.Create('Existe(m) tarefa(s) sem funcionário');
               //cdsTarefasColetivo.Edit ;
               //cdsTarefasColetivoPREVISAO.asDateTime := cdsProtocoloColetivoDATA.asDateTime + cdsTarefasColetivoDIA.AsInteger -1  ;
               //cdsTarefasColetivo.Post ;
               next ;
            end;
        end;

      TCDSSuppl.PostIfNeed   ( cdsProtocoloIndividual );
      TCDSSuppl.ApplyUpdates ( cdsProtocoloColetivo ) ;
      TCDSSuppl.CreateDataSet( cdsProtocoloColetivo ) ;
    end
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsProtocoloColetivoDATAValidate(Sender: TField);
begin
//  if Sender.AsDateTime > Now then
//     raise Warning.Create('Data do protocolo não pode ser superior a data atual');
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsProtocoloColetivoKZOO_PROTOCOLOValidate(
  Sender: TField);
begin
   ThreadSuppl.TSyncThread.Create(  UpdateListaTarefasColetivo )
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsProtocoloIndividualDATAValidate(Sender: TField);
begin
//  if Sender.AsDateTime > Now then
//     raise Warning.Create('Data do protocolo não pode ser superior a data atual');
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsProtocoloIndividualKZOO_PROTOCOLOValidate(
  Sender: TField);
begin
   ThreadSuppl.TSyncThread.Create(  UpdateListaTarefasIndividual )
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoDESCARTELEITEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := cdsTarefasIndividualDESCARTELEITE.asString + ' / ' + cdsTarefasIndividualDESCARTECARNE.asString
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoDIAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Sender.asString + 'o'
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsTarefasColetivoKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoNOMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsTarefasColetivoVEZAODIA.asInteger > 1 then
      Text := Format ( '%s - %s (%da vez)', [ cdsTarefasColetivoCODIGO.asString, Sender.asString, cdsTarefasColetivoVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s - %s', [ cdsTarefasColetivoCODIGO.asString, Sender.asString ] )
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoOBSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasColetivoPREVISAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
 if ( cdsProtocoloColetivoDATA.asDateTime < 1 ) or cdsTarefasColetivo.IsEmpty then
   Text := cdsTarefasColetivoDIA.Text
 else
  Text := cdsTarefasColetivoDIA.Text + ' - ' + FormatDateTime ( 'dd.mm.yyyy', cdsProtocoloColetivoDATA.asDateTime + cdsTarefasColetivoDIA.AsInteger -1  )
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualDESCARTELEITEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := cdsTarefasIndividualDESCARTELEITE.asString + ' / ' + cdsTarefasIndividualDESCARTECARNE.asString
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualDIAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Sender.asString + 'o'
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsTarefasIndividualKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualNOMEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsTarefasIndividualVEZAODIA.asInteger > 1 then
      Text := Format ( '%s - %s (%da vez)', [ cdsTarefasIndividualCODIGO.asString, Sender.asString, cdsTarefasIndividualVEZAODIA.asInteger ] )
   else
      Text := Format ( '%s - %s', [ cdsTarefasIndividualCODIGO.asString, Sender.asString ] )
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualOBSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy ( Sender.asString, 1, 50 ) ;
   while Pos( #13#10#13#10, Text ) > 0 do Text := StringReplace ( Text, #13#10#13#10, #13#10, [rfReplaceAll] ) ;
   Text := StringReplace ( Text, #13#10, ';', [rfReplaceAll] ) ;
   while ( Length(Text) > 0 ) and (Text[1] = ';' ) do System.Delete( text, 1, 1 ) ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.cdsTarefasIndividualPREVISAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
 if ( cdsProtocoloIndividualDATA.asDateTime < 1 ) or cdsTarefasIndividual.IsEmpty then
   Text := cdsTarefasIndividualDIA.Text
 else
  Text := cdsTarefasIndividualDIA.Text + ' - ' + FormatDateTime ( 'dd.mm.yyyy', cdsProtocoloIndividualDATA.asDateTime + cdsTarefasIndividualDIA.AsInteger -1  )
end;

procedure TZoo_SanidadeProtocolosDatamodule.ClearAnimalIndividual;
begin
  if Trim ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.AsString ) = '' then
     exit ;
  cdsProtocoloIndividual.Edit ;
  cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.AsString := '' ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.dtsProtocolosDisponiveisDataChange(
  Sender: TObject; Field: TField);
begin
   if ( Field = nil ) and ((cdsProtocoloIndividual.State in [dsInsert,dsEdit]) or (not cdsProtocoloIndividual.isEmpty) ) then
     begin
       cdsProtocoloIndividual.Edit ;
       cdsProtocoloIndividualKZOO_PROTOCOLO.AsString := cdsProtocolosDisponiveisKZOO_PROTOCOLO.asString ;
     end;
end;

procedure TZoo_SanidadeProtocolosDatamodule.dspProtocoloColetivoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;
  if ( SourceDS = sqlProtocoloColetivo ) then

   UpdateProtocolosColetivo   ( DeltaDS.FieldByName('KZOO_PROTOCOLO').asString,
      DeltaDS.FieldByName('DATA').asDateTime,
      TClientDataSet ( TDataSetField ( DeltaDS.FieldByName('sqlFichaAnimalColetivo') ).NestedDataSet ),
      TClientDataSet ( TDataSetField ( DeltaDS.FieldByName('sqlTarefasColetivo') ).NestedDataSet ) );

  Applied := True ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.dspProtocoloIndividualBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if ( SourceDS = sqlProtocoloIndividual ) then
   UpdateProtocolosIndividual ( DeltaDS.FieldByName( 'KZOO_PROTOCOLO' ).asString,
                                DeltaDS.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString,
                                DeltaDS.FieldByName( 'DATA' ).asDateTime,
                                TClientDataSet ( TDataSetField ( DeltaDS.FieldByName('sqlTarefasIndividual') ).NestedDataSet ) ) ;

  Applied := True ;
end;

procedure TZoo_SanidadeProtocolosDatamodule.dtsFichaAnimalDataChange(Sender: TObject;
  Field: TField);
begin
  if FTipoLanctoProtocolo = lpIndividual then begin
     if Assigned ( Field ) and ( Field <> cdsProtocoloIndividualKZOO_ANIMAL_FEMEA )
     or ( cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.AsString = cdsProtocolosAplicados.Params.ParamByName ( 'KZOO_ANIMAL' ).asString ) then
        exit ;

           cdsProtocolosAplicados.Close ;
           cdsProtocolosAplicados.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.AsString ;
           TCDSSuppl.Open( cdsProtocolosAplicados );

           cdsResumoAnimal.Close ;
           cdsResumoAnimal.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsProtocoloIndividualKZOO_ANIMAL_FEMEA.AsString ;
           TCDSSuppl.Open( cdsResumoAnimal );
  end
  else begin
     if Assigned ( Field ) and ( Field <> cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA )
     or ( cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA.AsString = cdsProtocolosAplicados.Params.ParamByName ( 'KZOO_ANIMAL' ).asString ) then
        exit ;

           cdsProtocolosAplicados.Close ;
           cdsProtocolosAplicados.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA.AsString ;
           TCDSSuppl.Open( cdsProtocolosAplicados );

           cdsResumoAnimal.Close ;
           cdsResumoAnimal.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsFichaAnimalColetivoKZOO_ANIMAL_FEMEA.AsString ;
           TCDSSuppl.Open( cdsResumoAnimal );
  end;
end;

procedure TZoo_SanidadeProtocolosDatamodule.GetListaTarefas ( AProtocolo : string ; ACDSTarefas : TClientDataSet ) ;
const
  _SELECT_TAREFAS = 'T.KZOO_TAREFA, T.CODIGO, T.NOME, PT.EXAME, PT.DIA, PT.VEZES, PT.REPLICAR, PT.INTERVALO, PT.OBS, '
     +#13#10'T.DESCARTELEITE, T.DESCARTECARNE,  T.KCAD_FUNCIONARIO, T.NOMEFUNCIONARIO'
     +#13#10'FROM ZOO_PROTOCOLO_TAREFAS PT'
     +#13#10'LEFT JOIN ZOO_TAREFAS T ON T.KZOO_TAREFA = PT.KZOO_TAREFA'
     +#13#10'WHERE  PT.KZOO_PROTOCOLO = :KZOO_PROTOCOLO AND T.ATIVO = ''T''' ;
var
   p : TParams ;
   cdsTmpTarefas : TClientDataSet ;
   IterateReplicar, IterateVezes : integer ;
   DiaExecucao, VezesAoDia, Replicas, IntervaloDias : integer ;
   ErrMsg : string ;
begin

   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_PROTOCOLO', ptInput ).asString := AProtocolo ;

   cdsTmpTarefas := nil ;
   DBResources['ZOOTECNICO'].populateClientDataSet( cdsTmpTarefas, _SELECT_TAREFAS, p  ) ;

   with cdsTmpTarefas do
       while not eof do
          try
            DiaExecucao   := Max ( fieldByName('DIA').asInteger,           1 ) ; // no 1o dia ou posterior
            VezesAoDia    := Max ( fieldByName('VEZES').asInteger,         1 ) ; // pelo menos 1 v.d.
            Replicas      := Max ( fieldByName('REPLICAR').asInteger + 1,  1 ) ; // pelo menos 1 tarefa ( = 0, inclui 1x, = 1 inclui 2x... )
            IntervaloDias := Max ( fieldByName('INTERVALO').asInteger,     1 ) ; // menor intervalo 1 dia

            for IterateReplicar := 1 to Replicas do
                begin
                  for IterateVezes := 1 To VezesAoDia do
                    begin
                      ACDSTarefas.Append ;
                      ACDSTarefas.fieldByName ( 'KZOO_TAREFA'      ).asString    := fieldByName ( 'KZOO_TAREFA'      ).asString    ;
                      ACDSTarefas.fieldByName ( 'CODIGO'           ).asString    := fieldByName ( 'CODIGO'           ).asString    ;
                      ACDSTarefas.fieldByName ( 'NOME'             ).asString    := fieldByName ( 'NOME'             ).asString    ;
                      ACDSTarefas.fieldByName ( 'EXAME'            ).asString    := fieldByName ( 'EXAME'            ).asString    ;
                      ACDSTarefas.fieldByName ( 'DIA'              ).asInteger   := DiaExecucao ;
                      ACDSTarefas.fieldByName ( 'VEZAODIA'         ).asInteger   := IterateVezes ;
  //                    ACDSTarefas.fieldByName ( 'PREVISAO'         ).asDateTime  := fieldByName ( 'PREVISAO'         ).asDateTime  ;
                      ACDSTarefas.fieldByName ( 'DESCARTELEITE'    ).asInteger   := fieldByName ( 'DESCARTELEITE'    ).asInteger   ;
                      ACDSTarefas.fieldByName ( 'DESCARTECARNE'    ).asInteger   := fieldByName ( 'DESCARTECARNE'    ).asInteger   ;
                      ACDSTarefas.fieldByName ( 'KCAD_FUNCIONARIO' ).asString    := fieldByName ( 'KCAD_FUNCIONARIO' ).asString    ;
                      ACDSTarefas.fieldByName ( 'NOMEFUNCIONARIO'  ).asString    := fieldByName ( 'NOMEFUNCIONARIO'  ).asString    ;
                      ACDSTarefas.fieldByName ( 'OBS'  ).asString                := fieldByName ( 'OBS'  ).asString    ;
                      ACDSTarefas.Post ;
                    end;
                  Inc ( DiaExecucao, IntervaloDias ) ;
                end;
            next ;
          except on E : Exception do
            begin
              ErrMsg := E.Message ;
              showMessage ( ErrMsg )
            end;
          end ;
   ACDSTarefas.First ;

end;


end.