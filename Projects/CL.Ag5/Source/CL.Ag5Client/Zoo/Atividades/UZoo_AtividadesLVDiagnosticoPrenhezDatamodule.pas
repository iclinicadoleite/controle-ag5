unit UZoo_AtividadesLVDiagnosticoPrenhezDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVDiagnosticoPrenhezDatamodule = class(T_dtmBASE)
    cdsADiagnosticoPrenhez: TClientDataSet;
    dspADiagnosticoPrenhez: TDataSetProvider;
    sqlADiagnosticoPrenhez: TTcSQLDataSet;
    sqlADiagnosticoPrenhezBRINCOFEMEA: TStringField;
    sqlADiagnosticoPrenhezNOMEFEMEA: TStringField;
    sqlADiagnosticoPrenhezLOTE: TStringField;
    sqlADiagnosticoPrenhezULTIMA_MONTA: TSQLTimeStampField;
    sqlADiagnosticoPrenhezDIAS_DO_EVENTO: TLargeintField;
    cdsADiagnosticoPrenhezBRINCOFEMEA: TStringField;
    cdsADiagnosticoPrenhezNOMEFEMEA: TStringField;
    cdsADiagnosticoPrenhezLOTE: TStringField;
    cdsADiagnosticoPrenhezULTIMA_MONTA: TSQLTimeStampField;
    cdsADiagnosticoPrenhezDIAS_DO_EVENTO: TLargeintField;
    sqlADiagnosticoPrenhezBRINCOFEMEA_: TStringField;
    cdsADiagnosticoPrenhezBRINCOFEMEA_: TStringField;
    sqlADiagnosticoPrenhezIATF: TStringField;
    sqlADiagnosticoPrenhezDESC_PROTOCOLO_IATF: TStringField;
    cdsADiagnosticoPrenhezIATF: TStringField;
    cdsADiagnosticoPrenhezDESC_PROTOCOLO_IATF: TStringField;
    sqlADiagnosticoPrenhezKZOO_ANIMAL_FEMEA: TStringField;
    cdsADiagnosticoPrenhezKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsADiagnosticoPrenhezBeforeOpen(DataSet: TDataSet);
    procedure cdsADiagnosticoPrenhezIATFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    FAte: TDateTime;
    { Private declarations }
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
  public
    { Public declarations }
    property Ate : TDateTime  read FAte write SetAte;
  end;

implementation

uses CDSSuppl,
     CLAg5Types, UDBZootecnico, Data.SQLTimSt, Exceptions, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_AtividadesLVDiagnosticoPrenhezDatamodule.cdsADiagnosticoPrenhezBeforeOpen(
  DataSet: TDataSet);
begin
  setparams;
end;

procedure TZoo_AtividadesLVDiagnosticoPrenhezDatamodule.cdsADiagnosticoPrenhezIATFGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.AsBoolean then
      Text := 'Sim'
   else
      Text := 'Não'
end;

procedure TZoo_AtividadesLVDiagnosticoPrenhezDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsADiagnosticoPrenhez.Active then
     cdsADiagnosticoPrenhez.Close ;
  TCDSSuppl.Open ( cdsADiagnosticoPrenhez ) ;
end;

procedure TZoo_AtividadesLVDiagnosticoPrenhezDatamodule.SetParams;
var
  diasPrim, diasMulti : integer  ;
begin
   TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, diasPrim, diasMulti ) ;

  cdsADiagnosticoPrenhez.Params.ParamByName ( 'KCAD_FAZENDA' ).asString            := LoggedUser.DomainID ;
  cdsADiagnosticoPrenhez.Params.paramByName ( 'DESCARTADA' ).asInteger             := _ST_STATUS_FEMEA_DESCARTADO ;
  cdsADiagnosticoPrenhez.Params.paramByName ( 'ANIMAL_DOADOR').asInteger           := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
  cdsADiagnosticoPrenhez.Params.paramByName ( 'DIAS_PRENHEZ_MULTIPARA' ).asInteger := diasMulti ;
  cdsADiagnosticoPrenhez.Params.paramByName ( 'DIAS_PRENHEZ_PRIMIPARA' ).asInteger := diasPrim ;
  cdsADiagnosticoPrenhez.Params.paramByName ( 'DATA'  ).asSQLTimeStamp             := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;

end;

end.
