unit ClAg5.Common.RestoreAgenda3;

interface

uses
  ClAg5ClientCommonTypes,
  Tc.RTL.Folders,
  Dialogs ;

type

  TRestoreBackupAgenda3 = class
    type TRestoreBackupAgenda3Params = record
     //FBClientPath : string ;
     SourceBackup : string;
     TargetDB : string ;
     Log : TLogCallBack ;
     TempFolder : ITcTempFolder ;
     DontFixCharSet : boolean ;
     UserName : string ;
     Password : string ;
     end;
  private
     FParams : TRestoreBackupAgenda3Params ;
     function   GetTempFolder : string ;
     procedure  DoLog ( ALogString : string ) ;
     procedure  FilterLog(cLine: string ; var AStatusDomains : boolean ; AStatusTableName : string  );
     function   DoUnzip : string ;
     function   DoRestore : boolean ;
     procedure  InternalExecute ;
     function   InternalIsValid : boolean  ;
  public
     class procedure Restore( AParams : TRestoreBackupAgenda3Params ) ; //  Restore( AFBClientPath : string ; ASourceBackup : string; ATargetDB : string ; ALog : TLogCallBack ) : boolean ;
     class function  IsValid( AParams : TRestoreBackupAgenda3Params ) : boolean ;
  end;

implementation

uses
   WinApi.Windows, System.SysUtils, FB, FBServices,
   Tc.JVCL.Compressor,
   Masks,
   Tc.RTL.Exceptions , AppProfile;


class procedure TRestoreBackupAgenda3.Restore( AParams : TRestoreBackupAgenda3Params ); //  AFBClientPath : string ; ASourceBackup : string; ATargetDB : string ; ALog : TLogCallBack ) : boolean ;
begin
   with Create do
     try
        FParams := AParams ;
        InternalExecute ;
     finally
       free ;
     end ;
end;

procedure TRestoreBackupAgenda3.InternalExecute;
begin
   if ( SameText ( ExtractFileExt ( FParams.SourceBackup ), '.zip' )
     or SameText ( ExtractFileExt ( FParams.SourceBackup ), '.7z'  ) ) then
      DoUnzip  ;
   if ( SameText ( ExtractFileExt ( FParams.SourceBackup ), '.gbk')
     or SameText ( ExtractFileExt ( FParams.SourceBackup ), '.fbk') ) then
      DoRestore ;
end;


function TRestoreBackupAgenda3.InternalIsValid: boolean;
var
 IterateCompressedFiles : integer ;
 CompressorEngine : ICompressorEngine ;

 function FileNameMaschesMasks ( APackedName : string ; ANames : Array of String ) : boolean ;
 var
   x : integer ;
 begin
   Result := False ;
   for x := Low( ANames ) To  High ( ANames ) do
       begin
         Result := MatchesMask ( APackedName , ANames[ x ] ) ;
         if Result then
            break ;
       end;
 end ;

begin

  DoLog('Checando backup Agenda 3');

  Result := FileNameMaschesMasks ( ExtractFileName ( FParams.SourceBackup ), [ 'agenda.fdb', 'agenda*.gbk', 'agenda*.fbk' ] ) ;

  if Result then
     Exit ;

  CompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
  CompressorEngine.OpenArchive( FParams.SourceBackup ) ;

  for IterateCompressedFiles:= 0 to CompressorEngine.ItemCount - 1 do
    if FileNameMaschesMasks ( CompressorEngine[ IterateCompressedFiles].PackedName, [ 'agenda.fdb', 'agenda*.gbk', 'agenda*.fbk' ] ) then
      begin
       Result := True ;
       break ;
     end ;

end;

class function TRestoreBackupAgenda3.IsValid(
  AParams: TRestoreBackupAgenda3Params): boolean;
begin
   with Create do
     try
        FParams := AParams ;
        Result  := InternalIsValid ;
     finally
       free ;
     end ;
end;

procedure TRestoreBackupAgenda3.DoLog(ALogString: string);
begin
  if Assigned ( FParams.Log )  then
     Try
       FParams.Log ( ALogString ) ;
     except

     End;
end;


function TRestoreBackupAgenda3.DoUnzip: string;
var
 IterateCompressedFiles : integer ;
 CompressorEngine : ICompressorEngine ;
 TempFileName : string ;

 function CheckPackedName ( APackedName : string ; ANames : Array of String ) : boolean ;
 var
   x : integer ;
 begin
   Result := False ;
   for x := Low( ANames ) To  High ( ANames ) do
       begin
         Result := MatchesMask ( APackedName , ANames[ x ] ) ;
         if Result then
            break ;
       end;
 end ;

