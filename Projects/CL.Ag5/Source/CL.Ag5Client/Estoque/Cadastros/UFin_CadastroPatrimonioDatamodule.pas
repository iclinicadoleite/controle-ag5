unit UFin_CadastroPatrimonioDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Datasnap.Provider, DBClient, Tc.Data.SQLExpr ;

type
  TFin_CadastroPatrimonioDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstCadPatrimonio: TClientDataSet;
    cdsCadPatrimonio: TClientDataSet;
    dspLstCadPatrimonio: TDataSetProvider;
    dspCadPatrimonio: TDataSetProvider;
    sqlLstCadPatrimonio: TTcSQLDataSet;
    sqlCadPatrimonio: TTcSQLDataSet;
    dtsLstCadPatrimonio: TDataSource;
    sqlLstCadPatrimonioKCAD_PATRIMONIO: TStringField;
    sqlLstCadPatrimonioKSYSDOMAIN: TStringField;
    sqlLstCadPatrimonioCODIGO: TStringField;
    sqlLstCadPatrimonioDESCRICAO: TStringField;
    sqlLstCadPatrimonioDATA_COMPRA: TSQLTimeStampField;
    sqlLstCadPatrimonioATIVO: TStringField;
    sqlLstCadPatrimonioVALOR_UNITARIO: TFloatField;
    sqlLstCadPatrimonioOBS: TMemoField;
    cdsLstCadPatrimonioKCAD_PATRIMONIO: TStringField;
    cdsLstCadPatrimonioKSYSDOMAIN: TStringField;
    cdsLstCadPatrimonioCODIGO: TStringField;
    cdsLstCadPatrimonioDESCRICAO: TStringField;
    cdsLstCadPatrimonioDATA_COMPRA: TSQLTimeStampField;
    cdsLstCadPatrimonioATIVO: TStringField;
    cdsLstCadPatrimonioVALOR_UNITARIO: TFloatField;
    cdsLstCadPatrimonioOBS: TMemoField;
    sqlCadPatrimonioKCAD_PATRIMONIO: TStringField;
    sqlCadPatrimonioKSYSDOMAIN: TStringField;
    sqlCadPatrimonioCODIGO: TStringField;
    sqlCadPatrimonioDESCRICAO: TStringField;
    sqlCadPatrimonioDATA_COMPRA: TSQLTimeStampField;
    sqlCadPatrimonioATIVO: TStringField;
    sqlCadPatrimonioVALOR_UNITARIO: TFloatField;
    sqlCadPatrimonioOBS: TMemoField;
    cdsCadPatrimonioKCAD_PATRIMONIO: TStringField;
    cdsCadPatrimonioKSYSDOMAIN: TStringField;
    cdsCadPatrimonioCODIGO: TStringField;
    cdsCadPatrimonioDESCRICAO: TStringField;
    cdsCadPatrimonioDATA_COMPRA: TSQLTimeStampField;
    cdsCadPatrimonioATIVO: TStringField;
    cdsCadPatrimonioVALOR_UNITARIO: TFloatField;
    cdsCadPatrimonioOBS: TMemoField;
    cdsDepreciacao: TClientDataSet;
    sqlDepreciacao: TTcSQLDataSet;
    dtsSqlCadPatrimonio: TDataSource;
    cdsCadPatrimoniosqlDepreciacao: TDataSetField;
    cdsDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO: TStringField;
    cdsDepreciacaoKCAD_PATRIMONIO: TStringField;
    cdsDepreciacaoDATA: TSQLTimeStampField;
    cdsDepreciacaoVALOR: TFloatField;
    sqlLstCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    sqlLstCadPatrimonioVALOR_FINAL: TFloatField;
    sqlLstCadPatrimonioVIDA_UTIL: TIntegerField;
    cdsLstCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    cdsLstCadPatrimonioVALOR_FINAL: TFloatField;
    cdsLstCadPatrimonioVIDA_UTIL: TIntegerField;
    sqlCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    sqlCadPatrimonioVALOR_FINAL: TFloatField;
    sqlCadPatrimonioVIDA_UTIL: TIntegerField;
    cdsCadPatrimonioDATA_IMOBILIZADO: TSQLTimeStampField;
    cdsCadPatrimonioVALOR_FINAL: TFloatField;
    cdsCadPatrimonioVIDA_UTIL: TIntegerField;
    sqlLstCadPatrimonioQUANTIDADE: TIntegerField;
    cdsLstCadPatrimonioQUANTIDADE: TIntegerField;
    sqlCadPatrimonioQUANTIDADE: TIntegerField;
    cdsCadPatrimonioQUANTIDADE: TIntegerField;
    cdsLstCadPatrimonioVALOR_TOTAL: TCurrencyField;
    cdsCadPatrimonioVALOR_TOTAL: TCurrencyField;
    sqlDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO: TStringField;
    sqlDepreciacaoKCAD_PATRIMONIO: TStringField;
    sqlDepreciacaoDATA: TSQLTimeStampField;
    sqlDepreciacaoVALOR: TFloatField;
    sqlDepreciacaoVALOR_PATRIMONIO: TFloatField;
    cdsDepreciacaoVALOR_PATRIMONIO: TFloatField;
    sqlApropriacao: TTcSQLDataSet;
    sqlApropriacaoKFIN_APROPRIACAO: TStringField;
    sqlApropriacaoKFIN_CENTROCUSTO: TStringField;
    sqlApropriacaoCODIGO: TIntegerField;
    sqlApropriacaoCLASSIFICACAO: TStringField;
    sqlApropriacaoNOME: TStringField;
    sqlApropriacaoPORCENTAGEM: TFloatField;
    cdsApropriacao: TClientDataSet;
    cdsApropriacaoKFIN_APROPRIACAO: TStringField;
    cdsApropriacaoKFIN_CENTROCUSTO: TStringField;
    cdsApropriacaoCODIGO: TIntegerField;
    cdsApropriacaoCLASSIFICACAO: TStringField;
    cdsApropriacaoNOME: TStringField;
    cdsApropriacaoPORCENTAGEM: TFloatField;
    cdsApropriacaoTOTAL_PORCENTAGEM: TAggregateField;
    sqlCadPatrimonioKCAD_UNIDADE: TStringField;
    sqlCadPatrimonioUNIDADE: TStringField;
    cdsCadPatrimonioKCAD_UNIDADE: TStringField;
    cdsCadPatrimonioUNIDADE: TStringField;
    cdsLstUnidades: TClientDataSet;
    sqlLstUnidades: TTcSQLDataSet;
    dspLstUnidades: TDataSetProvider;
    sqlLstUnidadesKCAD_TIPOS: TStringField;
    sqlLstUnidadesDESCRICAO: TStringField;
    cdsLstUnidadesKCAD_TIPOS: TStringField;
    cdsLstUnidadesDESCRICAO: TStringField;
    cdsCadPatrimonioDESC_UNIDADE: TStringField;
    sqlCadPatrimonioDATA_BAIXA: TSQLTimeStampField;
    cdsCadPatrimonioDATA_BAIXA: TSQLTimeStampField;
    sqlCadPatrimonioKFIN_PLANOCONTA: TStringField;
    sqlCadPatrimonioDESCR_PC_NOME: TStringField;
    sqlCadPatrimonioDESCR_PC_CODIGO: TIntegerField;
    sqlCadPatrimonioDESCR_PC_CLASSIFICACAO: TStringField;
    sqlCadPatrimonioDESCR_PC_TIPO_APRD: TStringField;
    cdsCadPatrimonioKFIN_PLANOCONTA: TStringField;
    cdsCadPatrimonioDESCR_PC_NOME: TStringField;
    cdsCadPatrimonioDESCR_PC_CODIGO: TIntegerField;
    cdsCadPatrimonioDESCR_PC_CLASSIFICACAO: TStringField;
    cdsCadPatrimonioDESCR_PC_TIPO_APRD: TStringField;
    cdsCadPatrimoniosqlApropriacao: TDataSetField;
    sqlApropriacaoTABLENAME: TStringField;
    sqlApropriacaoTABLEKEY: TStringField;
    cdsApropriacaoTABLENAME: TStringField;
    cdsApropriacaoTABLEKEY: TStringField;
    sqlCadPatrimonioKFIN_CATEGORIA: TStringField;
    sqlCadPatrimonioNOMECATEGORIA: TStringField;
    cdsCadPatrimonioKFIN_CATEGORIA: TStringField;
    cdsCadPatrimonioNOMECATEGORIA: TStringField;
    sqlCadPatrimonioKFIN_SETOR: TStringField;
    sqlCadPatrimonioNOMESETOR: TStringField;
    cdsCadPatrimonioKFIN_SETOR: TStringField;
    cdsCadPatrimonioNOMESETOR: TStringField;
    cdsLstCadPatrimonioTOTAL_PATRIMONIO: TAggregateField;
    sqlLstCadPatrimonioNOMECATEGORIA: TStringField;
    cdsLstCadPatrimonioNOMECATEGORIA: TStringField;
    sqlLstCadPatrimonioCODIGO_: TStringField;
    cdsLstCadPatrimonioCODIGO_: TStringField;
    procedure cdsLstCadPatrimonioNewRecord(DataSet: TDataSet);
    procedure cdsCadPatrimonioNewRecord(DataSet: TDataSet);
    procedure cdsLstCadPatrimonioBeforeOpen(DataSet: TDataSet);
    procedure cdsCadPatrimonioAfterInsert(DataSet: TDataSet);
    procedure cdsDepreciacaoNewRecord(DataSet: TDataSet);
    procedure cdsLstCadPatrimonioCalcFields(DataSet: TDataSet);
    procedure cdsCadPatrimonioCalcFields(DataSet: TDataSet);
    procedure cdsCadPatrimonioKCAD_UNIDADEChange(Sender: TField);
    procedure cdsLstUnidadesBeforeOpen(DataSet: TDataSet);
    procedure cdsLstCadPatrimonioATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsDepreciacaoDESCR_PC_CLASSIFICACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsCadPatrimonioNOMECATEGORIASetText(Sender: TField;
      const Text: string);
    procedure cdsCadPatrimonioNOMESETORSetText(Sender: TField;
      const Text: string);
    procedure cdsCadPatrimonioDESCR_PC_NOMESetText(Sender: TField;
      const Text: string);
    procedure cdsApropriacaoNewRecord(DataSet: TDataSet);
    procedure cdsCadPatrimonioDATA_COMPRAChange(Sender: TField);
    procedure cdsCadPatrimonioBeforePost(DataSet: TDataSet);
    procedure cdsCadPatrimonioKFIN_PLANOCONTAValidate(Sender: TField);
    procedure cdsCadPatrimonioVALOR_UNITARIOValidate(Sender: TField);
  private
    { Private declarations }
    FKBenfeitorias            :String;
    FKMaquinas_esquipamentos  :String;
    FKAnimais_matrizes        :String;
    FKAnimais_novilhas        :String;
    FKTerra                   :String;
    FShowInativos: Boolean;
    FK_PLANODEPRECIACAO : string ;
    FNomePlanoDepreciacao : string;
    FCodigoPlanoDepreciacao : string  ;
    FClassificacaoPlanoDepreciacao : string;
    procedure SetParams ;
    procedure InitPlanoContaDepreciacao;
    procedure InitCategorias;
  public
    { Public declarations }
    procedure ApplyUpdates ; override ;
    procedure RemoveItem;
    procedure OpenTables; override;
    procedure gerarDepreciacao;
    procedure SetFilter(ShowInativos: Boolean);
    procedure RefreshList ; override ;
    procedure ValidaCampos;
    procedure SetCategoria ( AKey : String ; ANomeCategoria : string ) ;
    procedure SetSetor ( AKey : String ; ANomeSetor : string ) ;
    procedure CheckCentroCustoPadrao() ;
    constructor Create ( AOwner : TComponent ) ;override ;
    property KBenfeitorias            :String read FKBenfeitorias;
    property KMaquinas_esquipamentos  :String read FKMaquinas_esquipamentos;
    property KAnimais_matrizes        :String read FKAnimais_matrizes;
    property KAnimais_novilhas        :String read FKAnimais_novilhas ;
    property KTerra                   :String read FKTerra ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBFinanceiro, UDBEntidades, Exceptions, GuidSuppl, Data.SQLTimSt,
  CDSSuppl,
  CLAg5SvcFinanceiroApropriacao,
 DateUtils
     , DataSnap.DSConnect
       ;

