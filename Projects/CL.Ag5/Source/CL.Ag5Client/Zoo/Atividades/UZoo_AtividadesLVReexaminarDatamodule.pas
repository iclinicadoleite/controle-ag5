unit UZoo_AtividadesLVReexaminarDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVReexaminarDatamodule = class(T_dtmBASE)
    cdsReexaminarToque: TClientDataSet;
    dspReexaminarToque: TDataSetProvider;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlReexaminarToque: TTcSQLDataSet;
    sqlReexaminarToqueBRINCOFEMEA: TStringField;
    sqlReexaminarToqueNOMEFEMEA: TStringField;
    sqlReexaminarToqueLOTE: TStringField;
    sqlReexaminarToqueTIPOEVENTO: TIntegerField;
    sqlReexaminarToqueDATAEVENTO: TSQLTimeStampField;
    sqlReexaminarToqueDATATOQUE: TSQLTimeStampField;
    sqlReexaminarToqueRESPONSAVEL: TStringField;
    cdsReexaminarToqueBRINCOFEMEA: TStringField;
    cdsReexaminarToqueNOMEFEMEA: TStringField;
    cdsReexaminarToqueLOTE: TStringField;
    cdsReexaminarToqueTIPOEVENTO: TIntegerField;
    cdsReexaminarToqueDATAEVENTO: TSQLTimeStampField;
    cdsReexaminarToqueDATATOQUE: TSQLTimeStampField;
    cdsReexaminarToqueRESPONSAVEL: TStringField;
    cdsReexaminarToqueDIAS_ULTEVENTO: TIntegerField;
    cdsReexaminarToqueDIAS_POSTOQUE: TIntegerField;
    cdsReexaminarToqueDESC_EVENTO: TStringField;
    sqlReexaminarToqueBRINCOFEMEA_: TStringField;
    cdsReexaminarToqueBRINCOFEMEA_: TStringField;
    sqlReexaminarToqueKZOO_ANIMAL_FEMEA: TStringField;
    cdsReexaminarToqueKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsReexaminarToqueBeforeOpen(DataSet: TDataSet);
    procedure cdsReexaminarToqueCalcFields(DataSet: TDataSet);
  private
    FAte: TDateTime;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

implementation

uses CDSSuppl,
     Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_AtividadesLVReexaminarDatamodule.cdsReexaminarToqueBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesLVReexaminarDatamodule.cdsReexaminarToqueCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    begin
      cdsReexaminarToqueDIAS_ULTEVENTO.AsInteger := DaysBetween( cdsReexaminarToqueDATAEVENTO.AsDateTime, Date );
      cdsReexaminarToqueDIAS_POSTOQUE.AsInteger  := DaysBetween( cdsReexaminarToqueDATATOQUE.AsDateTime, Date );
    end;
end;

constructor TZoo_AtividadesLVReexaminarDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
end;

procedure TZoo_AtividadesLVReexaminarDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsReexaminarToque.Active then
     cdsReexaminarToque.Close ;
  TCDSSuppl.Open ( cdsReexaminarToque ) ;
end;

procedure TZoo_AtividadesLVReexaminarDatamodule.SetParams;
var
  diasPrim, diasMulti : integer  ;
begin

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_REEXAMINAR_PALPACAO, diasPrim, diasMulti ) ;

  cdsReexaminarToque.Params.ParamByName ( 'KCAD_FAZENDA' ).asString               := LoggedUser.DomainID ;
  cdsReexaminarToque.Params.ParamByName ( 'DESCARTADA' ).AsInteger                := _ST_STATUS_FEMEA_DESCARTADO;
  cdsReexaminarToque.Params.paramByName ( 'DIASREEXAMINAR_MULTIPARA'  ).AsInteger := diasMulti ;
  cdsReexaminarToque.Params.paramByName ( 'DATAINICIO'  ).asSQLTimeStamp          := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsReexaminarToque.Params.paramByName ( 'DIASREEXAMINAR_PRIMIPARA'  ).AsInteger := diasPrim ;

end;

end.

