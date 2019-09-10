unit UZoo_BancoDadosFemeaEventosReprodutivosDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Datasnap.Provider, DBForm,
  ClAg5ClientZootecnicoCommonTypes, UZoo_GrauDeSangueClass, VCL.Dialogs,
  Tc.VCL.Dialogs,
  Tc.RTL.Exceptions, Tc.VCL.Form ;

{$define _IATF_MONTA}

type

  TZoo_BancoDadosFemeaEventosReprodutivosDatamodule = class ;

  TGetCria = function (  A : TZoo_BancoDadosFemeaEventosReprodutivosDatamodule ) : boolean of object  ;

  TZoo_BancoDadosFemeaEventosReprodutivosDatamodule = class(T_dtmBASE)
    cdsEventosReprodutivos: TClientDataSet;
    cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField;
    cdsEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField;
    cdsEventosReprodutivosDATAEVENTO: TSQLTimeStampField;
    cdsEventosReprodutivosDOSES: TIntegerField;
    cdsEventosReprodutivosMUCO: TIntegerField;
    cdsEventosReprodutivosDESC_EVENTO: TStringField;
    cdsEventosReprodutivosDESC_MUCO: TStringField;
    cdsEventosReprodutivosTIPOEVENTO: TIntegerField;
    cdsEventosReprodutivosPRENHEZ: TStringField;
    cdsEventosReprodutivosREEXAMINAR: TStringField;
    cdsEventosReprodutivosDATATOQUE: TSQLTimeStampField;
    cdsEventosReprodutivosKCAD_FUNCIONARIO: TStringField;
    cdsEventosReprodutivosNOMEFUNCIONARIO: TStringField;
    sqlEventosReprodutivos: TTcSQLDataSet;
    dspEventosReprodutivos: TDataSetProvider;
    cdsEventosReprodutivosABORTOPARTO: TIntegerField;
    cdsEventosReprodutivosDATAABORTOPARTO: TSQLTimeStampField;
    cdsEventosReprodutivosEMBRIOESCOLETADOS: TIntegerField;
    cdsEventosReprodutivosPREVISAOPARTO: TSQLTimeStampField;
    cdsTipoMuco: TClientDataSet;
    cdsTipoMucoTIPO: TStringField;
    cdsTipoMucoVALOR: TStringField;
    cdsTipoMucoDESCRICAO: TStringField;
    cdsTipoMucoORDEM: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    cdsEventosReprodutivosNOMEMACHO: TStringField;
    cdsEventosReprodutivosKCAD_VETERINARIO: TStringField;
    cdsEventosReprodutivosNOMEVETERINARIO: TStringField;
    cdsEventosReprodutivosOBS_EVENTO: TMemoField;
    cdsEventosReprodutivosPROTOCOLO_PARTO: TStringField;
    cdsEventosReprodutivosPROTOCOLO_TOQUE: TStringField;
    cdsEventosReprodutivosKCAD_FUNCIONARIO_COLETA: TStringField;
    cdsEventosReprodutivosNOMEFUNCIONARIO_COLETA: TStringField;
    cdsEventosReprodutivosIEE: TIntegerField;
    cdsEventosReprodutivosFUNCIONARIO_EVENTO: TStringField;
    cdsEventosReprodutivosDESC_PARTOABORTO: TStringField;
    cdsEventosReprodutivosNL: TIntegerField;
    sqlEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField;
    sqlEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField;
    sqlEventosReprodutivosNOMEMACHO: TStringField;
    sqlEventosReprodutivosDATAEVENTO: TSQLTimeStampField;
    sqlEventosReprodutivosTIPOEVENTO: TIntegerField;
    sqlEventosReprodutivosDOSES: TIntegerField;
    sqlEventosReprodutivosMUCO: TIntegerField;
    sqlEventosReprodutivosPRENHEZ: TStringField;
    sqlEventosReprodutivosREEXAMINAR: TStringField;
    sqlEventosReprodutivosDATATOQUE: TSQLTimeStampField;
    sqlEventosReprodutivosABORTOPARTO: TIntegerField;
    sqlEventosReprodutivosDATAABORTOPARTO: TSQLTimeStampField;
    sqlEventosReprodutivosEMBRIOESCOLETADOS: TIntegerField;
    sqlEventosReprodutivosKCAD_FUNCIONARIO: TStringField;
    sqlEventosReprodutivosNOMEFUNCIONARIO: TStringField;
    sqlEventosReprodutivosKCAD_VETERINARIO: TStringField;
    sqlEventosReprodutivosNOMEVETERINARIO: TStringField;
    sqlEventosReprodutivosOBS_EVENTO: TMemoField;
    sqlEventosReprodutivosPROTOCOLO_PARTO: TStringField;
    sqlEventosReprodutivosPROTOCOLO_TOQUE: TStringField;
    sqlEventosReprodutivosKCAD_FUNCIONARIO_COLETA: TStringField;
    sqlEventosReprodutivosNOMEFUNCIONARIO_COLETA: TStringField;
    sqlEventosReprodutivosNL: TIntegerField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsLinhagem: TClientDataSet;
    cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsLinhagemKZOO_ANIMAL: TStringField;
    cdsLinhagemNATIMORTO: TStringField;
    cdsLinhagemBRINCO: TStringField;
    cdsLinhagemNOMEESTABULO: TStringField;
    cdsLinhagemNOMECOMPLETO: TStringField;
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
    cdsLinhagemNUMERO: TStringField;
    cdsLinhagemRACA: TIntegerField;
    cdsLinhagemLOTE: TStringField;
    cdsLinhagemDESCR_RACA: TStringField;
    cdsLinhagemKZOO_LACTACAO: TStringField;
    cdsLinhagemGRAUSANGUE: TStringField;
    cdsLinhagemCOMPOSICAORACA: TStringField;
    cdsLinhagemGRAUSANGUEPAI: TStringField;
    cdsLinhagemCOMPOSICAORACAPAI: TStringField;
    cdsLinhagemGRAUSANGUEMAE: TStringField;
    cdsLinhagemCOMPOSICAORACAMAE: TStringField;
    sqlLinhagem: TTcSQLDataSet;
    sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    sqlLinhagemKZOO_ANIMAL: TStringField;
    sqlLinhagemNATIMORTO: TStringField;
    sqlLinhagemBRINCO: TStringField;
    sqlLinhagemNOMEESTABULO: TStringField;
    sqlLinhagemNOMECOMPLETO: TStringField;
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
    sqlLinhagemLOTE: TStringField;
    sqlLinhagemKZOO_LACTACAO: TStringField;
    sqlLinhagemGRAUSANGUE: TStringField;
    sqlLinhagemCOMPOSICAORACA: TStringField;
    sqlLinhagemGRAUSANGUEPAI: TStringField;
    sqlLinhagemCOMPOSICAORACAPAI: TStringField;
    sqlLinhagemGRAUSANGUEMAE: TStringField;
    sqlLinhagemCOMPOSICAORACAMAE: TStringField;
    dtsSQLEventosReprodutivos: TDataSource;
    sqlEventosReprodutivosINCLUIRCRIA: TStringField;
    cdsEventosReprodutivosINCLUIRCRIA: TStringField;
    cdsEventosReprodutivossqlLinhagem: TDataSetField;
    sqlEventosReprodutivosCOMUNICACAO_COBERTURA: TStringField;
    cdsEventosReprodutivosCOMUNICACAO_COBERTURA: TStringField;
    sqlEventosReprodutivosRECORDEXISTS: TStringField;
    cdsEventosReprodutivosRECORDEXISTS: TStringField;
    cdsEventosReprodutivosTIPOMACHO: TIntegerField;
    cdsStatusPrenhez: TClientDataSet;
    cdsStatusPrenhezTIPO: TStringField;
    cdsStatusPrenhezVALOR: TStringField;
    cdsStatusPrenhezDESCRICAO: TStringField;
    cdsStatusPrenhezORDEM: TIntegerField;
    cdsEventosReprodutivosDESC_PRENHEZ: TStringField;
    cdsStatusGestacao: TClientDataSet;
    cdsStatusGestacaoTIPO: TStringField;
    cdsStatusGestacaoVALOR: TStringField;
    cdsStatusGestacaoDESCRICAO: TStringField;
    cdsStatusGestacaoORDEM: TIntegerField;
    cdsEventosReprodutivosDIAS: TIntegerField;
