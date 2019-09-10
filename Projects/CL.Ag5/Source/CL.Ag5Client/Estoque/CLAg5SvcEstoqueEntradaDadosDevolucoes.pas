unit CLAg5SvcEstoqueEntradaDadosDevolucoes;

interface

type

    ISvcEstoqueEntradaDadosDevolucoes = interface
    ['{FCE1393B-6164-40AC-BC75-46D1BF9593BB}']
      function Execute(AKDEV_PEDIDO : string): string ;
    end;

var
    SvcEstoqueEntradaDadosDevolucoes : ISvcEstoqueEntradaDadosDevolucoes ;

implementation


end.

