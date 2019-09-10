unit UZoo_AtividadesLVPosPartoSCioDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesLVPosPartoSCioDatamodule = class(T_dtmBASE)
    cdsAPartosSemCio: TClientDataSet;
    dspAPartosSemCio: TDataSetProvider;
    sqlAPartosSemCio: TTcSQLDataSet;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsAPartosSemCioDESC_EVENTO: TStringField;
    sqlAPartosSemCioBRINCOFEMEA: TStringField;
    sqlAPartosSemCioNOMEFEMEA: TStringField;
    sqlAPartosSemCioLOTE: TStringField;
    sqlAPartosSemCioTIPOEVENTO: TIntegerField;
    sqlAPartosSemCioDDP: TLargeintField;
    sqlAPartosSemCioULTIMO_DIAGNOSTICO: TStringField;
    sqlAPartosSemCioULTIMO_PROTOCOLO: TStringField;
    sqlAPartosSemCioULTIMA_TAREFA: TStringField;
    cdsAPartosSemCioBRINCOFEMEA: TStringField;
    cdsAPartosSemCioNOMEFEMEA: TStringField;
    cdsAPartosSemCioLOTE: TStringField;
    cdsAPartosSemCioTIPOEVENTO: TIntegerField;
    cdsAPartosSemCioDDP: TLargeintField;
    cdsAPartosSemCioULTIMO_DIAGNOSTICO: TStringField;
    cdsAPartosSemCioULTIMO_PROTOCOLO: TStringField;
    cdsAPartosSemCioULTIMA_TAREFA: TStringField;
    sqlAPartosSemCioDATA: TSQLTimeStampField;
    cdsAPartosSemCioDATA: TSQLTimeStampField;
    sqlAPartosSemCioBRINCOFEMEA_: TStringField;
    cdsAPartosSemCioBRINCOFEMEA_: TStringField;
    sqlAPartosSemCioKZOO_ANIMAL_FEMEA: TStringField;
    cdsAPartosSemCioKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAPartosSemCioBeforeOpen(DataSet: TDataSet);
  private
    FAte: TDateTime;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property Ate : TDateTime  read FAte write SetAte;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

var
  Zoo_AtividadesLVPosPartoSCioDatamodule: TZoo_AtividadesLVPosPartoSCioDatamodule;

implementation

uses CDSSuppl,
     Exceptions, UDBZootecnico, Data.SQLTimSt, DateUtils, CLAg5Types,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TZoo_AtividadesLVPosPartoSCioDatamodule }

procedure TZoo_AtividadesLVPosPartoSCioDatamodule.cdsAPartosSemCioBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

constructor TZoo_AtividadesLVPosPartoSCioDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
end;

procedure TZoo_AtividadesLVPosPartoSCioDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsAPartosSemCio.Active then
     cdsAPartosSemCio.Close ;
  TCDSSuppl.Open ( cdsAPartosSemCio ) ;
end;

procedure TZoo_AtividadesLVPosPartoSCioDatamodule.SetParams;
var
  diasPrim, diasMulti : Integer;
begin

  TParamMatriz.GetParam   ( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PARTO_SEM_CIO, diasPrim, diasMulti ) ;

  cdsAPartosSemCio.Params.ParamByName ( 'KCAD_FAZENDA' ).asString                   := LoggedUser.DomainID ;
  cdsAPartosSemCio.Params.ParamByName ( 'DESCARTADA' ).AsInteger                    := _ST_STATUS_FEMEA_DESCARTADO;
  cdsAPartosSemCio.Params.ParamByName ( 'DIASPOSPARTO_SEMCIO_MULTIPARA' ).AsInteger := diasMulti + 1 ; //EV 1331 - 256 - considerar incluisive o dia exato
  cdsAPartosSemCio.Params.ParamByName ( 'DIASPOSPARTO_SEMCIO_PRIMIPARA' ).AsInteger := diasPrim + 1 ; //EV 1331 - 256 - considerar incluisive o dia exato
  cdsAPartosSemCio.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp                  := DateTimeToSQLTimeStamp ( FAte ) ;

end;

end.
