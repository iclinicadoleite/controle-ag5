unit UZoo_ReproducaoDiagnosticosGestacaoDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UdtmSYS_BASE, Tc.DBRTL.AbstractDB, Tc.VCL.Form, GuidSuppl, Tc.VCL.Application, Dialogs,
  Tc.VCL.Dialogs;

type
  TZoo_ReproducaoDiagnosticosGestacaoDatamodule = class(T_dtmBASE)
    cdsDiagGestacao: TClientDataSet;
    dspDiagGestacao: TDataSetProvider;
    sqlDiagGestacao: TTcSQLDataSet;
    sqlDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField;
    cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField;
    sqlDiagGestacaoBRINCOFEMEA: TStringField;
    sqlDiagGestacaoNOMEFEMEA: TStringField;
    sqlDiagGestacaoNOMEMACHO: TStringField;
    sqlDiagGestacaoPRENHEZ: TStringField;
    sqlDiagGestacaoREEXAMINAR: TStringField;
    sqlDiagGestacaoDATATOQUE: TSQLTimeStampField;
    cdsDiagGestacaoBRINCOFEMEA: TStringField;
    cdsDiagGestacaoNOMEFEMEA: TStringField;
    cdsDiagGestacaoNOMEMACHO: TStringField;
    cdsDiagGestacaoPRENHEZ: TStringField;
    cdsDiagGestacaoREEXAMINAR: TStringField;
    sqlDiagGestacaoDATAEVENTO: TSQLTimeStampField;
    sqlDiagGestacaoTIPOEVENTO: TIntegerField;
    cdsDiagGestacaoTIPOEVENTO: TIntegerField;
    cdsDiagGestacaoDATAEVENTO: TSQLTimeStampField;
    cdsDiagGestacaoNOVOTOQUE: TSQLTimeStampField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsDiagGestacaoDESC_EVENTO: TStringField;
    cdsDiagGestacaoDATATOQUE: TSQLTimeStampField;
    sqlDiagGestacaoKCAD_VETERINARIO: TStringField;
    sqlDiagGestacaoNOMEVETERINARIO: TStringField;
    cdsDiagGestacaoKCAD_VETERINARIO: TStringField;
    cdsDiagGestacaoNOMEVETERINARIO: TStringField;
    sqlDiagGestacaoPROTOCOLO_TOQUE: TStringField;
    cdsDiagGestacaoPROTOCOLO_TOQUE: TStringField;
    cdsDiagGestacaoPREVISAOPARTO: TDateTimeField;
    sqlDiagGestacaoNUMERO_LACTACAO: TIntegerField;
    cdsDiagGestacaoNUMERO_LACTACAO: TIntegerField;
    sqlDiagGestacaoLOTETOQUE: TStringField;
    sqlDiagGestacaoLOTE: TStringField;
    cdsDiagGestacaoLOTETOQUE: TStringField;
    cdsDiagGestacaoLOTE: TStringField;
    sqlDiagGestacaoNOVOTOQUE: TSQLTimeStampField;
    cdsDiagGestacaoCOUNT_EXAMINADOS: TAggregateField;
    cdsDiagGestacaoBRINCOFEMEA_: TStringField;
    sqlDiagGestacaoBRINCOFEMEA_: TStringField;
    cdsSexoCria: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    cdsStatusGemelar: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    sqlDiagGestacaoGEMELAR: TStringField;
    sqlDiagGestacaoSEXO_CRIA: TIntegerField;
    cdsDiagGestacaoGEMELAR: TStringField;
    cdsDiagGestacaoSEXO_CRIA: TIntegerField;
    cdsDiagGestacaoDESC_GEMELAR: TStringField;
    cdsDiagGestacaoDESC_SEXO_CRIA: TStringField;
    sqlLotes: TTcSQLDataSet;
    dspLotes: TDataSetProvider;
    cdsLotes: TClientDataSet;
    sqlLotesLOTE: TStringField;
    sqlLotesFIELD_NULL: TIntegerField;
    sqlLotesSELECTED: TIntegerField;
    cdsLotesLOTE: TStringField;
    cdsLotesFIELD_NULL: TIntegerField;
    cdsLotesSELECTED: TIntegerField;
    sqlDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField;
    sqlDiagGestacaoULTIMO_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField;
    cdsDiagGestacaoULTIMO_DIAGNOSTICO: TStringField;
    cdsLotesTOTAL_SELECTED: TAggregateField;
    cdsLotesTOTAL_FIELD_NULL: TAggregateField;
    sqlDiagGestacaoNOVAPRENHEZ: TStringField;
    cdsDiagGestacaoNOVAPRENHEZ: TStringField;
    sqlDiagGestacaoABORTOPARTO: TIntegerField;
    sqlDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField;
    cdsDiagGestacaoABORTOPARTO: TIntegerField;
    cdsDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField;
    sqlDiagGestacaoKZOO_LACTACAO: TStringField;
    cdsDiagGestacaoKZOO_LACTACAO: TStringField;
    sqlDiagGestacaoPRENHEZ_ANTERIOR: TStringField;
    cdsDiagGestacaoPRENHEZ_ANTERIOR: TStringField;
    cdsStatusReprodutivo: TClientDataSet;
    cdsStatusReprodutivoSELECTED: TIntegerField;
    cdsStatusReprodutivoDESCRIPTION: TStringField;
    sqlDiagGestacaoDIAS_DA_COBERTURA: TIntegerField;
    sqlDiagGestacaoSTATUS_REPRODUTIVO: TStringField;
    cdsDiagGestacaoDIAS_DA_COBERTURA: TIntegerField;
    cdsDiagGestacaoSTATUS_REPRODUTIVO: TStringField;
    sqlDiagGestacaoKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    sqlDiagGestacaoKZOO_ANIMAL_PROTOCOLO: TStringField;
    cdsDiagGestacaoKZOO_ANIMAL_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoKZOO_ANIMAL_PROTOCOLO: TStringField;
    cdsProtocolosPadrao: TClientDataSet;
    cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField;
    cdsProtocolosPadraoCODIGO: TStringField;
    cdsProtocolosPadraoVINCULADO: TStringField;
    cdsDiagnosticosPadrao: TClientDataSet;
    cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosPadraoCODIGO: TStringField;
    cdsDiagnosticosPadraoNOME: TStringField;
    cdsDiagnosticosPadraoPOR_QUARTO: TStringField;
    cdsDiagnosticosDisponiveis: TClientDataSet;
    cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosDisponiveisCODIGO: TStringField;
    cdsDiagnosticosDisponiveisNOME: TStringField;
    cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField;
    cdsProtocolosDisponiveis: TClientDataSet;
    cdsProtocolosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField;
    cdsProtocolosDisponiveisCODIGO: TStringField;
    cdsProtocolosDisponiveisVINCULADO: TStringField;
    sqlDiagGestacaoKZOO_DIAGNOSTICO: TStringField;
    sqlDiagGestacaoKZOO_PROTOCOLO: TStringField;
    cdsDiagGestacaoKZOO_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoKZOO_PROTOCOLO: TStringField;
    cdsDiagGestacaoCODIGO_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoCODIGO_PROTOCOLO: TStringField;
    cdsStatusReprodutivoSTATUS_REPRODUTIVOS: TStringField;
    cdsDiagGestacaoCOUNT_DIAGNOSTICOS: TAggregateField;
    cdsDiagGestacaoCOUNT_PROTOCOLOS: TAggregateField;
    sqlDiagGestacaoCOD_STATUS_REPRODUTIVO: TIntegerField;
    cdsDiagGestacaoCOD_STATUS_REPRODUTIVO: TIntegerField;
    cdsProtocolosPadraoNOME: TStringField;
    cdsProtocolosDisponiveisNOME: TStringField;
    cdsDiagGestacaoNOME_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoNOME_PROTOCOLO: TStringField;
    sqlDiagGestacaoQTDE_COBERTURA: TIntegerField;
    cdsDiagGestacaoQTDE_COBERTURA: TIntegerField;
    sqlDiagGestacaoDOADOR_RECEPTOR: TIntegerField;
    cdsDiagGestacaoDOADOR_RECEPTOR: TIntegerField;
    procedure cdsDiagGestacaoNewRecord(DataSet: TDataSet);
    procedure cdsDiagGestacaoNOVOTOQUEValidate(Sender: TField);
    procedure cdsDiagGestacaoPRENHEZGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDiagGestacaoREEXAMINARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDiagGestacaoPRENHEZSetText(Sender: TField; const Text: string);
    procedure cdsDiagGestacaoBeforeInsert(DataSet: TDataSet);
    procedure cdsDiagGestacaoBeforeDelete(DataSet: TDataSet);
    procedure cdsDiagGestacaoNOMEVETERINARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsDiagGestacaoBeforePost(DataSet: TDataSet);
    procedure cdsDiagGestacaoPROTOCOLO_TOQUEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsDiagGestacaoBeforeEdit(DataSet: TDataSet);
    procedure cdsDiagGestacaoAfterCancel(DataSet: TDataSet);
    procedure dspDiagGestacaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspDiagGestacaoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure cdsDiagGestacaoPRENHEZValidate(Sender: TField);
    procedure cdsDiagGestacaoNOVAPRENHEZGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsDiagGestacaoNOVAPRENHEZSetText(Sender: TField;
      const Text: string);
    procedure dspDiagGestacaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure cdsDiagGestacaoSEXO_CRIAValidate(Sender: TField);
    procedure cdsProtocolosPadraoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsProtocolosDisponiveisFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsDiagGestacaoKZOO_DIAGNOSTICOValidate(Sender: TField);
    procedure cdsDiagGestacaoKZOO_PROTOCOLOValidate(Sender: TField);
    procedure cdsDiagGestacaoPRENHEZChange(Sender: TField);
    procedure cdsDiagGestacaoKZOO_DIAGNOSTICOChange(Sender: TField);
  private
    FSQLDiagnosticosOriginal: String;
    FSQLAddByKey : String;
    FCountDiagnosticos : integer  ;
    FOldCountDiagnosticos : integer ;
    FDataToque: TDateTime;
    FAplicarProtocolo : boolean ;
    FKVeterinario  : string ;
    FNomeVeterinario : string ;
    DiasPartoPrimipara : integer ;
    DiasPartoMultipara : integer ;
    DiasAbortoPrimipara : integer;
    DiasAbortoMultipara : integer;

    FDiasConfirmacaoPrimipara: integer  ;
    FDiasConfirmacaoMultipara: integer  ;
    FDiasReconfirmacaoPrimipara1: integer  ;
    FDiasReconfirmacaoMultipara1: integer  ;
    FDiasReconfirmacaoPrimipara2: integer  ;
    FDiasReconfirmacaoMultipara2: integer  ;

    FUltimoToque : TDateTime;
    FLoteNull: String;
    FPrenhezOld: String;

    FQuickInput: Boolean;

    FUseQuickSexoCria: Boolean;
    FUseQuickDiagnosticoSanitario: Boolean;
    FUseQuickProtocolo: Boolean;
    FUseQuickVeterinario: Boolean;

    FQuickDataToque: TDateTime;
    FQuickDiagnosticoGestacao: String;
    FQuickSexoCria: Integer;
    FQuickDiagnosticoSanitario: String;
    FQuickProtocolo: String;
    FQuickVeterinario: String;
    FQuickNomeVeterinario: String;

    procedure SetDataToque(const Value: TDateTime);
    function ValidaSexoCria: Boolean;
    function GetSqlDiagnostico: String;
    procedure SetSqlAddByKey;
    function GetLotes: String;
    procedure AbortoNovaPrenhezNegativa;
    procedure AbrirLactacao( DSEventos : TCustomClientDataSet );
    procedure LoadCdsStatusReprodutivo;
    function GetSelectedStatusReprodutivos: String;
    procedure SetQuickInput(const Value: Boolean);
    procedure SetUseQuickDiagnosticoSanitario(const Value: Boolean);
    procedure SetUseQuickProtocolo(const Value: Boolean);
    procedure SetUseQuickSexoCria(const Value: Boolean);
    procedure SetUseQuickVeterinario(const Value: Boolean);
    procedure AddByQuickInput();
    procedure SetQuickDataToque(const Value: TDateTime);
    procedure SetQuickDiagnosticoGestacao(const Value: String);
    procedure SetQuickDiagnosticoSanitario(const Value: String);
    procedure SetQuickNomeVeterinario(const Value: String);
    procedure SetQuickProtocolo(const Value: String);
    procedure SetQuickSexoCria(const Value: Integer);
    procedure SetQuickVeterinario(const Value: String);
    procedure LoadConfiguration;

    procedure SetProtocoloVinculado;
    procedure ClearDataToqueIfIsEmpty;
    procedure UpdateEventoReprodutivo(
  AKZooEventoZootecnico, APrenhez: String; ADataToque: TDateTime; ASexoCria,
  AGemelar, AKZooAnimalDiagnostico, AKZooAnimalProtocolo: String; ADataAbortoParto: TDateTime;
  AAbortoParto: String );
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure SetPeriodo ( AAte: TDateTime ) ;
    procedure SetVeterinario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure OpenTables ; override ;
    procedure OpenLotes;
    property DataToque : TDateTime  read FDataToque write SetDataToque;
    property QuickInput: Boolean read FQuickInput write SetQuickInput;
    property UseQuickSexoCria: Boolean read FUseQuickSexoCria write SetUseQuickSexoCria;
    property UseQuickDiagnosticoSanitario: Boolean read FUseQuickDiagnosticoSanitario write SetUseQuickDiagnosticoSanitario;
    property UseQuickProtocolo: Boolean read FUseQuickProtocolo write SetUseQuickProtocolo;
    property UseQuickVeterinario: Boolean read FUseQuickVeterinario write SetUseQuickVeterinario;

    property QuickDataToque: TDateTime read FQuickDataToque write SetQuickDataToque;
    property QuickDiagnosticoGestacao: String read FQuickDiagnosticoGestacao write SetQuickDiagnosticoGestacao;
    property QuickSexoCria: Integer read FQuickSexoCria write SetQuickSexoCria;
    property QuickDiagnosticoSanitario: String read FQuickDiagnosticoSanitario write SetQuickDiagnosticoSanitario;
    property QuickProtocolo: String read FQuickProtocolo write SetQuickProtocolo;
    property QuickVeterinario: String read FQuickVeterinario write SetQuickVeterinario;
    property QuickNomeVeterinario: String read FQuickNomeVeterinario write SetQuickNomeVeterinario;

    procedure AplicarProtocolos( AAplicar : boolean )  ;
    procedure SetVeterinarioDefault ( AFKVeterinario, ANome : string ) ;
    property  CountDiagnosticos : integer read FCountDiagnosticos ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddByKey(AKey: string):Boolean;
    function AddBrinco(
                ABrinco: string ): Boolean;
    procedure AddByQuickFields;
    procedure SaveConfiguration(AField, AValue: String);
    function HasConfirmacaoPrenhez: Boolean;
    function HasEventoZootecnico : Boolean;
    function HasDiagnostico : Boolean;
    function HasProtocolo : Boolean;
    function ValidPrenhezStatusReprodutivo: Boolean;
    function SetProtocoloPadraoVinculado: Boolean;
  end;

