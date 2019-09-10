unit UZoo_ReproducaoPartosAbortosDatamodule;

interface


uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, ProtocolosAnimalClass,
   UdtmSYS_BASE,
  UDBZootecnico, UZoo_GrauDeSangueClass ;


type
  TZoo_ReproducaoPartosAbortosDatamodule = class ;

  TGetCria = function (  A : TZoo_ReproducaoPartosAbortosDatamodule ) : boolean of object  ;

  TFilterTypes = ( ftTodos, ftPrenhez, ftPrevisaoParto ) ;

  TZoo_ReproducaoPartosAbortosDatamodule = class(T_dtmBASE)
    cdsPartosAbortos: TClientDataSet;
    dspPartosAbortos: TDataSetProvider;
    sqlPartosAbortos: TTcSQLDataSet;
    sqlPartosAbortosKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlPartosAbortosKZOO_ANIMAL_FEMEA: TStringField;
    sqlPartosAbortosBRINCOFEMEA: TStringField;
    sqlPartosAbortosNOMEFEMEA: TStringField;
    cdsLinhagem: TClientDataSet;
    sqlPartosAbortosABORTOPARTO: TIntegerField;
    sqlPartosAbortosDATAABORTOPARTO: TSQLTimeStampField;
    cdsTipoMuco: TClientDataSet;
    cdsTipoMucoTIPO: TStringField;
    cdsTipoMucoVALOR: TStringField;
    cdsTipoMucoDESCRICAO: TStringField;
    cdsTipoMucoORDEM: TIntegerField;
    cdsStatusGestacaoTIPO: TStringField;
    cdsStatusGestacaoVALOR: TStringField;
    cdsStatusGestacaoDESCRICAO: TStringField;
    cdsStatusGestacaoORDEM: TIntegerField;
    sqlLinhagem: TTcSQLDataSet;
    dtsSQLPartosAbortos: TDataSource;
    cdsStatusGestacao: TClientDataSet;

    cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsPartosAbortosKZOO_ANIMAL_FEMEA: TStringField;
    cdsPartosAbortosBRINCOFEMEA: TStringField;
    cdsPartosAbortosNOMEFEMEA: TStringField;
    cdsPartosAbortosABORTOPARTO: TIntegerField;
    cdsPartosAbortosDATAABORTOPARTO: TSQLTimeStampField;
    cdsPartosAbortosDESC_PARTOABORTO: TStringField;
    cdsPartosAbortossqlLinhagem: TDataSetField;
    cdsPartosAbortosPREVISAOPARTO: TSQLTimeStampField;
    cdsPartosAbortosDIAS: TIntegerField;
    cdsPartosAbortosABRIRLACTACAO: TStringField;
    cdsPartosAbortosINCLUIRCRIA: TStringField;
    cdsPartosAbortosSELECTED: TStringField;
    cdsPartosAbortosCHAVELACTACAO: TStringField;

    sqlPartosAbortosABRIRLACTACAO: TStringField;
    sqlPartosAbortosINCLUIRCRIA: TStringField;
    sqlPartosAbortosSELECTED: TStringField;
    cdsLinhagemNUMERO: TStringField;
    sqlPartosAbortosCHAVELACTACAO: TStringField;
    sqlPartosAbortosSTATUS: TIntegerField;
    sqlPartosAbortosNUMERO_LACTACAO: TIntegerField;
    cdsPartosAbortosSTATUS: TIntegerField;
    cdsPartosAbortosNUMERO_LACTACAO: TIntegerField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsLinhagemRACA: TIntegerField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsLinhagemDESCR_RACA: TStringField;
    sqlPartosAbortosDATAEVENTO: TSQLTimeStampField;
    cdsPartosAbortosDATAEVENTO: TSQLTimeStampField;
    sqlPartosAbortosDATATOQUE: TSQLTimeStampField;
    cdsPartosAbortosDATATOQUE: TSQLTimeStampField;
    sqlPartosAbortosPROTOCOLO_PARTO: TStringField;
    cdsPartosAbortosPROTOCOLO_PARTO: TStringField;
    sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    sqlLinhagemKZOO_ANIMAL: TStringField;
    sqlLinhagemNATIMORTO: TStringField;
    sqlLinhagemKZOO_ANIMAL_MACHO: TStringField;
    sqlLinhagemNOMEPAI: TStringField;
    sqlLinhagemREGISTROPAI: TStringField;
    sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    sqlLinhagemNOMEMAE: TStringField;
    sqlLinhagemREGISTROMAE: TStringField;
    sqlLinhagemRACA: TIntegerField;
    sqlLinhagemPESO: TIntegerField;
    sqlLinhagemALTURA: TIntegerField;
    sqlLinhagemSEXO: TStringField;
    sqlLinhagemNASCIMENTO: TSQLTimeStampField;
    cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsLinhagemKZOO_ANIMAL: TStringField;
    cdsLinhagemNATIMORTO: TStringField;
    cdsLinhagemKZOO_ANIMAL_MACHO: TStringField;
    cdsLinhagemNOMEPAI: TStringField;
    cdsLinhagemREGISTROPAI: TStringField;
    cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    cdsLinhagemNOMEMAE: TStringField;
    cdsLinhagemREGISTROMAE: TStringField;
    cdsLinhagemPESO: TIntegerField;
    cdsLinhagemALTURA: TIntegerField;
    cdsLinhagemSEXO: TStringField;
    cdsLinhagemNASCIMENTO: TSQLTimeStampField;
    sqlLinhagemNOMECOMPLETO: TStringField;
    sqlLinhagemNOMEESTABULO: TStringField;
    sqlLinhagemBRINCO: TStringField;
    cdsLinhagemBRINCO: TStringField;
    cdsLinhagemNOMEESTABULO: TStringField;
    cdsLinhagemNOMECOMPLETO: TStringField;
    sqlLinhagemLOTE: TStringField;
    cdsLinhagemLOTE: TStringField;
    sqlLinhagemKZOO_LACTACAO: TStringField;
    sqlLinhagemGRAUSANGUE: TStringField;
    cdsLinhagemKZOO_LACTACAO: TStringField;
    cdsLinhagemGRAUSANGUE: TStringField;
    sqlLinhagemCOMPOSICAORACA: TStringField;
    sqlLinhagemGRAUSANGUEPAI: TStringField;
    sqlLinhagemCOMPOSICAORACAPAI: TStringField;
    sqlLinhagemGRAUSANGUEMAE: TStringField;
    sqlLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemCOMPOSICAORACA: TStringField;
    cdsLinhagemGRAUSANGUEPAI: TStringField;
    cdsLinhagemCOMPOSICAORACAPAI: TStringField;
    cdsLinhagemGRAUSANGUEMAE: TStringField;
    cdsLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemGSR_PAI: TStringField;
    cdsLinhagemGSR_MAE: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    cdsPartosAbortosGRAUSANGUEPAI: TStringField;
    cdsPartosAbortosCOMPOSICAORACAPAI: TStringField;
    cdsPartosAbortosGRAUSANGUEMAE: TStringField;
    cdsPartosAbortosCOMPOSICAORACAMAE: TStringField;
    sqlPartosAbortosGRAUSANGUEPAI: TStringField;
    sqlPartosAbortosCOMPOSICAORACAPAI: TStringField;
    sqlPartosAbortosGRAUSANGUEMAE: TStringField;
    sqlPartosAbortosCOMPOSICAORACAMAE: TStringField;
    sqlPartosAbortosTIPOEVENTO: TIntegerField;
    cdsPartosAbortosTIPOEVENTO: TIntegerField;
    cdsPartosAbortosFORCEABORTO: TStringField;
    sqlPartosAbortosLOTEPARTO: TStringField;
    cdsPartosAbortosLOTEPARTO: TStringField;
    sqlPartosAbortosLOTE: TStringField;
    cdsPartosAbortosLOTE: TStringField;
    cdsPartosAbortosNUMEROFILHOS: TSmallintField;
    cdsPartosAbortosBRINCOFEMEA_: TStringField;
    sqlPartosAbortosBRINCOFEMEA_: TStringField;
    sqlPartosAbortosRETIRO: TStringField;
    cdsPartosAbortosRETIRO: TStringField;
    sqlLinhagemRETIRO_CRIA: TStringField;
    cdsLinhagemRETIRO_CRIA: TStringField;
    cdsListaProtocolos: TClientDataSet;
    cdsProtocolosParto: TClientDataSet;
    cdsProtocolosPartoKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsProtocolosPartoKZOO_PROTOCOLO: TStringField;
    cdsProtocolosPartoSELECTED: TIntegerField;
    cdsProtocolosPartoCODIGO: TStringField;
    cdsProtocolosPartoNOME: TStringField;
    cdsProtocolosCria: TClientDataSet;
    cdsProtocolosCriaSELECTED: TIntegerField;
    cdsProtocolosCriaKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsProtocolosCriaKZOO_PROTOCOLO: TStringField;
    cdsProtocolosCriaCODIGO: TStringField;
    cdsProtocolosCriaNOME: TStringField;
    cdsPartosAbortosDESCR_PROTOCOLOS: TStringField;
    cdsProtocolosPartoSOMA_SELECTED: TAggregateField;
    cdsProtocolosCriaSOMA_SELECTED: TAggregateField;
    procedure cdsPartosAbortosBeforeOpen(DataSet: TDataSet);
    procedure cdsPartosAbortosDATAABORTOPARTOValidate(Sender: TField);
    procedure cdsPartosAbortosCalcFields(DataSet: TDataSet);
    procedure cdsPartosAbortosSELECTEDValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsLinhagemBeforePost(DataSet: TDataSet);
    procedure dspPartosAbortosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsLinhagemPESOValidate(Sender: TField);
    procedure cdsLinhagemALTURAValidate(Sender: TField);
    procedure cdsPartosAbortosBeforePost(DataSet: TDataSet);
    procedure cdsLinhagemBRINCOValidate(Sender: TField);
    procedure cdsLinhagemGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsPartosAbortosINCLUIRCRIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPartosAbortosPROTOCOLO_PARTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPartosAbortosABORTOPARTOValidate(Sender: TField);
    procedure cdsLinhagemGRAUSANGUEValidate(Sender: TField);
    procedure cdsLinhagemCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsPartosAbortosNUMEROFILHOSGetText(
       Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPartosAbortosINCLUIRCRIAChange(Sender: TField);
  private
    { Private declarations }
    FSQL : string ;
    FTipoFiltro : TFilterTypes ;
    FDataInicio, FDataFim : TDateTime ;
    FOnGetCria: TGetCria;
    FDataPadraoOcorrencia: TDateTime;
    DiasPartoMultipara : integer ;
    DiasAbortoMultipara : integer  ;
    DiasPartoPrimipara : integer ;
    DiasAbortoPrimipara : integer ;
    FDeltaKeyLactacao : string ;
    FDeltaSelected  : boolean ;
    FDeltaIncluirCria : boolean ;
    FDeltaAbrirLactacao : boolean ;
    FDeltaAplicarProtocolo : boolean ;
    FDeltaDataPartoAborto  : TDateTime ;
    FDeltaKZOO_EVENTO_ZOOTECNICO  : String ;
    FDeltaORIGINADO_DE_EMBRIAO : String ;
    FGrauDeSangue : TZoo_GrauDeSangue ;
    FAbriuCadastroCria : Boolean ; //VTS
    procedure RevertRecord ;
    procedure SetParams ;
    procedure SetOnGetCria(const Value: TGetCria);
    procedure DoGetCria ;
    procedure SetDataPadraoOcorrencia(const Value: TDateTime);
    procedure PrepareSQL ;
    procedure CalculoPrevisaoParto ;
    procedure CalculateGrauSangue ;
    function ChecaAnimalSeco(KZOO_ANIMAL : string) : Boolean ;


    procedure LoadListaProtocolos;
    procedure ClearAllCdsProtocolos( ACds: TClientDataSet );
    procedure SetListaProtocolosToCds( ACds: TClientDataSet );
    procedure ClearCdsProtocolosByEventosZootecnicos( ACds: TClientDataSet );
    procedure InsertProtocolos(
  ACds: TClientDataSet;
  AKZooEventoZootecnico, AKZooAnimalFemea: String; AData: TDateTime);

public
    { Public declarations }
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddBrinco ( ABrinco : string ) : boolean ;
    function AddByKey (
              AKey : string ;
              AKZOO_EVENTO_ZOOTECNICO : String ;
              ATipoEvento : Integer ;
              ADataEvento : TDateTime ;
              ANumeroLactacao : integer ) : boolean ;
    procedure RemoveEvento ;
    procedure PostCria ;
    property OnGetCria : TGetCria  read FOnGetCria write SetOnGetCria;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    procedure OpenTables ; override ;
    procedure SetFilter ( AFilterType : TFilterTypes ;  ADataInicio, ADataFim : TDateTime ) ;
    property DataPadraoOcorrencia : TDateTime  read FDataPadraoOcorrencia write SetDataPadraoOcorrencia;
    function processa ( out ErrMsg : string ) : boolean  ;
    procedure UpdateRacasGrauSangue ;
    procedure SetComposicaoRacas ;
    property GrauDeSangue : TZoo_GrauDeSangue read FGrauDeSangue ;


    procedure UpdateDescrProtocolos;
    procedure FilterProtocolosByEventoZootecnico;
    procedure InvertSelecao( cds : TClientDataSet);
    procedure InvertAllSelection(
  ASelectAll: Boolean; Acds: TClientDataSet);
    function IsAllSelected( ACds: TClientDataSet ): Boolean;
    function NothingSelected( ACds: TClientDataSet ): Boolean;

  end;

implementation

uses StrUtils,
     Exceptions, Data.SQLTimSt, DateUtils ,
     ThreadSuppl, CLAg5Types,
     DiagnosticosAnimalClass,
     CDSSuppl,
     GuidSuppl,
     ClAg5ClientCommonTypes,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

const
  _AUTO_EVT_CHECVET_RECEMPARIDA      =   'AUTO_EVT_CHECVET_RECEMPARIDA'    ;
  _AUTO_EVT_PARTO_MATRIZ             =   'AUTO_EVT_PARTO_MATRIZ'           ;
  _AUTO_EVT_PARTO_CRIA               =   'AUTO_EVT_PARTO_CRIA'             ;

{ TdtmCustomListaFicha }

function TZoo_ReproducaoPartosAbortosDatamodule.processa( out ErrMsg : string ) : boolean  ;
var
  HasSelected : boolean ;
begin
  ErrMsg := '' ;
  HasSelected := False ;

  //VTS
  if cdsPartosAbortos.State in [dsInsert, dsEdit] then
     cdsPartosAbortos.Post;

  with cdsPartosAbortos do
    try

      DisableControls ;
      First ;
      while not eof  do
        begin
          HasSelected := HasSelected or cdsPartosAbortosSELECTED.AsBoolean ;

          if ( cdsPartosAbortosABRIRLACTACAO.AsBoolean )
            and ChecaAnimalSeco(cdsPartosAbortosKZOO_ANIMAL_FEMEA.AsString) then
              ErrMsg := ErrMsg + #13#10 +  cdsPartosAbortosBRINCOFEMEA.AsString + ' - ' + cdsPartosAbortosNOMEFEMEA.AsString ;

          next ;
        end;
    finally
      First ;
      EnableControls ;
      Result := True;
    end ;

  if ( ErrMsg <> '' )then
     Exit ( False ) ;

  if not HasSelected then
    raise Warning.Create('Não há animais a processar') ;

  ApplyUpdates ;
  OpenTables;
end;

function TZoo_ReproducaoPartosAbortosDatamodule.ChecaAnimalSeco(KZOO_ANIMAL : string) : Boolean ;
var
  cds : TClientDataSet ;
    p : TParams ;
begin

  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KZOO_ANIMAL', ptInput ).AsString := KZOO_ANIMAL ;
    p.CreateParam ( ftString, 'STATUS', ptInput ).AsInteger     := _ST_STATUS_FEMEA_VACALACTACAO ;

    DBResources['ZOOTECNICO'].populateClientDataSet ( cds, 'SELECT 1 RESULT ' +
                                 'FROM ZOO_ANIMAIS AN ' +
                                 'WHERE AN.KZOO_ANIMAL = :KZOO_ANIMAL ' +
                                 '  AND STATUS = :STATUS', p ) ;

    Result := not cds.FieldByName( 'RESULT' ).IsNull;

  finally
    cds.Free;
    p.Free;
  end;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.ClearAllCdsProtocolos( ACds: TClientDataSet );
begin
  ACds.Filtered := False;
  ACds.DisableControls;
  ACds.First;
  while not ACds.Eof do
    ACds.Delete;

  ACds.EnableControls;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.ClearCdsProtocolosByEventosZootecnicos( ACds: TClientDataSet );
begin
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_EVENTO_ZOOTECNICO = ''%s'' ', [cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.AsString] );
  ACds.Filtered := True;

  ACds.DisableControls;
  ACds.First;
  while not ACds.Eof do
    ACds.Delete;

  ACds.EnableControls;
end;

constructor TZoo_ReproducaoPartosAbortosDatamodule.Create(AOwner: TComponent);
var
  LstRacas : TStringList ;
begin
  inherited Create ( AOwner ) ;
  FSQL := sqlPartosAbortos.CommandText ;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_SIGLA_STATUS_FEMEA, cdsStatusAnimal );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_MUCO,          cdsTipoMuco );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_STATUS_GESTACAO,    cdsStatusGestacao );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_RACA_ANIMAIS,       cdsTipoRacasAnimais ) ;

  FGrauDeSangue := TZoo_GrauDeSangue.Create ;

  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_COMPOSICAORACA,  cdsTipoComposicaoRaca  ) ;

  FAbriuCadastroCria := False ; //VTS

  with cdsTipoComposicaoRaca do
    begin
      LstRacas := TStringList.Create ;
      while not eof do
         begin
            LstRacas.Add ( cdsTipoComposicaoRacaVALOR.asString ) ;
            Next ;
         end;

      self.FGrauDeSangue.ListaRacas := LstRacas.CommaText ;
      LstRacas.Free ;

    end;

