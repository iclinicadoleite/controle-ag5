unit UFIN_AjustaSaldoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type
  TFIN_AjustaSaldoDatamodule = class(T_dtmBASE)
    cdsLstAjustaSaldo: TClientDataSet;
    dspLstAjustaSaldo: TDataSetProvider;
    sqlLstAjustaSaldo: TTcSQLDataSet;
    sqlLstAjustaSaldoORIGEM: TIntegerField;
    sqlLstAjustaSaldoKFIN_CONTA: TStringField;
    sqlLstAjustaSaldoNOMECONTA: TStringField;
    sqlLstAjustaSaldoBANCO: TStringField;
    sqlLstAjustaSaldoAGENCIA: TStringField;
    sqlLstAjustaSaldoCONTA_CORRENTE: TStringField;
    sqlLstAjustaSaldoVENCTO: TSQLTimeStampField;
    sqlLstAjustaSaldoPAGTO: TSQLTimeStampField;
    sqlLstAjustaSaldoHISTORICO: TStringField;
    sqlLstAjustaSaldoDOCUMENTO: TStringField;
    sqlLstAjustaSaldoCHEQUE: TStringField;
    sqlLstAjustaSaldoCREDITO: TFloatField;
    sqlLstAjustaSaldoDEBITO: TFloatField;
    sqlLstAjustaSaldoDT_COMPENSACAO: TSQLTimeStampField;
    sqlLstAjustaSaldoOBS: TMemoField;
    sqlLstAjustaSaldoDEBITO_CREDITO: TStringField;
    cdsLstAjustaSaldoORIGEM: TIntegerField;
    cdsLstAjustaSaldoKFIN_CONTA: TStringField;
    cdsLstAjustaSaldoNOMECONTA: TStringField;
    cdsLstAjustaSaldoBANCO: TStringField;
    cdsLstAjustaSaldoAGENCIA: TStringField;
    cdsLstAjustaSaldoCONTA_CORRENTE: TStringField;
    cdsLstAjustaSaldoVENCTO: TSQLTimeStampField;
    cdsLstAjustaSaldoPAGTO: TSQLTimeStampField;
    cdsLstAjustaSaldoHISTORICO: TStringField;
    cdsLstAjustaSaldoDOCUMENTO: TStringField;
    cdsLstAjustaSaldoCHEQUE: TStringField;
    cdsLstAjustaSaldoCREDITO: TFloatField;
    cdsLstAjustaSaldoDEBITO: TFloatField;
    cdsLstAjustaSaldoDT_COMPENSACAO: TSQLTimeStampField;
    cdsLstAjustaSaldoOBS: TMemoField;
    cdsLstAjustaSaldoDEBITO_CREDITO: TStringField;
    sqlLstAjustaSaldoKFIN_PARCELA: TStringField;
    cdsLstAjustaSaldoKFIN_PARCELA: TStringField;
    sqlLstAjustaSaldoNUM_CHEQUE: TStringField;
    cdsLstAjustaSaldoNUM_CHEQUE: TStringField;
    procedure dspLstAjustaSaldoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsLstAjustaSaldoDT_COMPENSACAOValidate(Sender: TField);
  private
    { Private declarations }
    FCompensado : Boolean;
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetFilter( Compensado : Boolean );
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions, UDBFinanceiro, SqlTimSt
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}



