unit UfqrFIN_AReceberDataBase;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfqrSYS_BaseReport, jpeg;

type
  TfqrFIN_AReceberDataBase = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qryTitRec: TSQLQuery;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    qryTitRecKTITREC: TIntegerField;
    qryTitRecNOME: TStringField;
    qryTitRecENTIDADE: TStringField;
    qryTitRecDOCUMENTO: TStringField;
    qryTitRecKDESDREC: TIntegerField;
    qryTitRecVENCTO: TDateField;
    qryTitRecVALOR: TFMTBCDField;
    qryTitRecPAGTO: TDateField;
    qryTitRecPAGO: TFMTBCDField;
    qryTitRecPREVISTO: TStringField;
    qryTitRecCONTA: TStringField;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    cdsTitRec: TClientDataSet;
    dspTitRec: TDataSetProvider;
    cdsTitRecKTITREC: TIntegerField;
    cdsTitRecNOME: TStringField;
    cdsTitRecENTIDADE: TStringField;
    cdsTitRecDOCUMENTO: TStringField;
    cdsTitRecKDESDREC: TIntegerField;
    cdsTitRecVENCTO: TDateField;
    cdsTitRecVALOR: TFMTBCDField;
    cdsTitRecPAGTO: TDateField;
    cdsTitRecPAGO: TFMTBCDField;
    cdsTitRecPREVISTO: TStringField;
    cdsTitRecCONTA: TStringField;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

procedure TfqrFIN_AReceberDataBase.FormCreate(Sender: TObject);
begin
  nBand := 0;
  Total := 0;
  TotalGeral := 0;
end;

procedure TfqrFIN_AReceberDataBase.FormDestroy(Sender: TObject);
begin
  qryTitRec.Close;
end;

procedure TfqrFIN_AReceberDataBase.OpenQuery(DataBase: TDateTime);
begin
  cdsTitRec.Close;
  cdsTitRec.Params.ParamByName('DATABASE').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  DataBase ) ) ;
  QuickRep.ReportTitle := 'Títulos A Receber - Data Base ' + FormatDateTime('dd/mm/yyyy', DataBase);
  cdsTitRec.Open;
end;

procedure TfqrFIN_AReceberDataBase.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  Total      := Total      + cdsTitRecVALOR.AsCurrency;
  TotalGeral := TotalGeral + cdsTitRecVALOR.AsCurrency;
end;

procedure TfqrFIN_AReceberDataBase.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalGeral);
  TotalGeral := 0;
end;

procedure TfqrFIN_AReceberDataBase.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, Total);
  Total := 0;
end;

end.
