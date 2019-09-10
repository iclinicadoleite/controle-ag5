unit UZoo_AtividadesProtocolosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesProtocolosDatamodule = class(T_dtmBASE)
    cdsAProtocolos: TClientDataSet;
    dspAProtocolos: TDataSetProvider;
    sqlAProtocolos: TTcSQLDataSet;
    sqlAProtocolosBRINCOFEMEA: TStringField;
    sqlAProtocolosNOMEFEMEA: TStringField;
    sqlAProtocolosTIPO_PROTOCOLO: TStringField;
    sqlAProtocolosTAREFAS: TStringField;
    sqlAProtocolosRESPONSAVEL: TStringField;
    sqlAProtocolosOBS: TMemoField;
    cdsAProtocolosBRINCOFEMEA: TStringField;
    cdsAProtocolosNOMEFEMEA: TStringField;
    cdsAProtocolosTIPO_PROTOCOLO: TStringField;
    cdsAProtocolosTAREFAS: TStringField;
    cdsAProtocolosRESPONSAVEL: TStringField;
    cdsAProtocolosOBS: TMemoField;
    sqlAProtocolosBRINCOFEMEA_: TStringField;
    cdsAProtocolosBRINCOFEMEA_: TStringField;
    sqlAProtocolosKZOO_ANIMAL_FEMEA: TStringField;
    cdsAProtocolosKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAProtocolosBeforeOpen(DataSet: TDataSet);
  private
    FAte: TDateTime;
    { Private declarations }
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
  public
    property Ate : TDateTime  read FAte write SetAte;
    { Public declarations }
  end;

implementation

uses CDSSuppl,
     Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils ;

{$R *.dfm}

{ TZoo_AtividadesProtocolosDatamodule }

procedure TZoo_AtividadesProtocolosDatamodule.cdsAProtocolosBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesProtocolosDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsAProtocolos.Active then
     cdsAProtocolos.Close ;
  TCDSSuppl.Open ( cdsAProtocolos ) ;
end;

procedure TZoo_AtividadesProtocolosDatamodule.SetParams;
begin

  cdsAProtocolos.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
  cdsAProtocolos.Params.paramByName ( 'DATA'  ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsAProtocolos.Params.paramByName ( 'PENDENTE' ).asInteger    := _ST_STATUS_TAREFA_PENDENTE ;

end;

end.
