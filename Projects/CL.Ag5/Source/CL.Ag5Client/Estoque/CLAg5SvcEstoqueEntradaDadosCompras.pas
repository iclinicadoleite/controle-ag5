unit CLAg5SvcEstoqueEntradaDadosCompras;

interface

type

    ISvcEstoqueEntradaDadosCompras = interface
    ['{0759379E-8A9B-42F8-8853-551262DB2BE9}']
      function Execute(AKCMP_PEDIDO : string; AValidApropriacao: Boolean = True): string ;
    end;

var
    SvcEstoqueEntradaDadosCompras : ISvcEstoqueEntradaDadosCompras ;

implementation


end.
