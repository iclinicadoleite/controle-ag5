unit UdtmFIN_PlanoContas2;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr,
  Datasnap.Provider, UdtmSYS_BASE,
  CLAg5Types, Tc.Data.SQLExpr ;

type
  TdtmFIN_PlanoContas2 = class(T_dtmBASE)
    dspPlanoContas: TDataSetProvider;
    cdsPlanoContas: TClientDataSet;
    cdsPlanoContasKFIN_PLANOCONTA: TStringField;
    cdsPlanoContasKSYSDOMAIN: TStringField;
    cdsPlanoContasCODIGO: TIntegerField;
    cdsPlanoContasCLASSIFICACAO: TStringField;
    cdsPlanoContasNOME: TStringField;
    cdsPlanoContasATIVO: TStringField;
    cdsPlanoContasANALITICO_SINTETICO: TStringField;
    cdsPlanoContasDEVEDORA_CREDORA: TStringField;
    cdsPlanoContasFLUXOCAIXA: TStringField;
    cdsPlanoContasTIPO_APRD: TStringField;
    cdsPlanoContasFIXA_VARIAVEL: TStringField;
    cdsPlanoContasKMFIN_PLANOCONTA: TStringField;
    cdsPlanoContasKDEF_PLANOCONTA: TStringField;
    sqlPlanoContas: TTcSQLDataSet;
    sqlPlanoContasKFIN_PLANOCONTA: TStringField;
    sqlPlanoContasKSYSDOMAIN: TStringField;
    sqlPlanoContasCODIGO: TIntegerField;
    sqlPlanoContasCLASSIFICACAO: TStringField;
    sqlPlanoContasNOME: TStringField;
    sqlPlanoContasATIVO: TStringField;
    sqlPlanoContasANALITICO_SINTETICO: TStringField;
    sqlPlanoContasDEVEDORA_CREDORA: TStringField;
    sqlPlanoContasFLUXOCAIXA: TStringField;
    sqlPlanoContasTIPO_APRD: TStringField;
    sqlPlanoContasFIXA_VARIAVEL: TStringField;
    sqlPlanoContasKMFIN_PLANOCONTA: TStringField;
    sqlPlanoContasKDEF_PLANOCONTA: TStringField;
    cdsPlanoContasORDENA: TStringField;
    sqlPlanoContasMOVIMENTA_ESTOQUE: TStringField;
    cdsPlanoContasMOVIMENTA_ESTOQUE: TStringField;
    sqlPlanoContasTIPO_PLANOCONTAS: TIntegerField;
    cdsPlanoContasTIPO_PLANOCONTAS: TIntegerField;
    sqlPlanoContasHIDE_BY_USER: TStringField;
    cdsPlanoContasHIDE_BY_USER: TStringField;
    sqlPlanoContasKEQV_PLANOCONTA: TStringField;
    sqlPlanoContasCLASSIFICACAO_EQUIVALENTE: TStringField;
    sqlPlanoContasNOME_EQUIVALENTE: TStringField;
    cdsPlanoContasKEQV_PLANOCONTA: TStringField;
    cdsPlanoContasCLASSIFICACAO_EQUIVALENTE: TStringField;
    cdsPlanoContasNOME_EQUIVALENTE: TStringField;
    procedure cdsPlanoContasNewRecord(DataSet: TDataSet);
    procedure cdsPlanoContasBeforeOpen(DataSet: TDataSet);
    procedure cdsPlanoContasBeforeDelete(DataSet: TDataSet);
    procedure cdsPlanoContasAfterDelete(DataSet: TDataSet);
    procedure cdsPlanoContasBeforeEdit(DataSet: TDataSet);
    procedure cdsPlanoContasNOMEValidate(Sender: TField);
    procedure cdsPlanoContasCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasANALITICO_SINTETICOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasDEVEDORA_CREDORAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasFLUXOCAIXAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPlanoContasTIPO_APRDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPlanoContasFIXA_VARIAVELGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasBeforePost(DataSet: TDataSet);
    procedure cdsPlanoContasCalcFields(DataSet: TDataSet);
    procedure cdsPlanoContasTIPO_APRDChange(Sender: TField);
    procedure dspPlanoContasUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsPlanoContasMOVIMENTA_ESTOQUEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasHIDE_BY_USERGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsPlanoContasCLASSIFICACAO_EQUIVALENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    FpaiExcluido : String;
    Fmask : String;
    FTipo_PlanoContas : integer ;
    procedure GetTipoPlanoContas;
    function getClassificacao(pai: String): String;
