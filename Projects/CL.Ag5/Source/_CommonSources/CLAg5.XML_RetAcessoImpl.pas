
{************************************************************}
{                                                            }
{                      XML Data Binding                      }
{                                                            }
{         Generated on: 23/05/2013 15:08:15                  }
{       Generated from: T:\XML_Example_Pendrive_v3_ret.xml   }
{                                                            }
{************************************************************}

unit CLAg5.XML_RetAcessoImpl;

interface

uses xmldom, XMLDoc, XMLIntf, CLAg5.XML_RetAcessoIntf ;

{ Global Functions }

function GetRetAcesso(Doc: IXMLDocument): IXMLRetAcessoType;
function LoadRetAcesso(const FileName: string): IXMLRetAcessoType;
function NewRetAcesso: IXMLRetAcessoType;

const
  TargetNamespace = '';

implementation

type

{ Forward Decls }

  TXMLRetAcessoType = class;
  TXMLFazendaType = class;

{ TXMLRetAcessoType }

  TXMLRetAcessoType = class(TXMLNodeCollection, IXMLRetAcessoType)
  protected
    { IXMLRetAcessoType }
    function Get_Codigo: WideString;
    function Get_Fazenda(Index: Integer): IXMLFazendaType;
    procedure Set_Codigo(Value: WideString);
    function Add: IXMLFazendaType;
    function Insert(const Index: Integer): IXMLFazendaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFazendaType }

  TXMLFazendaType = class(TXMLNode, IXMLFazendaType)
  protected
    { IXMLFazendaType }
    function Get_Codigo: WideString;
    function Get_Serial: WideString;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Serial(Value: WideString);
  end;


{ Global Functions }

function GetRetAcesso(Doc: IXMLDocument): IXMLRetAcessoType;
begin
  Result := Doc.GetDocBinding('RetAcesso', TXMLRetAcessoType, TargetNamespace) as IXMLRetAcessoType;
end;

function LoadRetAcesso(const FileName: string): IXMLRetAcessoType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('RetAcesso', TXMLRetAcessoType, TargetNamespace) as IXMLRetAcessoType;
end;

function NewRetAcesso: IXMLRetAcessoType;
begin
  Result := NewXMLDocument.GetDocBinding('RetAcesso', TXMLRetAcessoType, TargetNamespace) as IXMLRetAcessoType;
end;

{ TXMLRetAcessoType }

procedure TXMLRetAcessoType.AfterConstruction;
begin
  RegisterChildNode('Fazenda', TXMLFazendaType);
  ItemTag := 'Fazenda';
  ItemInterface := IXMLFazendaType;
  inherited;
end;

function TXMLRetAcessoType.Get_Codigo: WideString;
begin
  Result := AttributeNodes['Codigo'].Text;
end;

procedure TXMLRetAcessoType.Set_Codigo(Value: WideString);
begin
  SetAttribute('Codigo', Value);
end;

function TXMLRetAcessoType.Get_Fazenda(Index: Integer): IXMLFazendaType;
begin
  Result := List[Index] as IXMLFazendaType;
end;

function TXMLRetAcessoType.Add: IXMLFazendaType;
begin
  Result := AddItem(-1) as IXMLFazendaType;
end;

function TXMLRetAcessoType.Insert(const Index: Integer): IXMLFazendaType;
begin
  Result := AddItem(Index) as IXMLFazendaType;
end;

{ TXMLFazendaType }

function TXMLFazendaType.Get_Codigo: WideString;
begin
  Result := AttributeNodes['Codigo'].Text;
end;

procedure TXMLFazendaType.Set_Codigo(Value: WideString);
begin
  SetAttribute('Codigo', Value);
end;

function TXMLFazendaType.Get_Serial: WideString;
begin
  Result := AttributeNodes['Serial'].Text;
end;

procedure TXMLFazendaType.Set_Serial(Value: WideString);
begin
  SetAttribute('Serial', Value);
end;

end.