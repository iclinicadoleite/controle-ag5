unit UZoo_SanidadeBSTDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_SanidadeBSTDatamodule2 = class(T_dtmBASE)
    cdsBST: TClientDataSet;
    cdsBSTKZOO_ANIMAL_FEMEA: TStringField;
    cdsBSTBRINCO: TStringField;
    cdsBSTNOMEESTABULO: TStringField;
    cdsBSTKZOO_ANIMAL_FEMEA_BST: TStringField;
    cdsBSTDATA: TSQLTimeStampField;
    cdsBSTOBSERVACAO: TMemoField;
    cdsBSTLOTE: TStringField;
    cdsBSTKCAD_FUNCIONARIO: TStringField;
    cdsBSTNOMEFUNCIONARIO: TStringField;
    cdsBSTKZOO_LACTACAO: TStringField;
    cdsBSTAPLICADO: TStringField;
    cdsBSTMOTIVO_INTERRUPCAO: TIntegerField;
    dspBST: TDataSetProvider;
    sqlBST: TTcSQLDataSet;
    sqlBSTKZOO_ANIMAL_FEMEA_BST: TStringField;
    sqlBSTKZOO_ANIMAL_FEMEA: TStringField;
    sqlBSTDATA: TSQLTimeStampField;
    sqlBSTOBSERVACAO: TMemoField;
    sqlBSTKCAD_FUNCIONARIO: TStringField;
    sqlBSTNOMEFUNCIONARIO: TStringField;
    sqlBSTLOTE: TStringField;
    cdsSelectBST: TClientDataSet;
    cdsSelectBSTBRINCOFEMEA: TStringField;
    cdsSelectBSTBRINCOFEMEA_: TStringField;
    cdsSelectBSTNOMEFEMEA: TStringField;
    cdsSelectBSTLOTE: TStringField;
    cdsSelectBSTKZOO_LACTACAO: TStringField;
    cdsSelectBSTULTIMA_LACTACAO: TSQLTimeStampField;
    cdsSelectBSTDPP: TIntegerField;
    cdsSelectBSTNCOBERTURAS: TIntegerField;
    cdsSelectBSTPRENHEZ: TStringField;
    cdsSelectBSTDATA_ULTBST: TSQLTimeStampField;
    cdsSelectBSTDATA_PREVISTABST: TSQLTimeStampField;
    cdsSelectBSTTOTAL: TFloatField;
    dspSelectBST: TDataSetProvider;
    sqlSelectBST: TTcSQLDataSet;
    sqlSelectBSTBRINCOFEMEA: TStringField;
    sqlSelectBSTBRINCOFEMEA_: TStringField;
    sqlSelectBSTNOMEFEMEA: TStringField;
    sqlSelectBSTLOTE: TStringField;
    sqlSelectBSTKZOO_LACTACAO: TStringField;
    sqlSelectBSTULTIMA_LACTACAO: TSQLTimeStampField;
    sqlSelectBSTNCOBERTURAS: TIntegerField;
    sqlSelectBSTPRENHEZ: TStringField;
    sqlSelectBSTDATA_ULTBST: TSQLTimeStampField;
    sqlSelectBSTDATA_PREVISTABST: TSQLTimeStampField;
    sqlSelectBSTTOTAL: TFloatField;
    cdsStatusVaca: TClientDataSet;
    cdsStatusVacaTIPO: TStringField;
    cdsStatusVacaVALOR: TStringField;
    cdsStatusVacaDESCRICAO: TStringField;
    cdsStatusVacaORDEM: TIntegerField;
    cdsDescricaoBST: TClientDataSet;
    cdsDescricaoBSTTIPO: TStringField;
    cdsDescricaoBSTVALOR: TStringField;
    cdsDescricaoBSTDESCRICAO: TStringField;
    cdsDescricaoBSTORDEM: TIntegerField;
    sqlBSTKZOO_LACTACAO: TStringField;
    sqlBSTAPLICADO: TStringField;
    sqlBSTMOTIVO_INTERRUPCAO: TIntegerField;
    cdsSelectBSTKZOO_ANIMAL_FEMEA: TStringField;
    sqlSelectBSTKZOO_ANIMAL_FEMEA: TStringField;
    cdsMotivoInterrupcaoBST: TClientDataSet;
    cdsMotivoInterrupcaoBSTTIPO: TStringField;
    cdsMotivoInterrupcaoBSTVALOR: TStringField;
    cdsMotivoInterrupcaoBSTDESCRICAO: TStringField;
    cdsMotivoInterrupcaoBSTORDEM: TIntegerField;
    cdsBSTDESC_MOTIVO_INTERRUPCAO: TStringField;
    cdsSelectBSTSELECTED: TStringField;
    sqlSelectBSTDPP: TIntegerField;
    procedure cdsBSTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
    procedure cdsBSTBeforePost(DataSet: TDataSet);
    procedure cdsSelectBSTBeforeOpen(DataSet: TDataSet);
    procedure cdsSelectBSTCalcFields(DataSet: TDataSet);
    procedure cdsBSTNewRecord(DataSet: TDataSet);
    procedure cdsBSTAPLICADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsSelectBSTSELECTEDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure InitTables ;
    procedure InitBSTParams ;
  private
    FIntervaloAplicacaoBSTPrimipara : integer;
    FIntervaloAplicacaoBSTMultipara : integer;
    FBSTDPPPrimipara : integer;
    FBSTDPPMultipara : Integer;
    FProducaoPrimipara : integer;
    FProducaoMultipara : integer;
    FDiasPrePartoSecarPrimipara, FDiasPrePartoSecarMultipara : integer ;
    FDiasPreSecagemBSTPrimipara,
    FDiasPreSecagemBSTMultipara : integer ;
    FDiasEncerrarBSTPrimipara,
    FDiasEncerrarBSTMultipara : integer ;
    FBSTAte      : TDateTime;
    procedure SetBSTAte(const Value: TDateTime);
  public
    { Public declarations }
    property IntervaloAplicacaoBSTPrimipara             : integer read FIntervaloAplicacaoBSTPrimipara ;
    property IntervaloAplicacaoBSTMultipara             : integer read FIntervaloAplicacaoBSTMultipara ;
    property BSTDPPPrimipara            : integer read FBSTDPPPrimipara ;
    property BSTDPPMultipara            : Integer read FBSTDPPMultipara ;
    property ProducaoPrimipara          : integer read FProducaoPrimipara ;
    property ProducaoMultipara          : integer read FProducaoMultipara ;
    property DiasPrePartoSecarPrimipara : integer read FDiasPrePartoSecarPrimipara ;
    property DiasPrePartoSecarMultipara : integer read FDiasPrePartoSecarMultipara ;
    property DiasPreSecagemBSTPrimipara : integer read FDiasPreSecagemBSTPrimipara ;
    property DiasPreSecagemBSTMultipara : integer read FDiasPreSecagemBSTMultipara ;
    property BSTAte                     : TDateTime read FBSTAte write SetBSTAte;

    procedure OpenSelecao ;

    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string ) : boolean ;
    procedure RemoveRecord ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure ApplyUpdates ; override ;

    function GetDescricaoBST ( TIPO : string ) : string ;
    procedure CopySelectionList ( AData : TDateTime ; AKFuncionario, ANomeFuncionario : string );
    constructor Create ( AOqner : TComponent ) ; override ;

  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl, ClAg5Types,
     ClAg5ClientZootecnicoCommonTypes,
     Data.SQLTimSt, DateUtils ;

