unit CLAg5SvcEntidadesCadastroFuncionarios;

interface

uses
  NewFastRegisterIntf ;

(*
type
    PFuncionarioInfo = ^TFuncionarioInfo ;
    TFuncionarioInfo = record
      KCAD_Funcionario: String;
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
*)
//    ISvcCadastroFuncionarios = interface
//    ['{9DD3A933-F38A-4015-9F57-9026AC49B6CE}']
//      procedure NovoFuncionario ( var AFuncionarioInfo : TFuncionarioInfo ) ;
//    end;

var
//    SvcCadastroFuncionarios : ISvcCadastroFuncionarios ;
    SvcFuncionarioNewFastRegister : INewFastRegister ;

implementation

end.
