
{********************************************************}
{                                                        }
{                    XML Data Binding                    }
{                                                        }
{         Generated on: 22/05/2013 16:24:37              }
{       Generated from: T:\XML_Example_Pendrive_v3.xml   }
{                                                        }
{********************************************************}

unit CLAg5.XML_AcessoImpl;

interface

uses xmldom, XMLDoc, XMLIntf, XML_AcessoIntf ;

{ Global Functions }

function GetAcesso(Doc: IXMLDocument): IXMLAcessoType;
function LoadAcesso(const FileName: string): IXMLAcessoType;
function NewAcesso: IXMLAcessoType;

const
  TargetNamespace = '';

implementation

type

{ Forward Decls }

  TXMLAcessoType = class;
  TXMLFazendaType = class;
  TXMLModuloType = class;

{ TXMLAcessoType }

  TXMLAcessoType = class(TXMLNodeCollection, IXMLAcessoType)
  protected
    { IXMLAcessoType }
    function Get_Codigo: WideString;
    function Get_Serial: WideString ;
    function Get_Ativo: WideString;
    function Get_Fazenda(Index: Integer): IXMLFazendaType;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Serial(Value: WideString);
    procedure Set_Ativo(Value: WideString);
    function Add: IXMLFazendaType;
    function Insert(const Index: Integer): IXMLFazendaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFazendaType }

  TXMLFazendaType = class(TXMLNodeCollection, IXMLFazendaType)
  protected
    { IXMLFazendaType }
    function Get_Codigo: WideString;
    function Get_Nome: WideString;
    function Get_Validade: WideString;
    function Get_Ativo: WideString;
    function Get_Modulo(Index: Integer): IXMLModuloType;
    procedure Set_Codigo(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_Validade(Value: WideString);
    procedure Set_Ativo(Value: WideString);
    function Add: IXMLModuloType;
    function Insert(const Index: Integer): IXMLModuloType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLModuloType }

  TXMLModuloType = class(TXMLNode, IXMLModuloType)
  protected
    { IXMLModuloType }
    function Get_Nome: WideString;
    function Get_Acesso: WideString;
    function Get_Master: WideString;
    procedure Set_Nome(Value: WideString);
    procedure Set_Acesso(Value: WideString);
    procedure Set_Master(Value: WideString);
  end;

{ Global Functions }

function GetAcesso(Doc: IXMLDocument): IXMLAcessoType;
begin
  Result := Doc.GetDocBinding('Acesso', TXMLAcessoType, TargetNamespace) as IXMLAcessoType;
end;

function LoadAcesso(const FileName: string): IXMLAcessoType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Acesso', TXMLAcessoType, TargetNamespace) as IXMLAcessoType;
end;

function NewAcesso: IXMLAcessoType;
begin
  Result := NewXMLDocument.GetDocBinding('Acesso', TXMLAcessoType, TargetNamespace) as IXMLAcessoType;
end;

{ TXMLAcessoType }

procedure TXMLAcessoType.AfterConstruction;
begin
  RegisterChildNode('Fazenda', TXMLFazendaType);
  ItemTag := 'Fazenda';
  ItemInterface := IXMLFazendaType;
  inherited;
end;

function TXMLAcessoType.Get_Codigo: WideString;
begin
  Result := AttributeNodes['Codigo'].Text;
end;

procedure TXMLAcessoType.Set_Codigo(Value: WideString);
begin
  SetAttribute('Codigo', Value);
end;

function TXMLAcessoType.Get_Serial: WideString ;
begin
  Result := AttributeNodes['Serial'].NodeValue;
end;

procedure TXMLAcessoType.Set_Serial(Value: WideString);
begin
  SetAttribute('Serial', Value);
end;

function TXMLAcessoType.Get_Ativo: WideString;
begin
  Result := AttributeNodes['Ativo'].Text;
end;

procedure TXMLAcessoType.Set_Ativo(Value: WideString);
begin
  SetAttribute('Ativo', Value);
end;

function TXMLAcessoType.Get_Fazenda(Index: Integer): IXMLFazendaType;
begin
  Result := List[Index] as IXMLFazendaType;
end;

function TXMLAcessoType.Add: IXMLFazendaType;
begin
  Result := AddItem(-1) as IXMLFazendaType;
end;

function TXMLAcessoType.Insert(const Index: Integer): IXMLFazendaType;
begin
  Result := AddItem(Index) as IXMLFazendaType;
end;

{ TXMLFazendaType }

procedure TXMLFazendaType.AfterConstruction;
begin
  RegisterChildNode('Modulo', TXMLModuloType);
  ItemTag := 'Modulo';
  ItemInterface := IXMLModuloType;
  inherited;
end;

function TXMLFazendaType.Get_Codigo: WideString;
begin
  Result := AttributeNodes['Codigo'].Text;
end;

procedure TXMLFazendaType.Set_Codigo(Value: WideString);
begin
  SetAttribute('Codigo', Value);
end;

function TXMLFazendaType.Get_Nome: WideString;
begin
  Result := AttributeNodes['Nome'].Text;
end;

procedure TXMLFazendaType.Set_Nome(Value: WideString);
begin
  SetAttribute('Nome', Value);
end;

function TXMLFazendaType.Get_Validade: WideString;
begin
  Result := AttributeNodes['Validade'].Text;
end;

procedure TXMLFazendaType.Set_Validade(Value: WideString);
begin
  SetAttribute('Validade', Value);
end;

function TXMLFazendaType.Get_Ativo: WideString;
begin
  Result := AttributeNodes['Ativo'].Text;
end;

procedure TXMLFazendaType.Set_Ativo(Value: WideString);
begin
  SetAttribute('Ativo', Value);
end;

function TXMLFazendaType.Get_Modulo(Index: Integer): IXMLModuloType;
begin
  Result := List[Index] as IXMLModuloType;
end;

function TXMLFazendaType.Add: IXMLModuloType;
begin
  Result := AddItem(-1) as IXMLModuloType;
end;

function TXMLFazendaType.Insert(const Index: Integer): IXMLModuloType;
begin
  Result := AddItem(Index) as IXMLModuloType;
end;

{ TXMLModuloType }

function TXMLModuloType.Get_Nome: WideString;
begin
  Result := AttributeNodes['Nome'].Text;
end;

procedure TXMLModuloType.Set_Nome(Value: WideString);
begin
  SetAttribute('Nome', Value);
end;

function TXMLModuloType.Get_Acesso: WideString;
begin
  Result := AttributeNodes['Acesso'].Text;
end;

procedure TXMLModuloType.Set_Acesso(Value: WideString);
begin
  SetAttribute('Acesso', Value);
end;

function TXMLModuloType.Get_Master: WideString;
begin
  Result := AttributeNodes['Master'].Text;
end;

procedure TXMLModuloType.Set_Master(Value: WideString);
begin
  SetAttribute('Master', Value);
end;

end.