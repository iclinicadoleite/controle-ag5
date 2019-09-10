unit UdtmSYS_CustomListaFicha;

interface

uses
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider,
  System.Classes, Datasnap.DBClient, UdtmSYS_BASEDBListEdit ;

type
  TdtmCustomListaFicha = class(T_dtmBASEDBListEdit)
    cdsList: TClientDataSet;
    cdsEdit: TClientDataSet;
    dspList: TDataSetProvider;
    dspEdit: TDataSetProvider;
    sqlList: TSQLDataSet;
    sqlEdit: TSQLDataSet;
    dtsList: TDataSource;
    sqlDetail1: TSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsDetail1: TClientDataSet;
    procedure cdsListNewRecord(DataSet: TDataSet);
    procedure cdsEditNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

//uses UDBResources, Exceptions;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TdtmCustomListaFicha.OpenTables;
begin
  inherited;
  //
end;

procedure TdtmCustomListaFicha.cdsListNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmCustomListaFicha.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
end;

end.
