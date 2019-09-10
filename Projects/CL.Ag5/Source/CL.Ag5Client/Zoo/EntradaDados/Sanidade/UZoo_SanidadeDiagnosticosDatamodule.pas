unit UZoo_SanidadeDiagnosticosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_SanidadeDiagnosticosDatamodule = class(T_dtmBASE)
    cdsDiagnosticosDisponiveis: TClientDataSet;
    dspDiagnosticosAplicados: TDataSetProvider;
    sqlDiagnosticosDisponiveis: TTcSQLDataSet;
    sqlProtocolosAAplicar: TTcSQLDataSet;
    dtsDiagnosticos: TDataSource;
    cdsProtocolosAAplicar: TClientDataSet;
    cdsDiagnosticosAplicados: TClientDataSet;
    cdsDiagnosticosAAplicar: TClientDataSet;
    dspDiagnosticosAAplicar: TDataSetProvider;
    sqlDiagnosticosAAplicar: TTcSQLDataSet;
    sqlDiagnosticosAplicados: TTcSQLDataSet;
    dtsSQLAnimal: TDataSource;
    sqlDiagnosticosAAplicarKZOO_ANIMAL: TStringField;
    sqlProtocolosAAplicarKZOO_PROTOCOLO: TStringField;
    sqlDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosAAplicarKZOO_PROTOCOLO: TStringField;
    cdsDiagnosticosAAplicarKZOO_ANIMAL: TStringField;
    cdsDiagnosticosAAplicarBRINCO: TStringField;
    cdsDiagnosticosAAplicarNOMEESTABULO: TStringField;
    dtsFichaAnimal: TDataSource;
    sqlDiagnosticosAAplicarKCAD_FAZENDA: TStringField;
    cdsProtocolosAAplicarSELECTED: TSmallintField;
    cdsProtocolosAAplicarTOTSELECTED: TAggregateField;
    dspDiagnosticosDisponiveis: TDataSetProvider;
    sqlDiagnosticosAAplicarKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosAAplicarKCAD_FAZENDA: TStringField;
    cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO: TStringField;
    sqlDiagnosticosDisponiveisDIAGNOSTICO: TStringField;
    cdsDiagnosticosDisponiveisDIAGNOSTICO: TStringField;
    cdsDiagnosticosAAplicarDIAGNOSTICO: TStringField;
    cdsDiagnosticosAAplicarsqlProtocolosAAplicar: TDataSetField;
    sqlProtocolosAAplicarPROTOCOLO: TStringField;
    cdsProtocolosAAplicarPROTOCOLO: TStringField;
    sqlDiagnosticosAAplicarDATA: TSQLTimeStampField;
    cdsDiagnosticosAAplicarDATA: TSQLTimeStampField;
    dspResumoAnimal: TDataSetProvider;
    cdsResumoAnimal: TClientDataSet;
    sqlResumoAnimal: TTcSQLDataSet;
    sqlResumoAnimalKZOO_ANIMAL: TStringField;
    sqlResumoAnimalBRINCO: TStringField;
    cdsResumoAnimalKZOO_ANIMAL: TStringField;
    cdsResumoAnimalBRINCO: TStringField;
    sqlResumoAnimalTIPOEVENTO: TIntegerField;
    sqlResumoAnimalULTIMAPESAGEM: TFloatField;
    sqlResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField;
    sqlResumoAnimalSTATUS: TIntegerField;
    sqlResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField;
    cdsResumoAnimalTIPOEVENTO: TIntegerField;
    cdsResumoAnimalULTIMAPESAGEM: TFloatField;
    cdsResumoAnimalDATAULTIMOPARTO: TSQLTimeStampField;
    cdsResumoAnimalSTATUS: TIntegerField;
    cdsResumoAnimalDATAULTIMOEVENTO: TSQLTimeStampField;
    cdsResumoAnimalDPP: TIntegerField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsResumoAnimalDESC_STATUS: TStringField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsResumoAnimalDESC_EVENTO: TStringField;
    cdsStatusDiagnostico: TClientDataSet;
    cdsStatusDiagnosticoTIPO: TStringField;
    cdsStatusDiagnosticoVALOR: TStringField;
    cdsStatusDiagnosticoDESCRICAO: TStringField;
    cdsStatusDiagnosticoORDEM: TIntegerField;
    sqlDiagnosticosAplicadosKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    sqlDiagnosticosAplicadosKZOO_ANIMAL_FEMEA: TStringField;
    sqlDiagnosticosAplicadosCOD_PROTOCOLO: TStringField;
    sqlDiagnosticosAplicadosDATA_PROTOCOLO: TSQLTimeStampField;
    sqlDiagnosticosAplicadosNOME_PROTOCOLO: TStringField;
    sqlDiagnosticosAplicadosDATA_DIAGNOSTICO: TSQLTimeStampField;
    sqlDiagnosticosAplicadosCOD_DIAGNOSTICO: TStringField;
    sqlDiagnosticosAplicadosNOME_DIAGNOSTICO: TStringField;
    sqlDiagnosticosAplicadosDESC_STATUS_DIAGNOSTICO: TStringField;
    cdsDiagnosticosAplicadosKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    cdsDiagnosticosAplicadosKZOO_ANIMAL_FEMEA: TStringField;
    cdsDiagnosticosAplicadosCOD_PROTOCOLO: TStringField;
    cdsDiagnosticosAplicadosDATA_PROTOCOLO: TSQLTimeStampField;
    cdsDiagnosticosAplicadosNOME_PROTOCOLO: TStringField;
    cdsDiagnosticosAplicadosDATA_DIAGNOSTICO: TSQLTimeStampField;
    cdsDiagnosticosAplicadosCOD_DIAGNOSTICO: TStringField;
    cdsDiagnosticosAplicadosNOME_DIAGNOSTICO: TStringField;
    cdsDiagnosticosAplicadosDESC_STATUS_DIAGNOSTICO: TStringField;
    cdsTipoQuarto: TClientDataSet;
    cdsTipoQuartoTIPO: TStringField;
    cdsTipoQuartoVALOR: TStringField;
    cdsTipoQuartoDESCRICAO: TStringField;
    cdsTipoQuartoORDEM: TIntegerField;
    cdsDiagnosticosAAplicarQUARTO: TSmallintField;
    sqlDiagnosticosAAplicarQUARTO: TSmallintField;
    cdsDiagnosticosAAplicarDIAGNOSTICO2: TStringField;
    sqlDiagnosticosDisponiveisPOR_QUARTO: TStringField;
    cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField;
    cdsResumoAnimalSTATUS_VACA: TStringField;
    sqlResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField;
    cdsResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField;
    sqlResumoAnimalNASCIMENTO: TSQLTimeStampField;
    sqlResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField;
    sqlResumoAnimalKULTIMA_MONTA: TStringField;
    sqlResumoAnimalKULTIMO_PARTO: TStringField;
    cdsResumoAnimalNASCIMENTO: TSQLTimeStampField;
    cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField;
    cdsResumoAnimalKULTIMA_MONTA: TStringField;
    cdsResumoAnimalKULTIMO_PARTO: TStringField;
    procedure dspDiagnosticosAAplicarBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsProtocolosAAplicarBeforeInsert(DataSet: TDataSet);
    procedure cdsProtocolosAAplicarBeforeEdit(DataSet: TDataSet);
    procedure cdsDiagnosticosAAplicarKZOO_DIAGNOSTICOValidate(Sender: TField);
    procedure cdsProtocolosAAplicarSELECTEDGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsDiagnosticosAAplicarBeforePost(DataSet: TDataSet);
    procedure cdsDiagnosticosAAplicarDATAValidate(Sender: TField);
    procedure dtsFichaAnimalDataChange(Sender: TObject; Field: TField);
    procedure cdsResumoAnimalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FProtocoloSelected : integer ;
    procedure UpdateListaProtocolos ;
    procedure InsereDiagnostico ( AKAnimal : string ; ADiagnostico : String ; AQuarto : integer ; ADate : TDateTime ; AProtocolos : TCustomClientDataset )  ;
    procedure GetListaProtocolos ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure OpenFichaAnimal ( AKAnimal : string ) ;
    function AddBrinco ( ABrinco : string  ) : boolean ;
    function AddByKey ( AKey : string  ) : boolean ;
    procedure ApplyUpdates ; override ;

  end;

