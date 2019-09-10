unit AppProfileIntf;

interface

uses
   System.Classes ;

type

  IAppProfile = interface
//    constructor Create(const FileName: string);
    function SectionExists(const Section: string): Boolean;
    function ReadString(const Section, Ident, Default: string): string;
    procedure WriteString(const Section, Ident, Value: String);
    function ReadInteger(const Section, Ident: string; Default: Integer): Integer;
    procedure WriteInteger(const Section, Ident: string; Value: Integer);
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean;
    procedure WriteBool(const Section, Ident: string; Value: Boolean);
    function ReadBinaryStream(const Section, Name: string; Value: TStream): Integer;
    function ReadDate(const Section, Name: string; Default: TDateTime): TDateTime;
    function ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime;
    function ReadFloat(const Section, Name: string; Default: Double): Double;
    function ReadTime(const Section, Name: string; Default: TDateTime): TDateTime;
    procedure WriteBinaryStream(const Section, Name: string; Value: TStream);
    procedure WriteDate(const Section, Name: string; Value: TDateTime);
    procedure WriteDateTime(const Section, Name: string; Value: TDateTime);
    procedure WriteFloat(const Section, Name: string; Value: Double);
    procedure WriteTime(const Section, Name: string; Value: TDateTime);
    procedure ReadSection(const Section: string; Strings: TStrings);
    procedure ReadSections(Strings: TStrings); overload;
    procedure ReadSections(const Section: string; Strings: TStrings); overload;
    procedure ReadSubSections(const Section: string; Strings: TStrings; Recurse: Boolean = False);
    procedure ReadSectionValues(const Section: string; Strings: TStrings);
    procedure EraseSection(const Section: string);
    procedure DeleteKey(const Section, Ident: String);
    procedure UpdateFile;
    function ValueExists(const Section, Ident: string): Boolean;
//    property FileName: string read FFileName;
  end;

implementation

end.