//    function PutMask( Valor : string ) : string ;
    { Private declarations }
  public
    { Public declarations }
    procedure AlterMascara ( AMascara : string ) ;
    function GetMascara : string ;
    procedure AlterTipoPlanoContas;
    procedure RestartPlanoContasDefault ;
    procedure AddChild(raiz : boolean) ;
//    procedure AddSibiling ;
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override;
    property Tipo_PlanoContas : integer read FTipo_PlanoContas ;
    procedure SetContaEquivalente ( AKey : String ; AClassificacao, ANomeEquivalente : string ) ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Exceptions, GuidSuppl
     , DataSnap.DSConnect
     
     , CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

{ TrdmdtmFIN_PlanoContas2 }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_PlanoContas2.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  FTipo_PlanoContas := 0 ;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


procedure TdtmFIN_PlanoContas2.OpenTables;
begin
  GetMascara ;
  inherited;
end;

procedure TdtmFIN_PlanoContas2.SetContaEquivalente(AKey,
  AClassificacao, ANomeEquivalente: string);
begin
   if not ( cdsPlanoContas.State in [dsInsert,dsEdit] ) then
      cdsPlanoContas.Edit ;

   cdsPlanoContasCLASSIFICACAO_EQUIVALENTE.asString := AClassificacao ;
   cdsPlanoContasNOME_EQUIVALENTE.asString := ANomeEquivalente ;
   cdsPlanoContasKEQV_PLANOCONTA.asString  := AKey ;
end;

//function TdtmFIN_PlanoContas2.PutMask( Valor : string): string;
//var
//  Aux, Codigo : String;
//  list : TStringList;
//  listMask : TStringList;
//  tamanho, i : integer;
//begin
//  try
//    listMask               := TStringList.Create;
//    listMask.Delimiter     := '.';
//    listMask.DelimitedText := Fmask;
//
//    list               := TStringList.Create;
//    list.Delimiter     := '.';
//    list.DelimitedText := Valor ;
//
//    codigo := '';
//
//    for i := 0 to list.Count - 1 do
//      begin
//        tamanho := length( listMask[ i ] );
//
//        Aux := '0000000000' + list[ i ];
//        Aux := copy( Aux, length( Aux ) - tamanho + 1 , tamanho );
//
//        if Codigo = EmptyStr then
//          Codigo := Aux
//        else
//          Codigo := Codigo + '.' + Aux;
//      end;
//
//    Result := Codigo ;
//  except
//    Result := '' ;
//  end;
//end;

procedure TdtmFIN_PlanoContas2.AddChild(raiz : boolean) ;
var
  ParentKey: Variant;
  devCred, aprd : String;
  key, classificacao : String;
  list, listMask : TStringList;
  ind, i : integer;
begin
  with cdsPlanoContas do
    begin
      if IsEmpty then raiz := True;

      if not IsEmpty then
        begin
          classificacao      := cdsPlanoContasCLASSIFICACAO.AsString;
          list               := TStringList.Create;
          list.Delimiter     := '.';
          list.DelimitedText := classificacao;

          listMask               := TStringList.Create;
          listMask.Delimiter     := '.';
          listMask.DelimitedText := Fmask;

          ind := -1;

          if (list.Count < listMask.Count) then
            ind := list.Count;

          { Quando deve ser completado com zero a direita
          for i := 0 to list.Count - 1 do
            if strtoint(list[i]) <= 0 then
            begin
              ind := i;
              break;
            end;
          }
        end
      else
        ind := 0;

      if ( ind >= 0 ) or raiz then
        begin
          classificacao := '';
          ParentKey     := '' ;

          if ( ind > 0 ) and ( not raiz ) then
            begin
              if not cdsPlanoContasKFIN_PLANOCONTA.isNull then
                 ParentKey := cdsPlanoContasKFIN_PLANOCONTA.asString ;

              devCred := cdsPlanoContasDEVEDORA_CREDORA.AsString;
              aprd    := cdsPlanoContasTIPO_APRD.AsString;

              try
                classificacao             := getClassificacao(ParentKey);
                cdsPlanoContas.BeforeEdit := nil;

                if classificacao <> 'ERROR' then
                  begin
                    cdsPlanoContas.Edit;
                    cdsPlanoContasANALITICO_SINTETICO.AsString := 'S';
                    cdsPlanoContas.Post;
                  end;
              finally
                cdsPlanoContas.BeforeEdit := cdsPlanoContasBeforeEdit;
              end;
            end;

          if classificacao = '' then
            classificacao := getClassificacao(ParentKey);

          if classificacao <> 'ERROR' then
            begin
