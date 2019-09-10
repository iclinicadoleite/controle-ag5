unit SysReportTypes;

interface

uses System.SysUtils, DateUtils  ;

type

  TReportParams = class ;

  IReportDialog = interface
  ['{A2652241-BE75-405E-9D77-B33291E64DE2}']
    procedure GetParameters (var Parameters : TReportParams ) ;
    procedure SetParameters (var Parameters : TReportParams ) ;
    function Execute( Parameters : TReportParams ) : boolean ;
  end ;


  TTipoEmissao = ( tePreview, tePrint, tePDF ) ;
  TTipoFolha   = ( tfPapelBranco, tfPapelTimbrado, tfEstilizado ) ;

  TReportParamsClass  = class of TReportParams ;

  TReportParams = class
      TipoEmissao : TTipoEmissao ;
      AutoLaunch : boolean ;
      FileName : String ;
      ReportTitle : string ;
      Description : string ;
      StartDate : TDateTime ;
      EndDate   : TDateTime ;
      ForceHeader : boolean ;
      Legenda : string ;
  public
     constructor Create ; virtual ;
  end ;

implementation

{ TReportParams }

constructor TReportParams.Create;
begin
   inherited ;
   ReportTitle := '' ;
   StartDate := StartOfTheMonth ( System.SysUtils.Date )  ;
   EndDate   := EndOfTheMonth ( System.SysUtils.Date )  ;
end;

end.