{$R *.dfm}


{ TrdmFin_CadastroPatrimonioDatamodule }

{$IFDEF _DSServer}
{$ELSE}

constructor TFin_CadastroPatrimonioDatamodule.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('FINANCEIRO').Connection ) ;
end;
{$ENDIF}


{ TdtmCustomListaFicha }

procedure TFin_CadastroPatrimonioDatamodule.OpenTables;
begin
  inherited;
  InitPlanoContaDepreciacao;
  InitCategorias;
  cdsLstUnidades.Open;
end;

procedure TFin_CadastroPatrimonioDatamodule.CheckCentroCustoPadrao;
begin
  if ( cdsCadPatrimonioKFIN_PLANOCONTA.asString <> '' )
    and cdsApropriacao.IsEmpty then
  begin
    TCDSSuppl.PostIfNeed ( cdsCadPatrimonio ) ;
    SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( cdsApropriacao )
  end;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsLstCadPatrimonioATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if ( Sender.DataSet.FieldByName ( 'ATIVO' ).AsString = 'F' ) then
      Text := 'Inativo'
    else  if ( Sender.DataSet.FieldByName ( 'ATIVO' ).AsString = 'T' ) then
      Text := 'Ativo';
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsLstCadPatrimonioBeforeOpen(DataSet: TDataSet);
begin
  cdsLstCadPatrimonio.Params.ParamByName('KSYS$DOMAIN').AsString := LoggedUser.DomainID;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsLstCadPatrimonioCalcFields(DataSet: TDataSet);
