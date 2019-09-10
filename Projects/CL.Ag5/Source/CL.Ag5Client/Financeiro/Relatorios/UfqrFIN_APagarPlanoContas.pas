unit UfqrFIN_APagarPlanoContas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, QRCtrls, QuickRpt, VCL.ExtCtrls, 
  UfqrSYS_BaseReport, jpeg;

type
  TfqrFIN_APagarPlanoContas = class(TfqrSYS_BaseReport)
    qryNivel1: TSQLQuery;
    qryNivel2: TSQLQuery;
    qryNivel3: TSQLQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    dtsNivel1: TDataSource;
    qryNivel1KPLANO: TIntegerField;
    qryNivel1CODIGO: TStringField;
    qryNivel1NOME: TStringField;
    qryNivel1KPLANOPAI: TIntegerField;
    qryNivel2KPLANO: TIntegerField;
    qryNivel2CODIGO: TStringField;
    qryNivel2NOME: TStringField;
    qryNivel2KPLANOPAI: TIntegerField;
    dtsNivel2: TDataSource;
    qryNivel3KPLANO: TIntegerField;
    qryNivel3CODIGO: TStringField;
    qryNivel3NOME: TStringField;
    qryNivel3KPLANOPAI: TIntegerField;
    QRSubDetail3: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qryValorTitPag: TSQLQuery;
    qryValorTitPagVALOR: TFMTBCDField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qryValorTitRec: TSQLQuery;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand6: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qryValorTitRecVALOR: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure qryNivel1AfterScroll(DataSet: TDataSet);
    procedure qryNivel2AfterScroll(DataSet: TDataSet);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
  private
    nBand: Integer;
    TotalPag, TotalPagGeral: Currency;
    TotalRec, TotalRecGeral: Currency;
    { Private declarations }
  public
    procedure OpenQuery(dIni, dFim: TDate);
    { Public declarations }
  end;

implementation

uses UDBFinanceiro, DateUtils, Data.SQLTimSt, MaskUtils;

{$R *.dfm}

procedure TfqrFIN_APagarPlanoContas.FormCreate(Sender: TObject);
begin
  nBand := 0;
  TotalPag := 0;
  TotalPagGeral := 0;
  TotalRec := 0;
  TotalRecGeral := 0;
end;

procedure TfqrFIN_APagarPlanoContas.FormDestroy(Sender: TObject);
begin
  qryNivel3.Close;
  qryNivel2.Close;
  qryNivel1.Close;
end;

procedure TfqrFIN_APagarPlanoContas.OpenQuery(dIni, dFim: TDate);
begin
  If dIni <> 0 then
    begin
      qryValorTitPag.SQL.Text := Format( qryValorTitPag.SQL.Text, ['and d.Pagto BetWeen :DATAINI and :DATAFIM'] );
      qryValorTitPag.ParamByName('DATAINI').asSQLTimeStamp  := DateTimeToSQLTimeStamp ( StartOfTheDay (  dIni ) ) ;
      qryValorTitPag.ParamByName('DATAFIM').asSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay (  dFim ) ) ;

      qryValorTitRec.SQL.Text := Format( qryValorTitRec.SQL.Text, ['and d.Pagto BetWeen :DATAINI and :DATAFIM'] );
      qryValorTitRec.ParamByName('DATAINI').asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  dIni ) ) ;
      qryValorTitRec.ParamByName('DATAFIM').asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  dFim ) ) ;

      QuickRep.ReportTitle := QuickRep.ReportTitle + ' - ' + qryValorTitPag.ParamByName('DATAINI').AsString + ' a ' + qryValorTitPag.ParamByName('DATAFIM').AsString;
     end
  else
    begin
      qryValorTitPag.SQL.Text := Format( qryValorTitPag.SQL.Text, [''] );
      qryValorTitRec.SQL.Text := Format( qryValorTitRec.SQL.Text, [''] );
    end;
  qryNivel1.Open;
end;

procedure TfqrFIN_APagarPlanoContas.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
    If qryTitPagPAGTO.IsNull or (Filtro <> 'd.Vencto') then
      Sender.Font.Style := Self.Font.Style -[fsStrikeOut]
    else
      Sender.Font.Style := Self.Font.Style +[fsStrikeOut];

  If Odd(nBand) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc(nBand);

  If qryTitPagPAGTO.IsNull then
    TotalAPagar := TotalAPagar + qryTitPagVALOR.AsCurrency
  else
    TotalPago := TotalPago + qryTitPagPAGO.AsCurrency;
}
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel8Print(sender: TObject;
  var Value: String);
