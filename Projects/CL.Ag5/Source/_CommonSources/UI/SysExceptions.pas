unit SysExceptions ;

interface

uses Tc.RTL.Exceptions ;

type


  Error       = class ( Tc.RTL.Exceptions.Error ) ;
  Information = class ( Tc.RTL.Exceptions.Error ) ;
  Warning     = class ( Tc.RTL.Exceptions.Error ) ;

  TranslatedError       = class ( Tc.RTL.Exceptions.Error ) ;
  TranslatedInformation = class ( Tc.RTL.Exceptions.Information ) ;
  TranslatedWarning     = class ( Tc.RTL.Exceptions.Warning ) ;

  LocalEDBClient        = class ( Tc.RTL.Exceptions.TranslatedWarning ) ;


implementation

end.