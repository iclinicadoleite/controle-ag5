unit UBackupDocumentsClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, USYS_BackupDatamodule, USendDataDatamodule, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, DateUtils,
  Shellapi, filectrl, ClAg5.DatabaseIntf, Vcl.AppEvnts, IniFiles, Data.DB, Tc.Data.DB.Helpers,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, CLAg5Types, Tc.DBRTL.AbstractDB, UDBSession, USYS_ConfigBackupDataModule,
  shlobj;

type
  TBackupDocuments = class (TComponent)
    private
      FPathBackup: String;
      FNumberOfDaysToBackup : Integer;
      FDateLastBackup : TDateTime;
      FFormatDateDefault : TFormatSettings;
      BackupDatamodule: TSYS_BackupDatamodule ;
      FLog_List: TStringList;
      FLog: TLog;
      function GetPathDocuments: String;
      procedure SetPathBackup(AValue: String);
      function  GetPathBackup: String;
      procedure LoadDateLastBackup;
      procedure SaveDateLastBackup(ACurrentDateTime: TDateTime);
      procedure LoadDateFormatParams;
      procedure DoLog(ALog: String);
      procedure ShowCompressStatus( const Value, MaxValue: Int64 ) ;
      function  DateToStringFolderName(ADate: TDateTime): String;
      function  StringFolderNameToDate(AString: String):TDateTime;
      Procedure DeleteFolder(hHandle: THandle; Const sPath : String; Confirm: boolean);
      procedure DeleteOldFolder(ACurrentDateTime: TDateTime);
      procedure SetLog(const Value: TLog);
      procedure SaveLog(AProfileName: String);
      procedure SetNumberOfDaysToBackup(const Value: Integer);
    public
      property Log : TLog  read FLog write SetLog;
      property PathBackup: String read GetPathBackup write SetPathBackup;
      property NumberOfDaysToBackup: Integer Read FNumberOfDaysToBackup write SetNumberOfDaysToBackup;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy;
      procedure Execute(AProfile: String; ForceExecute: Boolean = False);
  end;

implementation

{ TBackupDocuments }

constructor TBackupDocuments.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BackupDatamodule := TSYS_BackupDatamodule.Create ( self ) ;
  FLog_List := TStringList.Create;
  FLog_List.Add('Log de backup - Documents');
  LoadDateFormatParams;
end;

function TBackupDocuments.DateToStringFolderName(ADate: TDateTime): String;
var
  LDay, LMonth, LYear, LHour, LMinute: String;

  procedure CheckStringZero(var AString: String; ALengthString: Integer = 2);
  begin
    if ALengthString = 2 then
     begin
      if Length(AString) < ALengthString then
        AString:= '0'+AString
     end
    else
     begin
       if Length(AString) < ALengthString then
        AString:= '20'+AString
     end;

  end;
begin
  Result   := '';
  LDay     := IntToStr( DayOf   ( ADate ) );
  LMonth   := IntToStr( MonthOf ( ADate ) );
  LYear    := IntToStr( YearOf  ( ADate ) );
  LHour    := IntToStr( HourOf  ( ADate ) );
  LMinute  := IntToStr( MinuteOf( ADate ) );

  CheckStringZero( LDay    );
  CheckStringZero( LMonth  );
  CheckStringZero( LYear, 4);
  CheckStringZero( LHour   );
  CheckStringZero( LMinute );

  Result:= LYear+'-'+LMonth+'-'+Lday+'_'+LHour+'-'+LMinute;

end;

procedure TBackupDocuments.DeleteFolder(hHandle: THandle; const sPath: String;
  Confirm: boolean);
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: Array[0..128] of Char;
begin
  Log(Format('Apagando diretório: %s',[sPath]));
  fillChar( OpStruc, Sizeof(OpStruc), 0 );
  FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
  FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
  StrPCopy( FromBuffer, sPath);
  With OpStruc Do
   Begin
     Wnd:= hHandle;
     wFunc:=FO_DELETE;
     pFrom:= @FromBuffer;
     pTo:= @ToBuffer;
     if not confirm then
      begin
        //Não exibir progresso da exclusão e não perguntar se deseja excluir
        fFlags := FOF_NO_UI;
      end;
     fAnyOperationsAborted:=False;
     hNameMappings:=nil;
   End;
  ShFileOperation(OpStruc);

