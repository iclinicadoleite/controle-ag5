unit UZoo_AtividadesLVRecemParidosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVRecemParidosDatamodule = class(T_dtmBASE)
    cdsARecemParidos: TClientDataSet;
    dspARecemParidos: TDataSetProvider;
    sqlARecemParidos: TTcSQLDataSet;
    cdsARecemParidosBRINCOFEMEA: TStringField;
    cdsARecemParidosNOMEFEMEA: TStringField;
    cdsARecemParidosLOTE: TStringField;
    cdsARecemParidosTIPOEVENTO: TIntegerField;
    cdsARecemParidosDATAEVENTO: TSQLTimeStampField;
    cdsARecemParidosNOMEFUNCIONARIO: TStringField;
    cdsARecemParidosULTIMO_DIAGNOSTICO: TStringField;
    cdsARecemParidosULTIMO_PROTOCOLO: TStringField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsARecemParidosDESC_EVENTO: TStringField;
    sqlARecemParidosBRINCOFEMEA: TStringField;
    sqlARecemParidosNOMEFEMEA: TStringField;
    sqlARecemParidosDATAEVENTO: TSQLTimeStampField;
    sqlARecemParidosTIPOEVENTO: TIntegerField;
    sqlARecemParidosLOTE: TStringField;
    sqlARecemParidosNOMEFUNCIONARIO: TStringField;
    sqlARecemParidosULTIMO_DIAGNOSTICO: TStringField;
    sqlARecemParidosULTIMO_PROTOCOLO: TStringField;
    sqlARecemParidosBRINCOFEMEA_: TStringField;
    cdsARecemParidosBRINCOFEMEA_: TStringField;
    sqlARecemParidosKZOO_ANIMAL_FEMEA: TStringField;
    cdsARecemParidosKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsARecemParidosBeforeOpen(DataSet: TDataSet);
  private
    FAte: TDateTime;
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

var
  Zoo_AtividadesLVRecemParidosDatamodule: TZoo_AtividadesLVRecemParidosDatamodule;

implementation

uses CDSSuppl,
     CLAg5Types, UDBZootecnico, Data.SQLTimSt, Exceptions, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_AtividadesLVRecemParidosDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesLVRecemParidosDatamodule.cdsARecemParidosBeforeOpen(DataSet: TDataSet);
begin
//  inherited;
  SetParams ;
end;

constructor TZoo_AtividadesLVRecemParidosDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
end;

procedure TZoo_AtividadesLVRecemParidosDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesLVRecemParidosDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsARecemParidos.Active then
     cdsARecemParidos.Close ;
  TCDSSuppl.Open ( cdsARecemParidos ) ;
end;

procedure TZoo_AtividadesLVRecemParidosDatamodule.SetParams;
var
  diasPrim, diasMulti : integer  ;
begin

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DEL_MAX_RECEM_PARIDA, diasPrim, diasMulti ) ;

  cdsARecemParidos.Params.ParamByName ( 'KCAD_FAZENDA' ).asString       := LoggedUser.DomainID ;
  cdsARecemParidos.Params.paramByName ( 'DESCARTADA' ).asInteger        := _ST_STATUS_FEMEA_DESCARTADO ;
  cdsARecemParidos.Params.paramByName ( 'MAX_DEL_PRIMIPARA' ).asInteger := diasPrim  + 1 ; //EV 1331 - 256 - considerar incluisive o dia exato
  cdsARecemParidos.Params.paramByName ( 'MAX_DEL_MULTIPARA' ).asInteger := diasMulti + 1 ; //EV 1331 - 256 - considerar incluisive o dia exato
  cdsARecemParidos.Params.paramByName ( 'DATAINICIO'  ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
end;

end.
