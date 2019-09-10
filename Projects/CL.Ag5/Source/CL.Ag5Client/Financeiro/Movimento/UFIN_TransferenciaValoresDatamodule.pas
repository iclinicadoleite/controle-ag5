unit UFIN_TransferenciaValoresDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TdtmFIN_TransferenciaValores = class(T_dtmBASEDBListEdit)
    cdsLstTransferencias: TClientDataSet;
    cdsTransferencia: TClientDataSet;
    dspLstTransferencias: TDataSetProvider;
    dspTransferencia: TDataSetProvider;
    sqlLstTransferencias: TTcSQLDataSet;
    sqlTransferencia: TTcSQLDataSet;
    dtsLstTransferencias: TDataSource;
    sqlLstTransferenciasKFIN_TRANSFERENCIA: TStringField;
    sqlLstTransferenciasKSYSDOMAIN: TStringField;
    sqlLstTransferenciasDATA: TSQLTimeStampField;
    sqlLstTransferenciasDOC_ORIGEM: TStringField;
    sqlLstTransferenciasDOC_DESTINO: TStringField;
    sqlLstTransferenciasVALOR: TFloatField;
    sqlLstTransferenciasSYSDI: TSQLTimeStampField;
    sqlLstTransferenciasSYSDU: TSQLTimeStampField;
    sqlLstTransferenciasSYSUI: TStringField;
    sqlLstTransferenciasSYSUU: TStringField;
    cdsLstTransferenciasKFIN_TRANSFERENCIA: TStringField;
    cdsLstTransferenciasKSYSDOMAIN: TStringField;
    cdsLstTransferenciasDATA: TSQLTimeStampField;
    cdsLstTransferenciasDOC_ORIGEM: TStringField;
    cdsLstTransferenciasDOC_DESTINO: TStringField;
    cdsLstTransferenciasVALOR: TFloatField;
    cdsLstTransferenciasSYSDI: TSQLTimeStampField;
    cdsLstTransferenciasSYSDU: TSQLTimeStampField;
    cdsLstTransferenciasSYSUI: TStringField;
    cdsLstTransferenciasSYSUU: TStringField;
    sqlTransferenciaKFIN_TRANSFERENCIA: TStringField;
    sqlTransferenciaKSYSDOMAIN: TStringField;
    sqlTransferenciaDATA: TSQLTimeStampField;
    sqlTransferenciaKFIN_CONTA_ORIGEM: TStringField;
    sqlTransferenciaKFIN_CONTA_DESTINO: TStringField;
    sqlTransferenciaDOC_ORIGEM: TStringField;
    sqlTransferenciaDOC_DESTINO: TStringField;
    cdsTransferenciaKFIN_TRANSFERENCIA: TStringField;
    cdsTransferenciaKSYSDOMAIN: TStringField;
    cdsTransferenciaDATA: TSQLTimeStampField;
    cdsTransferenciaKFIN_CONTA_ORIGEM: TStringField;
    cdsTransferenciaKFIN_CONTA_DESTINO: TStringField;
    cdsTransferenciaDOC_ORIGEM: TStringField;
    cdsTransferenciaDOC_DESTINO: TStringField;
    sqlTransferenciaVALOR: TFloatField;
    sqlTransferenciaOBS: TMemoField;
    cdsTransferenciaVALOR: TFloatField;
    cdsTransferenciaOBS: TMemoField;
    sqlTransferenciaNOMECONTA_ORIGEM: TStringField;
    sqlTransferenciaNOMECONTA_DESTINO: TStringField;
    cdsTransferenciaNOMECONTA_ORIGEM: TStringField;
    cdsTransferenciaNOMECONTA_DESTINO: TStringField;
    sqlLstTransferenciasNOMECONTA_ORIGEM: TStringField;
    sqlLstTransferenciasNOMECONTA_DESTINO: TStringField;
    cdsLstTransferenciasNOMECONTA_ORIGEM: TStringField;
    cdsLstTransferenciasNOMECONTA_DESTINO: TStringField;
    sqlTransferenciaSYSORIGIN_TYPE: TIntegerField;
    cdsTransferenciaSYSORIGIN_TYPE: TIntegerField;
    procedure cdsLstTransferenciasNewRecord(DataSet: TDataSet);
    procedure cdsTransferenciaNewRecord(DataSet: TDataSet);
    procedure cdsTransferenciaNOMECONTA_ORIGEMSetText(Sender: TField;
      const Text: string);
    procedure cdsTransferenciaNOMECONTA_DESTINOSetText(Sender: TField;
      const Text: string);
    procedure cdsLstTransferenciasBeforeOpen(DataSet: TDataSet);
    procedure cdsTransferenciaBeforePost(DataSet: TDataSet);
    procedure cdsTransferenciaBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetContaOrigem( AKConta, AConta : string ) ;
    procedure SetContaDestino( AKConta, AConta : string ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

//uses UDBResources, Exceptions;
uses Tc.RTL.Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}


