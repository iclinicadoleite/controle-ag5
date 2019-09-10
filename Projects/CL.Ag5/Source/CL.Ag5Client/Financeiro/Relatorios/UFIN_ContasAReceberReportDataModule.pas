unit UFIN_ContasAReceberReportDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Data.SqlTimSt, DateUtils, Tc.Data.SQLExpr;

type
  TFIN_ContasAReceberReportDataModule = class(TDataModule)
    sqlFIN_AReceber: TTcSQLDataSet;
    sqlFIN_AReceberKFIN_ARECEBER: TStringField;
    sqlFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField;
    sqlFIN_AReceberHISTORICO: TStringField;
    sqlFIN_AReceberNOMEENTIDADE: TStringField;
    sqlFIN_AReceberDATALANCTO: TSQLTimeStampField;
    sqlFIN_AReceberDOCUMENTO: TStringField;
    sqlFIN_AReceberPARCELAS: TStringField;
    sqlFIN_AReceberVENCTO: TSQLTimeStampField;
    sqlFIN_AReceberVALOR: TFloatField;
    sqlFIN_AReceberPREVISAO: TStringField;
    sqlFIN_AReceberCONTA: TStringField;
    dspFIN_AReceber: TDataSetProvider;
    cdsFIN_AReceber: TClientDataSet;
    cdsFIN_AReceberKFIN_ARECEBER: TStringField;
    cdsFIN_AReceberKFIN_ARECEBER_PARCELA: TStringField;
    cdsFIN_AReceberHISTORICO: TStringField;
    cdsFIN_AReceberNOMEENTIDADE: TStringField;
    cdsFIN_AReceberDATALANCTO: TSQLTimeStampField;
    cdsFIN_AReceberDOCUMENTO: TStringField;
    cdsFIN_AReceberPARCELAS: TStringField;
    cdsFIN_AReceberVENCTO: TSQLTimeStampField;
    cdsFIN_AReceberVALOR: TFloatField;
    cdsFIN_AReceberPREVISAO: TStringField;
    cdsFIN_AReceberCONTAS: TStringField;
    cdsFIN_AReceberTOTAL_ARECEBER: TAggregateField;
    sqlFIN_AReceberDOCUMENTO_: TStringField;
    cdsFIN_AReceberDOCUMENTO_: TStringField;
    procedure cdsFIN_AReceberBeforeOpen(DataSet: TDataSet);
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

uses UDBFinanceiro, MaskUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFIN_ContasAReceberReportDataModule }





procedure TFIN_ContasAReceberReportDataModule.cdsFIN_AReceberBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams;
end;

procedure TFIN_ContasAReceberReportDataModule.DoDestroy;
begin
  inherited;
  TCDSSuppl.PersistIndexes( cdsFIN_ARECEBER );
end;

procedure TFIN_ContasAReceberReportDataModule.OpenTables;
begin
  TCDSSuppl.Open ( cdsFIN_ARECEBER ) ;
end;

procedure TFIN_ContasAReceberReportDataModule.SetDataFim(const AValue: TDateTime);
begin
  FDataFim := AValue;
end;

procedure TFIN_ContasAReceberReportDataModule.SetDataIni(const AValue: TDateTime);
begin
  FDataIni := AValue;
end;

procedure TFIN_ContasAReceberReportDataModule.SetEntidade(const AValue: String);
begin
  FEntidade := AValue;
end;

procedure TFIN_ContasAReceberReportDataModule.SetFazenda(const AValue: String);
begin
  FFazenda := AValue;
end;

procedure TFIN_ContasAReceberReportDataModule.SetParams;
begin
  cdsFIN_ARECEBER.ParamByName('KSYS$DOMAIN').AsString  := Fazenda;
  cdsFIN_ARECEBER.ParamByName('TODOS').AsString         := BoolToChar( Todos );
  cdsFIN_ARECEBER.ParamByName('KCAD_ENTIDADE').AsString := Entidade;
  cdsFIN_ARECEBER.ParamByName('DATAINI').AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay(Dataini) );
  cdsFIN_ARECEBER.ParamByName('DATAFIM').AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay(DataFim) );
end;

procedure TFIN_ContasAReceberReportDataModule.SetTodos(const AValue: Boolean);
begin
  FTodos := AValue;
end;

end.
