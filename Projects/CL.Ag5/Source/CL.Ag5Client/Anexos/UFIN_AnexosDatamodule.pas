unit UFIN_AnexosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TFIN_AnexosDatamodule = class(T_dtmBASE)
    cdsAnexos: TClientDataSet;
    cdsAnexosKGLB_ATTACHMENT: TStringField;
    cdsAnexosTABLENAME: TStringField;
    cdsAnexosTABLEKEY: TStringField;
    cdsAnexosFILENAME: TStringField;
    cdsAnexosINFO: TMemoField;
    cdsAnexosDATA: TBlobField;
    sqlAnexos: TTcSQLDataSet;
    sqlAnexosKGLB_ATTACHMENT: TStringField;
    sqlAnexosTABLENAME: TStringField;
    sqlAnexosTABLEKEY: TStringField;
    sqlAnexosFILENAME: TStringField;
    sqlAnexosINFO: TMemoField;
    sqlAnexosDATA: TBlobField;
    dspAnexos: TDataSetProvider;
    procedure cdsAnexosNewRecord(DataSet: TDataSet);
    procedure cdsAnexosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    FTableName : string ;
    FTableKey  : string ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure SetFilter( ATableName, ATableKey : string ) ;
    procedure OpenTables; override;
  end;

implementation

uses Exceptions, UDBAnexos, CDSSuppl ;

{$R *.dfm}

{ TFIN_AnexosDatamodule }

procedure TFIN_AnexosDatamodule.cdsAnexosAfterInsert(DataSet: TDataSet);
begin
  TCdsSuppl.PostIfNeed( cdsAnexos );
end;

procedure TFIN_AnexosDatamodule.cdsAnexosNewRecord(DataSet: TDataSet);
begin
  Self.InitializeKeys;
  cdsAnexosTABLENAME.AsString := FTableName ;
  cdsAnexosTABLEKEY.AsString  := FTableKey  ;
end;

procedure TFIN_AnexosDatamodule.OpenTables;
begin
//  inherited;
  SetParams ;
end;

procedure TFIN_AnexosDatamodule.SetFilter(ATableName, ATableKey: string);
begin
  FTableName := ATableName ;
  FTableKey  := ATableKey  ;
  SetParams;
end;

procedure TFIN_AnexosDatamodule.SetParams;
begin
  with cdsAnexos.Params do
    begin
      ParamByName( 'TABLENAME' ).AsString := FTableName ;
      ParamByName( 'TABLEKEY'  ).AsString := FTableKey ;
    end;

  TCdsSuppl.Open( cdsAnexos ) ;
end;

end.