{$R *.dfm}

procedure TZoo_SanidadeBSTDatamodule2.ApplyUpdates;
begin

  with cdsBST do
    begin
       First;

       while not eof do
         begin
           if Trim ( cdsBSTKCAD_FUNCIONARIO.asString ) = EmptyStr then
              raise Warning.Create('Existe(m) tarefa(s) sem funcionário');

           if cdsBSTDATA.AsDateTime < 1 then
              raise Warning.Create('Existe(m) tarefa(s) sem data');

           Next;
         end;
    end;

  TCDSSuppl.ApplyUpdates ( cdsBST ) ;
  InitTables ;

end;

procedure TZoo_SanidadeBSTDatamodule2.cdsSelectBSTBeforeOpen(
  DataSet: TDataSet);
begin
  InitBSTParams;
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsSelectBSTCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.State in [dsInternalCalc] then
    begin
      if cdsSelectBSTSELECTED.IsNull then
         cdsSelectBSTSELECTED.asString := 'T' ;
    end;
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsSelectBSTSELECTEDGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
 if DisplayText then
   begin
     if Sender.DataSet.IsEmpty then
        exit ;

     if not (( Sender.IsNull ) or ( Sender.asString = '' ))  then
       begin
        if Sender.AsBoolean then
           Text := 'Sim'
        else
          Text := 'Não'
       end;
   end
  else
    Text := Sender.asString ;
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsBSTAPLICADOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 if DisplayText then
   begin
     if Sender.DataSet.IsEmpty then
        exit ;

     if not (( Sender.IsNull ) or ( Sender.asString = '' ))  then
       begin
        if Sender.AsBoolean then
           Text := 'Sim'
        else
          Text := 'Não'
       end;
   end
  else
    Text := Sender.asString ;
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsBSTBeforePost(DataSet: TDataSet);
begin
//  if cdsBSTKCAD_FUNCIONARIO.IsNull then
//     raise Warning.Create('Pesquise o funcionário');

