cd /d "%~dp0"

del deploy.zip
rem 7z -- TargerFile SourceFolder
"%ProgramFiles%\7-Zip\7z.exe" -tzip a  deploy deploy
