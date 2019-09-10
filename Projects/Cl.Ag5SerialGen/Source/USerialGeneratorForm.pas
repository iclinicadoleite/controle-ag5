unit USerialGeneratorForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.StdCtrls, VCL.ExtCtrls,
  Tc.RTL.md5,
  GuidSuppl,
  Tc.RTL.Windows.DeviceChanged ;




type
  TVolumeInfo = record
    VolName,
    FileSysName: Array [0 .. Max_Path] Of Char;
    VolSerial,
    FileMaxLen,
    FileFlags: DWORD;
    DiskSize : int64 ;
    DiskFree : int64 ;
  end;

  TForm3 = class(TForm)
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    DevChanged : TTcDeviceChanged ;
    FPenList : TStringList ;
    procedure GetPenList ( FPenList : TStrings ) ;
    function GetVolInfo( ADriveLetter : Char  ) : TVolumeInfo ;
    procedure DeviceArrived (Sender: TObject; Drive: Char) ;
    procedure DeviceRemoveComplete (Sender: TObject; Drive: Char) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor destroy ; override ;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Tc.WMI.Win32_DiskDrive,
     Tc.WMI.WmiDelphiClass ;


{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  GetPenList ( FPenList ) ;
  if FPenList.Count > 0  then
     Edit1.Text := FPenList [0]
  else
     Edit1.Text := '' ;
end;

constructor TForm3.Create(AOwner: TComponent);
begin
  inherited;
  FPenList := TStringList.Create ;

end;

destructor TForm3.destroy;
begin
  FPenList.Free ;
  inherited;
end;

procedure TForm3.DeviceArrived(Sender: TObject; Drive: Char);
var
  PenListCount, IteratesCount : integer ;
begin
  GetPenList ( FPenList ) ;
  PenListCount := FPenList.Count ;
  repeat
     Sleep ( 1000 ) ;
     GetPenList ( FPenList ) ;
     Inc ( IteratesCount ) ;
  until (PenListCount <> FPenList.Count ) or ( IteratesCount = 5 ) ;

  if FPenList.Count > 0  then
     Edit1.Text := FPenList [0]
  else
     Edit1.Text := '' ;
end;


procedure TForm3.DeviceRemoveComplete(Sender: TObject; Drive: Char);
begin
  GetPenList ( FPenList ) ;
  if FPenList.Count > 0  then
     Edit1.Text := FPenList [0]
  else
     Edit1.Text := '' ;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  DevChanged := TTcDeviceChanged.Create ( nil )  ;
  DevChanged.OnDeviceArrived         := self.DeviceArrived ;
  DevChanged.OnDeviceRemoveCompleted := self.DeviceRemoveComplete ;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  DevChanged.Free ;
end;

procedure TForm3.GetPenList ( FPenList : TStrings ) ;
var
  DiskDrive  : TWin32_DiskDrive;
  i      : Integer;
  Serial : string ;
begin
  DiskDrive:=TWin32_DiskDrive.Create;
  FPenList.BeginUpdate ;
  FPenList.Clear ;

  try
    for i := 0 to DiskDrive.GetCollectionCount-1 do
    begin
     DiskDrive.SetCollectionIndex(i);

     if DiskDrive.InterfaceType <> 'USB' then
        continue ;

     Serial := DiskDrive.PNPDeviceID ;
     Serial := Copy ( Serial, Pos ( '\', Serial ) + 1, Length ( Serial ) ) ;
     Serial := Copy ( Serial, Pos ( '\', Serial ) + 1, Length ( Serial ) ) ;
     Serial := Copy ( Serial, 1, Pos ( '&', Serial ) - 1 ) ;

     FPenList.Add (  GuidSuppl.GuidToStr36( Tc.RTL.md5.MD5StringToGUID( Serial ) ) ) ;
    end ;
  finally
     DiskDrive.Free;
     FPenList.EndUpdate ;
  end;
end;


function TForm3.GetVolInfo( ADriveLetter : Char  ): TVolumeInfo ;
begin
  with Result do
    GetVolumeInformation(pchar( ADriveLetter + ':\'), VolName, Max_Path, @VolSerial, FileMaxLen,
    FileFlags, FileSysName, Max_Path) ;
  Result.DiskSize := DiskSize( Ord ( ADriveLetter ) - 64) ;
  Result.DiskFree := DiskFree( Ord ( ADriveLetter ) - 64) ;
end;



end.
