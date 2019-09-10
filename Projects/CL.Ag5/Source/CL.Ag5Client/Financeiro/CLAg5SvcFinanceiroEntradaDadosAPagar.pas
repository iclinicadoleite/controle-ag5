unit CLAg5SvcFinanceiroEntradaDadosAPagar;

interface

type

    ISvcFinanceiroEntradaDadosAPagar = interface
    ['{83CB8B24-FC81-4AB1-8A63-639631B89C1A}']
      function Execute( KFIN_APAGAR : string ) : string ;
    end;

var
    SvcFinanceiroEntradaDadosAPagar : ISvcFinanceiroEntradaDadosAPagar ;

implementation

end.