//    cdsEventosReprodutivosFORCEABORTO: TStringField;
    cdsEventosReprodutivosNUMEROFILHOS: TSmallintField;
    sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlEventosReprodutivosKZOO_LACTACAO: TStringField;
    cdsEventosReprodutivosKZOO_LACTACAO: TStringField;
    sqlEventosReprodutivosIEP_DIAS: TIntegerField;
    sqlEventosReprodutivosIEP_MESES: TIntegerField;
    cdsEventosReprodutivosIEP_DIAS: TIntegerField;
    cdsEventosReprodutivosIEP_MESES: TIntegerField;
    sqlEventosReprodutivosIDADE_MESES: TFMTBCDField;
    cdsEventosReprodutivosIDADE_MESES: TFMTBCDField;
    sqlEventosReprodutivosSYSDI: TSQLTimeStampField;
    cdsEventosReprodutivosSYSDI: TSQLTimeStampField;
    sqlEventosReprodutivosGRAUSANGUEPAI: TStringField;
    sqlEventosReprodutivosCOMPOSICAORACAPAI: TStringField;
    sqlEventosReprodutivosGRAUSANGUEMAE: TStringField;
    sqlEventosReprodutivosCOMPOSICAORACAMAE: TStringField;
    cdsEventosReprodutivosGRAUSANGUEPAI: TStringField;
    cdsEventosReprodutivosCOMPOSICAORACAPAI: TStringField;
    cdsEventosReprodutivosGRAUSANGUEMAE: TStringField;
    cdsEventosReprodutivosCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemGSR_PAI: TStringField;
    cdsLinhagemGSR_MAE: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    sqlEventosReprodutivosIEE: TIntegerField;
    sqlEventosReprodutivosIATF: TStringField;
    sqlEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField;
    cdsEventosReprodutivosIATF: TStringField;
    cdsEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField;
    cdsEventosReprodutivosDESC_PROTOCOLO_IATF: TStringField;
    cdsProtocolosIATF: TClientDataSet;
    cdsProtocolosIATFKZOO_PROTOCOLO: TStringField;
    cdsProtocolosIATFCODIGO: TStringField;
    cdsSexoCria: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    sqlEventosReprodutivosGEMELAR: TStringField;
    sqlEventosReprodutivosSEXO_CRIA: TIntegerField;
    cdsEventosReprodutivosGEMELAR: TStringField;
    cdsEventosReprodutivosSEXO_CRIA: TIntegerField;
    cdsStatusGemelar: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    cdsEventosReprodutivosDESC_SEXO_CRIA: TStringField;
    cdsEventosReprodutivosDESC_GEMELAR: TStringField;
    sqlEventosReprodutivosRETIRO: TStringField;
    cdsEventosReprodutivosRETIRO: TStringField;
    sqlLinhagemRETIRO_CRIA: TStringField;
    cdsLinhagemRETIRO_CRIA: TStringField;
    sqlEventosReprodutivosQTDE_COBERTURA: TIntegerField;
    cdsEventosReprodutivosQTDE_COBERTURA: TIntegerField;
    sqlEventosReprodutivosDOADOR_RECEPTOR: TIntegerField;
    cdsEventosReprodutivosDOADOR_RECEPTOR: TIntegerField;
    procedure _DataModuleCreate(Sender: TObject);
    procedure cdsEventosReprodutivosCalcFields(DataSet: TDataSet);
    procedure dspEventosReprodutivosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsEventosReprodutivosBeforePost(DataSet: TDataSet);
    procedure cdsEventosReprodutivosPROTOCOLO_TOQUEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsEventosReprodutivosREEXAMINARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsEventosReprodutivosPROTOCOLO_PARTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsEventosReprodutivosNewRecord(DataSet: TDataSet);
    procedure cdsEventosReprodutivosDOSESGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsEventosReprodutivosNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsEventosReprodutivosNOMEMACHOSetText(Sender: TField; const Text: string);
    procedure cdsEventosReprodutivosNOMEMACHOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsEventosReprodutivosDATAEVENTOValidate(Sender: TField);
    procedure cdsEventosReprodutivosTIPOEVENTOValidate(Sender: TField);
    procedure cdsEventosReprodutivosDATAABORTOPARTOValidate(Sender: TField);
    procedure cdsEventosReprodutivosPRENHEZValidate(Sender: TField);
    procedure cdsEventosReprodutivosTIPOEVENTOSetText(Sender: TField;
      const Text: string);
    procedure cdsEventosReprodutivosBeforeScroll(DataSet: TDataSet);
    procedure cdsEventosReprodutivosAfterCancel(DataSet: TDataSet);
    procedure cdsEventosReprodutivosBeforeCancel(DataSet: TDataSet);
    procedure dspEventosReprodutivosAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure dspEventosReprodutivosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsEventosReprodutivosNUMEROFILHOSGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsLinhagemBRINCOValidate(Sender: TField);
    procedure cdsLinhagemGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsLinhagemBeforePost(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemGRAUSANGUEValidate(Sender: TField);
    procedure cdsLinhagemCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsEventosReprodutivosIDADE_MESESGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsEventosReprodutivosBeforeEdit(DataSet: TDataSet);
    procedure cdsLinhagemPESOValidate(Sender: TField);
    procedure cdsLinhagemALTURAValidate(Sender: TField);
    procedure cdsEventosReprodutivosBeforeDelete(DataSet: TDataSet);
    procedure cdsEventosReprodutivosDATATOQUEValidate(Sender: TField);
    procedure cdsEventosReprodutivosIATFValidate(Sender: TField);
    procedure cdsEventosReprodutivosIATFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsEventosReprodutivosABORTOPARTOValidate(Sender: TField);
    procedure cdsEventosReprodutivosGEMELARValidate(Sender: TField);
    procedure cdsEventosReprodutivosSEXO_CRIAValidate(Sender: TField);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FDadosFemea: TDataSource;
    FDiasGetacaoPrimipara, FDiasGetacaoMultipara : integer ;
    FOnGetCria: TGetCria;
    DiasPartoMultipara : integer ;
    DiasAbortoMultipara : integer  ;
    DiasPartoPrimipara : integer ;
    DiasAbortoPrimipara : integer ;
    FGrauDeSangue : TZoo_GrauDeSangue ;
    FGemelarOldValue : Variant;
    FUltimoToque : TDateTime;
    FPrenhezOld: String;
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetOnGetCria(const Value: TGetCria);
    procedure DoGetCria ;
    procedure CheckCioPartoRepetido ;
    procedure CheckDataUltimoEvento ;
    procedure CheckParto ;
    procedure CheckConfimacaoPrenhezAnterior ;
    procedure SetDadosFemea(const Value: TDataSource);

   procedure CalculateGrauSangue ;
   function ValidaSexoCria: Boolean;
   procedure AbortoNovaPrenhezNegativa;
   function CheckDoadoraReceptora : Boolean;
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
    property OnGetCria : TGetCria  read FOnGetCria write SetOnGetCria;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure SetMacho ( AKMacho, ANomeMacho : string  ; ATipoMacho : TTipoMacho ) ;
    procedure ForceAborto ( AcdsEventosReprodutivos : TDataSet )  ;
    procedure UpdateRacasGrauSangue ;
    procedure SetComposicaoRacas ;
    property GrauDeSangue : TZoo_GrauDeSangue read FGrauDeSangue ;
    constructor Create ( AOwner : TComponent ) ; override ;
    procedure CheckLactacaoNaoSeca ;
    function GetEventoAAbortar( out ADataEvento : TDateTime ) : string ;
    procedure GetDadosAborto(out isPrimipara : boolean ; out ADiasPrimipara, ADiasMultipara: integer);
    procedure  AbortarEvento( AKEventoAAbortar : string ; ADataAborto : TDateTime ; AAbrirLactacao : boolean)  ;
    function CheckLactacaoAtual: Boolean;
    procedure FilterSexoCria( AGestacaoGemelar: Boolean );
  end;

  TDeltaProc = class
   class procedure ColetaEmbriaoBeforeUpdateRecord( DSEventos : TCustomClientDataSet );
   class procedure AbrirLactacao( DSEventos : TCustomClientDataSet );
   class procedure InsertLinhagem( DSLinhagem: TCustomClientDataSet );
   class procedure GetPaiMae ( AKZOO_EVENTO_ZOOTECNICO : string ;
     out AKZooPai, ABrincoPai, ANomePai, AGrauSanguePai, AComposicaoPai,
         AKZooMae, ABrincoMae, ANomeMae, AGrauSangueMae, AComposicaoMae : string ;
         out AOrginadoEmbriao : boolean );
  end ;
implementation

uses Math,
     System.Variants,
     Data.SQLTimSt,
     ThreadSuppl,
     CDSSuppl,
     UDBZootecnico,
     CLAg5Types,
     GuidSuppl,
     Exceptions,
     DiagnosticosAnimalClass,
     Tc.DBRTL.AbstractDB,
     
     Tc.VCL.Application  ;

{$R *.dfm}

{ TdtmZoo_EventosReprodutivosAnimal }

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.AbortarEvento(
  AKEventoAAbortar: string; ADataAborto: TDateTime; AAbrirLactacao: boolean);
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  with Clone do
    try
      PacketRecords := 0 ;
      CloneCursor( cdsEventosReprodutivos, False, False );
      if Locate ( 'KZOO_EVENTO_ZOOTECNICO', AKEventoAAbortar, [] ) then
        begin
          edit ;
          FieldByName( 'DATAABORTOPARTO' ).asDateTime := ADataAborto ;
          if AAbrirLactacao then
             FieldByName( 'ABORTOPARTO' ).asInteger := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
          else
             FieldByName( 'ABORTOPARTO' ).asInteger := _ST_TIPO_PARTOABORTO_ABORTO ;
          post ;
        end;

    finally
       Clone.Free ;
    end ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.AbortoNovaPrenhezNegativa;
var
  isPrimipara, AbrirLactacao : Boolean;
  diasEvento  : integer;
  dataAborto : TDateTime;
begin
  cdsEventosReprodutivosPRENHEZ.OnValidate := nil;
  diasEvento  := Trunc ( cdsEventosReprodutivosDATATOQUE.AsDateTime - cdsEventosReprodutivosDATAEVENTO.asDateTime ) ;

  if ( cdsEventosReprodutivosPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE  ) and ( FPrenhezOld = _ST_STATUS_PRENHEZ_PRENHE ) and
      ( cdsEventosReprodutivosDATATOQUE.AsDateTime > FUltimoToque ) and
      ( not ((VarIsEmpty(cdsEventosReprodutivosPRENHEZ.OldValue)) or (VarIsNull(cdsEventosReprodutivosPRENHEZ.OldValue)) ) ) and
      ( cdsEventosReprodutivosABORTOPARTO.IsNull ) then
    begin
      isPrimipara := TAnimalFemea.isPrimipara( cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.AsString ) ;
      if (  isPrimipara and (diasEvento > DiasAbortoPrimipara) ) then
       begin
         AbrirLactacao :=  TTcCustomForm.MessageDlg (
         Format ( 'Animal prenhe (primípara) com mais de %d dias de gestação.', [ DiasAbortoPrimipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes
       end

      else if ( not isPrimipara and (diasEvento > DiasAbortoMultipara) ) then
       begin
         AbrirLactacao :=  TTcCustomForm.MessageDlg (
         Format ( 'Animal prenhe (multípara) com mais de %d dias de gestação.', [ DiasAbortoMultipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes
       end

      else
       begin
         TTcCustomForm.MessageDlg ('Animal prenhe, será lançado um aborto.', mtWarning ) ;
       end;

      dataAborto := cdsEventosReprodutivosDATATOQUE.AsDateTime ;
      cdsEventosReprodutivosPRENHEZ.AsBoolean := True;
      cdsEventosReprodutivosDATATOQUE.AsDateTime := FUltimoToque;


      if AbrirLactacao then
         cdsEventosReprodutivosABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
      else
         cdsEventosReprodutivosABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO ;

      cdsEventosReprodutivosDATAABORTOPARTO.OnValidate := nil;
      cdsEventosReprodutivosDATAABORTOPARTO.AsDateTime := dataAborto;
      cdsEventosReprodutivosDATAABORTOPARTO.OnValidate := cdsEventosReprodutivosDATAABORTOPARTOValidate;
      CheckLactacaoNaoSeca ;
    end
    else
     begin
       {cdsEventosReprodutivosABORTOPARTO.Clear;
       cdsEventosReprodutivosDATAABORTOPARTO.Clear;}
     end;
    cdsEventosReprodutivosPRENHEZ.OnValidate := cdsEventosReprodutivosPRENHEZValidate;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CalculateGrauSangue;
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosABORTOPARTOValidate(
  Sender: TField);
begin
  {
  if ((not cdsEventosReprodutivosDATAABORTOPARTO.IsNull) and
      (cdsEventosReprodutivosDATAABORTOPARTO.AsDateTime > 0)) and
     (cdsEventosReprodutivosABORTOPARTO.Value > 0)  then
    begin
      raise Warning.Create('Para alterar o tipo do parto/aborto é necessário limpar o campo "Data parto/aborto/coleta".');
    end;
   }
   

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosAfterCancel(
  DataSet: TDataSet);
begin
  cdsEventosReprodutivos.BeforeScroll := cdsEventosReprodutivosBeforeScroll ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosBeforeCancel(
  DataSet: TDataSet);
begin
  cdsEventosReprodutivos.BeforeScroll := nil ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosBeforeDelete(
  DataSet: TDataSet);
const
  _LACTACAO_ANTERIOR = 'SELECT DATALACTACAO, NL'
      +#13#10'FROM ZOO_LACTACOES'
      +#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      +#13#10' AND KZOO_EVENTO_ZOOTECNICO is distinct from  :KZOO_EVENTO_ZOOTECNICO'
      +#13#10' AND DATALACTACAO < :DATA_EVENTO'
      +#13#10'ORDER BY DATALACTACAO DESC'
      +#13#10'ROWS 1' ;
var
  cds : TClientDataSet ;
  p : TParams ;

  HasLactacaoAnterior : boolean ;
  DataLactacaoAnterior : TDateTime ;
  NLAnterior : integer ;

begin
       if cdsEventosReprodutivosRECORDEXISTS.asBoolean
        and not VarIsNull ( cdsEventosReprodutivosABORTOPARTO.OldValue )
        and ( cdsEventosReprodutivosABORTOPARTO.OldValue > _ST_TIPO_PARTOABORTO_ABORTO )
        and ( cdsEventosReprodutivosABORTOPARTO.OldValue <> _ST_TIPO_PARTOABORTO_COLETA ) then
        begin

             p := TParams.Create ;
             p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
             p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ; ;
             p.CreateParam( ftString, 'DATA_EVENTO', ptInput ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( cdsEventosReprodutivosDATAABORTOPARTO.OldValue ) ;
             cds := nil ;
             DBResources['ZOOTECNICO'].populateClientDataset ( cds, _LACTACAO_ANTERIOR, p ) ;

            HasLactacaoAnterior := not cds.IsEmpty ;
            if HasLactacaoAnterior then
              begin
               DataLactacaoAnterior := cds.FieldByName('DATALACTACAO').asDateTime ;
               NLAnterior           := cds.FieldByName('NL').asInteger ;
              end;

             p.Free ;
             cds.Free ;

             if HasLactacaoAnterior then
               begin
                 if ( MessageDlg ( Format ( 'A lactação sera excluída e as pesagens'#13#10
                 +'serão tranferidas para a lactação %d ( %s )'#13#10'Deseja continuar ?', [ NLAnterior, formatDateTime ( 'dd.mm.yyyy', DataLactacaoAnterior )  ] ), mtConfirmation ) <> mrYes ) then
                    Abort  ;
               end
             else
               begin
                 if ( MessageDlg ( 'A lactação e as pesagens serão excluídas'#13#10'deseja continuar ?', mtConfirmation ) <> mrYes ) then
                    Abort  ;
               end;

        end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosBeforeEdit(
  DataSet: TDataSet);
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  with Clone do
    try
      PacketRecords := 0 ;
      CloneCursor( cdsEventosReprodutivos, False, False );
      AddIndex( 'IX', 'DATAEVENTO;SYS$DI;TIPOEVENTO', [] ) ;
      if Locate ( 'KZOO_EVENTO_ZOOTECNICO', cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString, [] ) then
        begin
          Next ;
          if  ( FieldByName( 'DATAEVENTO' ).asDateTime > cdsEventosReprodutivosDATAEVENTO.asDateTime ) then
             raise Warning.Create('Existem eventos após este. Não é possivel a alteração');
        end;
    finally
       Clone.Free ;
    end ;
   FGemelarOldValue := cdsEventosReprodutivosGEMELAR.AsVariant;
  // FilterSexoCria( cdsEventosReprodutivosGEMELAR.AsBoolean );
  FUltimoToque := cdsEventosReprodutivosDATATOQUE.AsDateTime;
  FPrenhezOld  := cdsEventosReprodutivosPRENHEZ.AsString;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosBeforePost(
  DataSet: TDataSet);
var
  ErrMsg : string ;

  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;

begin
  ErrMsg := '' ;

  if ( cdsEventosReprodutivosDATAEVENTO.asDateTime = 0 ) {or ( cdsEventosReprodutivosDATAEVENTO.asDateTime < ( date - 30  ) )} then
//     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
     AddErr ( 'Data - inválida' ) ;

  if ( cdsEventosReprodutivosDATAEVENTO.asDateTime >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if cdsEventosReprodutivosTIPOEVENTO.asInteger = 0 then
     AddErr ( 'Evento' ) ;

  case cdsEventosReprodutivosTIPOEVENTO.asInteger of
    _ST_TIPO_EVENTO_ZOO_CIO :
       begin
         //if Trim( cdsEventosReprodutivosKCAD_FUNCIONARIO.asString ) = '' then
         //   AddErr ( 'Funcionário obrigatório' ) ;
       end ;

    _ST_TIPO_EVENTO_ZOO_INSEMINA :
      begin
        if ( cdsEventosReprodutivosDOSES.asInteger < 1 ) then
           cdsEventosReprodutivosDOSES.asInteger := 1 ;

        // if ( cdsEventosReprodutivosDOSES.asInteger < 1 ) then
        //     AddErr ( 'inseminação - Doses para o evento' ) ;
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
             AddErr ( 'inseminação - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger - 1 ) <> tmSemen then
             AddErr ( 'inseminação - O macho selecionado não é um semen' ) ;
         if    ( cdsEventosReprodutivosIATF.asBoolean )
           and ( cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.isNull ) then
             AddErr ( 'inseminação - Indicar o protocolo de IATF' ) ;
    end ;

    _ST_TIPO_EVENTO_ZOO_MONTA :
      begin
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
            AddErr ( 'monta - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger - 1 ) <> tmTouro then
            AddErr ( 'monta - O macho selecionado não é um touro' ) ;
      end ;

    _ST_TIPO_EVENTO_ZOO_IMPLANTE :
      begin
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
            AddErr ( 'implante - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger - 1 ) <> tmEmbriao then
            AddErr ( 'implante - O macho selecionado não é um embrião' ) ;
        // if Trim( cdsEventosReprodutivosKCAD_FUNCIONARIO.asString ) = '' then
        //    AddErr ( 'implante - Funcionário obrigatório' ) ;
         if    ( cdsEventosReprodutivosIATF.asBoolean )
           and ( cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.isNull ) then
             AddErr ( 'inseminação - Indicar o protocolo de IATF' ) ;
      end ;
  end ;

  if ( not cdsEventosReprodutivosDATATOQUE.isNull ) and ( (cdsEventosReprodutivosPrenhez.isNull) or (cdsEventosReprodutivosPrenhez.AsString = '' ) ) then
      AddErr ( 'Data de toque preenchida, informar prenhe/não prenhe' ) ;

  if ( not cdsEventosReprodutivosDATATOQUE.isNull ) and ( cdsEventosReprodutivosDATATOQUE.AsDateTime < cdsEventosReprodutivosDATAEVENTO.asDateTime ) then
     AddErr ( 'Data de toque não pode ser inferior a data do evento');

  if ( ( Trim ( cdsEventosReprodutivosPRENHEZ.asString ) <> '' ) ) and (  cdsEventosReprodutivosDATATOQUE.isNull ) then
      AddErr ( 'Confirmação de prenhez preenchida, informar data do toque' ) ;

  if ( not cdsEventosReprodutivosDATAABORTOPARTO.isNull ) and ( cdsEventosReprodutivosABORTOPARTO.isNull or (cdsEventosReprodutivosABORTOPARTO.asString = '') ) then
      AddErr ( 'Data de aborto/parto preenchida, informar aborto/parto' ) ;

  if ( not ( cdsEventosReprodutivosABORTOPARTO.asString = '' ) ) and (  cdsEventosReprodutivosDATAABORTOPARTO.isNull ) then
      AddErr ( 'Confirmação de aborto/parto preenchida, informar data do aborto/parto' ) ;

  if ( cdsEventosReprodutivosABORTOPARTO.asInteger = _ST_TIPO_PARTOABORTO_COLETA ) and (  cdsEventosReprodutivosEMBRIOESCOLETADOS.asInteger <= 0 ) then
      AddErr ( 'Informar o numero de embriões coletados' ) ;

  //if not ValidaSexoCria then
  //    AddErr('Sexagem da cria não confere com o status da gestação gemelar' );

// -  este if nao faz sentido, nunca será null
//  if VarIsNull ( cdsEventosReprodutivosMUCO.asInteger = 0  ) then
//     AddErr ( 'Muco' ) ;


  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos para o registro atual'#13#10#13#10 + ErrMsg );

  if not CheckDoadoraReceptora then
   begin
    cdsEventosReprodutivos.Cancel;
    Abort;
   end;

  CheckLactacaoNaoSeca ;

  ValidaSexoCria;

(*-- removido a pedido do augusto, conforme email.
  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_CIO )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ) then
     begin
             cdsEventosReprodutivosNOMEFUNCIONARIO.Clear ;
             cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
     end ;
*)
  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
        cdsEventosReprodutivosDOSES.Clear ;

  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
     {$IFDEF _IATF_MONTA}
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA    ) // added
     {$ENDIF _IATF_MONTA}
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
     begin
             cdsEventosReprodutivosIATF.asString := 'F' ;
     end ;

  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
     begin
             cdsEventosReprodutivosNOMEMACHO.Clear ;
             cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
     end ;

 CheckConfimacaoPrenhezAnterior ;
 AbortoNovaPrenhezNegativa;

// if cdsEventosReprodutivosINCLUIRCRIA.AsBoolean and cdsLinhagem.isEmpty then
//   begin
//     ThreadSuppl.TSyncThread.Create(  DoGetCria ) ;
//     Abort ;
//   end;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosBeforeScroll(
  DataSet: TDataSet);
begin
  try
    cdsEventosReprodutivos.BeforeScroll := nil ;
    if cdsEventosReprodutivos.Modified then
       ApplyUpdates ;
  finally
    cdsEventosReprodutivos.BeforeScroll := cdsEventosReprodutivosBeforeScroll ;
  end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosCalcFields(
  DataSet: TDataSet);
begin

   if not ( cdsEventosReprodutivos.State in [ dsInsert, dsEdit, dsInternalCalc ] ) then
     exit ;

   try
     cdsEventosReprodutivos.OnCalcFields := nil ;

   if   ( cdsEventosReprodutivosRECORDEXISTS.asBoolean )
    and (  cdsEventosReprodutivosTIPOMACHO.asInteger = 0 ) then
        begin
          case  ( cdsEventosReprodutivosTIPOEVENTO.asInteger ) of
          _ST_TIPO_EVENTO_ZOO_INSEMINA   : cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmSemen   )+ 1 ;
          _ST_TIPO_EVENTO_ZOO_MONTA      : cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmTouro   )+ 1 ;
          _ST_TIPO_EVENTO_ZOO_IMPLANTE   : cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmEmbriao )+ 1 ;
          else cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmUndefined ) + 1;
          end;
        end;

     if cdsEventosReprodutivosPRENHEZ.AsBoolean then
       begin
         if cdsEventosReprodutivosNL.AsInteger <= 1 then
           cdsEventosReprodutivosPREVISAOPARTO.asDateTime := cdsEventosReprodutivosDATAEVENTO.AsDateTime + FDiasGetacaoPrimipara
         else
           cdsEventosReprodutivosPREVISAOPARTO.asDateTime := cdsEventosReprodutivosDATAEVENTO.AsDateTime + FDiasGetacaoMultipara ;
       end
     else
       cdsEventosReprodutivosPREVISAOPARTO.Clear;
   finally
      cdsEventosReprodutivos.OnCalcFields := cdsEventosReprodutivosCalcFields ;
   end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATAABORTOPARTOValidate(
  Sender: TField);
const
  _LACTACAO_ANTERIOR = 'SELECT DATALACTACAO, NL'
      +#13#10'FROM ZOO_LACTACOES'
      +#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      +#13#10' AND KZOO_EVENTO_ZOOTECNICO is distinct from  :KZOO_EVENTO_ZOOTECNICO'
      +#13#10' AND DATALACTACAO < :DATA_EVENTO'
      +#13#10'ORDER BY DATALACTACAO DESC'
      +#13#10'ROWS 1' ;

  _LACTACAO_NAO_SECA = 'SELECT DATALACTACAO, NL'
      +#13#10'FROM ZOO_LACTACOES'
      +#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      +#13#10' AND KZOO_EVENTO_ZOOTECNICO is distinct from  :KZOO_EVENTO_ZOOTECNICO'
      +#13#10' AND DATA_SECAGEM is  null'
      +#13#10' AND DATALACTACAO < :DATA_EVENTO' ;
var
  diasAbortoLC : integer ;
  diasParto    : integer ;
  cds : TClientDataSet ;
  ErrMsg : string ;
  IsDoador : boolean ;
  p : TParams ;

  HasLactacaoAnterior : boolean ;
  DataLactacaoAnterior : TDateTime ;
  NLAnterior : integer ;

  function GetOldValue_DATAABORTOPARTO : TDateTime;
  begin
    with TClientDataSet.Create(nil) do
    try
      PacketRecords := 0  ;
      CloneCursor((Sender.DataSet as TClientDataSet), False);
      Locate ( 'KZOO_EVENTO_ZOOTECNICO', Sender.DataSet.FieldByName('KZOO_EVENTO_ZOOTECNICO').asString, [] ) ;
      Result := FieldByName('DATAABORTOPARTO').OldValue ;
    finally
      Free;
    end;
  end;

begin

  // if cdsPartosAbortosSTATUS.asInteger = _ST_STATUS_FEMEA_VACALACTACAO then
//     raise Warning.Create('Não é possível confirmar parto. Animal não esta seco.');


  IsDoador := ( FDadosFemea.DataSet.FieldByName( 'DOADOR_RECEPTOR' ).asInteger = _ST_TIPO_DOADOR_RECEPTOR_DOADOR ) ;

   if   ( Sender.IsNull ) then
     begin

       if cdsEventosReprodutivosRECORDEXISTS.asBoolean
        and not VarIsNull ( cdsEventosReprodutivosABORTOPARTO.OldValue )
        and ( cdsEventosReprodutivosABORTOPARTO.OldValue > _ST_TIPO_PARTOABORTO_ABORTO )
        and ( cdsEventosReprodutivosABORTOPARTO.OldValue <> _ST_TIPO_PARTOABORTO_COLETA ) then
        begin


             p := TParams.Create ;
             p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
             p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ;

             p.CreateParam( ftString, 'DATA_EVENTO', ptInput ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( GetOldValue_DATAABORTOPARTO ) ;
             cds := nil ;
             DBResources['ZOOTECNICO'].populateClientDataset ( cds, _LACTACAO_ANTERIOR, p ) ;

            HasLactacaoAnterior := not cds.IsEmpty ;
            if HasLactacaoAnterior then
              begin
               DataLactacaoAnterior := cds.FieldByName('DATALACTACAO').asDateTime ;
               NLAnterior           := cds.FieldByName('NL').asInteger ;
              end;

             p.Free ;
             cds.Free ;

             if HasLactacaoAnterior then
               begin
                 if ( MessageDlg ( Format ( 'A lactação sera excluída e as pesagens'#13#10
                 +'serão tranferidas para a lactação %d ( %s )'#13#10'Deseja continuar ?', [ NLAnterior, formatDateTime ( 'dd.mm.yyyy', DataLactacaoAnterior )  ] ), mtConfirmation ) <> mrYes ) then
                    Abort  ;
               end
             else
               begin
                 if ( MessageDlg ( 'A lactação e as pesagens serão excluídas'#13#10'deseja continuar ?', mtConfirmation ) <> mrYes ) then
                    Abort  ;
               end;

        end;

       cdsEventosReprodutivosABORTOPARTO.clear ;

       if IsDoador then
         cdsEventosReprodutivosEMBRIOESCOLETADOS.clear ;

       exit ;
     end;


  if ( IsDoador ) then
    begin

      if ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime < cdsEventosReprodutivosDATAEVENTO.asDateTime ) then
         raise Warning.Create('Data da coleta deve ser maior ou igual que a data do evento');

      if ( not cdsEventosReprodutivosPRENHEZ.asBoolean  ) then
        cdsEventosReprodutivosPRENHEZ.asString := 'T' ;

      cdsEventosReprodutivosDATATOQUE.AsDateTime  := cdsEventosReprodutivosDATAABORTOPARTO.AsDateTime ;
      //--kiq cdsEventosReprodutivosFORCEABORTO.asString  := 'F' ;
      cdsEventosReprodutivosABORTOPARTO.asInteger :=  _ST_TIPO_PARTOABORTO_COLETA ;
      //--kiq cdsEventosReprodutivosABRIRLACTACAO.asString := 'T' ;
      cdsEventosReprodutivosINCLUIRCRIA.asString   := 'F' ; //++kiq
      exit ;

    end ;

  if ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime <= cdsEventosReprodutivosDATAEVENTO.asDateTime ) then
     raise Warning.Create('Data do parto/aborto deve ser maior que a data do evento');

  if  ( not cdsEventosReprodutivosPRENHEZ.asBoolean )
   or (cdsEventosReprodutivosDATATOQUE.isNull) then
     raise Warning.Create('Não é possível lancar aborto/parto para um evento sem confirmação de prenhez ');

   if   ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime < cdsEventosReprodutivosDATATOQUE.asDateTime )
    and ( not IsDoador ) then
     raise Warning.Create('Data do parto/aborto deve ser maior que a data de toque');

  if ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime > Date ) then
     raise Warning.Create('Data do parto/aborto não pode ser maior que a data atual');

  cdsEventosReprodutivosDIAS.asInteger := Trunc ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime - cdsEventosReprodutivosDATAEVENTO.asDateTime ) ;

  CheckCioPartoRepetido ;

  if cdsEventosReprodutivosNL.asInteger < 1 then
    begin
     diasAbortoLC := DiasAbortoPrimipara ;
     diasParto    := DiasPartoPrimipara ;
    end
  else
    begin
     diasAbortoLC := DiasAbortoMultipara ;
     diasParto    := DiasPartoMultipara ;
    end ;

  (* movido para o campo abortoparto
  ErrMsg := '' ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
  p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ; ;
  p.CreateParam( ftString, 'DATA_EVENTO', ptInput ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( Sender.asDateTime ) ;
  cds := nil ;
  DBResources['ZOOTECNICO'].populateClientDataset ( cds, _LACTACAO_NAO_SECA, p ) ;
  if not cds.fieldByName ( 'DATALACTACAO' ).isNull then
    begin
      ErrMsg :=    'Existem lactaçãoes não secas para o animal'
            +#13#10'data - NL' ;
      while not cds.eof  do
        begin
         ErrMsg := format ( '%s'#13#10'%s - %d',
           [ ErrMsg,
             formatDateTime ( 'dd.mm.yyyy', cds.fieldByName ( 'DATALACTACAO' ).asDateTime ),
             cds.fieldByName ( 'NL' ).asInteger ] )  ;
         cds.next ;
        end;
    end;
   p.free ;
   cds.free ;

   if ErrMsg <> '' then
     raise Warning.Create( ErrMsg );
  *)

  cdsEventosReprodutivosABORTOPARTO.OnValidate := nil;
  if cdsEventosReprodutivosDIAS.asInteger >= ( diasParto - 30 ) then
    begin
     //--kiq cdsEventosReprodutivosFORCEABORTO.asString := 'F' ;
     cdsEventosReprodutivosABORTOPARTO.asInteger :=  _ST_TIPO_PARTOABORTO_PARTO ;
     //--kiq cdsEventosReprodutivosABRIRLACTACAO.asString := 'T' ;
     cdsEventosReprodutivosINCLUIRCRIA.asString   := 'T' ; //++kiq
    end
  else if cdsEventosReprodutivosDIAS.asInteger >= diasAbortoLC then
    begin
     //--kiq cdsEventosReprodutivosFORCEABORTO.asString := 'F' ;
     cdsEventosReprodutivosABORTOPARTO.asInteger :=  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO ;
     //--kiq cdsEventosReprodutivosABRIRLACTACAO.asString := 'T' ;
     cdsEventosReprodutivosINCLUIRCRIA.asString   := 'F' ; //++VTS
    end
  else
   begin
     //--kiq cdsEventosReprodutivosFORCEABORTO.asString   := 'T' ;
     cdsEventosReprodutivosABORTOPARTO.asInteger  :=  _ST_TIPO_PARTOABORTO_ABORTO ;
     //--kiq cdsEventosReprodutivosABRIRLACTACAO.asString := 'F' ;
     cdsEventosReprodutivosINCLUIRCRIA.asString   := 'F' ; //++VTS
   end;
   cdsEventosReprodutivosABORTOPARTO.OnValidate := cdsEventosReprodutivosABORTOPARTOValidate;


end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATAEVENTOValidate(
  Sender: TField);
begin
   if   ( not Sender.IsNull ) then
   begin
      CheckDataUltimoEvento ;
      CheckParto ;
   end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATATOQUEValidate(
  Sender: TField);
begin
  if ( not Sender.IsNull ) and ( sender.AsDateTime < cdsEventosReprodutivosDATAEVENTO.asDateTime ) then
     raise Warning.Create('Data de toque não pode ser inferior a data do evento');

  if ( not Sender.IsNull ) and ( Sender.AsDateTime < FUltimoToque ) then
    raise Warning.Create('A data do último toque é posterior à data de novo toque' );

  if ( not Sender.IsNull ) and ( Sender.AsDateTime > Date ) then
    raise Warning.Create('Data do toque superior a atual' );
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDOSESGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) then
     Text := cdsEventosReprodutivosDOSES.asString ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosGEMELARValidate(
  Sender: TField);
begin
  {cdsEventosReprodutivosSEXO_CRIA.OnValidate := nil;
  if cdsEventosReprodutivosGEMELAR.IsNull then
   begin
     cdsEventosReprodutivosSEXO_CRIA.AsVariant := Null;
     //FilterSexoCria( True );
   end
  else
   begin
     if (cdsEventosReprodutivosGEMELAR.Value <> FGemelarOldValue) or
        ( (VarIsNull( FGemelarOldValue ) ) or ( VarIsEmpty(FGemelarOldValue) ) ) then
      begin
       cdsEventosReprodutivosSEXO_CRIA.AsVariant := Null;
      // FilterSexoCria( cdsEventosReprodutivosGEMELAR.AsBoolean );
      end;
   end;
  FGemelarOldValue := cdsEventosReprodutivosGEMELAR.Value;
  cdsEventosReprodutivosSEXO_CRIA.OnValidate := cdsEventosReprodutivosSEXO_CRIAValidate;}
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosIATFGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosIATFValidate(
  Sender: TField);
begin
   if not Sender.asBoolean then
    begin
      cdsEventosReprodutivosDESC_PROTOCOLO_IATF.Clear ;
      cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.Clear ;
    end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosIDADE_MESESGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (   ( cdsEventosReprodutivosABORTOPARTO.asInteger =  _ST_TIPO_PARTOABORTO_PARTO )
      or ( cdsEventosReprodutivosABORTOPARTO.asInteger =  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
     ) and not cdsEventosReprodutivosDATAABORTOPARTO.IsNull then
       Text := Format ( '%f', [ RoundTo (
                           (   cdsEventosReprodutivosDATAABORTOPARTO.asDateTime
                             - TDataSetField ( FMasterSource.DataSet.FieldByName( 'sqlDadosFemea' ) ).NestedDataSet.FieldByName( 'NASCIMENTO' ).asDateTime
                           ) / 365.0 * 12, -1 ) ] )
  else
    text := ''
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosNewRecord(
  DataSet: TDataSet);
const
  _SELECT_NUMERO_LACTACAO = 'NUMERO_LACTACAO FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA' ;
  _SELECT_DOADOR_RECEPTOR = 'SELECT DOADOR_RECEPTOR FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA';
var
 p : TParams ;
 cds : TClientDataSet ;

begin
  GetKey ( cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO ) ;
  cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
  cdsEventosReprodutivosRECORDEXISTS.asString := 'F' ;
  cdsEventosReprodutivosREEXAMINAR.asString   := 'F' ;
  cdsEventosReprodutivosINCLUIRCRIA.asString  := 'F' ;
  cdsEventosReprodutivosIATF.asString  := 'F' ;
  cdsEventosReprodutivosTIPOMACHO.asInteger   := Ord ( tmUndefined ) + 1 ;
  cdsEventosReprodutivosSYSDI.asDateTime      := Now ;
  FGemelarOldValue := cdsEventosReprodutivosGEMELAR.AsVariant;
  FUltimoToque := 0;
  FPrenhezOld  := '';

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
  cds :=  nil ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_NUMERO_LACTACAO, p ) ;
  cdsEventosReprodutivosNL.asInteger := cds.FieldByName ( 'NUMERO_LACTACAO' ).asInteger ;
  cds.Free;

  cds := nil;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_DOADOR_RECEPTOR, p ) ;
  cdsEventosReprodutivosDOADOR_RECEPTOR.asInteger := cds.FieldByName ( 'DOADOR_RECEPTOR' ).asInteger ;
  cds.Free;
  p.free ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosNOMEMACHOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if    ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) then
        Text := cdsEventosReprodutivosNOMEMACHO.asString ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosNOMEMACHOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosNUMEROFILHOSGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( cdsEventosReprodutivosABORTOPARTO.AsInteger <> _ST_TIPO_PARTOABORTO_COLETA ) and (cdsLinhagem.RecordCount > 0) then
     Text := IntToStr ( cdsLinhagem.RecordCount ) ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosPRENHEZValidate(
  Sender: TField);
begin
   if   ( not Sender.asBoolean )
    and ( not cdsEventosReprodutivosDATAABORTOPARTO.isNull ) then
      raise Warning.Create('Não é possível remover a confimação de prenhez de um aborto/parto') ;

   if ( Sender.asString = '' ) and (not cdsEventosReprodutivosPRENHEZ.isNull) then
     begin
       cdsEventosReprodutivosPRENHEZ.OnValidate := nil ;
       cdsEventosReprodutivosPRENHEZ.Clear ;
       cdsEventosReprodutivosDATATOQUE.Clear;
       cdsEventosReprodutivosPRENHEZ.OnValidate := cdsEventosReprodutivosPRENHEZValidate ;
     end;


end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosPROTOCOLO_PARTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosPROTOCOLO_TOQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosREEXAMINARGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosSEXO_CRIAValidate(
  Sender: TField);
begin
  if ((cdsEventosReprodutivosPRENHEZ.IsNull) or (cdsEventosReprodutivosPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE))
     and (not cdsEventosReprodutivosSEXO_CRIA.IsNull) then
   begin
     raise Warning.Create('Não é possível informar o sexo da cria para um animal não prenhe' );
   end;

  if cdsEventosReprodutivosSEXO_CRIA.AsInteger < _ST_SEXO_CRIA_F_F then
    cdsEventosReprodutivosGEMELAR.AsString := 'F'
  else
    cdsEventosReprodutivosGEMELAR.AsString := 'T';

  if cdsEventosReprodutivosSEXO_CRIA.IsNull then
    cdsEventosReprodutivosGEMELAR.Clear;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosTIPOEVENTOSetText(
  Sender: TField; const Text: string);
begin
   self.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
   Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosTIPOEVENTOValidate(
  Sender: TField);
begin

   if   ( Sender.asInteger = _ST_TIPO_EVENTO_ZOO_CIO ) then
     begin
        if    ( not cdsEventosReprodutivosKZOO_ANIMAL_MACHO.isNull )
//          or  ( cdsEventosReprodutivosDOSES.AsInteger > 0  )
          or  ( not cdsEventosReprodutivosDATATOQUE.isNull )
          or  ( not cdsEventosReprodutivosPRENHEZ.IsNull )
          or  ( cdsEventosReprodutivosREEXAMINAR.AsBoolean )
          or  ( not cdsEventosReprodutivosPREVISAOPARTO.isNull )
          or  ( not cdsEventosReprodutivosDATAABORTOPARTO.isNull )
          or  ( not cdsEventosReprodutivosABORTOPARTO.isNull ) then
          raise Warning.Create('Não é possível lançar um cio para o animal quando '
                        +#13#10'os campos a seguir estiverem preenchidos:'
              +#13#10''
              +#13#10'Macho'
//              +#13#10'Doses'
              +#13#10'Data toque'
              +#13#10'Prenhez'
              +#13#10'Reexaminar'
              +#13#10'Previsão de parto'
              +#13#10'Data aborto/parto'
              +#13#10'Aborto/Parto' ) ;

          if  ( not cdsEventosReprodutivosDATAEVENTO.IsNull ) then
             CheckParto ;
     end
     (*
   else if   ( Sender.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
         and ( cdsEventosReprodutivosDOSES.asInteger > 0 ) then
     raise Warning.Create('Não é possível lançar a monta com doses preenchido');
     *)
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemALTURAValidate(
  Sender: TField);
begin
   if Sender.AsInteger < 0 then
      raise Warning.Create('Altura não pode ser inferior a 0.');
   if Sender.AsInteger > 210 then
      raise Warning.Create('Altura máxima permitida 210 cm');
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsLinhagem.RecordCount = 3 then
     raise Warning.Create('Não é possível incluir mais que 3 animais');
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemBeforePost(DataSet: TDataSet);
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemBRINCOValidate(Sender: TField);
begin
  if cdsLinhagemSEXO.AsString = 'M' then
    begin
      if TAnimalMacho.CheckCodigoExists ( LoggedUser.DomainID,Sender.AsString, cdsLinhagemKZOO_ANIMAL.AsString ) then
         raise Warning.Create('Código em uso por outro animal')
    end
  else
    if TAnimalFemea.CheckBrincoExists ( LoggedUser.DomainID, Sender.asString, cdsLinhagemKZOO_ANIMAL.asString ) then
       raise Warning.Create('Brinco em uso por outro animal');
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemCalcFields(DataSet: TDataSet);
begin
  inherited;
//  if DataSet.State = dsInternalCalc  then

  if cdsLinhagem.Recno = -1 then
    cdsLinhagemNUMERO.asString := '<novo>'
  else
    cdsLinhagemNUMERO.asString := IntToStr ( cdsLinhagem.Recno ) + '/' + IntToStr ( cdsLinhagem.RecordCount ) ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsLinhagemGRAUSANGUE.asString, cdsLinhagemCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemGRAUSANGUESetText(Sender: TField;
  const Text: string);
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsLinhagemGRAUSANGUE.asString, cdsLinhagemCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemNewRecord(
  DataSet: TDataSet);
begin
   GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
   GetKey ( cdsLinhagemKZOO_ANIMAL ) ;
   cdsLinhagemKZOO_EVENTO_ZOOTECNICO.asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ;
   cdsLinhagemNATIMORTO.asString := 'F' ;
   cdsLinhagemSEXO.asString := 'F' ;

   cdsLinhagemNASCIMENTO.AsDateTime := cdsEventosReprodutivosDATAABORTOPARTO.asDateTime ;


  cdsLinhagemGRAUSANGUEPAI.asString       := cdsEventosReprodutivosGRAUSANGUEPAI.asString      ;
  cdsLinhagemCOMPOSICAORACAPAI.asString   := cdsEventosReprodutivosCOMPOSICAORACAPAI.asString  ;
  cdsLinhagemGRAUSANGUEMAE.asString       := cdsEventosReprodutivosGRAUSANGUEMAE.asString      ;
  cdsLinhagemCOMPOSICAORACAMAE.asString   := cdsEventosReprodutivosCOMPOSICAORACAMAE.asString  ;
  cdsLinhagemRETIRO_CRIA.asString         := cdsEventosReprodutivosRETIRO.asString  ;

  cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
  cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;

  CalculateGrauSangue ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagemPESOValidate(
  Sender: TField);
begin
   if Sender.AsInteger < 0 then
      raise Warning.Create('Peso não pode ser inferior a zero.');
   if Sender.AsInteger > 999 then
      raise Warning.Create('Peso máximo permitido 999 Kg');
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckCioPartoRepetido;
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsEventosReprodutivos, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).Value <> cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.Value ) then
            begin

             if    ( FieldByName( 'TIPOEVENTO' ).asInteger     = _ST_TIPO_EVENTO_ZOO_CIO )
               and ( FieldByName( 'DATAEVENTO' ).AsDateTime    = cdsEventosReprodutivosDATAABORTOPARTO.AsDateTime ) then
                 raise Warning.Create('Existe um cio com a mesma data de aborto/parto');

             if     ( FieldByName( 'TIPOEVENTO' ).asInteger     <> _ST_TIPO_EVENTO_ZOO_CIO )
                and ( FieldByName( 'DATAABORTOPARTO' ).asDateTime > 0 )
                and ( FieldByName( 'DATAABORTOPARTO' ).AsDateTime    = cdsEventosReprodutivosDATAABORTOPARTO.AsDateTime ) then
                 raise Warning.Create('Já existe um aborto/parto na mesma data');

            end;
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;


procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckConfimacaoPrenhezAnterior;
var
   Clone : TClientDataSet ;
   LAbortoParto : integer ;
   diasAbortoLC : integer ;
   diasParto    : integer ;
   LDias : integer ;
   LDescEvento : string ;

begin

  Clone := TClientDataSet.Create ( nil ) ;
  with Clone do
    try
      PacketRecords := 0 ;
      CloneCursor( cdsEventosReprodutivos, False, False );
      AddIndex( 'IX', 'DATAEVENTO;SYS$DI;TIPOEVENTO', [] ) ;
      if Locate ( 'KZOO_EVENTO_ZOOTECNICO', cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString, [] ) then
        Prior;
      if    ( FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).Value  <>  cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.Value )
        and ( FieldByName( 'TIPOEVENTO' ).asInteger <> _ST_TIPO_EVENTO_ZOO_CIO )
        and ( FieldByName( 'DATAEVENTO' ).asDateTime < cdsEventosReprodutivosDATAEVENTO.asDateTime )
        and ( FieldByName( 'PRENHEZ' ).asString =  _ST_STATUS_PRENHEZ_PRENHE )
        and ( FieldByName( 'DATAABORTOPARTO' ).isNull ) then
        begin

            if FieldByName ( 'NL' ).asInteger < 1 then
              begin
               diasAbortoLC := DiasAbortoPrimipara ;
               diasParto    := DiasPartoPrimipara ;
              end
            else
              begin
               diasAbortoLC := DiasAbortoMultipara ;
               diasParto    := DiasPartoMultipara ;
              end ;

            LDias := Trunc ( (cdsEventosReprodutivosDATAEVENTO.asDateTime - 1) - FieldByName ( 'DATAEVENTO' ).asDateTime ) ;

       cdsTipoEvento.Locate( 'TIPO;VALOR', VarArrayOf( [_ST_TIPO_EVENTO_ZOO, clone.FieldByName( 'TIPOEVENTO' ).AsInteger] ), [] ) ;
       LDescEvento := cdsTipoEventoDESCRICAO.AsString;

           if     ( LDias >= diasAbortoLC )
              and ( MessageDlg ( Format( 'O evento %s de %s gerou um aborto após %d dias.'
                                  +#13#10
                                  +#13#10'Deseja abrir nova lactação ?',
                                  [ LDescEvento,
                                    FormatDateTime ( 'dd.mm.yyyy', clone.FieldByName ( 'DATAEVENTO' ).asDateTime ),
                                    diasAbortoLC
                                  ] ), mtConfirmation ) = mrYes ) then
                LAbortoParto := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
           else
                LAbortoParto := _ST_TIPO_PARTOABORTO_ABORTO ;


           cdsEventosReprodutivos.BeforeEdit := nil ;
           try
             Edit ;
  //           Clone.OnCalcFields := nil ;
             FieldByName( 'ABORTOPARTO' ).asInteger      := LAbortoParto ;
             FieldByName( 'DATAABORTOPARTO' ).asDateTime := cdsEventosReprodutivosDATAEVENTO.asDateTime - 1 ;
             FieldByName( 'INCLUIRCRIA' ) .asString      := 'F' ;
             cdsEventosReprodutivosDIAS.asInteger        := LDias ;
             //if LAbortoParto = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO then
             //   FieldByName( 'FORCEABORTO' ).asString    := 'F'
             //else
             //   FieldByName( 'FORCEABORTO' ) .asString   := 'T' ;

             Post ;
           finally
             cdsEventosReprodutivos.BeforeEdit := cdsEventosReprodutivosBeforeEdit ;
           end;
        end;
    finally
       Clone.Free ;
    end ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckDataUltimoEvento;
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsEventosReprodutivos, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).Value <> cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.Value )
           and ( FieldByName( 'DATAEVENTO' ).AsDateTime >  cdsEventosReprodutivosDATAEVENTO.AsDateTime ) then
             raise Warning.Create('Existem eventos com data posterior a ' + FormatDateTime ( 'dd.mm.yyyy', cdsEventosReprodutivosDATAEVENTO.AsDateTime ) );
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;

function TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckDoadoraReceptora: Boolean;
begin
  Result := True;
  if ( not cdsEventosReprodutivosPRENHEZ.IsNull ) and ( cdsEventosReprodutivosPRENHEZ.AsString <> '' ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger =  _ST_TIPO_DOADOR_RECEPTOR_DOADOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas com diagnóstico de gestação serão desmarcadas como Doadoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end
  else
  if ( cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger <>  _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas com transferência de embrião serão marcadas como Receptoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end
  else
  if ( (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA) or
       (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_MONTA) ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger =  _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas receptoras cobertas por touro ou inseminadas serão desmarcadas como Receptoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end;


end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.GetDadosAborto(out isPrimipara : boolean ; out ADiasPrimipara, ADiasMultipara: integer);
begin
  isPrimipara := TAnimalFemea.isPrimipara( cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.AsString ) ;
  TParamMatriz.GetParam(LoggedUser.DomainID,  _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, ADiasPrimipara, ADiasMultipara ) ;
end;

function TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.GetEventoAAbortar( out ADataEvento : TDateTime ) : string ;
var
   Clone : TClientDataSet ;
begin
  Result := '' ;
  Clone := TClientDataSet.Create ( nil ) ;
  with Clone do
    try
      PacketRecords := 0 ;
      CloneCursor( cdsEventosReprodutivos, False, False );
      AddIndex( 'IX', 'DATAEVENTO;SYS$DI;TIPOEVENTO', [] ) ;
      Last ;
      if    (FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString <> cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString)
            and (FieldByName( 'PRENHEZ' ).asBoolean)
            and (FieldByName( 'DATAABORTOPARTO' ).isNull) then
        begin
          ADataEvento := FieldByName ( 'DATAEVENTO' ).AsDateTime ;
          Result := FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).AsString ;
        end;

    finally
       Clone.Free ;
    end ;

end;

function TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckLactacaoAtual: Boolean;
const
  _LACTACAO_ANTERIOR = 'SELECT DATALACTACAO, NL'
      +#13#10'FROM ZOO_LACTACOES'
      +#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      +#13#10' AND KZOO_EVENTO_ZOOTECNICO is distinct from  :KZOO_EVENTO_ZOOTECNICO'
      +#13#10' AND DATALACTACAO < :DATA_EVENTO'
      +#13#10'ORDER BY DATALACTACAO DESC'
      +#13#10'ROWS 1' ;
var
  cds : TClientDataSet ;
  p : TParams ;

  HasLactacaoAnterior : boolean ;
  DataLactacaoAnterior : TDateTime ;
  NLAnterior : integer ;
begin
  Result := True;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
  p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ; ;
  p.CreateParam( ftString, 'DATA_EVENTO', ptInput ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( cdsEventosReprodutivosDATAABORTOPARTO.OldValue ) ;
  cds := nil ;
  DBResources['ZOOTECNICO'].populateClientDataset ( cds, _LACTACAO_ANTERIOR, p ) ;

  HasLactacaoAnterior := not cds.IsEmpty ;
  if HasLactacaoAnterior then
   begin
     DataLactacaoAnterior := cds.FieldByName('DATALACTACAO').asDateTime ;
     NLAnterior           := cds.FieldByName('NL').asInteger ;
   end;

  p.Free ;
  cds.Free ;

  if HasLactacaoAnterior then
   begin
     if ( MessageDlg ( Format ( 'A lactação sera excluída e as pesagens'#13#10
                 +'serão tranferidas para a lactação %d ( %s )'#13#10'Deseja continuar ?', [ NLAnterior, formatDateTime ( 'dd.mm.yyyy', DataLactacaoAnterior )  ] ), mtConfirmation ) <> mrYes ) then
      begin
        Result := False;
      end;
   end
  else
   begin
     if ( MessageDlg ( 'A lactação e as pesagens serão excluídas'#13#10'deseja continuar ?', mtConfirmation ) <> mrYes ) then
      begin
        Result := False;
      end;
   end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckLactacaoNaoSeca;
const
  _LACTACAO_NAO_SECA = 'SELECT DATALACTACAO, NL'
      +#13#10'FROM ZOO_LACTACOES'
      +#13#10'WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
      +#13#10' AND KZOO_EVENTO_ZOOTECNICO is distinct from  :KZOO_EVENTO_ZOOTECNICO'
      +#13#10' AND DATA_SECAGEM is  null'
      +#13#10' AND DATALACTACAO < :DATA_EVENTO' ;
var
  ErrMsg : string ;
  cds : TClientDataSet ;
  p : TParams ;

  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;

begin
  ErrMsg := '' ;

  if ( cdsEventosReprodutivosABORTOPARTO.asInteger = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO ) or
     ( cdsEventosReprodutivosABORTOPARTO.asInteger = _ST_TIPO_PARTOABORTO_PARTO ) then
  begin
    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
    p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString ; ;
    p.CreateParam( ftString, 'DATA_EVENTO', ptInput ).asSQLTimeStamp      := DateTimeToSQLTimeStamp ( cdsEventosReprodutivosDATAABORTOPARTO.asDateTime ) ;
    cds := nil ;
    DBResources['ZOOTECNICO'].populateClientDataset ( cds, _LACTACAO_NAO_SECA, p ) ;
    if not cds.fieldByName ( 'DATALACTACAO' ).isNull then
      begin
        AddErr ( 'Existem lactações não secas para o animal - Data - NL' ) ;
        while not cds.eof  do
          begin
           AddErr ( format ( '%s - %d',
             [ formatDateTime ( 'dd.mm.yyyy', cds.fieldByName ( 'DATALACTACAO' ).asDateTime ),
               cds.fieldByName ( 'NL' ).asInteger ] ) ) ;
           cds.next ;
          end;
      end;
     p.free ;
     cds.free ;
  end ;

  if ErrMsg <> '' then
     raise Warning.Create( ErrMsg );

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckParto;
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsEventosReprodutivos, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).Value <> cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.Value )
           and ( FieldByName( 'TIPOEVENTO' ).asInteger         <> _ST_TIPO_EVENTO_ZOO_CIO )
           and ( FieldByName( 'DATAABORTOPARTO' ).AsDateTime    > 0 )
           and ( FieldByName( 'DATAABORTOPARTO' ).AsDateTime    = cdsEventosReprodutivosDATAEVENTO.AsDateTime ) then
             raise Warning.Create('Existe um parto com a mesma data do evento');
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;

constructor TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.Create(
  AOwner: TComponent);
const
  _SQL_PROTOCOLO_IATF = 'SELECT KZOO_PROTOCOLO, CODIGO FROM ZOO_PROTOCOLOS WHERE TIPOPROTOCOLO = :TIPOPROTOCOLO' ;
var
  p : TParams ;
  LstRacas : TStringList ;
begin
  inherited ;

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,         DiasPartoPrimipara,  DiasPartoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, DiasAbortoPrimipara, DiasAbortoMultipara ) ;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_RACA_ANIMAIS,       cdsTipoRacasAnimais ) ;

  p := TParams.Create ;
  p.CreateParam(ftInteger, 'TIPOPROTOCOLO', ptInput ).AsInteger :=  _ST_TIPO_PROTOCOLO_IATF ;
  DBResources['ZOOTECNICO'].PopulateClientDataSet( cdsProtocolosIATF, _SQL_PROTOCOLO_IATF, p ) ;
  p.DisposeOf ;

  FGrauDeSangue := TZoo_GrauDeSangue.Create ;

  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_COMPOSICAORACA,  cdsTipoComposicaoRaca  ) ;

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

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.DoGetCria;
begin
   if not Assigned ( FOnGetCria ) then
     RaiseException( nil, UnitName, ClassName,  'Evento OnGetCria não associado' ) ;

   FOnGetCria ( self ) ;
//   if not FOnGetCria ( self ) then
//      cdsPartosAbortosINCLUIRCRIA.asString := 'F' ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.dspEventosReprodutivosAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind ) ;
var
 LPrenhez, LTipoEvento: String;
begin

   if (UpdateKind= ukDelete) then
      exit ;

   if    ( SourceDS = sqlEventosReprodutivos ) then
     begin
         if   ( FDadosFemea.DataSet.FieldByName( 'DOADOR_RECEPTOR' ).asInteger = _ST_TIPO_DOADOR_RECEPTOR_DOADOR ) then
           begin
            if      ( not VarIsEmpty ( DeltaDS.FieldByName('DATAABORTOPARTO').NewValue ) )
               and  ( not VarIsNull  ( DeltaDS.FieldByName('DATAABORTOPARTO').NewValue ) ) then
                  TDeltaProc.ColetaEmbriaoBeforeUpdateRecord( DeltaDS );
           end
         else
          TDeltaProc.AbrirLactacao( DeltaDS );

          if (VarISNull(DeltaDS.FieldByName('PRENHEZ').NewValue)) or
             (VarIsEmpty(DeltaDS.FieldByName('PRENHEZ').NewValue)) then
             LPrenhez := 'NULL'
          else
             LPrenhez := QuotedStr(DeltaDS.FieldByName('PRENHEZ').NewValue);


          if (VarISNull(DeltaDS.FieldByName('TIPOEVENTO').NewValue)) or
             (VarIsEmpty(DeltaDS.FieldByName('TIPOEVENTO').NewValue)) then
             LTipoEvento := '-1'
          else
             LTipoEvento := DeltaDS.FieldByName('TIPOEVENTO').NewValue;

          // Atualiza o status de doadora e receptora do animal de acorodo com o tipo do evento
         DBResources['ZOOTECNICO'].ExecuteDirect(Format(' EXECUTE PROCEDURE ZOO_UPDATE_DOADORA_RECEPTORA %s, %s, %s' ,
                                    [ QuotedStr(DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA').OldValue)
                                    , LTipoEvento
                                    , LPrenhez]));
     end;

  if SourceDS = sqlLinhagem then
     if UpdateKind = ukInsert then
        TDeltaProc.InsertLinhagem ( DeltaDS ); //.DataSetField.DataSet.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).NewValue ) ;


end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.dspEventosReprodutivosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin

  if SourceDS = sqlLinhagem then
     Applied := UpdateKind = ukInsert ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.dspEventosReprodutivosGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  if DataSet = sqlEventosReprodutivos then
     TableName:= 'ZOO_EVENTOS_ZOOTECNICOS'
  else if DataSet = sqlLinhagem then
     TableName:= 'ZOO_ANIMAL_LINHAGEM'
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.FilterSexoCria(
  AGestacaoGemelar: Boolean);
begin
  exit;
  cdsSexoCria.Filtered := False;

  if AGestacaoGemelar  then
     cdsSexoCria.Filter := Format(' VALOR >= %d ',[ _ST_SEXO_CRIA_F_F ])
  else
     cdsSexoCria.Filter := Format(' VALOR <= %d ',[ _ST_SEXO_CRIA_M ]);

  cdsSexoCria.Filtered := True;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.ForceAborto ( AcdsEventosReprodutivos : TDataSet )  ;
begin
   AcdsEventosReprodutivos.FieldByName ( 'ABORTOPARTO' ).asInteger := _ST_TIPO_PARTOABORTO_ABORTO ;
end;

class procedure TDeltaProc.GetPaiMae(
  AKZOO_EVENTO_ZOOTECNICO: string; out AKZooPai, ABrincoPai, ANomePai,
  AGrauSanguePai, AComposicaoPai, AKZooMae, ABrincoMae, ANomeMae,
  AGrauSangueMae, AComposicaoMae : string ; out AOrginadoEmbriao : boolean );

(*
  var
    cds : TClientDataSet ;
    p : TParams ;
  const
    _SELECT_PAI_MAE =
           'E.TIPOEVENTO,'
    // MAE
    +#13#10'E.KZOO_ANIMAL_FEMEA KZOO_MAE,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AF.NOMECOMPLETO ), '''' ), AF.NOMEESTABULO ), AF.BRINCO ) NOME_MAE,'
    // PAI
    +#13#10'COALESCE ( E.KZOO_ANIMAL_MACHO_TOUROSEMEN, E. KZOO_ANIMAL_MACHO_EMBRIAO ) KZOO_PAI,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AM.NOMECOMPLETO ), '''' ), AM.NOMEESTABULO  ), AM.BRINCO ) NOME_PAI,'
    // PAI EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_MACHO KZOO_PAIEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEM.NOMECOMPLETO ), '''' ), AEM.NOMEESTABULO ), AEM.BRINCO ), AE.NOMEPAI ) NOME_PAIEMBRIAO,'
    // MAE EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_FEMEA KZOO_MAEEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEF.NOMECOMPLETO ), '''' ), AEF.NOMEESTABULO ), AEF.BRINCO ), AE.NOMEMAE ) NOME_MAEEMBRIAO'
    // FROM EVENTOS
    +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS E'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AM ON AM.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_TOUROSEMEN'
    +#13#10'LEFT JOIN ZOO_ANIMAL_LINHAGEM AE ON AE.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_EMBRIAO'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEF ON AEF.KZOO_ANIMAL = AE.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_ANIMAIS AEM ON AEM.KZOO_ANIMAL = AE.KZOO_ANIMAL_MACHO'
    +#13#10'WHERE E.KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO' ;
*)
  var
    cds : TClientDataSet ;
    p : TParams ;
    SequenciaEmbriao : integer ;
  const
    _SELECT_PAI_MAE =
           'E.TIPOEVENTO,'
    // MAE
    +#13#10'E.KZOO_ANIMAL_FEMEA KZOO_MAE,'
    +#13#10'AF.BRINCO BRINCO_MAE,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AF.NOMECOMPLETO ), '''' ), AF.NOMEESTABULO ), AF.BRINCO ) NOME_MAE,'
    +#13#10'AF.GRAUSANGUE GRAUSANGUE_MAE,'
    +#13#10'AF.COMPOSICAORACA COMPOSICAORACA_MAE,'
    // PAI
    +#13#10'COALESCE ( E.KZOO_ANIMAL_MACHO_TOUROSEMEN, E. KZOO_ANIMAL_MACHO_EMBRIAO ) KZOO_PAI,'
    +#13#10'AM.BRINCO BRINCO_PAI,'
    +#13#10'COALESCE ( COALESCE ( NULLIF ( TRIM ( AM.NOMECOMPLETO ), '''' ), AM.NOMEESTABULO  ), AM.BRINCO ) NOME_PAI,'
    +#13#10'AM.GRAUSANGUE GRAUSANGUE_PAI,'
    +#13#10'AM.COMPOSICAORACA COMPOSICAORACA_PAI,'
    // PAI EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_MACHO KZOO_PAIEMBRIAO,'
    +#13#10'AEM.BRINCO BRINCO_PAIEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEM.NOMECOMPLETO ), '''' ), AEM.NOMEESTABULO ), AEM.BRINCO ), AE.NOMEPAI ) NOME_PAIEMBRIAO,'
    +#13#10'AEM.GRAUSANGUE GRAUSANGUE_PAIEMBRIAO,'
    +#13#10'AEM.COMPOSICAORACA COMPOSICAORACA_PAIEMBRIAO,'
    // MAE EMBRIAO
    +#13#10'AE.KZOO_ANIMAL_FEMEA KZOO_MAEEMBRIAO,'
    +#13#10'AEF.BRINCO BRINCO_MAEEMBRIAO,'
    +#13#10'COALESCE ( COALESCE ( COALESCE ( NULLIF ( TRIM ( AEF.NOMECOMPLETO ), '''' ), AEF.NOMEESTABULO ), AEF.BRINCO ), AE.NOMEMAE ) NOME_MAEEMBRIAO,'
    +#13#10'AEF.GRAUSANGUE GRAUSANGUE_MAEEMBRIAO,'
    +#13#10'AEF.COMPOSICAORACA COMPOSICAORACA_MAEEMBRIAO'
    // FROM EVENTOS
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
    AGrauSangueMae  := '';
    AComposicaoMae  := '' ;
    AGrauSanguePai  := '';
    AComposicaoPai  := '' ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := AKZOO_EVENTO_ZOOTECNICO ;

    TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_PAI_MAE, p ) ;

    if cds.FieldByName( 'TIPOEVENTO' ).AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE then
      begin
        AOrginadoEmbriao := True ;
        AKZooPai        := Trim ( cds.FieldByName( 'KZOO_PAIEMBRIAO'            ).AsString ) ;
        ABrincoPai      := Trim ( cds.FieldByName( 'BRINCO_PAIEMBRIAO'          ).AsString ) ;
        ANomePai        := Trim ( cds.FieldByName( 'NOME_PAIEMBRIAO'            ).AsString ) ;
        AGrauSanguePai  := Trim ( cds.FieldByName( 'GRAUSANGUE_PAIEMBRIAO'      ).AsString ) ;
        AComposicaoPai  := Trim ( cds.FieldByName( 'COMPOSICAORACA_PAIEMBRIAO'  ).AsString ) ;
        AKZooMae        := Trim ( cds.FieldByName( 'KZOO_MAEEMBRIAO'            ).AsString ) ;
        ABrincoMae      := Trim ( cds.FieldByName( 'BRINCO_MAEEMBRIAO'          ).AsString ) ;
        ANomeMae        := Trim ( cds.FieldByName( 'NOME_MAEEMBRIAO'            ).AsString ) ;
        AGrauSangueMae  := Trim ( cds.FieldByName( 'GRAUSANGUE_MAEEMBRIAO'      ).AsString ) ;
        AComposicaoMae  := Trim ( cds.FieldByName( 'COMPOSICAORACA_MAEEMBRIAO'  ).AsString ) ;
      end
    else
      begin
        AOrginadoEmbriao := False ;
        AKZooPai        := Trim ( cds.FieldByName( 'KZOO_PAI'           ).AsString ) ;
        ABrincoPai      := Trim ( cds.FieldByName( 'BRINCO_PAI'         ).AsString ) ;
        ANomePai        := Trim ( cds.FieldByName( 'NOME_PAI'           ).AsString ) ;
        AGrauSanguePai  := Trim ( cds.FieldByName( 'GRAUSANGUE_PAI'     ).AsString ) ;
        AComposicaoPai  := Trim ( cds.FieldByName( 'COMPOSICAORACA_PAI' ).AsString ) ;
        AKZooMae        := Trim ( cds.FieldByName( 'KZOO_MAE'           ).AsString ) ;
        ABrincoMae      := Trim ( cds.FieldByName( 'BRINCO_MAE'         ).AsString ) ;
        ANomeMae        := Trim ( cds.FieldByName( 'NOME_MAE'           ).AsString ) ;
        AGrauSangueMae  := Trim ( cds.FieldByName( 'GRAUSANGUE_MAE'     ).AsString ) ;
        AComposicaoMae  := Trim ( cds.FieldByName( 'COMPOSICAORACA_MAE' ).AsString ) ;
      end ;

    cds.Free ;
    p.free ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.OpenTables;
begin
   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_EVENTO_ZOO,   cdsTipoEvento   );
   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_MUCO,         cdsTipoMuco     );

   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_PARTOABORTO,  cdsTipoPartoAborto   ); // utilizado para descricao

   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_GESTACAO,   cdsStatusGestacao   ); // utilizado para Popup ...

   DBResources['ZOOTECNICO'].GetSystemTypes( _ST_SIGLA_STATUS_FEMEA, cdsStatusAnimal );
   DBResources['ZOOTECNICO'].GetSystemTypes( _ST_RACA_ANIMAIS,       cdsTipoRacasAnimais ) ;
   DBResources['ZOOTECNICO'].GetSystemTypes( _ST_STATUS_PRENHEZ,     cdsStatusPrenhez ) ;

   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_GEMELAR,   cdsStatusGemelar   ); // utilizado para Popup ...
   DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_SEXO_CRIA,   cdsSexoCria   ); // utilizado para Popup ...


   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;

   TCDSSuppl.SetMasterSource(cdsEventosReprodutivos, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsEventosReprodutivos )  ;
//   TCDSSuppl.Open ( cdsLinhagem )  ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetComposicaoRacas;
begin
   if not ( cdsLinhagem.State in [dsInsert, dsEdit] ) then
     cdsLinhagem.Edit ;

   cdsLinhagemCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetDadosFemea(
  const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetFuncionario(
  AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
      cdsEventosReprodutivos.Edit ;
   cdsEventosReprodutivosNOMEFUNCIONARIO.Text      := ANomeFuncionario ;
   cdsEventosReprodutivosKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetMacho(AKMacho,
  ANomeMacho: string; ATipoMacho : TTipoMacho );
begin
   if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
      cdsEventosReprodutivos.Edit ;
   cdsEventosReprodutivosNOMEMACHO.Text  := ANomeMacho ;
   cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString := AKMacho ;
   cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( ATipoMacho ) + 1 ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetOnGetCria(
  const Value: TGetCria);
begin
  FOnGetCria := Value;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsLinhagemCOMPOSICAORACA.asString ;
end;

function TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.ValidaSexoCria : Boolean;
begin
  Result:= True;
  if (cdsEventosReprodutivosPRENHEZ.IsNull) or (cdsEventosReprodutivosPRENHEZ.AsString = '') or
     (cdsEventosReprodutivosPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE)  then
   begin
     cdsEventosReprodutivosGEMELAR.Clear;
     cdsEventosReprodutivosSEXO_CRIA.Clear;
   end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosDatamodule._DataModuleCreate(Sender: TObject);
begin
  inherited;
//***
end;



class procedure TDeltaProc.ColetaEmbriaoBeforeUpdateRecord(
  DSEventos : TCustomClientDataSet );

var
   FGrauDeSangue : TZoo_GrauDeSangue ;
   BrincoEmbriao, NomeEmbriao, CodigoEmbriao,
   tmpAKZooPai, tmpABrincoPai, tmpANomePai, tmpGrauSanguePai, tmpComposicaoPai,
   tmpAKZooMae, tmpABrincoMae, tmpANomeMae, tmpGrauSangueMae, tmpComposicaoMae : string ;
   tmpAOriginadoEmbriao : boolean ;

  procedure GetNomeEmbriao ;

    const
    _SELECT_COUNT_LINHAGEM =
           'COUNT(*) RESULT FROM ZOO_ANIMAL_LINHAGEM L'
    +#13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'LEFT JOIN SYS$TYPES_GETVALUE( ''TIPO_PARTOABORTO'', ''COLETA'' ) T ON 1=1'
    +#13#10'WHERE L.KZOO_ANIMAL_MACHO  = :KZOO_ANIMAL_MACHO'
    +#13#10'  AND L.KZOO_ANIMAL_FEMEA  = :KZOO_ANIMAL_FEMEA'
    +#13#10'  AND E.ABORTOPARTO =  T.SYS$VALUE' ;

    _SELECT_GENERATOR_BRINCO_EMBRIAO =
           'SELECT GEN_ID(BRINCO_EMBRIAO, 1) RESULT FROM RDB$DATABASE';

    _SELECT_CHECA_NOME =
      '1 RESULT'
    +#13#10'FROM ZOO_ANIMAIS_EMBRIAO E'
    +#13#10'INNER JOIN ZOO_ANIMAIS A ON  A.KZOO_ANIMAL = E.KZOO_ANIMAL_EMBRIAO '
    +#13#10'WHERE A.NOMECOMPLETO = :NOMECOMPLETO'
    +#13#10'ROWS 1';

    var
     p : TParams ;
     cds : TClientDataSet ;
     SequenciaBrincoEmbriao,
     SequenciaEmbriao : integer ;

    function CheckEmbriaoExists : boolean ;
    begin
      BrincoEmbriao :=  Format ( 'E_%d', [ SequenciaBrincoEmbriao{SequenciaEmbriao} ] ) ;
      CodigoEmbriao :=  Format ( '%s_%s_%d', [ tmpABrincoPai, tmpABrincoMae, SequenciaEmbriao ] ) ;
      NomeEmbriao   :=  Format ( '%s_%s_%d', [ tmpANomePai,   tmpANomeMae,   SequenciaEmbriao ] ) ;
      p.Clear  ;
      p.CreateParam( ftString, 'NOMECOMPLETO', ptInput ).asString := NomeEmbriao ;
      FreeAndNil ( cds ) ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_CHECA_NOME, p ) ;
      Result := cds.FieldByName('RESULT').asInteger = 1 ;
    end;

  begin

    cds := nil ;

    TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_GENERATOR_BRINCO_EMBRIAO );
    SequenciaBrincoEmbriao := cds.fieldByName  ( 'RESULT' ).asInteger ;
    FreeAndNil ( cds ) ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_ANIMAL_MACHO', ptInput ).asString := tmpAKZooPai ;
    p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := tmpAKZooMae ;
    TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SELECT_COUNT_LINHAGEM, p ) ;
    SequenciaEmbriao := cds.fieldByName  ( 'RESULT' ).asInteger + 1 ;

    FreeAndNil ( cds ) ;
    while CheckEmbriaoExists  do Inc ( SequenciaEmbriao ) ;

    p.free ;

  end;

  procedure InsertEmbriao ;
  var
     sql : TSQLQuery ;
     x : integer ;
     Field : TField ;
     KZOO_EVENTO, KZOO_ANIMAL : string ; // chave para o embriao
  const

     _INCLUIR_ANINAL =
            'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DATASTATUS, DTORIGEM, GRAUSANGUE, COMPOSICAORACA, KZOO_EVENTO_ZOOTECNICO, KCAD_FAZENDA )'
     +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DATASTATUS, :DTORIGEM, :GRAUSANGUE, :COMPOSICAORACA, :KZOO_EVENTO_ZOOTECNICO, :KCAD_FAZENDA )' ;

    _INCLUI_EMBRIAO = 'INSERT INTO ZOO_ANIMAIS_EMBRIAO ( KZOO_ANIMAL_EMBRIAO, CODIGO_EMBRIAO, QTDEINICIAL_EMBRIAO, QTDE_EMBRIAO  ) VALUES ( :KZOO_ANIMAL, :CODIGO_EMBRIAO, :QTDEINICIAL_EMBRIAO, :QTDE_EMBRIAO )' ;

    _INSERT_LINHAGEM =  'INSERT INTO ZOO_ANIMAL_LINHAGEM'
      +#13#10'( KZOO_ANIMAL_LINHAGEM, KZOO_ANIMAL, BRINCO, NOMEANIMAL, GRAUSANGUE, COMPOSICAORACA,'
      +#13#10'KZOO_ANIMAL_MACHO, NOMEPAI, GRAUSANGUEPAI, COMPOSICAORACAPAI, '
      +#13#10'KZOO_ANIMAL_FEMEA, NOMEMAE, GRAUSANGUEMAE, COMPOSICAORACAMAE, '
      +#13#10'NASCIMENTO, KZOO_EVENTO_ZOOTECNICO )'
      +#13#10'VALUES( '
      +#13#10'Guid20(), :KZOO_ANIMAL, :BRINCO, :NOMEEMBRIAO, :GRAUSANGUE, :COMPOSICAORACA,'
      +#13#10':KZOO_ANIMAL_MACHO, :NOMEPAI, :GRAUSANGUEPAI, :COMPOSICAORACAPAI,'
      +#13#10':KZOO_ANIMAL_FEMEA, :NOMEMAE, :GRAUSANGUEMAE, :COMPOSICAORACAMAE,'
      +#13#10':NASCIMENTO, :KZOO_EVENTO_ZOOTECNICO )' ;

  begin
    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try

        KZOO_EVENTO := DSEventos.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;

        GetPaiMae ( KZOO_EVENTO,
                    tmpAKZooPai, tmpABrincoPai, tmpANomePai, tmpGrauSanguePai, tmpComposicaoPai,
                    tmpAKZooMae, tmpABrincoMae, tmpANomeMae, tmpGrauSangueMae, tmpComposicaoMae,
                    tmpAOriginadoEmbriao ) ;

        GetNomeEmbriao ;

        SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;

        KZOO_ANIMAL   := GuidSuppl.GuidStr20 ;

        CommandText   := _INCLUIR_ANINAL ;

        ParamByName ( 'KZOO_ANIMAL'   ).AsString       := KZOO_ANIMAL   ;
        ParamByName ( 'BRINCO'        ).AsString       := BrincoEmbriao ;
        ParamByName ( 'NOMEESTABULO'  ).AsString       := NomeEmbriao   ;
        ParamByName ( 'NOMECOMPLETO'  ).AsString       := NomeEmbriao   ;

        //ParamByName ( 'RACA' ).asString := // falta
        ParamByName ( 'RACA' ).DataType := ftString ;
        ParamByName ( 'RACA' ).Bound := False ;

        ParamByName ( 'STATUS'        ).asInteger      := _ST_SIGLA_STATUS_ANIMAL_EMBRIAO ;
        ParamByName ( 'DATASTATUS'    ).AsSQLTimeStamp := DSEventos.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;
        ParamByName ( 'DTORIGEM'      ).asSQLTimeStamp := DSEventos.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;

        FGrauDeSangue := TZoo_GrauDeSangue.Create ;
        FGrauDeSangue.GrauSanguePai  := tmpGrauSanguePai ;
        FGrauDeSangue.RacaPai        := tmpComposicaoPai ;

        FGrauDeSangue.GrauSangueMae  := tmpGrauSangueMae ;
        FGrauDeSangue.RacaMae        := tmpComposicaoMae ;
        FGrauDeSangue.Calculate ;


        ParamByName ( 'GRAUSANGUE'  ).asString             := FGrauDeSangue.GrauSangue ;
        ParamByName ( 'COMPOSICAORACA'  ).asString         := FGrauDeSangue.Raca ;
        ParamByName ( 'KZOO_EVENTO_ZOOTECNICO'  ).asString := DSEventos.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;
        ParamByName ( 'KCAD_FAZENDA'  ).AsString           := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;

        //FGrauDeSangue.Free ;

        ExecSQL ;

        CommandText := _INCLUI_EMBRIAO ;
        ParamByName ( 'KZOO_ANIMAL' ).AsString    := KZOO_ANIMAL ;
        ParamByName ( 'CODIGO_EMBRIAO' ).AsString := CodigoEmbriao ;
        ParamByName ( 'QTDEINICIAL_EMBRIAO'  ).asInteger := DSEventos.FieldByName ( 'EMBRIOESCOLETADOS' ).asInteger ;
        ParamByName ( 'QTDE_EMBRIAO'  ).asInteger := DSEventos.FieldByName ( 'EMBRIOESCOLETADOS' ).asInteger ;
        ExecSQL ;

        CommandText := _INSERT_LINHAGEM ;

        Params.ParamByName( 'KZOO_ANIMAL'      ).asString     := KZOO_ANIMAL ;
        Params.ParamByName( 'BRINCO'           ).AsString     := BrincoEmbriao ;
        Params.ParamByName( 'NOMEEMBRIAO'      ).asString     := NomeEmbriao  ;
        Params.ParamByName( 'GRAUSANGUE'       ).asString     := FGrauDeSangue.GrauSangue ;
        Params.ParamByName( 'COMPOSICAORACA'   ).asString     := FGrauDeSangue.Raca ;
        Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).Bound  := False ;
        Params.ParamByName( 'NOMEPAI'           ).Bound  := False ;
        Params.ParamByName( 'GRAUSANGUEPAI'     ).asString := tmpGrauSanguePai ;
        Params.ParamByName( 'COMPOSICAORACAPAI' ).asString := tmpComposicaoPai ;

        Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).Bound  := False ;
        Params.ParamByName( 'NOMEMAE'           ).Bound  := False ;
        Params.ParamByName( 'GRAUSANGUEMAE'     ).asString := tmpGrauSangueMae ;
        Params.ParamByName( 'COMPOSICAORACAMAE' ).asString := tmpComposicaoMae  ;

        if ( tmpAKZooPai <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_MACHO' ).asString    := tmpAKZooPai ;

        if ( tmpANomePai <> '' ) then
            Params.ParamByName( 'NOMEPAI' ).asString    := tmpANomePai ;

        if ( tmpAKZooMae <> '' ) then
            Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).asString    := tmpAKZooMae ;

        if ( tmpANomeMae <> '' ) then
            Params.ParamByName( 'NOMEMAE' ).asString    := tmpANomeMae ;

        Params.ParamByName( 'NASCIMENTO'  ).AsSQLTimeStamp := DSEventos.FieldByName ( 'DATAABORTOPARTO' ).AsSQLTimeStamp ;

        Params.ParamByName( 'KZOO_EVENTO_ZOOTECNICO'  ).asString := KZOO_EVENTO ;

        ExecSQL  ;

        FGrauDeSangue.Free ;
      finally
        free ;
      end;

  end;

