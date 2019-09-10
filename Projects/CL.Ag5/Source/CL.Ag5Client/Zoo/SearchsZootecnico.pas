unit SearchsZootecnico;


interface

uses SearchsEntidades, SysFormSearch, UApplResources, Data.DB, Tc.Data.DB.Helpers, Data.SQLTimSt, USvcZootecnico,
     Wrappers ;

const
  _BRINCO_ = '(IIF ( TRIM ( A.BRINCO ) SIMILAR TO ''[0-9]+'', ''0'', SUBSTRING( TRIM(A.BRINCO) FROM 1 FOR 1 ) ) || LPAD ( TRIM ( A.BRINCO ), 15, ''0'' )) BRINCO_' ;

type

     TSearchFuncionarioAtivo = SearchsEntidades.TSearchFuncionarioAtivo ;

     TSearchDBZootecnico = class ( TSearchObject )
     public
        constructor Create ; override ;
     end ;

     TSearchFazenda = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCidade = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchVacina = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchVermifugo = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchCFOP = class ( TSearchDBZootecnico )
     public
        constructor Create ; override ;
     end ;

     TSearchCST = class ( TSearchDBZootecnico )
     public
        constructor Create ; override ;
     end ;

     TSearchCFISCAL = class ( TSearchDBZootecnico )
     public
        constructor Create ; override ;
     end ;

     TSearchTarefaExames = class ( TSearchDBZootecnico )
     protected
       procedure GetTextTipoTarefaExame(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchTarefaExamesAtivo = class ( TSearchTarefaExames )
     public
        constructor Create ; override ;
     end ;


     // utilizado pelo modulo ADMIN
     TSearchTarefaExamesDefault = class ( TSearchDBZootecnico )
     protected
       procedure GetTextTipoTarefaExame(Sender: TField; var Text: string; DisplayText: Boolean);
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchTarefaExamesDefaultAtivo = class ( TSearchTarefaExamesDefault )
     public
        constructor Create ; override ;
     end ;

     TSearchTarefa = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchTarefaAtiva = class ( TSearchTarefa )
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchTarefaDefault = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchTarefaDefaultAtiva = class ( TSearchTarefaDefault )
     public
        constructor Create ; override ;
     end ;

     TSearchExame = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchExameAtivo = class ( TSearchExame )
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchExameDefault = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchExameDefaultAtivo = class ( TSearchExameDefault )
     public
        constructor Create ; override ;
     end ;

     TSearchProtocolo = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchProtocoloAtivo = class ( TSearchProtocolo )
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchProtocoloDefault = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     // utilizado pelo modulo ADMIN
     TSearchProtocoloDefaultAtivo = class ( TSearchProtocoloDefault )
     public
        constructor Create ; override ;
     end ;

     TSearchDiagnostico = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchDiagnosticoAtivo = class ( TSearchDiagnostico )
     public
        constructor Create ; override ;
     end ;

     TSearchEscore = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchEscoreAtivo = class ( TSearchEscore )
     public
        constructor Create ; override ;
     end ;

     TSearchIndicador = class ( TSearchDBZootecnico )
     protected
       procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchIndicadorAtivo = class ( TSearchIndicador )
     public
        constructor Create ; override ;
     end ;

     TSearchMacho = class ( TSearchDBZootecnico )
     protected
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchPai = class ( TSearchDBZootecnico )
     protected
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchSemen = class ( TSearchMacho )
     public
        constructor Create ; override ;
     end ;

     TSearchSemenAtivo = class ( TSearchSemen )
     public
        constructor Create ; override ;
     end ;

     TSearchMachosEmbriao = class ( TSearchDBZootecnico )
     private
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
     protected
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchEmbriao = class ( TSearchDBZootecnico )
     private
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
     protected
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchTouro = class ( TSearchMacho )
     public
        constructor Create ; override ;
     end ;

     TSearchTouroAtivo = class ( TSearchTouro )
     public
        constructor Create ; override ;
     end ;

     TSearchFemea = class ( TSearchDBZootecnico )
     protected
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchMae = class ( TSearchDBZootecnico )
     protected
        procedure BRINCO_GetText(Sender: TField; var Text: string;DisplayText: Boolean);
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchFemeaAtivo = class ( TSearchFemea )
     public
        constructor Create ; override ;
     end ;

     TSearchFemeaUltimaMonta = class ( TSearchFemeaAtivo )
     protected
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

     TSearchFemeaUltimaMontaPossivelPrenhez = class ( TSearchFemeaUltimaMonta )
     public
        constructor Create ; override ;
     end ;

     TSearchFemeaEmLactacao = class ( TSearchFemea )
     protected
        procedure CustomFormatResult( AFields : TFields ); override ;
     public
        constructor Create ; override ;
     end ;

implementation

uses SysUtils ,
     CLAg5Types,
     Exceptions,
     ClAg5ClientCommonTypes,
     Tc.DBRTL.AbstractDB ;

{ TSearchDBZootecnico }

constructor TSearchDBZootecnico.Create;
begin
  inherited;
  AbstractDB := TTcAbstractDB.GetByAlias('ZOOTECNICO') ;
  if not Assigned ( AbstractDB )  then
     RaiseException( nil, UnitName, ClassName,  'Create', 'AbstractDB[''ZOOTECNICO''] não inicializado' )
end;


{ TSearchCFOP }

constructor TSearchCFOP.Create;
begin
  inherited;

end;

{ TSearchCST }

constructor TSearchCST.Create;
begin
  inherited;

end;

{ TSearchCFISCAL }

constructor TSearchCFISCAL.Create;
begin
  inherited;

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
   JoinTables.Add (    'CAD_USUARIOS_FAZENDA UF ON UF.KCAD_FAZENDA = F.KCAD_FAZENDA' ) ;
   Where.Add ( Format ( 'UF.KSYS$USER = ''%s''', [ LoggedUser.UserID ] ) ) ;
end;

procedure TSearchFazenda.CustomFormatResult(AFields: TFields);
begin
    AFields.FieldByName('CODIGO').DisplayLabel  := 'Código' ;
    AFields.FieldByName('APELIDO').DisplayLabel := 'Apelido' ;
    AFields.FieldByName('NOME').DisplayLabel    := 'Nome' ;
end;

{ TSearchVacina }

constructor TSearchVacina.Create;
begin
  inherited;
//
end;

procedure TSearchVacina.CustomFormatResult(AFields: TFields);
begin
  inherited;
//
end;

{ TSearchVermifugo }

constructor TSearchVermifugo.Create;
begin
  inherited;

end;

procedure TSearchVermifugo.CustomFormatResult(AFields: TFields);
begin
  inherited;
//
end;

{ TSearchTarefa }

constructor TSearchTarefa.Create;
begin
  inherited;
   Caption := 'Tarefas' ;
   TableName           := 'ZOO_TAREFAS T' ;
   KeyFields.CommaText := 'T.KZOO_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO,T.NOME' ;
   Where.Add ( Format ( 'T.KCAD_FAZENDA=''%s'' AND T.TIPOTAREFA > 0', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchTarefa.CustomFormatResult(AFields: TFields);
begin
  AFields.FieldByName('CODIGO').DisplayLabel := 'Tarefa' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchTarefaAtiva }

constructor TSearchTarefaAtiva.Create;
begin
  inherited;
  Caption := 'Tarefas - Ativas' ;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;


{ TSearchTarefaDefault }

constructor TSearchTarefaDefault.Create;
begin
  inherited;
   Caption := 'Tarefas' ;
   TableName           := 'DEF_TAREFAS T' ;
   KeyFields.CommaText := 'T.KDEF_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO,T.NOME' ;
   Where.Add ( 'T.TIPOTAREFA > 0' ) ;
end;

procedure TSearchTarefaDefault.CustomFormatResult(AFields: TFields);
begin
  AFields.FieldByName('CODIGO').DisplayLabel := 'Tarefa' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchTarefaDefaultAtiva }

constructor TSearchTarefaDefaultAtiva.Create;
begin
  inherited;
  Caption := 'Tarefas - Ativas' ;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;

{ TSearchExameAtivo }

constructor TSearchExame.Create;
begin
  inherited;
   Caption := 'Exame' ;
   TableName           := 'ZOO_TAREFAS T' ;
   KeyFields.CommaText := 'T.KZOO_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO,T.NOME' ;
   Where.Add ( Format ( 'T.KCAD_FAZENDA=''%s'' AND T.TIPOTAREFA = -1', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchExame.CustomFormatResult(AFields: TFields);
begin
  AFields.FieldByName('CODIGO').DisplayLabel := 'Exame' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;


{ TSearchExameAtivo }

constructor TSearchExameAtivo.Create;
begin
  inherited;
  Caption := 'Exames - Ativos' ;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;


{ TSearchExameDefault }

constructor TSearchExameDefault.Create;
begin
  inherited;
   Caption := 'Exames' ;
   TableName           := 'DEF_TAREFAS T' ;
   KeyFields.CommaText := 'T.KDEF_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO,T.NOME' ;
   Where.Add ( 'T.TIPOTAREFA = -1' ) ;
end;

procedure TSearchExameDefault.CustomFormatResult(AFields: TFields);
begin
  AFields.FieldByName('CODIGO').DisplayLabel := 'Exame' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchExameDefaultAtiva }

constructor TSearchExameDefaultAtivo.Create;
begin
  inherited;
  Caption := 'Exames - Ativos' ;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;

{ TSearchProtocolo }

constructor TSearchProtocolo.Create;
begin
   inherited;
   Caption := 'Protocolos' ;
   TableName           := 'ZOO_PROTOCOLOS P' ;
   KeyFields.CommaText := 'P.KZOO_PROTOCOLO' ;
   Fields.CommaText    := 'P.CODIGO,P.NOME' ;
   Where.Add ( Format ( 'P.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchProtocolo.CustomFormatResult(AFields: TFields);
begin
  Caption := 'Protocolos - Ativos' ;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Protocolo' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchProtocoloAtivo }

constructor TSearchProtocoloAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND P.ATIVO=''T''' ) ;
end;

{ TSearchProtocoloDefault }

constructor TSearchProtocoloDefault.Create;
begin
   inherited;
   Caption := 'Protocolo' ;
   TableName           := 'DEF_PROTOCOLOS P' ;
   KeyFields.CommaText := 'P.KDEF_PROTOCOLO' ;
   Fields.CommaText    := 'P.CODIGO,P.NOME'  ;
end;

procedure TSearchProtocoloDefault.CustomFormatResult(AFields: TFields);
begin
  Caption := 'Protocolos - Ativos' ;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Protocolo' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchProtocoloDefaultAtivo }

constructor TSearchProtocoloDefaultAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND P.ATIVO=''T''' ) ;
end;


{ TSearchDiagnostico }

constructor TSearchDiagnostico.Create;
begin
  inherited;
   Caption := 'Diagnósticos' ;
   TableName           := 'ZOO_DIAGNOSTICOS D' ;
   KeyFields.CommaText := 'D.KZOO_DIAGNOSTICO' ;
   Fields.CommaText    := 'D.CODIGO,D.NOME' ;
   Where.Add ( Format ( 'D.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

{ TSearchDiagnosticoAtiva }

constructor TSearchDiagnosticoAtivo.Create;
begin
  inherited;
  Caption := 'Diagnósticos - Ativos' ;
  Where.Add ( 'AND D.ATIVO=''T''' ) ;
end;


procedure TSearchDiagnostico.CustomFormatResult(AFields: TFields);
begin
  AFields.FieldByName('CODIGO').DisplayLabel := 'Diagnóstico' ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
end;

{ TSearchEscore }

constructor TSearchEscore.Create;
begin
  inherited;
   TableName           := 'ZOO_CFGESCORES T' ;
   KeyFields.CommaText := 'T.KZOO_CFGESCORE' ;
   Fields.CommaText    := 'T.NOME' ;
   Where.Add ( Format ( 'T.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

{ TSearchEscoreAtiva }

constructor TSearchEscoreAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;

procedure TSearchEscore.CustomFormatResult(AFields: TFields);
begin
  inherited;

end;

{ TSearchIndicador }

constructor TSearchIndicador.Create;
begin
  inherited;
   TableName           := 'ZOO_CFGINDICADORES T' ;
   KeyFields.CommaText := 'T.KZOO_CFGINDICADOR' ;
   Fields.CommaText    := 'T.NOME' ;
   Where.Add ( Format ( 'T.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

{ TSearchIndicadorAtiva }

constructor TSearchIndicadorAtivo.Create;
begin
  inherited;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;


procedure TSearchIndicador.CustomFormatResult(AFields: TFields);
begin
  inherited;

end;

{ TSearchMacho }

constructor TSearchMacho.Create;
begin
  inherited;
  TableName               := 'ZOO_ANIMAIS_MACHO AM' ;
  KeyFields.CommaText     := 'AM.KZOO_ANIMAL_MACHO' ;
  Fields.CommaText        := 'A.BRINCO, A.NOMEESTABULO' ;
  DisplayFields.Add  ( _BRINCO_ ) ;
  OrderBy.CommaText := 'BRINCO_' ;
  JoinTables.Add (    'ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AM.KZOO_ANIMAL_MACHO' ) ;
  Where.Add ( Format ( 'A.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID ] ) ) ;
  Self.NewFastRegister := SvcMachoNewFastRegister;
end;

procedure TSearchMacho.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('BRINCO_').Visible := False ;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;
//  AFields.FieldByName('BRINCO').OnGetText       := BRINCOGetText ;
//  AFields.FieldByName('BRINCO').Index           := 0 ;
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
(*
  AFields.FieldByName('BRINCO').Visible  := False ;
  AFields.FieldByName('BRINCO_').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO_').DisplayWidth    := 15 ;
  AFields.FieldByName('BRINCO_').OnGetText       := BRINCO_GetText ;
  AFields.FieldByName('BRINCO_').Index           := 0 ;
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
*)
end;

procedure TSearchMacho.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

{ TSearchFemea }

constructor TSearchFemea.Create;
begin
  inherited;
  TableName           := 'ZOO_ANIMAIS_FEMEA AF' ;
  KeyFields.CommaText := 'AF.KZOO_ANIMAL_FEMEA' ;
  Fields.CommaText    := 'A.BRINCO, A.NOMEESTABULO' ;
  DisplayFields.Add  ( _BRINCO_ ) ;
  OrderBy.CommaText := 'BRINCO_' ;
  JoinTables.Add (    'ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA' ) ;
  Where.Add ( Format ( 'A.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID ] ) ) ;
end;

procedure TSearchFemea.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('BRINCO_').Visible := False ;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Brinco' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;
(*
  AFields.FieldByName('BRINCO').Visible  := False ;
  AFields.FieldByName('BRINCO_').DisplayLabel    := 'Brinco' ;
  AFields.FieldByName('BRINCO_').DisplayWidth    := 15 ;
  AFields.FieldByName('BRINCO_').OnGetText       := BRINCO_GetText ;
  AFields.FieldByName('BRINCO_').Index           := 0 ;
*)
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
  AFields.FieldByName('NOMEESTABULO').DisplayWidth := 128 ;

end;

procedure TSearchFemea.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
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

{ TSearchSemen }

constructor TSearchSemen.Create;
begin
  inherited;
  Caption := 'Sêmen' ;
  Where.Add ( Format ( 'AND ( A.STATUS = %d )', [ _ST_STATUS_MACHO_SEMEN ] ) ) ;
end;

constructor TSearchSemenAtivo.Create;
begin
  inherited;
  Caption := 'Sêmen' ;
  Where.Add ( 'AND ( AM.DS_ATIVO = ''T'' )' ) ;
end;

{ TSearchEmbriao }

constructor TSearchEmbriao.Create;
begin
  inherited;
  Caption := 'Embrião' ;

  TableName           := 'ZOO_ANIMAIS_EMBRIAO AE' ;
  KeyFields.CommaText := 'AE.KZOO_ANIMAL_EMBRIAO' ;
  Fields.CommaText    := 'A.BRINCO, A.NOMECOMPLETO' ;
  DisplayFields.Add  ( _BRINCO_ ) ;
  OrderBy.CommaText := 'BRINCO_' ;
  JoinTables.Add (    'ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AE.KZOO_ANIMAL_EMBRIAO' ) ;
  Where.Add ( Format ( 'A.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID ] ) ) ;

//  Where.Add ( Format ( 'AND ( A.STATUS=%d )', [ _ST_STATUS_MACHO_EMBRIAO ] ) ) ;
end;

procedure TSearchEmbriao.CustomFormatResult(AFields: TFields);
begin
  inherited;

  AFields.FieldByName('BRINCO_').Visible := False ;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;
(*
  AFields.FieldByName('BRINCO').Visible  := False ;
  AFields.FieldByName('BRINCO_').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO_').DisplayWidth    := 15 ;
  AFields.FieldByName('BRINCO_').OnGetText       := BRINCO_GetText ;
  AFields.FieldByName('BRINCO_').Index           := 0 ;
*)
  AFields.FieldByName('NOMECOMPLETO').DisplayLabel := 'Nome completo' ;
end;

procedure TSearchEmbriao.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

{ TSearchTouro }

constructor TSearchTouro.Create;
begin
  inherited;
  Caption := 'Touro' ;
  Where.Add ( Format ( 'AND ( A.STATUS=%d )', [ _ST_STATUS_MACHO_TOURO ] ) ) ;
end;

{ TSearchTouroAtivo }

constructor TSearchTouroAtivo.Create;
begin
  inherited;
  //Caption := 'Touro ativo' ;
  JoinTables.Add ( 'ZOO_ANIMAL_DESCARTES D ON D.KZOO_ANIMAL = A.KZOO_ANIMAL' ) ;
  Where.Add ( 'AND ( D.KZOO_ANIMAL IS NULL )' ) ;
end;

{ TSearchFemeaAtivo }

constructor TSearchFemeaAtivo.Create;
begin
  inherited;
  Where.Add ( Format ( 'AND ( A.STATUS <> %d )', [ _ST_STATUS_ANIMAL_DESCARTADO ] ) ) ;
end;

{ TSearchMae }

constructor TSearchMae.Create;
begin
  inherited;
  TableName           := 'ZOO_ANIMAIS A' ;
  KeyFields.CommaText := 'A.KZOO_ANIMAL' ;
  Fields.CommaText    := 'A.BRINCO, A.NOMEESTABULO' ;
  DisplayFields.Add  ( _BRINCO_ ) ;
  DisplayFields.Add ( 'IIF ( E.KZOO_ANIMAL_EXTERNO IS NULL, CAST ( '''' as VARCHAR( 7 ) ), ''Externo'' ) EXTERNO' ) ;
  OrderBy.CommaText := 'BRINCO_' ;
  JoinTables.Add (    'ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL' ) ;
  JoinTables.Add (    'ZOO_ANIMAIS_EXTERNO E ON E.KZOO_ANIMAL_EXTERNO = A.KZOO_ANIMAL AND E.SEXO = ''F''' ) ;
  Where.Add ( Format ( 'A.KCAD_FAZENDA=''%s'' AND ( AF.KZOO_ANIMAL_FEMEA IS NOT NULL OR E.KZOO_ANIMAL_EXTERNO IS NOT NULL ) ',
      [ LoggedUser.DomainID ] ) ) ;
  Fields.Add ( 'A.GRAUSANGUE' ) ;
  Fields.Add ( 'A.COMPOSICAORACA' ) ;
end;

procedure TSearchMae.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('BRINCO_').Visible := False ;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Brinco' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;

(*
  AFields.FieldByName('BRINCO').Visible  := False ;
  AFields.FieldByName('BRINCO_').DisplayLabel    := 'Brinco' ;
  AFields.FieldByName('BRINCO_').DisplayWidth    := 15 ;
  AFields.FieldByName('BRINCO_').OnGetText       := BRINCO_GetText ;
  AFields.FieldByName('BRINCO_').Index           := 0 ;
*)
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
  AFields.FieldByName('GRAUSANGUE').Visible := False  ;
  AFields.FieldByName('COMPOSICAORACA').Visible := False  ;
  AFields.FieldByName('EXTERNO').DisplayLabel := 'Externo' ;
end;

procedure TSearchMae.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

{ TSearchPai }

constructor TSearchPai.Create;
begin
  inherited;
  TableName           := 'ZOO_ANIMAIS A' ;
  KeyFields.CommaText := 'A.KZOO_ANIMAL' ;
  Fields.CommaText    := 'A.BRINCO, A.NOMEESTABULO' ;
  DisplayFields.Add  ( _BRINCO_ ) ;
  DisplayFields.Add ( 'IIF ( E.KZOO_ANIMAL_EXTERNO IS NULL, CAST ( '''' as VARCHAR( 7 ) ), ''Externo'' ) EXTERNO' ) ;
  OrderBy.CommaText := 'BRINCO_' ;
  JoinTables.Add (    'ZOO_ANIMAIS_MACHO AM ON AM.KZOO_ANIMAL_MACHO = A.KZOO_ANIMAL' ) ;
  JoinTables.Add (    'ZOO_ANIMAIS_EXTERNO E ON E.KZOO_ANIMAL_EXTERNO = A.KZOO_ANIMAL AND E.SEXO = ''M''' ) ;
  Where.Add ( Format ( 'A.KCAD_FAZENDA=''%s'' AND ( AM.KZOO_ANIMAL_MACHO IS NOT NULL OR E.KZOO_ANIMAL_EXTERNO IS NOT NULL ) ',
      [ LoggedUser.DomainID ] ) ) ;
  Fields.Add ( 'A.GRAUSANGUE' ) ;
  Fields.Add ( 'A.COMPOSICAORACA' ) ;
end;

procedure TSearchPai.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('BRINCO_').Visible := False ;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;
(*
  AFields.FieldByName('BRINCO').Visible            := False ;
  AFields.FieldByName('BRINCO_').DisplayLabel    := 'Código' ;
  AFields.FieldByName('BRINCO_').DisplayWidth    := 15 ;
  AFields.FieldByName('BRINCO_').OnGetText       := BRINCO_GetText ;
  AFields.FieldByName('BRINCO_').Index           := 0 ;
*)
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
  AFields.FieldByName('GRAUSANGUE').Visible := False  ;
  AFields.FieldByName('COMPOSICAORACA').Visible := False  ;
  AFields.FieldByName('EXTERNO').DisplayLabel := 'Externo' ;
end;

procedure TSearchPai.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

{ TSearchFemeaUltimaMonta }

constructor TSearchFemeaUltimaMonta.Create;
begin
  inherited;
  Caption := 'Fêmeas cobertas' ;
  KeyFields.Add( 'EZ.KZOO_EVENTO_ZOOTECNICO' ) ;
  Fields.CommaText := Fields.CommaText + ', DE.SYS$DESCRIPTION, EZ.TIPOEVENTO, EZ.DATAEVENTO, AF.NUMERO_LACTACAO' ;
  JoinTables.Add( 'ZOO_EVENTOS_ZOOTECNICOS EZ ON ( EZ.KZOO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )' ) ;
  JoinTables.Add( Format ( 'SYS$TYPES_GETDESCRIPTION( ''%s'', EZ.TIPOEVENTO ) DE ON ( 1=1 )', [ _ST_TIPO_EVENTO_ZOO ] ) ) ;
  Where.Add ( 'AND ( AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA ) ' ) ;
  Where.Add ( 'AND ( EZ.ABORTOPARTO IS NULL )'  ) ;
end;

procedure TSearchFemeaUltimaMonta.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('SYS$DESCRIPTION').DisplayLabel := 'Evento' ;
  AFields.FieldByName('SYS$DESCRIPTION').DisplayWidth := 10 ;
  AFields.FieldByName('DATAEVENTO').DisplayLabel := 'Data evento' ;
  AFields.FieldByName('DATAEVENTO').DisplayWidth := 63 ;
  AFields.FieldByName('BRINCO').DisplayLabel := 'Código' ;
  AFields.FieldByName('BRINCO').DisplayWidth := 100 ;
  AFields.FieldByName('NOMEESTABULO').DisplayLabel := 'Nome Estabulo' ;
  AFields.FieldByName('NOMEESTABULO').DisplayWidth := 128 ;
  AFields.FieldByName('KZOO_EVENTO_ZOOTECNICO').Visible := False  ;
  AFields.FieldByName('TIPOEVENTO').Visible := False  ;
  AFields.FieldByName('NUMERO_LACTACAO').Visible := False  ;
end;

{ TSearchFemeaEmLactacao }

constructor TSearchFemeaEmLactacao.Create;
begin
  inherited;
  Caption := 'Fêmeas em lactação' ;
  Where.Add ( Format ( 'AND ( A.STATUS = %d )', [ _ST_STATUS_FEMEA_VACALACTACAO ] ) ) ;
end;

procedure TSearchFemeaEmLactacao.CustomFormatResult(AFields: TFields);
begin
  inherited;
end;

{ TSearchTarefaExames }

constructor TSearchTarefaExames.Create;
begin
  inherited;
   Caption := 'Tarefas/Exames' ;
   TableName           := 'ZOO_TAREFAS T' ;
   KeyFields.CommaText := 'T.KZOO_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO, T.TIPOTAREFA, T.NOME, T.DESCRICAO' ;
   Where.Add ( Format ( 'T.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID] ) ) ;
end;

procedure TSearchTarefaExames.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Tarefa/Exame' ;
  AFields.FieldByName('TIPOTAREFA').DisplayLabel := 'Tipo' ;
  AFields.FieldByName('TIPOTAREFA').OnGetText := GetTextTipoTarefaExame ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
  AFields.FieldByName('DESCRICAO').Visible := False ;
end;

procedure TSearchTarefaExames.GetTextTipoTarefaExame(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if      Sender.asInteger < 0 then Text := 'Exame'
  else if Sender.asInteger > 0 then Text := 'Tarefa'
  else  Text := '' ;
end;

{ TSearchTarefaExamesAtivo }

constructor TSearchTarefaExamesAtivo.Create;
begin
  inherited;
  Caption := 'Tarefas/Exames - Ativos' ;
  Where.Add ( 'AND T.ATIVO=''T''' ) ;
end;


{ TSearchTarefaExamesDefault }

constructor TSearchTarefaExamesDefault.Create;
begin
  inherited;
   Caption := 'Tarefas/Exames' ;
   TableName           := 'DEF_TAREFAS T' ;
   KeyFields.CommaText := 'T.KDEF_TAREFA' ;
   Fields.CommaText    := 'T.CODIGO, T.TIPOTAREFA, T.NOME, T.DESCRICAO' ;
end;

procedure TSearchTarefaExamesDefault.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('CODIGO').DisplayLabel := 'Tarefa/Exame' ;
  AFields.FieldByName('TIPOTAREFA').DisplayLabel := 'Tipo' ;
  AFields.FieldByName('TIPOTAREFA').OnGetText := GetTextTipoTarefaExame ;
  AFields.FieldByName('NOME').DisplayLabel := 'Descrição' ;
  AFields.FieldByName('DESCRICAO').Visible := False ;
end;

procedure TSearchTarefaExamesDefault.GetTextTipoTarefaExame(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if      Sender.asInteger < 0 then Text := 'Exame'
  else if Sender.asInteger > 0 then Text := 'Tarefa'
  else  Text := '' ;
end;

{ TSearchTarefaExamesDefaultAtivo }

constructor TSearchTarefaExamesDefaultAtivo.Create;
begin
  inherited;
  Caption := 'Tarefas/Exames - Ativos' ;
  Where.Add ( 'T.ATIVO=''T''' ) ;
end;



{ TSearchFemeaUltimaMontaPossivelPrenhez }

constructor TSearchFemeaUltimaMontaPossivelPrenhez.Create;
var
 LExibirSemConfirmacaoPrennhez : boolean ;
begin
  inherited;

  LExibirSemConfirmacaoPrennhez := ParametrosFazenda ( LoggedUser.DomainID ).ExibirPartoSemconfirmacao ;
  if ( LExibirSemConfirmacaoPrennhez ) then
     Where.Add ( 'AND ( EZ.PRENHEZ IS DISTINCT FROM ''F'' )' )
  else
     Where.Add ( 'AND ( EZ.PRENHEZ = ''T'' )' ) ;
end;

{ TSearchMachosEmbriao }

procedure TSearchMachosEmbriao.BRINCO_GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

constructor TSearchMachosEmbriao.Create;
begin
  inherited;
  Caption := 'Machos/Embrião' ;

  TableName           := 'VW_MACHOS_EMBRIOES ME' ;
  KeyFields.CommaText := 'ME.KZOO_ANIMAL' ;
  Fields.CommaText    := 'ME.BRINCO, ME.NOMEESTABULO, ME.STATUS, ME.STATUS_DESCRICAO, ME.DS_ATIVO' ;
  //DisplayFields.Add  ( _BRINCO_ ) ;
  //OrderBy.CommaText := 'BRINCO_' ;
  Where.Add ( Format ( 'ME.KCAD_FAZENDA=''%s''', [ LoggedUser.DomainID ] ) ) ;
  Where.Add ( Format ( 'AND ME.STATUS IN (%d, %d, %d)',
                     [ _ST_STATUS_ANIMAL_EMBRIAO ,
                       _ST_STATUS_ANIMAL_SEMEN,
                       _ST_STATUS_ANIMAL_TOURO ] ) ) ;
  Where.Add ( Format ( ' AND ME.DS_ATIVO=''%s''', [ 'T' ] ) ) ;
  Self.NewFastRegister := SvcMachoNewFastRegister;

end;

procedure TSearchMachosEmbriao.CustomFormatResult(AFields: TFields);
begin
  inherited;
  AFields.FieldByName('BRINCO').DisplayLabel    := 'Código/Brinco' ;
  AFields.FieldByName('BRINCO').DisplayWidth    := 15 ;
  AFields.FieldByName('NOMEESTABULO').DisplayLabel    := 'Nome' ;
  AFields.FieldByName('STATUS').Visible := False ;
  AFields.FieldByName('STATUS_DESCRICAO').DisplayLabel    := 'Categoria' ;
  AFields.FieldByName('STATUS_DESCRICAO').DisplayWidth    := 20 ;
  AFields.FieldByName('DS_ATIVO').Visible := False ;
end;

end.