begin

  DoLog('Export Agenda [Descompactando ZIP]');

  TempFileName := '' ;

  try
    CompressorEngine := Tc.JVCL.Compressor.CompressorEngineFactory ;
    CompressorEngine.OpenArchive( FParams.SourceBackup ) ;

    for IterateCompressedFiles:= 0 to CompressorEngine.ItemCount - 1 do
      if CheckPackedName ( CompressorEngine[ IterateCompressedFiles].PackedName, [ 'agenda.fdb', 'agenda*.gbk', 'agenda*.fbk' ] ) then
        begin
         CompressorEngine[ IterateCompressedFiles].Selected := True ;
         TempFileName := CompressorEngine[ IterateCompressedFiles].PackedName ;
         break ;
       end ;

    if TempFileName = '' then
       Raise Exception.Create('Arquivo de backup inválido');

    if SameText ( ExtractFileExt ( TempFileName ), '.fdb' )  then
       CompressorEngine.TargetFolder := ExtractFilePath ( FParams.TargetDB )
    else
       CompressorEngine.TargetFolder := GetTempFolder ;

    CompressorEngine.ExtractSelected ;

    FParams.SourceBackup := CompressorEngine.TargetFolder + TempFileName ;

  except on E : Exception do
      Raise Exception.Create('Erro: ' + E.Message);
  end ;

end ;

function TRestoreBackupAgenda3.DoRestore : boolean ;
var
   r : TFBRestoreService ;
   // restore
   FStatusTableName : string ;
   FStatusDomains : boolean ;
   LDriver        : string ;
begin
  FStatusTableName := '' ;
  FStatusDomains := False ;

  Result := True ;

  try
    //LDriver := AppProfileFactory.ReadString( 'TDBXFirebird150Driver', 'VendorLib', 'FB150\fbclient.dll' ) ;
    LDriver := AppProfileFactory.ReadString( 'TDBXFirebird150Driver', 'VendorLib', 'FB\fbclient.dll' ) ;
    DoLog ( 'Restaurando :' + FParams.SourceBackup  ) ;
    DoLog ( 'para :'        + FParams.TargetDB      ) ;
    DoLog ( 'usando :'      + LDriver {FParams.FBClientPath}  ) ;

    r := TFBRestoreService.Create ( LDriver {FParams.FBClientPath} ) ;
    r.Options := r.Options + [Replace] ;

    if not FParams.DontFixCharSet then
      begin
         r.Options := r.Options + [FixFss] ;
         r.FixFssCharacterSet := 'WIN1252' ;
         DoLog ( 'Charset WIN1252' ) ;
      end;

    if FParams.UserName <> '' then
      r.ServiceParamBySPB[1{isc_spb_user_name}] := FParams.UserName ;
    if FParams.Password <> '' then
      r.ServiceParamBySPB[4{isc_spb_password}] := FParams.Password ;


    DoLog ( 'usando :'      + LDriver {FParams.FBClientPath}  ) ;

    with r do
      try
        Verbose  := True ;
        Protocol := fbpLocal ;
        BackupFile.Add   ( FParams.SourceBackup ) ;
        DatabaseName.Add ( FParams.TargetDB ) ;

        Attach ;
        ServiceStart ;
        While not(Eof) do
           FilterLog ( GetNextLine, FStatusDomains, FStatusTableName ) ;
        Detach;
      finally
         free ;
      end;
  except On E : Exception do
    begin
       DoLog ( E.Message );
       Result := False ;
    end;
  end;

end;

procedure TRestoreBackupAgenda3.FilterLog(cLine: string ; var AStatusDomains : boolean ; AStatusTableName : string  );
begin
//DoLog ( cline ) ;
// exit ;

 if ( Pos ( 'gbak:restoring domain', cLine  ) > 0 )  then
   begin
       if ( not AStatusDomains) then
          DoLog ( 'restoring domains' ) ;
       AStatusDomains:= True ;
       cLine := '' ;
   end
 else if Pos ( 'gbak:restoring table ', cLine  ) > 0 then
   begin
    if AStatusTableName = '' then
       DoLog ( 'restoring tables' ) ;
    AStatusTableName := Copy ( cLine, 22, 33 ) ;
    DoLog ( '    ' + AStatusTableName ) ;
   end
 else if (Length ( cLine ) >= 6) and ( cLine[6] <> ' ' ) then
   begin
     // if cLine[6] in ['0'..'9'] then
     //   cLine := cTableName + '=' + Copy ( cLine, 6, Length ( cLine ) ) ;
     // cLine := copy ( cLine, 1, 5 ) + cTableName + '=' + Copy ( cLine, 6, Length ( cLine ) ) ;
      cLine := Copy ( cLine, 6, Length ( cLine ) ) ;
      DoLog ( cLine );
   end;
end;

function TRestoreBackupAgenda3.GetTempFolder: string;
begin
  if not Assigned ( FParams.TempFolder )  then
     FParams.TempFolder := TcTempFolderFactory ;
  Result := FParams.TempFolder.TempPath
end;

end.