begin

  InsertEmbriao;

  DiagnosticosAnimalClass.TEventosAnimal.AddColeta( DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).OldValue, DSEventos.FieldByName ( 'DATAABORTOPARTO' ).asDateTime ) ;

end;


class procedure TDeltaProc.AbrirLactacao( DSEventos : TCustomClientDataSet );
const
 _INSERT_LACTACAO = 'INSERT INTO ZOO_LACTACOES ( KZOO_LACTACAO, KZOO_EVENTO_ZOOTECNICO, KZOO_ANIMAL_FEMEA, KCAD_FAZENDA )'
              +#13#10'VALUES ( :KZOO_LACTACAO, :KZOO_EVENTO_ZOOTECNICO, :KZOO_ANIMAL_FEMEA, :KCAD_FAZENDA )' ;

 _DELETE_LACTACAO = 'DELETE FROM ZOO_LACTACOES WHERE KZOO_LACTACAO = :KZOO_LACTACAO';
var
  p : TParams ;
begin


  if ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger in [ _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO, _ST_TIPO_PARTOABORTO_PARTO ] )
  and ( VarIsNull ( DSEventos.FieldByName ( 'KZOO_LACTACAO' ).OldValue ) ) then
    begin

      if not VarIsNull ( DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue )
      and ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )then
        TAnimalFemea.SecarUltimaLactacaoPorAborto( DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).OldValue,
                                                   DSEventos.FieldByName ( 'DATAABORTOPARTO' ).asDateTime -1 ) ;


      DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).NewValue := GuidSuppl.GuidStr20 ;

      p := TParams.Create ;
      p.CreateParam ( ftString, 'KZOO_LACTACAO',          ptInput ).asString := DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).NewValue ;

      if VarIsNull ( DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ) then
       begin
        p.CreateParam ( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString ;
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',      ptInput ).asString := DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).asString ;
       end
      else
       begin
        p.CreateParam ( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',      ptInput ).asString := DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).OldValue ;
       end;

      p.CreateParam ( ftString, 'KCAD_FAZENDA',           ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute( _INSERT_LACTACAO, p ) ;
      p.free ;

    end
   else
    if ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger = _ST_TIPO_PARTOABORTO_ABORTO  )
       and ( not VarIsNull ( DSEventos.FieldByName ( 'KZOO_LACTACAO' ).OldValue ) ) then
    begin
      p := TParams.Create ;
      p.CreateParam ( ftString, 'KZOO_LACTACAO',          ptInput ).asString := DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).OldValue ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute( _DELETE_LACTACAO, p ) ;
      p.free ;
    end;
end;


class procedure TDeltaProc.InsertLinhagem ( DSLinhagem : TCustomClientDataSet );
var
  tmpAOriginadoEmbriao : boolean ;

  procedure AplicarProtocoloCria ;
  begin
//     if ( DSLinhagem.FieldByName ( 'SEXO' ).asString = 'M' ) or ( not DSEventos.FieldByName ( 'AplicarProtocolo ) then
//        exit ;
//     DiagnosticosAnimalClass.TEventosAnimal.AddPartoCria( DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString, DSEventos.FieldByName ( DATAABORTOPARTO' ).asDateTime );
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
    sql.SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;
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
    if   ( DSLinhagem.FieldByName ( 'PESO' ).AsInteger <= 0 )
    and  ( DSLinhagem.FieldByName ( 'ALTURA' ).AsInteger <= 0 ) then
       exit ;


    sql := TSQLQuery.Create ( nil ) ;
    with sql do
      try
        SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;
        CommandText := _INSERT_CRESCIMENTO ;
        KCrescimento := GuidStr20;
        ParamByName ( 'KZOO_ANIMAL_CRESCIMENTO' ).AsString := KCrescimento;
        ParamByName ( 'KZOO_ANIMAL' ).AsString          := DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString ;

        ParamByName ( 'DATA' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;

        ParamByName ( 'PESO' ).DataType := ftInteger ;
        ParamByName ( 'PESO' ).Bound    := False;
        if DSLinhagem.FieldByName ( 'PESO' ).AsInteger > 0 then
           ParamByName ( 'PESO' ).asInteger := DSLinhagem.FieldByName ( 'PESO' ).AsInteger;

        ParamByName ( 'ALTURA' ).DataType := ftInteger ;
        ParamByName ( 'ALTURA' ).Bound    := False;
        if DSLinhagem.FieldByName ( 'ALTURA' ).AsInteger > 0 then
           ParamByName ( 'ALTURA' ).asInteger := DSLinhagem.FieldByName ( 'ALTURA' ).AsInteger;

        ExecSQL ;

        SetAnimalCrescimentoNascimento( DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString,
                                        KCrescimento,
                                        DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue);
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
        SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;
        CommandText := _UPDATE_LINHAGEM ;
        ParamByName ( 'KZOO_ANIMAL' ).AsString := DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString ;
        ParamByName ( 'KZOO_ANIMAL_LINHAGEM' ).AsString := DSLinhagem.FieldByName ( 'KZOO_ANIMAL_LINHAGEM' ).asString ;
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
        SQLConnection := TSQLConnection ( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;

        if ( DSLinhagem.FieldByName ( 'SEXO' ).asString = 'M' ) then
           CommandText := _INCLUI_MACHO
        else
           CommandText := _INCLUI_FEMEA ;

        ParamByName ( 'KZOO_ANIMAL' ).AsString       := DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString ;
        ParamByName ( 'NASCIMENTO'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;
        ParamByName ( 'RETIRO'      ).DataType       := ftString ;
        ParamByName ( 'RETIRO'      ).Bound          := False ;
        if not DSLinhagem.FieldByName ( 'RETIRO_CRIA' ).isNull then
         begin
           ParamByName ( 'RETIRO'      ).AsString       := DSLinhagem.FieldByName ( 'RETIRO_CRIA' ).asString ;
         end;

        if ( DSLinhagem.FieldByName ( 'SEXO' ).asString = 'F' ) then
          begin
            ParamByName ( 'LOTE'      ).DataType := ftString ;
            ParamByName ( 'LOTE'      ).Bound := False ;
            ParamByName ( 'DATALOTE'  ).DataType := ftTimeStamp ;
            ParamByName ( 'DATALOTE'  ).Bound := False ;

            ParamByName ( 'DATARETIRO'  ).DataType := ftTimeStamp ;
            ParamByName ( 'DATARETIRO'  ).Bound := False ;

            if not DSLinhagem.FieldByName ( 'LOTE' ).isNull then
              begin
               ParamByName ( 'LOTE'  ).AsString           := DSLinhagem.FieldByName ( 'LOTE' ).asString ;
               ParamByName ( 'DATALOTE'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;
              end;

            if not DSLinhagem.FieldByName ( 'RETIRO_CRIA' ).isNull then
              begin
               ParamByName ( 'DATARETIRO'  ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;
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
        SQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;
        CommandText := _INCLUIR_ANINAL ;

        ParamByName ( 'KZOO_ANIMAL'    ).AsString          := DSLinhagem.FieldByName ( 'KZOO_ANIMAL' ).asString   ;
        ParamByName ( 'BRINCO'         ).AsString          := DSLinhagem.FieldByName ( 'BRINCO' ).asString        ;
        ParamByName ( 'NOMEESTABULO'   ).AsString          := DSLinhagem.FieldByName ( 'NOMEESTABULO' ).asString  ;
        ParamByName ( 'NOMECOMPLETO'   ).AsString          := DSLinhagem.FieldByName ( 'NOMECOMPLETO' ).asString  ;
        ParamByName ( 'RACA'           ).asInteger         := DSLinhagem.FieldByName ( 'RACA' ).asInteger         ;
        ParamByName ( 'STATUS'         ).asInteger         := _ST_SIGLA_STATUS_ANIMAL_BEZERRO                  ;
        ParamByName ( 'DATASTATUS'     ).AsSQLTimeStamp    := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;
        ParamByName ( 'DTORIGEM'       ).asSQLTimeStamp    := DateTimeToSQLTimeStamp ( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;
        ParamByName ( 'GRAUSANGUE'     ).AsString          := DSLinhagem.FieldByName ( 'GRAUSANGUE' ).asString  ;
        ParamByName ( 'COMPOSICAORACA' ).AsString          := DSLinhagem.FieldByName ( 'COMPOSICAORACA' ).asString  ;
        if tmpAOriginadoEmbriao then
           ParamByName ( 'ORIGINADO_DE_EMBRIAO' ).AsString    := 'T'
        else
           ParamByName ( 'ORIGINADO_DE_EMBRIAO' ).AsString    := 'F' ;
        ParamByName ( 'KZOO_EVENTO_ZOOTECNICO' ).AsString  := DSLinhagem.FieldByName  ( 'KZOO_EVENTO_ZOOTECNICO' ).asString ;
        ParamByName ( 'KCAD_FAZENDA'   ).AsString          := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
        ExecSQL ;
      finally
        sql.free ;
      end ;
     IncluiMachoFemea ;
     UpdateLinhagemAnimal ;
     UpdateCrescimento ;
     AplicarProtocoloCria ;
  end ;

  procedure InsertLinhagem ;
  var
     sql : TSQLQuery ;
     x : integer ;
     Field : TField ;
     tmpAKZooPai, tmpABrincoPai, tmpANomePai, tmpGrauSanguePai, tmpComposicaoPai,
     tmpAKZooMae, tmpABrincoMae, tmpANomeMae, tmpGrauSangueMae, tmpComposicaoMae : string ;

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
    +#13#10':KZOO_ANIMAL_LINHAGEM,'                //     Guid20()
    +#13#10':NATIMORTO,'                           //     KZOO_ANIMAL
    +#13#10':BRINCO,'                              //     BRINCO
    +#13#10':NOMEESTABULO,'                        //     NOMEEMBRIAO
    +#13#10':KZOO_ANIMAL_MACHO,'                   //     GRAUSANGUE
    +#13#10':NOMEPAI,'                             //     COMPOSICAORACA
    +#13#10':REGISTROPAI,'                         //     KZOO_ANIMAL_MACHO
    +#13#10':KZOO_ANIMAL_FEMEA,'                   //     NOMEPAI
    +#13#10':NOMEMAE,'                             //     GRAUSANGUEPAI
    +#13#10':REGISTROMAE,'                         //     COMPOSICAORACAPAI
    +#13#10':KZOO_EVENTO_ZOOTECNICO,'              //     KZOO_ANIMAL_FEMEA
    +#13#10':KZOO_LACTACAO,'                       //     NOMEMAE
    +#13#10':RACA,'                                //     GRAUSANGUEMAE
    +#13#10':GRAUSANGUE,'                          //     COMPOSICAORACAMAE,
    +#13#10':COMPOSICAORACA,'                      //     NASCIMENTO
    +#13#10':GRAUSANGUEPAI,'                       //     KZOO_EVENTO_ZOOTECNICO
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
        SQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Connection ) ;
        CommandText := _INSERT_LINHAGEM ;

        for x := 0 to Params.Count -1 do
         begin
           Field := DSLinhagem.FindField( Params[x].Name );
           if Assigned ( Field )  then
             begin
               Params[x].DataType := DSLinhagem.FieldByName( Params[x].Name ).DataType ;
               Params[x].Bound := False ;
               if not DSLinhagem.FieldByName( Params[x].Name ).IsNull then
                  Params[x].Value := DSLinhagem.FieldByName( Params[x].Name ).Value ;
             end;
         end;

         Params.ParamByName( 'NASCIMENTO' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( DSLinhagem.FieldByName ( 'NASCIMENTO' ).NewValue ) ;

         Params.ParamByName( 'KZOO_EVENTO_ZOOTECNICO' ).asString := DSLinhagem.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString ;

         Params.ParamByName( 'KZOO_LACTACAO' ).DataType    := ftString ;
         Params.ParamByName( 'KZOO_LACTACAO' ).Bound       := False ;

//         if DSEventos.FieldByName ( 'AbrirLactacao then
//            Params.ParamByName( 'KZOO_LACTACAO' ).asString := DSEventos.FieldByName ( 'KeyLactacao ;


         GetPaiMae ( DSLinhagem.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString,
                    tmpAKZooPai, tmpABrincoPai, tmpANomePai, tmpGrauSanguePai, tmpComposicaoPai,
                    tmpAKZooMae, tmpABrincoMae, tmpANomeMae, tmpGrauSangueMae, tmpComposicaoMae,
                    tmpAOriginadoEmbriao
                   ) ;

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
    if not ( DSLinhagem.FieldByName ( 'NATIMORTO' ).asBoolean ) then
       IncluiAnimal ;
  end;

var
  p : TParams ;
begin
  InsertLinhagem ;
end;


end.