begin
  cdsLstCadPatrimonioVALOR_TOTAL.AsFloat := cdsLstCadPatrimonioQUANTIDADE.AsFloat * cdsLstCadPatrimonioVALOR_UNITARIO.AsFloat;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsLstCadPatrimonioNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsLstUnidadesBeforeOpen(DataSet: TDataSet);
begin
   cdsLstUnidades.Params.ParamByName( 'KSYS$DOMAIN' ).asString := LoggedUser.DomainID;
end;

procedure TFin_CadastroPatrimonioDatamodule.InitCategorias;
const
  SELECT_CATEGORIAS  =
             'SELECT'
      +#13#10'   KFIN_PLANOCONTA'
      +#13#10' , NOME'
      +#13#10' , KDEF_PLANOCONTA'
      +#13#10'FROM FIN_PLANOCONTAS'
      +#13#10'WHERE'
      +#13#10'    KDEF_PLANOCONTA in (''%s'',''%s'',''%s'',''%s'', ''%s'')'
      +#13#10' AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;

  DEF_BENFEITORIAS           = 'orK!Ml.3O9XP@UX}gEw$';
  DEF_MAQUINAS_ESQUIPAMENTOS = '+gWqB0XWT1]i|.4}K7^(';
  DEF_ANIMAIS_MATRIZES       = '7l[IcqylG4VuGsoj)q^c';
  DEF_ANIMAIS_NOVILHAS       = 'qTA]t#w`yM^1=JSlBlvf';
  DEF_TERRA                  = 'yCJE;HxN;(T5nGl1.b$A';
  (* Plano de contas antigo
  DEF_BENFEITORIAS           = 'vIe137=02RL92;rQANca';
  DEF_MAQUINAS_ESQUIPAMENTOS = 'Mu3M-?(RENP@=UQbG)76';
  DEF_ANIMAIS_MATRIZES       = 'a5[mC8PcT^T|K*7q8LZp';
  DEF_ANIMAIS_NOVILHAS       = 'kQKUSmu`5o]pgpIMTr@Z';
  DEF_TERRA                  = 'X`55vXNwbFT=)u[g:YLA';
  *)
