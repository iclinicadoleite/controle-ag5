unit UZoo_AtividadesCiosCoberturasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesCiosCoberturasDatamodule = class(T_dtmBASE)
    cdsACioCobertura: TClientDataSet;
    dspACiosCobertura: TDataSetProvider;
    sqlACiosCobertura: TTcSQLDataSet;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsAbortoParto: TClientDataSet;
    cdsAbortoPartoTIPO: TStringField;
    cdsAbortoPartoVALOR: TStringField;
    cdsAbortoPartoDESCRICAO: TStringField;
    cdsAbortoPartoORDEM: TIntegerField;
    sqlACiosCoberturaBRINCOFEMEA: TStringField;
    sqlACiosCoberturaNOMEFEMEA: TStringField;
    sqlACiosCoberturaABORTOPARTO: TIntegerField;
    sqlACiosCoberturaTIPOEVENTO: TIntegerField;
    sqlACiosCoberturaDATA_EVENTO: TSQLTimeStampField;
    sqlACiosCoberturaDIAS_EVENTO: TLargeintField;
    sqlACiosCoberturaULTIMA_LACTACAO: TSQLTimeStampField;
    sqlACiosCoberturaNUMERO_MONTA: TIntegerField;
    sqlACiosCoberturaULTIMO_CIO: TSQLTimeStampField;
    sqlACiosCoberturaDPP: TLargeintField;
    sqlACiosCoberturaPREVISAO_CIO: TSQLTimeStampField;
    sqlACiosCoberturaTOURO_1: TStringField;
    sqlACiosCoberturaTOURO_2: TStringField;
    sqlACiosCoberturaLOTE: TStringField;
    cdsACioCoberturaBRINCOFEMEA: TStringField;
    cdsACioCoberturaNOMEFEMEA: TStringField;
    cdsACioCoberturaABORTOPARTO: TIntegerField;
    cdsACioCoberturaTIPOEVENTO: TIntegerField;
    cdsACioCoberturaDATA_EVENTO: TSQLTimeStampField;
    cdsACioCoberturaDIAS_EVENTO: TLargeintField;
    cdsACioCoberturaULTIMA_LACTACAO: TSQLTimeStampField;
    cdsACioCoberturaNUMERO_MONTA: TIntegerField;
    cdsACioCoberturaULTIMO_CIO: TSQLTimeStampField;
    cdsACioCoberturaDPP: TLargeintField;
    cdsACioCoberturaPREVISAO_CIO: TSQLTimeStampField;
    cdsACioCoberturaTOURO_1: TStringField;
    cdsACioCoberturaTOURO_2: TStringField;
    cdsACioCoberturaLOTE: TStringField;
    cdsACioCoberturaDESC_EVENTO: TStringField;
    sqlACiosCoberturaBRINCOFEMEA_: TStringField;
    cdsACioCoberturaBRINCOFEMEA_: TStringField;
    procedure cdsACioCoberturaBeforeOpen(DataSet: TDataSet);
    procedure cdsACioCoberturaCalcFields(DataSet: TDataSet);
  private
    FAte   : TDateTime;
    { Private declarations }
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

implementation

uses CDSSuppl, Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils,
      ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TdtmZoo_AtividadesCiosCoberturas }

procedure TZoo_AtividadesCiosCoberturasDatamodule.ApplyUpdates;
begin
// nao aplica atualizacoes
end;

procedure TZoo_AtividadesCiosCoberturasDatamodule.cdsACioCoberturaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_AtividadesCiosCoberturasDatamodule.cdsACioCoberturaCalcFields(DataSet: TDataSet);
begin
//  if DataSet.State in [dsInternalCalc] then
    if not ( cdsACioCoberturaABORTOPARTO.IsNull )
     and (cdsAbortoParto.Locate( 'TIPO;VALOR', VarArrayOf( [_ST_TIPO_PARTOABORTO, cdsACioCoberturaABORTOPARTO.AsInteger] ), [] )) then
       cdsACioCoberturaDESC_EVENTO.AsString := cdsAbortoPartoDESCRICAO.AsString;

    if ( cdsACioCoberturaABORTOPARTO.IsNull ) and not ( cdsACioCoberturaTIPOEVENTO.IsNull )
     and (cdsTipoEvento.Locate( 'TIPO;VALOR', VarArrayOf( [_ST_TIPO_EVENTO_ZOO, cdsACioCoberturaTIPOEVENTO.AsInteger] ), [] )) then
       cdsACioCoberturaDESC_EVENTO.AsString := cdsTipoEventoDESCRICAO.AsString;
end;

constructor TZoo_AtividadesCiosCoberturasDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_PARTOABORTO, cdsAbortoParto );
end;

procedure TZoo_AtividadesCiosCoberturasDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesCiosCoberturasDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsACioCobertura.Active then
     cdsACioCobertura.Close ;
  TCDSSuppl.Open ( cdsACioCobertura ) ;
end;

procedure TZoo_AtividadesCiosCoberturasDatamodule.SetParams;
var
  diasPrim, diasMulti, idadeCio, pesoCio : integer  ;
begin
  idadeCio := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_OBS_CIO ) ;
  pesoCio  := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_PESO_OBS_CIO ) ;
  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_POS_PARTO_INSEMINAR, diasPrim, diasMulti ) ;

  cdsACioCobertura.Params.ParamByName ( 'KCAD_FAZENDA' ).asString             := LoggedUser.DomainID ;
  cdsACioCobertura.Params.paramByName ( 'DESCARTADA' ).asInteger              := _ST_STATUS_FEMEA_DESCARTADO ;
//  cdsACioCobertura.Params.paramByName ( 'DOADORA' ).asInteger                 := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
  cdsACioCobertura.Params.paramByName ( 'RECEPTORA' ).asInteger               := _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ;
  cdsACioCobertura.Params.paramByName ( 'NOVILHA'  ).asInteger                := _ST_STATUS_FEMEA_NOVILHA             ;
  cdsACioCobertura.Params.paramByName ( 'IDADE_OBS_CIO' ).asInteger           := idadeCio  ;
  cdsACioCobertura.Params.paramByName ( 'DATAFIM'  ).asSQLTimeStamp           := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsACioCobertura.Params.paramByName ( 'PESO_OBS_CIO'  ).asInteger           := pesoCio   ;
  cdsACioCobertura.Params.paramByName ( 'DPP_INSEMINAR_PRIMIPARA' ).asInteger := diasPrim ;
  cdsACioCobertura.Params.paramByName ( 'DPP_INSEMINAR_MULTIPARA' ).asInteger := diasMulti ;
  cdsACioCobertura.Params.paramByName ( 'DATAINI'  ).asSQLTimeStamp           := DateTimeToSQLTimeStamp ( StartOfTheDay( Date ) ) ;

end;

end.