implementation

uses UDBZootecnico, Exceptions, DateUtils, SQLTimSt , CLAg5Types,
     DiagnosticosAnimalClass, ProtocolosAnimalClass,
     ClAg5ClientZootecnicoCommonTypes,
     CDSSuppl ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenLotes;
begin
  TCDSSuppl.Open ( cdsLotes ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenTables;
const
  _SELECT_DIAGNOSTICOS =
          'SELECT'
   +#13#10'  '''' KZOO_DIAGNOSTICO'
   +#13#10', '''' CODIGO'
   +#13#10', '''' NOME'
   +#13#10', ''F'' POR_QUARTO'
   +#13#10'FROM RDB$DATABASE D'
   +#13#10'UNION ALL'
   +#13#10'SELECT'
   +#13#10'  D.KZOO_DIAGNOSTICO'
   +#13#10', D.CODIGO'
   +#13#10', D.NOME'
   +#13#10', D.POR_QUARTO'
   +#13#10'FROM ZOO_DIAGNOSTICOS D'
   +#13#10'WHERE D.ATIVO = ''T'''
   +#13#10'  AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10'  AND ( D.KDEF_DIAGNOSTICO IS NULL OR D.KDEF_DIAGNOSTICO NOT IN ( ''2y}es:Ou/)R8{g/@M!l/'', ''.YJe3!fARy]vq.kHA0cx'', ''B,bFJM+G$?RGDbOvDI/\'', ''m]FUC-hLhAUh+I+][b|5'' ) )'
   +#13#10'ORDER BY 3' ;

  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS =
          'WITH DIAGNOSTICOS_PROTOCOLOS AS'
   +#13#10'  (SELECT'
   +#13#10'    D.KZOO_DIAGNOSTICO'
   +#13#10'  , P.KZOO_PROTOCOLO'
   +#13#10'  , P.CODIGO'
   +#13#10'  , P.NOME'
   +#13#10'  FROM ZOO_DIAGNOSTICOS D,ZOO_PROTOCOLOS P'
   +#13#10'   WHERE D.ATIVO = ''T'''
   +#13#10'  AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10'  AND ( D.KDEF_DIAGNOSTICO IS NULL OR D.KDEF_DIAGNOSTICO NOT IN ( ''2y}es:Ou/)R8{g/@M!l/'', ''.YJe3!fARy]vq.kHA0cx'', ''B,bFJM+G$?RGDbOvDI/\'', ''m]FUC-hLhAUh+I+][b|5'' ) )'
   +#13#10'    AND P.ATIVO IS DISTINCT FROM ''F'''
   +#13#10' )'
   +#13#10' SELECT'
   +#13#10'  D.KZOO_DIAGNOSTICO'
   +#13#10' , '''' KZOO_PROTOCOLO'
   +#13#10' , '''' CODIGO'
   +#13#10' , '''' NOME'
   +#13#10' , '''' VINCULADO'
   +#13#10' FROM ZOO_DIAGNOSTICOS D'
   +#13#10' WHERE D.ATIVO = ''T'''
   +#13#10'   AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10'   AND ( D.KDEF_DIAGNOSTICO IS NULL OR D.KDEF_DIAGNOSTICO NOT IN ( ''2y}es:Ou/)R8{g/@M!l/'', ''.YJe3!fARy]vq.kHA0cx'', ''B,bFJM+G$?RGDbOvDI/\'', ''m]FUC-hLhAUh+I+][b|5'' ) )'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'    DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO'
   +#13#10' ,  DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO'
   +#13#10' ,  CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'      ELSE ''*''||DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'    END CODIGO'
   +#13#10' ,  CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN DIAGNOSTICOS_PROTOCOLOS.NOME'
   +#13#10'      ELSE ''*''||DIAGNOSTICOS_PROTOCOLOS.NOME'
   +#13#10'    END NOME'
   +#13#10' ,  CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN ''F'' '
   +#13#10'      ELSE ''T'' '
   +#13#10'    END VINCULADO '
   +#13#10' FROM DIAGNOSTICOS_PROTOCOLOS'
   +#13#10' LEFT JOIN ZOO_DIAGNOSTICO_PROTOCOLOS DP'
   +#13#10'    ON     DP.KZOO_DIAGNOSTICO = DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO'
   +#13#10'      AND  DP.KZOO_PROTOCOLO = DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'  '''' KZOO_DIAGNOSTICO'
   +#13#10' , '''' KZOO_PROTOCOLO'
   +#13#10' , '''' CODIGO'
   +#13#10' , '''' NOME'
   +#13#10' , '''' VINCULADO'
   +#13#10' FROM RDB$DATABASE D'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'   '''''
   +#13#10' , P.KZOO_PROTOCOLO'
   +#13#10' , P.CODIGO'
   +#13#10' , P.NOME'
   +#13#10' , '''' VINCULADO'
   +#13#10' FROM ZOO_PROTOCOLOS P'
   +#13#10' WHERE P.ATIVO IS DISTINCT FROM ''F'''
   +#13#10'ORDER BY  1, 4, 2' ;
begin
  self.FAplicarProtocolo := True ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cdsDiagnosticosPadrao,       _SELECT_DIAGNOSTICOS ) ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsDiagnosticosDisponiveis,  _SELECT_DIAGNOSTICOS ) ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolosPadrao,       _SELECT_PROTOCOLOS_X_DIAGNOSTICOS ) ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolosDisponiveis,  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS ) ;


  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_GEMELAR,   cdsStatusGemelar   ); // utilizado para Popup ...
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_SEXO_CRIA,   cdsSexoCria   ); // utilizado para Popup ...
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, DiasPartoPrimipara, DiasPartoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID,  _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, DiasAbortoPrimipara, DiasAbortoMultipara ) ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SaveConfiguration(
  AField, AValue: String);
