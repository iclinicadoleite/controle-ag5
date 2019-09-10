unit UZoo_RelatorioEventosReprodutivosDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, UDBZootecnico, CLAg5Types,
  UdtmSYS_BASE;

type
  TZoo_RelatorioEventosReprodutivosDataModule = class(T_dtmBASE)
    sqlResultados: TTcSQLDataSet;
    dspResultados: TDataSetProvider;
    cdsResultados: TClientDataSet;
    sqlResultadosKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlResultadosKZOO_ANIMAL_FEMEA: TStringField;
    sqlResultadosBRINCO_FEMEA: TStringField;
    sqlResultadosNOME_FEMEA: TStringField;
    sqlResultadosDATAEVENTO: TSQLTimeStampField;
    sqlResultadosTIPOEVENTO: TIntegerField;
    sqlResultadosDESC_TIPOEVENTO: TStringField;
    sqlResultadosKZOO_ANIMAL_MACHO: TStringField;
    sqlResultadosBRINCO_MACHO: TStringField;
    sqlResultadosNOME_MACHO: TStringField;
    sqlResultadosKCAD_FUNCIONARIO: TStringField;
    sqlResultadosNOMEFUNCIONARIO: TStringField;
    sqlResultadosDATATOQUE: TSQLTimeStampField;
    sqlResultadosPRENHEZ: TStringField;
    sqlResultadosIATF: TStringField;
    sqlResultadosKZOO_PROTOCOLO_IATF: TStringField;
    sqlResultadosDESC_PROTOCOLO_IATF: TStringField;
    sqlResultadosABORTOPARTO: TIntegerField;
    sqlResultadosTIPO_ABORTOPARTO: TStringField;
    sqlResultadosDATAABORTOPARTO: TSQLTimeStampField;
    sqlResultadosCRIAS: TIntegerField;
    sqlResultadosSEXO_CRIAS: TStringField;
    sqlResultadosNATIMORTO: TStringField;
    cdsResultadosKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsResultadosKZOO_ANIMAL_FEMEA: TStringField;
    cdsResultadosBRINCO_FEMEA: TStringField;
    cdsResultadosNOME_FEMEA: TStringField;
    cdsResultadosDATAEVENTO: TSQLTimeStampField;
    cdsResultadosTIPOEVENTO: TIntegerField;
    cdsResultadosDESC_TIPOEVENTO: TStringField;
    cdsResultadosKZOO_ANIMAL_MACHO: TStringField;
    cdsResultadosBRINCO_MACHO: TStringField;
    cdsResultadosNOME_MACHO: TStringField;
    cdsResultadosKCAD_FUNCIONARIO: TStringField;
    cdsResultadosNOMEFUNCIONARIO: TStringField;
    cdsResultadosDATATOQUE: TSQLTimeStampField;
    cdsResultadosPRENHEZ: TStringField;
    cdsResultadosIATF: TStringField;
    cdsResultadosKZOO_PROTOCOLO_IATF: TStringField;
    cdsResultadosDESC_PROTOCOLO_IATF: TStringField;
    cdsResultadosABORTOPARTO: TIntegerField;
    cdsResultadosTIPO_ABORTOPARTO: TStringField;
    cdsResultadosDATAABORTOPARTO: TSQLTimeStampField;
    cdsResultadosCRIAS: TIntegerField;
    cdsResultadosSEXO_CRIAS: TStringField;
    cdsResultadosNATIMORTO: TStringField;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlResultadosQTDE_COBERTURA: TIntegerField;
    cdsResultadosQTDE_COBERTURA: TIntegerField;
    procedure cdsResultadosBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FDataIni             : TDateTime;
    FDataFim             : TDateTime;
    FPesqDataOcorrencia  : String;
    FPesqTipoAborto      : String;
    FAbortoParto         : Integer;
    FPesqTipoEvento      : String;
    FTipoEvento          : Integer;
    procedure SetParams;
    procedure SetAbortoParto(const Value: Integer);
    procedure SetDataFim(const Value: TDateTime);
    procedure SetDataIni(const Value: TDateTime);
    procedure SetPesqDataOcorrencia(const Value: String);
    procedure SetPesqTipoAborto(const Value: String);
    procedure SetPesqTipoEvento(const Value: String);
    procedure SetTipoEvento(const Value: Integer);
  public
    { Public declarations }
    property DataIni             : TDateTime read FDataIni              write SetDataIni;
    property DataFim             : TDateTime read FDataFim              write SetDataFim;
    property PesqDataOcorrencia  : String    read FPesqDataOcorrencia   write SetPesqDataOcorrencia;
    property PesqTipoAborto      : String    read FPesqTipoAborto       write SetPesqTipoAborto;
    property AbortoParto         : Integer   read FAbortoParto          write SetAbortoParto;
    property PesqTipoEvento      : String    read FPesqTipoEvento       write SetPesqTipoEvento;
    property TipoEvento          : Integer   read FTipoEvento          write SetTipoEvento;
    procedure OpenTables;
    destructor Destroy ; override ;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Data.SQLTimSt, System.DateUtils, CDSSuppl, ClAg5ClientCommonTypes ;

