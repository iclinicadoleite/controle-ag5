
{********************************************************}
{                                                        }
{                    XML Data Binding                    }
{                                                        }
{         Generated on: 22/05/2013 16:24:37              }
{       Generated from: T:\XML_Example_Pendrive_v3.xml   }
{                                                        }
{********************************************************}

unit CLAg5.XML_AcessoIntf;

interface

uses XMLIntf;

type

{ Forward Decls }

  IXMLAcessoType = interface;
  IXMLFazendaType = interface;
  IXMLModuloType = interface;

{ IXMLAcessoType }

  IXMLAcessoType = interface(IXMLNodeCollection)
    ['{6FC3C4BF-A6B8-4192-801A-01A99C9A9307}']
    { Property Accessors }
    function Get_Codigo: WideString;
    function Get_Serial: WideString ;
    function Get_Ativo: WideString;
    function Get_Fazenda(Index: Integer): IXMLFazendaType;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Serial(Value: WideString);
    procedure Set_Ativo(Value: WideString);
    { Methods & Properties }
    function Add: IXMLFazendaType;
    function Insert(const Index: Integer): IXMLFazendaType;
    property Codigo: WideString read Get_Codigo write Set_Codigo;
    property Serial: WideString read Get_Serial write Set_Serial;
    property Ativo: WideString read Get_Ativo write Set_Ativo;
    property Fazenda[Index: Integer]: IXMLFazendaType read Get_Fazenda; default;
  end;

{ IXMLFazendaType }

  IXMLFazendaType = interface(IXMLNodeCollection)
    ['{B971E30A-FEE6-49B6-9954-03119007D8B6}']
    { Property Accessors }
    function Get_Codigo: WideString;
    function Get_Nome: WideString;
    function Get_Validade: WideString;
    function Get_Ativo: WideString;
    function Get_Modulo(Index: Integer): IXMLModuloType;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_Validade(Value: WideString);
    procedure Set_Ativo(Value: WideString);
    { Methods & Properties }
    function Add: IXMLModuloType;
    function Insert(const Index: Integer): IXMLModuloType;
    property Codigo: WideString read Get_Codigo write Set_Codigo;
    property Nome: WideString read Get_Nome write Set_Nome;
    property Validade: WideString read Get_Validade write Set_Validade;
    property Ativo: WideString read Get_Ativo write Set_Ativo;
    property Modulo[Index: Integer]: IXMLModuloType read Get_Modulo; default;
  end;

{ IXMLModuloType }

  IXMLModuloType = interface(IXMLNode)
    ['{3E26A20E-13C2-4BA2-82F0-53105C134747}']
    { Property Accessors }
    function Get_Nome: WideString;
    function Get_Acesso: WideString;
    function Get_Master: WideString;
    procedure Set_Nome(Value: WideString);
    procedure Set_Acesso(Value: WideString);
    procedure Set_Master(Value: WideString);
    { Methods & Properties }
    property Nome: WideString read Get_Nome write Set_Nome;
    property Acesso: WideString read Get_Acesso write Set_Acesso;
    property Master: WideString read Get_Master write Set_Master;
  end;

implementation

end.