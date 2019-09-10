unit CLAg5SvcEstoqueCadastroTipos;

interface

const
  _UNIDADE_MEDIDA = 2;
  _TIPO_PRODUTO   = 3;

type

    ISvcEstoqueCadastroTipos = interface
    ['{FECDD619-A2D9-4374-8C59-E84CD8979630}']
      procedure NovoTipo ( AGroup : integer ) ;
    end;

var
    SvcEstoqueCadastroTipos : ISvcEstoqueCadastroTipos ;

implementation

end.
