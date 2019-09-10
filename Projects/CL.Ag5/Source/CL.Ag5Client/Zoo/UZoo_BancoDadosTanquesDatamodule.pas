unit UZoo_BancoDadosTanquesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type

  TGraphicData = (
    gdLactose, gdGordura, gdProteina,
    gdCCS, gdCBT,
    gdUreia,
    gdST, gdESD // pontos
     ) ;

  TGraphicDataSelected = set of TGraphicData ;

  TZoo_BancoDadosTanquesDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstTanques: TClientDataSet;
    cdsTanque: TClientDataSet;
    dspLstTanques: TDataSetProvider;
    dspTanque: TDataSetProvider;
    sqlLstTanques: TTcSQLDataSet;
    sqlTanque: TTcSQLDataSet;
    dtsLstTanques: TDataSource;
    sqlAnalises: TTcSQLDataSet;
    dtsSQLTanque: TDataSource;
    cdsAnalises: TClientDataSet;
    sqlLstTanquesKZOO_TANQUE: TStringField;
    sqlLstTanquesCODIGOTANQUE: TStringField;
    cdsLstTanquesKZOO_TANQUE: TStringField;
    cdsLstTanquesCODIGOTANQUE: TStringField;
    sqlTanqueKZOO_TANQUE: TStringField;
    sqlTanqueKCAD_FAZENDA: TStringField;
    sqlTanqueCODIGOTANQUE: TStringField;
    cdsTanqueKZOO_TANQUE: TStringField;
    cdsTanqueKCAD_FAZENDA: TStringField;
    cdsTanqueCODIGOTANQUE: TStringField;
    cdsTanquesqlAnalises: TDataSetField;
    sqlAnalisesKZOO_TANQUE_ANALISE: TStringField;
    sqlAnalisesKZOO_TANQUE: TStringField;
    cdsAnalisesKZOO_TANQUE_ANALISE: TStringField;
    cdsAnalisesKZOO_TANQUE: TStringField;
    cdsAnalisesDATA: TSQLTimeStampField;
    cdsAnalisesGORDURA: TFloatField;
    cdsAnalisesPROTEINA: TFloatField;
    cdsAnalisesLACTOSE: TFloatField;
    cdsAnalisesSOLIDOS_TOTAIS: TFloatField;
    cdsAnalisesESD: TFloatField;
    cdsAnalisesCCS: TIntegerField;
    cdsAnalisesUREIA: TFloatField;
    sqlAnalisesDATA: TSQLTimeStampField;
    sqlAnalisesGORDURA: TFloatField;
    sqlAnalisesPROTEINA: TFloatField;
    sqlAnalisesLACTOSE: TFloatField;
    sqlAnalisesSOLIDOS_TOTAIS: TFloatField;
    sqlAnalisesESD: TFloatField;
    sqlAnalisesCCS: TIntegerField;
    sqlAnalisesUREIA: TFloatField;
    sqlLstTanquesSYSUI: TStringField;
    sqlLstTanquesSYSDI: TSQLTimeStampField;
    sqlLstTanquesSYSUU: TStringField;
    sqlLstTanquesSYSDU: TSQLTimeStampField;
    cdsLstTanquesSYSUI: TStringField;
    cdsLstTanquesSYSDI: TSQLTimeStampField;
    cdsLstTanquesSYSUU: TStringField;
    cdsLstTanquesSYSDU: TSQLTimeStampField;
    sqlTanqueSYSUI: TStringField;
    sqlTanqueSYSDI: TSQLTimeStampField;
    sqlTanqueSYSUU: TStringField;
    sqlTanqueSYSDU: TSQLTimeStampField;
    cdsTanqueSYSUI: TStringField;
    cdsTanqueSYSDI: TSQLTimeStampField;
    cdsTanqueSYSUU: TStringField;
    cdsTanqueSYSDU: TSQLTimeStampField;
    cdsAnalisesSYSUI: TStringField;
    cdsAnalisesSYSDI: TSQLTimeStampField;
    cdsAnalisesSYSUU: TStringField;
    cdsAnalisesSYSDU: TSQLTimeStampField;
    sqlAnalisesSYSUI: TStringField;
    sqlAnalisesSYSDI: TSQLTimeStampField;
    sqlAnalisesSYSUU: TStringField;
    sqlAnalisesSYSDU: TSQLTimeStampField;
    cdsAnalisesPeriodo: TClientDataSet;
    cdsAnalisesPeriodoDEL: TIntegerField;
    cdsAnalisesPeriodoDATA: TSQLTimeStampField;
    cdsAnalisesPeriodoGORDURA: TFloatField;
    cdsAnalisesPeriodoPROTEINA: TFloatField;
    cdsAnalisesPeriodoUREIA: TFloatField;
    cdsAnalisesPeriodoCCS: TIntegerField;
    dspAnalisesPeriodo: TDataSetProvider;
    sqlAnalisesPeriodo: TTcSQLDataSet;
    sqlAnalisesPeriodoDATA: TSQLTimeStampField;
    sqlAnalisesPeriodoGORDURA: TFloatField;
    sqlAnalisesPeriodoPROTEINA: TFloatField;
    sqlAnalisesPeriodoUREIA: TFloatField;
    sqlAnalisesPeriodoCCS: TIntegerField;
    sqlAnalisesPeriodoLACTOSE: TFloatField;
    sqlAnalisesPeriodoST: TFloatField;
    sqlAnalisesPeriodoESD: TFloatField;
    cdsAnalisesPeriodoLACTOSE: TFloatField;
    cdsAnalisesPeriodoST: TFloatField;
    cdsAnalisesPeriodoESD: TFloatField;
    sqlAnalisesCBT: TIntegerField;
    cdsAnalisesCBT: TIntegerField;
    sqlAnalisesPeriodoCBT: TIntegerField;
    cdsAnalisesPeriodoCBT: TIntegerField;
    procedure cdsLstTanquesNewRecord(DataSet: TDataSet);
    procedure cdsTanqueNewRecord(DataSet: TDataSet);
    procedure cdsAnalisesNewRecord(DataSet: TDataSet);
    procedure cdsLstTanquesBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FLastKeyTanque : string ;
    FLastGraphicDataSelected, FGraphicDataSelected: TGraphicDataSelected;
    FLastRows    : Integer ;
    FRows    : Integer ;
    FForceRebuildGraphics : boolean ;
    procedure SetParams ;
    procedure SetGraphicDataSelected(const Value: TGraphicDataSelected);
  public
    { Public declarations }
    procedure ApplyUpdates; override ;
    procedure OpenTables ; override ;
    property GraphicDataSelected : TGraphicDataSelected  read FGraphicDataSelected write SetGraphicDataSelected;
    procedure AddRemGraphicDataSelected ( ASelected : boolean ; AGraphicData : TGraphicData ) ;
    property Rows : integer  read FRows write FRows ;
    procedure OpenData ;
    procedure RemoveAnalise ;
    procedure AddAnalise ;
    constructor Create (AOwner : TComponent ) ; override ;
  end;