var
  p: TParams;
  sql_InserConfiguration: String;
begin
  sql_InserConfiguration :=
            'UPDATE OR INSERT INTO ZOO_CONFIG_DIAG_REPR (KSYS$USER, '+AField+')'
     +#13#10'VALUES (:KSYS$USER, :'+AField+')'
     +#13#10'MATCHING (KSYS$USER)';

  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'KSYS$USER', ptInput).AsString := LoggedUser.UserID;
  p.CreateParam(ftString, AField, ptInput).AsString := AValue;
  TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute ( sql_InserConfiguration, p ) ;
  p.Free;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetDataToque(const Value: TDateTime);
begin
  FDataToque := Value;
end;



procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinario(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsDiagGestacao.State in [dsInsert, dsEdit] ) then
      cdsDiagGestacao.Edit ;

   cdsDiagGestacaoNOMEVETERINARIO.Clear ;
   cdsDiagGestacaoKCAD_VETERINARIO.Clear ;

   if AKFuncionario <> '' then
     begin
       cdsDiagGestacaoNOMEVETERINARIO.Text  := ANomeFuncionario ;
       cdsDiagGestacaoKCAD_VETERINARIO.asString := AKFuncionario ;
     end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinarioDefault(AFKVeterinario,
  ANome: string);
begin
 FKVeterinario  := AFKVeterinario ;
 FNomeVeterinario := ANome ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.UpdateEventoReprodutivo(
  AKZooEventoZootecnico, APrenhez: String; ADataToque: TDateTime; ASexoCria,
  AGemelar, AKZooAnimalDiagnostico, AKZooAnimalProtocolo: String; ADataAbortoParto: TDateTime;
  AAbortoParto: String );
const
  _SQL_UPDATE_TOQUE =
            'UPDATE ZOO_EVENTOS_ZOOTECNICOS'
     +#13#10'   SET PRENHEZ   = :PRENHEZ,'
     +#13#10'       DATATOQUE = :DATATOQUE,'
     +#13#10'       SEXO_CRIA = :SEXO_CRIA,'
     +#13#10'       GEMELAR   = :GEMELAR,'
     +#13#10'       KZOO_ANIMAL_DIAGNOSTICO = :KZOO_ANIMAL_DIAGNOSTICO,'
     +#13#10'       KZOO_ANIMAL_PROTOCOLO   = :KZOO_ANIMAL_PROTOCOLO,'
     +#13#10'       DATAABORTOPARTO = :DATAABORTOPARTO,'
     +#13#10'       ABORTOPARTO = :ABORTOPARTO'
     +#13#10' WHERE KZOO_EVENTO_ZOOTECNICO  = :KZOO_EVENTO_ZOOTECNICO';

var
  p: TParams;
