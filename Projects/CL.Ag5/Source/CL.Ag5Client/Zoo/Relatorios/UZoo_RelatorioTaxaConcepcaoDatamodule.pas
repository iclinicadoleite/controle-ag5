unit UZoo_RelatorioTaxaConcepcaoDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Math, Tc.Vcl.Application;

type
  TZoo_RelatorioTaxaConcepcaoDataModule = class(TDataModule)
    sqlResultados: TTcSQLDataSet;
    dspResultados: TDataSetProvider;
    cdsResultados: TClientDataSet;
    sqlResultadosBRINCO: TStringField;
    sqlResultadosNOMECOMPLETO: TStringField;
    sqlResultadosCOBERTURAS: TIntegerField;
    sqlResultadosPRENHEZES: TIntegerField;
    sqlResultadosTAXACONCEPCAO: TLargeintField;
    sqlResultadosPARTOS: TIntegerField;
    sqlResultadosFEMEAS: TLargeintField;
    sqlResultadosTAXAFEMEAS: TLargeintField;
    cdsResultadosBRINCO: TStringField;
    cdsResultadosNOMECOMPLETO: TStringField;
    cdsResultadosCOBERTURAS: TIntegerField;
    cdsResultadosPRENHEZES: TIntegerField;
    cdsResultadosTAXACONCEPCAO: TLargeintField;
    cdsResultadosPARTOS: TIntegerField;
    cdsResultadosFEMEAS: TLargeintField;
    cdsResultadosTAXAFEMEAS: TLargeintField;
    sqlResultadosTIPO_REG: TIntegerField;
    cdsResultadosTIPO_REG: TIntegerField;
    ClientDataSet1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    LargeintField1: TLargeintField;
    IntegerField3: TIntegerField;
    LargeintField2: TLargeintField;
    LargeintField3: TLargeintField;
    IntegerField4: TIntegerField;
    AggregateField1: TAggregateField;
    AggregateField2: TAggregateField;
    AggregateField3: TAggregateField;
    AggregateField4: TAggregateField;
    procedure cdsResultadosBeforeOpen(DataSet: TDataSet);
  private
    FDataFinal: TDateTime;
    FDataInicial: TDateTime;
    FTipoData   : Integer;
    { Private declarations }
    procedure SetParams ;
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
    procedure SetTipoData(const Value: Integer);
    procedure InsertTotais;
  public
    { Public declarations }
    property DataInicial : TDateTime   read FDataInicial write SetDataInicial;
    property DataFinal   : TDateTime   read FDataFinal write SetDataFinal;
    property TipoData    : Integer     read FTipoData write SetTipoData;
    procedure OpenTables  ;
  end;

TAggregateRetorne = (ftSomar,ftMaxima,ftContar,FtMedia);

TOperacoes =class
   class function  Retornar(ClientDataSet:TClientDataSet;
                   Const cField:String; Tipo:TAggregateRetorne):String;
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Data.SQLTimSt, System.DateUtils, CDSSuppl, ClAg5ClientCommonTypes, ClAg5Types ;


const
  _TIPO_REG_NORMAL = 1;
  _TIPO_REG_TOTAIS = 2;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.InsertTotais;
var
  LCoberturaSoma,
  LPrenhezesSoma,
  LPartosSoma,
  LFemeasSoma,
  LTaxaPrenhezSoma,
  LTaxaFemeasSoma : Integer;
begin
  if cdsResultados.IsEmpty then
    Exit;

  LCoberturaSoma   := StrToInt( TOperacoes.Retornar(cdsResultados,'COBERTURAS',ftSomar) );
  LPrenhezesSoma   := StrToInt( TOperacoes.Retornar(cdsResultados,'PRENHEZES',ftSomar) );
  LPartosSoma      := StrToInt( TOperacoes.Retornar(cdsResultados,'PARTOS',ftSomar) );
  LFemeasSoma      := StrToInt( TOperacoes.Retornar(cdsResultados,'FEMEAS',ftSomar) );
  if LCoberturaSoma = 0 then
    LTaxaPrenhezSoma:= 0
  else
    LTaxaPrenhezSoma := Round( ((LPrenhezesSoma*100)/LCoberturaSoma) );

  if LPartosSoma = 0 then
    LTaxaFemeasSoma := 0
  else
    LTaxaFemeasSoma  := Round( ((LFemeasSoma*100)/ LPartosSoma) ) ;

  cdsResultados.Append;
  cdsResultadosTIPO_REG.AsInteger       := _TIPO_REG_TOTAIS;
  cdsResultadosBRINCO.AsString          := 'Totais';
  cdsResultadosNOMECOMPLETO.AsString    := '-';
  cdsResultadosCOBERTURAS.AsInteger     := LCoberturaSoma;
  cdsResultadosPRENHEZES.AsInteger      := LPrenhezesSoma;
  cdsResultadosPARTOS.AsInteger         := LPartosSoma;
  cdsResultadosFEMEAS.AsInteger         := LFemeasSoma;
  cdsResultadosTAXACONCEPCAO.AsInteger  := LTaxaPrenhezSoma;
  cdsResultadosTAXAFEMEAS.AsInteger     := LTaxaFemeasSoma;
  cdsResultados.Post;

