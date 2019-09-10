// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : User Inteface - Dialog
// Funcionality : Error Dialogs
// License      : veja readme.txt


// License      : internal use


unit SysFormDialogError;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.StdCtrls, VCL.Buttons, VCL.Imaging.jpeg, VCL.ExtCtrls,MailSuppl, ThreadSuppl,
  VCL.ActnList, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type
  T_FormDialogError = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _memoMsg: TMemo;
    _btnSendByMail: TBitBtn;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    _pnlDspScreen: TPanel;
    _imgScreenThumbnail: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    BitBtn2: TBitBtn;
    _memoOtherInfo: TMemo;
    Panel4: TPanel;
    procedure _imgScreenThumbnailClick(Sender: TObject);
    procedure _btnSendByMailClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Pic : TBitMap ;
    ScreenShot : TJpegImage ;
    function  GetLog : TStringList ;
    procedure SendByMail ;
    procedure CopyScreenShotToClipboard ;
    procedure CopyMessageToClipboard ;
    procedure GetScreen ;
    procedure MakeThumbnail ;
    procedure GetOtherInfo ;
    function CreateImgScreenViewer : TForm ;
    procedure imgViewScreenKeyPress(Sender: TObject; var Key: Char);
    procedure imgViewScreenClickClose(Sender: TObject);
  public
    { Public declarations }
    class procedure Show ( E : Exception  ) ;
  end;


implementation

uses Tc.RTL.Folders, Tc.VCL.Graphics, Clipbrd;

{$R *.dfm}

{ T_FormDialogError }

class procedure T_FormDialogError.Show ( E : Exception  ) ;
var
  LMsg: string;
begin
  // ERROR CAIQUE
  try
     LMsg := E.Message;
  except
     exit
  end ;

  with T_FormDialogError.Create ( nil ) do
     begin
        _btbSave.Left := ( _pnlFooter.ClientWidth - _btbSave.Width ) div 2 ;
        GetScreen ;
        GetOtherInfo ;
        if (LMsg <> '') and (AnsiLastChar(LMsg) > '.') then
           LMsg := LMsg + '.' ;
        _memoMsg.Lines.Text := ( LMsg ) ;
        showModal ;
        free ;
     end ;

end;


procedure T_FormDialogError._imgScreenThumbnailClick(Sender: TObject);
begin
  inherited;
  with CreateImgScreenViewer do
     begin
        ShowModal ;
        Free ;
      end ;
end;

procedure T_FormDialogError.imgViewScreenClickClose(Sender: TObject);
begin
     GetParentForm ( TImage ( Sender ) ).ModalResult := mrOk  ;
end;

function T_FormDialogError.CreateImgScreenViewer : TForm ;
begin
  Result := TForm.Create( self ) ;
  with Result do
      begin
          BorderStyle := bsNone ; //bsSingle ;
          Color := clMaroon ;
          BorderWidth := 3 ;
          Tag := 99 ;
          ClientWidth  := ScreenShot.Width ;
          ClientHeight := ScreenShot.Height + 15 ;
          Position := poScreenCenter ;
          BringToFront ;
          KeyPreview := True ;
          OnKeyPress := imgViewScreenKeyPress ;
          with TPanel.Create( Result ) do
             begin
                 Parent    := Result ;
                 ParentBackground := False ;
                 Color     := clMaroon ;
                 Align     := alTop ;
                 Alignment := taCenter ;
                 BevelOuter := bvNone ;
                 Font.Name := 'Verdana' ;
                 Font.Size := 7 ;
                 Font.Color := clWhite ;
                 Font.Style := [fsBold] ;
                 Height    := 15 ;
                 Caption   := 'Visualizaçao da Tela - Tecle [ESC] para fechar' ;
             end ;
          with TImage.Create( Result ) do
             begin
                Name := 'Image' ;
                Parent := Result ;
                Align := alClient ;
                Picture.Bitmap.Assign( ScreenShot ) ;
                OnClick := imgViewScreenClickClose ;
             end ;
  end ;

end;

procedure T_FormDialogError.imgViewScreenKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #27 then
        TForm ( Sender ).Close ;
