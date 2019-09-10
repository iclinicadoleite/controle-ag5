unit UReportServerConfig;

interface

uses System.Classes, IniFiles ;

type

 TReportCfg = record
  Active      : boolean ;
  FarmCode    : string  ;
  PrinterName : string  ;
  Time        : String  ;
  DOW         : string[ 7 ] ;
  NextDays    : smallInt ;
  Order       : smallInt ;
  PageBreak   : boolean ;
  Preview     : boolean ;
//  ConfigFileName : string ;
 end;

procedure LoadReportCfg ( var AReportCfg : TReportCfg ) ;
procedure SaveReportCfg ( var AReportCfg : TReportCfg ) ;

implementation

uses SysUtils, AppProfile ;

procedure LoadReportCfg ( var AReportCfg : TReportCfg ) ;
var
  LProfile : IAppProfile ;
begin
  LProfile := AppProfileFactory ;

  with AReportCfg do
    begin
      Active       := LProfile.ReadBool    ( 'Report', 'Active',      True ) ;
      FarmCode     := LProfile.ReadString  ( 'Report', 'FarmCode',    '000000' ) ;
      PrinterName  := LProfile.ReadString  ( 'Report', 'PrinterName', '' ) ;
      Time         := LProfile.ReadString  ( 'Report', 'Time',        '06:00' ) ;
      DOW          := LProfile.ReadString  ( 'Report', 'DOW',         'TFFFFFF' ) ;
      NextDays     := LProfile.ReadInteger ( 'Report', 'NextDays',    7 ) ;
      Order        := LProfile.ReadInteger ( 'Report', 'Order',       0 ) ;
      PAgeBreak    := LProfile.ReadBool    ( 'Report', 'PageBreak',   True ) ;
      Preview      := LProfile.ReadBool    ( 'Report', 'Preview',     False ) ;
      //ConfigFileName := CfgFileName ;
    end;
end ;


procedure SaveReportCfg ( var AReportCfg : TReportCfg ) ;
var
  LProfile : IAppProfile ;
begin

  LProfile := AppProfileFactory ;

  with AReportCfg do
    begin
      LProfile.WriteBool    ( 'Report', 'Active',      Active     ) ;
      LProfile.WriteString  ( 'Report', 'FarmCode',    FarmCode   ) ;
      LProfile.WriteString  ( 'Report', 'PrinterName', PrinterName ) ;
      LProfile.WriteString  ( 'Report', 'Time',        Time       ) ;
      LProfile.WriteString  ( 'Report', 'DOW',         DOW        ) ;
      LProfile.WriteInteger ( 'Report', 'NextDays',    NextDays   ) ;
      LProfile.WriteInteger ( 'Report', 'Order',       Order      ) ;
      LProfile.WriteBool    ( 'Report', 'PageBreak',   PageBreak  ) ;
    end;
//  AReportCfg.ConfigFileName := CfgFileName ;

end ;

end.