//  if cdsBSTDATA.AsDateTime < 1 then
//     raise Warning.Create('Data inválida.');

//  if cdsBSTDATA.AsDateTime < (Date - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias.');

  if cdsBSTDATA.AsDateTime > Date then
     raise Warning.Create('Data não pode ser maior que data atual.');
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsBSTNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsBSTKZOO_ANIMAL_FEMEA_BST ) ;
end;

procedure TZoo_SanidadeBSTDatamodule2.cdsBSTNOMEFUNCIONARIOSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  cdsBSTKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeBSTDatamodule2.CopySelectionList(AData : TDateTime ; AKFuncionario, ANomeFuncionario : string);
begin

  cdsBST.BeforePost := nil ;

  with cdsSelectBST do
   begin
    first ;
    while not eof do
       try
         if    ( not cdsSelectBSTSELECTED.AsBoolean )
            or ( cdsBST.Locate( 'KZOO_ANIMAL_FEMEA', cdsSelectBSTKZOO_ANIMAL_FEMEA.asString, [] ) ) then
            Continue ;
         cdsBST.Append;
         cdsBSTKZOO_ANIMAL_FEMEA.asString     := cdsSelectBSTKZOO_ANIMAL_FEMEA.asString ;
         cdsBSTBRINCO.asString                := cdsSelectBSTBRINCOFEMEA.AsString ;
         cdsBSTNOMEESTABULO.asString          := cdsSelectBSTNOMEFEMEA.AsString   ;
         cdsBSTLOTE.asString                  := cdsSelectBSTLOTE.AsString ;
         cdsBSTKZOO_LACTACAO.asString         := cdsSelectBSTKZOO_LACTACAO.asString ;
         cdsBSTAPLICADO.asString              := 'T' ;
         if AData > 0 then
           cdsBSTDATA.asDateTime                := AData ;
         if ( AKFuncionario <> '' ) then
           begin
             cdsBSTKCAD_FUNCIONARIO.asString      := AKFuncionario ;
             cdsBSTNOMEFUNCIONARIO.asString       := ANomeFuncionario ;
           end;
         cdsBST.Post;
       finally
         next ;
       end;
    end;

  cdsBST.BeforePost := cdsBSTBeforePost ;
end;

constructor TZoo_SanidadeBSTDatamodule2.Create(AOqner: TComponent);
var
  LDiasGestacaoPrimipara, LDiasGestacaoMultipara : integer ;
begin
  inherited;

  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_STATUS_FEMEA,   cdsStatusVaca );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_PARAM_MATRIZES, cdsDescricaoBST ) ;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_MOTIVO_INTERRUPCAO_BST, cdsMotivoInterrupcaoBST ) ;

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_INTERVALO,        FIntervaloAplicacaoBSTPrimipara, FIntervaloAplicacaoBSTMultipara  );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_DEL,              FBSTDPPPrimipara,                FBSTDPPMultipara );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_PRODUCAO,         FProducaoPrimipara,              FProducaoMultipara );
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     LDiasGestacaoPrimipara,          LDiasGestacaoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, FDiasPrePartoSecarPrimipara,     FDiasPrePartoSecarMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_BST_DIAS_PRE_SECAGEM, FDiasPreSecagemBSTPrimipara,     FDiasPreSecagemBSTMultipara ) ;

  FDiasEncerrarBSTPrimipara  := LDiasGestacaoPrimipara - FDiasPrePartoSecarPrimipara - FDiasPreSecagemBSTPrimipara ;
  FDiasEncerrarBSTMultipara  := LDiasGestacaoMultipara - FDiasPrePartoSecarMultipara - FDiasPreSecagemBSTMultipara ;

end;