implementation

uses Exceptions, UDBZootecnico, GuidSuppl, SQLTimSt , CLAg5Types,
     DiagnosticosAnimalClass, ProtocolosAnimalClass, ThreadSuppl,
     CDSSuppl, ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

function TZoo_SanidadeDiagnosticosDatamodule.AddBrinco(ABrinco: string): boolean;
var
    KeyAnimal : string ;
begin
    cdsDiagnosticosAAplicar.Edit ;
    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;
    if Result then
       AddByKey ( KeyAnimal )
end;

function TZoo_SanidadeDiagnosticosDatamodule.AddByKey(AKey: string): boolean;
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
         'KZOO_ANIMAL, BRINCO, NOMEESTABULO, STATUS'
  +#13#10'FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA )'
  +#13#10'AND ( KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;
       Result := not cdsTmpAnimal.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cdsTmpAnimal.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       with cdsTmpAnimal do
         begin
           cdsDiagnosticosAAplicar.Edit ;
           cdsDiagnosticosAAplicarKZOO_ANIMAL.asString  := fieldByName ( 'KZOO_ANIMAL' ).asString ;
//           cdsDiagnosticosAAplicarKZOO_ANIMAL.asString  := fieldByName ( 'KZOO_ANIMAL' ).asString ;
           cdsDiagnosticosAAplicarKCAD_FAZENDA.asString := LoggedUser.DomainID ;
           cdsDiagnosticosAAplicarBRINCO.asString  :=  fieldByName ( 'BRINCO' ).asString ;
           cdsDiagnosticosAAplicarNOMEESTABULO.asString := fieldByName ( 'BRINCO' ).asString +
                                                                         ' - ' + fieldByName ( 'NOMEESTABULO' ).asString ;
         //  cdsDiagnosticosAAplicar.post ;
         end;
