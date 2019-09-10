unit UFIN_InventarioProdutosReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes, Tc.DBRTL.AbstractDB, Wrappers, System.Actions, Vcl.ActnList, Tc.VCL.Application, Tc.Data.SQLExpr  ;

type

  TSpecificReportParams = SysReportTypes.TReportParams ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TFIN_InventarioProdutosReport = class(TfqrSYS_BaseReport)
    cdsMaster: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TTcSQLDataSet;
    sqlMasterCODIGO: TStringField;
    sqlMasterNOME: TStringField;
    sqlMasterUNIDADE: TStringField;
    sqlMasterQTDE_MINIMA: TFloatField;
    sqlMasterQTDE_PRODUTO: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    sqlMasterKTIPO_PRODUTO: TStringField;
    cdsMasterCODIGO: TStringField;
    cdsMasterNOME: TStringField;
    cdsMasterUNIDADE: TStringField;
    cdsMasterQTDE_PRODUTO: TFloatField;
    cdsMasterQTDE_MINIMA: TFloatField;
    cdsMasterKTIPO_PRODUTO: TStringField;
    cdsMasterNOMEGRUPO: TStringField;
    cdsTiposProduto: TClientDataSet;
    cdsTiposProdutoKCAD_TIPOS: TStringField;
    cdsTiposProdutoDESCRICAO: TStringField;
    procedure cdsMasterCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

//uses UDBResources;

{$R *.dfm}

{ TfqrCustomReport }


procedure TFIN_InventarioProdutosReport.cdsMasterCalcFields(DataSet: TDataSet);
begin
  if ( dataSet.State in [dsInternalCalc] ) and ( cdsMasterNOMEGRUPO.isNull ) then
    begin
      if cdsTiposProdutoKCAD_TIPOS.asString <> cdsMasterKTIPO_PRODUTO.asString then
         cdsTiposProduto.Locate('KCAD_TIPOS', cdsMasterKTIPO_PRODUTO.asString, [] ) ;

      if cdsMasterKTIPO_PRODUTO.asString = cdsTiposProdutoKCAD_TIPOS.asString  then
         cdsMasterNOMEGRUPO.asString  := cdsTiposProdutoDESCRICAO.asString
      else
         cdsMasterNOMEGRUPO.asString  := '' ;
    end;
end;

class function TFIN_InventarioProdutosReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TFIN_InventarioProdutosReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TFIN_InventarioProdutosReport.Initialize;
begin

  with TSpecificReportParams ( Parameters ), cdsMaster.Params do
     begin
       //ParamByName( 'DATAINICIO' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( DataInicio ) ) ;
       //ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( DataFim ) ) ;
       ParamByName('KSYS$DOMAIN').asString := LoggedUser.DomainID ;
     end ;

  ListaTiposCadastro( cdsTiposProduto, 3 );
  cdsMaster.Open ;
  cdsMaster.IndexFieldNames := 'NOMEGRUPO;NOME' ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;


procedure TFIN_InventarioProdutosReport.ListaTiposCadastro(CDS: TClientDataSet; Tipo: Integer);
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

  Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'ENTIDADES' ).populateClientDataSet( CDS, SQL_LISTA, p );

  p.Free;
end;


end.