{ TrdmdtmFIN_TransferenciaValores }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_TransferenciaValores.Create(AOwner: TComponent);
var
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}

{ TdtmCustomListaFicha }

procedure TdtmFIN_TransferenciaValores.OpenTables;
begin
  inherited;
  //
end;


procedure TdtmFIN_TransferenciaValores.SetContaOrigem(AKConta, AConta: string);
begin
      if not ( cdsTransferencia.State in [dsInsert,dsEdit] ) then
        cdsTransferencia.Edit ;

      cdsTransferenciaKFIN_CONTA_ORIGEM.AsString   := AKConta ;
      cdsTransferenciaNOMECONTA_ORIGEM.AsString    := AConta ;
end;

procedure TdtmFIN_TransferenciaValores.SetContaDestino(AKConta, AConta: string);
begin
      if not ( cdsTransferencia.State in [dsInsert,dsEdit] ) then
        cdsTransferencia.Edit ;

      cdsTransferenciaKFIN_CONTA_DESTINO.AsString   := AKConta ;
      cdsTransferenciaNOMECONTA_DESTINO.AsString    := AConta ;
end;

procedure TdtmFIN_TransferenciaValores.cdsLstTransferenciasBeforeOpen(
  DataSet: TDataSet);
begin
  cdsLstTransferencias.ParamByName ( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
end;

procedure TdtmFIN_TransferenciaValores.cdsLstTransferenciasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsLstTransferenciasKSYSDOMAIN.asString := LoggedUser.DomainID ;
end;

procedure TdtmFIN_TransferenciaValores.cdsTransferenciaBeforeDelete(
  DataSet: TDataSet);
begin

  if cdsTransferenciaSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Tranferência incluida via sincronismo.' + #10#13 + 'Não pode ser excluída.' );

end;

procedure TdtmFIN_TransferenciaValores.cdsTransferenciaBeforePost(
  DataSet: TDataSet);
var
  LErr : TStringBuilder ;
begin
  LErr := TStringBuilder.Create ;

  if  (  cdsTransferenciaDATA.IsNull )
   or (  cdsTransferenciaDATA.asDateTime = 0 )  then
     LErr.AppendLine( 'A data deve ser preenchida.' ) ;

  if  (  cdsTransferenciaDATA.asDateTime > Date )  then
     LErr.AppendLine( 'A data não pode ser superior a hoje.' ) ;

  if  (  cdsTransferenciaVALOR.AsFloat <= 0 )  then
     LErr.AppendLine( 'Valor deve ser maior que zero.' ) ;

  if (  cdsTransferenciaKFIN_CONTA_ORIGEM.asString = '' ) then
     LErr.AppendLine( 'A conta origem deve ser selecionada.' ) ;

  if ( cdsTransferenciaKFIN_CONTA_DESTINO.asString = '' ) then
     LErr.AppendLine( 'A conta destino deve ser selecionada.' ) ;

  if     ( cdsTransferenciaKFIN_CONTA_ORIGEM.asString <> '' )
     and ( cdsTransferenciaKFIN_CONTA_DESTINO.asString <> '' )
     and (    cdsTransferenciaKFIN_CONTA_ORIGEM.asString
            = cdsTransferenciaKFIN_CONTA_DESTINO.asString  ) then
     LErr.AppendLine( 'A conta origem e destino devem ser diferentes.' ) ;

  try
    if LErr.Length > 0 then
      raise Warning.Create( LErr.ToString );
  finally
    LErr.Free ;
  end;
end;

procedure TdtmFIN_TransferenciaValores.cdsTransferenciaNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsTransferenciaKSYSDOMAIN.asString := LoggedUser.DomainID ;
  cdsTransferenciaSYSORIGIN_TYPE.asInteger    := 0 ;
end;

procedure TdtmFIN_TransferenciaValores.cdsTransferenciaNOMECONTA_ORIGEMSetText(
  Sender: TField; const Text: string);
begin
  cdsTransferenciaKFIN_CONTA_ORIGEM.Clear ;
  Sender.AsString := Text ;
end;


procedure TdtmFIN_TransferenciaValores.cdsTransferenciaNOMECONTA_DESTINOSetText(
  Sender: TField; const Text: string);
begin
  cdsTransferenciaKFIN_CONTA_DESTINO.Clear ;
  Sender.AsString := Text ;
end;


end.