implementation

//uses UDBResources, Exceptions;
uses UDBZootecnico, CDSSuppl, SQLTimSt ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_BancoDadosTanquesDatamodule.OpenData;
var
  SQLInicioPeriodo,  SQLFimPeriodo : TSQLTimeStamp  ;
begin

  // dados nao alterados ...
  if    ( not FForceRebuildGraphics )
   and ( cdsTanqueKZOO_TANQUE.asString = FLastKeyTanque )
   and ( FGraphicDataSelected * FLastGraphicDataSelected  = FLastGraphicDataSelected )
   and ( FLastRows    = FRows ) then
      exit ;

  // close all
  cdsAnalisesPeriodo.Close ;

  // set params ....
  cdsAnalisesPeriodo.Params.paramByName ( 'KZOO_TANQUE' ).asString  := cdsTanqueKZOO_TANQUE.asString ;
  cdsAnalisesPeriodo.Params.paramByName ( 'ROWS' ).asInteger        := FRows ;

  TCDSSuppl.Open (  cdsAnalisesPeriodo ) ;

  // atualiza ultimos dados
  FLastKeyTanque            := cdsTanqueKZOO_TANQUE.asString ;
  FLastGraphicDataSelected  := FGraphicDataSelected ;
  FLastRows                 := FRows ;
  FForceRebuildGraphics     := False ;

end;

procedure TZoo_BancoDadosTanquesDatamodule.OpenTables;
begin
  inherited;
  //
end;

procedure TZoo_BancoDadosTanquesDatamodule.RemoveAnalise;
begin
   if not cdsAnalises.IsEmpty then
     begin
         cdsAnalises.Edit ;
         cdsAnalises.Delete ;
     end;

end;

procedure TZoo_BancoDadosTanquesDatamodule.ApplyUpdates;
begin
  inherited;
  FForceRebuildGraphics := True ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.SetGraphicDataSelected(
  const Value: TGraphicDataSelected);
begin
  FGraphicDataSelected := Value;
end;

procedure TZoo_BancoDadosTanquesDatamodule.SetParams;
begin
  with cdsLstTanques.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
    end ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.AddAnalise;
begin
   if not cdsTanque.IsEmpty then
         cdsAnalises.Append ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.AddRemGraphicDataSelected(
  ASelected: boolean; AGraphicData: TGraphicData);
begin
  if ASelected then
    self.FGraphicDataSelected := self.FGraphicDataSelected + [ AGraphicData ]
  else
    self.FGraphicDataSelected := self.FGraphicDataSelected - [ AGraphicData ] ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.cdsAnalisesNewRecord(
  DataSet: TDataSet);
begin
  GetKey ( cdsAnalisesKZOO_TANQUE_ANALISE ) ;
  cdsAnalisesKZOO_TANQUE.Value := cdsTanqueKZOO_TANQUE.Value ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.cdsLstTanquesBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.cdsLstTanquesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_BancoDadosTanquesDatamodule.cdsTanqueNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsTanqueKCAD_FAZENDA.asString := LoggedUser.DomainID ;
end;

constructor TZoo_BancoDadosTanquesDatamodule.Create(AOwner: TComponent);
begin
  inherited ;

  FLastKeyTanque           := ''  ;
  FRows                    := 36 ;
  FGraphicDataSelected := [     gdLactose, gdGordura, gdProteina,
                                gdCCS, gdCBT,
                                gdUreia,
                                gdST, gdESD // pontos
                          ] ;

  FLastGraphicDataSelected := [] ;
  FLastRows                := -1 ;

end;


end.
