unit UdtmZoo_HistoricoStatus;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TdtmZoo_HistoricoStatus = class(T_dtmBASE)
    cdsStatus: TClientDataSet;
    cdsStatusDATA: TSQLTimeStampField;
    dspStatus: TDataSetProvider;
    sqlStatus: TTcSQLDataSet;
    sqlStatusDATA: TSQLTimeStampField;
    sqlStatusSTATUS: TIntegerField;
    cdsStatusSTATUS: TIntegerField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsStatusDESCR_STATUS: TStringField;
  private
    FKAnimal: string;
    procedure SetKAnimal(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property KAnimal : string  read FKAnimal write SetKAnimal;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CDSSuppl;

{$R *.dfm}

{ TdtmZoo_HistoricoStatus }

procedure TdtmZoo_HistoricoStatus.SetKAnimal(const Value: string);
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( 'STATUS_FEMEA',   cdsStatusAnimal );
  FKAnimal := Value;
  cdsStatus.Params.ParamByName ( 'KZOO_ANIMAL' ).asString := Value  ;
  TCDSSuppl.Open ( cdsStatus ) ;
end;

end.
