unit SearchsEntidades;


interface

uses SysFormSearch,
     Data.DB, Tc.Data.DB.Helpers, SqlTimSt ;
//     Wrappers ;

type

     TSearchDBEntidades = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     // utilizado para integração com o financeiro
     TSearchDBFinanceiro = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     TSearchTiposCadastro = class ( TSearchDBEntidades )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchGrupoCliente = class ( TSearchTiposCadastro )
     public
        constructor Create ; override ;
     end ;

     TSearchTipoProduto = class ( TSearchTiposCadastro )
     public
        constructor Create ; override ;
     end ;

     TSearchUsuario = class ( TSearchDBEntidades )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchFazenda = class ( TSearchDBEntidades )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCidade = class ( TSearchObject )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchEntidade = class ( TSearchDBEntidades )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCliente = class ( TSearchEntidade )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchClienteAtivo = class ( TSearchCliente )
     public
        constructor Create ; override ;
     end ;

     TSearchFornecedor = class ( TSearchEntidade )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create; override ;
        procedure SetFiltro( FAtivo : string );
     end ;

     TSearchFornecedorAtivo = class ( TSearchEntidade )
     public
        constructor Create; override ;
     end ;

     TSearchFuncionario = class ( TSearchEntidade )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchFuncionarioAtivo = class ( TSearchFuncionario )
     public
        constructor Create ; override ;
     end ;

     TSearchTiposCadastrados = class ( TSearchDBEntidades )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
        procedure SetFiltro( FTipo : Integer );
     end ;

type
     TTipoReceitaDespesa = ( toaCancel, toaReceita, toaDespesa ) ;

     TTipoPlanoAPRD = (tpAtivo, tpPassivo, tpReceitas, tpDespesas );

     TTiposPlanoAPRD = set of TTipoPlanoAPRD ;

     TPlanoAnaliticoSintetico = (pasAnaliticoSintetico, pasAnalitico, pasSintetico );

const
    StrTiposPlanoAPRD : array [ TTipoPlanoAPRD ] of string =  ( 'A', 'P', 'R', 'D' ) ;

type

     TSearchPlanoContas = class ( TSearchDBFinanceiro )
     private
       Fmask : string ;
       FAPRD: TTiposPlanoAPRD;
       FAnaliticoSintetico: TPlanoAnaliticoSintetico ;
       procedure SetAPRD(const Value: TTiposPlanoAPRD);
       procedure SetAnaliticoSintetico(const Value: TPlanoAnaliticoSintetico);
     protected
       procedure CLASSIFICACAOGetText(Sender: TField; var Text: string;DisplayText: Boolean);
//       procedure TIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
       property  APRD : TTiposPlanoAPRD  read FAPRD write SetAPRD;
       property  AnaliticoSintetico : TPlanoAnaliticoSintetico  read FAnaliticoSintetico write SetAnaliticoSintetico;
       constructor Create ; override ;
     end ;


implementation

uses
     Tc.DBRTL.AbstractDB
   , System.Classes
   , System.SysUtils
   , Tc.RTL.Exceptions
   , CLAg5SvcEntidadesCadastroClientes
   , CLAg5SvcEntidadesCadastroFornecedores
   , CLAg5SvcEntidadesCadastroFuncionarios
   , CLAg5SvcFinanceiroApropriacao
//     Exceptions,
 //    CLAg5Types
     ;


{ TSearchDBEntidades }

constructor TSearchDBEntidades.Create;
begin
  inherited;
  AbstractDB := TTcAbstractDB.GetByAlias('ENTIDADES') ;
  if not Assigned ( AbstractDB )  then
    RaiseException( nil, UnitName, ClassName,  'Create', 'AbstractDB[''ENTIDADES''] não inicializado'  ) ;
end;

constructor TSearchDBFinanceiro.Create;
begin
  inherited;
  AbstractDB := TTcAbstractDB.GetByAlias('FINANCEIRO') ;
  if not Assigned ( AbstractDB )  then
    RaiseException( nil, UnitName, ClassName,  'Create', 'AbstractDB[''FINANCEIRO''] não inicializado' ) ;
end;

{ TSearchs }