end;

destructor TZoo_ReproducaoPartosAbortosDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.DoGetCria ;
begin
   if not Assigned (  FOnGetCria ) then
        RaiseException( nil, UnitName, ClassName,  'Evento OnGetCria não associado' ) ;

   if not FOnGetCria ( self ) then
   begin
     cdsPartosAbortos.Edit;
     FAbriuCadastroCria := true;
     cdsPartosAbortosINCLUIRCRIA.asString := 'F' ;
     cdsPartosAbortos.Post;
   end;


end;


procedure TZoo_ReproducaoPartosAbortosDatamodule.OpenTables;
var
  cds : TClientDataSet ;

begin

  LoadListaProtocolos;
  ClearAllCdsProtocolos( cdsProtocolosParto );
  ClearAllCdsProtocolos( cdsProtocolosCria );

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,         DiasPartoPrimipara,  DiasPartoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, DiasAbortoPrimipara, DiasAbortoMultipara ) ;

  cds := nil ;
  PrepareSQL ;

  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, sqlPartosAbortos.CommandText , sqlPartosAbortos.params ) ;

  if cdsPartosAbortos.Active then
    begin
     cdsPartosAbortos.Close ;
    end ;

  cdsPartosAbortosSELECTED.OnValidate := nil ;
  cdsPartosAbortosINCLUIRCRIA.OnValidate := nil ;

  TCDSSuppl.CreateDataSet( cdsPartosAbortos ) ;
  cdsPartosAbortos.DisableControls ;
  cdsPartosAbortos.IndexFieldNames := 'BRINCOFEMEA_' ;
  cdsPartosAbortos.BeforePost := nil ;

