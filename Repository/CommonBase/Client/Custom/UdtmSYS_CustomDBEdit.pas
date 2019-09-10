unit UdtmSYS_CustomDBEdit;

interface

uses
  UdtmSYS_BASE, Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider,
  System.Classes, Datasnap.DBClient ;

type
  TdtmCustomDBEdit = class(T_dtmBASE)
    cdsEdit: TClientDataSet;
    dspEdit: TDataSetProvider;
    sqlEdit: TSQLDataSet;
    sqlDetail1: TSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsDetail1: TClientDataSet;
    procedure cdsEditNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses Exceptions;

{$R *.dfm}

procedure TdtmCustomDBEdit.OpenTables;
begin
  inherited;
  //
end;


procedure TdtmCustomDBEdit.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;


end.
