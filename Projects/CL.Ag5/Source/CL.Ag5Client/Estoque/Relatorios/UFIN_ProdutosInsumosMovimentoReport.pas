unit UFIN_ProdutosInsumosMovimentoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, SysReportTypes, ReportTypes,
  Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsBalancoProdutos ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFIN_ProdutosInsumosMovimentoReport = class(TfqrSYS_BaseReport)
    cdsProdutosInsumos: TClientDataSet;
    dspProdutosInsumos: TDataSetProvider;
    sqlProdutosInsumos: TTcSQLDataSet;
    sqlMovimento: TTcSQLDataSet;
    dtsProdutos: TDataSource;
    cdsMovimento: TClientDataSet;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    sqlMovimentoKEST_PRODUTO: TStringField;
    sqlMovimentoDATA: TSQLTimeStampField;
    sqlMovimentoQTE_ENTRADA: TFloatField;
    sqlMovimentoVALOR_ENTRADA: TFloatField;
    sqlMovimentoQTE_SAIDA: TFloatField;
    sqlMovimentoVALOR_SAIDA: TFloatField;
    sqlMovimentoTOTAL_LANCAMENTO: TFloatField;
    sqlMovimentoPLANO_CONTA: TStringField;
    sqlMovimentoCENTRO_CUSTO: TStringField;
    cdsProdutosInsumosKEST_PRODUTO: TStringField;
    cdsProdutosInsumosKTIPO_PRODUTO: TStringField;
    cdsProdutosInsumosCODIGO: TStringField;
    cdsProdutosInsumosNOME: TStringField;
    cdsProdutosInsumosDESCRICAO: TMemoField;
    cdsProdutosInsumosUNIDADE: TStringField;
    cdsProdutosInsumosULTIMO_FORNECEDOR: TStringField;
    cdsProdutosInsumosESTOQUE: TFloatField;
    cdsProdutosInsumosCUSTO_MEDIO: TFloatField;
    cdsProdutosInsumosTOTAL: TFloatField;
    cdsProdutosInsumossqlMovimento: TDataSetField;
    cdsMovimentoKEST_PRODUTO: TStringField;
    cdsMovimentoDATA: TSQLTimeStampField;
    cdsMovimentoQTE_ENTRADA: TFloatField;
    cdsMovimentoVALOR_ENTRADA: TFloatField;
    cdsMovimentoQTE_SAIDA: TFloatField;
    cdsMovimentoVALOR_SAIDA: TFloatField;
    cdsMovimentoTOTAL_LANCAMENTO: TFloatField;
    cdsMovimentoPLANO_CONTA: TStringField;
    cdsMovimentoCENTRO_CUSTO: TStringField;
    cdsProdutosInsumosDESC_GRUPO: TStringField;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    sqlMovimentoTIPO: TStringField;
    cdsMovimentoTIPO: TStringField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    procedure TcMPFormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    nBand                  : Integer;
    TotalQtdeEntrada       : Currency;
    TotalValorEntrada      : Currency;
    TotalQtdeSaida         : Currency;
    TotalValorSaida        : Currency;
    TotalEstoque           : Currency;

//    TotalGeralQtdeEntrada  : Currency;
//    TotalGeralValorEntrada : Currency;
//    TotalGeralQtdeSaida    : Currency;
//    TotalGeralValorSaida   : Currency;
//    TotalGeralEstoque      : Currency;
    procedure ListaTipos;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

uses Tc.DBRTL.AbstractDB,UDBfinanceiro ;

{$R *.dfm}

{ TfqrCustomReport }


class function TFIN_ProdutosInsumosMovimentoReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_ProdutosInsumosMovimentoReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_ProdutosInsumosMovimentoReport.Initialize;
begin
  ListaTipos;

  inherited;

  with TSpecificReportParams ( Parameters ), cdsProdutosInsumos.Params do
    begin
      sqlMovimento.ParamByName( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DataInicial );
      sqlMovimento.ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( DataFinal ) ;

      case TipoTodosGrupoProduto of
         0  :
            Case ProdutoInsumo of
             0 : Caption := 'Movimentação de Produtos';
             1 : Caption := 'Movimentação de Insumos' ;
             2 : Caption := 'Movimentação de Produtos/Insumos' ;
            End;
         1 : Caption := 'Movimentação de Produtos/Insumos por grupo' ;
         2 : Caption := 'Movimentação do Produtos/Insumos' ;
      end;

      ParamByName( 'KSYS$DOMAIN'  ).AsString  := KSYS_DOMAIN ;
      ParamByName( 'TIPO'         ).AsInteger := TipoTodosGrupoProduto ;
      ParamByName( 'TIPO_PRODUTO' ).AsInteger := ProdutoInsumo ;
      ParamByName( 'KGRUPO'       ).AsString  := KGrupo ;
      ParamByName( 'KEST_PRODUTO' ).AsString  := KPRoduto;

      _qrlDescricao.Caption := DateSuppl.TDateSuppl.GetStringPeriodo( DataInicial, DataFinal ) ;
    end ;

  cdsProdutosInsumos.Open ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;