//         cdsDiagnosticosAplicados.Close ;
//         cdsDiagnosticosAplicados.params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsTmpAnimal.fieldByName ( 'KZOO_ANIMAL' ).asString ;
//         cdsDiagnosticosAplicados.Open ;
    finally
       if assigned ( cdsTmpAnimal ) then
          cdsTmpAnimal.free ;
       p.free ;
    end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.GetListaProtocolos;
var
   p : TParams ;
   cdsTmpProtocolos : TClientDataSet ;
begin

   p := TParams.Create ;
   p.CreateParam( ftString, 'KZOO_DIAGNOSTICO', ptInput ).asString := cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO.asString ;

   cdsTmpProtocolos := nil ;
   DBResources['ZOOTECNICO'].populateClientDataSet( cdsTmpProtocolos, sql_get_protocolos_iniciar, p  ) ;

   with cdsTmpProtocolos do
       while not eof do
          begin
           cdsProtocolosAAplicar.AppendRecord (
             [
               fieldByName ( 'KZOO_PROTOCOLO' ).asString,
               fieldByName ( 'CODIGO' ).asString + ' - ' + fieldByName ( 'NOME' ).asString,
               1
             ] );
           next ;
          end ;
   cdsProtocolosAAplicar.First ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.ApplyUpdates;
