unit UZoo_RelatorioProtocolosReprodutivosIATFDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, UDBZootecnico, CLAg5Types, SqlTimSt,
  UdtmSYS_BASE;

type
  TZoo_RelatorioProtocolosReprodutivosIATFDataModule = class(T_dtmBASE)
    sqlResultados: TTcSQLDataSet;
    dspResultados: TDataSetProvider;
    cdsResultados: TClientDataSet;
    sqlResultadosKZOO_PROTOCOLO: TStringField;
    sqlResultadosCODIGO: TStringField;
    sqlResultadosTIPOPROTOCOLO: TIntegerField;
    sqlResultadosNUMEROS_TRATAMENTOS: TLargeintField;
    sqlResultadosCOBERTURA_APOS_PROTOCOLO: TLargeintField;
    sqlResultadosCOBERTURA_COM_DIAGNOSTICO: TLargeintField;
    sqlResultadosPRENHEZES: TLargeintField;
    cdsResultadosKZOO_PROTOCOLO: TStringField;
    cdsResultadosCODIGO: TStringField;
    cdsResultadosTIPOPROTOCOLO: TIntegerField;
    cdsResultadosNUMEROS_TRATAMENTOS: TLargeintField;
    cdsResultadosCOBERTURA_APOS_PROTOCOLO: TLargeintField;
    cdsResultadosCOBERTURA_COM_DIAGNOSTICO: TLargeintField;
    cdsResultadosPRENHEZES: TLargeintField;
    sqlResultadosTIPO_REG: TIntegerField;
    cdsResultadosTIPO_REG: TIntegerField;
    cdsResultadosTAXA_CONCEPCAO: TFloatField;
    procedure cdsResultadosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FDataIni             : TDateTime;
    FDataFim             : TDateTime;
    procedure SetDataFim(const Value: TDateTime);
    procedure SetDataIni(const Value: TDateTime);
    procedure SetParams;
    procedure InsertTotais;
  public
    { Public declarations }
    property DataIni             : TDateTime read FDataIni              write SetDataIni;
    property DataFim             : TDateTime read FDataFim              write SetDataFim;
    procedure OpenTables ; override ;
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  UZoo_RelatorioTaxaConcepcaoDatamodule, ClAg5ClientZootecnicoCommonTypes, ClAg5ClientCommonTypes;

{ TZoo_RelatorioProtocolosReprodutivosIATFDataModule }

const
  DIAS_ENTRE_IATF1_E_IATF2 = 14;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.cdsResultadosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if cdsResultadosCOBERTURA_APOS_PROTOCOLO.AsInteger = 0 then
    cdsResultadosTAXA_CONCEPCAO.AsFloat := 0
  else
    cdsResultadosTAXA_CONCEPCAO.AsFloat := Round( (cdsResultadosPRENHEZES.AsInteger * 100)/ cdsResultadosCOBERTURA_COM_DIAGNOSTICO.AsInteger);

  if cdsResultadosTAXA_CONCEPCAO.AsFloat < 0 then
    cdsResultadosTAXA_CONCEPCAO.AsFloat := 0;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.InsertTotais;
var
  LNumeroTratamentosSoma,
  LCoberturaAposProtocoloSoma,
  LCoberturaComDiagnosticoSoma,
  LPrenhezesSoma,
  LTaxaConcepcao  : Integer;
begin
  if cdsResultados.IsEmpty then
    Exit;

  LNumeroTratamentosSoma       := StrToInt( TOperacoes.Retornar(cdsResultados,'NUMEROS_TRATAMENTOS',ftSomar) );
  LCoberturaAposProtocoloSoma  := StrToInt( TOperacoes.Retornar(cdsResultados,'COBERTURA_APOS_PROTOCOLO',ftSomar) );
  LCoberturaComDiagnosticoSoma := StrToInt( TOperacoes.Retornar(cdsResultados,'COBERTURA_COM_DIAGNOSTICO',ftSomar) );
  LPrenhezesSoma               := StrToInt( TOperacoes.Retornar(cdsResultados,'PRENHEZES',ftSomar) );

  if LCoberturaComDiagnosticoSoma = 0 then
    LTaxaConcepcao:= 0
  else
    LTaxaConcepcao := Round( ((LPrenhezesSoma*100)/LCoberturaComDiagnosticoSoma) );

  cdsResultados.Append;
  cdsResultadosTIPO_REG.AsInteger       := 2;
  cdsResultadosCODIGO.AsString          := 'Totais';
  cdsResultadosNUMEROS_TRATAMENTOS.AsInteger := LNumeroTratamentosSoma;
  cdsResultadosCOBERTURA_APOS_PROTOCOLO.AsInteger := LCoberturaAposProtocoloSoma;
  cdsResultadosCOBERTURA_COM_DIAGNOSTICO.AsInteger := LCoberturaComDiagnosticoSoma;
  cdsResultadosPRENHEZES.AsInteger := LPrenhezesSoma;
  cdsResultados.Post;

end;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.OpenTables;
begin
  SetParams;
  inherited;
  InsertTotais
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.SetDataFim(
  const Value: TDateTime);
begin
  FDataFim := Value;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.SetDataIni(
  const Value: TDateTime);
begin
  FDataIni := Value;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATFDataModule.SetParams;
var
  diasPrim, diasMulti : integer  ;
begin
  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_COBERTURA_EFEITO_PROTOCOLO, diasPrim, diasMulti ) ;

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
  cdsResultados.ParamByName( 'DATAINI'                          ).AsSQLTimeStamp :=  DateTimeToSqlTimesTamp(FDataIni);
  cdsResultados.ParamByName( 'DATAFIM'                          ).AsSQLTimeStamp :=  DateTimeToSqlTimesTamp(FDataFim);
  cdsResultados.ParamByName( 'DIAS_ENTRE_IATF1_E_IATF2'         ).AsInteger      :=  DIAS_ENTRE_IATF1_E_IATF2;
  cdsResultados.ParamByName( 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_PRIMIPARA' ).AsInteger      :=  diasPrim;
  cdsResultados.ParamByName( 'DIAS_ENTRE_PROTOCOLO_E_COBERTURA_MULTIPARA' ).AsInteger      :=  diasMulti;
  cdsResultados.ParamByName( 'TIPO_REPRODUTIVO'                 ).AsInteger      :=  _ST_TIPO_PROTOCOLO_REPRODUTIVO;
  cdsResultados.ParamByName( 'TIPO_IATF'                        ).AsInteger      :=  _ST_TIPO_PROTOCOLO_IATF;
end;

end.
