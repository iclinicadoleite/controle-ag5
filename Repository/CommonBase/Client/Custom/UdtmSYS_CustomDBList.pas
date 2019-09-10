unit UdtmSYS_CustomDBList;

interface

uses
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider,
  System.Classes, Datasnap.DBClient, UdtmSYS_BASE ;

type
  TdtmCustomDBList = class(T_dtmBASE)
    cdsList: TClientDataSet;
    dspList: TDataSetProvider;
    sqlList: TSQLDataSet;
    sqlDetail1: TSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsDetail1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Exceptions;

{$R *.dfm}

end.
