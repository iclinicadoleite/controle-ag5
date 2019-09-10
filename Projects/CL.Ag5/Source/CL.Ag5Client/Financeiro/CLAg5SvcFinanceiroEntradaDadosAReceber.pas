unit CLAg5SvcFinanceiroEntradaDadosAReceber;

interface

type

    ISvcFinanceiroEntradaDadosAReceber = interface
    ['{5A25AE42-9CCF-4EE2-B7E8-7D0EAA2679AF}']
      function Execute( KFIN_ARECEBER : string ) : string ;
    end;

var
    SvcFinanceiroEntradaDadosAReceber : ISvcFinanceiroEntradaDadosAReceber ;

implementation

end.
