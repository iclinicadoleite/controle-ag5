unit UfqrCOMPRAS_Pedido;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, jpeg, qrprntr,
  DateSuppl, DateUtils, SysReportTypes, System.Actions, Vcl.ActnList,
  Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TfqrCOMPRAS_Pedido = class(TfqrSYS_BaseReport)
    dspPedido: TDataSetProvider;
    sqlPedido: TTcSQLDataSet;
    sqlPedidoKCAD_ENTIDADE: TIntegerField;
    sqlPedidoCODIGO: TStringField;
    sqlPedidoDATA: TSQLTimeStampField;
    sqlPedidoNOMEENTIDADE: TStringField;
    sqlPedidoKCAD_CONTATO: TIntegerField;
    sqlPedidoNOMECONTATO: TStringField;
    sqlPedidoEMAIL: TStringField;
    sqlPedidoDEPTO: TStringField;
    dtsSQLPedido: TDataSource;
    sqlItensPedido: TTcSQLDataSet;
    sqlItensPedidoCODIGO: TStringField;
    sqlItensPedidoNOME: TStringField;
    sqlItensPedidoQTDE: TFloatField;
    sqlItensPedidoTOTAL: TFloatField;
    sqlItensPedidoCUSTO: TFloatField;
    sqlItensPedidoIPI: TFloatField;
    sqlItensPedidoOBS: TMemoField;
    cdsPedido: TClientDataSet;
    cdsPedidoKCAD_ENTIDADE: TIntegerField;
    cdsPedidoCODIGO: TStringField;
    cdsPedidoDATA: TSQLTimeStampField;
    cdsPedidoNOMEENTIDADE: TStringField;
    cdsPedidoKCAD_CONTATO: TIntegerField;
    cdsPedidoNOMECONTATO: TStringField;
    cdsPedidoEMAIL: TStringField;
    cdsPedidoDEPTO: TStringField;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoKEST_PRODUTO: TIntegerField;
    cdsItensPedidoCODIGO: TStringField;
    cdsItensPedidoNOME: TStringField;
    cdsItensPedidoQTDE: TFloatField;
    cdsItensPedidoTOTAL: TFloatField;
    cdsItensPedidoCUSTO: TFloatField;
    cdsItensPedidoIPI: TFloatField;
    cdsItensPedidoOBS: TMemoField;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRImage1: TQRImage;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand3: TQRChildBand;
    GroupFooterBand1: TQRBand;
    ChildBand4: TQRChildBand;
    QRLabel15: TQRLabel;
    cdsItensPedidoSomaTotal: TAggregateField;
    QRDBText8: TQRDBText;
    ChildBand5: TQRChildBand;
    QRLabel20: TQRLabel;
    qrmDescricaoItens: TQRMemo;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    qrmObservacoesPedido: TQRMemo;
    QRLabel21: TQRLabel;
    sqlPedidoKCMP_PEDIDO: TIntegerField;
    sqlPedidoSTATUS: TSmallintField;
    sqlItensPedidoKCMP_PEDIDO_ITENS: TIntegerField;
    sqlItensPedidoKCMP_PEDIDO: TIntegerField;
    sqlItensPedidoKEST_PRODUTO: TIntegerField;
    cdsPedidoKCMP_PEDIDO: TIntegerField;
    cdsPedidoSTATUS: TSmallintField;
    cdsPedidosqlItensPedido: TDataSetField;
    cdsItensPedidoKCMP_PEDIDO_ITENS: TIntegerField;
    cdsItensPedidoKCMP_PEDIDO: TIntegerField;
    sqlPedidoFONE: TStringField;
    sqlPedidoNOMECOMPRADOR: TStringField;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    cdsPedidoFONE: TStringField;
    cdsPedidoNOMECOMPRADOR: TStringField;
    sqlItensPedidoDETALHES: TMemoField;
    cdsItensPedidoDETALHES: TMemoField;
    sqlPedidoOBS: TMemoField;
    cdsPedidoOBS: TMemoField;
    ChildBand6: TQRChildBand;
    QRLabel22: TQRLabel;
    qrmObservacaoItens: TQRMemo;
    QRShape13: TQRShape;
    QRSubDetail2: TQRSubDetail;
    GroupFooterBand2: TQRBand;
    GroupHeaderBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape14: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText10: TQRDBText;
    sqlServicosPedido: TTcSQLDataSet;
    cdsServicosPedido: TClientDataSet;
    sqlServicosPedidoKCMP_PEDIDO_SERVICO: TIntegerField;
    sqlServicosPedidoKCMP_PEDIDO: TIntegerField;
    sqlServicosPedidoKEST_PRODUTO: TIntegerField;
    sqlServicosPedidoCODIGO: TStringField;
    sqlServicosPedidoNOME: TStringField;
    sqlServicosPedidoQTDE: TFloatField;
    sqlServicosPedidoTOTAL: TFloatField;
    sqlServicosPedidoCUSTO: TFloatField;
    sqlServicosPedidoDETALHES: TMemoField;
    sqlServicosPedidoOBS: TMemoField;
    cdsPedidosqlServicosPedido: TDataSetField;
    cdsServicosPedidoKCMP_PEDIDO_SERVICO: TIntegerField;
    cdsServicosPedidoKCMP_PEDIDO: TIntegerField;
    cdsServicosPedidoKEST_PRODUTO: TIntegerField;
    cdsServicosPedidoCODIGO: TStringField;
    cdsServicosPedidoNOME: TStringField;
    cdsServicosPedidoQTDE: TFloatField;
    cdsServicosPedidoTOTAL: TFloatField;
    cdsServicosPedidoCUSTO: TFloatField;
    cdsServicosPedidoDETALHES: TMemoField;
    cdsServicosPedidoOBS: TMemoField;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    cdsServicosPedidoSomaTotal: TAggregateField;
    QRLabel30: TQRLabel;
    ChildBand7: TQRChildBand;
    ChildBand8: TQRChildBand;
    qrmDescricaoServicos: TQRMemo;
    QRLabel31: TQRLabel;
    qrmObservacaoServicos: TQRMemo;
    QRShape15: TQRShape;
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure ChildBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FEmiteLogo : boolean ;
    FTipoFolha : TTipoFolha ;
    procedure Inicializa ( TipoEmissao : TTipoEmissao ; KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
  public
    { Public declarations }
    class procedure Preview ( KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
    class procedure Print ( KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
    class procedure SaveToPDF ( FileName : string ; KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
  end;


implementation

uses UDBFinanceiro, MailSuppl ;

{$R *.dfm}

class procedure TfqrCOMPRAS_Pedido.Preview ( KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
var
  fqrCOMPRAS_Pedido : TfqrCOMPRAS_Pedido ;
begin
  fqrCOMPRAS_Pedido := TfqrCOMPRAS_Pedido.Create ( nil ) ;
  fqrCOMPRAS_Pedido.Inicializa(  tePreview, KPedido, TipoFolha, EmiteLogo ) ;
  fqrCOMPRAS_Pedido.free ;
end;

class procedure TfqrCOMPRAS_Pedido.Print( KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
var
  fqrCOMPRAS_Pedido : TfqrCOMPRAS_Pedido ;
begin
  fqrCOMPRAS_Pedido := TfqrCOMPRAS_Pedido.Create ( nil ) ;
  fqrCOMPRAS_Pedido.Inicializa(  tePrint, KPedido, TipoFolha, EmiteLogo ) ;
  fqrCOMPRAS_Pedido.free ;
end;

class procedure TfqrCOMPRAS_Pedido.SaveToPDF( FileName : string ; KPedido : integer ; TipoFolha : TTipoFolha ; EmiteLogo : boolean ) ;
var
  fqrCOMPRAS_Pedido : TfqrCOMPRAS_Pedido ;
begin
  fqrCOMPRAS_Pedido := TfqrCOMPRAS_Pedido.Create ( nil ) ;
  fqrCOMPRAS_Pedido.Inicializa(  tePDF, KPedido, TipoFolha, EmiteLogo ) ;
  fqrCOMPRAS_Pedido.free ;
end;


procedure TfqrCOMPRAS_Pedido.ChildBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrmDescricaoItens.Lines.Text := cdsItensPedidoDETALHES.AsString ;
  PrintBand := cdsItensPedidoDETALHES.AsString <> '' ;
end;

procedure TfqrCOMPRAS_Pedido.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrmObservacoesPedido.Lines.Text := cdsPedidoOBS.AsString ;
  PrintBand := cdsPedidoOBS.AsString <> '' ;
end;

procedure TfqrCOMPRAS_Pedido.QRDBText8Print(sender: TObject;
  var Value: String);
var
  Valor : Double ;
begin
  inherited;
  Try
     Valor := TryVarToFloat ( cdsItensPedidoSomaTotal.Value ) ;
     Value := FormatFloat ( '#,0.00', Valor ) ;
  except
     Value := '<error>' ;
  end
end;

procedure TfqrCOMPRAS_Pedido.Inicializa(TipoEmissao : TTipoEmissao ; KPedido: integer;
  TipoFolha: TTipoFolha; EmiteLogo: boolean);
var
   x : integer ;
begin

  _qrImageLogo.Enabled := ( TipoFolha = tfPapelBranco ) and EmiteLogo ;

  if ( TipoFolha = tfPapelBranco ) and not EmiteLogo then
  begin
     QuickRep.Page.PaperSize := Letter ;
     QuickRep.Font.Name := 'Draft 12cpi' ;
     for x := 0 to self.ComponentCount - 1 do
       begin
          if self.Components[ x ] is TQRLabel then
             TQRLabel ( self.Components[ x ] ).Font.Name := 'Draft 12cpi'
          else if self.Components[ x ] is TQRDBText then
             TQRDBText ( self.Components[ x ] ).Font.Name := 'Draft 12cpi' ;
       end ;
  end ;

  if TipoFolha = tfPapelBranco then
     begin
        QRImage1.Picture.Bitmap.Width  := 1 ;
        QRImage1.Picture.Bitmap.Height := 1 ;
        QuickRep.Page.TopMargin := 10 ;
     end
  else if TipoFolha = tfPapelTimbrado then
     begin
        QRImage1.Picture.Bitmap.Width  :=1 ;
        QRImage1.Picture.Bitmap.Height :=1 ;
        QuickRep.Page.TopMargin := 45 ;
        rbPageFooter.Enabled := False ;
     end ;

  cdsPedido.Params.ParamByName( 'KCMP_PEDIDO' ).asInteger := KPedido ;
  TCDSSuppl.Open ( cdsPedido ) ;
  QuickRep.ReportTitle :=  QuickRep.ReportTitle + ' - No ' + cdsPedidoCODIGO.asString ;

  TCDSSuppl.Open ( cdsItensPedido );
  TCDSSuppl.Open ( cdsServicosPedido ) ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       ToList.Add ( cdsPedidoEMAIL.asString ) ;
       Message := 'Segue Pedido em Anexo' ;
     end ;

  if TipoEmissao = tePreview then
     QuickRep.Preview

  else if TipoEmissao = tePrint then
     QuickRep.Print

  else if TipoEmissao = tePDF then
    begin
       QuickRep.Prepare ;
       //fqrCOMPRAS_Pedido.QuickRep.Print ;
     end ;

end;

procedure TfqrCOMPRAS_Pedido.ChildBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrmObservacaoItens.Lines.Text := cdsItensPedidoOBS.AsString ;
  PrintBand := cdsItensPedidoOBS.AsString <> '' ;
end;

procedure TfqrCOMPRAS_Pedido.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value + ' - ' + cdsPedidoEMAIL.asString ;
end;

procedure TfqrCOMPRAS_Pedido.QRDBText9Print(sender: TObject;
  var Value: String);
var
  Valor : Double ;
begin
  inherited;
  Try
     Valor := TryVarToFloat ( cdsServicosPedidoSomaTotal.Value ) ;
     Value := FormatFloat ( '#,0.00', Valor ) ;
  except
     Value := '<error>' ;
  end
end;

procedure TfqrCOMPRAS_Pedido.QRDBText10Print(sender: TObject; var Value: String);
var
  V1, V2 : Double ;
begin
  inherited;
  Try
     V1 := TryVarToFloat ( cdsItensPedidoSomaTotal.Value ) ;
     V2 := TryVarToFloat ( cdsServicosPedidoSomaTotal.Value ) ;
     Value := FormatFloat ( '#,0.00', V1 + V2 ) ;
  except
     Value := '<error>' ;
  end

end;

procedure TfqrCOMPRAS_Pedido.ChildBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrmDescricaoServicos.Lines.Text := cdsServicosPedidoDETALHES.AsString ;
  PrintBand := cdsServicosPedidoDETALHES.AsString <> '' ;
end;

procedure TfqrCOMPRAS_Pedido.ChildBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrmObservacaoServicos.Lines.Text := cdsServicosPedidoOBS.AsString ;
  PrintBand := cdsServicosPedidoOBS.AsString <> '' ;
end;

end.