//              cdsPlanoContas.BeforePost := nil;
              Append;

              cdsPlanoContasKFIN_PLANOCONTA.AsString := GuidSuppl.GuidStr20;
              cdsPlanoContasTIPO_PLANOCONTAS.AsInteger := FTipo_PlanoContas ;

              if ParentKey <> '' then
                 cdsPlanoContasKMFIN_PLANOCONTA.asString := ParentKey ;

              cdsPlanoContasCLASSIFICACAO.asString := getClassificacao(ParentKey)  ;
              cdsPlanoContasCODIGO.AsInteger := 0 ;
              cdsPlanoContasNOME.asString := 'Novo plano de contas';
              cdsPlanoContasATIVO.asString := 'T';
              cdsPlanoContasANALITICO_SINTETICO.asString := 'A'  ;
              cdsPlanoContasDEVEDORA_CREDORA.asString := devCred  ;
              cdsPlanoContasFLUXOCAIXA.asString := 'T';
              cdsPlanoContasMOVIMENTA_ESTOQUE.asString := 'F';
              cdsPlanoContasTIPO_APRD.asString := aprd;

//              cdsPlanoContasFIXA_VARIAVEL.asString := 'F';
//              Post;

//              cdsPlanoContas.BeforePost := cdsPlanoContasBeforePost;

            end
          else
            raise Warning.Create('Não é permitido mais itens nesse nível');

        end
      else
        raise Warning.Create('Não é permitido mais níveis');
    end;


//  ApplyUpdates;
end;

{
procedure TdtmFIN_PlanoContas2.AddSibiling;
var
  ParentKey: Variant;
begin
  with cdsPlanoContas do
  begin
    ParentKey := '' ;
    if not cdsPlanoContasKMFIN_PLANOCONTA.isNull then
       ParentKey := cdsPlanoContasKMFIN_PLANOCONTA.asString ;

    Append;
    if ParentKey <> '' then
       cdsPlanoContasKMFIN_PLANOCONTA.asString := ParentKey ;

    cdsPlanoContasNOME.asString := 'Node '  ;
    Post;
  end;
end;
}


procedure TdtmFIN_PlanoContas2.ApplyUpdates;
begin
  inherited;
//
end;

procedure TdtmFIN_PlanoContas2.RestartPlanoContasDefault;
const
  _RESTART_SEQUENCE_TIPO_PLANOCONTAS =
  'ALTER SEQUENCE TIPO_PLANOCONTAS RESTART WITH %d' ;

  _RESET_APROPRICACAO_PRODUTOS =
            'UPDATE EST_PRODUTOS'
     +#13#10'  SET'
     +#13#10'      KFIN_PLANOCONTA = NULL'
     +#13#10'WHERE'
     +#13#10'  KFIN_PLANOCONTA'
     +#13#10'   NOT IN'
     +#13#10'    ('
     +#13#10'     SELECT'
     +#13#10'       KFIN_PLANOCONTA'
     +#13#10'     FROM'
     +#13#10'       FIN_PLANOCONTAS'
     +#13#10'     WHERE'
     +#13#10'       TIPO_PLANOCONTAS = -3'
     +#13#10'   )' ;


begin
  TTcAbstractDB.GetByAlias('FINANCEIRO')
    .ExecuteDirect(
       Format (
           _RESTART_SEQUENCE_TIPO_PLANOCONTAS
        , [ -3 ]
       )
  ) ;
  TTcAbstractDB.GetByAlias('FINANCEIRO')
    .ExecuteDirect(
      _RESET_APROPRICACAO_PRODUTOS
    ) ;

  FTipo_PlanoContas := -3;
  OpenTables;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasAfterDelete(DataSet: TDataSet);
var
  cds : TClientDataSet;
