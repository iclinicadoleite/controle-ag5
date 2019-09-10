unit UdtmFIN_FluxoCaixaDetalhe;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, FIN_FluxoCaixaTypes, Datasnap.Win.MConnect, Tc.Data.SQLExpr ;

type
  TdtmFIN_FluxoCaixaDetalhe = class(TDataModule)
    cdsAPagarPrevisto: TClientDataSet;
    dspAPagarPrevisto: TDataSetProvider;
    sqlAPagarPrevisto: TTcSQLDataSet;
    SharedConnection1: TSharedConnection;
    cdsAPagarEfetivo: TClientDataSet;
    dspAPagarEfetivo: TDataSetProvider;
    sqlAPagarEfetivo: TTcSQLDataSet;
    cdsAPagarQuitado: TClientDataSet;
    dspAPagarQuitado: TDataSetProvider;
    sqlAPagarQuitado: TTcSQLDataSet;
    cdsAReceberPrevisto: TClientDataSet;
    dspAReceberPrevisto: TDataSetProvider;
    sqlAReceberPrevisto: TTcSQLDataSet;
    cdsAReceberFaturado: TClientDataSet;
    dspAReceberFaturado: TDataSetProvider;
    sqlAReceberFaturado: TTcSQLDataSet;
    cdsAReceberQuitado: TClientDataSet;
    dspAReceberQuitado: TDataSetProvider;
    sqlAReceberQuitado: TTcSQLDataSet;
    sqlAPagarPrevistoDATA: TDateField;
    sqlAPagarPrevistoVALOR: TFloatField;
    sqlAPagarPrevistoNOMEENTIDADE: TStringField;
    sqlAPagarPrevistoDOCUMENTO: TStringField;
    sqlAPagarPrevistoNOMECONTA: TStringField;
    sqlAPagarEfetivoDATA: TDateField;
    sqlAPagarEfetivoVALOR: TFloatField;
    sqlAPagarEfetivoNOMEENTIDADE: TStringField;
    sqlAPagarEfetivoNOMECONTA: TStringField;
    sqlAPagarQuitadoDATA: TDateField;
    sqlAPagarQuitadoVALOR: TFloatField;
    sqlAPagarQuitadoNOMEENTIDADE: TStringField;
    sqlAPagarQuitadoDOCUMENTO: TStringField;
    sqlAReceberPrevistoDATA: TDateField;
    sqlAReceberPrevistoVALOR: TFloatField;
    sqlAReceberPrevistoNOMEENTIDADE: TStringField;
    sqlAReceberPrevistoDOCUMENTO: TStringField;
    sqlAReceberPrevistoNOMECONTA: TStringField;
    sqlAReceberFaturadoDATA: TDateField;
    sqlAReceberFaturadoVALOR: TFloatField;
    sqlAReceberFaturadoNOMEENTIDADE: TStringField;
    sqlAReceberFaturadoDOCUMENTO: TStringField;
    sqlAReceberFaturadoNOMECONTA: TStringField;
    sqlAReceberQuitadoDATA: TDateField;
    sqlAReceberQuitadoVALOR: TFloatField;
    sqlAReceberQuitadoNOMEENTIDADE: TStringField;
    sqlAReceberQuitadoDOCUMENTO: TStringField;
    cdsAPagarPrevistoDATA: TDateField;
    cdsAPagarPrevistoVALOR: TFloatField;
    cdsAPagarPrevistoNOMEENTIDADE: TStringField;
    cdsAPagarPrevistoDOCUMENTO: TStringField;
    cdsAPagarEfetivoDATA: TDateField;
    cdsAPagarEfetivoVALOR: TFloatField;
    cdsAPagarEfetivoNOMEENTIDADE: TStringField;
    cdsAPagarEfetivoDOCUMENTO: TStringField;
    cdsAPagarQuitadoDATA: TDateField;
    cdsAPagarQuitadoVALOR: TFloatField;
    cdsAPagarQuitadoNOMEENTIDADE: TStringField;
    cdsAPagarQuitadoDOCUMENTO: TStringField;
    cdsAPagarPrevistoSomaTotal: TAggregateField;
    cdsAPagarEfetivoSomaTotal: TAggregateField;
    cdsAPagarQuitadoSomaTotal: TAggregateField;
    cdsAReceberPrevistoSomaTotal: TAggregateField;
    cdsAReceberFaturadoSomaTotal: TAggregateField;
    cdsAReceberQuitadoSomaTotal: TAggregateField;
    sqlAPagarEfetivoDOCUMENTO: TStringField;
    cdsAReceberPrevistoDATA: TDateField;
    cdsAReceberPrevistoVALOR: TFloatField;
    cdsAReceberPrevistoNOMEENTIDADE: TStringField;
    cdsAReceberPrevistoDOCUMENTO: TStringField;
    cdsAReceberPrevistoNOMECONTA: TStringField;
    cdsAReceberFaturadoDATA: TDateField;
    cdsAReceberFaturadoVALOR: TFloatField;
    cdsAReceberFaturadoNOMEENTIDADE: TStringField;
    cdsAReceberFaturadoDOCUMENTO: TStringField;
    cdsAReceberFaturadoNOMECONTA: TStringField;
    cdsAReceberQuitadoDATA: TDateField;
    cdsAReceberQuitadoVALOR: TFloatField;
    cdsAReceberQuitadoNOMEENTIDADE: TStringField;
    cdsAReceberQuitadoDOCUMENTO: TStringField;
    cdsAPagarPrevistoNOMECONTA: TStringField;
    cdsAPagarEfetivoNOMECONTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenTables ( Tipo : TTipoFinFluxoDetalhe ; Data : TDateTime ) : TClientDataSet ;
  end;


implementation

uses Data.SQLTimSt, DateUtils, UDBFinanceiro;

{$R *.dfm}

{ TdtmFIN_FluxoCaixaDetalhe }

function TdtmFIN_FluxoCaixaDetalhe.OpenTables ( Tipo : TTipoFinFluxoDetalhe ; Data : TDateTime ) : TClientDataSet ;

   function OpenCDS ( cds : TClientDataSet ) : TClientDataSet ;
   begin
      cds.Params.ParamByName( 'DATAINICIO' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( Data ) ) ;
      cds.Params.ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( Data ) ) ;
      TCDSSuppl.Open ( cds ) ;
      Result := cds ;
   end ;

begin

     if Tipo = ffdAPAGAR_PREVISTO then
        Result := OpenCDS ( cdsAPagarPrevisto )

     else if Tipo = ffdAPAGAR_EFETIVO then
        Result := OpenCDS ( cdsAPagarEfetivo )

     else if Tipo = ffdAPAGAR_QUITADO then
        Result := OpenCDS ( cdsAPagarQuitado )

     else if Tipo = ffdARECEBER_PREVISTO then
        Result := OpenCDS ( cdsAReceberPrevisto )

     else if Tipo = ffdARECEBER_FATURADO then
        Result := OpenCDS ( cdsAReceberFaturado )

     else if Tipo = ffdARECEBER_RECEBIDA then
        Result := OpenCDS ( cdsAReceberQuitado ) ;

end;

end.

