unit UApplResources;

interface

//   Name := 'ApplResources' ;

uses
  MidasLib, WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Menus, VCL.ComCtrls, VCL.ExtCtrls,  VCL.ImgList, VCL.ToolWin, VCL.ActnList,
  VCL.StdCtrls, AppEvnts, Registry,  XPStyleActnCtrls, ActnMan, ActnCtrls, ActnMenus,
  ExtActns, ActnColorMaps, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, StdStyleActnCtrls,
  JvExExtCtrls, JvComponent, JvClock, JvExComCtrls,
  VCL.Buttons, OleCtrls, System.Variants, VCL.DBCtrls, ActiveX, JvExStdCtrls,
  JvCombobox, SHDocVw, JvTabBar, JvExControls,
  JvComponentBase, JvComputerInfoEx,
  JvExtComponent, StdActns, Themes,
  JvDBUltimGrid, JvAppInst,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, //DBResourcesIntf,
  //CDSSuppl, SQLSuppl,
  Tc.VCL.Application,
  Tc.RTL.Packages.Manager,
  Tc.VCL.Dialogs,
  CLAg5.AccessKeyGen, CLAg5.ComputerID, System.Actions,
  System.ImageList, Wrappers  ;

type


//  TApplResources = class(TTcDBApplication)
  TApplResources = class(TTcApplication)
    procedure ApplicationGetLoginFormClass(Sender: TObject;
      var ALoginFormClass: TClass);
    procedure ApplicationGetSplashScreenClass(Sender: TObject;
      var ASplashScreenClass: TClass);
    procedure ApplicationGetMainFormClass(Sender: TObject;
      var AMainFormClass: TFormClass);
    procedure ApplicationInitResources(Sender: TObject);
    procedure ApplicationModalEnd(Sender: TObject);
    procedure ApplicationException(Sender: TObject; E: Exception);
    procedure ApplicationLoggin(Sender: TObject);
    procedure ApplicationCheckLicense(Sender: TObject;
      var ALicenseState: TLicenseState);
  private
    { Private declarations }
    { Private declarations }
//    procedure LoadDBResources ;
//    procedure LoadDesktop ;
//    procedure InitResources ;
  public
    { Public declarations }
    InProcess : boolean ;
    class procedure Run ;
    class procedure SetLicDate( ADate : TDateTime ) ;

  end;

//  TCdsSuppl = class ( CDSSuppl.TCdsSuppl ) ;
//  TSQLSuppl = class ( SQLSuppl.TSQLSuppl ) ;

//var
//  ApplResources: TApplResources;

implementation

Uses ShellAPI, { UfrmGLB_RTFToolEdit, }
  SysFormDialogError, UfrmSYS_DefaultDialogError,
  Exceptions,
  StrUtils,
  GuidSuppl, Debugger,
  PNGImage, GIFImg, JvJVCLUtils,
  Tc.RTL.NotificationService ;

{$R *.DFM}



class procedure TApplResources.Run ;
begin

  RegisterGraphicSignature('GIF', 0, TGIFImage);
  RegisterGraphicSignature('PNG', 1, TPNGImage);

  TApplResources.Create ( nil ) ;
end;

type
  PHICON = ^HICON;

