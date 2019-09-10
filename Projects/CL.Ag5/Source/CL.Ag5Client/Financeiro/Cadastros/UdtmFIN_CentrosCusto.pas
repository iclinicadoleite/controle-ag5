unit UdtmFIN_CentrosCusto;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VCL.Dialogs, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Data.SqlExpr, Datasnap.Provider, UdtmSYS_BASE,
  CLAg5Types, Tc.Data.SQLExpr ;

type


  TdtmFIN_CentrosCusto = class(T_dtmBASE)
    cdsCentrosCusto: TClientDataSet;
    dspCentrosCusto: TDataSetProvider;
    sqlCentrosCusto: TTcSQLDataSet;
    sqlCentrosCustoKFIN_CENTROCUSTO: TStringField;
    sqlCentrosCustoKSYSDOMAIN: TStringField;
    sqlCentrosCustoNOME: TStringField;
    sqlCentrosCustoANALITICO_SINTETICO: TStringField;
    sqlCentrosCustoKMFIN_CENTROCUSTO: TStringField;
    cdsCentrosCustoKFIN_CENTROCUSTO: TStringField;
    cdsCentrosCustoKSYSDOMAIN: TStringField;
    cdsCentrosCustoNOME: TStringField;
    cdsCentrosCustoANALITICO_SINTETICO: TStringField;
    cdsCentrosCustoKMFIN_CENTROCUSTO: TStringField;
    sqlCentrosCustoKDEF_CENTROCUSTO: TStringField;
    cdsCentrosCustoKDEF_CENTROCUSTO: TStringField;
    sqlCentrosCustoCODIGO: TIntegerField;
    sqlCentrosCustoCLASSIFICACAO: TStringField;
    cdsCentrosCustoCODIGO: TIntegerField;
    cdsCentrosCustoCLASSIFICACAO: TStringField;
    sqlCentrosCustoATIVO: TStringField;
    cdsCentrosCustoATIVO: TStringField;
    sqlCentrosCustoDATA_ENCERRAMENTO: TSQLTimeStampField;
    sqlCentrosCustoSYSDI: TSQLTimeStampField;
    cdsCentrosCustoDATA_ENCERRAMENTO: TSQLTimeStampField;
    cdsCentrosCustoSYSDI: TSQLTimeStampField;
    cdsCentrosCustoORDENA: TStringField;
    sqlCentrosCustoSYSORIGIN_TYPE: TIntegerField;
    cdsCentrosCustoSYSORIGIN_TYPE: TIntegerField;
    procedure cdsCentrosCustoNewRecord(DataSet: TDataSet);
    procedure cdsCentrosCustoBeforeOpen(DataSet: TDataSet);
    procedure cdsCentrosCustoAfterDelete(DataSet: TDataSet);
    procedure cdsCentrosCustoBeforeDelete(DataSet: TDataSet);
    procedure cdsCentrosCustoBeforeEdit(DataSet: TDataSet);
    procedure cdsCentrosCustoNOMEValidate(Sender: TField);
    procedure cdsCentrosCustoCLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCentrosCustoANALITICO_SINTETICOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsCentrosCustoSYSDIGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCentrosCustoATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCentrosCustoCalcFields(DataSet: TDataSet);
    procedure cdsCentrosCustoKDEF_CENTROCUSTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    Fmask : String;
    FpaiExcluido : String;
    function getClassificacao(pai: String): String;
    { Private declarations }
  public
    { Public declarations }
    procedure AddChild(raiz : boolean) ;
    procedure OpenTables ; override ;
    procedure SetPecuariaLeite ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, Exceptions, GuidSuppl
     , CL.Ag5.NSMsgs
     , DataSnap.DSConnect
      ;

{$R *.dfm}

{ TrdmdtmFIN_CentrosCusto }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmFIN_CentrosCusto.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;

{$ENDIF}

const
  _DEF_PECUARIA_LEITE = 'La;m;0+smOQ+4RnK^6as' ;

procedure TdtmFIN_CentrosCusto.OpenTables;
begin
  Fmask := _ST_CENTROS_CUSTO_MASK ;
  inherited;
end;





procedure TdtmFIN_CentrosCusto.SetPecuariaLeite;
var
 p : TParams ;
 LKeyCC : string ;
