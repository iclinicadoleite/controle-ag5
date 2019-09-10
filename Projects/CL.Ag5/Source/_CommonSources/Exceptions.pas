unit Exceptions ;

interface

uses Tc.RTL.Exceptions ;

type


  Error       = Tc.RTL.Exceptions.Error ;
  Fail        = Tc.RTL.Exceptions.Fail ;
  Information = Tc.RTL.Exceptions.Information  ;
  Warning     = Tc.RTL.Exceptions.Warning  ;

  TranslatedError       = class ( Tc.RTL.Exceptions.Error ) ;
  TranslatedInformation = class ( Tc.RTL.Exceptions.Information ) ;
  TranslatedWarning     = class ( Tc.RTL.Exceptions.Warning ) ;

  LocalEDBClient        = class ( Tc.RTL.Exceptions.TranslatedWarning ) ;

var
   RaiseException    : TRaiseException ;
   RaiseExceptionFmt : TRaiseExceptionFmt ;

implementation


initialization
   RaiseException    := Tc.RTL.Exceptions.RaiseException ;
   RaiseExceptionFmt :=  Tc.RTL.Exceptions.RaiseExceptionFmt ;
end.