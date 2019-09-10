unit ServerContainerSvc;

interface

uses
  System.SysUtils, System.Classes,
  SvcMgr,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, DSCommonServer;

type
  TSrvServerContainer = class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;

implementation

uses WinApi.Windows, ServerModule;

var
  SrvServerContainer: TSrvServerContainer;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SrvServerContainer.Controller(CtrlCode);
end;

function TSrvServerContainer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TSrvServerContainer.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TSrvServerContainer.DoInterrogate;
begin
  inherited;
end;

function TSrvServerContainer.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TSrvServerContainer.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TSrvServerContainer.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerModule.TServerMethods1;
end;

procedure TSrvServerContainer.ServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;

end.

