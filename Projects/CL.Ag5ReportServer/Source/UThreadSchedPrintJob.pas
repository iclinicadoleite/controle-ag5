unit UThreadSchedPrintJob;

interface

uses
  Classes;

type
  TDOWToPrint = string [ 7 ] ;

  TLogger = procedure ( ALog : string ) of object ;

  ThreadSchedPrintJob = class(TThread)
  private
    FJobDate : TDateTime ;
    FJobStartDate : TDateTime ;
    FDOWToPrint: TDOWToPrint;
    FTimeStr: string;
    FJob: TThreadMethod;
    FLogger: TLogger;
    FLogMessage: string;
    FSuspended: boolean;
    { Private declarations }
    procedure CheckJobDate ;
    procedure DoJob ;
    procedure DoLog ;
    procedure SetDOWToPrint(const Value: TDOWToPrint);
    procedure SetInitialDate(const Value: TDateTime);
    procedure SetTimeStr(const Value: string);
    procedure SetJob(const Value: TThreadMethod);
    procedure SetLogger(const Value: TLogger);
    procedure SetLogMessage(const Value: string);
    procedure SetJobStartDate(const Value: TDateTime );
    procedure SetSuspended(const Value: boolean);
  protected
    procedure Execute; override;
    property  LogMessage : string  read FLogMessage write SetLogMessage;
  public
    property DOWToPrint   : TDOWToPrint  read FDOWToPrint write SetDOWToPrint;
    property JobStartDate : TDateTime    read FJobStartDate write SetJobStartDate ;
    property TimeStr      : string       read FTimeStr write SetTimeStr;
    property Job : TThreadMethod  read FJob write SetJob;
    property Logger : TLogger   read FLogger write SetLogger;
    property Suspended : boolean  read FSuspended write SetSuspended;
  end;

implementation

uses WinApi.Windows, System.SysUtils, DateUtils ;

procedure ThreadSchedPrintJob.CheckJobDate ;
var
  DOWToday, I : integer ;
  Hour, Minutes : word ;
begin

  FJobDate := 0 ;

  if DOWToPrint = StringOfChar ( 'F', Length( DOWToPrint ) )  then
    begin
      LogMessage := 'job not sched' ;
      Exit ;
    end;

  Hour    := StrToInt ( Copy( FTimeStr, 1,2 ) ) ;
  Minutes := StrToInt ( Copy( FTimeStr, 4,2 ) ) ;

  if FJobStartDate < Date then
    FJobStartDate := Date ;

  FJobDate    := FJobStartDate + EncodeTime ( Hour, Minutes, 59,999 ) ;

  if FJobDate < Now then
    FJobDate := FJobDate + 1 ;

  while not ( (DOWToPrint[DayOfTheWeek( FJobDate )]= 'T' )
          or ( SysUtils.Now > FJobDate ) ) do FJobDate := FJobDate + 1 ;

   FJobDate := Trunc ( FJobDate ) + EncodeTime ( Hour, Minutes, 0, 0 ) ;
   FJobStartDate := FJobDate + 1 ;

  LogMessage := 'job next execution : ' + FormatDateTime ( 'yyyy.mm.dd hh:nn ddd', FJobDate ) ;

end;

{ ThreadSchedPrintJob }

procedure ThreadSchedPrintJob.DoJob;
begin
  if Assigned ( FJob ) then
    try
      LogMessage  := 'Job started'  ;
      Synchronize ( FJob ) ;
      LogMessage  := 'Job finished'  ;
    except
      LogMessage  := 'Job error'  ;
    end
  else
    LogMessage  := 'Job not assigned'  ;
end;

procedure ThreadSchedPrintJob.DoLog;
begin
   if Assigned ( FLogger )  then
      try
        FLogger ( FLogMessage ) ;
      except
      end;
end;

procedure ThreadSchedPrintJob.Execute;
begin
  LogMessage := 'monitor started' ;
  CheckJobDate ;

  while ( FJobDate > 0 ) and ( not Terminated ) do
    begin
      sleep ( 100 ) ;
      if Now > FJobDate  then
        begin
          DoJob ;
          CheckJobDate ;
        end;
    end;

    LogMessage := 'monitor finished' ;
end;


procedure ThreadSchedPrintJob.SetDOWToPrint(const Value: TDOWToPrint);
begin
  FDOWToPrint := Value;
end;


procedure ThreadSchedPrintJob.SetInitialDate(const Value: TDateTime);
begin
  FJobDate := Value
end;

procedure ThreadSchedPrintJob.SetJob(const Value: TThreadMethod);
begin
  FJob := Value;
end;

procedure ThreadSchedPrintJob.SetJobStartDate(const Value: TDateTime );
begin
  FJobStartDate := Trunc ( Value ) ;
end;

procedure ThreadSchedPrintJob.SetLogger(const Value: TLogger);
begin
  FLogger := Value;
end;

procedure ThreadSchedPrintJob.SetLogMessage(const Value: string);
begin
  FLogMessage := Value;
  Synchronize ( DoLog ) ;
end;

procedure ThreadSchedPrintJob.SetSuspended(const Value: boolean);
begin
  if ( not Value ) then
     CheckJobDate ;
  inherited Suspended := Value;
end;

procedure ThreadSchedPrintJob.SetTimeStr(const Value: string);
begin
  FTimeStr := Value;
end;

end.