//  cdsPartosAbortos.LogChanges := False ;
  with cds do
    while not cds.eof do
      begin
        cdsPartosAbortos.Append ;

        cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.asString := FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString   ;
        cdsPartosAbortosKZOO_ANIMAL_FEMEA.asString      := FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).asString   ;
// removido em 05.05.2011 por augusto / caique conforme especificao
//        cdsPartosAbortosNOMEMACHO.asString              := FieldByName ( 'NOMEMACHO'              ).asString   ;
//        cdsPartosAbortosPRENHEZ.asString                := FieldByName ( 'PRENHEZ'                ).asString   ;
//        cdsPartosAbortosREEXAMINAR.asString             := FieldByName ( 'REEXAMINAR'             ).asString   ;

        cdsPartosAbortosTIPOEVENTO.asInteger            := FieldByName ( 'TIPOEVENTO'              ).asInteger ;
        cdsPartosAbortosDATATOQUE.asDateTime            := FieldByName ( 'DATATOQUE'              ).asDateTime ;

        cdsPartosAbortosDATAEVENTO.asDateTime           := FieldByName ( 'DATAEVENTO'             ).asDateTime ;
        cdsPartosAbortosBRINCOFEMEA.asString            := FieldByName ( 'BRINCOFEMEA'            ).asString   ;
        cdsPartosAbortosBRINCOFEMEA_.asString           := FieldByName ( 'BRINCOFEMEA_'            ).asString   ;
        cdsPartosAbortosNOMEFEMEA.asString              := FieldByName ( 'NOMEFEMEA'              ).asString   ;
//        cdsPartosAbortosPREVISAOPARTO.asDateTime        := FieldByName ( 'PREVISAOPARTO'          ).asDateTime ;
        cdsPartosAbortosSTATUS.asInteger                := FieldByName ( 'STATUS'                 ).asInteger  ;
        cdsPartosAbortosNUMERO_LACTACAO.asInteger          := FieldByName ( 'NUMERO_LACTACAO'           ).asInteger  ;

        cdsPartosAbortosGRAUSANGUEPAI.asString      :=    FieldByName ( 'GRAUSANGUEPAI'           ).asString  ;
        cdsPartosAbortosCOMPOSICAORACAPAI.asString  :=    FieldByName ( 'COMPOSICAORACAPAI'       ).asString  ;
        cdsPartosAbortosGRAUSANGUEMAE.asString      :=    FieldByName ( 'GRAUSANGUEMAE'           ).asString  ;
        cdsPartosAbortosCOMPOSICAORACAMAE.asString  :=    FieldByName ( 'COMPOSICAORACAMAE'       ).asString  ;

        cdsPartosAbortosSELECTED.asString               := 'F' ;
        cdsPartosAbortosABRIRLACTACAO.asString          := 'F' ;
        cdsPartosAbortosINCLUIRCRIA.asString            := 'F' ;
        cdsPartosAbortosPROTOCOLO_PARTO.asString        := 'T' ;
        cdsPartosAbortosRETIRO.AsString                 := FieldByName ( 'RETIRO'       ).asString  ;
//    cdsPartosAbortosABORTOPARTO.asInteger           := FieldByName ( 'ABORTOPARTO' ).asInteger ;
//    cdsPartosAbortosDATAABORTOPARTO.asDateTime      := FieldByName ( '' ).asString;
//    cdsPartosAbortosDESC_EVENTO.asString            := FieldByName ( '' ).asString;
//    cdsPartosAbortosDESC_PARTOABORTO.asString       := FieldByName ( '' ).asString;
//    cdsPartosAbortosDIAS.asInteger                  := ;
//    cdsPartosAbortosABRIRLACTACAO.asString          :=
//    cdsPartosAbortosINCLUIRCRIA.asString :=
//    cdsPartosAbortosCHAVELACTACAO.asString :=
        cdsPartosAbortos.Post ;
        cds.Next ;
      end ;

  cdsPartosAbortos.BeforePost := cdsPartosAbortosBeforePost ;
  cdsPartosAbortos.First ;
  cdsPartosAbortos.EnableControls ;
//  cdsPartosAbortos.LogChanges := True ;

  cdsPartosAbortosSELECTED.OnValidate      := cdsPartosAbortosSELECTEDValidate ;
//  cdsPartosAbortosINCLUIRCRIA.OnValidate   := cdsPartosAbortosINCLUIRCRIAValidate ;

  cds.free ;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.PostCria;
begin
  if ( cdsLinhagem.State in [dsInsert,dsEdit] ) then
    cdsLinhagem.Post ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.PrepareSQL;
var
  newSQL: string ;
begin
   newSQL := FSQL ;

   newSQL := newSQL + ' AND ( AF.KCAD_FAZENDA = :KCAD_FAZENDA )' ;
   newSQL := newSQL + ' AND ( AF.STATUS <> :STATUS_DESCARTADO  )' ;

   if FTipoFiltro = ftPrenhez then
     newSQL := newSQL + ' AND ( E.DATATOQUE BETWEEN :D1 AND :D2 )'
   else if FTipoFiltro = ftPrevisaoParto then
     begin
        newSQL := newSQL + ' AND ( PRENHEZ IS DISTINCT FROM ''F'' )'
           +#13#10' AND ('
           +#13#10'          (( DAF.NUMERO_LACTACAO > 1 ) and ( dateadd( :DIASMULTIPARA DAY TO E.DATAEVENTO ) <= :DATA ))'
           +#13#10'      OR  (( DAF.NUMERO_LACTACAO <= 1 ) and ( dateadd( :DIASPRIMIPARA DAY TO E.DATAEVENTO ) <= :DATA ))'
           +#13#10'      )' ;

        if not ParametrosFazenda( LoggedUser.DomainID ).ExibirPartoSemconfirmacao then
          newSQL := newSQL + ' AND (DATATOQUE IS NOT NULL AND PRENHEZ = ''T'')' ;

     end;

//     AND ( PREVISAOPARTO<= :DATAFINAL )

    newSQL := newSQL + #13#10'ORDER BY AF.BRINCO_' ;


   if ( sqlPartosAbortos.CommandText <> newSQL ) then
     begin
       sqlPartosAbortos.Params.Clear ;
       sqlPartosAbortos.CommandText := newSQL ;
     end ;

//   if FTipoFiltro <> ftTodos then
//    begin
//       sqlPartosAbortos.params.paramByName ( 'D1' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( FDataInicio  ) ) ;
//       sqlPartosAbortos.params.paramByName ( 'D2' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay  ( FDataFim     ) ) ;
//    end ;

   sqlPartosAbortos.params.paramByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
   sqlPartosAbortos.params.paramByName ( 'STATUS_DESCARTADO' ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

   if FTipoFiltro = ftPrenhez then
     begin
       sqlPartosAbortos.params.paramByName ( 'D1' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( FDataInicio  ) ) ;
       sqlPartosAbortos.params.paramByName ( 'D2' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay  ( FDataFim     ) ) ;
     end
   else if FTipoFiltro = ftPrevisaoParto then
     begin
       //sqlPartosAbortos.params.paramByName ( 'DATAFINAL' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( FDataFim ) ) ;
       sqlPartosAbortos.params.paramByName ( 'DATA' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( FDataFim ) ) ;
       sqlPartosAbortos.params.paramByName ( 'DIASPRIMIPARA' ).asInteger := DiasPartoPrimipara ;
       sqlPartosAbortos.params.paramByName ( 'DIASMULTIPARA' ).asInteger := DiasPartoMultipara ;
     end ;


end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.RemoveEvento;
begin
   if not cdsPartosAbortos.isEmpty then
    begin
      ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosParto );
      ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosCria );
      cdsPartosAbortos.Delete ;
    end;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.RevertRecord;
begin
  cdsPartosAbortosDATAABORTOPARTO.OnValidate := nil ;
  cdsPartosAbortosSELECTED.OnValidate        := nil ;

  cdsPartosAbortosSELECTED.asString := 'F' ;
  cdsPartosAbortosABORTOPARTO.Clear ;
  cdsPartosAbortosDATAABORTOPARTO.Clear ;
  cdsPartosAbortosINCLUIRCRIA.asString := 'F' ;
  cdsPartosAbortosABRIRLACTACAO.asString := 'F' ;

  cdsPartosAbortosDATAABORTOPARTO.OnValidate := cdsPartosAbortosDATAABORTOPARTOValidate ;
  cdsPartosAbortosSELECTED.OnValidate        := cdsPartosAbortosSELECTEDValidate        ;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetComposicaoRacas;
begin
   if not ( cdsLinhagem.State in [dsInsert, dsEdit] ) then
     cdsLinhagem.Edit ;

   cdsLinhagemCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetDataPadraoOcorrencia(const Value: TDateTime);
begin
  FDataPadraoOcorrencia := Value;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetFilter(AFilterType: TFilterTypes; ADataInicio, ADataFim: TDateTime);
begin
   FTipoFiltro := AFilterType ;
   FDataInicio := ADataInicio ;
   FDataFim    := ADataFim ;
   OpenTables ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetListaProtocolosToCds( ACds: TClientDataSet );
var
  LProtocolo_Previous: String;
