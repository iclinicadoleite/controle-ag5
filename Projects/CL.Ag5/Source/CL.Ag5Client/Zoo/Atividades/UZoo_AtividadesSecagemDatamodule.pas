unit UZoo_AtividadesSecagemDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesSecagemDatamodule = class(T_dtmBASE)
    cdsASecagens: TClientDataSet;
    dspASecagens: TDataSetProvider;
    sqlASecagens: TTcSQLDataSet;
    sqlASecagensBRINCOFEMEA: TStringField;
    sqlASecagensNOMEFEMEA: TStringField;
    sqlASecagensULTIMA_MONTA: TSQLTimeStampField;
    sqlASecagensLOTE: TStringField;
    sqlASecagensULTIMAPRODUCAO: TFloatField;
    sqlASecagensCCS: TIntegerField;
    cdsASecagensBRINCOFEMEA: TStringField;
    cdsASecagensNOMEFEMEA: TStringField;
    cdsASecagensULTIMA_MONTA: TSQLTimeStampField;
    cdsASecagensLOTE: TStringField;
    cdsASecagensULTIMAPRODUCAO: TFloatField;
    cdsASecagensCCS: TIntegerField;
    cdsASecagensDATA_PREVISTA: TDateField;
    sqlASecagensNUMERO_LACTACAO: TIntegerField;
    cdsASecagensNUMERO_LACTACAO: TIntegerField;
    sqlASecagensBRINCOFEMEA_: TStringField;
    cdsASecagensBRINCOFEMEA_: TStringField;
    sqlASecagensKZOO_ANIMAL_FEMEA: TStringField;
    cdsASecagensKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsASecagensBeforeOpen(DataSet: TDataSet);
    procedure cdsASecagensCalcFields(DataSet: TDataSet);
  private
    FAte: TDateTime;
    SecagemPrimipara, SecagemMultipara,
    PrevPartoPrim,    PrevPartoMult : integer ;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property Ate : TDateTime  read FAte write SetAte;
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, Data.SQLTimSt, DateUtils , CLAg5Types,
     ClAg5ClientZootecnicoCommonTypes;

{$R *.dfm}

{ TdtmZoo_AtividadesSecagem }

procedure TZoo_AtividadesSecagemDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesSecagemDatamodule.cdsASecagensBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_AtividadesSecagemDatamodule.cdsASecagensCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    if cdsASecagensNUMERO_LACTACAO.AsInteger > 1 then
      cdsASecagensDATA_PREVISTA.AsDateTime := cdsASecagensULTIMA_MONTA.AsDateTime + secagemMultipara
    else
      cdsASecagensDATA_PREVISTA.AsDateTime := cdsASecagensULTIMA_MONTA.AsDateTime + secagemPrimipara ;
end;

constructor TZoo_AtividadesSecagemDatamodule.Create(AOwner: TComponent);
begin
  inherited;

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, PrevPartoPrim, PrevPartoMult ) ;
  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, SecagemPrimipara, SecagemMultipara ) ;

  SecagemPrimipara := PrevPartoPrim - SecagemPrimipara ;
  SecagemMultipara := PrevPartoMult - SecagemMultipara ;
end;

procedure TZoo_AtividadesSecagemDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesSecagemDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsASecagens.Active then
     cdsASecagens.Close ;
  TCDSSuppl.Open ( cdsASecagens ) ;
end;

procedure TZoo_AtividadesSecagemDatamodule.SetParams;
begin

  cdsASecagens.Params.ParamByName ( 'KCAD_FAZENDA' ).asString          := LoggedUser.DomainID ;
  cdsASecagens.Params.paramByName ( 'VL'           ).asInteger         := _ST_STATUS_FEMEA_VACALACTACAO ;
  cdsASecagens.Params.paramByName ( 'DIASSECAGEM_MULTIPARA').asInteger := secagemMultipara ;
  cdsASecagens.Params.paramByName ( 'DATAFIM'      ).asSQLTimeStamp    := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsASecagens.Params.paramByName ( 'DIASSECAGEM_PRIMIPARA').asInteger := secagemPrimipara ;
end;

end.
