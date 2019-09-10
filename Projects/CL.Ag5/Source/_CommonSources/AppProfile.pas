unit AppProfile;

interface

uses
  AppProfileIntf ;

type
  IAppProfile = AppProfileIntf.IAppProfile ;

function AppProfileFactory : IAppProfile ;

implementation

uses
     System.SysUtils
   , System.IniFiles  ;

type
  TAppProfile = class ( TInterfacedObject, IAppProfile )
  private
    class var AppProfileInstance : IAppProfile ;
  private
    FProfile : TIniFile ;
    property AppProfile : TIniFile read FProfile implements IAppProfile ;
  public
    constructor Create ;
    class function New() : IAppProfile ;
  end;

function AppProfileFactory : IAppProfile ;
begin
   Result := TAppProfile.New() ;
end;

{ TAppProfile }

function FileDomainExists(AFileName: string ; AExts : Array of string ): string ;

  function IterateCheckExists : boolean ;
  begin
    AFileName := ChangeFileExt  ( AFileName, '' ) ;
    for var x := Low ( AExts ) to High ( AExts ) do
      begin
        Result := FileExists ( AFileName + AExts[ x ] ) ;
        if Result then
          begin
            FileDomainExists := AFileName  + AExts[ x ] ;
            exit ;
          end ;
      end;
    Result := ExtractFileExt ( AFileName ) = '' ;
  end ;

begin
  Repeat
  Until ( IterateCheckExists ) ;
end;

constructor TAppProfile.Create;
var
  LProfileName : string ;
begin
  LProfileName := FileDomainExists( ParamStr ( 0 ), ['.ini', '.cfg']  ) ;
  FProfile     := TIniFile.Create ( LProfileName ) ;
end;

class function TAppProfile.New: IAppProfile;
begin
   if not Assigned ( AppProfileInstance ) then
     AppProfileInstance := Create ;
   Result := AppProfileInstance ;
end;

end.
