unit CLAg5SvcEntidadesCadastroTipos;

interface

const
  _GRUPO_CLIENTE  = 1;

type

    ISvcCadastroTipos = interface
    ['{FECDD619-A2D9-4374-8C59-E84CD8979630}']
      procedure NovoTipo ( AGroup : integer ) ;
    end;

var
    SvcCadastroTipos : ISvcCadastroTipos ;

implementation

end.
