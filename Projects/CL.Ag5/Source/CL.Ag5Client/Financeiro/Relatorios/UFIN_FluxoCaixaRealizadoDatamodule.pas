unit UFIN_FluxoCaixaRealizadoDatamodule;

interface

uses
  System.SysUtils, UdtmSYS_BASE, System.Classes, Datasnap.Provider, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers ;

type
  TFIN_FluxoCaixaRealizadoDatamodule = class(T_dtmBASE)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

var
  FIN_FluxoCaixaRealizadoDatamodule: TFIN_FluxoCaixaRealizadoDatamodule;

implementation

{$R *.dfm}

uses
      Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
       ;

{ TrdmFIN_FluxoCaixaRealizadoDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFIN_FluxoCaixaRealizadoDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


end.
