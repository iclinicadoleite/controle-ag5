unit UZoo_AtividadesDesmameDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesDesmameDatamodule = class(T_dtmBASE)
    cdsADesmame: TClientDataSet;
    dspADesmame: TDataSetProvider;
    sqlADesmame: TTcSQLDataSet;
    sqlADesmameBRINCOFEMEA: TStringField;
    sqlADesmameNOMEFEMEA: TStringField;
    sqlADesmameLOTE: TStringField;
    sqlADesmameIDADE: TLargeintField;
    sqlADesmamePESO: TIntegerField;
    cdsADesmameBRINCOFEMEA: TStringField;
    cdsADesmameNOMEFEMEA: TStringField;
    cdsADesmameLOTE: TStringField;
    cdsADesmameIDADE: TLargeintField;
    cdsADesmamePESO: TIntegerField;
    sqlADesmameBRINCOFEMEA_: TStringField;
    cdsADesmameBRINCOFEMEA_: TStringField;
    cdsADesmameKZOO_ANIMAL_FEMEA: TStringField;
    sqlADesmameKZOO_ANIMAL_FEMEA: TStringField;
    sqlADesmamePESO_NASCIMENTO: TIntegerField;
    cdsADesmamePESO_NASCIMENTO: TIntegerField;
    procedure cdsADesmameBeforeOpen(DataSet: TDataSet);
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
  end;


implementation

uses CDSSuppl, Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TZoo_AtividadesDesmameDatamodule }

procedure TZoo_AtividadesDesmameDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesDesmameDatamodule.cdsADesmameBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesDesmameDatamodule.OpenTables;
begin
  Inherited ;
end;

procedure TZoo_AtividadesDesmameDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsADesmame.Active then
     cdsADesmame.Close ;
  TCDSSuppl.Open ( cdsADesmame ) ;
end;

procedure TZoo_AtividadesDesmameDatamodule.SetParams;
var
  idadeDesmame, pesoDesmame : integer  ;
begin

  idadeDesmame := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_DESMAME ) ;
  pesoDesmame  := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_PESO_DESMAME ) ;

  cdsADesmame.Params.ParamByName ( 'KCAD_FAZENDA' ).asString   := LoggedUser.DomainID ;
  cdsADesmame.Params.ParamByName ( 'BEZERRA' ).AsInteger       := _ST_STATUS_FEMEA_BEZERRO ;
  cdsADesmame.Params.ParamByName ( 'IDADE_DESMAME' ).AsInteger := idadeDesmame ;
  cdsADesmame.Params.paramByName ( 'DATA'  ).asSQLTimeStamp    := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsADesmame.Params.ParamByName ( 'PESO_DESMAME' ).AsInteger  := pesoDesmame ;

end;

end.