constructor TSearchEntidade.Create ;
begin
   inherited ;
   TableName           := 'CAD_ENTIDADES C' ;
   KeyFields.CommaText := 'C.KCAD_ENTIDADE' ;
   Fields.CommaText    := 'C.CODIGO, C.APELIDO, C.NOME, C.CPF_CNPJ, C.RG_IE' ;
   Where.Add ( Format ( 'KSYS$DOMAIN=''%s'' AND SYS$DELETED = ''F''', [ LoggedUser.DomainID] ) ) ;
end;


{ TSearchFazenda }

constructor TSearchFazenda.Create;
begin
   inherited;
   Caption             := 'Fazendas';
   TableName           := 'CAD_FAZENDAS F' ;
   KeyFields.CommaText := 'F.KCAD_FAZENDA' ;
   Fields.CommaText    := 'C.CODIGO, C.APELIDO, C.NOME' ;
   JoinTables.Add (    'CAD_ENTIDADES C ON C.KCAD_ENTIDADE = F.KCAD_FAZENDA' ) ;
   JoinTables.Add (    'CAD_USUARIOS_FAZENDA UF ON UF.KSYS$DOMAIN = F.KCAD_FAZENDA' ) ;
   Where.Add ( Format ( 'UF.KSYS$USER = ''%s''', [ LoggedUser.UserID ] ) ) ;
end;

procedure TSearchFazenda.CustomFormatResult(AFields: TFields);
begin
    AFields.FieldByName('CODIGO').DisplayLabel  := 'Código' ;
    AFields.FieldByName('APELIDO').DisplayLabel := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel    := 'Nome' ;
end;

{ TSearchUsuario }

constructor TSearchUsuario.Create;
begin
   inherited;
   Caption := 'Usuário' ;
   TableName           := 'SYS$USERS U' ;
   KeyFields.CommaText := 'U.KSYS$USER' ;
   Fields.CommaText    := 'C.CODIGO, U.LOGIN, C.APELIDO, C.NOME' ;
   JoinTables.Add (    'CAD_ENTIDADES C ON C.KCAD_ENTIDADE = U.KSYS$USER' ) ;
end;


procedure TSearchUsuario.CustomFormatResult(AFields: TFields);
begin
  inherited;
    AFields.FieldByName('CODIGO').DisplayLabel  := 'Código' ;
    AFields.FieldByName('LOGIN').DisplayLabel   := 'Login' ;
    AFields.FieldByName('APELIDO').DisplayLabel := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel    := 'Nome' ;
end;

{ TSearchCliente }

constructor TSearchCliente.Create;
begin
  inherited;
  Where.Add ( 'AND C.IS_CLIENTE = ''T'' ' ) ;
  Self.NewFastRegister := SvcClienteNewFastRegister;
end;

procedure TSearchCliente.CustomFormatResult(AFields: TFields);
begin
  inherited;
end;

{ TSearchFornecedor }

constructor TSearchFornecedor.Create;
begin
  inherited;
  Caption := ' Fonecedores';
  Where.Add ( 'AND C.IS_FORNECEDOR = ''T'' ' ) ;
  Self.NewFastRegister := SvcFornecedorNewFastRegister;
end;

procedure TSearchFornecedor.CustomFormatResult(AFields: TFields);
begin
  inherited;
end;

procedure TSearchFornecedor.SetFiltro(FAtivo: string);
begin
  Where.Add( ' AND ( :DSP_ATIVO = ''T'' OR C.ATIVO = ''T'' )' );
  params.CreateParam( ftInteger, 'DSP_ATIVO', ptInput ).AsString := FAtivo ;
end;

{ TSearchFuncionario }

constructor TSearchFuncionario.Create;
begin
  inherited;
  Where.Add ( 'AND C.IS_FUNCIONARIO = ''T'' ' ) ;
  Self.NewFastRegister := SvcFuncionarioNewFastRegister;
end;

procedure TSearchFuncionario.CustomFormatResult(AFields: TFields);
begin
  inherited;
    AFields.FieldByName('CODIGO').DisplayLabel   := 'Código' ;
    AFields.FieldByName('APELIDO').DisplayLabel  := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel     := 'Nome' ;
    AFields.FieldByName('CPF_CNPJ').DisplayLabel := 'CPF' ;
    AFields.FieldByName('RG_IE').DisplayLabel    := 'RG' ;
