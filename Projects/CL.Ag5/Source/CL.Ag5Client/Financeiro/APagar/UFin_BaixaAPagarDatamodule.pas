unit UFin_BaixaAPagarDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE, Tc.Data.SQLExpr ;

type

  TTipoTitulo = ( ttAPagar, ttPagos, ttAmbos) ;

  TFin_BaixaAPagarDatamodule = class(T_dtmBASE)
    cdsBaixaAPagar: TClientDataSet;
    dspBaixaAPagar: TDataSetProvider;
    sqlBaixaAPagar: TTcSQLDataSet;
    dtsBaixaAPagar: TDataSource;
    sqlBaixaAPagarKFIN_APAGAR_PARCELA: TStringField;
    sqlBaixaAPagarVENCTO: TSQLTimeStampField;
    sqlBaixaAPagarKCAD_ENTIDADE: TStringField;
    sqlBaixaAPagarNOMEENTIDADE: TStringField;
    sqlBaixaAPagarVALOR: TFloatField;
    sqlBaixaAPagarKFIN_CONTA: TStringField;
    sqlBaixaAPagarCONTA: TStringField;
    sqlBaixaAPagarOBS: TMemoField;
    cdsBaixaAPagarKFIN_APAGAR_PARCELA: TStringField;
    cdsBaixaAPagarVENCTO: TSQLTimeStampField;
    cdsBaixaAPagarKCAD_ENTIDADE: TStringField;
    cdsBaixaAPagarNOMEENTIDADE: TStringField;
    cdsBaixaAPagarVALOR: TFloatField;
    cdsBaixaAPagarKFIN_CONTA: TStringField;
    cdsBaixaAPagarCONTA: TStringField;
    cdsBaixaAPagarOBS: TMemoField;
    sqlBaixaAPagarPARCELAS: TStringField;
    cdsBaixaAPagarPARCELAS: TStringField;
    sqlBaixaAPagarPAGTO: TSQLTimeStampField;
    sqlBaixaAPagarPAGO: TFloatField;
    cdsBaixaAPagarPAGTO: TSQLTimeStampField;
    cdsBaixaAPagarPAGO: TFloatField;
    sqlBaixaAPagarDOCUMENTO: TStringField;
    cdsBaixaAPagarDOCUMENTO: TStringField;
    sqlBaixaAPagarHISTORICO: TStringField;
    cdsBaixaAPagarHISTORICO: TStringField;
    sqlBaixaAPagarDATACOMPRA: TSQLTimeStampField;
    sqlBaixaAPagarKFIN_APAGAR: TStringField;
    sqlBaixaAPagarKCMP_PEDIDO: TStringField;
    cdsBaixaAPagarKFIN_APAGAR: TStringField;
    cdsBaixaAPagarKCMP_PEDIDO: TStringField;
    cdsBaixaAPagarDATACOMPRA: TSQLTimeStampField;
    procedure cdsBaixaAPagarNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FDataIni : TDateTime;
    FDataFim : TDateTime;
    FTipoTitulo : TTipoTitulo ;
    FKCAD_ENTIDADE : string;
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

{ TrdmFin_BaixaAPagarDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFin_BaixaAPagarDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  Self.SortLstIndex := True;
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


procedure TFin_BaixaAPagarDatamodule.OpenTables;
begin
  inherited;
  //
end;


procedure TFin_BaixaAPagarDatamodule.SetParam(DataIni, DataFim: TDateTime; ATipoTitulo : TTipoTitulo ; KCAD_ENTIDADE: string);
begin
  FDataIni       := StartOfTheDay ( DataIni ) ;
  FDataFim       := EndOfTheDay ( DataFim ) ;
  FTipoTitulo    := ATipoTitulo ;
  FKCAD_ENTIDADE := KCAD_ENTIDADE;
  SetParams;
end;


procedure TFin_BaixaAPagarDatamodule.SetParams;
begin
  cdsBaixaAPagar.Params.ParamByName( 'KSYS$DOMAIN'  ).asString       := LoggedUser.DomainID ;
  cdsBaixaAPagar.Params.ParamByName( 'DATAINI'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataIni ) ;
  cdsBaixaAPagar.Params.ParamByName( 'DATAFIM'       ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( FDataFim ) ;
  cdsBaixaAPagar.Params.ParamByName( 'DSP_TITULOS'   ).asInteger      := Ord ( FTipoTitulo ) + 1 ;
  cdsBaixaAPagar.Params.ParamByName( 'KCAD_ENTIDADE' ).asString       := FKCAD_ENTIDADE ;

  if FKCAD_ENTIDADE <> EmptyStr then
    cdsBaixaAPagar.Params.ParamByName( 'DSP_FORNECEDOR' ).asString := 'T'
  else
    cdsBaixaAPagar.Params.ParamByName( 'DSP_FORNECEDOR' ).asString := 'F';
end;

procedure TFin_BaixaAPagarDatamodule.cdsBaixaAPagarNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;


end.
