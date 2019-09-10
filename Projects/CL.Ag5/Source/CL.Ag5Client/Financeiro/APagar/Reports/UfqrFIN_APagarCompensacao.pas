unit UfqrFIN_APagarCompensacao;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, Datasnap.Provider,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UfqrSYS_BaseReport, jpeg;

type
  TfqrFIN_APagarCompensacao = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qryTitPag: TSQLQuery;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    qryTitPagKTITPAG: TIntegerField;
    qryTitPagNOME: TStringField;
    qryTitPagENTIDADE: TStringField;
    qryTitPagDOCUMENTO: TStringField;
    qryTitPagKDESDPAG: TIntegerField;
    qryTitPagVENCTO: TDateField;
    qryTitPagVALOR: TFMTBCDField;
    qryTitPagPAGTO: TDateField;
    qryTitPagPAGO: TFMTBCDField;
    qryTitPagPREVISTO: TStringField;
    qryTitPagCONTA: TStringField;
    qryTitPagLANCTO: TDateField;
    QRBand7: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel14: TQRLabel;
    cdsTitPag: TClientDataSet;
    dspTitPag: TDataSetProvider;
    cdsTitPagKTITPAG: TIntegerField;
    cdsTitPagNOME: TStringField;
    cdsTitPagENTIDADE: TStringField;
    cdsTitPagDOCUMENTO: TStringField;
    cdsTitPagLANCTO: TDateField;
    cdsTitPagKDESDPAG: TIntegerField;
    cdsTitPagVENCTO: TDateField;
    cdsTitPagVALOR: TFMTBCDField;
    cdsTitPagPAGTO: TDateField;
    cdsTitPagPAGO: TFMTBCDField;
    cdsTitPagPREVISTO: TStringField;
    cdsTitPagCONTA: TStringField;
    QRDBText6: TQRDBText;
    QRBand6: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel18: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
  private
    nBand: Integer;
    DiaAPagar: Currency;
    TotalAPagar: Currency;
    { Private declarations }
  public
    procedure OpenQuery(dIni, dFim: TDate);
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, DateUtils, Data.SQLTimSt, MaskUtils;

{$R *.dfm}

procedure TfqrFIN_APagarCompensacao.FormCreate(Sender: TObject);
begin
  nBand := 0;
  DiaAPagar := 0;
  TotalAPagar := 0;
end;

procedure TfqrFIN_APagarCompensacao.FormDestroy(Sender: TObject);
begin
  qryTitPag.Close;
end;

procedure TfqrFIN_APagarCompensacao.OpenQuery(dIni, dFim: TDate);
begin
  cdsTitPag.Close;

  If dIni <> 0 then
    begin
      qryTitPag.SQL.Text := Format( qryTitPag.SQL.Text, ['and d.VENCTO BetWeen :DATAINI and :DATAFIM'] );
      qryTitPag.ParamByName('DATAINI').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay ( dIni ) );
      qryTitPag.ParamByName('DATAFIM').asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( dFim ) );
      QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' + qryTitPag.ParamByName('DATAINI').AsString + ' a ' + qryTitPag.ParamByName('DATAFIM').AsString;
    end
  else
    qryTitPag.SQL.Text := Format( qryTitPag.SQL.Text, [''] );

  cdsTitPag.Open;
end;

procedure TfqrFIN_APagarCompensacao.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  DiaAPagar   := DiaAPagar + cdsTitPagVALOR.AsCurrency;
  TotalAPagar := TotalAPagar + cdsTitPagVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarCompensacao.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, TotalAPagar);
  TotalAPagar := 0;
end;

procedure TfqrFIN_APagarCompensacao.QRLabel14Print(sender: TObject; var Value: String);
begin
  Value := FormatFloat(Value, DiaAPagar);
  DiaAPagar := 0;
end;

end.