end;


{ TSearchCidade }

constructor TSearchCidade.Create;
begin
  inherited;
   Caption := 'Cidades';
   TableName           := 'glb_dtb_municipios m' ;
   KeyFields.CommaText := 'M.CIBGE' ;
   Fields.CommaText    := 'M.NOME CIDADE, U.SIGLA UF' ;
   JoinTables.Add (    'glb_dtb_uf u on u.kglb_dtb_uf = m.kglb_dtb_uf' ) ;
end;

procedure TSearchCidade.CustomFormatResult(AFields: TFields);
begin
  inherited;
    AFields.FieldByName('CIDADE').DisplayLabel  := 'Cidade' ;
    AFields.FieldByName('UF').DisplayLabel      := 'UF' ;
end;


procedure TSearchEntidade.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel   := 'Código' ;
  AFields.FieldByName('APELIDO').DisplayLabel  := 'Apelido/Nome fantasia' ;
  AFields.FieldByName('NOME').DisplayLabel     := 'Nome' ;
  AFields.FieldByName('CPF_CNPJ').DisplayLabel := 'CPF/CNPJ' ;
  AFields.FieldByName('RG_IE').DisplayLabel    := 'RG/IE' ;
end;


{ TSearchFornecedorInativo }

constructor TSearchFornecedorAtivo.Create;
begin
  inherited;
  Caption := ' Fonecedores';
  Where.Add ( 'AND C.ATIVO = ''T'' AND C.IS_FORNECEDOR = ''T'' ' ) ;
  Self.NewFastRegister := SvcFornecedorNewFastRegister;
end;

{ TSearchClienteInativo }

constructor TSearchClienteAtivo.Create;
begin
  inherited;
  Where.Add ( ' AND C.ATIVO = ''T'' ' ) ;
end;

{ TSearchFuncionarioAtivo }

constructor TSearchFuncionarioAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND C.ATIVO = ''T'' ' ) ;
end;

{ TSearchTipos }

