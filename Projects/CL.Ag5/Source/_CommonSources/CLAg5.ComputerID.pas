unit CLAg5.ComputerID;

interface

uses Validates;

function ComputerID: string;
function TestComputerIDDV( ACID : string ) : boolean ;

implementation

uses ComObj, ActiveX, System.Variants, WinApi.Windows, System.SysUtils, JclSysInfo, Tc.RTL.StringUtils ;

type
  TBIOSInfo          = (Bs_BIOSVersion,Bs_BuildNumber,Bs_Description,Bs_Manufacturer,Bs_Name,Bs_SerialNumber,Bs_Version, bs_releaseDate);
  TBIOSInfoSet       = set of TBIOSInfo;


function VarArrayToStr(const vArray: variant): AnsiString;
  function _VarToStr(const V: variant): AnsiString;
  var
    Vt: integer;
  begin
    Vt := VarType(V);
    case Vt of
      varSmallint, varInteger:
        Result := AnsiString(IntToStr(integer(V)));
      varSingle, varDouble, varCurrency:
        Result := AnsiString(FloatToStr(Double(V)));
      varDate:
        Result := AnsiString(VarToStr(V));
      varOleStr:
        Result := AnsiString(WideString(V));
      varBoolean:
        Result := AnsiString(VarToStr(V));
      varVariant:
        Result := AnsiString(VarToStr(variant(V)));
      varByte:
        Result := AnsiChar(byte(V));
      varString:
        Result := AnsiString(V);
      varArray:
        Result := VarArrayToStr(variant(V));
    end;
  end;

var
  i: integer;
begin
  Result := '[';
  if (VarType(vArray) and varArray) = 0 then
    Result := _VarToStr(vArray)
  else
    for i := VarArrayLowBound(vArray, 1) to VarArrayHighBound(vArray, 1) do
      if i = VarArrayLowBound(vArray, 1) then
        Result := Result + _VarToStr(vArray[i])
      else
        Result := Result + '|' + _VarToStr(vArray[i]);
  Result := Result + ']';
end;

function VarStrNull(const V:OleVariant):AnsiString; //avoid problems with null strings
begin
  Result:='';
  if not VarIsNull(V) then
    begin
      if VarIsArray(V) then
         Result:=VarArrayToStr(V)
      else
         Result:=AnsiString(VarToStr(V));
    end;
end;

function GBD1 : TDateTime ;
begin
    Result := JclSysInfo.GetBIOSDate
end;

const
  BiosInfoArr       : array[TBIOSInfo] of AnsiString =
     ('BIOSVersion','BuildNumber','Description','Manufacturer','Name','SerialNumber','Version', 'ReleaseDate');

function GBD2 : TDateTime ;
var
  objSWbemLocator : OLEVariant;
  objWMIService   : OLEVariant;
  objWbemObjectSet: OLEVariant;
  oWmiObject      : OLEVariant;
  oEnum           : IEnumvariant;
  iValue          : LongWord ;
//  Bs              : TBIOSInfo;
  SDummy          : String; //ansistring ;
begin
  CoInitialize(nil);
  Result := EncodeDate ( 2013, 05, 01  ) ;
  try
    try
      objSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
      objWMIService   := objSWbemLocator.ConnectServer('localhost','root\cimv2', '','');
      objWbemObjectSet:= objWMIService.ExecQuery('SELECT * FROM Win32_BIOS','WQL',0);
      oEnum           := IUnknown(objWbemObjectSet._NewEnum) as IEnumVariant;
      if oEnum.Next(1, oWmiObject, iValue) = 0 then
         begin
           SDummy := oWmiObject.Properties_.Item(AnsiString ( 'ReleaseDate' ) ).Value ;
           result := EncodeDate ( StrToInt ( Copy ( SDummy, 1, 4 ) ), StrToInt ( Copy ( SDummy, 5, 2 ) ), StrToInt ( Copy ( SDummy, 7, 2 ) ) )  ;
         end ;

      oEnum           := nil ;

    finally
    //  CoUninitialize;
    end;
  except
    raise ;
  end;
end;

function IsWin8 : boolean ;
var
  OSVersionInfo: TOSVersionInfo;
begin
  Result := False ;
  OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
  if GetVersionEx(OSVersionInfo) then
    result := ( OSVersionInfo.dwMajorVersion >= 6 )
          and ( OSVersionInfo.dwMinorVersion >= 2 );
end;

function GBD : TDateTime ;
begin
   if IsWin8 then
    Result := GBD2
   else
    try
      Result := GBD1
    except
      Result := GBD2
    end;
end;

function TestComputerIDDV( ACID : string ) : boolean ;
var
  DV : string ;
begin
  DV := TValidates.Modulo11 ( Copy ( ACID, 13 + 4, MaxInt ) )
        + TValidates.Modulo11 ( Copy ( ACID, 7  + 4, 5 ) )
        + TValidates.Modulo11 ( Copy ( ACID, 1  + 4, 5 ) ) ;

  Result := DV = Copy ( ACID, 1, 3 ) ;
end;

var
  GComputerID : string = '' ;

function ComputerID: string;
var
  VolumeSerialNumber: DWORD;
  MaximumComponentLength: DWORD;
  FileSystemFlags: DWORD;
  CPUInfo: TCPUInfo;
  CPUID: integer;
  HDID: integer;
  BiosDate : TDateTime ;
  LLoWordSerial, LHiWordSerial : Word ;
begin

  if GComputerID <> '' then
     Exit ( GComputerID ) ;

  BiosDate := GBD ;

  GetVolumeInformation('C:\', nil, 0, @VolumeSerialNumber, MaximumComponentLength, FileSystemFlags, nil, 0);

  JclSysInfo.GetCPUInfo(CPUInfo);

  CPUID := StrToIntDef(Tc.RTL.StringUtils.TStringSuppl.Digits(CPUInfo.CpuName), -1);

  if CPUID <= 0 then
    CPUID := Trunc( BiosDate );

  LLoWordSerial := LoWord(VolumeSerialNumber) ;
  LHiWordSerial := HiWord(VolumeSerialNumber) ;

  if Odd(LLoWordSerial) and ( LHiWordSerial > 0 ) then
    CPUID := ABS((CPUID * LLoWordSerial ) DIV LHiWordSerial )
  else if ( LLoWordSerial > 0 ) then
    CPUID := ABS((CPUID * LHiWordSerial) DIV LLoWordSerial );

  HDID := ABS(LLoWordSerial - LHiWordSerial);

  GComputerID := Format('%.5d-%.5d-%.5d',
    [ HDID,
      Trunc(BiosDate) - (CPUInfo.Model + 1) * (CPUInfo.CpuType + 1) * (CPUInfo.Family + 1),
      CPUID]);

  GComputerID := TValidates.Modulo11 ( Copy ( GComputerID, 13, MaxInt ) )
          + TValidates.Modulo11 ( Copy ( GComputerID, 7, 5 ) )
          + TValidates.Modulo11 ( Copy ( GComputerID, 1, 5 ) )
          + '-' + GComputerID ;

  Result := GComputerID ;

end;

initialization
   GComputerID := '795-20641-72705-23926' ;

end.