begin

  if (APrenhez = '') or ( Trunc( ADataToque ) = 0) then
    Exit;


  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'PRENHEZ', ptInput).AsString := APrenhez;
  p.CreateParam(ftTimeStamp, 'DATATOQUE', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp(ADataToque);

  if ASexoCria <> '' then
    p.CreateParam(ftInteger, 'SEXO_CRIA', ptInput).AsInteger := StrToInt(ASexoCria)
  else
    p.CreateParam(ftInteger, 'SEXO_CRIA', ptInput).Clear ;

  if AGemelar <> '' then
    p.CreateParam(ftString, 'GEMELAR', ptInput).AsString := AGemelar
  else
    p.CreateParam(ftString, 'GEMELAR', ptInput).Clear;

  if AKZooAnimalDiagnostico <> '' then
    p.CreateParam(ftString, 'KZOO_ANIMAL_DIAGNOSTICO', ptInput).AsString := AKZooAnimalDiagnostico
  else
    p.CreateParam(ftString, 'KZOO_ANIMAL_DIAGNOSTICO', ptInput).Clear;

  if AKZooAnimalProtocolo <> '' then
    p.CreateParam(ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput).AsString := AKZooAnimalProtocolo
  else
    p.CreateParam(ftString, 'KZOO_ANIMAL_PROTOCOLO', ptInput).Clear;

  if Trunc( ADataAbortoParto ) > 0 then
    p.CreateParam(ftTimeStamp, 'DATAABORTOPARTO', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp(ADataAbortoParto)
  else
    p.CreateParam(ftTimeStamp, 'DATAABORTOPARTO', ptInput).Clear;

  if AAbortoParto <> '' then
    p.CreateParam(ftInteger, 'ABORTOPARTO', ptInput).AsInteger := StrToInt(AAbortoParto)
  else
    p.CreateParam(ftInteger, 'ABORTOPARTO', ptInput).Clear ;

  p.CreateParam(ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput).AsString := AKZooEventoZootecnico;

  TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute ( _SQL_UPDATE_TOQUE, p ) ;

  p.Free;
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.ValidaSexoCria: Boolean;
begin
  Result:= True;
  if (cdsDiagGestacaoPRENHEZ.IsNull) or (cdsDiagGestacaoPRENHEZ.AsString = '') or
     (cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE)  then
   begin
     cdsDiagGestacaoGEMELAR.Clear;
     cdsDiagGestacaoSEXO_CRIA.Clear;
   end;

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.ValidPrenhezStatusReprodutivo: Boolean;
begin
  Result :=
    (
       (cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger  = _ST_STATUS_REPRODUTIVO_INSEMINADA )
    or (cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger  = _ST_STATUS_REPRODUTIVO_RECEPTORA_TRANSFERIDA )
    or (cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger  = _ST_STATUS_REPRODUTIVO_PRENHE )
    or (cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger  = _ST_STATUS_REPRODUTIVO_NAO_INSEMINAR )
    or ((cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger = _ST_STATUS_REPRODUTIVO_DOADORA_INSEMINADA) and (cdsDiagGestacaoPRENHEZ_ANTERIOR.AsString <> 'F') )
    or ((cdsDiagGestacaoCOD_STATUS_REPRODUTIVO.AsInteger = _ST_STATUS_REPRODUTIVO_RECEPTORA_PRENHE) and (cdsDiagGestacaoPRENHEZ_ANTERIOR.AsString <> 'T') )
    ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetPeriodo(AAte: TDateTime);
begin
   FCountDiagnosticos    := 0 ;
   FOldCountDiagnosticos := 0 ;

   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, FDiasConfirmacaoPrimipara, FDiasConfirmacaoMultipara ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_1VEZ, FDiasReconfirmacaoPrimipara1, FDiasReconfirmacaoMultipara1 ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_2VEZ, FDiasReconfirmacaoPrimipara2, FDiasReconfirmacaoMultipara2 ) ;
(*
   cdsDiagGestacao.Close ;
   sqlDiagGestacao.CommandText := Format( GetSqlDiagnostico, [ GetLotes ] );
   sqlDiagGestacao.Params.Clear;
   sqlDiagGestacao.Params.CreateParam(ftFixedChar, 'KCAD_FAZENDA',ptInput).AsString            := LoggedUser.DomainID ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'STATUS_DESCARTADO',ptInput).AsInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DOADOR'           ,ptInput).AsInteger      := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
   sqlDiagGestacao.Params.CreateParam(ftString   , 'LOTE_NULL'        ,ptInput).AsString       := FLoteNull ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'EMBRIAO'          ,ptInput).AsInteger      := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_MULTIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoMultipara ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_PRIMIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoPrimipara ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_MULTIPARA_1X'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_PRIMIPARA_1X'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_MULTIPARA_2X'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIAS_CONFIRMAR_PRIMIPARA_2X'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'EMBRIAO'          ,ptInput).AsInteger      := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
   sqlDiagGestacao.Params.CreateParam(ftFixedChar, 'KCAD_FAZENDA',ptInput).AsString            := LoggedUser.DomainID ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'STATUS_DESCARTADO',ptInput).AsInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
*)
//   cdsDiagGestacao.FetchParams;

   sqlDiagGestacao.CommandText := Format( GetSqlDiagnostico, [ GetLotes ] );

  with cdsDiagGestacao do
    begin
      ParamByName( 'KCAD_FAZENDA'                 ).AsString   := LoggedUser.DomainID ;
      ParamByName( 'STATUS_DESCARTADO'            ).AsInteger  := _ST_STATUS_ANIMAL_DESCARTADO ;
      ParamByName( 'DOADOR'                       ).AsInteger  := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
      ParamByName( 'LOTE_NULL'                    ).AsString   := FLoteNull ;
      ParamByName( 'EMBRIAO'                      ).AsInteger  := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
      ParamByName( 'DIAS_CONFIRMAR_MULTIPARA'     ).AsInteger  := FDiasConfirmacaoMultipara ;
      ParamByName( 'DIAS_CONFIRMAR_PRIMIPARA'     ).AsInteger  := FDiasConfirmacaoPrimipara ;
      ParamByName( 'DIAS_CONFIRMAR_MULTIPARA_1X'  ).AsInteger  := FDiasReconfirmacaoMultipara1 ;
      ParamByName( 'DIAS_CONFIRMAR_PRIMIPARA_1X'  ).AsInteger  := FDiasReconfirmacaoPrimipara1 ;
      ParamByName( 'DIAS_CONFIRMAR_MULTIPARA_2X'  ).AsInteger  := FDiasReconfirmacaoMultipara2 ;
      ParamByName( 'DIAS_CONFIRMAR_PRIMIPARA_2X'  ).AsInteger  := FDiasReconfirmacaoPrimipara2 ;
      ParamByName( 'DATA'                         ).asDateTime := AAte ;
    end ;

   TCDSSuppl.Open ( cdsDiagGestacao ) ;
   cdsDiagGestacao.IndexFieldNames := 'BRINCOFEMEA_';

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetProtocoloPadraoVinculado : Boolean;
var
  cds: TClientDataSet;
begin
  Result := False;
  if not cdsProtocolosPadrao.Active then
    exit;

  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolosPadrao, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr(cdsDiagnosticosPadraoKZOO_DIAGNOSTICO.Value)+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if ( cds.RecordCount = 1 ) and
     ( (cdsProtocolosPadraoKZOO_PROTOCOLO.isNull ) or
       ( cdsProtocolosPadraoKZOO_PROTOCOLO.AsVariant <> cds.FieldByName('KZOO_PROTOCOLO').AsVariant ) ) then
   begin
     Result:= cdsProtocolosPadrao.Locate('KZOO_PROTOCOLO', cds.FieldByName('KZOO_PROTOCOLO').AsVariant,[])
    {
    cdsDiagGestacaoCODIGO_PROTOCOLO.AsVariant := cds.FieldByName('CODIGO').AsVariant;
    cdsDiagGestacaoKZOO_PROTOCOLO.AsVariant := cds.FieldByName('KZOO_PROTOCOLO').AsVariant;
    cdsDiagGestacaoNOME_PROTOCOLO.asString  := cds.FieldByName('NOME').AsVariant;
    }
   end;

  FreeAndNil(cds);

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetProtocoloVinculado;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolosDisponiveis, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr(cdsDiagGestacaoKZOO_DIAGNOSTICO.NewValue)+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if ( cds.RecordCount = 1 ) and
     ( (cdsDiagGestacaoKZOO_PROTOCOLO.isNull ) or
       ( cdsDiagGestacaoKZOO_PROTOCOLO.AsVariant <> cds.FieldByName('KZOO_PROTOCOLO').AsVariant ) ) then
   begin
    cdsDiagGestacaoCODIGO_PROTOCOLO.AsVariant := cds.FieldByName('CODIGO').AsVariant;
    cdsDiagGestacaoKZOO_PROTOCOLO.AsVariant := cds.FieldByName('KZOO_PROTOCOLO').AsVariant;
    cdsDiagGestacaoNOME_PROTOCOLO.asString  := cds.FieldByName('NOME').AsVariant;
   end;

  FreeAndNil(cds);

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetUseQuickDiagnosticoSanitario(
  const Value: Boolean);
begin
  FUseQuickDiagnosticoSanitario := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickDataToque(
  const Value: TDateTime);
begin
  FQuickDataToque := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickDiagnosticoGestacao(
  const Value: String);
begin
  FQuickDiagnosticoGestacao := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickDiagnosticoSanitario(
  const Value: String);
begin
  FQuickDiagnosticoSanitario := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickInput(
  const Value: Boolean);
begin
  FQuickInput := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickNomeVeterinario(
  const Value: String);
begin
  FQuickNomeVeterinario := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickProtocolo(
  const Value: String);
begin
  FQuickProtocolo := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickSexoCria(
  const Value: Integer);
begin
  FQuickSexoCria := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetQuickVeterinario(
  const Value: String);
begin
  FQuickVeterinario := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetUseQuickProtocolo(
  const Value: Boolean);
begin
  FUseQuickProtocolo := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetUseQuickSexoCria(
  const Value: Boolean);
begin
  FUseQuickSexoCria := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetUseQuickVeterinario(
  const Value: Boolean);
begin
  FUseQuickVeterinario := Value;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoAfterCancel(
  DataSet: TDataSet);
begin
    FCountDiagnosticos := FOldCountDiagnosticos ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeDelete(
  DataSet: TDataSet);