{ TZoo_RelatorioEventosReprodutivosDataModule }

procedure TZoo_RelatorioEventosReprodutivosDataModule.cdsResultadosBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.DataModuleCreate(
  Sender: TObject);
begin
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_PARTOABORTO,  cdsTipoPartoAborto   ); // utilizado para descricao
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_EVENTO_ZOO,  cdsTipoEvento   ); // utilizado para descricao

end;

destructor TZoo_RelatorioEventosReprodutivosDataModule.Destroy;
begin
  TcdsSuppl.PersistIndexes( cdsResultados );
  inherited;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.OpenTables;
begin
  TCDSSuppl.Open ( cdsResultados ) ;
end;


procedure TZoo_RelatorioEventosReprodutivosDataModule.SetAbortoParto(
  const Value: Integer);
begin
  FAbortoParto := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetDataFim(
  const Value: TDateTime);
begin
  FDataFim := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetDataIni(
  const Value: TDateTime);
begin
  FDataIni := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetParams;
begin

  if ParametrosFazenda( LoggedUser.DomainID ).ConsiderarNaoPrenheReinseminada then
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_REINSEMINADA' ).asString := 'T'
  else
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_REINSEMINADA' ).asString := 'F';

  if ParametrosFazenda( LoggedUser.DomainID ).ConsiderarNaoPrenheDescartada then
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_DESCARTADA' ).asString := 'T'
  else
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_DESCARTADA' ).asString := 'F';

  cdsResultados.Params.ParamByName ( 'EVENTO_CIO' ).AsInteger := _ST_TIPO_EVENTO_ZOO_CIO;
  cdsResultados.Params.ParamByName ( 'ST_DESCARTADA' ).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;

  cdsResultados.ParamByName( 'DATAINI'             ).AsSQLTimeStamp :=  DateTimeToSqlTimesTamp(FDataIni);
  cdsResultados.ParamByName( 'DATAFIM'             ).AsSQLTimeStamp :=  DateTimeToSqlTimesTamp(FDataFim);
  cdsResultados.ParamByName( 'PESQDATAOCORRENCIA'  ).AsString       :=  FPesqDataOcorrencia;
  cdsResultados.ParamByName( 'PESQTIPOABORTOPARTO' ).AsString       :=  FPesqTipoAborto;
  cdsResultados.ParamByName( 'ABORTOPARTO'         ).AsInteger      :=  FAbortoParto;
  cdsResultados.ParamByName( 'PESQTIPOEVENTO'      ).AsString       :=  FPesqTipoEvento;
  cdsResultados.ParamByName( 'TIPOEVENTO'          ).AsInteger      :=  FTipoEvento;
end;


procedure TZoo_RelatorioEventosReprodutivosDataModule.SetPesqDataOcorrencia(
  const Value: String);
begin
  FPesqDataOcorrencia := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetPesqTipoAborto(
  const Value: String);
begin
  FPesqTipoAborto := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetPesqTipoEvento(
  const Value: String);
begin
  FPesqTipoEvento := Value;
end;

procedure TZoo_RelatorioEventosReprodutivosDataModule.SetTipoEvento(
  const Value: Integer);
begin
  FTipoEvento := Value;
end;

end.