var
  cds : TClientDataSet ;
begin
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds,
                                        Format(SELECT_CATEGORIAS,[DEF_BENFEITORIAS,
                                                                  DEF_MAQUINAS_ESQUIPAMENTOS,
                                                                  DEF_ANIMAIS_MATRIZES,
                                                                  DEF_ANIMAIS_NOVILHAS,
                                                                  DEF_TERRA]) ) ;
  if cds.Locate('KDEF_PLANOCONTA',DEF_BENFEITORIAS,[]) then
    FKBenfeitorias    := cds.FieldByName('KFIN_PLANOCONTA').AsString;

  if cds.Locate('KDEF_PLANOCONTA',DEF_MAQUINAS_ESQUIPAMENTOS,[]) then
    FKMaquinas_esquipamentos    := cds.FieldByName('KFIN_PLANOCONTA').AsString;

  if cds.Locate('KDEF_PLANOCONTA',DEF_ANIMAIS_MATRIZES,[]) then
    FKAnimais_matrizes    := cds.FieldByName('KFIN_PLANOCONTA').AsString;

  if cds.Locate('KDEF_PLANOCONTA',DEF_ANIMAIS_NOVILHAS,[]) then
    FKAnimais_novilhas    := cds.FieldByName('KFIN_PLANOCONTA').AsString;

  if cds.Locate('KDEF_PLANOCONTA',DEF_TERRA,[]) then
    FKTerra    := cds.FieldByName('KFIN_PLANOCONTA').AsString;

  cds.Free;