begin
   Abort ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeEdit(
  DataSet: TDataSet);
begin

  if ( FDataToque = 0  ) then
       raise Warning.Create('Data padrão do toque inválida')
  else if ( FDataToque > Date  ) then
       raise Warning.Create('Data padrão do toque superior a atual') ;

  FUltimoToque := cdsDiagGestacaoDATA_ULTIMOTOQUE.AsDateTime;
  FPrenhezOld  := cdsDiagGestacaoPRENHEZ.AsString;
//  else if ( FKVeterinario = ''  ) then
//       raise Warning.Create('Veterinário padrão inválido') ;

//  else if ( deDataEvento.date < ( Date - 30 )) then
//     begin
//       deDataEvento.SetFocus ;
//       raise Warning.Create('Data inferiror a 30 dias');
//     end;

 { if  VarIsEmpty ( cdsDiagGestacaoCOUNT_EXAMINADOS.Value )
   or VarIsNull ( cdsDiagGestacaoCOUNT_EXAMINADOS.Value ) then
    FOldCountDiagnosticos := 0
 else}
    FOldCountDiagnosticos := cdsDiagGestacaoCOUNT_EXAMINADOS.Value
                           + cdsDiagGestacaoCOUNT_DIAGNOSTICOS.Value
                           + cdsDiagGestacaoCOUNT_PROTOCOLOS.Value ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeInsert(
  DataSet: TDataSet);
begin
   Abort ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforePost(
  DataSet: TDataSet);
begin
//   if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> '')) and ( cdsDiagGestacaoKCAD_VETERINARIO.asString = '' )  then
//     raise Warning.Create('Veterinário deve ser preenchido / pesquisado');
//  if not ValidaSexoCria then
//       raise Warning.Create('Sexagem da cria não confere com o status da gestação gemelar' );


  if HasEventoZootecnico then
   begin
     ValidaSexoCria;

     if (not ( (VarIsNull( cdsDiagGestacaoDATATOQUE.OldValue)) or (VarIsEmpty( cdsDiagGestacaoDATATOQUE.OldValue) )) ) and
        (not (cdsDiagGestacaoDATATOQUE.IsNull) ) and
        (cdsDiagGestacaoDATATOQUE.AsDateTime < FUltimoToque) then
       raise Warning.Create('A data do último toque é posterior à data do toque' );
   end ;
  {else
  if HasConfirmacaoPrenhez and
    (not HasEventoZootecnico) then
   begin
     //cdsDiagGestacaoNOVAPRENHEZ.Text := '';
     raise Warning.Create('Diagnóstico de reprodução não pode ser informado para um animal sem evento reprodutivo.' );
   end;}


  if (HasDiagnostico or HasProtocolo) and
     ( cdsDiagGestacaoDATATOQUE.IsNull ) then
     raise Warning.Create('A data do último toque não pode estar em branco' );

  {
  if HasConfirmacaoPrenhez and (not HasEventoZootecnico) then
    begin
     cdsDiagGestacaoPRENHEZ.OnValidate := nil;
     cdsDiagGestacaoNOVAPRENHEZ.Text := '';
     if (not HasDiagnostico) and (not HasProtocolo) then
        cdsDiagGestacaoNOVOTOQUE.Clear;
     cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate;
     raise Warning.Create('Diagnóstico de reprodução não pode ser informado para um animal sem evento reprodutivo.' );
    end;

  if HasConfirmacaoPrenhez and
     (not ValidPrenhezStatusReprodutivo) then
   begin
     cdsDiagGestacaoPRENHEZ.OnValidate := nil;
     cdsDiagGestacaoNOVAPRENHEZ.Text := '';
     if (not HasDiagnostico) and (not HasProtocolo) then
        cdsDiagGestacaoNOVOTOQUE.Clear;
     cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate;
     raise Warning.Create('Não é permitido informar diagnóstico de prenhez para animais com status reprodutivo diferente de: Inseminada, Prenhe, Doadora Inseminada e Receptora prenhe.' );
   end; }

  ClearDataToqueIfIsEmpty;


  if HasEventoZootecnico then
    AbortoNovaPrenhezNegativa;



end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoKZOO_DIAGNOSTICOChange(
  Sender: TField);
begin
  if not cdsDiagGestacaoKZOO_DIAGNOSTICO.IsNull then
   begin
     SetProtocoloVinculado;
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoKZOO_DIAGNOSTICOValidate(
  Sender: TField);
begin

  if (not (cdsDiagGestacaoKZOO_DIAGNOSTICO.IsNull)) and (cdsDiagGestacaoNOVOTOQUE.IsNull) then
    cdsDiagGestacaoNOVOTOQUE.AsDateTime := FDataToque ;

  if HasDiagnostico then
    self.FCountDiagnosticos := FOldCountDiagnosticos +1
  else
    self.FCountDiagnosticos := FOldCountDiagnosticos -1;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoKZOO_PROTOCOLOValidate(
  Sender: TField);
begin

  if (not (cdsDiagGestacaoKZOO_PROTOCOLO.IsNull)) and (cdsDiagGestacaoNOVOTOQUE.IsNull) then
    cdsDiagGestacaoNOVOTOQUE.AsDateTime := FDataToque ;

  if HasProtocolo then
    self.FCountDiagnosticos := FOldCountDiagnosticos +1
  else
    self.FCountDiagnosticos := FOldCountDiagnosticos -1;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZChange(
  Sender: TField);
