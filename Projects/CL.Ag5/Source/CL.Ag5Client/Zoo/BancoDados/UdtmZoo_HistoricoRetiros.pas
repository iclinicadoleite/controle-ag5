unit UdtmZoo_HistoricoRetiros;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TdtmZoo_HistoricoRetiros = class(T_dtmBASE)
    cdsRetiros: TClientDataSet;
    dspRetiros: TDataSetProvider;
    sqlRetiros: TTcSQLDataSet;
    sqlRetirosRETIRO: TStringField;
    sqlRetirosDATA: TSQLTimeStampField;
    cdsRetirosRETIRO: TStringField;
    cdsRetirosDATA: TSQLTimeStampField;
  private
    FKAnimal: string;
    procedure SetKAnimal(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property KAnimal : string  read FKAnimal write SetKAnimal;
  end;

implementation

uses Exceptions, CDSSuppl;

{$R *.dfm}

{ TdtmZoo_HistoricoRetiros }

procedure TdtmZoo_HistoricoRetiros.SetKAnimal(const Value: string);
begin
  FKAnimal := Value;
  cdsRetiros.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := Value  ;
  TCDSSuppl.Open ( cdsRetiros ) ;
end;

end.