end;

procedure TFin_CadastroPatrimonioDatamodule.InitPlanoContaDepreciacao;
const
 _SELECT_PLANO_DEPRECIACAO =
           'SELECT'
    +#13#10'  KFIN_PLANOCONTA, CODIGO, CLASSIFICACAO, NOME'
    +#13#10'FROM FIN_PLANOCONTAS'
    +#13#10'WHERE KDEF_PLANOCONTA = ''0SZ[Rh;TMC[5l*N`$TRJ'''
    +#13#10'  AND TIPO_PLANOCONTAS = COALESCE ( NULLIF( GEN_ID( TIPO_PLANOCONTAS, 0), 0 ), -3 )' ;
var
  cds : TClientDataSet ;
begin
  cds := nil ;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet ( cds, _SELECT_PLANO_DEPRECIACAO ) ;
  FK_PLANODEPRECIACAO := cds.FieldByName( 'KFIN_PLANOCONTA' ).asString ;
  FNomePlanoDepreciacao          := cds.FieldByName('NOME').AsString;
  FCodigoPlanoDepreciacao        := cds.FieldByName('CODIGO').AsString;
  FClassificacaoPlanoDepreciacao := cds.FieldByName('CLASSIFICACAO').AsString;
  cds.Free ;
end;


procedure TFin_CadastroPatrimonioDatamodule.ApplyUpdates;
begin
  if ( cdsCadPatrimonioKFIN_PLANOCONTA.AsString.Trim <> '' ) then
    if SvcFinanceiroApropriacaoDefault.NeedCC ( cdsCadPatrimonioKFIN_PLANOCONTA.AsString ) then
      if cdsApropriacao.IsEmpty then
          raise Warning.Create('é necessário informar ao menos um centro de custos.');

  inherited;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsApropriacaoNewRecord(
  DataSet: TDataSet);
begin
  GetKey( cdsApropriacaoKFIN_APROPRIACAO );
  cdsApropriacaoTABLENAME.AsString := 'CAD_PATRIMONIOS';
  cdsApropriacaoTABLEKEY.AsString  := cdsCadPatrimonioKCAD_PATRIMONIO.AsString;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioAfterInsert(DataSet: TDataSet);
begin
  if (cdsLstCadPatrimonio.IsEmpty) and not(cdsLstCadPatrimonio.State in [dsInsert, dsEdit]) then
    cdsLstCadPatrimonio.Append;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioBeforePost(
  DataSet: TDataSet);
begin
  if cdsCadPatrimonioVIDA_UTIL.IsNull then
    cdsCadPatrimonioVIDA_UTIL.AsFloat := 0;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioCalcFields(DataSet: TDataSet);
begin
  cdsCadPatrimonioVALOR_TOTAL.AsFloat := cdsCadPatrimonioQUANTIDADE.AsFloat * cdsCadPatrimonioVALOR_UNITARIO.AsFloat;
  if cdsCadPatrimonioVALOR_TOTAL.AsFloat < 0 then
    cdsCadPatrimonioVALOR_TOTAL.AsFloat := 0;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioDATA_COMPRAChange(
  Sender: TField);
begin
  if cdsCadPatrimonioDATA_IMOBILIZADO.IsNull then
     cdsCadPatrimonioDATA_IMOBILIZADO.AsVariant := cdsCadPatrimonioDATA_COMPRA.AsVariant;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioDESCR_PC_NOMESetText(
  Sender: TField; const Text: string);
begin

  with cdsApropriacao do
    begin
      First;
      while not Eof do
        Delete;
    end;

  cdsCadPatrimonioKFIN_PLANOCONTA.Clear;
  Sender.asString := Text ;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioKCAD_UNIDADEChange(Sender: TField);
