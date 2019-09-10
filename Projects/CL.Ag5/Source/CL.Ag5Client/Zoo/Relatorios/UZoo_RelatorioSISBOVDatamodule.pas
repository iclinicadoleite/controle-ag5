unit UZoo_RelatorioSISBOVDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_RelatorioSISBOVDatamodule = class(T_dtmBASE)
    cdsFazenda: TClientDataSet;
    dspFazenda: TDataSetProvider;
    sqlFazenda: TTcSQLDataSet;
    sqlFazendaKCAD_FAZENDA: TStringField;
    sqlFazendaCERTIFICADORA: TStringField;
    sqlFazendaNOME: TStringField;
    cdsCertificadoras: TClientDataSet;
    cdsCertificadorasTIPO: TStringField;
    cdsCertificadorasVALOR: TStringField;
    cdsCertificadorasDESCRICAO: TStringField;
    cdsCertificadorasORDEM: TIntegerField;
    cdsFazendaCERTIFICADORA: TStringField;
    cdsAnimais: TClientDataSet;
    dspAnimais: TDataSetProvider;
    sqlAnimais: TTcSQLDataSet;
    sqlAnimaisBRINCO: TStringField;
    sqlAnimaisNOMEESTABULO: TStringField;
    sqlAnimaisLOTE: TStringField;
    cdsAnimaisBRINCO: TStringField;
    cdsAnimaisNOMEESTABULO: TStringField;
    cdsAnimaisLOTE: TStringField;
    cdsFazendaKCAD_FAZENDA: TStringField;
    cdsFazendaNOME: TStringField;
    cdsFazendaLISTA_CERTIFICADORAS: TStringField;
    procedure cdsFazendaBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimaisBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBEntidades, UDBZootecnico, Exceptions, CLAg5Types, UApplResources,
  Tc.VCL.Application ;

{$R *.dfm}

{ TZoo_RelatorioSISBOVDatamodule }

procedure TZoo_RelatorioSISBOVDatamodule.cdsAnimaisBeforeOpen(DataSet: TDataSet);
begin
  cdsAnimais.Params.ParamByName('KCAD_FAZENDA').AsString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  cdsAnimais.Params.ParamByName('DESCARTADA').AsInteger  := _ST_STATUS_FEMEA_DESCARTADO ;
end;

procedure TZoo_RelatorioSISBOVDatamodule.cdsFazendaBeforeOpen(DataSet: TDataSet);
begin
  cdsFazenda.Params.ParamByName('KCAD_FAZENDA').AsString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
end;

procedure TZoo_RelatorioSISBOVDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_CERTIFICADORAS, cdsCertificadoras );
  inherited;
end;

end.
