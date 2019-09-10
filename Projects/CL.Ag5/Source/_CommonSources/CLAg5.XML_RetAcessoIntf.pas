
{************************************************************}
{                                                            }
{                      XML Data Binding                      }
{                                                            }
{         Generated on: 23/05/2013 15:08:15                  }
{       Generated from: T:\XML_Example_Pendrive_v3_ret.xml   }
{                                                            }
{************************************************************}

unit CLAg5.XML_RetAcessoIntf;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLRetAcessoType = interface;
  IXMLFazendaType = interface;

{ IXMLRetAcessoType }

  IXMLRetAcessoType = interface(IXMLNodeCollection)
    ['{C60DA0D8-0791-4376-B3F6-5C94E96C58E3}']
    { Property Accessors }
    function Get_Codigo: WideString;
    function Get_Fazenda(Index: Integer): IXMLFazendaType;
    procedure Set_Codigo(Value: WideString);
    { Methods & Properties }
    function Add: IXMLFazendaType;
    function Insert(const Index: Integer): IXMLFazendaType;
    property Codigo: WideString read Get_Codigo write Set_Codigo;
    property Fazenda[Index: Integer]: IXMLFazendaType read Get_Fazenda; default;
  end;

{ IXMLFazendaType }

  IXMLFazendaType = interface(IXMLNode)
    ['{14DE0CAE-823A-40EB-9CED-44007A7BDC71}']
    { Property Accessors }
    function Get_Codigo: WideString;
    function Get_Serial: WideString;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Serial(Value: WideString);
    { Methods & Properties }
    property Codigo: WideString read Get_Codigo write Set_Codigo;
    property Serial: WideString read Get_Serial write Set_Serial;
  end;

implementation

end.