begin
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_EVENTO_ZOOTECNICO = ''%s'' ', [cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.AsString] );
  ACds.Filtered := True;

  if ACds.RecordCount > 0 then
    Exit;

  if cdsListaProtocolos.IsEmpty then
    Exit;

  LProtocolo_Previous := '';
  cdsListaProtocolos.First;
  while not cdsListaProtocolos.Eof do
   begin

     if LProtocolo_Previous <> cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString then
       ACds.Append
     else
       Acds.Edit;

     ACds.FieldByName('KZOO_EVENTO_ZOOTECNICO').AsString := cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.AsString;
     ACds.FieldByName('KZOO_PROTOCOLO').AsString         := cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString;
     ACds.FieldByName('CODIGO').AsString                 := cdsListaProtocolos.FieldByName('CODIGO').AsString;
     ACds.FieldByName('NOME').AsString                   := cdsListaProtocolos.FieldByName('NOME').AsString;
     if ((ACds = cdsProtocolosParto) and
         (cdsListaProtocolos.FieldByName('TIPOEVENTO').AsInteger = _ST_AUTO_EVT_PARTO) and
         ((cdsListaProtocolos.FieldByName('EVENTO_ID').AsString = _AUTO_EVT_PARTO_MATRIZ)
         )
        ) or
        ((ACds = cdsProtocolosCria) and
         (
           (
            (cdsListaProtocolos.FieldByName('TIPOEVENTO').AsInteger = _ST_AUTO_EVT_VETERINARIO) and
            (cdsListaProtocolos.FieldByName('EVENTO_ID').AsString = _AUTO_EVT_CHECVET_RECEMPARIDA)
           ) or
           (
            (cdsListaProtocolos.FieldByName('TIPOEVENTO').AsInteger = _ST_AUTO_EVT_PARTO) and
            (cdsListaProtocolos.FieldByName('EVENTO_ID').AsString = _AUTO_EVT_PARTO_CRIA)
           )
         )
        ) then
       ACds.FieldByName('SELECTED').AsInteger := 1
     else
     if ACds.FieldByName('SELECTED').AsInteger <> 1 then
        ACds.FieldByName('SELECTED').AsInteger := 0;

     ACds.Post;
     LProtocolo_Previous := cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString;
     cdsListaProtocolos.Next;
   end;


end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetOnGetCria(const Value: TGetCria);
begin
  FOnGetCria := Value;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.SetParams;
begin
(*
var
  newSQL: string ;
begin
   newSQL := FSQL ;

   if FTipoFiltro = ftPrenhez then
     newSQL := newSQL + ' AND ( E.DATATOQUE BETWEEN :D1 AND :D2 )'
   else if FTipoFiltro = ftPrevisaoParto then
     newSQL := newSQL + ' AND ( E.PREVISAOPARTO BETWEEN :D1 AND :D2 )' ;


   if ( sqlPartosAbortos.CommandText <> newSQL ) then
     begin
       sqlPartosAbortos.Params.Clear ;
       sqlPartosAbortos.CommandText := newSQL ;

       cdsPartosAbortos.Params.Clear ;
       cdsPartosAbortos.FetchParams ;
     end ;

   if FTipoFiltro <> ftTodos then
    begin
       cdsPartosAbortos.params.paramByName ( 'D1' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( FDataInicio  ) ) ;
       cdsPartosAbortos.params.paramByName ( 'D2' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay  ( FDataFim     ) ) ;
    end ;

*)
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.UpdateDescrProtocolos;
var
  LDescricao: String;
  LQtde_Protocolos_Selecionados_Parto,
  LQtde_Protocolos_Selecionados_Cria  : Integer;
begin
  LDescricao := '';
  LQtde_Protocolos_Selecionados_Parto := 0;
  LQtde_Protocolos_Selecionados_Cria  := 0;

  cdsProtocolosParto.First;
  while not cdsProtocolosParto.Eof do
   begin
     if cdsProtocolosPartoSELECTED.AsInteger = 1 then
      begin
        LDescricao := cdsProtocolosPartoNOME.AsString;
        LQtde_Protocolos_Selecionados_Parto := LQtde_Protocolos_Selecionados_Parto + 1;
      end;
     cdsProtocolosParto.Next;
   end;


  cdsProtocolosCria.First;
  while not cdsProtocolosCria.Eof do
   begin
     if cdsProtocolosCriaSELECTED.AsInteger = 1 then
      begin
        LDescricao := cdsProtocolosCriaNOME.AsString;
        LQtde_Protocolos_Selecionados_Cria := LQtde_Protocolos_Selecionados_Cria + 1;
      end;
     cdsProtocolosCria.Next;
   end;

  if (LQtde_Protocolos_Selecionados_Parto = 1) and
     (LQtde_Protocolos_Selecionados_Cria = 0) then
     LDescricao := 'aplicado(s) à matriz: '+LDescricao
  else
  if (LQtde_Protocolos_Selecionados_Parto = 0) and
     (LQtde_Protocolos_Selecionados_Cria = 1) then
     LDescricao := 'aplicado(s) à cria(s): '+LDescricao
  else
  if (LQtde_Protocolos_Selecionados_Parto = 0) and
     (LQtde_Protocolos_Selecionados_Cria = 0) then
     LDescricao := ''
  else
   begin
     LDescricao := '';
     if LQtde_Protocolos_Selecionados_Parto > 0 then
        LDescricao := '  aplicado(s) à matriz: '+IntToStr(LQtde_Protocolos_Selecionados_Parto)+' selecionado(s)';
     if LQtde_Protocolos_Selecionados_Cria > 0 then
        LDescricao := LDescricao + '; aplicado(s) à cria(s): '+IntToStr(LQtde_Protocolos_Selecionados_Cria)+' selecionado(s)';

     if Length(LDescricao) > 2 then
       LDescricao := Copy(LDescricao, 3,Length(LDescricao));
   end;

  if not (cdsPartosAbortos.State in [dsInsert, dsEdit] )then
     cdsPartosAbortos.Edit;

  cdsPartosAbortosDESCR_PROTOCOLOS.AsString := LDescricao;


end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsLinhagemCOMPOSICAORACA.asString ;
end;

function TZoo_ReproducaoPartosAbortosDatamodule.AddBrinco(ABrinco: string ): boolean;
var
    KeyAnimal : string ;
    KEVENTO_ZOOTECNICO : string ;
    TipoEvento : integer ;
    DataEvento : TDateTime ;
    NumeroLactacao : integer ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsPartosAbortos.Edit ;
         exit ;
      end ;

    Result := TAnimalFemea.GetUltimaMontaPossivelPrenhezFromBrinco( LoggedUser.DomainID, ABrinco, KeyAnimal, KEVENTO_ZOOTECNICO, TipoEvento, DataEvento, NumeroLactacao  ) ;
      ///TAnimalFemea.GetUltimaMontaFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal, KEVENTO_ZOOTECNICO, TipoEvento, DataEvento, NumeroLactacao  ) ;
    if Result then
       AddByKey ( KeyAnimal, KEVENTO_ZOOTECNICO, TipoEvento, DataEvento, NumeroLactacao  ) ;

end;