constructor TSearchTiposCadastrados.Create;
begin
  inherited;
   TableName           := 'CAD_TIPOS T' ;
   KeyFields.CommaText := 'T.KCAD_TIPOS' ;
   Fields.CommaText    := 'T.DESCRICAO' ;
   Where.Add( Format ( 'T.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID ] ) ) ;
end;

procedure TSearchTiposCadastrados.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('DESCRICAO').DisplayLabel := 'Descrição' ;
end;

procedure TSearchTiposCadastrados.SetFiltro(FTipo: Integer);
begin
  // 1- Grupo Cliente / 2- Tipo Produto / 3- Unidade Medida
  Where.Add( ' AND TIPO = :TIPO ' );
  params.CreateParam( ftInteger, 'TIPO', ptInput ).AsInteger := FTipo ;
end;

{ TSearchTiposCadastro }

constructor TSearchTiposCadastro.Create;
begin
  inherited;
  TableName           := 'CAD_TIPOS T ' ;
  KeyFields.CommaText := 'T.KCAD_TIPOS ' ;
  Fields.CommaText    := 'T.DESCRICAO' ;
  Where.Add ( Format ( 'T.KSYS$DOMAIN = ''%s''', [ LoggedUser.DomainID] ) ) ;
  OrderBy.CommaText   := 'T.DESCRICAO ';
end;

procedure TSearchTiposCadastro.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('DESCRICAO').DisplayLabel := 'Descrição' ;
end;

{ TSearchGrupoCliente }

constructor TSearchGrupoCliente.Create;
begin
  inherited;
  Where.Add ( ' AND T.TIPO = 1' ) ;
end;

{ TSearchTipoProduto }

constructor TSearchTipoProduto.Create;
begin
  inherited;
  Where.Add ( ' AND T.TIPO = 3' ) ;
end;


{ TSearchPlanoContas }

constructor TSearchPlanoContas.Create;
begin
  inherited;

  if Fmask = EmptyStr then
   if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    Fmask :=  SvcFinanceiroMascaraPlanoContas.GetMascara
   else
    Fmask :=  _ST_PLANO_CONTAS_MASK ;

  TableName           := 'FIN_PLANOCONTAS PC' ;
  KeyFields.CommaText := 'PC.KFIN_PLANOCONTA' ;
  Fields.CommaText    := 'PC.CLASSIFICACAO, PC.CODIGO, PC.NOME' ;
  DisplayFields.Add ( 'IIF ( PC.ANALITICO_SINTETICO = ''A'', ''Analítica'', ''Sintética'' ) ANALITICO_SINTETICO' ) ;
  DisplayFields.Add ( 'IIF ( PC.DEVEDORA_CREDORA = ''D'', ''Devedora'', ''Credora'' ) DEVEDORA_CREDORA' ) ;
  DisplayFields.Add ( 'IIF ( PC.FLUXOCAIXA = ''T'', ''Sim'', ''Não'' ) FLUXOCAIXA' ) ;
  DisplayFields.Add ( 'IIF ( PC.FIXA_VARIAVEL = ''F'', ''Fixa'', ''Variável'' ) FIXA_VARIAVEL' ) ;
  DisplayFields.Add ( 'PC.TIPO_APRD' ) ;
  Where.Add ( Format ( 'PC.KSYS$DOMAIN=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchPlanoContas.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CLASSIFICACAO').DisplayLabel := 'Classificação' ;
  AFields.FieldByName('CLASSIFICACAO').OnGetText := CLASSIFICACAOGetText;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Código' ;
  AFields.FieldByName('NOME').DisplayLabel   := 'Descrição' ;
  AFields.FieldByName('ANALITICO_SINTETICO').DisplayLabel   := 'Analítica/Sintética' ;
  AFields.FieldByName('DEVEDORA_CREDORA').DisplayLabel   := 'Devedora/Credora' ;
  AFields.FieldByName('FLUXOCAIXA').DisplayLabel   := 'Fluxo de caixa' ;
  AFields.FieldByName('FIXA_VARIAVEL').DisplayLabel   := 'Fixa/Variável' ;

  AFields.FieldByName('TIPO_APRD').Visible := false;
end;

procedure TSearchPlanoContas.SetAnaliticoSintetico(const Value: TPlanoAnaliticoSintetico );
begin
  FAnaliticoSintetico := Value;

  case FAnaliticoSintetico of
    pasAnalitico : Where.Add ( ' AND PC.ANALITICO_SINTETICO = ''A'' '  ) ;
    pasSintetico : Where.Add ( ' AND PC.ANALITICO_SINTETICO = ''S'' '  ) ;
  end;
end;

procedure TSearchPlanoContas.SetAPRD(const Value: TTiposPlanoAPRD);
var
  i : TTipoPlanoAPRD ;
  StrIn : string ;
begin
  FAPRD := Value;

  StrIn := '' ;

  for I := low( TTipoPlanoAPRD ) to High( TTipoPlanoAPRD ) do
    if I in FAPRD then
      StrIn := Format ( '%s%s,', [ StrIn, QuotedStr( StrTiposPlanoAPRD[ i ] ) ] ) ;;

  if ( StrIn <> EmptyStr ) then
    begin
      StrIn := Copy( StrIn, 1, length( StrIn ) - 1 );
      Where.Add( Format( ' AND PC.TIPO_APRD IN ( %s ) ', [ StrIn ] ) ) ;
    end;

end;


procedure TSearchPlanoContas.CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  aux, codigo : String;
  list : TStringList;
  listMask : TStringList;
  tamanho, i : integer;
begin
  if (DisplayText) then
  begin
   try
    try
      listMask := TStringList.Create;
      listMask.Delimiter := '.';
      listMask.DelimitedText := Fmask;

      list := TStringList.Create;
      list.Delimiter := '.';
      list.DelimitedText := Sender.AsString;

      codigo := '';
      for i := 0 to list.Count - 1 do
      begin
        tamanho := length(listMask[i]);

        aux := '0000000000' + list[i];
        aux := copy(aux,  length(aux)-tamanho+1 , tamanho);

        if codigo = EmptyStr then
          codigo := aux
        else
          codigo := codigo + '.' + aux;
      end;

      Text := codigo;

    except
      Text := Sender.AsString;
    end;
   finally
     listMask.free ;
     list.free ;
   end;
  end;
end;


end.