begin
  if HasConfirmacaoPrenhez and (not HasEventoZootecnico) then
    begin
     //cdsDiagGestacaoPRENHEZ.OnChange := nil;
     cdsDiagGestacao.DisableControls;
     cdsDiagGestacaoNOVAPRENHEZ.Text := '';
     cdsDiagGestacaoPRENHEZ.Clear;
     if (not HasDiagnostico) and (not HasProtocolo) then
        cdsDiagGestacaoNOVOTOQUE.Clear;
     //cdsDiagGestacaoPRENHEZ.OnChange := cdsDiagGestacaoPRENHEZChange;
     cdsDiagGestacao.EnableControls;
     //raise Warning.Create('Diagnóstico de reprodução não pode ser informado para um animal sem evento reprodutivo.' );
    end;

  if HasConfirmacaoPrenhez and
     (not ValidPrenhezStatusReprodutivo) then
   begin
     cdsDiagGestacaoPRENHEZ.OnChange := nil;
     cdsDiagGestacaoNOVAPRENHEZ.Text := '';
     if (not HasDiagnostico) and (not HasProtocolo) then
        cdsDiagGestacaoNOVOTOQUE.Clear;
     cdsDiagGestacaoPRENHEZ.OnChange := cdsDiagGestacaoPRENHEZChange;
     raise Warning.Create(
               'Não é permitido informar diagnóstico de prenhez para animais'
         +#13#10'com status reprodutivo diferente de:'
         +#13#10''
         +#13#10'Inseminada, Prenhe, Doadora Inseminada, Receptora prenhe e Receptora transferida.' );
   end;


end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ( Sender.IsNull ) OR ( Sender.AsString = '' ) then
    begin
//      if DisplayText then
//        Text := 'n.e.'
//      else
        Text := 'Não examinada'
    end
  else if Sender.asBoolean then
     Text := 'Prenhe'
  else
     Text := 'Não prenhe' ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZSetText(
  Sender: TField; const Text: string);
begin
  inherited;
  if Text = 'Não examinada' then
     Sender.Clear
  else if Text = 'Prenhe' then
     Sender.asString := 'T'
  else if Text = 'Não prenhe' then
     Sender.asString := 'F' ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZValidate(
  Sender: TField);
begin




   if HasConfirmacaoPrenhez
   {and cdsDiagGestacaoNOVOTOQUE.IsNull} then
   begin
//     cdsDiagGestacaoNOVOTOQUE.OnValidate := nil ;
     cdsDiagGestacaoNOVOTOQUE.AsDateTime := FDataToque ;
//     cdsDiagGestacaoNOVOTOQUE.OnValidate := cdsDiagGestacaoNOVOTOQUEValidate ;
//     cdsDiagGestacaoNOVOTOQUEValidate( cdsDiagGestacaoNOVOTOQUE ) ;

     if cdsDiagGestacaoKCAD_VETERINARIO.asString = '' then
        SetVeterinario ( FKVeterinario, FNomeVeterinario ) ;
   end;
  // else
  //   cdsDiagGestacaoNOVOTOQUE.Clear;

   if not HasConfirmacaoPrenhez  then
     self.FCountDiagnosticos := FOldCountDiagnosticos -1
   else
     self.FCountDiagnosticos := FOldCountDiagnosticos +1;






end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPROTOCOLO_TOQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if DisplayText then
     begin
       if cdsDiagGestacaoPROTOCOLO_TOQUE.AsBoolean then
          Text := 'Aplicar protocolo ao animal : sim '
       else
          Text := 'Aplicar protocolo ao animal : não '
     end
   else
         Text := Sender.AsString
     (*
   else
     begin
       if cdsDiagGestacaoPROTOCOLO_TOQUE.AsBoolean then
         Text := 'T'
       else
         Text := 'F'
     end;
     *)
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoREEXAMINARGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if (( cdsDiagGestacaoPRENHEZ.isNull ) or (Trim ( cdsDiagGestacaoPRENHEZ.asString ) = '')) then
         Text := 'não avalidada'
      else if Sender.asBoolean then
         Text := 'Rexaminar'
      else
         Text := 'Não Rexaminar' ;
    end
  else
    Text := Sender.asString ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoSEXO_CRIAValidate(
  Sender: TField);
begin

  if ((cdsDiagGestacaoPRENHEZ.IsNull) or (cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE))
     and (not cdsDiagGestacaoSEXO_CRIA.IsNull) then
   begin
     raise Warning.Create('Não é possível informar o sexo da cria para um animal não prenhe' );
   end;


  if cdsDiagGestacaoSEXO_CRIA.AsInteger < _ST_SEXO_CRIA_F_F then
    cdsDiagGestacaoGEMELAR.AsString := 'F'
  else
    cdsDiagGestacaoGEMELAR.AsString := 'T';

  if cdsDiagGestacaoSEXO_CRIA.IsNull then
     cdsDiagGestacaoGEMELAR.Clear;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsProtocolosDisponiveisFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept :=
            ( cdsProtocolosDisponiveisKZOO_DIAGNOSTICO.asString.Trim
                = cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO.asString.Trim
              ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsProtocolosPadraoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept :=
            (   cdsProtocolosPadraoKZOO_DIAGNOSTICO.asString
                 = cdsDiagnosticosPadraoKZOO_DIAGNOSTICO.asString
               ) ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.ClearDataToqueIfIsEmpty;
begin
  if ((cdsDiagGestacaoPRENHEZ.IsNull) or (cdsDiagGestacaoPRENHEZ.AsString = '')) and
     ((cdsDiagGestacaoKZOO_DIAGNOSTICO.IsNull) or (cdsDiagGestacaoKZOO_DIAGNOSTICO.AsString = '')) and
     ((cdsDiagGestacaoKZOO_PROTOCOLO.IsNull) or (cdsDiagGestacaoKZOO_PROTOCOLO.AsString = '')) then
     cdsDiagGestacaoNOVOTOQUE.Clear;

end;

constructor TZoo_ReproducaoDiagnosticosGestacaoDatamodule.Create(
  AOwner: TComponent);
begin
  inherited;
  SetSqlAddByKey;
  LoadCdsStatusReprodutivo;
  LoadConfiguration;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if not( VarIsNull(DeltaDS.FieldByName('KZOO_EVENTO_ZOOTECNICO' ).OldValue) ) and
    ((not DeltaDS.FieldByName('PRENHEZ').IsNull) and (DeltaDS.FieldByName('PRENHEZ').AsString <> '')) then
   begin
     if  ( DeltaDS.FieldByName('PROTOCOLO_TOQUE').AsBoolean )
     and ( not DeltaDS.FieldByName('DATATOQUE' ).isNull ) then
       begin
          if DeltaDS.FieldByName('PRENHEZ').AsBoolean then
             DiagnosticosAnimalClass.TEventosAnimal.AddDiagnosticoGestacaoPositivo(
               DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
               DeltaDS.FieldByName('DATATOQUE' ).AsDateTime )
          else
             DiagnosticosAnimalClass.TEventosAnimal.AddDiagnosticoGestacaoNegativo(
               DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
               DeltaDS.FieldByName('DATATOQUE' ).AsDateTime ) ;

          if DeltaDS.FieldByName('REEXAMINAR').AsBoolean then
              DiagnosticosAnimalClass.TEventosAnimal.AddReexaminar(
               DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
               DeltaDS.FieldByName('DATATOQUE' ).AsDateTime );
       end;

     if  ( SourceDS = sqlDiagGestacao ) then
      begin
        AbrirLactacao( DeltaDS );
      end;
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  LDiagnosticoAnimal : string ;
  LProtocoloAnimal   :  string ;

  LSexoCria, LGemelar : String;

begin
   Applied := True ;

   if SourceDS.Name <> 'sqlDiagGestacao' then
     exit;

   LDiagnosticoAnimal := '' ;
   LProtocoloAnimal   := '' ;
   if DeltaDS.FieldByName('KZOO_DIAGNOSTICO').asString <> '' then
       LDiagnosticoAnimal := TDiagnosticosAnimal.AddDiagnostico (
             DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA') .OldValue   // AKAnimal
           , DeltaDS.FieldByName('KZOO_DIAGNOSTICO')  .asString   // AKDiagnostico
           , 0  // AQuarto
           , DeltaDS.FieldByName('DATATOQUE')         .asDateTime // AData
           , ''             // ALote
           , True           // AGetLoteIfEmpty
           , False          // AIniciarProtocolos : boolean = True
                            // AFinalizarProtocolos : boolean = True
        ) ;

   if DeltaDS.FieldByName('KZOO_PROTOCOLO').asString <> '' then
       LProtocoloAnimal :=  TProtocolosAnimal.AddProtocolo (
            DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA') .OldValue   // AKAnimal
          , DeltaDS.FieldByName('KZOO_PROTOCOLO')    .asString   // AKProtocolo
          , DeltaDS.FieldByName('DATATOQUE')         .asDateTime // AData
          , LDiagnosticoAnimal                                 // AKDiagnosticoAnimal
          , ''                                                 // AKTarefaAnimal
          , ''                                                 // AKResultadoTarefa
          , 0                                                  // AResultado
          , True                                               // InsertTarefas
          , ''                                                 // ALote :
          , True                                               // AGetLoteIfEmpty
          , False                                              // ANotify
        ) ;



   if (not VarIsNull(DeltaDS.FieldByName('SEXO_CRIA').NewValue)) and
      (not VarIsEmpty(DeltaDS.FieldByName('SEXO_CRIA').NewValue)) then
      LSexoCria := DeltaDS.FieldByName('SEXO_CRIA').NewValue
   else
   if not VarIsNull(DeltaDS.FieldByName('SEXO_CRIA').OldValue) then
      LSexoCria := DeltaDS.FieldByName('SEXO_CRIA').OldValue
   else
      LSexoCria := '';


   if (not VarIsNull(DeltaDS.FieldByName('GEMELAR').NewValue)) and
      (not VarIsEmpty(DeltaDS.FieldByName('GEMELAR').NewValue)) then
      LGemelar := DeltaDS.FieldByName('GEMELAR').NewValue
   else
   if not VarIsNull(DeltaDS.FieldByName('GEMELAR').OldValue) then
      LGemelar := DeltaDS.FieldByName('GEMELAR').OldValue
   else
      LGemelar := '';


   if (not (VarIsNull (DeltaDS.FieldByName('KZOO_EVENTO_ZOOTECNICO').OldValue) )) and
      ( not VarIsNull(DeltaDS.FieldByName('NOVAPRENHEZ').NewValue) ) and
      ( not VarIsEmpty(DeltaDS.FieldByName('NOVAPRENHEZ').NewValue)) then
    begin
      UpdateEventoReprodutivo(
              DeltaDS.FieldByName('KZOO_EVENTO_ZOOTECNICO').OldValue,
              DeltaDS.FieldByName('NOVAPRENHEZ').Value,
              //DeltaDS.FieldByName('DATATOQUE').NewValue, -- kiq
              DeltaDS.FieldByName('NOVOTOQUE').NewValue,  // ++ kiq
              LSexoCria,
              LGemelar,
              LDiagnosticoAnimal,
              LProtocoloAnimal,
              DeltaDS.FieldByName('DATAABORTOPARTO').AsDateTime,
              DeltaDS.FieldByName('ABORTOPARTO').AsString
      );
    end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
//  TableName := 'ZOO_EVENTOS_ZOOTECNICOS';

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.GetLotes: String;
var
  LLotes : String;
begin
  Result := '';
  LLotes := '';
  FLoteNull := 'F';
  cdsLotes.DisableControls;
  cdsLotes.First;
  while not cdsLotes.Eof do
   begin
     if cdsLotes.FieldByName('SELECTED').AsInteger = 1 then
      begin
       LLotes := LLotes + QuotedStr(cdsLotes.FieldByName('LOTE').AsString) + ', ';
       if cdsLotes.FieldByName('FIELD_NULL').AsInteger = 1 then
         FLoteNull := 'T';
      end;
     cdsLotes.Next;
   end;
  cdsLotes.EnableControls;

  System.Delete( LLotes, Length( LLotes )-1, 2);

  Result := LLotes;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetSqlAddByKey;
begin
  if FSQLAddByKey <> '' then
    Exit;

  FSQLAddByKey := Copy(sqlDiagGestacao.CommandText, 1, Pos('/*ADDBYKEY*/',sqlDiagGestacao.CommandText)-1);


  FSQLAddByKey := FSQLAddByKey+
     #13#10' AND ( AF.KZOO_ANIMAL = :KZOO_ANIMAL) ';
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.GetSelectedStatusReprodutivos: String;
var
  LStatus : String;
begin
  LStatus := '';
  cdsStatusReprodutivo.DisableControls;
  cdsStatusReprodutivo.First;
  while not cdsStatusReprodutivo.Eof do
   begin
     if cdsStatusReprodutivoSELECTED.AsInteger = 1 then
        LStatus := LStatus + cdsStatusReprodutivoSTATUS_REPRODUTIVOS.AsString;
     cdsStatusReprodutivo.Next;
   end;


  Result := LStatus;
  cdsStatusReprodutivo.EnableControls;
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.GetSqlDiagnostico: String;
var
  LCommandText, LSelectedStatusReprodutivos : String;
begin

  if FSQLDiagnosticosOriginal = '' then
    FSQLDiagnosticosOriginal := sqlDiagGestacao.CommandText;

  LCommandText := StringReplace(FSQLDiagnosticosOriginal,
                           '/*LOTE_IN*/',
                           'DAF.LOTE IN (%s) or',
                           []);


  LSelectedStatusReprodutivos := GetSelectedStatusReprodutivos;


  LCommandText := StringReplace(LCommandText,
                           '/*(STATUS_REPRODUTIVO)*/',
                           LSelectedStatusReprodutivos,
                           []);



  Result :=  LCommandText;

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.HasConfirmacaoPrenhez: Boolean;
begin
  Result := not ((cdsDiagGestacaoPRENHEZ.isNull ) or (Trim ( cdsDiagGestacaoPRENHEZ.asString ) = ''));
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.HasDiagnostico: Boolean;
begin
  Result := (not(cdsDiagGestacaoKZOO_DIAGNOSTICO.IsNull))
        and (cdsDiagGestacaoKZOO_DIAGNOSTICO.AsString <> '');
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.HasEventoZootecnico: Boolean;
begin
  Result := (not cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.IsNull) and (cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.AsString <> '');
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.HasProtocolo: Boolean;
begin
  Result := (not(cdsDiagGestacaoKZOO_PROTOCOLO.IsNull))
        and (cdsDiagGestacaoKZOO_PROTOCOLO.AsString <> '');
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.LoadCdsStatusReprodutivo;
begin
  //cdsStatusReprodutivo.EmptyDataSet;

  cdsStatusReprodutivo.Append;
  cdsStatusReprodutivoSELECTED.AsInteger := 0;
  cdsStatusReprodutivoDESCRIPTION.AsString := 'Abortadas';
  cdsStatusReprodutivoSTATUS_REPRODUTIVOS.AsString := Format('%d,%d,',
                                       [_ST_STATUS_REPRODUTIVO_ABORTADA,
                                        _ST_STATUS_REPRODUTIVO_RECEPTORA_ABORTADA]);
  cdsStatusReprodutivo.Post;

  cdsStatusReprodutivo.Append;
  cdsStatusReprodutivoSELECTED.AsInteger := 0;
  cdsStatusReprodutivoDESCRIPTION.AsString := 'Aptas';
  cdsStatusReprodutivoSTATUS_REPRODUTIVOS.AsString := Format('%d,%d,%d,%d,%d,',
                                       [_ST_STATUS_REPRODUTIVO_APTA,
                                        _ST_STATUS_REPRODUTIVO_COLETADA,
                                        _ST_STATUS_REPRODUTIVO_DOADORA_APTA,
                                        _ST_STATUS_REPRODUTIVO_DOADORA_COLETADA,
                                        _ST_STATUS_REPRODUTIVO_RECEPTORA_APTA]);
  cdsStatusReprodutivo.Post;

  cdsStatusReprodutivo.Append;
  cdsStatusReprodutivoSELECTED.AsInteger := 0;
  cdsStatusReprodutivoDESCRIPTION.AsString := 'Pós-parto';
  cdsStatusReprodutivoSTATUS_REPRODUTIVOS.AsString := Format('%d,',
                                       [_ST_STATUS_REPRODUTIVO_PEV]);
  cdsStatusReprodutivo.Post;

  cdsStatusReprodutivo.Append;
  cdsStatusReprodutivoSELECTED.AsInteger := 0;
  cdsStatusReprodutivoDESCRIPTION.AsString := 'Vazias';
  cdsStatusReprodutivoSTATUS_REPRODUTIVOS.AsString := Format('%d,%d,',
                                       [_ST_STATUS_REPRODUTIVO_RECEPTORA_VAZIA,
                                        _ST_STATUS_REPRODUTIVO_VAZIA]);
  cdsStatusReprodutivo.Post;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.LoadConfiguration;
const
  _SQL_CONFIG =
           'SELECT CF.KSYS$USER, CF.INFO_SEXO_CRIA, CF.INFO_DIAG_SANITARIO,'
    +#13#10'       CF.INFO_PROTOCOLO, CF.INFO_RESPONSAVEL'
    +#13#10' FROM ZOO_CONFIG_DIAG_REPR CF'
    +#13#10' WHERE CF.KSYS$USER = :KSYS$USER';
var
  p: TParams;
  cds : TClientDataSet;
begin
  cds:= nil;
  p:= TParams.Create(nil);
  p.CreateParam(ftString, 'KSYS$USER', ptInput).AsString := LoggedUser.UserID;
  TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).populateClientDataSet( cds, _SQL_CONFIG, p );
  if cds.IsEmpty then
   begin
     FUseQuickSexoCria := False;
     FUseQuickDiagnosticoSanitario := False;
     FUseQuickProtocolo := False;
     FUseQuickVeterinario := False;
   end
  else
   begin
     FUseQuickSexoCria := cds.FieldByName('INFO_SEXO_CRIA').AsBoolean;
     FUseQuickDiagnosticoSanitario := cds.FieldByName('INFO_DIAG_SANITARIO').AsBoolean;
     FUseQuickProtocolo := cds.FieldByName('INFO_PROTOCOLO').AsBoolean;
     FUseQuickVeterinario := cds.FieldByName('INFO_RESPONSAVEL').AsBoolean;
   end;
  p.Free;
  cds.Free;
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.LocateBrinco(
  ABrinco: string): boolean;
begin
  Result := cdsDiagGestacao.Locate( 'BRINCOFEMEA', ABrinco, [] ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOMEVETERINARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsDiagGestacaoKCAD_VETERINARIO.Clear ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVAPRENHEZGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) OR ( Sender.AsString = '' ) then
    begin
        //Text := 'Não examinada'
        Text := '';
    end
  else if Sender.asBoolean then
     Text := 'Prenhe'
  else
     Text := 'Não prenhe' ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVAPRENHEZSetText(
  Sender: TField; const Text: string);
begin
  if (Text = 'Não examinada') or (Text = '') then
   begin
     Sender.Clear;
     cdsDiagGestacaoPRENHEZ.Clear;
   end
  else if Text = 'Prenhe' then
   begin
     Sender.asString := 'T';
     cdsDiagGestacaoPRENHEZ.AsString := 'T';
   end
  else if Text = 'Não prenhe' then
   begin
     Sender.asString := 'F';
     cdsDiagGestacaoPRENHEZ.AsString := 'F';
   end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVOTOQUEValidate( Sender: TField ) ;
begin
  inherited;

  if Sender.AsDateTime > Date then
     raise Warning.Create('Não é possível incluir diagnósticos com data futura');

  if (not cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.IsNull) and (cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.AsString <> '') then
   begin
     if (not ( (VarIsNull( Sender.AsVariant)) or (VarIsEmpty( Sender.AsVariant) )) ) and
        ( Sender.AsDateTime < FUltimoToque ) then
       raise Warning.Create('A data do último toque é posterior à data do toque' );
   end;

  if ( Sender.IsNull ) or ( Sender.asDateTime = 0 ) then
      cdsDiagGestacaoDATATOQUE.Clear ;


  if ( cdsDiagGestacaoNOVOTOQUE.IsNull ) or ( cdsDiagGestacaoNOVOTOQUE.asDateTime = 0 ) then
      cdsDiagGestacaoDATATOQUE.Clear
  else
  if (not cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.IsNull) and (cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO.AsString <> '') and
     (cdsDiagGestacaoNOVOTOQUE.asDateTime <= cdsDiagGestacaoDATAEVENTO.asDateTime) then
       raise Warning.Create('A data do toque tem que ser superior a data do evento')
  else
      cdsDiagGestacaoDATATOQUE.asDateTime := cdsDiagGestacaoNOVOTOQUE.asDateTime ;

  if HasEventoZootecnico then
   begin
     if ( cdsDiagGestacaoDATATOQUE.IsNull ) or ( cdsDiagGestacaoDATATOQUE.asDateTime = 0 ) then
      begin
        cdsDiagGestacaoPRENHEZ.OnValidate := nil ;
        cdsDiagGestacaoPRENHEZ.Clear ;
        cdsDiagGestacaoREEXAMINAR.asString      := 'F' ;
        cdsDiagGestacaoPROTOCOLO_TOQUE.AsString := 'F' ;
        cdsDiagGestacaoLOTETOQUE.clear  ;
        cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate ;
      end
     else
        cdsDiagGestacaoLOTETOQUE.asString := cdsDiagGestacaoLOTE.asString ;
   end;

 if HasEventoZootecnico and
    cdsDiagGestacaoPRENHEZ.asBoolean then
   begin
      if cdsDiagGestacaoNUMERO_LACTACAO.AsInteger > 1  then
        cdsDiagGestacaoPREVISAOPARTO.asDateTime := cdsDiagGestacaoDATAEVENTO.asDateTime + DiasPartoMultipara
      else
        cdsDiagGestacaoPREVISAOPARTO.asDateTime := cdsDiagGestacaoDATAEVENTO.asDateTime + DiasPartoPrimipara ;

      cdsDiagGestacaoREEXAMINAR.asString := 'F' ;
      if self.FAplicarProtocolo then
         cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'T'
      else
         cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'F' ;
   end ;

(* não esta na especificacao

 else if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> ''))  then
   begin
      cdsDiagGestacaoREEXAMINAR.asString := 'T' ;
   end ;