end;
{
procedure T_FormDialogError.GetScreen;
var
  p : double ;
begin
    p := _imgScreenThumbnail.Width / Screen.Width ;

    pic := TBitmap.Create;

    with Screen do
       begin
          TImageSuppl.ScreenShot(0,0,Width,Height, Pic ) ;
          TImageSuppl.Stretch( Pic, _imgScreenThumbnail.Picture.Bitmap, Trunc ( Width * p ) , Trunc ( Height * p ) );
          TImageSuppl.StretchThis( Pic, Trunc ( Width * 0.75 ) , Trunc ( Height * 0.75 ) ) ;
          ScreenShot := TImageSuppl.BMPToJPGImage( Pic ) ;
       end ;

    pic.FreeImage;
    FreeAndNil(pic);

end;
}

procedure T_FormDialogError.GetScreen;
begin
    pic := TBitmap.Create;
    with Screen do
          TImageSuppl.ScreenShot(0,0,Width,Height, Pic ) ;
    TSimpleThread.Create ( MakeThumbnail ) ;
end;

procedure T_FormDialogError.MakeThumbnail ;
var
  p : double ;
begin
    p := _imgScreenThumbnail.Width / Screen.Width ;

    with Screen do
       begin
          TImageSuppl.Stretch( Pic, _imgScreenThumbnail.Picture.Bitmap, Trunc ( Width * p ) , Trunc ( Height * p ) );
          TImageSuppl.StretchThis( Pic, Trunc ( Width * 0.75 ) , Trunc ( Height * 0.75 ) ) ;
          ScreenShot := TImageSuppl.BMPToJPGImage( Pic ) ;
       end ;

    pic.FreeImage;
    FreeAndNil(pic);
    _imgScreenThumbnail.Refresh

end;


procedure T_FormDialogError.SendByMail;
var
   Log : TStringList ;
   LScreenShotFile : string ;
begin

   LScreenShotFile := TcTempFolderFactory.TempPath + 'erro.jpg' ;
   ScreenShot.SaveToFile( LScreenShotFile ) ;

   With GetLog do
   begin
      TMailSuppl.SendMail( Text, 'Erro de Sistema', 'caique@turbocode.com.br', '', '', LScreenShotFile ) ;
      Free ;
   end ;
end;

procedure T_FormDialogError._btnSendByMailClick(Sender: TObject);
begin
  inherited;
  SendByMail ;
end;


procedure T_FormDialogError.BitBtn2Click(Sender: TObject);
begin
  inherited;
  CopyScreenShotToClipboard ;
end;

procedure T_FormDialogError.CopyScreenShotToClipboard;
begin
   Clipboard.Assign(ScreenShot);
end;

procedure T_FormDialogError.BitBtn1Click(Sender: TObject);
begin
  inherited;
  CopyMessageToClipboard;
end;

procedure T_FormDialogError.CopyMessageToClipboard;
begin
  with GetLog do
  begin
      Clipboard.AsText := Text ;
      free ;
  end ;
end;

procedure T_FormDialogError.GetOtherInfo;
var
  x : integer ;
begin
   with _memoOtherInfo.Lines do
      begin
         Clear ;

         Add ( 'Sistema   : ' + Application.Title  ) ;
         Add ( 'Cliente   : '   ) ;
         Add ( 'Data/hora : ' + FormatDateTime ( 'dd.mm.yyyy', Date )  ) ;
         Add ( 'Usuário   : '   ) ;


         if assigned ( Screen.ActiveCustomForm ) then
            Add ( 'Formulário: ' + Screen.ActiveCustomForm.Name ) ;

         if assigned ( Screen.ActiveControl ) then
            Add ( 'Controle: ' + Screen.ActiveControl.Name ) ;

         Add ( '' ) ;
         Add ( '[Formulários Ativos]' ) ;
         for x := 0 to Screen.CustomFormCount - 1 do
            Add ( #9 + Screen.CustomForms[ x ].Name + ' (' + Screen.CustomForms[ x ].ClassName + ')' ) ;

         Add ( '' ) ;
         Add ( '[Datamodulos Ativos]' ) ;
         for x := 0 to Screen.DataModuleCount - 1 do
            Add ( #9 + Screen.DataModules[ x ].Name + ' (' + Screen.DataModules[ x ].ClassName + ')' ) ;

      end ;

end;

function T_FormDialogError.GetLog: TStringList ;
begin
   Result := TStringList.Create ;
   with Result do
      begin
        Add( '================== mensagem ==================' ) ;
        AddStrings( _memoMsg.Lines );
        Add( '=============== erro de sistema ==============' ) ;
        AddStrings( _memoOtherInfo.Lines );
      end ;
end;

initialization
  RegisterClass ( T_FormDialogError ) ;
end.
