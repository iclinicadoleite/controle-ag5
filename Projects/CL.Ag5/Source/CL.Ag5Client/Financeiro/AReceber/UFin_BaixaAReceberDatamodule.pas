unit UFin_BaixaAReceberDatamodule;
//vts
interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Provider, Tc.Data.SQLExpr;

type

  TTipoTitulo = ( ttAReceber, ttRecebidos, ttAmbos) ;

  TFin_BaixaAReceberDatamodule = class(T_dtmBASE)
    cdsBaixaAReceber: TClientDataSet;
    dspBaixaAReceber: TDataSetProvider;
    sqlBaixaAReceber: TTcSQLDataSet;
    dstBaixaAReceber: TDataSource;
    sqlBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField;
    sqlBaixaAReceberDOCUMENTO: TStringField;
    sqlBaixaAReceberVENCTO: TSQLTimeStampField;
    sqlBaixaAReceberNOMEENTIDADE: TStringField;
    sqlBaixaAReceberVALOR: TFloatField;
    sqlBaixaAReceberKFIN_CONTA: TStringField;
    sqlBaixaAReceberCONTA: TStringField;
    sqlBaixaAReceberOBS: TMemoField;
    sqlBaixaAReceberKCAD_ENTIDADE: TStringField;
    cdsBaixaAReceberKFIN_ARECEBER_PARCELA: TStringField;
    cdsBaixaAReceberDOCUMENTO: TStringField;
    cdsBaixaAReceberVENCTO: TSQLTimeStampField;
    cdsBaixaAReceberKCAD_ENTIDADE: TStringField;
    cdsBaixaAReceberNOMEENTIDADE: TStringField;
    cdsBaixaAReceberVALOR: TFloatField;
    cdsBaixaAReceberKFIN_CONTA: TStringField;
    cdsBaixaAReceberCONTA: TStringField;
    cdsBaixaAReceberOBS: TMemoField;
    sqlBaixaAReceberPARCELAS: TStringField;
    cdsBaixaAReceberPARCELAS: TStringField;
    sqlBaixaAReceberPAGO: TFloatField;
    sqlBaixaAReceberPAGTO: TSQLTimeStampField;
    cdsBaixaAReceberPAGO: TFloatField;
    cdsBaixaAReceberPAGTO: TSQLTimeStampField;
    sqlBaixaAReceberHISTORICO: TStringField;
    cdsBaixaAReceberHISTORICO: TStringField;
    sqlBaixaAReceberKFIN_ARECEBER: TStringField;
    sqlBaixaAReceberKVND_PEDIDO: TStringField;
    cdsBaixaAReceberKFIN_ARECEBER: TStringField;
    cdsBaixaAReceberKVND_PEDIDO: TStringField;
    sqlBaixaAReceberDATAVENDA: TSQLTimeStampField;
    cdsBaixaAReceberDATAVENDA: TSQLTimeStampField;
  private
    { Private declarations }
    FDataIni : TDateTime;
    FDataFim : TDateTime;
    FKCAD_ENTIDADE : string;
    FTipoTitulo : TTipoTitulo ;
    procedure SetParams;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetParam ( DataIni, DataFim : TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE : string );
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions, DateUtils, Data.SQLTimSt, UDBFinanceiro
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}


{ TrdmFin_BaixaAReceberDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFin_BaixaAReceberDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TFin_BaixaAReceberDatamodule }

procedure TFin_BaixaAReceberDatamodule.OpenTables;
begin
  Self.SortLstIndex := True;
  inherited;
  //
end;

procedure TFin_BaixaAReceberDatamodule.SetParam(DataIni, DataFim: TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE: string);
begin
  FDataIni       := StartOfTheDay ( DataIni ) ;
  FDataFim       := EndOfTheDay ( DataFim ) ;
  FTipoTitulo    := ATipoTitulo ;
  FKCAD_ENTIDADE := KCAD_ENTIDADE;
  SetParams;
end;

procedure TFin_BaixaAReceberDatamodule.SetParams;
begin
  cdsBaixaAReceber.Params.ParamByName( 'KSYS$DOMAIN'  ).asString       := LoggedUser.DomainID ;
  cdsBaixaAReceber.Params.ParamByName( 'DATAINI'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni ) ;
  cdsBaixaAReceber.Params.ParamByName( 'DATAFIM'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim ) ;
  cdsBaixaAReceber.Params.ParamByName( 'DSP_TITULOS'   ).asInteger      := Ord ( FTipoTitulo ) + 1 ;
  cdsBaixaAReceber.Params.ParamByName( 'KCAD_ENTIDADE' ).asString       := FKCAD_ENTIDADE;

  if FKCAD_ENTIDADE <> EmptyStr then
    cdsBaixaAReceber.Params.ParamByName( 'DSP_CLIENTE' ).asString := 'T'
  else
    cdsBaixaAReceber.Params.ParamByName( 'DSP_CLIENTE' ).asString := 'F';
end;


end.
