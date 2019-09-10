unit UDomainListForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, Tc.VCL.Form, VCL.StdCtrls, VCL.ActnList, VCL.ExtCtrls,
  UDomainValidateForm, UDomainListDatamodule, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Buttons, SysFormDialog, JvExExtCtrls, JvExtComponent,
  JvPanel, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application,
  Vcl.AppEvnts,
  CL.Ag5.NSMsgs,
  Wrappers  ;

type
  TDomainListForm = class(T_FormDialog)
    dbgDomains: TJvDBUltimGrid;
    dtsDomains: TDataSource;
    Button1: TTcGDIButton;
    Button2: TTcGDIButton;
    ActionList1: TActionList;
    actAddLicense: TAction;
    actInitDomain: TAction;
    actAddLicenseFromArchive: TAction;
    rbFilterAll: TRadioButton;
    rbFilterActive: TRadioButton;
    rbFilterReadOnly: TRadioButton;
    Label2: TLabel;
    Button3: TTcGDIButton;
    Button4: TTcGDIButton;
    actValideLicense: TAction;
    OpenDialog1: TOpenDialog;
    lblStatus: TLabel;
    PanelTitle: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    lblSerial: TLabel;
    rbFilterLess15: TRadioButton;
    rbFilterExpired: TRadioButton;
    ApplicationEvents: TApplicationEvents;
    procedure actAddLicenseExecute(Sender: TObject);
    procedure actAddLicenseFromArchiveExecute(Sender: TObject);
    procedure actValideLicenseExecute(Sender: TObject);
    procedure actValideLicenseUpdate(Sender: TObject);
    function dbgDomainsCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgDomainsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure lblSerialClick(Sender: TObject);
    procedure rbFilterAllClick(Sender: TObject);
    procedure rbFilterActiveClick(Sender: TObject);
    procedure rbFilterLess15Click(Sender: TObject);
    procedure rbFilterReadOnlyClick(Sender: TObject);
    procedure rbFilterExpiredClick(Sender: TObject);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure TcFormActivate(Sender: TObject);
  private
    { Private declarations }
    FDomainListDatamodule: TDomainListDatamodule;
    procedure ClearStatus ;
    procedure DoStatus(AStatus: string);
    procedure DoLog(ALog: string);
    procedure LoadLicenseFromFile ;
    procedure DoBringToFront( AMsg : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses Tc.RTL.Exceptions, CLAg5.ComputerID , UDomainValidateDatamodule, threadSuppl, ClipBrd ;

procedure TDomainListForm.actAddLicenseExecute(Sender: TObject);
var
  LDomainID : string ;
begin
//  ShowMessage ( DBGDomains.IndicatorOffset.ToString ) ;
  if TDomainValidateForm.Execute( '', '', LDomainID, DoStatus, DoLog ) then
    begin
     FDomainListDatamodule.Refresh( LDomainID ) ;
    end;
  ClearStatus ;

end;


procedure TDomainListForm.actValideLicenseExecute(Sender: TObject);
var
  LDomainID : string ;
begin
  LDomainID := '' ;
  if TDomainValidateForm.Execute( FDomainListDatamodule.cdsDomainsDOMAIN_CODE.asString, FDomainListDatamodule.cdsDomainsDOMAIN_NAME.asString, LDomainID, DoStatus, DoLog ) then
   FDomainListDatamodule.Refresh( LDomainID ) ;
  ClearStatus ;
end;

procedure TDomainListForm.actValideLicenseUpdate(Sender: TObject);
begin
   actValideLicense.Enabled := not FDomainListDatamodule.cdsDomains.IsEmpty
end;

procedure TDomainListForm.ApplicationEventsActivate(Sender: TObject);
begin
   threadSuppl.TSyncThread.Create ( BringToFront ) ;
end;

procedure TDomainListForm.actAddLicenseFromArchiveExecute(Sender: TObject);
begin
  LoadLicenseFromFile ;
end;

procedure TDomainListForm.ClearStatus;
begin
  lblStatus.Visible := False ;
end;

constructor TDomainListForm.Create(AOwner: TComponent);
begin
  inherited;
  TCLAg5NSMsgBringToFront.Subscribe ( DoBringToFront ) ;
  FDomainListDatamodule := TDomainListDatamodule.Create ( self ) ;
  FDomainListDatamodule.StatusCallBack := DoStatus ;
  FDomainListDatamodule.LogCallBack    := DoLog ;
  lblSerial.Caption := 'Serial : ' + ComputerID ;
end;

function TDomainListForm.dbgDomainsCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
  Result := Field = FDomainListDatamodule.cdsDomainsDBINITIALIZED ;
end;

procedure TDomainListForm.dbgDomainsGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not FDomainListDatamodule.cdsDomainsDBINITIALIZED.asBoolean then
       AFont.Color := clGray
  else if FDomainListDatamodule.cdsDomainsValidade.asDateTime  - 15 > Date  then
       AFont.Color := clGreen
  else if FDomainListDatamodule.cdsDomainsValidade.asDateTime  >= Date then
       AFont.Color := clNavy
  else
       AFont.Color := clMaroon
end;

destructor TDomainListForm.Destroy;
begin
  TCLAg5NSMsgBringToFront.UnSubscribe ( DoBringToFront ) ;
  inherited;
end;

procedure TDomainListForm.DoBringToFront(AMsg: TCLAg5NSMsg);
begin
//
   BringToFront  ;

end;

procedure TDomainListForm.DoLog(ALog: string);
begin

end;

procedure TDomainListForm.DoStatus(AStatus: string);
begin
   lblStatus.Visible := True ;
   lblStatus.Caption := AStatus ;
   Application.ProcessMessages ;
end;

procedure TDomainListForm.lblSerialClick(Sender: TObject);
begin
  Clipbrd.Clipboard.AsText := ComputerID ;
  ShowMessageFmt  ( '%s,'#13#10'copiado para área de transferência.', [ lblSerial.Caption ] ) ;
end;

procedure TDomainListForm.LoadLicenseFromFile;
var
  ErrMsg : string ;
begin
  if not OpenDialog1.Execute then
    exit ;

 ErrMsg := '' ;

 with TDomainValidateDatamodule.Create ( nil ) do
  try
    Try
      StatusCallBack := self.DoStatus ;
      LogCallBack    := self.DoLog ;
      LoadFromFile ( OpenDialog1.FileName, ComputerID )
    except On E : Exception do
      ErrMsg := E.Message ;
    end ;
  finally
    Free ;
  end ;

  FDomainListDatamodule.Refresh('') ;//need review

  ClearStatus ;

  if ErrMsg <> '' then
     raise Error.Create( ErrMsg );

end;

procedure TDomainListForm.rbFilterAllClick(Sender: TObject);
begin
   FDomainListDatamodule.DomainFilter := dfAll ;
end;

procedure TDomainListForm.rbFilterReadOnlyClick(Sender: TObject);
begin
   FDomainListDatamodule.DomainFilter := dfReadOnly ;

end;

procedure TDomainListForm.TcFormActivate(Sender: TObject);
begin
  inherited;
  TCLAg5NSMsgBringToFront.CreateAndDispatch( Self );
end;

procedure TDomainListForm.rbFilterActiveClick(Sender: TObject);
begin
   FDomainListDatamodule.DomainFilter := dfActive ;
end;

procedure TDomainListForm.rbFilterLess15Click(Sender: TObject);
begin
   FDomainListDatamodule.DomainFilter := dfLess15 ;
end;

procedure TDomainListForm.rbFilterExpiredClick(Sender: TObject);
begin
   FDomainListDatamodule.DomainFilter := dfExpired ;
end;

end.
