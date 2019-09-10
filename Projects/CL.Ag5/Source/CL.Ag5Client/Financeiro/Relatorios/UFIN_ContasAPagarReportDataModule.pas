unit UFIN_ContasAPagarReportDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, windows, forms, dialogs, Tc.Data.SQLExpr;

type
  TFIN_ContasAPagarReportDataModule = class(TDataModule)
    sqlFIN_APAGAR: TTcSQLDataSet;
    sqlFIN_APAGARKFIN_APAGAR: TStringField;
    sqlFIN_APAGARHISTORICO: TStringField;
    sqlFIN_APAGARNOMEENTIDADE: TStringField;
    sqlFIN_APAGARDATALANCTO: TSQLTimeStampField;
    sqlFIN_APAGARDOCUMENTO: TStringField;
    sqlFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    sqlFIN_APAGARPARCELAS: TStringField;
    sqlFIN_APAGARVENCTO: TSQLTimeStampField;
    sqlFIN_APAGARVALOR: TFloatField;
    sqlFIN_APAGARPREVISAO: TStringField;
    sqlFIN_APAGARCONTA: TStringField;
    dspFIN_APAGAR: TDataSetProvider;
    cdsFIN_APAGAR: TClientDataSet;
    cdsFIN_APAGARKFIN_APAGAR: TStringField;
    cdsFIN_APAGARHISTORICO: TStringField;
    cdsFIN_APAGARNOMEENTIDADE: TStringField;
    cdsFIN_APAGARDATALANCTO: TSQLTimeStampField;
    cdsFIN_APAGARDOCUMENTO: TStringField;
    cdsFIN_APAGARKFIN_APAGAR_PARCELA: TStringField;
    cdsFIN_APAGARPARCELAS: TStringField;
    cdsFIN_APAGARVENCTO: TSQLTimeStampField;
    cdsFIN_APAGARVALOR: TFloatField;
    cdsFIN_APAGARPREVISAO: TStringField;
    cdsFIN_APAGARCONTAS: TStringField;
    cdsFIN_APAGARTOTAL_APAGAR: TAggregateField;
    sqlFIN_APAGARDOCUMENTO_: TStringField;
    cdsFIN_APAGARDOCUMENTO_: TStringField;
    procedure cdsFIN_APAGARBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDataIni: TDateTime;
    FDataFim: TDateTime;
    FEntidade: String;
    FTodos: Boolean;
    FFazenda: String;
    procedure SetParams;
    procedure SetDataIni (const AValue: TDateTime);
    procedure SetDataFim (const AValue: TDateTime);
    procedure SetEntidade (const AValue: String);
    procedure SetTodos (const AValue: Boolean);
    procedure SetFazenda (const AValue: String);
  protected
    procedure DoDestroy; override;
  public
    { Public declarations }
    property Dataini:    TDateTime   read FDataIni   write SetDataIni;
    property DataFim:    TDateTime   read FDataFim   write SetDataFim;
    property Entidade:   String      read FEntidade  write SetEntidade;
    property Todos:      Boolean     read FTodos     write SetTodos;
    property Fazenda:    String      read FFazenda   write SetFazenda;
    procedure OpenTables;
  end;



implementation

uses UDBFinanceiro, MaskUtils, Data.SQLTimSt, System.DateUtils, CDSSuppl;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFIN_ContasAPagarReportDataModule }

procedure TFIN_ContasAPagarReportDataModule.cdsFIN_APAGARBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams;
end;


procedure TFIN_ContasAPagarReportDataModule.DoDestroy;
begin
  inherited;
  TCDSSuppl.PersistIndexes( cdsFIN_APAGAR );
end;

procedure TFIN_ContasAPagarReportDataModule.OpenTables;
begin
  TCDSSuppl.Open ( cdsFIN_APAGAR ) ;
end;

procedure TFIN_ContasAPagarReportDataModule.SetDataFim(const AValue: TDateTime);
begin
  FDataFim := AValue;
end;

procedure TFIN_ContasAPagarReportDataModule.SetDataIni(const AValue: TDateTime);
begin
  FDataIni := AValue;
end;

procedure TFIN_ContasAPagarReportDataModule.SetEntidade(const AValue: String);
begin
  FEntidade := AValue;
end;

procedure TFIN_ContasAPagarReportDataModule.SetFazenda(const AValue: String);
begin
  FFazenda := AValue;
end;

procedure TFIN_ContasAPagarReportDataModule.SetParams;
begin
  cdsFIN_APAGAR.ParamByName('KSYS$DOMAIN').AsString  := Fazenda;
  cdsFIN_APAGAR.ParamByName('TODOS').AsString         := BoolToChar( Todos );
  cdsFIN_APAGAR.ParamByName('KCAD_ENTIDADE').AsString := Entidade;
  cdsFIN_APAGAR.ParamByName('DATAINI').AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay(Dataini) );
  cdsFIN_APAGAR.ParamByName('DATAFIM').AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay(DataFim) );
end;

procedure TFIN_ContasAPagarReportDataModule.SetTodos(const AValue: Boolean);
begin
  FTodos := AValue;
end;

end.
