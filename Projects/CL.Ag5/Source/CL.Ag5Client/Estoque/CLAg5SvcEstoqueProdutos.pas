unit CLAg5SvcEstoqueProdutos;

interface

uses
  NewFastRegisterIntf ;

type

    TTiposProduto = ( tpProduto, tpInsumo, tpServico ) ;

    PProdutoInfo = ^TProdutoInfo ;

    TProdutoInfo = record
      KEST_PRODUTO : string ;
      TipoProduto : TTiposProduto ;
      Codigo: string ;
      CodigoFornecedor: string ;
      EAN: string ;
      Nome: string ;
      NCM: string ;
      ExTIPI: string ;
      Genero: integer ;
      Unidade : string ;
      DataEstoque : TDateTime ;
      BAIXA_ESTOQUE : string ;
      KFIN_PLANOCONTA : string ;
      PLANOCONTA      : string ;
      CODIGOPLANO     : string ;
      CLASSIFICACAO   : string ;
      TIPO_APRD       : string ;
    end ;

    ISvcEstoqueProdutosCadastro = interface
    ['{04114A8A-98BA-4F73-9189-C0D7C88B7BD1}']
      procedure NovoCadastro( var AProdutoInfo : TProdutoInfo ) ;
    end;

var
    SvcEstoqueProdutosCadastro : ISvcEstoqueProdutosCadastro ;
    SvcProdutoInsumoServicoNewFastRegister : INewFastRegister ;

implementation

end.