begin
  cds := TClientDataSet.Create(nil);
  cds.PacketRecords := 0 ;
  cds.CloneCursor(cdsPlanoContas, false, false);
  cds.Filter := 'KMFIN_PLANOCONTA = ''' + FpaiExcluido + '''';
  cds.Filtered := true;

  if cds.RecordCount = 0 then
  begin
    if (cdsPlanoContas.Locate('KFIN_PLANOCONTA', FpaiExcluido, [])) then
    begin
      try
        cdsPlanoContas.BeforeEdit := nil;
        cdsPlanoContas.Edit;
        cdsPlanoContasANALITICO_SINTETICO.AsString := 'A';
        cdsPlanoContas.Post;
      finally
        cdsPlanoContas.BeforeEdit := cdsPlanoContasBeforeEdit;
      end;
      ApplyUpdates;
    end;
  end;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasBeforeDelete(DataSet: TDataSet);
const
   _SQL_RECEITAS = 'DISTINCT R.KFIN_PLANOCONTA FROM FIN_ARECEBER R ' +
   #13#10'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN AND R.KFIN_PLANOCONTA = :KFIN_PLANOCONTA' ;

   _SQL_DESPESA = 'DISTINCT P.KFIN_PLANOCONTA FROM FIN_APAGAR P ' +
   #13#10'WHERE P.KSYS$DOMAIN = :KSYS$DOMAIN AND P.KFIN_PLANOCONTA = :KFIN_PLANOCONTA' ;

var
  cds : TClientDataSet ;
  total : integer;
  p : TParams ;
begin
  if (FTipo_PlanoContas < 0) and (not cdsPlanoContasKDEF_PLANOCONTA.IsNull) then
    raise Warning.Create('Esse plano de conta não pode ser removido.');

  try
    total := 0;

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KSYS$DOMAIN', ptInput ).asString := cdsPlanoContasKSYSDOMAIN.asString ;
    p.CreateParam ( ftString, 'KFIN_PLANOCONTA', ptInput ).asString := cdsPlanoContasKFIN_PLANOCONTA.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_RECEITAS, p ) ;
    total := total + cds.RecordCount;

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KSYS$DOMAIN', ptInput ).asString := cdsPlanoContasKSYSDOMAIN.asString ;
    p.CreateParam ( ftString, 'KFIN_PLANOCONTA', ptInput ).asString := cdsPlanoContasKFIN_PLANOCONTA.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_DESPESA, p ) ;
    total := total + cds.RecordCount;

    if total > 0 then
      raise Warning.Create('Conta contábil com movimentação.'+ #10#13 + 'Não é possível excluir.');

  finally
    p.free ;
    cds.free ;
  end;

  FpaiExcluido := cdsPlanoContasKMFIN_PLANOCONTA.AsString;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasBeforeEdit(DataSet: TDataSet);
begin
//  if (FTipo_PlanoContas < 0) and (not cdsPlanoContasKDEF_PLANOCONTA.IsNull) then
//    raise Warning.Create('Esse plano de conta não pode ser alterado.');
end;

function TdtmFIN_PlanoContas2.GetMascara: string;
begin

   if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    Fmask :=  SvcFinanceiroMascaraPlanoContas.GetMascara
   else
    Fmask :=  _ST_PLANO_CONTAS_MASK ;

   Result := Fmask ;
end;

procedure TdtmFIN_PlanoContas2.GetTipoPlanoContas;
const
  _SQL = 'SELECT GEN_ID( TIPO_PLANOCONTAS, 0 ) AS RESULT FROM RDB$DATABASE' ;
var
  cds : TClientDataSet ;
begin
  if FTipo_PlanoContas <> 0 then
    exit ;
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL ) ;
  FTipo_PlanoContas := cds.Fields[0].AsInteger ;
  if FTipo_PlanoContas = 0 then
     FTipo_PlanoContas := -3 ;
  cds.Free ;
end;

procedure TdtmFIN_PlanoContas2.AlterMascara(AMascara: string);
begin
  if Assigned ( SvcFinanceiroMascaraPlanoContas ) then
    SvcFinanceiroMascaraPlanoContas.SetMascara( AMascara ) ;
  FMask := AMascara ;
  cdsPlanoContas.Close  ;
  OpenTables ;
end;

procedure TdtmFIN_PlanoContas2.AlterTipoPlanoContas;
const
 _EXECUTE_SYS_COPY_PLANOCONTAS =
   'EXECUTE PROCEDURE SYS$COPY_PLANOCONTAS %s, %d, %d' ;

 _RESTART_SEQUENCE_TIPO_PLANOCONTAS =
  'ALTER SEQUENCE TIPO_PLANOCONTAS RESTART WITH %d' ;

 _SELECT_MAIOR_TIPO_PLANOCONTAS =
  'SELECT MAX( TIPO_PLANOCONTAS ) FROM FIN_PLANOCONTAS';
var
  cds: TClientDataSet;
  LNewTipoPlanoContas: integer;
begin
  cds := nil;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(cds, _SELECT_MAIOR_TIPO_PLANOCONTAS);
  if cds.IsEmpty or (cds.Fields[0].isnull) or (cds.Fields[0].AsInteger <= 0)  then
     LNewTipoPlanoContas := 1
  else
     LNewTipoPlanoContas := cds.Fields[0].AsInteger + 1;
  TTcAbstractDB.GetByAlias('FINANCEIRO').ExecuteDirect    ( Format ( _EXECUTE_SYS_COPY_PLANOCONTAS, [ QuotedStr( LoggedUser.DomainID ), -3, LNewTipoPlanoContas ] ) ) ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').ExecuteDirect    ( Format ( _RESTART_SEQUENCE_TIPO_PLANOCONTAS, [LNewTipoPlanoContas]  ) ) ;

  FTipo_PlanoContas := LNewTipoPlanoContas ;
  cdsPlanoContas.Close  ;
  OpenTables ;
  cds.Free;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasBeforeOpen(DataSet: TDataSet);
begin
  GetTipoPlanoContas;
  cdsPlanoContas.Params.ParamByName('KSYS$DOMAIN').asString := LoggedUser.DomainID;
  cdsPlanoContas.Params.ParamByName('TIPO_PLANOCONTAS' ).AsInteger := FTipo_PlanoContas ;
  cdsPlanoContas.IndexFieldNames := 'ORDENA' ;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasBeforePost(DataSet: TDataSet);
var
  FClassificacao : string ;
  cds: TClientDataSet;
begin
//  if cdsPlanoContasFIXA_VARIAVEL.IsNull then
//    raise Warning.Create('Campo Fixa/Variável deve ser preenchido');

  if (FTipo_PlanoContas > 0) and ((cdsPlanoContasCODIGO.IsNull) or (cdsPlanoContasCODIGO.AsInteger < 1)) then
   begin
     cds := nil;
     TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet(
                                   cds,
                                   Format( 'SELECT MAX(CODIGO) FROM FIN_PLANOCONTAS WHERE TIPO_PLANOCONTAS = %d',
                                         [FTipo_PlanoContas]) );
     if (not cds.IsEmpty)  then
        cdsPlanoContasCODIGO.AsInteger := cds.Fields[0].AsInteger + 1;

     if cdsPlanoContasCODIGO.AsInteger < 100 then
        cdsPlanoContasCODIGO.AsInteger := 100;

     cds.Free;
   end;

  FClassificacao := '' ;
  FClassificacao := StringReplace( cdsPlanoContasCLASSIFICACAO.AsString, '.0', '.', [ rfReplaceAll ] );
  FClassificacao := StringReplace( FClassificacao, '.0', '.', [ rfReplaceAll ] );
  cdsPlanoContasCLASSIFICACAO.AsString := FClassificacao ;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasCalcFields(DataSet: TDataSet);
begin
  try
    if not cdsPlanoContasCLASSIFICACAO.IsNull then
      cdsPlanoContasORDENA.AsString := PutMaskPlanoConta( cdsPlanoContasCLASSIFICACAO.AsString );
  except

  end;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasCLASSIFICACAO_EQUIVALENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasANALITICO_SINTETICOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ANALITICO_SINTETICO' ).asString = 'A' then
      Text := 'Analítica'
    else
      Text := 'Sintética';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'T' then
      Text := 'Ativa'
    else
      Text := 'Inativa';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasDEVEDORA_CREDORAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'DEVEDORA_CREDORA' ).asString = 'D' then
      Text := 'Devedora'
    else
      Text := 'Credora';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasFIXA_VARIAVELGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'FIXA_VARIAVEL' ).asString = 'F' then
      Text := 'Fixa'
    else if Sender.DataSet.FieldByName ( 'FIXA_VARIAVEL' ).asString = 'V' then
      Text := 'Variável';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasFLUXOCAIXAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'FLUXOCAIXA' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasHIDE_BY_USERGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    begin
    if Sender.DataSet.FieldByName ( 'HIDE_BY_USER' ).asString = 'T' then
      Text := 'X'
    else
      Text := '';
    end
  else
    Text := Sender.AsString ;
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasMOVIMENTA_ESTOQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'MOVIMENTA_ESTOQUE' ).asString = 'T' then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasTIPO_APRDChange(Sender: TField);
begin
  if ( Sender.AsString = 'R' ) or ( Sender.AsString = 'D' ) then
    cdsPlanoContasFIXA_VARIAVEL.Required := True
  else
    cdsPlanoContasFIXA_VARIAVEL.Required := False ;

  if ( Sender.AsString = 'A') or ( Sender.AsString = 'D' ) then
    cdsPlanoContasDEVEDORA_CREDORA.AsString := 'D'
  else
    cdsPlanoContasDEVEDORA_CREDORA.AsString := 'C';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasTIPO_APRDGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'A' then
      Text := 'Ativo'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'P' then
      Text := 'Passivo'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'D' then
      Text := 'Despesa'
    else if Sender.DataSet.FieldByName ( 'TIPO_APRD' ).asString = 'R' then
      Text := 'Receita'
    else
      Text := '';
end;

procedure TdtmFIN_PlanoContas2.dspPlanoContasUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
  E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  if Pos( 'FOREIGN', E.Message ) > 0 then
    raise Warning.Create( 'Conta contábil ou algum filho contém movimentação.' + #10#13 + 'Não pode ser excluída.' );
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasNewRecord(DataSet: TDataSet);
begin
  self.InitializeKeys ;
  cdsPlanoContasKSYSDOMAIN.asString        := LoggedUser.DomainID;
  cdsPlanoContasANALITICO_SINTETICO.AsString := 'A';
  cdsPlanoContasMOVIMENTA_ESTOQUE.AsString   := 'F';
  cdsPlanoContasHIDE_BY_USER.AsString        := 'F';
end;

procedure TdtmFIN_PlanoContas2.cdsPlanoContasNOMEValidate(Sender: TField);
begin
  if trim( cdsPlanoContasNOME.AsString ) = EmptyStr then
    raise Warning.Create('Campo descrição deve ser preenchido');
end;

function TdtmFIN_PlanoContas2.getClassificacao(pai: String): String;
var
  cds: TCLientDataSet;
  res, codaux : String;
  i, ind, total, tamanho : integer;
  list : TStringList;
  listMask : TStringList;
begin
  res := '';

  cds := TClientDataSet.Create(nil);
  cds.PacketRecords := 0 ;
  cds.CloneCursor(cdsPlanoContas, false, false);

  cds.Locate('KFIN_PLANOCONTA', pai,[]);

  if (pai <> '') then
  begin
    res := cds.FieldByName('CLASSIFICACAO').AsString;
    cds.Filter := 'KMFIN_PLANOCONTA = ''' + pai + '''';
  end;

  cds.Filtered := true;

  // obtendo o código do pai sem estar completado com zero
  if (res = '') then
    ind := 0
  else
  begin
    list := TStringList.Create;
    list.Delimiter := '.';
    list.DelimitedText := res;

    ind := list.Count;
  end;

  {
  res := '';
  for i := 0 to list.Count - 1 do
    if strtoint(list[i]) > 0 then
    begin
      if (i = 0) then
        res := list[i]
      else
        res := res + '.' + list[i];
    end
    else
    begin
      ind := i;
      break;
    end;
  }

  // obter o próximo código para o filho
  total := 0;
  while not cds.Eof do
  begin
    codaux := cds.FieldByName('CLASSIFICACAO').AsString;

    list := TStringList.Create;
    list.Delimiter := '.';
    list.DelimitedText := codaux;

    if (total < strtoint(list[ind])) then
      total := strtoint(list[ind]);

    cds.Next;
  end;
  total := total + 1;

  listMask := TStringList.Create;
  listMask.Delimiter := '.';
  listMask.DelimitedText := FMask;

  tamanho := length(listMask[ind]);

  codaux := '0000000000' + inttostr(total);
  codaux := copy(codaux,  length(codaux)-tamanho+1 , tamanho);

  try
    if strtoint(codaux) = 0 then
      res := 'ERROR'
    else
    begin
      if (res = '') then
        res := inttostr(total)
//        res := codaux
      else
//        res := res + '.' + codaux;
        res := res + '.' + inttostr(total);

      { Completa com zero para direita, conforme a máscara

      for i := ind+1 to listMask.Count - 1 do
        res := res + '.' + listMask[i];
      }
    end;
  except
    res := 'ERROR';
  end;

  Result := res;
end;


end.
