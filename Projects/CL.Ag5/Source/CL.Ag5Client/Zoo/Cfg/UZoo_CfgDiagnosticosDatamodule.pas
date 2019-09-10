unit UZoo_CfgDiagnosticosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_CfgDiagnosticosDatamodule = class(T_dtmBASE)
    cdsDiagnosticos: TClientDataSet;
    cdsDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosCODIGO: TStringField;
    cdsDiagnosticosNOME: TStringField;
    cdsDiagnosticosTIPODIAGNOSTICO: TIntegerField;
    dspDiagnosticos: TDataSetProvider;
    sqlDiagnosticos: TTcSQLDataSet;
    sqlDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    sqlDiagnosticosCODIGO: TStringField;
    sqlDiagnosticosNOME: TStringField;
    sqlDiagnosticosTIPODIAGNOSTICO: TIntegerField;
    cdsTiposDiagnostico: TClientDataSet;
    cdsTiposDiagnosticoTIPO: TStringField;
    cdsTiposDiagnosticoVALOR: TStringField;
    cdsTiposDiagnosticoDESCRICAO: TStringField;
    cdsTiposDiagnosticoORDEM: TIntegerField;
    cdsDiagnosticosDESC_TIPODIAGNOSTICO: TStringField;
    sqlDiagnosticosPOR_QUARTO: TStringField;
    cdsDiagnosticosPOR_QUARTO: TStringField;
    sqlDiagnosticosPERMITE_EDICAO: TStringField;
    cdsDiagnosticosPERMITE_EDICAO: TStringField;
    sqlDiagnosticosCODIGO_: TStringField;
    cdsDiagnosticosCODIGO_: TStringField;
    sqlDiagnosticosKCAD_FAZENDA: TStringField;
    cdsDiagnosticosKCAD_FAZENDA: TStringField;
    procedure cdsDiagnosticosNewRecord(DataSet: TDataSet);
    procedure cdsDiagnosticosBeforeOpen(DataSet: TDataSet);
    procedure cdsDiagnosticosBeforeDelete(DataSet: TDataSet);
    procedure cdsDiagnosticosNOMEValidate(Sender: TField);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses  Tc.DBRTL.AbstractDB
    , Exceptions
    , ClAg5Types
    , TC.RTL.StringUtils ;

{$R *.dfm}

procedure TZoo_CfgDiagnosticosDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_TIPO_DIAGNOSTICO, cdsTiposDiagnostico );
  inherited;
  //
end;


procedure TZoo_CfgDiagnosticosDatamodule.SetParams;
begin
  cdsDiagnosticos.Params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgDiagnosticosDatamodule.cdsDiagnosticosBeforeDelete(
  DataSet: TDataSet);
begin
  if not cdsDiagnosticosPERMITE_EDICAO.asBoolean then
     Abort ;
end;

procedure TZoo_CfgDiagnosticosDatamodule.cdsDiagnosticosBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_CfgDiagnosticosDatamodule.cdsDiagnosticosNewRecord(DataSet: TDataSet);
begin
  self.InitializeKeys ;
  cdsDiagnosticosKCAD_FAZENDA.Value        := LoggedUser.DomainID ;
  cdsDiagnosticosTIPODIAGNOSTICO.AsInteger := 1 ;
  cdsDiagnosticosPERMITE_EDICAO.asString   := 'T' ;
  cdsDiagnosticosPOR_QUARTO.asString       := 'F' ;
end;


procedure TZoo_CfgDiagnosticosDatamodule.cdsDiagnosticosNOMEValidate(
  Sender: TField);
const
  _SELECT_TAREFA =
         'SELECT 1 RESULT'
  +#13#10'FROM ZOO_DIAGNOSTICOS'
  +#13#10'WHERE'
  +#13#10'      KCAD_FAZENDA = :P1'
  +#13#10'  AND NOME COLLATE PT_BR = :P2'
  +#13#10'  AND KZOO_DIAGNOSTICO <> :P3'
  +#13#10'  AND TIPODIAGNOSTICO IS NOT NULL'
  +#13#10'  AND ATIVO = ''T'''
  +#13#10'ROWS 1' ;
var
  q : TSQLQuery ;
begin

   with TTcAbstractDB
     .GetByAlias('ZOOTECNICO')
     .ISQL( _SELECT_TAREFA )
     .SQLParamValues('p1', cdsDiagnosticosKCAD_FAZENDA.asString )
     .SQLParamValues('p2', TStringSuppl.DoubleSpaceTrimmer ( Sender.asString ) )
     .SQLParamValues('p3', cdsDiagnosticosKZOO_DIAGNOSTICO.asString )
      .GetDS
   do
     if FieldByName( 'RESULT' ).asInteger = 1 then
        raise Warning.Create('Diagnóstico já existente com o mesmo nome.');

end;


end.
