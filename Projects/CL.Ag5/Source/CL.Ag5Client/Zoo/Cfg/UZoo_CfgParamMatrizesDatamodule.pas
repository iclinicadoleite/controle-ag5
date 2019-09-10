unit UZoo_CfgParamMatrizesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, CLAg5Types ;

type
  TZoo_CfgParamMatrizesDatamodule = class(T_dtmBASE)
    cdsEdit: TClientDataSet;
    dspEdit: TDataSetProvider;
    sqlEdit: TTcSQLDataSet;
    sqlEditKCAD_FAZENDA: TStringField;
    sqlEditDESCRICAO: TStringField;
    sqlEditPRIMIPARA: TIntegerField;
    sqlEditMULTIPARA: TIntegerField;
    sqlEditATIVO: TStringField;
    sqlEditINTERNAL: TStringField;
    cdsEditKCAD_FAZENDA: TStringField;
    cdsEditDESCRICAO: TStringField;
    cdsEditPRIMIPARA: TIntegerField;
    cdsEditMULTIPARA: TIntegerField;
    cdsEditATIVO: TStringField;
    cdsEditINTERNAL: TStringField;
    cdsEditSYS_VALUE: TStringField;
    sqlEditSYS_VALUE: TStringField;
    sqlEditSYSUU: TStringField;
    sqlEditSYSDU: TSQLTimeStampField;
    cdsEditSYSUU: TStringField;
    cdsEditSYSDU: TSQLTimeStampField;
    cdsEQAPADRAO: TClientDataSet;
    cdsEQAPADRAOTIPO: TStringField;
    cdsEQAPADRAOVALOR: TStringField;
    cdsEQAPADRAODESCRICAO: TStringField;
    cdsEQAPADRAOORDEM: TIntegerField;
    procedure cdsEditNewRecord(DataSet: TDataSet);
    procedure cdsEditBeforeOpen(DataSet: TDataSet);
    procedure cdsEditBeforeInsert(DataSet: TDataSet);
    procedure cdsEditBeforeDelete(DataSet: TDataSet);
    procedure cdsEditFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables  ; override ;
    procedure SetValor ( AValor : double ) ;
  end;

implementation

uses UDBZootecnico, Exceptions;

{$R *.dfm}

procedure TZoo_CfgParamMatrizesDatamodule.OpenTables;
begin
  inherited;
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_EQA_PADRAO, cdsEQAPADRAO ) ;
end;


procedure TZoo_CfgParamMatrizesDatamodule.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsEditKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsEditATIVO.AsString := 'T' ;
  cdsEditINTERNAL.AsString := 'F' ;
end;


procedure TZoo_CfgParamMatrizesDatamodule.SetParams;
begin
  with cdsEdit.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
    end ;
end;

procedure TZoo_CfgParamMatrizesDatamodule.SetValor(AValor: double);
begin
  inherited;
  if not ( cdsEdit.State in [dsInsert,dsEdit] ) then
    cdsEdit.edit ;

  cdsEditPRIMIPARA.asFloat := AValor ;
  cdsEditMULTIPARA.asFloat := AValor ;

end;

procedure TZoo_CfgParamMatrizesDatamodule.cdsEditBeforeDelete(
  DataSet: TDataSet);
begin
  Abort ;
end;

procedure TZoo_CfgParamMatrizesDatamodule.cdsEditBeforeInsert(
  DataSet: TDataSet);
begin
  Abort ;
end;

procedure TZoo_CfgParamMatrizesDatamodule.cdsEditBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_CfgParamMatrizesDatamodule.cdsEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := cdsEditSYS_VALUE.asString <> 'EQA_REBANHO' ;
end;

end.
