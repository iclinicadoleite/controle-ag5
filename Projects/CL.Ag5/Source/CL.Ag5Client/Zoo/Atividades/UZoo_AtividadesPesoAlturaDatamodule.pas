unit UZoo_AtividadesPesoAlturaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, DateUtils;

type
  TZoo_AtividadesPesoAlturaDatamodule = class(T_dtmBASE)
    cdsAPesoMedida: TClientDataSet;
    dspAPesoMedida: TDataSetProvider;
    sqlAPesoMedida: TTcSQLDataSet;
    sqlAPesoMedidaBRINCOFEMEA: TStringField;
    sqlAPesoMedidaNOMEFEMEA: TStringField;
    sqlAPesoMedidaNASCIMENTO: TSQLTimeStampField;
    sqlAPesoMedidaALTURA_ANTERIOR: TIntegerField;
    sqlAPesoMedidaPESO_ANTERIOR: TIntegerField;
    cdsAPesoMedidaBRINCOFEMEA: TStringField;
    cdsAPesoMedidaNOMEFEMEA: TStringField;
    cdsAPesoMedidaNASCIMENTO: TSQLTimeStampField;
    cdsAPesoMedidaALTURA_ANTERIOR: TIntegerField;
    cdsAPesoMedidaPESO_ANTERIOR: TIntegerField;
    cdsAPesoMedidaIDADE: TIntegerField;
    sqlAPesoMedidaDATA: TSQLTimeStampField;
    cdsAPesoMedidaDATA: TSQLTimeStampField;
    sqlAPesoMedidaBRINCOFEMEA_: TStringField;
    cdsAPesoMedidaBRINCOFEMEA_: TStringField;
    sqlAPesoMedidaKZOO_ANIMAL_FEMEA: TStringField;
    cdsAPesoMedidaKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAPesoMedidaBeforeOpen(DataSet: TDataSet);
    procedure cdsAPesoMedidaCalcFields(DataSet: TDataSet);
  private
    procedure SetParams ;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Exceptions, CLAg5Types, UDBZootecnico ;

{$R *.dfm}

{ TZoo_AtividadesPesoAlturaDatamodule }

procedure TZoo_AtividadesPesoAlturaDatamodule.cdsAPesoMedidaBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;

procedure TZoo_AtividadesPesoAlturaDatamodule.cdsAPesoMedidaCalcFields(DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    cdsAPesoMedidaIDADE.AsInteger := DaysBetween( cdsAPesoMedidaNASCIMENTO.AsDateTime, Date );
end;

procedure TZoo_AtividadesPesoAlturaDatamodule.SetParams;
begin
  cdsAPesoMedida.Params.ParamByName ( 'KCAD_FAZENDA' ).asString  := LoggedUser.DomainID ;
  cdsAPesoMedida.Params.paramByName ( 'BEZERRA'  ).AsInteger     := _ST_STATUS_FEMEA_BEZERRO ;
  cdsAPesoMedida.Params.paramByName ( 'NOVILHA'  ).AsInteger     := _ST_STATUS_FEMEA_NOVILHA ;
end;

end.
