unit UdtmFIN_Bancos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TdtmFIN_Bancos = class(T_dtmBASEDBListEdit)
    cdsLstBancos: TClientDataSet;
    cdsBanco: TClientDataSet;
    dtsList: TDataSource;
    cdsLstBancosKFIN_BANCO: TStringField;
    cdsLstBancosCODIGO: TStringField;
    cdsLstBancosNOME: TStringField;
    cdsLstBancosHOMEPAGE: TStringField;
    cdsLstBancosFEBRABAN: TStringField;
    cdsBancoKFIN_BANCO: TStringField;
    cdsBancoCODIGO: TStringField;
    cdsBancoNOME: TStringField;
    cdsBancoHOMEPAGE: TStringField;
    cdsBancoFEBRABAN: TStringField;
    dspLstBancos: TDataSetProvider;
    dspBanco: TDataSetProvider;
    sqlLstBancos: TTcSQLDataSet;
    sqlLstBancosKFIN_BANCO: TStringField;
    sqlLstBancosCODIGO: TStringField;
    sqlLstBancosNOME: TStringField;
    sqlLstBancosHOMEPAGE: TStringField;
    sqlLstBancosFEBRABAN: TStringField;
    sqlBanco: TTcSQLDataSet;
    sqlBancoKFIN_BANCO: TStringField;
    sqlBancoCODIGO: TStringField;
    sqlBancoNOME: TStringField;
    sqlBancoHOMEPAGE: TStringField;
    sqlBancoFEBRABAN: TStringField;
    dtsSQLEdit: TDataSource;
    cdsImportaBancos: TClientDataSet;
    cdsImportaBancosKFIN_BANCO: TStringField;
    cdsImportaBancosCODIGO: TStringField;
    cdsImportaBancosNOME: TStringField;
    cdsImportaBancosHOMEPAGE: TStringField;
    cdsImportaBancosFEBRABAN: TStringField;
    cdsImportaBancosIMPORT: TBooleanField;
    cdsImportaBancosEXISTS: TBooleanField;
    procedure cdsLstBancosNewRecord(DataSet: TDataSet);
    procedure cdsBancoNewRecord(DataSet: TDataSet);
    procedure cdsBancoCODIGOValidate(Sender: TField);
    function PesquisaCodigo( CodBanco : String ) : Boolean ;
    procedure cdsLstBancosBeforeOpen(DataSet: TDataSet);
    procedure cdsLstBancosFEBRABANGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Exceptions
     , DataSnap.DSConnect
      ;

{$R *.dfm}

{ TrdmdtmFIN_Bancos }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_Bancos.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TdtmCustomListaFicha }

procedure TdtmFIN_Bancos.OpenTables;
begin
  inherited;
  //
end;

function TdtmFIN_Bancos.PesquisaCodigo(CodBanco: String): Boolean;
const
  SELECT_BANCOS = 'SELECT COUNT(1) FROM FIN_BANCOS WHERE CODIGO = :CODIGO_BANCO';

var
  cds : TClientDataSet;
  p : TParams;
begin
  cds := nil;
  p := TParams.Create;

  p.CreateParam(ftString, 'CODIGO_BANCO', ptInput).AsString := CodBanco ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, SELECT_BANCOS, p);

  Result := cds.FieldByName( 'COUNT' ).AsInteger > 0;

  cds.free;
  p.free;
end;

procedure TdtmFIN_Bancos.cdsLstBancosBeforeOpen(DataSet: TDataSet);
begin
  cdsLstBancos.IndexFieldNames := 'CODIGO';
end;

procedure TdtmFIN_Bancos.cdsLstBancosFEBRABANGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'FEBRABAN' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TdtmFIN_Bancos.cdsLstBancosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmFIN_Bancos.cdsBancoCODIGOValidate(Sender: TField);
begin
  if ( Sender.AsString = EmptyStr ) then
    raise Warning.Create('Código inválido');

  if PesquisaCodigo( Sender.AsString ) then
    raise Warning.Create('Código de banco já utilizado');
end;

procedure TdtmFIN_Bancos.cdsBancoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsBancoFEBRABAN.AsString := 'T';
end;

end.