*)
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  //cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'T' ;
  FUltimoToque := 0;
  FPrenhezOld  := '';
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AbortoNovaPrenhezNegativa;
var
 isPrimipara, AbrirLactacao : Boolean;
 diasEvento  : integer;
begin
   diasEvento  := Trunc ( cdsDiagGestacaoNOVOTOQUE.AsDateTime - cdsDiagGestacaoDATAEVENTO.asDateTime ) ;
   AbrirLactacao := False;
   if ( cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE ) and ( cdsDiagGestacaoPRENHEZ_ANTERIOR.AsString = _ST_STATUS_PRENHEZ_PRENHE ) and
      ( cdsDiagGestacaoNOVOTOQUE.AsDateTime > cdsDiagGestacaoDATA_ULTIMOTOQUE.AsDateTime ) and
      ( not ((VarIsEmpty(cdsDiagGestacaoPRENHEZ.OldValue)) or (VarIsNull(cdsDiagGestacaoPRENHEZ.OldValue)) ) ) then
    begin
      isPrimipara := TAnimalFemea.isPrimipara( cdsDiagGestacaoKZOO_ANIMAL_FEMEA.AsString ) ;
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

      cdsDiagGestacaoDATAABORTOPARTO.AsDateTime := ( cdsDiagGestacaoNOVOTOQUE.AsDateTime );

      if AbrirLactacao then
         cdsDiagGestacaoABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
      else
         cdsDiagGestacaoABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO ;

      cdsDiagGestacaoNOVAPRENHEZ.OnSetText := nil;
      cdsDiagGestacaoPRENHEZ.OnValidate := nil;

      cdsDiagGestacaoNOVAPRENHEZ.AsString := _ST_STATUS_PRENHEZ_NAOPRENHE;

      cdsDiagGestacaoDATATOQUE.AsDateTime := FUltimoToque;
      cdsDiagGestacaoPRENHEZ.AsString := _ST_STATUS_PRENHEZ_PRENHE;

      cdsDiagGestacaoNOVAPRENHEZ.OnSetText := cdsDiagGestacaoNOVAPRENHEZSetText;
      cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate;
    end
    else
     begin
       cdsDiagGestacaoABORTOPARTO.Clear;
       cdsDiagGestacaoDATAABORTOPARTO.Clear;
     end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AbrirLactacao(
  DSEventos: TCustomClientDataSet);
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

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddBrinco(
                ABrinco: string ): Boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsDiagGestacao.Edit ;
         AddByQuickFields;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
      if AddByKey ( KeyAnimal{, ADataToque, ANomeVeterinario, Reexaminar} ) then
        AddByQuickFields;


