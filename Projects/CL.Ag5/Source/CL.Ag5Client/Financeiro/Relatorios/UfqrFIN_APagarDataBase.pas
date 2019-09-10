unit UfqrFIN_APagarDataBase;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfqrSYS_BaseReport, jpeg, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr;

type
  TfqrFIN_APagarDataBase = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    cdsApagarDataBase: TClientDataSet;
    dspApagarDatabase: TDataSetProvider;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    sqlApagarDatabase: TTcSQLDataSet;
    sqlApagarDatabaseKFIN_APAGAR: TStringField;
    sqlApagarDatabaseHISTORICO: TStringField;
    sqlApagarDatabaseNOMEENTIDADE: TStringField;
    sqlApagarDatabaseDOCUMENTO: TStringField;
    sqlApagarDatabaseKFIN_APAGAR_PARCELA: TStringField;
    sqlApagarDatabaseVENCTO: TSQLTimeStampField;
    sqlApagarDatabaseVALOR: TFloatField;
    sqlApagarDatabasePAGTO: TSQLTimeStampField;
    sqlApagarDatabasePAGO: TFloatField;
    sqlApagarDatabasePREVISAO: TStringField;
    sqlApagarDatabaseNOMECONTA: TStringField;
    cdsApagarDataBaseKFIN_APAGAR: TStringField;
    cdsApagarDataBaseHISTORICO: TStringField;
    cdsApagarDataBaseNOMEENTIDADE: TStringField;
    cdsApagarDataBaseDOCUMENTO: TStringField;
    cdsApagarDataBaseKFIN_APAGAR_PARCELA: TStringField;
    cdsApagarDataBaseVENCTO: TSQLTimeStampField;
    cdsApagarDataBaseVALOR: TFloatField;
    cdsApagarDataBasePAGTO: TSQLTimeStampField;
    cdsApagarDataBasePAGO: TFloatField;
    cdsApagarDataBasePREVISAO: TStringField;
    cdsApagarDataBaseNOMECONTA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
  private
    nBand: Integer;
    Total: Currency;
    TotalGeral: Currency;
    { Private declarations }
  public
    procedure OpenQuery(DataBase: TDateTime);
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, DateUtils, Data.SQLTimSt, MaskUtils;

{$R *.dfm}

procedure TfqrFIN_APagarDataBase.FormCreate(Sender: TObject);
begin
  nBand := 0;
  Total := 0;
  TotalGeral := 0;
end;

procedure TfqrFIN_APagarDataBase.OpenQuery(DataBase: TDateTime);
begin
  cdsApagarDataBase.Close;
  cdsApagarDataBase.Params.ParamByName('DATABASE').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  DataBase ) ) ;
  QuickRep.ReportTitle := 'Títulos A Pagar - Data Base ' + FormatDateTime('dd/mm/yyyy', DataBase);
  cdsApagarDataBase.Open;
end;

procedure TfqrFIN_APagarDataBase.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  Total      := Total      + cdsApagarDataBaseVALOR.AsCurrency;
  TotalGeral := TotalGeral + cdsApagarDataBaseVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarDataBase.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalGeral);
  TotalGeral := 0;
end;

procedure TfqrFIN_APagarDataBase.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, Total);
  Total := 0;
end;

end.


