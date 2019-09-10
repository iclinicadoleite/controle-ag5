unit UZoo_AtividadesPesagemLeiteDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesPesagemLeiteDatamodule = class(T_dtmBASE)
    cdsAPesagemLeite: TClientDataSet;
    dspAPesagemLeite: TDataSetProvider;
    sqlAPesagemLeite: TTcSQLDataSet;
    sqlAPesagemLeiteBRINCOFEMEA: TStringField;
    sqlAPesagemLeiteNOMEFEMEA: TStringField;
    sqlAPesagemLeiteLOTE: TStringField;
    sqlAPesagemLeiteTOTAL: TFloatField;
    cdsAPesagemLeiteBRINCOFEMEA: TStringField;
    cdsAPesagemLeiteNOMEFEMEA: TStringField;
    cdsAPesagemLeiteLOTE: TStringField;
    cdsAPesagemLeiteTOTAL: TFloatField;
    sqlAPesagemLeiteBRINCOFEMEA_: TStringField;
    cdsAPesagemLeiteBRINCOFEMEA_: TStringField;
    sqlAPesagemLeiteRETIRO: TStringField;
    cdsAPesagemLeiteRETIRO: TStringField;
    sqlAPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField;
    cdsAPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsAPesagemLeiteBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, CLAg5Types;

{$R *.dfm}

procedure TZoo_AtividadesPesagemLeiteDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesPesagemLeiteDatamodule.cdsAPesagemLeiteBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_AtividadesPesagemLeiteDatamodule.OpenTables;
begin
//
   TCDSSuppl.Open ( cdsAPesagemLeite ) ;
end;

procedure TZoo_AtividadesPesagemLeiteDatamodule.SetParams;
begin
  cdsAPesagemLeite.Params.ParamByName ( 'KCAD_FAZENDA' ).asString  := LoggedUser.DomainID ;
  cdsAPesagemLeite.Params.paramByName ( 'VL'           ).asInteger := _ST_STATUS_FEMEA_VACALACTACAO ;
end;


end.
