unit UZoo_CfgParamNovilhasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_CfgParamNovilhasDatamodule = class(T_dtmBASE)
    cdsEdit: TClientDataSet;
    dspEdit: TDataSetProvider;
    sqlEdit: TTcSQLDataSet;
    sqlEditKCAD_FAZENDA: TStringField;
    sqlEditDESCRICAO: TStringField;
    sqlEditVALOR: TIntegerField;
    sqlEditATIVO: TStringField;
    sqlEditINTERNAL: TStringField;
    cdsEditKCAD_FAZENDA: TStringField;
    cdsEditDESCRICAO: TStringField;
    cdsEditVALOR: TIntegerField;
    cdsEditATIVO: TStringField;
    cdsEditINTERNAL: TStringField;
    sqlEditSYS_VALUE: TStringField;
    cdsEditSYS_VALUE: TStringField;
    sqlEditSYSUU: TStringField;
    sqlEditSYSDU: TSQLTimeStampField;
    cdsEditSYSUU: TStringField;
    cdsEditSYSDU: TSQLTimeStampField;
    procedure cdsEditNewRecord(DataSet: TDataSet);
    procedure cdsEditBeforeOpen(DataSet: TDataSet);
    procedure cdsEditBeforeInsert(DataSet: TDataSet);
    procedure cdsEditBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses UDBZootecnico, Exceptions;

{$R *.dfm}

procedure TZoo_CfgParamNovilhasDatamodule.OpenTables;
begin
  inherited;
end;


procedure TZoo_CfgParamNovilhasDatamodule.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsEditKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsEditATIVO.AsString := 'T' ;
  cdsEditINTERNAL.AsString := 'F' ;
end;


procedure TZoo_CfgParamNovilhasDatamodule.SetParams;
begin
  with cdsEdit.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
    end ;
end;

procedure TZoo_CfgParamNovilhasDatamodule.cdsEditBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  Abort ;
end;

procedure TZoo_CfgParamNovilhasDatamodule.cdsEditBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  Abort ;
end;

procedure TZoo_CfgParamNovilhasDatamodule.cdsEditBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;



end.
