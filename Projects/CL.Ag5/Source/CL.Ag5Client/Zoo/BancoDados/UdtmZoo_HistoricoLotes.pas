unit UdtmZoo_HistoricoLotes;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TdtmZoo_HistoricoLotes = class(T_dtmBASE)
    cdsLotes: TClientDataSet;
    dspLotes: TDataSetProvider;
    sqlLotes: TTcSQLDataSet;
    sqlLotesLOTE: TStringField;
    sqlLotesDATA: TSQLTimeStampField;
    cdsLotesLOTE: TStringField;
    cdsLotesDATA: TSQLTimeStampField;
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

{ TdtmZoo_HistoricoLotes }

procedure TdtmZoo_HistoricoLotes.SetKAnimal(const Value: string);
begin
  FKAnimal := Value;
  cdsLotes.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := Value  ;
  TCDSSuppl.Open ( cdsLotes );
end;

end.


