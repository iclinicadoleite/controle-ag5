unit UdtmZoo_HistoricoBrincos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider ;

type
  TdtmZoo_HistoricoBrincos = class(T_dtmBASE)
    cdsBrincos: TClientDataSet;
    dspBrincos: TDataSetProvider;
    sqlBrincos: TTcSQLDataSet;
    sqlBrincosBRINCO: TStringField;
    sqlBrincosDATA: TSQLTimeStampField;
    cdsBrincosBRINCO: TStringField;
    cdsBrincosDATA: TSQLTimeStampField;
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

{ TdtmZoo_HistoricoBrincos }

procedure TdtmZoo_HistoricoBrincos.SetKAnimal(const Value: string);
begin
  FKAnimal := Value;
  cdsBrincos.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := Value  ;
  TCDSSuppl.Open ( cdsBrincos ) ;
end;

end.
