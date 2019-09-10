unit UDomainValidateForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.Mask, Tc.VCL.Form, Tc.VCL.Edits, VCL.StdCtrls,
  UDomainValidateDatamodule, VCL.DBCtrls,
  ClAg5ClientCommonTypes, Tc.VCL.Controls.GDIButton, SysFormDialog, VCL.ActnList,
  VCL.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, System.Actions,
  Tc.VCL.Application,
  CL.Ag5.NSMsgs, Vcl.AppEvnts  ;

type
  TDomainValidateForm = class(T_FormDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Button1: TTcGDIButton;
    Button2: TTcGDIButton;
    edtNomeFazenda: TEdit;
    lblSerial: TLabel;
    edtKey: TMaskEdit;
    lblCodigoFazenda: TLabel;
    lblValidade: TLabel;
    lblValidacao: TLabel;
    procedure TcFormCreate(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lblSerialClick(Sender: TObject);
    procedure edtKeyEnter(Sender: TObject);
    procedure edtKeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtKeyClick(Sender: TObject);
    procedure TcFormActivate(Sender: TObject);
    procedure edtNomeFazendaChange(Sender: TObject);
    procedure edtSerialClick(Sender: TObject);
  private
    { Private declarations }
    LGetFocusElapsedTime : Integer ;
    FMessageValidate: String;
    FDomainID : string ;
    FDomainCode : string ;
    FDomainValidateDatamodule : TDomainValidateDatamodule ;
    FStatusCallBack: TStatusCallBack;
    FLogCallBack: TLogCallBack;
    procedure SetDomain(const Value: string);
    procedure DoStatus(AStatus: string);
    procedure DoLog(ALog: string);
    procedure CheckKey ;
    function  Validate: Boolean;
    procedure MessageValidate;
    procedure SetLogCallBack(const Value: TLogCallBack);
    procedure SetStatusCallBack(const Value: TStatusCallBack);
    property LogCallBack: TLogCallBack read FLogCallBack write SetLogCallBack;
    property StatusCallBack: TStatusCallBack read FStatusCallBack write SetStatusCallBack;
    property DomainCode : string write SetDomain ;
    procedure DoBringToFront( AMsg : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    class function Execute ( ADomain : string ; ANomeFazenda : string ; out ADomainCode : string ; AStatusCallBack: TStatusCallBack ; ALogCallBack: TLogCallBack ) : boolean ;
  end;


implementation

{$R *.dfm}

uses Tc.RTL.Exceptions, Tc.RTL.StringUtils, CLAg5.ComputerID, CLAg5.AccessKeyGen, ClipBrd, threadsuppl ;
//GuidSuppl, Tc.RTL.MD5, Tc.DBRTL.AbstractDB, CLAg5.ComputerID

{ TDomainValidateForm }

class function TDomainValidateForm.Execute(ADomain: string; ANomeFazenda : string ; out ADomainCode : string ; AStatusCallBack: TStatusCallBack ; ALogCallBack: TLogCallBack ) : boolean ;
begin
  with TDomainValidateForm.Create( nil ) do
    try
        TCLAg5NSMsgBringToFront.Subscribe ( DoBringToFront ) ;
        FormStyle := fsStayOnTop;

        DomainCode := ADomain ;
        lblCodigoFazenda.Caption   := ADomain ;
        lblValidade.Caption        := '' ;
        edtNomeFazenda.Text        := ANomeFazenda ;
        edtNomeFazenda.ReadOnly    := edtNomeFazenda.Text <> '' ;

        if edtNomeFazenda.ReadOnly then
           edtNomeFazenda.Color := clSilver ;

        FStatusCallBack := AStatusCallBack ;
        FLogCallBack    := ALogCallBack ;

        Result := showModal = mrOK ;
        ADomainCode := FDomainID ;
    finally
       TCLAg5NSMsgBringToFront.UnSubscribe ( DoBringToFront ) ;
       Free ;
    end;
end;



procedure TDomainValidateForm.lblSerialClick(Sender: TObject);
begin
  Clipbrd.Clipboard.AsText := ComputerID ;
  //ShowMessageFmt  ( '%s,'#13#10'copiado para área de transferência.', [ lblSerial.Caption ] ) ;
  FMessageValidate := '* copiado para área de transferência. *';
  lblValidacao.Top := 140;
  lblValidacao.Left := 15;
  threadsuppl.TSyncThread.Create( MessageValidate );
end;

procedure TDomainValidateForm.MessageValidate;
var
  Times: Integer;
begin
  Times := 1;
  lblValidacao.Caption := FMessageValidate;
  while Times <= 3 do
   begin
     lblValidacao.Visible := True;
     Application.ProcessMessages;
     if Times < 3 then
      begin
        sleep(750);
        lblValidacao.Visible := False;
        Application.ProcessMessages;
        sleep(250);
      end;
     Inc(Times);
   end;
end;

procedure TDomainValidateForm.Button1Click(Sender: TObject);
begin
  //Validate ;
  //ModalResult := mrOk ;
  if Validate then
    ModalResult := mrOk ;
end;

procedure TDomainValidateForm.Button2Click(Sender: TObject);
begin
   modalResult := mrCancel ;
end;

procedure TDomainValidateForm.CheckKey ;
var
  LInvalid : boolean ;
begin

   if Length ( TStringSuppl.Digits( edtKey.Text )  ) <> 30 then
     begin
        if FDomainCode = '' then
         begin
           lblCodigoFazenda.Caption := '' ;
           lblValidade.Caption := '' ;
         end;
        exit ;
     end;

   LInvalid := False ;
   with FactoryAccessKeyValidate do
     begin
           PublicKey  := ComputerID ;
           PrivateKey := edtKey.Text ;
           try
             Validate ;
           except
             LInvalid := True ;
           end;

           if ( not LInvalid ) then
             begin
               if ( FDomainCode <> '' )
               and ( Fazenda <> StrToInt ( FDomainCode ) ) then
                  raise Warning.Create('Chave de acesso não pertence a fazenda.');

                lblCodigoFazenda.Caption := Format ( '%.6d', [ Fazenda ] ) ;
                lblValidade.Caption      := FormatDateTime ( 'dd/mm/yyyy', Validade ) ;
             end ;

     end ;
end;

procedure TDomainValidateForm.DoBringToFront( AMsg : TCLAg5NSMsg ) ;
begin
   BringToFront  ;
end;

procedure TDomainValidateForm.DoLog(ALog: string);
begin
  if Assigned(FLogCallBack) then
    try
      FLogCallBack(ALog);
    except
    end;
end;

procedure TDomainValidateForm.DoStatus(AStatus: string);
begin
  if Assigned(FStatusCallBack) then
    try
      FStatusCallBack(AStatus);
    except
    end;
end;

procedure TDomainValidateForm.edtKeyChange(Sender: TObject);
begin
 // CheckKey ;
 try
   lblValidacao.Visible := False;
   CheckKey;
 except
   on E: Exception do
    begin
     FMessageValidate := '* '+E.Message+' *';
     lblValidacao.Top := 38;
     lblValidacao.Left := 67;
     threadsuppl.TSyncThread.Create( MessageValidate );
    end;
 end;
end;

procedure TDomainValidateForm.edtKeyClick(Sender: TObject);
begin
  if GetTickCount < LGetFocusElapsedTime then
     edtKey.SelectAll ;
end;

procedure TDomainValidateForm.edtKeyEnter(Sender: TObject);
begin
  LGetFocusElapsedTime := GetTickCount + GetDoubleClickTime;
end;

procedure TDomainValidateForm.edtKeyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 LPosSpace : integer ;
begin
  if Now > LGetFocusElapsedTime  then
    exit ;

  LPosSpace := Pos( ' ', edtKey.Text ) ;
  if LPosSpace > -1 then
    edtKey.SelStart := LPosSpace -1 ;

end;

procedure TDomainValidateForm.edtNomeFazendaChange(Sender: TObject);
begin
  inherited;
  lblValidacao.Visible := False;
end;

procedure TDomainValidateForm.edtSerialClick(Sender: TObject);
begin
  inherited;
  Clipbrd.Clipboard.AsText := ComputerID ;
end;

function TDomainValidateForm.Validate: Boolean;
begin
  {if Length ( TStringSuppl.Digits( edtKey.Text )  ) <> 30 then
    raise Warning.Create('Chave de acesso inválida');

  if Length ( Trim ( edtNomeFazenda.Text ) ) < 3 then
    raise Warning.Create('Nome da fazenda inválido');

  }
  FDomainID := FDomainValidateDatamodule.Validate( lblCodigoFazenda.Caption, edtNomeFazenda.Text, edtKey.Text, ComputerID );

  Result := True;

  if Length ( TStringSuppl.Digits( edtKey.Text )  ) <> 30 then
   begin
    FMessageValidate := '* Chave de acesso inválida *';
    lblValidacao.Top := 38;
    lblValidacao.Left := 67;
    threadsuppl.TSyncThread.Create( MessageValidate );
    if edtKey.CanFocus then
      edtKey.SetFocus;
    Result := False;
    Exit;
   end;

  if Length ( Trim ( edtNomeFazenda.Text ) ) < 3 then
   begin
    FMessageValidate := '* Nome da fazenda inválido *';
    lblValidacao.Top := 38;
    lblValidacao.Left := 67;
    threadsuppl.TSyncThread.Create( MessageValidate );
    if edtNomeFazenda.CanFocus then
      edtNomeFazenda.SetFocus;
    Result := False;
    Exit;
   end;

  try
    FDomainID := FDomainValidateDatamodule.Validate( lblCodigoFazenda.Caption, edtNomeFazenda.Text, edtKey.Text, ComputerID );
  except
     on E: Exception do
      begin
         FMessageValidate := '* '+E.Message+' *';
         lblValidacao.Top := 38;
         lblValidacao.Left := 67;
         threadsuppl.TSyncThread.Create( MessageValidate );
         Result := False;
         Exit;
      end;
  end;
end;

procedure TDomainValidateForm.SetDomain(const Value: string);
begin
  FDomainCode := Value ;
  if not Assigned ( FDomainValidateDatamodule ) then
    FDomainValidateDatamodule  := TDomainValidateDatamodule.Create ( self ) ;
  FDomainValidateDatamodule.Domain := FDomainCode ;
end;

procedure TDomainValidateForm.SetLogCallBack(const Value: TLogCallBack);
begin
  FLogCallBack := Value;
end;

procedure TDomainValidateForm.SetStatusCallBack(const Value: TStatusCallBack);
begin
  FStatusCallBack := Value;
end;


procedure TDomainValidateForm.TcFormActivate(Sender: TObject);
begin
  inherited;
  TCLAg5NSMsgBringToFront.CreateAndDispatch( Self );
end;

procedure TDomainValidateForm.TcFormCreate(Sender: TObject);
begin
   lblSerial.Caption := 'Serial : ' + ComputerID ;
end;

end.