begin

  LKeyCC :=  cdsCentrosCustoKFIN_CENTROCUSTO.asString ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KSYS$DOMAIN',      ptInput ).asString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'KFIN_CENTROCUSTO', ptInput ).asString := LKeyCC ;
  p.CreateParam( ftString, 'CC_PECUARIALEITE', ptInput ).asString := _DEF_PECUARIA_LEITE ;

  sqlCentrosCusto.sqlConnection.Execute(
             'UPDATE FIN_CENTROSCUSTO'
      +#13#10'   SET KDEF_CENTROCUSTO = NULL'
      +#13#10' WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      +#13#10'   AND KFIN_CENTROCUSTO <> :KFIN_CENTROCUSTO'
      +#13#10'   AND KDEF_CENTROCUSTO = :CC_PECUARIALEITE', p ) ;

  p.Clear ;

  p.CreateParam( ftString, 'CC_PECUARIALEITE', ptInput ).asString := _DEF_PECUARIA_LEITE ;
  p.CreateParam( ftString, 'KSYS$DOMAIN',      ptInput ).asString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'KFIN_CENTROCUSTO', ptInput ).asString := LKeyCC ;

  sqlCentrosCusto.sqlConnection.Execute(
             'UPDATE FIN_CENTROSCUSTO'
      +#13#10'   SET KDEF_CENTROCUSTO = :CC_PECUARIALEITE'
      +#13#10' WHERE KSYS$DOMAIN = :KSYS$DOMAIN'
      +#13#10'   AND KFIN_CENTROCUSTO = :KFIN_CENTROCUSTO'
      +#13#10'   AND KDEF_CENTROCUSTO IS NULL', p ) ;

  p.free ;

  cdsCentrosCusto.Close ;
  cdsCentrosCusto.Open ;

  cdsCentrosCusto.Locate('KFIN_CENTROCUSTO', LKeyCC, [] ) ;

end;


procedure TdtmFIN_CentrosCusto.AddChild(raiz : boolean);
var
  ParentKey: Variant;
  key, classificacao : String;
  list, listMask : TStringList;
  ind, i : integer;
begin
  with cdsCentrosCusto do
  begin

    if cdsCentrosCusto.IsEmpty then
      raiz := true;

    if not cdsCentrosCusto.IsEmpty then
    begin
      classificacao := cdsCentrosCustoCLASSIFICACAO.AsString;
      list := TStringList.Create;
      list.Delimiter := '.';
      list.DelimitedText := classificacao;

      listMask := TStringList.Create;
      listMask.Delimiter := '.';
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
    else ind := 0;

    if (ind >= 0) or raiz then
    begin

      classificacao := '';

      ParentKey := '' ;
      if (ind > 0) and (not raiz) then
      begin
        if not cdsCentrosCustoKFIN_CENTROCUSTO.isNull then
           ParentKey := cdsCentrosCustoKFIN_CENTROCUSTO.asString ;

        try
          classificacao := getClassificacao(ParentKey);
          cdsCentrosCusto.BeforeEdit := nil;

          if classificacao <> 'ERROR' then
          begin
            cdsCentrosCusto.Edit;
            cdsCentrosCustoANALITICO_SINTETICO.AsString := 'S';
            cdsCentrosCusto.Post;
          end;
        finally
          cdsCentrosCusto.BeforeEdit := cdsCentrosCustoBeforeEdit;
        end;
      end;

      if classificacao = '' then
        classificacao := getClassificacao(ParentKey);

      if classificacao <> 'ERROR' then
      begin

        Append;

        cdsCentrosCustoKFIN_CENTROCUSTO.AsString := GuidSuppl.GuidStr20;

        if ParentKey <> '' then
           cdsCentrosCustoKMFIN_CENTROCUSTO.asString := ParentKey ;

        cdsCentrosCustoCLASSIFICACAO.asString := classificacao ;
        cdsCentrosCustoCODIGO.AsInteger := 0 ;
        cdsCentrosCustoATIVO.AsString := 'T' ;
        cdsCentrosCustoNOME.asString := 'Centro de Custo';
        cdsCentrosCustoANALITICO_SINTETICO.asString := 'A'  ;
        Post;

      end
      else
        raise Warning.Create('Não é permitido mais itens nesse nível');

    end
    else
      raise Warning.Create('Não é permitido mais níveis');
  end;
//  ApplyUpdates;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoAfterDelete(DataSet: TDataSet);
var
  cds : TClientDataSet;
begin
  cds := TClientDataSet.Create(nil);
  cds.PacketRecords := 0 ;
  cds.CloneCursor(cdsCentrosCusto, false, false);
  cds.Filter := 'KMFIN_CENTROCUSTO = ''' + FpaiExcluido + '''';
  cds.Filtered := true;

  if cds.RecordCount = 0 then
  begin
    if (cdsCentrosCusto.Locate('KFIN_CENTROCUSTO', FpaiExcluido, [])) then
    begin
      try
        cdsCentrosCusto.BeforeEdit := nil;
        cdsCentrosCusto.Edit;
        cdsCentrosCustoANALITICO_SINTETICO.AsString := 'A';
        cdsCentrosCusto.Post;
      finally
        cdsCentrosCusto.BeforeEdit := cdsCentrosCustoBeforeEdit;
      end;
      ApplyUpdates;
      TCLAg5NSMsgEVT_CentrosCusto.CreateAndDispatch( self ) ;
    end;
  end;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoANALITICO_SINTETICOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ANALITICO_SINTETICO' ).asString = 'A' then
      Text := 'Analítica'
    else
      Text := 'Sintética';
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'ATIVO' ).asString = 'T' then
      Text := 'Ativo'
    else
      Text := 'Inativo';
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoBeforeDelete(DataSet: TDataSet);
const
   _SQL_CENTRO_CUSTOS = 'DISTINCT A.KFIN_CENTROCUSTO FROM FIN_APROPRIACAO A ' +
                        'WHERE A.KFIN_CENTROCUSTO = :KFIN_CENTROCUSTO ' ;

   _SQL_CENTRO_FILHO =  'DISTINCT A.KFIN_CENTROCUSTO FROM FIN_APROPRIACAO A ' +
                        'JOIN FIN_CENTROSCUSTO C ON C.KFIN_CENTROCUSTO = A.KFIN_CENTROCUSTO ' +
                        'WHERE C.KMFIN_CENTROCUSTO = :KFIN_CENTROCUSTO ';
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  if cdsCentrosCustoSYSORIGIN_TYPE.asInteger = 2 then
    raise Warning.Create( 'Tranferência incluida via sincronismo.' + #10#13 + 'Não pode ser excluída.' );

  if not cdsCentrosCustoKDEF_CENTROCUSTO.IsNull then
    raise Warning.Create('Esse centro de custo não pode ser removido. ');

  try
    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KFIN_CENTROCUSTO', ptInput ).asString := cdsCentrosCustoKFIN_CENTROCUSTO.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_CENTRO_CUSTOS, p ) ;

    if cds.RecordCount > 0 then
      raise Warning.Create('Centro de custo com movimentação.'+ #10#13 + 'Não é possível excluir.');

    cds := nil ;
    p := TParams.Create ;
    p.CreateParam ( ftString, 'KFIN_CENTROCUSTO', ptInput ).asString := cdsCentrosCustoKFIN_CENTROCUSTO.asString ;
    TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SQL_CENTRO_FILHO, p ) ;

    if cds.RecordCount > 0 then
      raise Warning.Create('Centro de custo com algum subitem com movimentação.'+ #10#13 + 'Não é possível excluir.');

  finally
    p.free ;
    cds.free ;
  end;


  FpaiExcluido := cdsCentrosCustoKMFIN_CENTROCUSTO.AsString;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoBeforeEdit(DataSet: TDataSet);
begin
  if not cdsCentrosCustoKDEF_CENTROCUSTO.IsNull then
    raise Warning.Create('Esse centro de custo não pode ser alterado.');
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoBeforeOpen(DataSet: TDataSet);
begin
   cdsCentrosCusto.Params.ParamByName('KSYS$DOMAIN').asString := LoggedUser.DomainID;
   cdsCentrosCusto.IndexFieldNames := 'ORDENA' ;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoCalcFields(DataSet: TDataSet);
begin
  if not cdsCentrosCustoCLASSIFICACAO.IsNull then
    cdsCentrosCustoORDENA.AsString := PutMaskCentroCusto( cdsCentrosCustoCLASSIFICACAO.AsString ) ;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoCLASSIFICACAOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
//var
//  aux, codigo : String;
//  list : TStringList;
//  listMask : TStringList;
//  tamanho, i : integer;
begin
  if (DisplayText) then
//  begin
    Text := PutMaskCentroCusto( Sender.AsString );
//    try
//      listMask := TStringList.Create;
//      listMask.Delimiter := '.';
//      listMask.DelimitedText := Fmask;
//
//      list := TStringList.Create;
//      list.Delimiter := '.';
//      list.DelimitedText := Sender.AsString;
//
//      codigo := '';
//      for i := 0 to list.Count - 1 do
//      begin
//        tamanho := length(listMask[i]);
//
//        aux := '0000000000' + list[i];
//        aux := copy(aux,  length(aux)-tamanho+1 , tamanho);
//
//        if codigo = EmptyStr then
//          codigo := aux
//        else
//          codigo := codigo + '.' + aux;
//      end;
//
//      Text := codigo;
//
//    except
//      Text := Sender.AsString;
//    end;
//  end;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoKDEF_CENTROCUSTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.asString  = _DEF_PECUARIA_LEITE then
     Text := 'X'
  else
     Text := '' ;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoNewRecord(DataSet: TDataSet);
begin
  self.InitializeKeys ;
  cdsCentrosCustoKSYSDOMAIN.asString := LoggedUser.DomainID ;
  cdsCentrosCustoSYSORIGIN_TYPE.asInteger := 0 ;
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoNOMEValidate(Sender: TField);
begin
  if trim( cdsCentrosCustoNOME.AsString ) = EmptyStr then
    raise Warning.Create('Campo descrição deve ser preenchido');
end;

procedure TdtmFIN_CentrosCusto.cdsCentrosCustoSYSDIGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime);
end;

function TdtmFIN_CentrosCusto.getClassificacao(pai: String): String;
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
  cds.CloneCursor(cdsCentrosCusto, false, false);

  cds.Locate('KFIN_CENTROCUSTO', pai,[]);

  if (pai <> '') then
  begin
    res := cds.FieldByName('CLASSIFICACAO').AsString;
    cds.Filter := 'KMFIN_CENTROCUSTO = ''' + pai + '''';
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
  listMask.DelimitedText := Fmask;

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
        res := res + '.' + inttostr(total);
//        res := res + '.' + codaux;

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