begin
//  Value := FormatFloat(Value, TotalPago);
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel10Print(sender: TObject; var Value: String);
begin
//  Value := FormatFloat(Value, TotalAPagar);
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  qryValorTitPag.Close;
  qryValorTitPag.ParamByName('KPLANO').AsInteger := qryNivel1KPLANO.AsInteger;
  qryValorTitPag.Open;
  Value :=  FormatFloat(',0.00', qryValorTitPagVALOR.AsCurrency );
  TotalPag      := TotalPag      +qryValorTitPagVALOR.AsCurrency;
  TotalPagGeral := TotalPagGeral +qryValorTitPagVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  qryValorTitPag.Close;
  qryValorTitPag.ParamByName('KPLANO').AsInteger := qryNivel2KPLANO.AsInteger;
  qryValorTitPag.Open;
  Value :=  FormatFloat(',0.00', qryValorTitPagVALOR.AsCurrency );
  TotalPag      := TotalPag      +qryValorTitPagVALOR.AsCurrency;
  TotalPagGeral := TotalPagGeral +qryValorTitPagVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  qryValorTitPag.Close;
  qryValorTitPag.ParamByName('KPLANO').AsInteger := qryNivel3KPLANO.AsInteger;
  qryValorTitPag.Open;
  Value :=  FormatFloat(',0.00', qryValorTitPagVALOR.AsCurrency );
  TotalPag      := TotalPag      +qryValorTitPagVALOR.AsCurrency;
  TotalPagGeral := TotalPagGeral +qryValorTitPagVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.qryNivel1AfterScroll(DataSet: TDataSet);
begin
  qryNivel2.Open;
end;

procedure TfqrFIN_APagarPlanoContas.qryNivel2AfterScroll(DataSet: TDataSet);
begin
  qryNivel3.Open;
end;

{
Select
    Sum( d.VALOR ) as Valor
FROM TITPAG t
  JOIN DESDPAG d on (d.KTITPAG = t.KTITPAG)
  Left JOIN PLANO n3 on (n3.KPLANO = t.KPLANO)
    Left JOIN PLANO n2 on (n2.KPLANO = n3.KPLANOPAI)
      Left JOIN PLANO n1 on (n1.KPLANO = n2.KPLANOPAI)
Where n3.KPLANO = :KPLANO
   or n2.KPLANO = :KPLANO
   or n1.KPLANO = :KPLANO
}

procedure TfqrFIN_APagarPlanoContas.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalPag );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalPagGeral );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel9Print(sender: TObject;
  var Value: String);
begin
  qryValorTitPag.Close;
  qryValorTitPag.ParamByName('KPLANO').AsInteger := 0;
  qryValorTitPag.Open;
  Value :=  FormatFloat(',0.00', qryValorTitPagVALOR.AsCurrency );
  TotalPagGeral := TotalPagGeral +qryValorTitPagVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel11Print(sender: TObject;
  var Value: String);
begin
  qryValorTitRec.Close;
  qryValorTitRec.ParamByName('KPLANO').AsInteger := qryNivel1KPLANO.AsInteger;
  qryValorTitRec.Open;
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency );
  TotalRec      := TotalRec      +qryValorTitRecVALOR.AsCurrency;
  TotalRecGeral := TotalRecGeral +qryValorTitRecVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  qryValorTitRec.Close;
  qryValorTitRec.ParamByName('KPLANO').AsInteger := qryNivel2KPLANO.AsInteger;
  qryValorTitRec.Open;
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency );
  TotalRec      := TotalRec      +qryValorTitRecVALOR.AsCurrency;
  TotalRecGeral := TotalRecGeral +qryValorTitRecVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  qryValorTitRec.Close;
  qryValorTitRec.ParamByName('KPLANO').AsInteger := qryNivel3KPLANO.AsInteger;
  qryValorTitRec.Open;
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency );
  TotalRec      := TotalRec      +qryValorTitRecVALOR.AsCurrency;
  TotalRecGeral := TotalRecGeral +qryValorTitRecVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel17Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalRec );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel21Print(sender: TObject;
  var Value: String);
begin
  qryValorTitRec.Close;
  qryValorTitRec.ParamByName('KPLANO').AsInteger := 0;
  qryValorTitRec.Open;
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency );
  TotalRecGeral := TotalRecGeral +qryValorTitRecVALOR.AsCurrency;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalRecGeral );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency -qryValorTitPagVALOR.AsCurrency );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency -qryValorTitPagVALOR.AsCurrency );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel16Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency -qryValorTitPagVALOR.AsCurrency );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalRec -TotalRec );
  TotalPag := 0;
  TotalRec := 0;
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel22Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', qryValorTitRecVALOR.AsCurrency -qryValorTitPagVALOR.AsCurrency );
end;

procedure TfqrFIN_APagarPlanoContas.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  Value :=  FormatFloat(',0.00', TotalRecGeral -TotalPagGeral );
  TotalPagGeral := 0;
  TotalRecGeral := 0;
end;

end.