begin
  if not Sender.IsNull then
    cdsCadPatrimonioUNIDADE.AsString := cdsCadPatrimonioDESC_UNIDADE.AsString;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioKFIN_PLANOCONTAValidate(
  Sender: TField);
begin
  if cdsCadPatrimonioKFIN_PLANOCONTA.AsString <> FK_PLANODEPRECIACAO then
   begin
     cdsCadPatrimonioKFIN_PLANOCONTA.OnValidate := nil;
     cdsCadPatrimonioDESCR_PC_NOME.OnSetText := nil;
     cdsCadPatrimonioDESCR_PC_NOME.AsString   := FNomePlanoDepreciacao;
     cdsCadPatrimonioDESCR_PC_CLASSIFICACAO.AsString := FClassificacaoPlanoDepreciacao ;
     cdsCadPatrimonioDESCR_PC_CODIGO.AsString  :=  FCodigoPlanoDepreciacao;
     cdsCadPatrimonioKFIN_PLANOCONTA.AsString := FK_PLANODEPRECIACAO;
     cdsCadPatrimonioDESCR_PC_NOME.OnSetText := cdsCadPatrimonioDESCR_PC_NOMESetText;
     cdsCadPatrimonioKFIN_PLANOCONTA.OnValidate := cdsCadPatrimonioKFIN_PLANOCONTAValidate;
     raise Warning.Create( Format('Apropriação não pode ser diferente da conta contábil %s',[FNomePlanoDepreciacao]) );
   end;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster;
  cdsCadPatrimonioKSYSDOMAIN.AsString := LoggedUser.DomainID;
  cdsCadPatrimonioATIVO.AsString        := 'T';
  cdsCadPatrimonioQUANTIDADE.AsInteger  := 1 ;
  cdsCadPatrimonioVALOR_FINAL.AsFloat   := 0 ;
  cdsCadPatrimonioVIDA_UTIL.AsInteger   := 0 ;
  cdsCadPatrimonioDESCR_PC_NOME.AsString   := 'Depreciação' ;
  cdsCadPatrimonioDESCR_PC_TIPO_APRD.asString := 'D' ;
  cdsCadPatrimonioKFIN_PLANOCONTA.asString := FK_PLANODEPRECIACAO ;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioNOMECATEGORIASetText(
  Sender: TField; const Text: string);
begin
    cdsCadPatrimonioKFIN_CATEGORIA.Clear;
    Sender.asString := Text ;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioNOMESETORSetText(
  Sender: TField; const Text: string);
begin
    cdsCadPatrimonioKFIN_SETOR.Clear;
    Sender.asString := Text ;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsCadPatrimonioVALOR_UNITARIOValidate(
  Sender: TField);
begin
  if cdsCadPatrimonioVALOR_UNITARIO.AsFloat < 0 then
    cdsCadPatrimonioVALOR_UNITARIO.AsFloat := 0;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsDepreciacaoDESCR_PC_CLASSIFICACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    Text := PutMaskPlanoConta( Sender.AsString ) ;
end;

procedure TFin_CadastroPatrimonioDatamodule.cdsDepreciacaoNewRecord(DataSet: TDataSet);
begin
  // cdsDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO.AsString := GuidSuppl.GuidStr20;
  TTcAbstractDB.GetByAlias('FINANCEIRO').GetKey(cdsDepreciacaoKCAD_PATRIMONIO_DEPRECIACAO);
end;

procedure TFin_CadastroPatrimonioDatamodule.RemoveItem;
begin
  if not cdsDepreciacao.Eof then
    cdsDepreciacao.Delete ;
end;

procedure TFin_CadastroPatrimonioDatamodule.gerarDepreciacao;
var
  LAnos : integer;
  LValor: double;
  LData: TDateTime;