function TZoo_ReproducaoPartosAbortosDatamodule.AddByKey (
              AKey : string ;
              AKZOO_EVENTO_ZOOTECNICO : String ;
              ATipoEvento : Integer ;
              ADataEvento : TDateTime ;
              ANumeroLactacao : integer ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin


    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKey ;
    cds := nil ;
    try
//       DBResources.populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'A.KZOO_ANIMAL, A.BRINCO, A.NOMEESTABULO, A.STATUS, F.LOTE, F.RETIRO'
        + #13#10' FROM ZOO_ANIMAIS A'
        + #13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
        + #13#10' WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       with cds do
         begin
           cdsPartosAbortos.Append ;
           cdsPartosAbortosKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
           cdsPartosAbortosBRINCOFEMEA.asString       := fieldByName ( 'BRINCO' ).asString       ;
           cdsPartosAbortosNOMEFEMEA.asString         := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsPartosAbortosSTATUS.asInteger           := fieldByName ( 'STATUS' ).asInteger ;
           cdsPartosAbortosRETIRO.AsString            := fieldByName ( 'RETIRO' ).asString ;
           cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.asString  := AKZOO_EVENTO_ZOOTECNICO ;
           cdsPartosAbortosTIPOEVENTO.asInteger             := ATipoEvento ;
           cdsPartosAbortosDATAEVENTO.AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( ADataEvento ) ;
           cdsPartosAbortosNUMERO_LACTACAO.asInteger  := ANumeroLactacao ;
           cdsPartosAbortosLOTEPARTO.asString         := fieldByName ( 'LOTE' ).asString ;
           cdsPartosAbortosSELECTED.asString          := 'F' ;
           cdsPartosAbortosABRIRLACTACAO.asString     := 'F' ;
           cdsPartosAbortosINCLUIRCRIA.asString       := 'F' ;
           cdsPartosAbortosPROTOCOLO_PARTO.asString   := 'T' ;
           CalculoPrevisaoParto ;
           cdsPartosAbortos.BeforePost := nil ;
           cdsPartosAbortos.Post ;
           cdsPartosAbortos.BeforePost := cdsPartosAbortosBeforePost;
           cdsPartosAbortos.Edit;
         end

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.CalculateGrauSangue;
begin
  self.FGrauDeSangue.GrauSanguePai  := cdsLinhagemGRAUSANGUEPAI.asString ;
  self.FGrauDeSangue.RacaPai        := cdsLinhagemCOMPOSICAORACAPAI.asString ;

  self.FGrauDeSangue.GrauSangueMae  := cdsLinhagemGRAUSANGUEMAE.asString ;
  self.FGrauDeSangue.RacaMae        := cdsLinhagemCOMPOSICAORACAMAE.asString ;

  self.FGrauDeSangue.Calculate ;

  try
    cdsLinhagemGRAUSANGUE.OnValidate     := nil ;
    cdsLinhagemCOMPOSICAORACA.OnValidate := nil ;
    cdsLinhagemGRAUSANGUE.asString       := self.FGrauDeSangue.GrauSangue ;
    cdsLinhagemCOMPOSICAORACA.asString   := self.FGrauDeSangue.Raca ;
  finally
    cdsLinhagemGRAUSANGUE.OnValidate     := cdsLinhagemGRAUSANGUEValidate ;
    cdsLinhagemCOMPOSICAORACA.OnValidate := cdsLinhagemCOMPOSICAORACAValidate ;
  end;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.CalculoPrevisaoParto;
begin

  if cdsPartosAbortosNUMERO_LACTACAO.AsInteger < 1 then
     cdsPartosAbortosPREVISAOPARTO.AsDateTime := cdsPartosAbortosDATAEVENTO.AsDateTime + DiasPartoPrimipara
  else
     cdsPartosAbortosPREVISAOPARTO.AsDateTime := cdsPartosAbortosDATAEVENTO.AsDateTime + DiasPartoMultipara ;

  //     cdsPartosAbortosDIAS.asInteger := Trunc ( cdsPartosAbortosPREVISAOPARTO.AsDateTime - cdsPartosAbortosDATATOQUE.AsDateTime ) ;
  if ( cdsPartosAbortosDATAABORTOPARTO.IsNull ) or ( cdsPartosAbortosDATAABORTOPARTO.asDateTime < 1 ) then
       cdsPartosAbortosDIAS.asInteger := Trunc ( Date - cdsPartosAbortosDATAEVENTO.AsDateTime )
  else
       cdsPartosAbortosDIAS.asInteger := Trunc ( cdsPartosAbortosDATAABORTOPARTO.asDateTime - cdsPartosAbortosDATAEVENTO.AsDateTime ) ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemALTURAValidate(
  Sender: TField);
begin
   if Sender.AsInteger < 0 then
      raise Warning.Create('Altura não pode ser inferior a 0.');
   if Sender.AsInteger > 210 then
      raise Warning.Create('Altura máxima permitida 210 cm');
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsLinhagem.RecordCount = 3 then
     raise Warning.Create('Não é possível incluir mais que 3 animais');
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemBeforePost(DataSet: TDataSet);
var
  ErrMsg : string ;

  procedure AddErr ( e : string ) ;
  begin
     ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
  end;

begin
  ErrMsg := '' ;

  if not cdsLinhagemNatimorto.asBoolean then
    begin
       if Trim ( cdsLinhagemSEXO.asString ) = '' then
          AddErr ( 'Sexo' ) ;

       if Trim ( cdsLinhagemBrinco.asString ) = '' then
          AddErr ( 'Brinco' ) ;

//       if Trim ( cdsLinhagemNOMEESTABULO.asString ) = '' then
//          AddErr ( 'Nome estabulo' ) ;
    end;

  if ErrMsg <> '' then
     raise Warning.Create( 'Os campos devem ser preenchidos : '#13#10 + ErrMsg );

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemBRINCOValidate(Sender: TField);
begin
  if cdsLinhagemSEXO.AsString = 'M' then
    begin
      if TAnimalMacho.CheckCodigoExists ( LoggedUser.DomainID, Sender.AsString, cdsLinhagemKZOO_ANIMAL.AsString ) then
         raise Warning.Create('Código em uso por outro animal')
    end
  else
    if TAnimalFemea.CheckBrincoExists ( LoggedUser.DomainID, Sender.asString, cdsLinhagemKZOO_ANIMAL.asString ) then
       raise Warning.Create('Brinco em uso por outro animal');
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemCalcFields(DataSet: TDataSet);
begin
  inherited;
//  if DataSet.State = dsInternalCalc  then

  if cdsLinhagem.Recno = -1 then
     cdsLinhagemNUMERO.asString := '<novo>'
  else
     cdsLinhagemNUMERO.asString := IntToStr ( cdsLinhagem.Recno ) + '/' + IntToStr ( cdsLinhagem.RecordCount ) ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsLinhagemGRAUSANGUE.asString, cdsLinhagemCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemGRAUSANGUESetText(
  Sender: TField; const Text: string);
var
  gs : string ;
  posSpace : integer ;
begin
  gs := Trim ( Text ) ;
  posSpace := Pos ( ' ', gs ) ;
  if posSpace > 0 then
    gs := Copy ( gs, 1, posSpace -1 ) ;
  Sender.AsString := gs ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsLinhagemGRAUSANGUE.asString, cdsLinhagemCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  GetKey ( cdsLinhagemKZOO_ANIMAL )    ;
  cdsLinhagemNATIMORTO.asString := 'F' ;
  cdsLinhagemSEXO.asString := 'F' ;

  cdsLinhagemGRAUSANGUEPAI.asString       := cdsPartosAbortosGRAUSANGUEPAI.asString      ;
  cdsLinhagemCOMPOSICAORACAPAI.asString   := cdsPartosAbortosCOMPOSICAORACAPAI.asString  ;
  cdsLinhagemGRAUSANGUEMAE.asString       := cdsPartosAbortosGRAUSANGUEMAE.asString      ;
  cdsLinhagemCOMPOSICAORACAMAE.asString   := cdsPartosAbortosCOMPOSICAORACAMAE.asString  ;
  cdsLinhagemRETIRO_CRIA.AsString              := cdsPartosAbortosRETIRO.asString  ;

  cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
  cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;

  CalculateGrauSangue ;
//  cdsLinhagemNASCIMENTO.asca
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemPESOValidate(
  Sender: TField);
begin
   if Sender.AsInteger < 0 then
      raise Warning.Create('Peso não pode ser inferior a zero.');
   if Sender.AsInteger > 999 then
      raise Warning.Create('Peso máximo permitido 999 Kg');
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosABORTOPARTOValidate(
  Sender: TField);
begin
  if cdsPartosAbortosFORCEABORTO.asBoolean and
  (     (Sender.asInteger  <>  _ST_TIPO_PARTOABORTO_ABORTO )
    and (Sender.asInteger  <>  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
  ) then
    Abort ;

  if ( Sender.asInteger =  _ST_TIPO_PARTOABORTO_ABORTO ) then
    begin
     cdsPartosAbortosABRIRLACTACAO.asString := 'F' ;
     cdsPartosAbortosINCLUIRCRIA.asString   := 'F' ;
    end ;

  if ( Sender.asInteger =  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO ) then
    begin
     cdsPartosAbortosINCLUIRCRIA.asString   := 'F' ;
    end ;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBeforePost(
  DataSet: TDataSet);
begin
  //VTS
 if cdsPartosAbortosINCLUIRCRIA.AsBoolean and cdsLinhagem.isEmpty and not FAbriuCadastroCria then
   begin
     ThreadSuppl.TSyncThread.Create(  DoGetCria ) ;
     FAbriuCadastroCria := True ;
     Abort;
   end
 else
   FAbriuCadastroCria := False ;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.State = dsInternalCalc then
    begin
      if cdsPartosAbortosFORCEABORTO.isNull then
        cdsPartosAbortosFORCEABORTO.asString := 'F' ;
      CalculoPrevisaoParto ;
    end;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosDATAABORTOPARTOValidate(  Sender: TField );
var
 diasAbortoLC : integer ;
 diasParto    : integer ;
begin

//  if cdsPartosAbortosSTATUS.asInteger = _ST_STATUS_FEMEA_VACALACTACAO then
//     raise Warning.Create('Não é possível confirmar parto. Animal não esta seco.');


   if ( not cdsPartosAbortosDATAABORTOPARTO.isNull ) and
     ( cdsPartosAbortosDATAABORTOPARTO.asDateTime < cdsPartosAbortosDATAEVENTO.asDateTime ) then
     raise Warning.Create('Data do parto/aborto deve ser maior que a data do evento');

   if ( not cdsPartosAbortosDATAABORTOPARTO.isNull ) and
     ( cdsPartosAbortosDATAABORTOPARTO.asDateTime < cdsPartosAbortosDATATOQUE.asDateTime ) then
     raise Warning.Create('Data do parto/aborto deve ser maior que a data de toque');

  if ( not cdsPartosAbortosDATAABORTOPARTO.isNull ) and
     ( cdsPartosAbortosDATAABORTOPARTO.asDateTime > Date ) then
     raise Warning.Create('Data do parto/aborto não pode ser maior que a data atual');

  if cdsPartosAbortosDATAABORTOPARTO.isNull then
    begin
       RevertRecord ;
       ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosParto );
       ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosCria );
       UpdateDescrProtocolos;
       exit ;
       //cdsPartosAbortos.Cancel ;
       //Abort ;
    end
  else if ( not cdsPartosAbortosSELECTED.asBoolean ) then
     cdsPartosAbortosSELECTED.asString :=  'T' ;

  cdsPartosAbortosDIAS.asInteger := Trunc ( cdsPartosAbortosDATAABORTOPARTO.asDateTime - cdsPartosAbortosDATAEVENTO.asDateTime ) ;


  if cdsPartosAbortosNUMERO_LACTACAO.asInteger < 1 then
    begin
     diasAbortoLC := DiasAbortoPrimipara ;
     diasParto    := DiasPartoPrimipara ;
    end
  else
    begin
     diasAbortoLC := DiasAbortoMultipara ;
     diasParto    := DiasPartoMultipara ;
    end ;

  if cdsPartosAbortosDIAS.asInteger >= ( diasParto - 30 ) then
    begin
     cdsPartosAbortosFORCEABORTO.asString := 'F' ;
     cdsPartosAbortosABORTOPARTO.asInteger :=  _ST_TIPO_PARTOABORTO_PARTO ;
     cdsPartosAbortosABRIRLACTACAO.asString := 'T' ;
     cdsPartosAbortosINCLUIRCRIA.asString   := 'T' ; //++kiq
    end
  else if cdsPartosAbortosDIAS.asInteger >= diasAbortoLC then
    begin
     cdsPartosAbortosFORCEABORTO.asString := 'F' ;
     cdsPartosAbortosABORTOPARTO.asInteger :=  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO ;
     cdsPartosAbortosABRIRLACTACAO.asString := 'T' ;
     cdsPartosAbortosINCLUIRCRIA.asString   := 'F' ; //++VTS
    end
  else
   begin
     cdsPartosAbortosFORCEABORTO.asString   := 'T' ;
     cdsPartosAbortosABORTOPARTO.asInteger  :=  _ST_TIPO_PARTOABORTO_ABORTO ;
     cdsPartosAbortosABRIRLACTACAO.asString := 'F' ;
     cdsPartosAbortosINCLUIRCRIA.asString   := 'F' ; //++VTS
   end;


   if (cdsPartosAbortosABORTOPARTO.asInteger =  _ST_TIPO_PARTOABORTO_PARTO) or
      (cdsPartosAbortosABORTOPARTO.asInteger =  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO) or
      (cdsPartosAbortosABORTOPARTO.asInteger =  _ST_TIPO_PARTOABORTO_ABORTO) then
    begin
      SetListaProtocolosToCds( cdsProtocolosParto );
      if cdsPartosAbortosINCLUIRCRIA.asString = 'T' then
        SetListaProtocolosToCds( cdsProtocolosCria );
      UpdateDescrProtocolos;
    end
   else
    begin
      ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosParto );
      ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosCria );
      UpdateDescrProtocolos;
    end;
