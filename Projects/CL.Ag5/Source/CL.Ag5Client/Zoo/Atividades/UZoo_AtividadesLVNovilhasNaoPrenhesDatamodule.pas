unit UZoo_AtividadesLVNovilhasNaoPrenhesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule = class(T_dtmBASE)
    cdsANovilhasNaoPrenhes: TClientDataSet;
    dspANovilhasNaoPrenhes: TDataSetProvider;
    sqlANovilhasNaoPrenhes: TTcSQLDataSet;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlANovilhasNaoPrenhesBRINCOFEMEA: TStringField;
    sqlANovilhasNaoPrenhesNOMEFEMEA: TStringField;
    sqlANovilhasNaoPrenhesLOTE: TStringField;
    sqlANovilhasNaoPrenhesTIPOEVENTO: TIntegerField;
    sqlANovilhasNaoPrenhesDATAEVENTO: TSQLTimeStampField;
    sqlANovilhasNaoPrenhesULTIMO_DIAGNOSTICO: TStringField;
    sqlANovilhasNaoPrenhesNOMEFUNCIONARIO: TStringField;
    cdsANovilhasNaoPrenhesBRINCOFEMEA: TStringField;
    cdsANovilhasNaoPrenhesNOMEFEMEA: TStringField;
    cdsANovilhasNaoPrenhesLOTE: TStringField;
    cdsANovilhasNaoPrenhesTIPOEVENTO: TIntegerField;
    cdsANovilhasNaoPrenhesDATAEVENTO: TSQLTimeStampField;
    cdsANovilhasNaoPrenhesULTIMO_DIAGNOSTICO: TStringField;
    cdsANovilhasNaoPrenhesNOMEFUNCIONARIO: TStringField;
    cdsANovilhasNaoPrenhesDESC_EVENTO: TStringField;
    cdsANovilhasNaoPrenhesINTERVALO: TIntegerField;
    sqlANovilhasNaoPrenhesNASCIMENTO: TSQLTimeStampField;
    cdsANovilhasNaoPrenhesNASCIMENTO: TSQLTimeStampField;
    cdsANovilhasNaoPrenhesIDADE: TStringField;
    sqlANovilhasNaoPrenhesPESO: TIntegerField;
    cdsANovilhasNaoPrenhesPESO: TIntegerField;
    sqlANovilhasNaoPrenhesBRINCOFEMEA_: TStringField;
    cdsANovilhasNaoPrenhesBRINCOFEMEA_: TStringField;
    sqlANovilhasNaoPrenhesKZOO_ANIMAL_FEMEA: TStringField;
    cdsANovilhasNaoPrenhesKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsANovilhasNaoPrenhesBeforeOpen(DataSet: TDataSet);
    procedure cdsANovilhasNaoPrenhesCalcFields(DataSet: TDataSet);
  private
    FAte: TDateTime;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    function IdadeAnoMes ( Intervalo : integer ) : String;
    { Private declarations }
  public
    { Public declarations }
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

var
  Zoo_AtividadesLVNovilhasNaoPrenhesDatamodule: TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule;

implementation

uses CDSSuppl, Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.cdsANovilhasNaoPrenhesBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.cdsANovilhasNaoPrenhesCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    begin
      if cdsANovilhasNaoPrenhesNASCIMENTO.IsNull then
        cdsANovilhasNaoPrenhesIDADE.Clear
      else
        cdsANovilhasNaoPrenhesIDADE.AsString := IdadeAnoMes(MonthsBetween(Date,cdsANovilhasNaoPrenhesNASCIMENTO.AsDateTime));

      if cdsANovilhasNaoPrenhesTIPOEVENTO.IsNull then
        cdsANovilhasNaoPrenhesINTERVALO.AsInteger := 0
      else
        cdsANovilhasNaoPrenhesINTERVALO.AsInteger := DaysBetween( cdsANovilhasNaoPrenhesDATAEVENTO.AsDateTime, Date );
    end;
end;

constructor TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
end;

function TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.IdadeAnoMes(
  Intervalo: integer): String;
var
  Ano, Mes : Integer;
begin
  Ano := 0 ;
  Mes := 0 ;

  Ano := Trunc (Intervalo / 12);
  Mes := (Intervalo mod 12);

  Result := IntToStr(Ano) + '/' + IntToStr(Mes) ;
end;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsANovilhasNaoPrenhes.Active then
     cdsANovilhasNaoPrenhes.Close ;
  TCDSSuppl.Open ( cdsANovilhasNaoPrenhes ) ;
end;

procedure TZoo_AtividadesLVNovilhasNaoPrenhesDatamodule.SetParams;
var
  diasPrim, diasMulti, idadeCobertura : integer  ;
begin

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, diasPrim, diasMulti ) ;
  idadeCobertura := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_SEM_COBERTURA ) ;

  cdsANovilhasNaoPrenhes.Params.ParamByName ( 'KCAD_FAZENDA' ).asString                     := LoggedUser.DomainID ;
  cdsANovilhasNaoPrenhes.Params.paramByName ( 'NOVILHA'  ).AsInteger                        := _ST_STATUS_FEMEA_NOVILHA ;
  cdsANovilhasNaoPrenhes.Params.paramByName ( 'DIAS_CONFIRMAR_PRENHEZ_PRIMIPARA').AsInteger := diasPrim ;
  cdsANovilhasNaoPrenhes.Params.paramByName ( 'DATAFIM'  ).asSQLTimeStamp                   := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsANovilhasNaoPrenhes.Params.paramByName ( 'IDADEMAXIMA_SEMCOBERTURA').AsInteger         := idadeCobertura ;
end;

end.