begin
  //Angelica 11/12/2012 - recalcular depreciação quando alterar Valor inicial, valor Final ou vida util
  if not cdsDepreciacao.IsEmpty then
    begin
      cdsDepreciacao.First;
      cdsDepreciacao.DisableControls;
      while not cdsDepreciacao.Eof do
        cdsDepreciacao.Delete;

      cdsDepreciacao.EnableControls;
    end;

    if (not cdsCadPatrimonioVIDA_UTIL.IsNull) and (not cdsCadPatrimonioVALOR_UNITARIO.IsNull)
     and (not cdsCadPatrimonioVALOR_FINAL.IsNull) and (not cdsCadPatrimonioDATA_IMOBILIZADO.IsNull) then
      begin
        // era em mês e Angélica pediu para mudar para ano
  //      meses := cdsCadPatrimonioVIDA_UTIL.AsInteger * 12;
  //      valor := (cdsCadPatrimonioVALOR_UNITARIO.AsFloat - cdsCadPatrimonioVALOR_FINAL.AsFloat) / meses;

        Lanos  := cdsCadPatrimonioVIDA_UTIL.AsInteger;
        LValor := (cdsCadPatrimonioVALOR_TOTAL.AsFloat - cdsCadPatrimonioVALOR_FINAL.AsFloat) / LAnos;

        LData := cdsCadPatrimonioDATA_IMOBILIZADO.AsDateTime ;
        if DayOf ( LData ) > 15 then
           LData := IncMonth( StartOfTheMonth( LData ), 1 )
        else
           LData := StartOfTheMonth( LData ) ;

        While LAnos > 0 do
          begin
            Dec( LAnos ) ;
            LData := IncMonth(LData, 12);
            cdsDepreciacao.Append;
            cdsDepreciacaoDATA.AsDateTime := Trunc( EndOfTheMonth( LData ) ) ;
           //cdsDepreciacaoVALOR.AsFloat := cdsCadPatrimonioVALOR_UNITARIO.AsFloat - (i * valor);
            cdsDepreciacaoVALOR.AsFloat := LValor ;
            cdsDepreciacao.Post;
          end;
      end;
end;

procedure TFin_CadastroPatrimonioDatamodule.SetCategoria(AKey,
  ANomeCategoria: string);
begin
   if not ( cdsCadPatrimonio.State in [dsInsert,dsEdit] ) then
      cdsCadPatrimonio.Edit ;

   cdsCadPatrimonioNOMECATEGORIA.asString  := ANomeCategoria ;
   cdsCadPatrimonioKFIN_CATEGORIA.asString := AKey ;

    if (cdsCadPatrimonioKFIN_CATEGORIA.asString = KAnimais_matrizes) or
            (cdsCadPatrimonioKFIN_CATEGORIA.asString = KAnimais_novilhas) or
            (cdsCadPatrimonioKFIN_CATEGORIA.asString = KTerra           ) then
     begin
       cdsCadPatrimonioVIDA_UTIL.AsInteger := 0;
       cdsCadPatrimonioVALOR_FINAL.AsInteger := 0;
     end;


end;

procedure TFin_CadastroPatrimonioDatamodule.SetFilter(ShowInativos: Boolean);
begin
    FShowInativos := ShowInativos       ;
    SetParams ;
    self.RefreshList ;
//    ThreadSuppl.TSyncThread.Create ( self.RefreshList ) ;
end;

procedure TFin_CadastroPatrimonioDatamodule.SetParams;
begin
   cdsLstCadPatrimonio.Params.ParamByName( 'DSP_INATIVO' ).asString := BoolToChar ( FShowInativos ) ;
end;

procedure TFin_CadastroPatrimonioDatamodule.SetSetor(AKey,
  ANomeSetor: string);
begin
   if not ( cdsCadPatrimonio.State in [dsInsert,dsEdit] ) then
      cdsCadPatrimonio.Edit ;

   cdsCadPatrimonioNOMESETOR.asString  := ANomeSetor ;
   cdsCadPatrimonioKFIN_SETOR.asString := AKey ;

end;

procedure TFin_CadastroPatrimonioDatamodule.ValidaCampos;
var
  ErrMsg : string ;
  i : Integer ;

  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;

  for i := 0 to cdsCadPatrimonio.FieldCount - 1 do
    begin
      if ( ( cdsCadPatrimonio.Fields[i].Required = True ) and ( cdsCadPatrimonio.Fields[i].IsNull ) ) then
        AddErr( cdsCadPatrimonio.Fields[i].DisplayLabel ) ;
    end;

  if (cdsCadPatrimonioATIVO.AsBoolean) then
     cdsCadPatrimonioDATA_BAIXA.Clear;


  if ErrMsg <> '' then
     raise Warning.Create('Campos requeridos não preenchidos' + #13#10#13#10 + ErrMsg );
end;

procedure TFin_CadastroPatrimonioDatamodule.RefreshList;
begin
  inherited;
end;


end.
