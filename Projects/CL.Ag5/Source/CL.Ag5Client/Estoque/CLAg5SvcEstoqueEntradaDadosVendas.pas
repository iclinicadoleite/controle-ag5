unit CLAg5SvcEstoqueEntradaDadosVendas;

interface

type

    ISvcEstoqueEntradaDadosVendas = interface
    ['{1AAE90E8-626F-4AE6-80D4-570F03FBBE2E}']
      function Execute(AKVND_PEDIDO : string) : string ;
    end;

var
    SvcEstoqueEntradaDadosVendas : ISvcEstoqueEntradaDadosVendas ;

implementation

end.
