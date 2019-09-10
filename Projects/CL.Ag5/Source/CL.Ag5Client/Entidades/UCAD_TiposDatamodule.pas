unit UCAD_TiposDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TCAD_TiposDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstTiposCadastros: TClientDataSet;
    cdsTiposCadastros: TClientDataSet;
    dspLsttiposCadastros: TDataSetProvider;
    dspTiposCadastros: TDataSetProvider;
    sqlLstTiposCadastro: TTcSQLDataSet;
    sqlTiposCadastros: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlLstTiposCadastroKCAD_TIPOS: TStringField;
    sqlLstTiposCadastroKSYSDOMAIN: TStringField;
    sqlLstTiposCadastroTIPO: TIntegerField;
    sqlLstTiposCadastroDESCRICAO: TStringField;
    cdsLstTiposCadastrosKCAD_TIPOS: TStringField;
    cdsLstTiposCadastrosKSYSDOMAIN: TStringField;
    cdsLstTiposCadastrosTIPO: TIntegerField;
    cdsLstTiposCadastrosDESCRICAO: TStringField;
    sqlTiposCadastrosKCAD_TIPOS: TStringField;
    sqlTiposCadastrosKSYSDOMAIN: TStringField;
    sqlTiposCadastrosTIPO: TIntegerField;
    sqlTiposCadastrosDESCRICAO: TStringField;
    cdsTiposCadastrosKCAD_TIPOS: TStringField;
    cdsTiposCadastrosKSYSDOMAIN: TStringField;
    cdsTiposCadastrosTIPO: TIntegerField;
    cdsTiposCadastrosDESCRICAO: TStringField;
    procedure cdsLstTiposCadastrosNewRecord(DataSet: TDataSet);
    procedure cdsTiposCadastrosNewRecord(DataSet: TDataSet);
    procedure cdsTiposCadastrosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FTipoCadastro : Integer;
    procedure SetParams ;
    function ValidaDescricao( FDescricao: string ): Boolean;
  public
    { Public declarations }
    procedure SetFilter ( TipoCadastro: Integer );
    procedure OpenTables ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBEntidades, UDBFinanceiro, Exceptions, GuidSuppl;

  {$R *.dfm}

{ TdtmCustomListaFicha }

procedure TCAD_TiposDatamodule.OpenTables;
begin
  inherited;
//  SetParams;
end;

procedure TCAD_TiposDatamodule.SetFilter(TipoCadastro: Integer);
begin
  FTipoCadastro := TipoCadastro ;
  SetParams ;
//  cdsLstTiposCadastros.Refresh ;
end;

procedure TCAD_TiposDatamodule.SetParams;
begin
   cdsLstTiposCadastros.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID ;
   cdsLstTiposCadastros.Params.ParamByName( 'TIPO' ).AsInteger        := FTipoCadastro ;
end;

function TCAD_TiposDatamodule.ValidaDescricao(FDescricao: string): Boolean;
const
  SQL_CADASTROS = 'SELECT COUNT(1) RESULT ' +
                  'FROM CAD_TIPOS ' +
                  'WHERE KSYS$DOMAIN = :KSYS$DOMAIN ' +
                  '  AND TIPO = :TIPO ' +
                  '  AND DESCRICAO = :DESCRICAO ';
var
  cds : TClientDataSet;
    p : TParams;
begin
  cds := nil;
    p := TParams.Create;

  p.CreateParam( ftString,  'KSYS$DOMAIN', ptInput ).AsString  := LoggedUser.DomainID;
  p.CreateParam( ftInteger, 'TIPO',         ptInput ).AsInteger := FTipoCadastro ;
  p.CreateParam( ftString,  'DESCRICAO',    ptInput ).AsString  := FDescricao;

  TTcAbstractDB.GetByAlias('ENTIDADES').populateClientDataSet( cds, SQL_CADASTROS, p );

  Result := cds.FieldByName('RESULT').AsInteger > 0;

    p.Free;
  cds.Free;
end;

procedure TCAD_TiposDatamodule.cdsLstTiposCadastrosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TCAD_TiposDatamodule.cdsTiposCadastrosBeforePost(DataSet: TDataSet);
begin
  if not cdsTiposCadastrosDESCRICAO.IsNull then
    if ValidaDescricao( cdsTiposCadastrosDESCRICAO.AsString ) then
      raise Warning.Create('Registro já existente');
end;

procedure TCAD_TiposDatamodule.cdsTiposCadastrosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsTiposCadastrosKCAD_TIPOS.AsString   := GuidSuppl.GuidStr20 ;
  cdsTiposCadastrosKSYSDOMAIN.AsString   := LoggedUser.DomainID ;
  cdsTiposCadastrosTIPO.AsInteger        := FTipoCadastro ;
end;

end.
