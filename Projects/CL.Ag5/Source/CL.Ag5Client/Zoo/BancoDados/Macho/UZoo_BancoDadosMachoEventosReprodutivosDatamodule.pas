  unit UZoo_BancoDadosMachoEventosReprodutivosDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Provider;

type
  TZoo_BancoDadosMachoEventosReprodutivosDatamodule = class(T_dtmBASE)
    cdsEventosZoo: TClientDataSet;
    cdsEventosZooKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsEventosZooKZOO_ANIMAL_FEMEA: TStringField;
    cdsEventosZooKZOO_ANIMAL_MACHO: TStringField;
    cdsEventosZooDATAEVENTO: TSQLTimeStampField;
    cdsEventosZooDOSES: TIntegerField;
    cdsEventosZooMUCO: TIntegerField;
    cdsEventosZooDESC_EVENTO: TStringField;
    cdsEventosZooDESC_MUCO: TStringField;
    cdsEventosZooTIPOEVENTO: TIntegerField;
    cdsEventosZooPRENHEZ: TStringField;
    sqlEventosZoo: TTcSQLDataSet;
    sqlEventosZooKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlEventosZooKZOO_ANIMAL_FEMEA: TStringField;
    sqlEventosZooKZOO_ANIMAL_MACHO: TStringField;
    sqlEventosZooDATAEVENTO: TSQLTimeStampField;
    sqlEventosZooDOSES: TIntegerField;
    sqlEventosZooMUCO: TIntegerField;
    sqlEventosZooTIPOEVENTO: TIntegerField;
    sqlEventosZooPRENHEZ: TStringField;
    dspEventosZoo: TDataSetProvider;
    sqlEventosZooABORTOPARTO: TIntegerField;
    sqlEventosZooEMBRIOESCOLETADOS: TIntegerField;
    cdsEventosZooABORTOPARTO: TIntegerField;
    cdsEventosZooDATAABORTOPARTO: TSQLTimeStampField;
    cdsEventosZooEMBRIOESCOLETADOS: TIntegerField;
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
    sqlEventosZooDATAABORTOPARTO: TSQLTimeStampField;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    sqlEventosZooNOMEFEMEA: TStringField;
    cdsEventosZooNOMEFEMEA: TStringField;
    cdsEventosZooINTERVALO: TIntegerField;
    cdsEventosZooDESC_PARTOABORTO: TStringField;
    procedure _DataModuleCreate(Sender: TObject);
  private
    FMasterSource: TDataSource;
    FDiasGetacaoPrimipara, FDiasGetacaoMultipara : integer ;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, CLAg5Types,
     ClAg5ClientZootecnicoCommonTypes,
     CDSSuppl ;

{$R *.dfm}

{ TdtmZoo_EventosReprodutivosAnimal }

procedure TZoo_BancoDadosMachoEventosReprodutivosDatamodule.OpenTables;
begin
   TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_EVENTO_ZOO,  cdsTipoEvento   );
   TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_MUCO,        cdsTipoMuco     );
   TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_PARTOABORTO, cdsTipoPartoAborto   );
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;

   TCDSSuppl.SetMasterSource(cdsEventosZoo, 'KZOO_ANIMAL_MACHO', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsEventosZoo ) ;
end;

procedure TZoo_BancoDadosMachoEventosReprodutivosDatamodule.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TZoo_BancoDadosMachoEventosReprodutivosDatamodule._DataModuleCreate(Sender: TObject);
begin
  inherited;
//***
end;

end.