end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.OpenTables;
begin
   TCDSSuppl.Open ( cdsResultados ) ;
   InsertTotais;
end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.SetDataFinal(
  const Value: TDateTime);
begin
  FDataFinal := Value;
end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.SetDataInicial(
  const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.SetParams;
begin
  if ParametrosFazenda( LoggedUser.DomainID ).ConsiderarNaoPrenheReinseminada then
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_REINSEMINADA' ).asString := 'T'
  else
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_REINSEMINADA' ).asString := 'F';

  if ParametrosFazenda( LoggedUser.DomainID ).ConsiderarNaoPrenheDescartada then
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_DESCARTADA' ).asString := 'T'
  else
    cdsResultados.Params.ParamByName ( 'CONSIDERA_NAO_PRENHE_DESCARTADA' ).asString := 'F';

  cdsResultados.Params.ParamByName ( 'EVENTO_CIO' ).AsInteger := _ST_TIPO_EVENTO_ZOO_CIO;
  cdsResultados.Params.ParamByName ( 'ST_DESCARTADA' ).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;
  cdsResultados.Params.ParamByName ( 'TIPODATA' ).asInteger     := FTipoData;
  cdsResultados.Params.ParamByName ( 'DATAINI' ).asSQLTimesTamp := DateTimetoSQLTimestamp(StartOfTheDay( FDataInicial) );// DateTimetoSQLTimestamp(FDataInicial) ;
  cdsResultados.Params.ParamByName ( 'DATAFIM' ).asSQLTimesTamp := DateTimetoSQLTimestamp(EndOfTheDay( FDataFinal));//DateTimetoSQLTimestamp(FDataFinal) ;
end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.SetTipoData(
  const Value: Integer);
begin
  FTipoData := Value;
end;

procedure TZoo_RelatorioTaxaConcepcaoDataModule.cdsResultadosBeforeOpen(
  DataSet: TDataSet);
begin
   SetParams ;
end;

{ TOperacoes }

class function TOperacoes.Retornar(ClientDataSet: TClientDataSet;
  const cField: String; Tipo: TAggregateRetorne): String;
begin
  try
    with ClientDataSet do
      begin
        if IsEmpty then
         begin
           case Tipo of
            ftSomar:result:= '0';
            ftMaxima:result:='0';
            ftContar:result:= '0';
            FtMedia:result:= '0';
           end;
           Exit;
         end;

        AggregatesActive := False;
         if Aggregates.Find('Somar') <> nil then
           Aggregates.Delete( Aggregates.IndexOf('Somar') );
         with Aggregates.Add do
          begin
            Expression := 'Sum('+cField+')';
            AggregateName := 'Somar';
            Active := True;
          end;

         if Aggregates.Find('Maxima') <> nil then
           Aggregates.Delete( Aggregates.IndexOf('Maxima') );
         with Aggregates.Add do
          begin
            Expression := 'Max('+cField+')';
            AggregateName := 'Maxima';
            Active := True;
          end;

         if Aggregates.Find('Contar') <> nil then
           Aggregates.Delete( Aggregates.IndexOf('Contar') );
         with Aggregates.Add do
          begin
            Expression := 'Count('+cField+')';
            AggregateName := 'Contar';
            Active := True;
          end;

         if Aggregates.Find('Media') <> nil then
           Aggregates.Delete( Aggregates.IndexOf('Media') );
         with Aggregates.Add do
          begin
            Expression := 'Avg('+cField+')';
            AggregateName := 'Media';
            Active := True;
          end;

         AggregatesActive := true;
          case Tipo of
            ftSomar:result:=Aggregates.Find('Somar').Value;
            ftMaxima:result:=Aggregates.Find('Maxima').Value;
            ftContar:result:= Aggregates.Find('Contar').Value;
            FtMedia:result:= Aggregates.Find('Media').Value;
          end;
       end;
 except
  on e:Exception do
    raise Exception.Create(E.Message);//propagar a exceção
   end;
end;

end.
