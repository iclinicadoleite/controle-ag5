unit UZoo_AtividadesLVDiagnosticoPrenhezDatamodule2;

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
    sqlADiagnosticoPrenhezQTDE_COBERTURA: TIntegerField;
    cdsADiagnosticoPrenhezQTDE_COBERTURA: TIntegerField;
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

    FDiasConfirmacaoPrimipara: integer  ;
    FDiasConfirmacaoMultipara: integer  ;
    FDiasReconfirmacaoPrimipara1: integer  ;
    FDiasReconfirmacaoMultipara1: integer  ;
    FDiasReconfirmacaoPrimipara2: integer  ;
    FDiasReconfirmacaoMultipara2: integer  ;

begin
   TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, diasPrim, diasMulti ) ;

   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, FDiasConfirmacaoPrimipara, FDiasConfirmacaoMultipara ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_1VEZ, FDiasReconfirmacaoPrimipara1, FDiasReconfirmacaoMultipara1 ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_2VEZ, FDiasReconfirmacaoPrimipara2, FDiasReconfirmacaoMultipara2 ) ;

   cdsADiagnosticoPrenhez.Params.ParamByName( 'KCAD_FAZENDA'        ).AsString       := LoggedUser.DomainID ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'STATUS_DESCARTADO'   ).AsInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DOADOR'              ).AsInteger      := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'EMBRIAO'             ).AsInteger      := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
   cdsADiagnosticoPrenhez.Params.ParamByName( 'DATA'                ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_MULTIPARA'       ).AsInteger      := FDiasConfirmacaoMultipara ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_PRIMIPARA'       ).AsInteger      := FDiasConfirmacaoPrimipara ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_MULTIPARA_1X'    ).AsInteger      := FDiasReconfirmacaoMultipara1 ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_PRIMIPARA_1X'    ).AsInteger      := FDiasReconfirmacaoPrimipara1 ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_MULTIPARA_2X'    ).AsInteger      := FDiasReconfirmacaoMultipara2 ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'DIAS_CONFIRMAR_PRIMIPARA_2X'  ).AsInteger        := FDiasReconfirmacaoPrimipara2 ;
   cdsADiagnosticoPrenhez.Params.paramByName( 'STATUS_DESCARTADO'   ).AsInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;

end;

end.