end;

procedure TBackupDocuments.DeleteOldFolder(ACurrentDateTime: TDateTime);
var
  SR: TSearchRec;
  I: Integer;
  LIntervalo: Double;
begin
  I := FindFirst(FPathBackup+'\*.*', faDirectory, SR);
  while I = 0 do
   begin
     if (DirectoryExists(FPathBackup+'\'+SR.Name)) and
        (SR.Name <> 'BackupControleMDA') and
        (SR.Name <> '.' ) and
        (SR.Name <> '..') then
      begin

        LIntervalo:= ((ACurrentDateTime - StringFolderNameToDate(SR.Name)) );
        if (LIntervalo > (FNumberOfDaysToBackup*2) ) and (StringFolderNameToDate(SR.Name) > 0) then
         begin
          DeleteFolder( {Self.Handle}0, FPathBackup+'\'+SR.Name , False );
          DoLog(Format('Excluindo Diretório: %s',[FPathBackup+'\'+SR.Name]));
         end;
      end;
     I := FindNext(SR);
   end;
end;

destructor TBackupDocuments.Destroy;
begin
  FreeAndNil(BackupDatamodule);
  FreeAndNil(FLog_List);
end;

procedure TBackupDocuments.Execute(AProfile: String; ForceExecute: Boolean = False);
var
  LIntervalo: Double;
  BackupModule : TBackupModuleTypes ;
  LCurrentDateTime: TDateTime;
  LPathBackup: String;
begin
  // SetPathBackup;
  if PathBackup = '' then
   exit;
  try
    try
      LCurrentDateTime := (Date+Time);
      LoadDateLastBackup;
      LIntervalo := (LCurrentDateTime - FDateLastBackup);

      {Se o intervalo for menor que 12 horas então sai da rotina}
      if ( LIntervalo < FNumberOfDaysToBackup ) and ( not ForceExecute ) then
        exit;

      BackupDatamodule.CustomProfile := AProfile;
      if not BackupDatamodule.SQLDB_DOMAINS.Connected then
         BackupDatamodule.SQLDB_DOMAINS.Connected := True;
      BackupDatamodule.Log := DoLog ;
      BackupDatamodule.CompressStatus := ShowCompressStatus ;
      BackupDatamodule.OpenFazendas ;
      BackupDatamodule.AllFarms := True;
      BackupModule := [bmZootecnico, bmFinanceiro];
      LPathBackup  := FPathBackup + '\' + DateToStringFolderName(LCurrentDateTime);
      DoLog(Format('Diretório: %s',[LPathBackup]));
      BackupDatamodule.ExecuteBackup ( LPathBackup, BackupModule ) ;

      DeleteOldFolder(LCurrentDateTime);
      SaveDateLastBackup(LCurrentDateTime);
      DoLog('Backup Finalizado com susceso');
      SaveLog(AProfile);
    except
     on E:Exception do
      begin
        DoLog('Erro ao gerar backup.');
        DoLog(E.Message);
        SaveLog(AProfile);
      end;
    end;
  finally
    BackupDatamodule.SQLDB_DOMAINS.Close;
  end;


end;

function TBackupDocuments.GetPathBackup: String;
begin
  {
   No arquivo CL.ini da pasta de instação do controle MDA,
   deverão ter os seguintes parâmetros:
   ------------
   AutoBackupFolder=C:\caminho....
   AutoBackupNumberOfDays=1
   ------------
   sendo que :
    - se o parâmetro AutoBackupFolder estiver vazio, então assume "Meus Documentos" como pasta de backup.
    - se o parâmetro AutoBackupNumberOfDays (número de dias para executar um novo backup)
      não estiver informado, então assume 7 dias (backup semanal).
  }
  if FPathBackup = '' then
    FPathBackup     := GetPathDocuments + 'BackupControleMDA';

  ForceDirectories( FPathBackup );

  Result := FPathBackup;
end;

function TBackupDocuments.GetPathDocuments: String;
var
   r:    Bool;
   path: array[0..Max_Path] of Char;
begin
    r := ShGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
    if not r then
     begin
       Log('Não foi possível encnotrar a localização da Pasta "Meus Documentos".') ;
       Result:= '';
       Exit;
     end;

    Result := Path;

    if Copy(Result, Length( Result ) -1, Length( Result ) ) <> '\' then
       Result := Result + '\';

end;

procedure TBackupDocuments.LoadDateFormatParams;
begin
  FFormatDateDefault.ShortDateFormat:='dd/mm/yyyy';
  FFormatDateDefault.DateSeparator  :='/';
  FFormatDateDefault.LongTimeFormat :='hh:nn:ss';
  FFormatDateDefault.TimeSeparator  :=':';
end;

procedure TBackupDocuments.LoadDateLastBackup;
var
  LPathIniFile: String;
  IniFile : TIniFile ;
begin

  LPathIniFile := FPathBackup+'\BackupInfo.ini';
  IniFile := TIniFile.Create ( LPathIniFile ) ;

  FDateLastBackup := StrToDateTime( IniFile.ReadString ( 'Info' ,  'DateLastBackup',      '31/12/1999' ), FFormatDateDefault ) ;

  IniFile.free ;
end;

procedure TBackupDocuments.DoLog(ALog: String);
begin
  if Assigned(FLog) then
    FLog(ALog);
  FLog_List.Add(ALog);
end;

procedure TBackupDocuments.SaveDateLastBackup(ACurrentDateTime: TDateTime);
var
  IniFile : TIniFile ;
  LPathIniFile: String;
  LDateToday: String;
begin

  LPathIniFile := FPathBackup+'\BackupInfo.ini';
  IniFile := TIniFile.Create ( LPathIniFile ) ;
  LDateToday := DateTimeToStr( ACurrentDateTime, FFormatDateDefault );

  IniFile.WriteString ( 'Info'   , 'DateLastBackup'     , LDateToday );

  IniFile.free ;
end;

procedure TBackupDocuments.SaveLog(AProfileName: String);
begin
  try
    FLog_List.SaveToFile(FPathBackup+'\Log_Backup_'+AProfileName+'.txt');
  except

  end;
end;

procedure TBackupDocuments.SetLog(const Value: TLog);
begin
 FLog := Value;
end;

procedure TBackupDocuments.SetNumberOfDaysToBackup(const Value: Integer);
begin
  FNumberOfDaysToBackup := Value;
end;

procedure TBackupDocuments.SetPathBackup(AValue: String);
begin
  FPathBackup := AValue;
  if FPathBackup <> '' then
   begin
     if Copy(FPathBackup, Length( FPathBackup ) -1, Length( FPathBackup ) ) <> '\' then
       FPathBackup := FPathBackup + '\';
     FPathBackup := FPathBackup + 'BackupControleMDA';
   end;
end;

procedure TBackupDocuments.ShowCompressStatus(const Value, MaxValue: Int64);
begin
 //***
end;

function TBackupDocuments.StringFolderNameToDate(AString: String): TDateTime;
var
  LDay, LMonth, LYear, LHour, LMinute: String;
begin
  LYear   := Copy( AString,  1,  4);
  LMonth  := Copy( AString,  6,  2);
  LDay    := Copy( AString,  9,  2);
  LHour   := Copy( AString, 12,  2);
  LMinute := Copy( AString, 15,  2);

  try
    Result := EncodeDateTime(StrToInt(LYear), StrToInt(LMonth), StrToInt(LDay),
                             StrToInt(LHour), StrToInt(LMinute),0,0);
  except
    Result := 0;
  end;
end;

end.