function TZoo_SanidadeBSTDatamodule2.GetDescricaoBST(TIPO: string): string;
begin
   cdsDescricaoBST.Locate( 'VALOR', TIPO, [] ) ;
   RESULT:= cdsDescricaoBSTDESCRICAO.AsString
end;

procedure TZoo_SanidadeBSTDatamodule2.InitBSTParams;
begin
      cdsSelectBST.Params.ParamByName ( 'CIO' ).AsInteger         := _ST_AUTO_EVT_CIO;
      cdsSelectBST.Params.ParamByName ( 'INTBST_PRIM' ).AsInteger := FIntervaloAplicacaoBSTPrimipara;
      cdsSelectBST.Params.ParamByName ( 'INTBST_MULT' ).AsInteger := FIntervaloAplicacaoBSTMultipara;
      cdsSelectBST.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
      cdsSelectBST.Params.ParamByName ( 'DESCARTADA' ).AsInteger  := _ST_STATUS_FEMEA_DESCARTADO;
      cdsSelectBST.Params.ParamByName ( 'PROD_PRIM' ).AsInteger   := FProducaoPrimipara;
      cdsSelectBST.Params.ParamByName ( 'PROD_MULT' ).AsInteger   := FProducaoMultipara;
      cdsSelectBST.Params.ParamByName ( 'DPP_PRIM' ).AsInteger    := FBSTDPPPrimipara;
      cdsSelectBST.Params.ParamByName ( 'DPP_MULT' ).AsInteger    := FBSTDPPMultipara;
      cdsSelectBST.Params.paramByName ( 'DATA' ).AsSQLTimeStamp   := DateTimeToSQLTimeStamp( EndOfTheDay( FBSTAte ) );
      cdsSelectBST.Params.ParamByName ( 'DIAS_ENCERRAR_BST_PRIM' ).AsInteger    := FDiasEncerrarBSTPrimipara ;
      cdsSelectBST.Params.ParamByName ( 'DIAS_ENCERRAR_BST_MULT' ).AsInteger    := FDiasEncerrarBSTMultipara ;
end;

procedure TZoo_SanidadeBSTDatamodule2.InitTables;
begin
   TCDSSuppl.CreateDataSet( cdsBST ) ;
end;

procedure TZoo_SanidadeBSTDatamodule2.OpenSelecao;
begin
  TCDSSuppl.Open ( cdsSelectBST ) ;
end;

procedure TZoo_SanidadeBSTDatamodule2.OpenTables;
begin
  InitTables ;
end;


procedure TZoo_SanidadeBSTDatamodule2.RemoveRecord;
begin
   if not cdsBST.isEmpty then
     cdsBST.Delete ;
end;

procedure TZoo_SanidadeBSTDatamodule2.SetBSTAte(const Value: TDateTime);
begin
  FBSTAte := Value;
end;

procedure TZoo_SanidadeBSTDatamodule2.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsBST.State in [dsInsert, dsEdit] ) then
      cdsBST.Edit ;
   cdsBSTNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsBSTKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

function TZoo_SanidadeBSTDatamodule2.AddBrinco ( ABrinco : string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
var
  cds : TClientDataSet ;
  p : TParams ;
begin

  Result := cdsBST.Locate( 'BRINCO', ABrinco, [] ) ;
  if Result then
    begin
       cdsBST.Edit ;
       cdsBSTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
       cdsBSTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
       cdsBSTDATA.asDateTime            := AData ;
       exit ;
    end ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
  p.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

  cds := nil ;
  try
//     DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
     DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'F.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.NOMEESTABULO, F.LOTE, F.KULTIMA_LACTACAO'
      +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
      +#13#10'LEFT JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
      +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND ( A.STATUS <> :STATUS_DESCARTADO )', p ) ;

     Result := not cds.IsEmpty ;

     if Result then
       with cds do
         begin
           cdsBST.Append ;
           cdsBSTKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString  ;
           cdsBSTBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
           cdsBSTNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsBSTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
           cdsBSTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
           cdsBSTDATA.asDateTime            := AData ;
           cdsBSTLOTE.asString              := fieldByName ( 'LOTE' ).asString ;
           cdsBSTKZOO_LACTACAO.asString     := fieldByName ( 'KULTIMA_LACTACAO' ).asString ;
         end
       else
          raise Warning.Create('Brinco não encontrado/Animal descartado');

  finally
     cds.Free ;
     p.free ;
  end;

end;

end.