begin
  TCDSSuppl.ApplyUpdates ( cdsDiagnosticosAAplicar ) ;
  TCDSSuppl.CreateDataSet( cdsDiagnosticosAAplicar ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarBeforePost(
  DataSet: TDataSet);
begin
  if cdsDiagnosticosAAplicarDATA.IsNull then
     raise Warning.Create('Selecione uma data');

  if cdsDiagnosticosAAplicarKZOO_ANIMAL.IsNull then
     raise Warning.Create('Selecione um animal');

  if cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO.IsNull then
     raise Warning.Create('Selecione um diagnóstico');
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarDATAValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
      raise Warning.Create('Data do diagnóstico não pode ser superior a data atual.');
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticosAAplicarKZOO_DIAGNOSTICOValidate(
  Sender: TField);
begin
   if not cdsDiagnosticosDisponiveisPOR_QUARTO.AsBoolean then
      cdsDiagnosticosAAplicarQUARTO.Clear
   else if cdsDiagnosticosAAplicarQUARTO.IsNull then
      cdsDiagnosticosAAplicarQUARTO.asInteger := 1 ;

   ThreadSuppl.TSyncThread.Create(  UpdateListaProtocolos )
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicarBeforeEdit(DataSet: TDataSet);
begin
  inherited;
   FProtocoloSelected := cdsProtocolosAAplicarSELECTED.asInteger ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicarBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  FProtocoloSelected := 0 ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosAAplicarSELECTEDGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
          Text := ''
       else if Sender.AsInteger = 1 then
          Text := 'Sim'
       else
          Text := 'Não'
     end
  else
     Text := Sender.AsString ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsResumoAnimalCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State in [dsInternalCalc] then
      begin
         if cdsResumoAnimalULTIMA_LACTACAO.IsNull then
           cdsResumoAnimalDPP.clear
         else
           cdsResumoAnimalDPP.asInteger := Trunc ( Date ) - Trunc (cdsResumoAnimalULTIMA_LACTACAO.AsDateTime ) + 1 ;

         if ( cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO.AsString = EmptyStr) then
          cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia'
         else
           if ( cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO.AsString = cdsResumoAnimalKULTIMA_MONTA.AsString ) then
              begin
              (*
                   if ( cdsResumoAnimalABORTOPARTO.IsNull ) then
                     begin
                         if cdsResumoAnimalPRENHEZ.AsString = 'T' then
                           begin
                             cdsResumoAnimalSTATUS_VACA.AsString  := 'Prenhe';
                             cdsResumoAnimalDESC_PRENHEZ.AsString := 'Sim';
                           end
                         else if cdsResumoAnimalPRENHEZ.AsString = 'F' then
                           begin
                             cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';
                             cdsResumoAnimalDESC_PRENHEZ.AsString := 'Não';
                           end
                         else
                            cdsResumoAnimalSTATUS_VACA.AsString := 'Coberta';
                     end
                   else
                      cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';
             *)
              end
           else
             cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';

      end;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.dspDiagnosticosAAplicarBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;
  if ( SourceDS = sqlDiagnosticosAAplicar ) then
   InsereDiagnostico ( DeltaDS.FieldByName( 'KZOO_ANIMAL' ).asString,
                       DeltaDS.FieldByName( 'KZOO_DIAGNOSTICO' ).asString,
                       DeltaDS.FieldByName( 'QUARTO' ).asInteger,
                       DeltaDS.FieldByName( 'DATA' ).asDateTime,
                       TClientDataSet ( TDataSetField ( DeltaDS.FieldByName('sqlProtocolosAAplicar') ).NestedDataSet ) ) ;

  Applied := True ;
end;


procedure TZoo_SanidadeDiagnosticosDatamodule.dtsFichaAnimalDataChange(Sender: TObject;
  Field: TField);
begin
   if Assigned ( Field ) and ( Field <> cdsDiagnosticosAAplicarKZOO_ANIMAL )
   or ( cdsDiagnosticosAAplicarKZOO_ANIMAL.asString = cdsDiagnosticosAplicados.params.ParamByName ( 'KZOO_ANIMAL' ).asString ) then
      exit ;

         cdsDiagnosticosAplicados.Close ;
         cdsDiagnosticosAplicados.params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsDiagnosticosAAplicarKZOO_ANIMAL.asString ;
         TCDSSuppl.Open (  cdsDiagnosticosAplicados ) ;

         cdsResumoAnimal.Close ;
         cdsResumoAnimal.params.ParamByName ( 'KZOO_ANIMAL' ).asString := cdsDiagnosticosAAplicarKZOO_ANIMAL.asString ;
         TCDSSuppl.Open ( cdsResumoAnimal ) ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenFichaAnimal ( AKAnimal : string ) ;
begin
   cdsDiagnosticosAAplicar.Params.ParamByName( 'KZOO_ANIMAL' ).asString := AKAnimal ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenTables;
begin
//  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_FEMEA,       cdsStatusAnimal      ) ;
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_EVENTO_ZOO,    cdsTipoEvento        );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_DIAGNOSTICO, cdsStatusDiagnostico );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsTipoQuarto );

  cdsDiagnosticosDisponiveis.Params.ParamByName(  'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
  TCDSSuppl.Open (  cdsDiagnosticosDisponiveis ) ;
  TCDSSuppl.CreateDataSet( cdsDiagnosticosAAplicar ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.UpdateListaProtocolos;
begin
   while not cdsProtocolosAAplicar.eof do
     cdsProtocolosAAplicar.delete ;

   if not cdsDiagnosticosAAplicarKZOO_DIAGNOSTICO.IsNull then
      GetListaProtocolos ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.InsereDiagnostico ( AKAnimal : string ; ADiagnostico : String ; AQuarto : integer ; ADate : TDateTime ; AProtocolos : TCustomClientDataset )  ;
var
  KDiagnosticoAnimal : string ;
begin
    Try

      KDiagnosticoAnimal := TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, ADiagnostico, AQuarto, ADate, '', True,  False  ) ;

      with AProtocolos do
        begin
          first ;
          while not eof  do
            begin
              if fieldByName( 'SELECTED' ).asInteger <> 0 then
                TProtocolosAnimal.AddProtocolo ( AKAnimal, fieldByName ( 'KZOO_PROTOCOLO' ).asString, ADate, KDiagnosticoAnimal, '', '', 0, True, '', True, False ) ;
              Next ;
            end ;
        end ;

    except on E : Exception do
        RaiseException( E, UnitName, ClassName,  'InsereDiagnostico' )
    End;

end;

end.




