unit UZoo_AtividadesPartosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesPartosDatamodule = class(T_dtmBASE)
    cdsAPartos: TClientDataSet;
    dspAPartos: TDataSetProvider;
    sqlAPartos: TTcSQLDataSet;
    sqlAPartosBRINCOFEMEA: TStringField;
    sqlAPartosNOMEFEMEA: TStringField;
    sqlAPartosDATACOBERTURA: TSQLTimeStampField;
    sqlAPartosLOTE: TStringField;
    cdsAPartosBRINCOFEMEA: TStringField;
    cdsAPartosNOMEFEMEA: TStringField;
    cdsAPartosDATACOBERTURA: TSQLTimeStampField;
    cdsAPartosLOTE: TStringField;
    cdsAPartosPREV_PARTO: TDateField;
    sqlAPartosNUMERO_LACTACAO: TIntegerField;
    cdsAPartosNUMERO_LACTACAO: TIntegerField;
    sqlAPartosBRINCOFEMEA_: TStringField;
    cdsAPartosBRINCOFEMEA_: TStringField;
    sqlAPartosTOURO: TStringField;
    cdsAPartosTOURO: TStringField;
    sqlAPartosKZOO_ANIMAL_FEMEA: TStringField;
    cdsAPartosKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAPartosBeforeOpen(DataSet: TDataSet);
    procedure cdsAPartosCalcFields(DataSet: TDataSet);
  private
    FAte: TDateTime;
    DiasPartoMultipara : integer ;
    DiasPartoPrimipara : integer ;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, Data.SQLTimSt, DateUtils, CLAg5Types,
    
    ClAg5ClientCommonTypes,
    ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TdtmZoo_AtividadesPartos }

procedure TZoo_AtividadesPartosDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesPartosDatamodule.cdsAPartosBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_AtividadesPartosDatamodule.cdsAPartosCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    if cdsAPartosNUMERO_LACTACAO.AsInteger > 1 then
       cdsAPartosPREV_PARTO.AsDateTime := cdsAPartosDATACOBERTURA.AsDateTime + DiasPartoMultipara
    else
       cdsAPartosPREV_PARTO.AsDateTime := cdsAPartosDATACOBERTURA.AsDateTime + DiasPartoPrimipara ;
end;

constructor TZoo_AtividadesPartosDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, DiasPartoPrimipara, DiasPartoMultipara ) ;
end;

procedure TZoo_AtividadesPartosDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesPartosDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsAPartos.Active then
     cdsAPartos.Close ;
  TCDSSuppl.Open ( cdsAPartos ) ;
end;

procedure TZoo_AtividadesPartosDatamodule.SetParams;
begin

  cdsAPartos.Params.ParamByName ( 'KCAD_FAZENDA' ).asString             := LoggedUser.DomainID ;
  cdsAPartos.Params.ParamByName ( 'DESCARTADA' ).AsInteger              := _ST_STATUS_FEMEA_DESCARTADO;
  cdsAPartos.Params.ParamByName ( 'DOADORA' ).AsInteger                 := _ST_TIPO_DOADOR_RECEPTOR_DOADOR;
  cdsAPartos.Params.ParamByName ( 'DIASPARAPARTO_MULTIPARA' ).AsInteger := DiasPartoMultipara ;
  cdsAPartos.Params.paramByName ( 'DATA'  ).asSQLTimeStamp              := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsAPartos.Params.ParamByName ( 'DIASPARAPARTO_PRIMIPARA' ).AsInteger := DiasPartoPrimipara ;

  if ParametrosFazenda( LoggedUser.DomainID ).ExibirPartoSemconfirmacao then
     cdsAPartos.Params.ParamByName ( 'PRENHEZ_NAO_CONFIRMADA' ).AsInteger := 1
  else
     cdsAPartos.Params.ParamByName ( 'PRENHEZ_NAO_CONFIRMADA' ).AsInteger := 0 ;



end;

end.
