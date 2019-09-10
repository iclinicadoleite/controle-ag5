unit UFIN_ConciliacaoBancariaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TFIN_ConciliacaoBancariaDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstConciliacao: TClientDataSet;
    dspLstConciliacao: TDataSetProvider;
    sqLstConciliacao: TTcSQLDataSet;
    dtsList: TDataSource;
    sqLstConciliacaoKFIN_CONTA: TStringField;
    sqLstConciliacaoNOMECONTA: TStringField;
    sqLstConciliacaoBANCO: TStringField;
    sqLstConciliacaoAGENCIA: TStringField;
    sqLstConciliacaoCONTA_CORRENTE: TStringField;
    sqLstConciliacaoVENCTO: TSQLTimeStampField;
    sqLstConciliacaoPAGTO: TSQLTimeStampField;
    sqLstConciliacaoHISTORICO: TStringField;
    sqLstConciliacaoDOCUMENTO: TStringField;
    sqLstConciliacaoCHEQUE: TStringField;
    sqLstConciliacaoCREDITO: TFloatField;
    sqLstConciliacaoDEBITO: TFloatField;
    sqLstConciliacaoDT_COMPENSACAO: TSQLTimeStampField;
    sqLstConciliacaoDEBITO_CREDITO: TStringField;
    cdsLstConciliacaoKFIN_CONTA: TStringField;
    cdsLstConciliacaoNOMECONTA: TStringField;
    cdsLstConciliacaoBANCO: TStringField;
    cdsLstConciliacaoAGENCIA: TStringField;
    cdsLstConciliacaoCONTA_CORRENTE: TStringField;
    cdsLstConciliacaoVENCTO: TSQLTimeStampField;
    cdsLstConciliacaoPAGTO: TSQLTimeStampField;
    cdsLstConciliacaoHISTORICO: TStringField;
    cdsLstConciliacaoDOCUMENTO: TStringField;
    cdsLstConciliacaoCHEQUE: TStringField;
    cdsLstConciliacaoCREDITO: TFloatField;
    cdsLstConciliacaoDEBITO: TFloatField;
    cdsLstConciliacaoDT_COMPENSACAO: TSQLTimeStampField;
    cdsLstConciliacaoDEBITO_CREDITO: TStringField;
    sqLstConciliacaoOBS: TMemoField;
    cdsLstConciliacaoOBS: TMemoField;
    cdsConciliacao: TClientDataSet;
    dspConciliacao: TDataSetProvider;
    sqlConciliacao: TTcSQLDataSet;
    sqlConciliacaoKSYSDOMAIN: TStringField;
    sqlConciliacaoKFIN_CONTA: TStringField;
    sqlConciliacaoNOMECONTA: TStringField;
    sqlConciliacaoBANCO: TStringField;
    sqlConciliacaoAGENCIA: TStringField;
    sqlConciliacaoCONTA_CORRENTE: TStringField;
    sqlConciliacaoPAGTO: TSQLTimeStampField;
    sqlConciliacaoHISTORICO: TStringField;
    sqlConciliacaoDOCUMENTO: TStringField;
    sqlConciliacaoVALOR: TFloatField;
    sqlConciliacaoCHEQUE: TStringField;
    sqlConciliacaoDT_COMPENSACAO: TSQLTimeStampField;
    sqlConciliacaoDEBITO_CREDITO: TStringField;
    sqlConciliacaoOBS: TMemoField;
    cdsConciliacaoKSYSDOMAIN: TStringField;
    cdsConciliacaoKFIN_CONTA: TStringField;
    cdsConciliacaoNOMECONTA: TStringField;
    cdsConciliacaoBANCO: TStringField;
    cdsConciliacaoAGENCIA: TStringField;
    cdsConciliacaoCONTA_CORRENTE: TStringField;
    cdsConciliacaoPAGTO: TSQLTimeStampField;
    cdsConciliacaoHISTORICO: TStringField;
    cdsConciliacaoDOCUMENTO: TStringField;
    cdsConciliacaoVALOR: TFloatField;
    cdsConciliacaoCHEQUE: TStringField;
    cdsConciliacaoDT_COMPENSACAO: TSQLTimeStampField;
    cdsConciliacaoDEBITO_CREDITO: TStringField;
    cdsConciliacaoOBS: TMemoField;
    sqLstConciliacaoORIGEM: TIntegerField;
    cdsLstConciliacaoORIGEM: TIntegerField;
    sqLstConciliacaoKFIN_PARCELA: TStringField;
    cdsLstConciliacaoKFIN_PARCELA: TStringField;
    procedure cdsLstConciliacaoNewRecord(DataSet: TDataSet);
    procedure cdsConciliacaoNewRecord(DataSet: TDataSet);
    procedure cdsLstConciliacaoDEBITO_CREDITOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsLstConciliacaoDT_COMPENSACAOValidate(Sender: TField);
    procedure dspLstConciliacaoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetFilter( Compensado : Boolean );
    procedure SetConta( Key, Conta, Banco, Agencia, CC : string ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions, UDBFinanceiro
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;



{ TrdmFIN_ConciliacaoBancariaDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_ConciliacaoBancariaDatamodule.Create(AOwner: TComponent);
var
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}

var
  FCompensado : Boolean;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TFIN_ConciliacaoBancariaDatamodule.OpenTables;
begin
  inherited;
  //
end;

procedure TFIN_ConciliacaoBancariaDatamodule.SetConta(Key, Conta, Banco, Agencia, CC: string);
begin
   if not ( cdsConciliacao.State in [dsInsert,dsEdit] ) then
      cdsConciliacao.Edit ;

   cdsConciliacaoKFIN_CONTA.asString     := Key ;
   cdsConciliacaoNOMECONTA.AsString      := Conta ;
   cdsConciliacaoBANCO.AsString          := Banco ;
   cdsConciliacaoAGENCIA.AsString        := Agencia ;
   cdsConciliacaoCONTA_CORRENTE.AsString := CC ;
end;

procedure TFIN_ConciliacaoBancariaDatamodule.SetFilter(Compensado: Boolean);
begin
  FCompensado := Compensado;
  SetParams;
  Self.RefreshList;
end;

procedure TFIN_ConciliacaoBancariaDatamodule.SetParams;
begin
  cdsLstConciliacao.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
  cdsLstConciliacao.Params.ParamByName( 'COMPENSADO' ).asString   := BoolToChar( FCompensado ) ;
end;

procedure TFIN_ConciliacaoBancariaDatamodule.cdsLstConciliacaoDEBITO_CREDITOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if dtsList.DataSet.FieldByName( 'DEBITO_CREDITO' ).AsString = 'D' then
      Text := 'Débito'
    else if dtsList.DataSet.FieldByName( 'DEBITO_CREDITO' ).AsString = 'C' then
      Text := 'Crédito';
end;

procedure TFIN_ConciliacaoBancariaDatamodule.cdsLstConciliacaoDT_COMPENSACAOValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data de compensação não pode ser superior a data atual.');

  if Sender.AsDateTime < cdsConciliacaoPAGTO.AsDateTime then
    raise Warning.Create('Data de compensação não pode ser inferior a data de emissão.');
end;

procedure TFIN_ConciliacaoBancariaDatamodule.cdsLstConciliacaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TFIN_ConciliacaoBancariaDatamodule.dspLstConciliacaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
//  if DeltaDS.FieldByName ( 'ORIGEM' ).asInteger = 1 then
//     'UPDATE FIN_ARECEBER_PARCELAS SET DT_COMPENSACAO = ' + cdsLstConciliacaoDT_COMPENSACAO.AsDateTime +
//     ' WHERE KFIN_ARECEBER_PARCELA = ' + cdsLstConciliacaoKFIN_CONTA.AsString
//  else if DeltaDS.FieldByName ( 'ORIGEM' ).asInteger = 2 then
//     'UPDATE FIN_APAGAR_PARCELAS SET DT_COMPENSACAO = ' + cdsLstConciliacaoDT_COMPENSACAO.AsDateTime +
//     ' WHERE KFIN_APAGAR_PARCELA = ' + cdsLstConciliacaoKFIN_CONTA.AsString;
end;

procedure TFIN_ConciliacaoBancariaDatamodule.cdsConciliacaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsConciliacaoKSYSDOMAIN.AsString := LoggedUser.DomainID;
end;

end.