(*
procedure TApplResources.LoadDBResources;
begin
   if FileExists( FProjectFolder + FProjectName + '\' + FProjectName + '.DB.bpl' ) then
     PackageManager.LoadPackage ( FProjectFolder + FProjectName + '\' + FProjectName + '.DB.bpl' ) ;
end;

procedure TApplResources.LoadDesktop;
begin
//   LoadPackage ( 'desktop.bpl' ) ;

   if FileExists( FProjectFolder + FProjectName + '\' + FProjectName + '.desktop.bpl' ) then
      PackageManager.LoadPackage ( FProjectFolder + FProjectName + '\' + FProjectName + '.desktop.bpl' )
   else
     RaiseException('desktop não encontrado'#13#10 + FProjectFolder + FProjectName + '\' + FProjectName + '.desktop.bpl');
    //  MessageDlg (  'desktop não encontrado'#13#10 + FProjectFolder + FProjectName + '\' + FProjectName + '.desktop.bpl',
    //    mtWarning, [mbOk], 0 ) ;

//   if FileExists( FProjectFolder + FProjectName + 'admindesktop.bpl' ) then
//      LoadPackage ( FProjectFolder + FProjectName + 'admindesktop.bpl' ) ;


end;
*)

function ShiftDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_SHIFT] and 128) <> 0);
end;


function TranslateMessages ( var E: Exception ) : boolean ;
var
  Active : TWinControl;
  I: Integer;
  msg : string ;
  FKName : string ;
  TableName : string ;
  nPos  : integer ;
  tmpMsg : String ;
begin

{ Modificação
Unable to find record.  No key specified
1
Exception. }

{
  Active := Controls[0];
  for I:= 0 to ControlCount -1 do
  begin
    if Controls[I] is TWinControl then
      if (Controls[I] as TWinControl).Focused then
        Active := Controls[I];
  end;
}
//is not a valid integer value
//No value for parameter 'KCAD_ENTIDADE'
//No fields defined.  Cannot create dataset.

  if ( E is TranslatedError ) or ( E is TranslatedInformation ) or ( E is TranslatedWarning ) then
     exit ;

  nPos  := Pos ( 'SYS$EXCEPTION', E.Message ) ;
  if ( nPos <> 0 ) then
   begin

    Msg := Copy ( E.Message,nPos + 14, MaxInt ) ;
    //Msg := Copy ( Msg, 1, Pos ( #13, Msg  ) ) ;
    Msg := Copy ( Msg, 1, Pos ( #10, Msg  ) ) ;
    raise TranslatedWarning.Create( msg );
   end;

  nPos  := Pos ( 'violation of FOREIGN KEY constraint "', E.Message ) ;
  if ( nPos <> 0 ) then
    begin

     //violation of FOREIGN KEY constraint "?" on table "?"
    //Foreign key references are present for the record
{
     msg := copy ( E.Message, 1, nPos -1 ) ;
     tmpMsg := E.Message ;
     Delete ( tmpMsg, 1, Pos ( '"', E.Message ) ) ;
     FKName := Copy ( tmpMsg, 1, Pos ( '"', tmpMsg ) - 1 ) ;
     Delete ( tmpMsg, 1, Pos ( '"', tmpMsg ) ) ; // remove FK Name
     Delete ( tmpMsg, 1, Pos ( '"', tmpMsg ) ) ; // remove on Table "
     TableName := Copy ( tmpMsg, 1, Pos ( '"', tmpMsg ) - 1 ) ;
}
     Msg := E.Message ;
(*
     Msg := Msg
      + #13#10 + 'registro sendo utilizado em : ' {+ FKName} + '"'
      + DBResources.GetTableDescription( TableName ) + '"'
      + #13#10 + 'Operação cancelada.' ;
*)     raise TranslatedWarning.Create( msg );
    end;

//Record not found or changed by another user

  Result :=  Pos ( 'must have a value', E.Message ) <> 0 ;

  if E is EConvertError then
     begin
        if E.Message = 'Could not parse SQL TimeStamp string' then
           Raise Warning.Create( 'Data inválida' ) ;
     end ;

  if E is EDBClient then
     begin
       if ( e.Message = 'Field value required.' ) and Assigned ( Screen.ActiveControl ) then
         begin
//          if ( Screen.ActiveControl is TDBGrid ) and
//               Assigned ( TDBGrid ( Screen.ActiveControl ).SelectedField ) then
//             begin
//                e.Message := 'Campo ''' +  TDBGrid ( Screen.ActiveControl ).SelectedField.DisplayLabel + ''' requerido.'
//             end
          {else} if ( Screen.ActiveControl is TDBEdit ) and
               Assigned ( TDBEdit ( Screen.ActiveControl ).Field ) then
             begin
                e.Message := 'Campo ''' +  TDBEdit ( Screen.ActiveControl ).Field.DisplayLabel + ''' requerido.'
             end ;
         end ;

         msg := e.Message ;
         e := LocalEDBClient.Create (  msg ) ;

     end ;

  if E is EDatabaseError then
     BEGIN
         msg := e.Message ;
         e := LocalEDBClient.Create ( msg ) ;
     END ;

  if E.ClassName = 'ESocketError' then
     BEGIN
         msg := e.Message ;
         e := Fail.Create ( msg ) ;
     END ;

//   if 'Field Value Required'
   e.Message := StringReplace ( e.Message, 'Field', 'Campo', [rfReplaceAll,rfIgnoreCase] ) ;
   e.Message := StringReplace ( e.Message, 'must have a value', 'deve ser preenchido/pesquisado', [rfReplaceAll,rfIgnoreCase] ) ;
   e.Message := e.Message + #13#10#13#10 ; // + e.ClassName ;
end ;






(*
procedure RegisterServer( ServerName : string ) ;
var
  Registry: TRegistry;
  KeyName : String ;
begin
  Registry := TRegistry.Create ;
  try
//    Registry.RootKey := HKEY_CURRENT_USER;
    KeyName :=  '\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\' + ServerName ;
    // False because we do not want to create it if it doesn't exist
    if not Registry.OpenKey( KeyName, False ) then
       begin
          Registry.OpenKey( KeyName, True ) ;
          Registry.WriteInteger( '*', 1 );
       end ;
    Registry.CloseKey ;
  finally
    Registry.Free;
  end;
end;
*)

{

on E: EDatabaseError do


Procedure TfrmDm.ControleErro(E: EDatabaseError);
var
Mensagem :string;
begin
if Pos('VIOLATION OF FOREIGN KEY',UpperCase(E.Message)) > 0 then
begin
Mensagem := 'Registro em Uso por outra Tabela, não pode ser excluído.';
end
else if Pos('CHECK CONSTRAINT',UpperCase(E.Message)) > 0 then
begin
Mensagem :='Verifique os dados informados!';
end
else if Pos('VALIDATION ERROR FOR COLUMN',UpperCase(E.Message)) > 0 then
begin
Mensagem :='Valor inválido!';
end
else if Pos('EXCEPTION 1',UpperCase(E.Message)) > 0 then
begin
Mensagem := MSG_DUPLICIDADE;
end
else if Pos('STORE DUPLICATE VALUE',UpperCase(E.Message)) > 0 then
begin
Mensagem := 'Você está tentando gravar um valor que não pode ser
repetido.';
end
else if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY',UpperCase(E.Message)) > 0
then
begin
Mensagem :='Já Existe um Registro Cadastrado com Este Código.';
end
else if Pos('RECORD NOT FOUND OR CHANGED BY ANOTHER
USER.',UpperCase(E.Message)) > 0 then
begin
Mensagem := 'Registro não encontrado ou modificado por outro usuário.';
end
else
Mensagem := E.Message;

}


var
  _LICENSE : TDateTime = 0 ;

class procedure TApplResources.SetLicDate(ADate: TDateTime);
begin
  _LICENSE := ADate ;
end;

procedure TApplResources.ApplicationCheckLicense(Sender: TObject;
   var ALicenseState: TLicenseState);
const
  _READONLY_DAYS = 30 ;
  _WARNING_DAYS  = 15 ;
var
  LExpireInDays, LDieInDays : integer ;
  LDieDate : TDateTime ;
const
  _MSG_DIE = 'A licença de uso do "Agenda" está expirada há %d dia(s).'
      +#13#10'O "Agenda" será finalizado.'
      +#13#10'Todos os dados não salvos serão perdidos.' ;

  _MSG_RDONLY = 'A licença de uso do "Agenda" está expirada há %d dia(s).'
         +#13#10'O "Agenda" será executado em modo somente leitura.'
         +#13#10'Nenhum dado poderá ser salvo, apenas consultado.'
         +#13#10'Em %s - %d dia(s), não será mais permitida sua execução.' ;

  _MSG_EXPIRES_TODAY = 'A licença de uso do "Agenda" expira HOJE.'
          +#13#10'Amanhã o "Agenda" excutará em modo somente leitura por %d dias.'
          +#13#10'Nenhum dado poderá ser salvo, apenas consultado.'
          +#13#10'Em %s - %d dia(s), não será mais permitida sua execução.'  ;

  _MSG_EXPIRES_INDAYS = 'A licença de uso do "Agenda" irá expirar em %d dia(s).'
           +#13#10'Após este período o "Agenda" excutará em modo somente leitura por %d dias.'
           +#13#10'Nenhum dado poderá ser salvo, apenas consultado.'
           +#13#10'Em %s ( %d dias ), não será mais permitida sua execução.' ;

begin

  if LoggedUser.License = '' then
    exit ;

  if _LICENSE = 0 then
    with FactoryAccessKeyValidate do
      begin
        PublicKey  := ComputerID ;
        PrivateKey := LoggedUser.License ;
        Validate ;
        _LICENSE := Validade ;
      end;

  if ( Date < _LICENSE - _WARNING_DAYS ) then
    exit ;

  LExpireInDays := Abs ( Trunc ( _LICENSE  - Date ) ) ;
  LDieDate      := _LICENSE + _READONLY_DAYS + 1 ;
  LDieInDays    := Trunc (  LDieDate - Date ) ;

  if Date >= LDieDate then
    begin
      ALicenseState := lsExpired ;
      MessageDlg ( _MSG_DIE, [ LExpireInDays ], mtError ) ;
    end
  else if ( Date > _LICENSE )  then
    begin
      ALicenseState := lsReadOnly ;
      MessageDlg ( _MSG_RDONLY,
          [ LExpireInDays,
            FormatDateTime( 'dd.mm.yyyy', Trunc ( LDieDate ) ),
            LDieInDays
          ], mtWarning  ) ;
    end
  else if LExpireInDays = 0  then
    MessageDlg  ( _MSG_EXPIRES_TODAY,
          [  _READONLY_DAYS,
             FormatDateTime( 'dd.mm.yyyy', Trunc ( LDieDate ) ),
             LDieInDays
          ], mtInformation )
  else
    MessageDlg  ( _MSG_EXPIRES_INDAYS,
           [ LExpireInDays,
             _READONLY_DAYS,
             FormatDateTime( 'dd.mm.yyyy', Trunc ( LDieDate ) ),
             LDieInDays
           ], mtInformation )

end;

procedure TApplResources.ApplicationException(Sender: TObject;
  E: Exception);
var
  AbortError : boolean ;
begin

   if not ( ( E is TranslatedError ) or ( E is TranslatedInformation ) or ( E is TranslatedWarning ) ) then
      TranslateMessages (  E  ) ;
//  MainApplEvents.CancelDispatch

//   showMessage ( TComponent ( Sender ).Name ) ;
//   showMessage ( Screen.ActiveControl.Name ) ;

   try
        if E is Information then
           MessageDlg( E.Message, mtInformation )
        else if E is Warning then
           MessageDlg( E.Message, mtWarning )
        else if E is Error then
           MessageDlg( E.Message, mtError )
        else if Pos ( 'System Error.  Code: 5', E.Message ) = 0 then
             UfrmSYS_DefaultDialogError.TfrmDefaultDialogError.Show ( E ) ;
   except
       Application.ShowException(E);
   end ;
{
   MainApplEvents.CancelDispatch ;

   try
      AbortError := False ;
      Abort ;
   except
     on E : Exception do
     begin
        showMessage ( e.Message ) ;
        AbortError := True ;
        Abort
    end ;
   end ;

   if not AbortError then
      abort ;
}

end;

procedure TApplResources.ApplicationGetLoginFormClass(Sender: TObject;
  var ALoginFormClass: TClass);
begin
  ALoginFormClass := GetClass ( 'TfrmSYS_Login' ) ;
//  ALoginFormClass := GetClass ( 'TfrmDash_Login' ) ;
end;


procedure TApplResources.ApplicationGetMainFormClass(Sender: TObject;
  var AMainFormClass: TFormClass);
var
   FProjectFolder: string;
   FProjectName: string;
begin

   PackageManager.LoadPackage ( FProjectFolder + 'CL.Ag5.AppDesktop.bpl' ) ;
   ActivateClassGroup( TControl ) ;
   AMainFormClass := TFormClass ( GetClass ( 'TModulesDashboard' ) ) ;


end;

procedure TApplResources.ApplicationGetSplashScreenClass(Sender: TObject;
  var ASplashScreenClass: TClass);
begin
  ASplashScreenClass := GetClass ( 'TfrmSYS_Splash' ) ;
end;

procedure TApplResources.ApplicationInitResources(Sender: TObject);
var
   Server : string ;
   x, nPos: integer ;
   FProjectFolder: string;
   FProjectName: string;
begin
   // Faz a leitura da BPL DBResources ... do diretorio apropriado  ...

   FProjectFolder := ExtractFilePath ( ParamStr( 0 ) ) ;
   FProjectName   := ChangeFileExt( ExtractFileName ( ParamStr( 0 ) ), '' ) ;

   if HINSTANCE <> GetModuleHandle(nil) then // in bpl
     begin
//       if FileExists( FProjectFolder + FProjectName + '\' + FProjectName + '.DB.Session.bpl' ) then
//          PackageManager.LoadPackage ( FProjectFolder + FProjectName + '\' + FProjectName + '.DB.Session.bpl' ) ;
       if FileExists( FProjectFolder + FProjectName + '\' + 'CL.Ag5.DB.Session.bpl' ) then
          PackageManager.LoadPackage ( FProjectFolder + FProjectName + '\' + 'CL.Ag5.DB.Session.bpl' ) ;
     end;

   TComponentClass ( GetClass ( 'TDBSession' ) ).Create( self ) ;
                                     (*
   if HINSTANCE <> GetModuleHandle(nil) then // in bpl
     begin
       ShowMessage ( 'laod edtidades' );
       PackageManager.LoadPackage ( 'CL.Ag5.Entidades.bpl' ) ;
     end;
     *)
end;

procedure TApplResources.ApplicationLoggin(Sender: TObject);
begin
  CheckLicense ;
end;

procedure TApplResources.ApplicationModalEnd(Sender: TObject);
begin
  inherited;
end;

{ TLicense }


end.
