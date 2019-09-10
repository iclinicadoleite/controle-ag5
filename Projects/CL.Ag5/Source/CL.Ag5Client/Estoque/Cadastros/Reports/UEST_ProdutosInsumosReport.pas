unit UEST_ProdutosInsumosReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils, SysWizardReportDialog, ReportTypes, SysReportTypes,
  UEST_ProdutosInsumosReportDialog, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsProdutos ;

  TSpecificReportDialog = TEST_ProdutosInsumosReportDialog ;

  TEST_ProdutosInsumosReport = class(TfqrSYS_BaseReport)
    cdsProdutosInsumo: TClientDataSet;
    dspProdutosInsumo: TDataSetProvider;
    sqlProdutosInsumo: TTcSQLDataSet;
    sqlProdutosInsumoCODIGO: TStringField;
    sqlProdutosInsumoNOME: TStringField;
    sqlProdutosInsumoDESCRICAO: TMemoField;
    sqlProdutosInsumoQTDE_PRODUTO: TFloatField;
    sqlProdutosInsumoCUSTO_MEDIO: TFloatField;
    sqlProdutosInsumoTOTAL: TFloatField;
    sqlProdutosInsumoBAIXA_ESTOQUE: TStringField;
    sqlProdutosInsumoQTDE_MINIMA: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    sqlProdutosInsumoUNIDADE: TStringField;
    cdsProdutosInsumoCODIGO: TStringField;
    cdsProdutosInsumoNOME: TStringField;
    cdsProdutosInsumoDESCRICAO: TMemoField;
    cdsProdutosInsumoQTDE_PRODUTO: TFloatField;
    cdsProdutosInsumoUNIDADE: TStringField;
    cdsProdutosInsumoCUSTO_MEDIO: TFloatField;
    cdsProdutosInsumoTOTAL: TFloatField;
    cdsProdutosInsumoBAIXA_ESTOQUE: TStringField;
    cdsProdutosInsumoQTDE_MINIMA: TFloatField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    sqlProdutosInsumoULTIMO_FORNECEDOR: TStringField;
    sqlProdutosInsumoKTIPO_PRODUTO: TStringField;
    cdsProdutosInsumoULTIMO_FORNECEDOR: TStringField;
    cdsProdutosInsumoKTIPO_PRODUTO: TStringField;
    cdsProdutosInsumoDESCR_TIPOPRODUTO: TStringField;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure cdsProdutosInsumoBAIXA_ESTOQUEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro;

{$R *.dfm}

{ TfqrCustomReport }


procedure TEST_ProdutosInsumosReport.cdsProdutosInsumoBAIXA_ESTOQUEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    if Sender.DataSet.FieldByName( 'BAIXA_ESTOQUE' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

class function TEST_ProdutosInsumosReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TEST_ProdutosInsumosReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TEST_ProdutosInsumosReport.Initialize;
const
  TIPO_PRODUTO = 3;
begin
  ListaTiposCadastro( cdsTiposProduto, TIPO_PRODUTO );

  inherited;

  with TSpecificReportParams ( Parameters ), cdsProdutosInsumo.Params do
    begin
      if (IS_PRODUTO = 'T') and (IS_INSUMO = 'F')then
        if POR_TIPO = 'T' then
          Caption := 'Relação de Produtos por grupo'
        else
          Caption := 'Relação de Produtos';

      if (IS_PRODUTO = 'F') and (IS_INSUMO = 'T')then
        if POR_TIPO = 'T' then
          Caption := 'Relação de Insumos por grupo'
        else
          Caption := 'Relação de Insumos';

      if (IS_PRODUTO = 'T') and (IS_INSUMO = 'T')then
        if POR_TIPO = 'T' then
          Caption := 'Relação de Produtos/Insumos por grupo'
        else
          Caption := 'Relação de Produtos/Insumos';

      if (IS_SERVICO = 'T') then
        Caption := 'Relação de Serviços';

      ParamByName( 'KSYS$DOMAIN' ).AsString  := KSYS_DOMAIN ;
      ParamByName( 'IS_PRODUTO' ).AsString   := IS_PRODUTO;
      ParamByName( 'IS_INSUMO' ).AsString    := IS_INSUMO;
      ParamByName( 'IS_SERVICO' ).AsString   := IS_SERVICO;
      ParamByName( 'DSP_INATIVO' ).AsString  := ATIVO;
      ParamByName( 'POR_TIPO' ).AsString     := POR_TIPO;
      ParamByName( 'TIPO' ).AsString         := TIPO;
    end ;

  cdsProdutosInsumo.Open ;

//  with TMailSuppl.GlobalMail do
//     begin
//       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
//       Message := 'Segue em Anexo ... ' ;
//     end ;
end;

procedure TEST_ProdutosInsumosReport.ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
const
  SQL_LISTA = 'SELECT ' +
              ' KCAD_TIPOS, ' +
              ' DESCRICAO ' +
              'FROM CAD_TIPOS ' +
              'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
              '  AND TIPO = :TIPO ' +
              'ORDER BY DESCRICAO ';
var
  p : TParams;

begin
  p := TParams.Create;
  p.CreateParam( ftString, 'KSYS$DOMAIN',  ptInput ).AsString  := LoggedUser.DomainID;
  p.CreateParam( ftInteger, 'TIPO',         ptInput ).AsInteger := Tipo;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( CDS, SQL_LISTA, p );

  if cds.IsEmpty then
    Exit;

  p.Free;
end;

end.