end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddByKey(AKey: string): boolean;

var
    cds : TClientDataSet ;
    p : TParams ;
begin
    p := TParams.Create ;
    p.CreateParam( ftString,  'KCAD_FAZENDA',      ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftInteger, 'STATUS_DESCARTADO', ptInput).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
    p.CreateParam( ftInteger, 'DOADOR',            ptInput).asInteger := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
    p.CreateParam( ftString,  'KZOO_ANIMAL',       ptInput ).asString := AKey ;

    cds := nil ;
    try

       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, FSQLAddByKey{ _SELECT_ANIMAL_DIAGNOSTICO}, p ) ;


       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não possui evento de cobertura');


       with cds do
         begin
           cdsDiagGestacao.AppendData(cds.Data, True) ;
           cdsDiagGestacao.Locate('KZOO_ANIMAL_FEMEA',AKey,[]);
         end;


    finally
       cds.Free ;
       p.free ;
    end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddByQuickFields;
begin
  if not FQuickInput then
    Exit;

  if not (cdsDiagGestacao.State in [dsEdit, dsInsert])then
     cdsDiagGestacao.Edit;

  cdsDiagGestacaoNOVOTOQUE.AsDateTime := FQuickDataToque;

  if (HasEventoZootecnico) and (ValidPrenhezStatusReprodutivo) then
   begin

     if FQuickDiagnosticoGestacao = 'T' then
      begin
        cdsDiagGestacaoNOVAPRENHEZ.AsString := FQuickDiagnosticoGestacao;
        cdsDiagGestacaoNOVAPRENHEZ.Text := 'Prenhe';
      end
     else
     if FQuickDiagnosticoGestacao = 'F' then
      begin
        cdsDiagGestacaoNOVAPRENHEZ.AsString := FQuickDiagnosticoGestacao;
        cdsDiagGestacaoNOVAPRENHEZ.Text := 'Não prenhe';
      end
     else
      begin
        cdsDiagGestacaoNOVAPRENHEZ.AsString := FQuickDiagnosticoGestacao;
        cdsDiagGestacaoNOVAPRENHEZ.Text := '';
      end;


     if FUseQuickSexoCria and ( FQuickSexoCria >= 1) then
      cdsDiagGestacaoSEXO_CRIA.AsInteger := FQuickSexoCria;

   end;


  if FUseQuickDiagnosticoSanitario then
    cdsDiagGestacaoKZOO_DIAGNOSTICO.AsString := FQuickDiagnosticoSanitario;

  if FUseQuickProtocolo then
    cdsDiagGestacaoKZOO_PROTOCOLO.AsString   := FQuickProtocolo;

  if FUseQuickVeterinario then
   begin
     cdsDiagGestacaoKCAD_VETERINARIO.AsString := FQuickVeterinario;
     cdsDiagGestacaoNOMEVETERINARIO.AsString  := FQuickNomeVeterinario;
   end;

  ClearDataToqueIfIsEmpty;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddByQuickInput;
begin

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AplicarProtocolos(AAplicar: boolean);
var
  strAplicar : string ;
begin
   FAplicarProtocolo := AAplicar ;

   if FAplicarProtocolo then
     strAplicar := 'T'
   else
     strAplicar := 'F' ;

   with cdsDiagGestacao do
     try
        disableControls ;
        first ;
        while not eof  do
           begin
             if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> '')) then
               begin
                 edit ;
                 cdsDiagGestacaoPROTOCOLO_TOQUE.AsString := strAplicar ;
                 post;
               end;
             next ;
           end;
        first ;
     finally
        EnableControls ;
     end;
end;

end.

