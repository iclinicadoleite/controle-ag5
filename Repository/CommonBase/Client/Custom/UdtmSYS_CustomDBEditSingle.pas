unit UdtmSYS_CustomDBEditSingle;

interface

uses
  Data.FMTBcd, Data.DB, Datasnap.Provider, System.Classes,
  Datasnap.DBClient, Data.SqlExpr, UdtmSYS_BASE ;

type
  TdtmCustomDBEditSingle = class(T_dtmBASE)
    cdsEdit: TClientDataSet;
    dspEdit: TDataSetProvider;
    sqlEdit: TSQLDataSet;
    sqlDetail1: TSQLDataSet;
    dtsSQLEdit: TDataSource;
    cdsDetail1: TClientDataSet;
    procedure cdsEditNewRecord(DataSet: TDataSet);
    procedure cdsEditBeforeOpen(DataSet: TDataSet);
    procedure cdsEditAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    FPrimaryKey : integer ; // campo reservado para parametro
  public
    { Public declarations }
    procedure SetParams ( PK : integer ) ;
    procedure OpenTables ; override ;
  end;


implementation

uses Exceptions;

{$R *.dfm}

{ TdtmCustomDBEditSingle }

procedure TdtmCustomDBEditSingle.OpenTables;
begin
  FPrimaryKey := -1 ; // seta a chave para um parametro nao utilizado
  inherited;
  //
end;

procedure TdtmCustomDBEditSingle.SetParams(PK: integer);
begin
   // funcao para passagem de parametros do form para o dtm
     FPrimaryKey := PK ;
end;

procedure TdtmCustomDBEditSingle.cdsEditBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // set os parametros necessarios
  // para a abertura do CDS.
  cdsEdit.Params.ParamByName( 'KCAD_ENTIDADE' ).asInteger := FPrimaryKey ;
end;

procedure TdtmCustomDBEditSingle.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  //  cdsEditUSC.asString := NomeUsuario ;
  //  cdsEditDHC.asDateTime := Now ;
end;

procedure TdtmCustomDBEditSingle.cdsEditAfterEdit(DataSet: TDataSet);
begin
  inherited;
  //  cdsEditUSA.asString := NomeUsuario ;
  //  cdsEditDHC.asDateTime := Now ;
end;

end.
