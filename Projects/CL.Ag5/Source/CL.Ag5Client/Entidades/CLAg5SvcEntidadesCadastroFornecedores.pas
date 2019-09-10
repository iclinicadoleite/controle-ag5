unit CLAg5SvcEntidadesCadastroFornecedores;

interface

uses
  NewFastRegisterIntf ;

type

    PFornecedorInfo = ^TFornecedorInfo ;

    TFornecedorInfo = record
      KCAD_FORNECEDOR: String;
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

    ISvcCadastroFornecedores = interface
    ['{216B54C0-3A38-4D6A-94A5-1EE996B7493D}']
      procedure NovoFornecedor ( var AFornecedorInfo : TFornecedorInfo ) ;
    end;

var
    SvcCadastroFornecedores : ISvcCadastroFornecedores ;
    SvcFornecedorNewFastRegister : INewFastRegister ;

implementation

end.