end ;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosINCLUIRCRIAChange(
  Sender: TField);
begin
  if cdsPartosAbortosINCLUIRCRIA.AsString <> 'T' then
   begin
     ClearCdsProtocolosByEventosZootecnicos( cdsProtocolosCria );
     UpdateDescrProtocolos;
   end
  else
   begin
     SetListaProtocolosToCds( cdsProtocolosCria );
     UpdateDescrProtocolos;
   end;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosINCLUIRCRIAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 if DisplayText then
   begin
     if cdsPartosAbortos.IsEmpty then
        exit ;

     if not (( Sender.IsNull ) or ( Sender.asString = '' ))  then
       begin
        if Sender.AsBoolean then
           Text := 'Sim'
        else
          Text := 'Não'
       end;
   end
  else
    Text := Sender.asString ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosPROTOCOLO_PARTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
 if DisplayText then
   begin
     if cdsPartosAbortos.IsEmpty then
        exit ;

     if not (( Sender.IsNull ) or ( Sender.asString = '' ))  then
       begin
        if Sender.AsBoolean then
           Text := 'Sim'
        else
          Text := 'Não'
       end;
   end
  else
    Text := Sender.asString ;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosSELECTEDValidate(
  Sender: TField);
begin
  if Sender.asBoolean then
   begin

     if ( cdsPartosAbortosDATAABORTOPARTO.isNull ) or ( cdsPartosAbortosDATAABORTOPARTO.asDateTime = 0 ) then
        cdsPartosAbortosDATAABORTOPARTO.asDateTime := FDataPadraoOcorrencia ;

     if Trim ( cdsPartosAbortosCHAVELACTACAO.asString ) = '' then
        GetKey ( cdsPartosAbortosCHAVELACTACAO ) ;

   end
  else if not cdsPartosAbortosDATAABORTOPARTO.isNull then
    cdsPartosAbortosDATAABORTOPARTO.Clear ;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.dspPartosAbortosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);

  procedure GetPaiMae ( AKZOO_EVENTO_ZOOTECNICO : string ; out AKZooPai, ANomePai, AKZooMae, ANomeMae : string ) ;
  var
    cds : TClientDataSet ;
    p : TParams ;
  const
    _SELECT_PAI_MAE =
           'E.TIPOEVENTO,'
    +#13#10'E.KZOO_ANIMAL_FEMEA KZOO_MAE,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AF.NOMECOMPLETO ), '''' ), AF.NOMEESTABULO ), AF.BRINCO ) NOME_MAE,'
    +#13#10'COALESCE ( E.KZOO_ANIMAL_MACHO_TOUROSEMEN, E. KZOO_ANIMAL_MACHO_EMBRIAO ) KZOO_PAI,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AM.NOMECOMPLETO ), '''' ), AM.NOMEESTABULO  ), AM.BRINCO ) NOME_PAI,'
    +#13#10'AE.KZOO_ANIMAL_MACHO KZOO_PAIEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEM.NOMECOMPLETO ), '''' ), AEM.NOMEESTABULO ), AEM.BRINCO ), AE.NOMEPAI ) NOME_PAIEMBRIAO,'
    +#13#10'AE.KZOO_ANIMAL_FEMEA KZOO_MAEEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEF.NOMECOMPLETO ), '''' ), AEF.NOMEESTABULO ), AEF.BRINCO ), AE.NOMEMAE ) NOME_MAEEMBRIAO'
    +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_TOUROSEMEN'
    +#13#10'LEFT JOIN ZOO_ANIMAL_LINHAGEM AE ON AE.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_EMBRIAO'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEF ON AEF.KZOO_ANIMAL = AE.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEM ON AEM.KZOO_ANIMAL = AE.KZOO_ANIMAL_MACHO'
    +#13#10'WHERE E.KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO' ;
  begin


    cds := nil ;

    AKZooPai := '' ;
    ANomePai := '' ;
    AKZooMae := '' ;
    ANomeMae := '' ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := AKZOO_EVENTO_ZOOTECNICO ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_PAI_MAE, p ) ;

    if cds.FieldByName('TIPOEVENTO').AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE then
      begin
        AKZooPai := Trim ( cds.FieldByName('KZOO_PAIEMBRIAO').AsString ) ;
        ANomePai := Trim ( cds.FieldByName('NOME_PAIEMBRIAO').AsString ) ;
        AKZooMae := Trim ( cds.FieldByName('KZOO_MAEEMBRIAO').AsString ) ;
        ANomeMae := Trim ( cds.FieldByName('NOME_MAEEMBRIAO').AsString ) ;
      end
    else
      begin
        AKZooPai := Trim ( cds.FieldByName('KZOO_PAI').AsString ) ;
        ANomePai := Trim ( cds.FieldByName('NOME_PAI').AsString ) ;
        AKZooMae := Trim ( cds.FieldByName('KZOO_MAE').AsString ) ;
        ANomeMae := Trim ( cds.FieldByName('NOME_MAE').AsString ) ;
      end ;

    cds.Free ;
    p.free ;

  end;

  procedure AplicarProtocoloCria ;
  begin
     if ( DeltaDS.FieldByName ( 'SEXO' ).asString = 'M' ) or ( not FDeltaAplicarProtocolo ) then
        exit ;
     //DiagnosticosAnimalClass.TEventosAnimal.AddPartoCria( DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString, FDeltaDataPartoAborto );
  end ;

  procedure SetAnimalCrescimentoNascimento( AKZOO_ANIMAL, AKZOO_ANIMAL_CRESCIMENTO: String; AData: TDateTime);
  const
     _UPDATE_CRESCIMENTO_NASCIMENTO =
            'UPDATE ZOO_ANIMAIS_FEMEA'
     +#13#10'   SET KCRESCIMENTO_NASCIMENTO = :KZOO_ANIMAL_CRESCIMENTO'
     +#13#10' WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
     +#13#10'   AND NASCIMENTO = :DATA';
  var
    sql : TSQLQuery ;
  begin
    sql := TSQLQuery.Create ( nil ) ;
    sql.SQLConnection := sqlLinhagem.SQLConnection ;
    sql.CommandText := _UPDATE_CRESCIMENTO_NASCIMENTO ;
    sql.Params.Clear;
    sql.Params.CreateParam( ftString,  'KZOO_ANIMAL_CRESCIMENTO', ptInput ).asString  := AKZOO_ANIMAL_CRESCIMENTO;
    sql.Params.CreateParam( ftString   , 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := AKZOO_ANIMAL ;
    sql.Params.CreateParam( ftTimeStamp, 'DATA'       , ptInput ).AsSQLTimeStamp      := DateTimeToSQLTimesTamp( AData );
    sql.ExecSQL;
    sql.Free;
  end;

  procedure UpdateCrescimento ;
  var
    sql : TSQLQuery ;
    KCrescimento: String;
  const
    _INSERT_CRESCIMENTO =
           'INSERT INTO ZOO_ANIMAL_CRESCIMENTO ( KZOO_ANIMAL_CRESCIMENTO, KZOO_ANIMAL, DATA, PESO, ALTURA )'
    +#13#10'VALUES ( :KZOO_ANIMAL_CRESCIMENTO, :KZOO_ANIMAL, :DATA, :PESO, :ALTURA )' ;
  begin
    if   ( DeltaDS.FieldByName ( 'PESO' ).AsInteger <= 0 )
    and  ( DeltaDS.FieldByName ( 'ALTURA' ).AsInteger <= 0 ) then
       exit ;


    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := sqlLinhagem.SQLConnection ;
        CommandText := _INSERT_CRESCIMENTO ;
        KCrescimento := GuidStr20;
        ParamByName ( 'KZOO_ANIMAL_CRESCIMENTO' ).AsString := KCrescimento;
        ParamByName ( 'KZOO_ANIMAL' ).AsString          := DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString ;
        ParamByName ( 'DATA' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;

        ParamByName ( 'PESO' ).DataType := ftInteger ;
        ParamByName ( 'PESO' ).Bound    := False;
        if DeltaDS.FieldByName ( 'PESO' ).AsInteger > 0 then
           ParamByName ( 'PESO' ).asInteger := DeltaDS.FieldByName ( 'PESO' ).AsInteger;

        ParamByName ( 'ALTURA' ).DataType := ftInteger ;
        ParamByName ( 'ALTURA' ).Bound    := False;
        if DeltaDS.FieldByName ( 'ALTURA' ).AsInteger > 0 then
           ParamByName ( 'ALTURA' ).asInteger := DeltaDS.FieldByName ( 'ALTURA' ).AsInteger;

        ExecSQL ;

        SetAnimalCrescimentoNascimento( DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString,
                                        KCrescimento,
                                        FDeltaDataPartoAborto);
    finally
        sql.free ;
    end;
  end;

  procedure UpdateLinhagemAnimal ;
  var
    sql : TSQLQuery ;
  const
    _UPDATE_LINHAGEM = 'UPDATE ZOO_ANIMAL_LINHAGEM SET KZOO_ANIMAL = :KZOO_ANIMAL WHERE KZOO_ANIMAL_LINHAGEM = :KZOO_ANIMAL_LINHAGEM' ;
  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := sqlLinhagem.SQLConnection ;
        CommandText := _UPDATE_LINHAGEM ;
        ParamByName ( 'KZOO_ANIMAL' ).AsString := DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString ;
        ParamByName ( 'KZOO_ANIMAL_LINHAGEM' ).AsString := DeltaDS.FieldByName ( 'KZOO_ANIMAL_LINHAGEM' ).asString ;
        ExecSQL ;
    finally
        sql.free ;
    end;
  end;

  procedure IncluiMachoFemea ;
  var
    sql : TSQLQuery ;
  const
    _INCLUI_MACHO = 'INSERT INTO ZOO_ANIMAIS_MACHO ( KZOO_ANIMAL_MACHO, NASCIMENTO, RETIRO ) VALUES ( :KZOO_ANIMAL, :NASCIMENTO, :RETIRO )' ;
    _INCLUI_FEMEA = 'INSERT INTO ZOO_ANIMAIS_FEMEA ( KZOO_ANIMAL_FEMEA, NASCIMENTO, LOTE, DATALOTE, RETIRO, DATARETIRO ) VALUES ( :KZOO_ANIMAL, :NASCIMENTO, :LOTE, :DATALOTE, :RETIRO, :DATARETIRO )' ;
  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := sqlLinhagem.SQLConnection ;

        if ( DeltaDS.FieldByName ( 'SEXO' ).asString = 'M' ) then
           CommandText := _INCLUI_MACHO
        else
           CommandText := _INCLUI_FEMEA ;

        ParamByName ( 'KZOO_ANIMAL' ).AsString       := DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString ;
        ParamByName ( 'NASCIMENTO'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;
        ParamByName ( 'RETIRO'      ).DataType       := ftString ;
        ParamByName ( 'RETIRO'      ).Bound          := False ;
        if not DeltaDS.FieldByName ( 'RETIRO_CRIA' ).isNull then
         begin
           ParamByName ( 'RETIRO'      ).AsString       := DeltaDS.FieldByName ( 'RETIRO_CRIA' ).asString ;
         end;

        if ( DeltaDS.FieldByName ( 'SEXO' ).asString = 'F' ) then
          begin
            ParamByName ( 'LOTE'        ).DataType := ftString ;
            ParamByName ( 'LOTE'        ).Bound := False ;
            ParamByName ( 'DATALOTE'    ).DataType := ftTimeStamp ;
            ParamByName ( 'DATALOTE'    ).Bound := False ;

            ParamByName ( 'DATARETIRO'  ).DataType := ftTimeStamp ;
            ParamByName ( 'DATARETIRO'  ).Bound := False ;

            if not DeltaDS.FieldByName ( 'LOTE' ).isNull then
              begin
               ParamByName ( 'LOTE'      ).AsString       := DeltaDS.FieldByName ( 'LOTE' ).asString ;
               ParamByName ( 'DATALOTE'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;
              end;

            if not DeltaDS.FieldByName ( 'RETIRO_CRIA' ).isNull then
              begin
               ParamByName ( 'DATARETIRO'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;
              end;
          end;
        ExecSQL ;
      finally
        sql.Free ;
      end
  end;


  procedure IncluiAnimal ;
  var
    sql : TSQLQuery ;
  const
     _INCLUIR_ANINAL =
            'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DATASTATUS, DTORIGEM, GRAUSANGUE, COMPOSICAORACA, ORIGINADO_DE_EMBRIAO, KZOO_EVENTO_ZOOTECNICO, KCAD_FAZENDA )'
     +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DATASTATUS, :DTORIGEM, :GRAUSANGUE, :COMPOSICAORACA, :ORIGINADO_DE_EMBRIAO, :KZOO_EVENTO_ZOOTECNICO, :KCAD_FAZENDA )' ;
  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := sqlLinhagem.SQLConnection ;
        CommandText := _INCLUIR_ANINAL ;

        ParamByName ( 'KZOO_ANIMAL'    ).AsString          := DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString   ;
        ParamByName ( 'BRINCO'         ).AsString          := DeltaDS.FieldByName ( 'BRINCO' ).asString        ;
        ParamByName ( 'NOMEESTABULO'   ).AsString          := DeltaDS.FieldByName ( 'NOMEESTABULO' ).asString  ;
        ParamByName ( 'NOMECOMPLETO'   ).AsString          := DeltaDS.FieldByName ( 'NOMECOMPLETO' ).asString  ;
        ParamByName ( 'RACA'           ).asInteger         := DeltaDS.FieldByName ( 'RACA' ).asInteger         ;
        ParamByName ( 'STATUS'         ).asInteger         := _ST_SIGLA_STATUS_ANIMAL_BEZERRO                  ;
        ParamByName ( 'DATASTATUS'     ).AsSQLTimeStamp    := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;
        ParamByName ( 'DTORIGEM'       ).asSQLTimeStamp    := DateTimeToSQLTimeStamp ( FDeltaDataPartoAborto ) ;
        ParamByName ( 'GRAUSANGUE'     ).AsString          := DeltaDS.FieldByName ( 'GRAUSANGUE' ).asString  ;
        ParamByName ( 'COMPOSICAORACA' ).AsString          := DeltaDS.FieldByName ( 'COMPOSICAORACA' ).asString  ;
        ParamByName ( 'ORIGINADO_DE_EMBRIAO' ).AsString    := FDeltaORIGINADO_DE_EMBRIAO ;
        ParamByName ( 'KZOO_EVENTO_ZOOTECNICO' ).AsString  := FDeltaKZOO_EVENTO_ZOOTECNICO ;
        ParamByName ( 'KCAD_FAZENDA'   ).AsString          := LoggedUser.DomainID ;
        ExecSQL ;
      finally
        sql.free ;
      end ;
     IncluiMachoFemea ;
     UpdateLinhagemAnimal ;
     UpdateCrescimento ;
     //AplicarProtocoloCria ;
     if DeltaDS.FieldByName ( 'SEXO' ).asString = 'F' then
        InsertProtocolos(cdsProtocolosCria,
                         FDeltaKZOO_EVENTO_ZOOTECNICO,
                         DeltaDS.FieldByName ( 'KZOO_ANIMAL' ).asString,
                         FDeltaDataPartoAborto);
  end ;

  procedure InsertLinhagem ;
  var
     sql : TSQLQuery ;
     x : integer ;
     Field : TField ;
     tmpAKZooPai, tmpANomePai, tmpAKZooMae, tmpANomeMae : string ;

  const

    _INSERT_LINHAGEM =  'INSERT INTO ZOO_ANIMAL_LINHAGEM'
    +#13#10'('
    +#13#10'KZOO_ANIMAL_LINHAGEM,'
    +#13#10'NATIMORTO,'
    +#13#10'BRINCO,'
    +#13#10'NOMEANIMAL,'
    +#13#10'KZOO_ANIMAL_MACHO,'
    +#13#10'NOMEPAI,'
    +#13#10'REGISTROPAI,'
    +#13#10'KZOO_ANIMAL_FEMEA,'
    +#13#10'NOMEMAE,'
    +#13#10'REGISTROMAE,'
    +#13#10'KZOO_EVENTO_ZOOTECNICO,'
    +#13#10'KZOO_LACTACAO,'
    +#13#10'RACA,'
    +#13#10'GRAUSANGUE,'
    +#13#10'COMPOSICAORACA,'
    +#13#10'GRAUSANGUEPAI,'
    +#13#10'COMPOSICAORACAPAI,'
    +#13#10'GRAUSANGUEMAE,'
    +#13#10'COMPOSICAORACAMAE,'
    +#13#10'PESO,'
    +#13#10'ALTURA,'
    +#13#10'SEXO,'
    +#13#10'NASCIMENTO )'
    +#13#10'VALUES ('
    +#13#10':KZOO_ANIMAL_LINHAGEM,'
    +#13#10':NATIMORTO,'
    +#13#10':BRINCO,'
    +#13#10':NOMEESTABULO,'
    +#13#10':KZOO_ANIMAL_MACHO,'
    +#13#10':NOMEPAI,'
    +#13#10':REGISTROPAI,'
    +#13#10':KZOO_ANIMAL_FEMEA,'
    +#13#10':NOMEMAE,'
    +#13#10':REGISTROMAE,'
    +#13#10':KZOO_EVENTO_ZOOTECNICO,'
    +#13#10':KZOO_LACTACAO,'
    +#13#10':RACA,'
    +#13#10':GRAUSANGUE,'
    +#13#10':COMPOSICAORACA,'
    +#13#10':GRAUSANGUEPAI,'
    +#13#10':COMPOSICAORACAPAI,'
    +#13#10':GRAUSANGUEMAE,'
    +#13#10':COMPOSICAORACAMAE,'
    +#13#10':PESO,'
    +#13#10':ALTURA,'
    +#13#10':SEXO,'
    +#13#10':NASCIMENTO'
    +#13#10')' ;
  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := sqlLinhagem.SQLConnection ;
        CommandText := _INSERT_LINHAGEM ;

        for x := 0 to Params.Count -1 do
         begin
           Field := DeltaDS.FindField( Params[x].Name );
           if Assigned ( Field )  then
             begin
               Params[x].DataType := DeltaDS.FieldByName( Params[x].Name ).DataType ;
               Params[x].Bound := False ;
               if not DeltaDS.FieldByName( Params[x].Name ).IsNull then
                  Params[x].Value := DeltaDS.FieldByName( Params[x].Name ).Value ;
             end;
         end;

         Params.ParamByName( 'NASCIMENTO' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDeltaDataPartoAborto ) ;

         Params.ParamByName( 'KZOO_EVENTO_ZOOTECNICO' ).asString := FDeltaKZOO_EVENTO_ZOOTECNICO ;

         Params.ParamByName( 'KZOO_LACTACAO' ).DataType    := ftString ;
         Params.ParamByName( 'KZOO_LACTACAO' ).Bound       := False ;

         if FDeltaAbrirLactacao then
            Params.ParamByName( 'KZOO_LACTACAO' ).asString := FDeltaKeyLactacao ;


         GetPaiMae ( FDeltaKZOO_EVENTO_ZOOTECNICO, tmpAKZooPai, tmpANomePai, tmpAKZooMae, tmpANomeMae ) ;

         Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).Bound    := False ;
         Params.ParamByName( 'NOMEPAI'           ).Bound    := False ;
         Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).Bound    := False ;
         Params.ParamByName( 'NOMEMAE'           ).Bound    := False ;

         if ( tmpAKZooPai <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).asString    := tmpAKZooPai ;

         if ( tmpANomePai <> '' ) then
            Params.ParamByName( 'NOMEPAI' ).asString    := tmpANomePai ;

         if ( tmpAKZooMae <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).asString    := tmpAKZooMae ;

         if ( tmpANomeMae <> '' ) then
            Params.ParamByName( 'NOMEMAE' ).asString    := tmpANomeMae ;

        ExecSQL  ;
      finally
        free ;
      end;
    if not ( DeltaDS.FieldByName ( 'NATIMORTO' ).asBoolean ) then
       IncluiAnimal ;
  end;

var
  p : TParams ;
begin
   // nao exlui nada do banco
   Applied := True ;

  if UpdateKind= ukDelete then
      exit ;

  if SourceDS =  sqlPartosAbortos then
    begin

       FDeltaKeyLactacao      := '' ;
       FDeltaIncluirCria      := False ;
       FDeltaAbrirLactacao    := DeltaDS.FieldByName ( 'ABRIRLACTACAO'   ).asBoolean  ;
       FDeltaSelected         := DeltaDS.FieldByName ( 'SELECTED'        ).asBoolean  ;
       FDeltaDataPartoAborto  := DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).asDateTime ;
       FDeltaAplicarProtocolo := DeltaDS.FieldByName ( 'PROTOCOLO_PARTO' ).asBoolean  ;

       if DeltaDS.FieldByName('TIPOEVENTO').AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE then
          FDeltaORIGINADO_DE_EMBRIAO := 'T'
        else
          FDeltaORIGINADO_DE_EMBRIAO := 'F' ;

       FDeltaKZOO_EVENTO_ZOOTECNICO  := DeltaDS.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString  ;

       if FDeltaSelected then
         begin

           sqlPartosAbortos.SQLConnection.ExecuteDirect (
              Format (
                       'UPDATE ZOO_EVENTOS_ZOOTECNICOS'
               +#13#10'SET ABORTOPARTO = %d, DATAABORTOPARTO = ''%s'', PROTOCOLO_PARTO = ''%s'', LOTEPARTO=''%s'''
               +#13#10'WHERE KZOO_EVENTO_ZOOTECNICO = ''%s''',
               [ DeltaDS.FieldByName ( 'ABORTOPARTO' ).asInteger,
                 FormatDateTime ( 'dd.mm.yyyy',  DeltaDS.FieldByName ( 'DATAABORTOPARTO' ).asDateTime ),
                 ifThen ( FDeltaAplicarProtocolo, 'T', 'F' ),
                 DeltaDS.FieldByName ( 'LOTEPARTO' ).asString,
                 DeltaDS.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString
               ] ) ) ;

           if ( FDeltaAbrirLactacao ) then
             begin
               FDeltaKeyLactacao := DeltaDS.FieldByName ( 'CHAVELACTACAO' ).asString ;
               FDeltaIncluirCria := DeltaDS.FieldByName ( 'INCLUIRCRIA' ).asBoolean ;
               sqlPartosAbortos.SQLConnection.ExecuteDirect(
                  Format (
                          'INSERT INTO ZOO_LACTACOES ( KZOO_LACTACAO, KZOO_EVENTO_ZOOTECNICO, KZOO_ANIMAL_FEMEA, KCAD_FAZENDA )'
                   +#13#10'VALUES ( ''%s'', ''%s'', ''%s'',  ''%s'' )',
                [ FDeltaKeyLactacao,
                  DeltaDS.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString,
                  DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString,
                  LoggedUser.DomainID
                ] ) ) ;

//               sqlPartosAbortos.SQLConnection.ExecuteDirect( 'UPDATE ZOO_ANIMAIS SET STATUS = ''VL'' WHERE KZOO_ANIMAL=' + DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ) ;

               p := TParams.Create ;
               p.CreateParam ( ftInteger, 'STATUS', ptInput ).asInteger     := _ST_STATUS_ANIMAL_VACALACTACAO ;
               p.CreateParam ( ftString,  'KZOO_ANIMAL', ptInput ).asString := DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
               try
                 sqlPartosAbortos.SQLConnection.Execute( 'UPDATE ZOO_ANIMAIS SET STATUS = :STATUS WHERE KZOO_ANIMAL=:KZOO_ANIMAL', p ) ;
               finally
                 p.free ;
               end;

               if self.FDeltaAplicarProtocolo then
                 begin
                  {DiagnosticosAnimalClass.TEventosAnimal.AddPartoMatriz   ( DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString, self.FDeltaDataPartoAborto ) ;
                  //if DeltaDS.FieldByName ( 'ABORTOPARTO' ).AsInteger = _ST_TIPO_PARTOABORTO_PARTO then
                  DiagnosticosAnimalClass.TEventosAnimal.AddRecemParida(DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString, self.FDeltaDataPartoAborto ) ;}
                 end ;


             end ;

             InsertProtocolos(cdsProtocolosParto,
                              FDeltaKZOO_EVENTO_ZOOTECNICO,
                              DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString,
                              FDeltaDataPartoAborto);
         end ;

    end ;

  if ( SourceDS =  sqlLinhagem ) and ( FDeltaSelected ) and ( FDeltaIncluirCria )  then
      InsertLinhagem ;

end;


procedure TZoo_ReproducaoPartosAbortosDatamodule.FilterProtocolosByEventoZootecnico;
begin
  cdsProtocolosParto.Filtered := False;
  cdsProtocolosParto.Filter   := Format( 'KZOO_EVENTO_ZOOTECNICO = ''%s'' ', [cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.AsString] );
  cdsProtocolosParto.Filtered := True;


  cdsProtocolosCria.Filtered := False;
  cdsProtocolosCria.Filter   := Format( 'KZOO_EVENTO_ZOOTECNICO = ''%s'' ', [cdsPartosAbortosKZOO_EVENTO_ZOOTECNICO.AsString] );
  cdsProtocolosCria.Filtered := True;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.InsertProtocolos(
  ACds: TClientDataSet;
  AKZooEventoZootecnico, AKZooAnimalFemea: String; AData: TDateTime);
begin
  ACds.DisableControls;
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_EVENTO_ZOOTECNICO = ''%s'' ', [ AKZooEventoZootecnico ] );
  ACds.Filtered := True;

  ACds.First;
  while not ACds.Eof do
   begin
     if ACds.FieldByName('SELECTED').AsInteger = 1 then
       TProtocolosAnimal.AddProtocolo (
            AKZooAnimalFemea                                   // AKAnimal
          , ACds.FieldByName('KZOO_PROTOCOLO')    .asString    // AKProtocolo
          , AData                                              // AData
          , ''                                                // AKDiagnosticoAnimal
          , ''                                                 // AKTarefaAnimal
          , ''                                                 // AKResultadoTarefa
          , 0                                                  // AResultado
          , True                                               // InsertTarefas
          , ''                                                 // ALote :
          , True                                               // AGetLoteIfEmpty
          , False                                              // ANotify
        ) ;
     ACds.Next;
   end;


  ACds.EnableControls;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.InvertAllSelection(
  ASelectAll: Boolean; Acds: TClientDataSet);
var
  checked : integer ;
  LIndexName: String;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  with  TClientDataSet( Acds ) do
    begin
      DisableControls ;
      LIndexName := IndexName;
      IndexName := '';
      First ;
      while not eof do
         begin
           Edit ;
           FieldByName('SELECTED').asInteger := checked ;
           Post ;
           Next ;
         end;
      IndexName := LIndexName;
      First ;
      EnableControls ;
    end;

end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.InvertSelecao(
  cds: TClientDataSet);
begin
   with  cds  do
   begin
     Edit ;
     if FieldByName('SELECTED').asInteger = 0 then
        FieldByName('SELECTED').asInteger := 1
     else
        FieldByName('SELECTED').asInteger := 0 ;

     Post ;
   end;
end;

function TZoo_ReproducaoPartosAbortosDatamodule.IsAllSelected(
  ACds: TClientDataSet): Boolean;
begin
  Result := ACds.FieldByName('SOMA_SELECTED').Value = ACds.RecordCount;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.LoadListaProtocolos;
const
  _SELECT_PROTOCOLOS =
         'select'
  +#13#10'       0 SELECTED,'
  +#13#10'       P.KZOO_PROTOCOLO,'
  +#13#10'       P.CODIGO,'
  +#13#10'       P.NOME,'
  +#13#10'       P.TIPOPROTOCOLO,'
  +#13#10'       D.TIPOEVENTO,'
  +#13#10'       D.SYS$EVENTOID EVENTO_ID'
  +#13#10'  FROM ZOO_PROTOCOLOS P'
  +#13#10'  LEFT JOIN ZOO_DIAGNOSTICO_PROTOCOLOS DP ON P.KZOO_PROTOCOLO = DP.KZOO_PROTOCOLO'
  +#13#10'  LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = DP.KZOO_DIAGNOSTICO'
  +#13#10' WHERE P.ATIVO = ''T'''
  +#13#10'  ORDER BY 3, 2'
  ;

var
  p: TParams;
begin
  //p:= TParams.Create(nil);
  //p.CreateParam(ftInteger, 'TIPOPARTO', ptInput).AsInteger := _ST_TIPO_PROTOCOLO_PARTO;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsListaProtocolos, _SELECT_PROTOCOLOS{, p} ) ;
  //p.Free;
end;

function TZoo_ReproducaoPartosAbortosDatamodule.LocateBrinco(
  ABrinco: string): boolean;
begin
   Result := cdsPartosAbortos.Locate( 'BRINCOFEMEA', ABrinco, [] ) ;
end;


function TZoo_ReproducaoPartosAbortosDatamodule.NothingSelected(
  ACds: TClientDataSet): Boolean;
begin
  Result := ACds.FieldByName('SOMA_SELECTED').Value = 0;
end;

procedure TZoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosNUMEROFILHOSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if { ( cdsEventosReprodutivosABORTOPARTO.AsInteger <> _ST_TIPO_PARTOABORTO_COLETA ) and } (cdsLinhagem.RecordCount > 0) then
     Text := IntToStr ( cdsLinhagem.RecordCount ) ;
end;


end.

