unit CLAg5SvcEntidadesCadastroClientes;

interface

uses
  NewFastRegisterIntf ;

type

    PClienteInfo = ^TClienteInfo ;
    TClienteInfo = record
      KCAD_CLIENTE: String;
      CPF_CNPJ: String;
      Razao: String;
      Fantasia: String;
      IE: String;
      IEST: String;
      IM: String;
      CNAE: String;
      Logradouro: String;
      Numero: String;
      Complemento: String;
      Bairro: String;
      CodigoMunicipio: integer;
      NomeMunicipio: String;
      UF: String;
      CEP: String;
      CodigoPais: Integer;
      NomePais: String;
      Fone: String;
    end;

    ISvcCadastroClientes = interface
    ['{9DD3A933-F38A-4015-9F57-9026AC49B6CE}']
      procedure NovoCliente ( var AClienteInfo : TClienteInfo ) ;
    end;

var
    SvcCadastroClientes : ISvcCadastroClientes ;
    SvcClienteNewFastRegister : INewFastRegister ;

implementation

end.