{ TrdmFIN_AjustaSaldoDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_AjustaSaldoDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


procedure TFIN_AjustaSaldoDatamodule.cdsLstAjustaSaldoDT_COMPENSACAOValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
    raise Warning.Create('Data de compensação não pode ser superior a data atual.');
end;

procedure TFIN_AjustaSaldoDatamodule.dspLstAjustaSaldoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
const
  UPDATE_APAGAR = 'UPDATE FIN_APAGAR_PARCELAS SET DT_COMPENSACAO = :DT_COMPENSACAO, OBS = :OBS' +
                  ' WHERE KFIN_APAGAR_PARCELA = :KFIN_PARCELA' ;

  UPDATE_ARECEBER = 'UPDATE FIN_ARECEBER_PARCELAS SET DT_COMPENSACAO = :DT_COMPENSACAO, OBS = :OBS' +
                    ' WHERE KFIN_ARECEBER_PARCELA = :KFIN_PARCELA' ;

  DELETE_APAGAR = 'DELETE FROM FIN_APAGAR_PARCELAS WHERE KFIN_APAGAR_PARCELA = :KFIN_PARCELA' ;

  DELETE_ARECEBER = 'DELETE FROM FIN_ARECEBER_PARCELAS WHERE KFIN_ARECEBER_PARCELA = :KFIN_PARCELA';

var
  p : TParams ;

begin
  p := TParams.Create;

  if UpdateKind = ukModify then
    begin

      if VarIsEmpty( DeltaDS.FieldByName( 'DT_COMPENSACAO' ).NewValue ) then
        p.CreateParam( ftTimeStamp, 'DT_COMPENSACAO', ptInput ).Value := DeltaDS.FieldByName( 'DT_COMPENSACAO' ).OldValue
      else if VarIsNULL( DeltaDS.FieldByName( 'DT_COMPENSACAO' ).NewValue ) then
        p.CreateParam( ftTimeStamp, 'DT_COMPENSACAO', ptInput ).Bound := False
      else
        p.CreateParam( ftTimeStamp, 'DT_COMPENSACAO', ptInput ).Value := DeltaDS.FieldByName( 'DT_COMPENSACAO' ).NewValue ;


      if VarIsEmpty( DeltaDS.FieldByName( 'OBS' ).NewValue ) then
        p.CreateParam( ftBlob, 'OBS', ptInput ).Value                   := DeltaDS.FieldByName( 'OBS' ) .OldValue
      else if VarIsNULL( DeltaDS.FieldByName( 'OBS' ).NewValue ) then
        p.CreateParam( ftBlob, 'OBS', ptInput ).Bound := False
      else
        p.CreateParam( ftBlob, 'OBS', ptInput ).asString                   := DeltaDS.FieldByName( 'OBS' ) .NewValue ;

      p.CreateParam( ftString, 'KFIN_PARCELA', ptInput ).AsString        := DeltaDS.FieldByName( 'KFIN_PARCELA' ).OldValue ;

      if DeltaDS.FieldByName( 'ORIGEM' ).OldValue = 1 then
        DBResources['FINANCEIRO'].Execute( UPDATE_ARECEBER, p )

      else if DeltaDS.FieldByName( 'ORIGEM' ).OldValue = 2 then
        DBResources['FINANCEIRO'].Execute( UPDATE_APAGAR, p );
    end
  else if UpdateKind = ukDelete then
    begin
      p.CreateParam( ftString, 'KFIN_PARCELA', ptInput ).AsString        := DeltaDS.FieldByName( 'KFIN_PARCELA' ).OldValue ;

      if cdsLstAjustaSaldoORIGEM.AsInteger = 1 then
        DBResources['FINANCEIRO'].Execute( DELETE_ARECEBER, p )

      else if cdsLstAjustaSaldoORIGEM.AsInteger = 2 then
        DBResources['FINANCEIRO'].Execute( DELETE_APAGAR, p );
    end;

  Applied := True ;

  p.Free;
end;

procedure TFIN_AjustaSaldoDatamodule.OpenTables;
begin
  inherited;
end;

procedure TFIN_AjustaSaldoDatamodule.SetFilter(Compensado: Boolean);
begin
  ApplyUpdates;
  FCompensado := Compensado;
  SetParams;
  Self.RefreshList;
end;

procedure TFIN_AjustaSaldoDatamodule.SetParams;
begin
  cdsLstAjustaSaldo.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
  cdsLstAjustaSaldo.Params.ParamByName( 'COMPENSADO' ).asString   := BoolToChar( FCompensado ) ;
end;

end.