end;

procedure TFIN_ProdutosInsumosMovimentoReport.ListaTipos;
const
  SQL_LISTA = 'SELECT KCAD_TIPOS, DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = 3 ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;
begin
  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString   := LoggedUser.DomainID;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cdsTiposProduto, SQL_LISTA, p );

  if cdsTiposProduto.IsEmpty then
    Exit;

  p.Free;
end;

procedure TFIN_ProdutosInsumosMovimentoReport.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If Odd( nBand ) then
    Sender.Color := clWhite
  else
    Sender.Color := $00F0F0F0;
  Inc( nBand );

  TotalQtdeEntrada       := TotalQtdeEntrada       + cdsMovimentoQTE_ENTRADA.AsCurrency;
  TotalValorEntrada      := TotalValorEntrada      + cdsMovimentoVALOR_ENTRADA.AsCurrency;
  TotalQtdeSaida         := TotalQtdeSaida         + cdsMovimentoQTE_SAIDA.AsCurrency;
  TotalValorSaida        := TotalValorSaida        + cdsMovimentoVALOR_SAIDA.AsCurrency;
  TotalEstoque           := TotalEstoque           + cdsMovimentoTOTAL_LANCAMENTO.AsCurrency;

//  TotalGeralQtdeEntrada  := TotalGeralQtdeEntrada  + cdsMovimentoQTE_ENTRADA.AsCurrency;
//  TotalGeralValorEntrada := TotalGeralValorEntrada + cdsMovimentoVALOR_ENTRADA.AsCurrency;
//  TotalGeralQtdeSaida    := TotalGeralQtdeSaida    + cdsMovimentoQTE_SAIDA.AsCurrency;
//  TotalGeralValorSaida   := TotalGeralValorSaida   + cdsMovimentoVALOR_SAIDA.AsCurrency;

////  if cdsMovimentoTIPO.AsString = 'E' then
////    TotalGeralEstoque    := TotalGeralEstoque      + cdsMovimentoTOTAL_LANCAMENTO.AsCurrency
////  else
////    TotalGeralEstoque    := TotalGeralEstoque      - cdsMovimentoTOTAL_LANCAMENTO.AsCurrency
end;

procedure TFIN_ProdutosInsumosMovimentoReport.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel19.Caption := '';
  QRLabel20.Caption := '';
  QRLabel21.Caption := '';
  QRLabel22.Caption := '';
  QRLabel23.Caption := '';

  QRLabel19.Caption := FormatFloat( '#,0.##', TotalQtdeEntrada );
  QRLabel20.Caption := FormatFloat( '#,0.00', TotalValorEntrada );
  QRLabel21.Caption := FormatFloat( '#,0.##', TotalQtdeSaida );
  QRLabel22.Caption := FormatFloat( '#,0.00', TotalValorSaida );
  QRLabel23.Caption := FormatFloat( '#,0.00', TotalEstoque );
end;

procedure TFIN_ProdutosInsumosMovimentoReport.rbDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalQtdeEntrada  := 0;
  TotalValorEntrada := 0;
  TotalQtdeSaida    := 0;
  TotalValorSaida   := 0;
  TotalEstoque      := 0;
end;

procedure TFIN_ProdutosInsumosMovimentoReport.rbSummaryBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  qrlQtdeEntrada.Caption  := FormatFloat( qrlQtdeEntrada.Caption,  TotalGeralQtdeEntrada );
//  qrlValorEntrada.Caption := FormatFloat( qrlValorEntrada.Caption, TotalGeralValorEntrada );
//  qrlQtdeSaida.Caption    := FormatFloat( qrlQtdeSaida.Caption,    TotalGeralQtdeSaida );
//  qrlValorSaida.Caption   := FormatFloat( qrlValorSaida.Caption,   TotalGeralValorSaida );
//  qrlValorSaida.Caption   := FormatFloat( qrlValorSaida.Caption,   TotalGeralEstoque );

//  TotalGeralQtdeEntrada   := 0;
//  TotalGeralValorEntrada  := 0;
//  TotalGeralQtdeSaida     := 0;
//  TotalGeralValorSaida    := 0;
//  TotalGeralEstoque       := 0;
end;

procedure TFIN_ProdutosInsumosMovimentoReport.TcMPFormCreate(Sender: TObject);
begin
  inherited;
  nBand                  := 0;
  TotalQtdeEntrada       := 0;
  TotalValorEntrada      := 0;
  TotalQtdeSaida         := 0;
  TotalValorSaida        := 0;
  TotalEstoque           := 0;
//  TotalGeralQtdeEntrada  := 0;
//  TotalGeralValorEntrada := 0;
//  TotalGeralQtdeSaida    := 0;
//  TotalGeralValorSaida   := 0;
//  TotalGeralEstoque      := 0;
end;

end.
