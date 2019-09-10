unit UdtmZoo_ProducaoAnimal;

interface

uses
  System.SysUtils, System.Classes, UdtmSYS_BASE, Data.FMTBcd, Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DBClient;

type

  TConfirmaPeso = function ( APeso :double ) : boolean of object ;

  TdtmZoo_ProducaoAnimal = class(T_dtmBASE)
    cdsLactacoes: TClientDataSet;
    cdsPesagemLeite: TClientDataSet;
    cdsPesagemLeiteKZOO_PESAGEM_LEITE: TStringField;
    cdsPesagemLeiteDEL: TIntegerField;
    cdsPesagemLeiteORD1: TFloatField;
    cdsPesagemLeiteORD2: TFloatField;
    cdsPesagemLeiteORD3: TFloatField;
    cdsPesagemLeiteVARIACAO: TFloatField;
    cdsPesagemLeiteTOTAL: TFloatField;
    cdsPesagemLeiteOBSERVACAO: TMemoField;
    cdsPesagemLeiteLOTE: TStringField;
    sqlLactacoes: TTcSQLDataSet;
    sqlPesagemLeite: TTcSQLDataSet;
    dtsSQLLactacoes: TDataSource;
    sqlAnalises: TTcSQLDataSet;
    cdsAnalises: TClientDataSet;
    dspLactacoes: TDataSetProvider;
    cdsPesagemLeiteDATA: TSQLTimeStampField;
    cdsStatusGestacao: TClientDataSet;
    cdsStatusGestacaoTIPO: TStringField;
    cdsStatusGestacaoVALOR: TStringField;
    cdsStatusGestacaoDESCRICAO: TStringField;
    cdsStatusGestacaoORDEM: TIntegerField;
    sqlPesagemLeiteKZOO_PESAGEM_LEITE: TStringField;
    sqlPesagemLeiteDATA: TSQLTimeStampField;
    sqlPesagemLeiteDEL: TIntegerField;
    sqlPesagemLeiteORD1: TFloatField;
    sqlPesagemLeiteORD2: TFloatField;
    sqlPesagemLeiteORD3: TFloatField;
    sqlPesagemLeiteTOTAL: TFloatField;
    sqlPesagemLeiteVARIACAO: TFloatField;
    sqlPesagemLeiteOBSERVACAO: TMemoField;
    sqlPesagemLeiteLOTE: TStringField;
    sqlPesagemLeiteANIMAL_DOENTE: TStringField;
    cdsPesagemLeiteANIMAL_DOENTE: TStringField;
    sqlAnalisesKZOO_LACTACAO: TStringField;
    sqlAnalisesKZOO_PESAGEM_LEITE: TStringField;
    sqlAnalisesDATA: TSQLTimeStampField;
    sqlAnalisesGORDURA: TFloatField;
    sqlAnalisesPROTEINA: TFloatField;
    sqlAnalisesLACTOSE: TFloatField;
    sqlAnalisesSOLIDOS_TOTAIS: TFloatField;
    sqlAnalisesESD: TFloatField;
    sqlAnalisesCCS: TIntegerField;
    sqlAnalisesUREIA: TFloatField;
    cdsAnalisesKZOO_LACTACAO: TStringField;
    cdsAnalisesDATA: TSQLTimeStampField;
    cdsAnalisesGORDURA: TFloatField;
    cdsAnalisesPROTEINA: TFloatField;
    cdsAnalisesLACTOSE: TFloatField;
    cdsAnalisesSOLIDOS_TOTAIS: TFloatField;
    cdsAnalisesESD: TFloatField;
    cdsAnalisesCCS: TIntegerField;
    cdsAnalisesUREIA: TFloatField;
    cdsAnalisesKZOO_PESAGEM_LEITE: TStringField;
    cdsMotivoSecagem: TClientDataSet;
    cdsMotivoSecagemTIPO: TStringField;
    cdsMotivoSecagemVALOR: TStringField;
    cdsMotivoSecagemDESCRICAO: TStringField;
    cdsMotivoSecagemORDEM: TIntegerField;
    cdsLactacoesKZOO_LACTACAO: TStringField;
    cdsLactacoesKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsLactacoesKCAD_FAZENDA: TStringField;
    cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    cdsLactacoesNL: TIntegerField;
    cdsLactacoesDATALACTACAO: TSQLTimeStampField;
    cdsLactacoesABORTOPARTO: TIntegerField;
    cdsLactacoesDEL: TIntegerField;
    cdsLactacoesPRODUCAO_MEDIA: TFloatField;
    cdsLactacoesPRODUCAO_PICO: TFloatField;
    cdsLactacoesPL305: TFloatField;
    cdsLactacoesPGT: TFloatField;
    cdsLactacoesPPT: TFloatField;
    cdsLactacoesPLT: TFloatField;
    cdsLactacoesOBS_SECAGEM: TMemoField;
    cdsLactacoesIEP_MESES: TIntegerField;
    cdsLactacoesDEL_PICO: TIntegerField;
    cdsLactacoesMAX_ORDENHAS_DIA: TIntegerField;
    cdsLactacoesPL365: TFloatField;
    cdsLactacoesEQA_LEITE: TFloatField;
    cdsLactacoesDESVIO_EQA_LEITE: TFloatField;
    cdsLactacoesDATA_SECAGEM: TSQLTimeStampField;
    cdsLactacoesCAUSA_SECAGEM: TIntegerField;
    cdsLactacoesAPLICADO_PROTOCOLO_SECAGEM: TStringField;
    cdsLactacoesPG305: TFloatField;
    cdsLactacoesPG365: TFloatField;
    cdsLactacoesPP305: TFloatField;
    cdsLactacoesPP365: TFloatField;
    cdsLactacoesULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    cdsLactacoesDESC_SECAGEM: TStringField;
    cdsLactacoesABORTOU: TStringField;
    sqlLactacoesKZOO_LACTACAO: TStringField;
    sqlLactacoesKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlLactacoesKCAD_FAZENDA: TStringField;
    sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    sqlLactacoesNL: TIntegerField;
    sqlLactacoesDATALACTACAO: TSQLTimeStampField;
    sqlLactacoesABORTOPARTO: TIntegerField;
    sqlLactacoesDEL: TIntegerField;
    sqlLactacoesPRODUCAO_MEDIA: TFloatField;
    sqlLactacoesPRODUCAO_PICO: TFloatField;
    sqlLactacoesLEITE_305D: TFloatField;
    sqlLactacoesPGT: TFloatField;
    sqlLactacoesPPT: TFloatField;
    sqlLactacoesPLT: TFloatField;
    sqlLactacoesOBS_SECAGEM: TMemoField;
    sqlLactacoesIEP_MESES: TIntegerField;
    sqlLactacoesDEL_PICO: TIntegerField;
    sqlLactacoesMAX_ORDENHAS_DIA: TIntegerField;
    sqlLactacoesPL365: TFloatField;
    sqlLactacoesEQA_LEITE: TFloatField;
    sqlLactacoesDESVIO_EQA_LEITE: TFloatField;
    sqlLactacoesDATA_SECAGEM: TSQLTimeStampField;
    sqlLactacoesCAUSA_SECAGEM: TIntegerField;
    sqlLactacoesAPLICADO_PROTOCOLO_SECAGEM: TStringField;
    sqlLactacoesPG305: TFloatField;
    sqlLactacoesPG365: TFloatField;
    sqlLactacoesPP305: TFloatField;
    sqlLactacoesPP365: TFloatField;
    sqlLactacoesEQA_GORDURA: TFloatField;
    sqlLactacoesEQA_PROTEINA: TFloatField;
    sqlLactacoesULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    cdsLactacoesEQA_GORDURA: TFloatField;
    cdsLactacoesEQA_PROTEINA: TFloatField;
    sqlPesagemLeiteKCAD_FAZENDA: TStringField;
    sqlPesagemLeiteKZOO_LACTACAO: TStringField;
    sqlPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField;
    sqlPesagemLeiteDATALACTACAO: TSQLTimeStampField;
    cdsPesagemLeiteKCAD_FAZENDA: TStringField;
    cdsPesagemLeiteKZOO_LACTACAO: TStringField;
    cdsPesagemLeiteKZOO_ANIMAL_FEMEA: TStringField;
    cdsPesagemLeiteDATALACTACAO: TSQLTimeStampField;
    cdsLactacoesGORDURA_MEDIA: TFloatField;
    cdsLactacoesPROTEINA_MEDIA: TFloatField;
    cdsLactacoesPRODUCAO_MEDIA_DIARIA: TFloatField;
    cdsPesagemLeiteNORD: TIntegerField;
    dspAnalises: TDataSetProvider;
    dtsLactacoes: TDataSource;
    dspPesagemLeite: TDataSetProvider;
    sqlLactacoesINTERVALO_SECAGEM: TIntegerField;
    cdsLactacoesINTERVALO_SECAGEM: TIntegerField;
    procedure cdsLactacoesCalcFields(DataSet: TDataSet);
    procedure cdsPesagemLeiteNewRecord(DataSet: TDataSet);
    procedure cdsPesagemLeiteCalcFields(DataSet: TDataSet);
    procedure cdsLactacoesBeforeInsert(DataSet: TDataSet);
    procedure cdsPesagemLeiteORDValidate(Sender: TField);
    procedure cdsPesagemLeiteBeforeInsert(DataSet: TDataSet);
    procedure cdsPesagemLeiteBeforeEdit(DataSet: TDataSet);
    procedure cdsPesagemLeiteDATAValidate(Sender: TField);
    procedure cdsPesagemLeiteBeforePost(DataSet: TDataSet);
    procedure cdsPesagemLeiteNORDValidate(Sender: TField);
    procedure cdsLactacoesBeforePost(DataSet: TDataSet);
    procedure cdsLactacoesDATA_SECAGEMValidate(Sender: TField);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FDadosFemea: TDataSource;
    FOnConfirmaPeso: TConfirmaPeso;
    procedure SetMasterSource(const Value: TDataSource);
    procedure DeleteRecord ; override ;
    procedure SetOnConfirmaPeso(const Value: TConfirmaPeso);
    function GetNOrdenhas : integer ;
    procedure SetDadosFemea(const Value: TDataSource);
  public
    { Public declarations }
    procedure ApplyUpdates ; override ;
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
    property OnConfirmaPeso : TConfirmaPeso  read FOnConfirmaPeso write SetOnConfirmaPeso;
  end;


implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, ClAg5Types, DateUtils, CDSSuppl, Exceptions ;

{$R *.dfm}

{ TdtmZoo_ProducaoAnimal }

procedure TdtmZoo_ProducaoAnimal.ApplyUpdates;
var
 KZOO_PESAGEM_LEITE : string ;
 KZOO_PESAGEM_LEITE_ANALISE: string;
begin
  TCDSSuppl.ApplyUpdates( cdsAnalises );
  TCDSSuppl.ApplyUpdates( cdsPesagemLeite );
  TCDSSuppl.ApplyUpdates( cdsLactacoes );
  cdsLactacoes.RefreshRecord ;

  KZOO_PESAGEM_LEITE := cdsPesagemLeiteKZOO_PESAGEM_LEITE.asString ;
  cdsPesagemLeite.Refresh  ;
  cdsPesagemLeite.Locate ( 'KZOO_PESAGEM_LEITE', KZOO_PESAGEM_LEITE, [] ) ;

  KZOO_PESAGEM_LEITE_ANALISE := cdsAnalisesKZOO_PESAGEM_LEITE.AsString;
  cdsAnalises.Refresh  ;
  cdsAnalises.Locate ( 'KZOO_PESAGEM_LEITE', KZOO_PESAGEM_LEITE_ANALISE, [] ) ;
end;

procedure TdtmZoo_ProducaoAnimal.cdsLactacoesBeforeInsert(DataSet: TDataSet);
begin
   Abort
end;

procedure TdtmZoo_ProducaoAnimal.cdsLactacoesBeforePost(DataSet: TDataSet);
begin
   if ( not cdsLactacoesCAUSA_SECAGEM.IsNull ) and ( cdsLactacoesDATA_SECAGEM.isNull ) then
      raise Warning.Create('Informe a data de secagem');
   if ( not cdsLactacoesDATA_SECAGEM.isNull ) and ( cdsLactacoesCAUSA_SECAGEM.IsNull ) then
      raise Warning.Create('Informe a causa da secagem');
end;

procedure TdtmZoo_ProducaoAnimal.cdsLactacoesCalcFields(DataSet: TDataSet);
var
  LIntervaloSecagem : integer ;
  LProducaoTotal : double ;
begin
  if DataSet.State in [dsInternalCalc] then
    try
      cdsLactacoes.OnCalcFields := nil  ;

      if (cdsLactacoesABORTOPARTO.AsInteger = _ST_TIPO_PARTOABORTO_ABORTO)
        or (cdsLactacoesABORTOPARTO.AsInteger = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )then
          cdsLactacoesABORTOU.AsString := 'Sim'
        else
          cdsLactacoesABORTOU.AsString := 'Não';

      LIntervaloSecagem := cdsLactacoesDEL.asInteger ;

      if cdsLactacoesDATA_SECAGEM.isNull then
         Inc ( LIntervaloSecagem, cdsLactacoesINTERVALO_SECAGEM.asInteger ) ;
      if LIntervaloSecagem < 1 then
         LIntervaloSecagem := 1 ;
(*
      cdsLactacoesPRODUCAO_MEDIA_DIARIA.asFloat := cdsLactacoesPLT.asFloat / LIntervaloSecagem  ;
      cdsLactacoesGORDURA_MEDIA.asFloat         := cdsLactacoesPGT.asFloat / LIntervaloSecagem  ;
      cdsLactacoesPROTEINA_MEDIA.asFloat        := cdsLactacoesPPT.asFloat / LIntervaloSecagem  ;
*)
      LProducaoTotal := cdsLactacoesPLT.asFloat ;

      if LProducaoTotal < 1 then
         LProducaoTotal := 1 ;

      cdsLactacoesPRODUCAO_MEDIA_DIARIA.asFloat := cdsLactacoesPLT.asFloat / LIntervaloSecagem  ;
      cdsLactacoesGORDURA_MEDIA.asFloat         := cdsLactacoesPGT.asFloat / LProducaoTotal * 100  ;
      cdsLactacoesPROTEINA_MEDIA.asFloat        := cdsLactacoesPPT.asFloat / LProducaoTotal * 100 ;
    finally
      cdsLactacoes.OnCalcFields := cdsLactacoesCalcFields ;
    end ;
end;

procedure TdtmZoo_ProducaoAnimal.cdsLactacoesDATA_SECAGEMValidate( Sender: TField ) ;
var
   Clone : TClientDataSet ;

begin
  if (  not Sender.IsNull ) and ( Sender.asDateTime < cdsLactacoesDATALACTACAO.asDateTime ) then
      raise Warning.Create('Data de secagem não pode ser inferior a data de lactação :' + FormatDateTime ( 'dd.mm.yyyy', cdsLactacoesDATALACTACAO.asDateTime ) );

  if Sender.isNull then
     exit ;

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsLactacoes, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_LACTACAO' ).Value <> cdsLactacoesKZOO_LACTACAO.Value ) then
            begin

             if  ( FieldByName( 'DATALACTACAO' ).AsDateTime > cdsLactacoesDATALACTACAO.AsDateTime )
             and ( Sender.AsDateTime > FieldByName( 'DATALACTACAO' ).AsDateTime  ) then
                 raise Warning.CreateFmt('Data se secagem não pode ser superior a outra lactação ( %d - %s )',
                    [ FieldByName( 'NL' ).asInteger,  FormatDateTime ( 'dd.mm.yyyy', FieldByName( 'DATALACTACAO' ).AsDateTime ) ] );
            end;
          Next ;
        end;
    finally
      FreeAndNil ( Clone ) ;
    end;


  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsPesagemLeite, False, False );
  with Clone do
    try
      first ;
      while not eof do
        begin
             if ( Sender.AsDateTime < FieldByName( 'DATA' ).AsDateTime  ) then
                 raise Warning.CreateFmt('Existem pesagens posterior a data de secagem ( %s )',
                    [ FormatDateTime ( 'dd.mm.yyyy', FieldByName( 'DATA' ).AsDateTime ) ] );
          Next ;
        end;
    finally
      FreeAndNil ( Clone ) ;
    end;

end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteBeforeEdit(DataSet: TDataSet);
begin
   if not cdsLactacoesDATA_SECAGEM.isNull then
      raise Warning.Create('Lactação encerrada em :' + FormatDateTime ( 'dd.mm.yyyy', cdsLactacoesDATA_SECAGEM.asDateTime ) );
end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteBeforeInsert(DataSet: TDataSet);
begin
   if cdsLactacoes.IsEmpty then
      raise Warning.Create('Não há lactação para este animal');
   if not cdsLactacoesDATA_SECAGEM.isNull then
      raise Warning.Create('Lactação encerrada em :' + FormatDateTime ( 'dd.mm.yyyy', cdsLactacoesDATA_SECAGEM.asDateTime ) );
end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteBeforePost(DataSet: TDataSet);
begin
   if ( cdsPesagemLeiteData.isNull )  then
      raise Warning.Create('Informar a data de pesagem') ;

   if ( cdsPesagemLeiteNORD.asInteger < 1 ) or
      ( cdsPesagemLeiteNORD.asInteger > 3 ) then
      raise Warning.Create('Número de ordenhas inválido ( 1 a 3 )') ;

   if ( self.GetNOrdenhas <> cdsPesagemLeiteNORD.asInteger ) and  not ( cdsPesagemLeiteANIMAL_DOENTE.asBoolean ) then
      raise Warning.Create('Ordenhas digitado não confere com número de ordenhas');

end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteCalcFields(DataSet: TDataSet);
begin

   if DataSet.State = dsInternalCalc then
     cdsPesagemLeiteNORD.asInteger := self.GetNOrdenhas ;

   // se nao ta em edicao, cai fora
   if not ( DataSet.State in [dsInsert,dsEdit] ) then
      exit ;


  // desabilita o calcFields para nao entrar em loop
  cdsPesagemLeite.OnCalcFields := nil ;
  try
    if cdsPesagemLeiteDATA.isNull then
      cdsPesagemLeiteDEL.Clear
    else
      cdsPesagemLeiteDEL.asInteger := Trunc ( cdsPesagemLeiteDATA.asDateTime ) - Trunc ( cdsPesagemLeiteDATALACTACAO.asDateTime ) + 1 ;

    if cdsPesagemLeiteNORD.asInteger > 2 then
       cdsPesagemLeiteTOTAL.asFloat := cdsPesagemLeiteORD1.asFloat + cdsPesagemLeiteORD2.asFloat + cdsPesagemLeiteORD3.asFloat
    else if cdsPesagemLeiteNORD.asInteger > 1 then
       cdsPesagemLeiteTOTAL.asFloat := cdsPesagemLeiteORD1.asFloat + cdsPesagemLeiteORD2.asFloat
    else if cdsPesagemLeiteNORD.asInteger > 0 then
       cdsPesagemLeiteTOTAL.asFloat := cdsPesagemLeiteORD1.asFloat
    else
       cdsPesagemLeiteTOTAL.asFloat := 0 ;

  finally // ao terminar habilida novamente
     cdsPesagemLeite.OnCalcFields := cdsPesagemLeiteCalcFields ;
  end;

end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteDATAValidate(Sender: TField);
var
   Clone : TClientDataSet ;
begin
   if cdsPesagemLeiteDATA.asDateTime < cdsLactacoesDATALACTACAO.asDateTime then
      raise Warning.Create('Data de pesagem inferior a data da lactação' ) ;

   if cdsPesagemLeiteDATA.AsDateTime > Date then
      raise Warning.Create('Data da pesagem não pode ser superior a data atual.');

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsPesagemLeite, False, False );

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'KZOO_PESAGEM_LEITE' ).Value <> cdsPesagemLeiteKZOO_PESAGEM_LEITE.Value ) then
            begin
             if    ( FieldByName( 'DATA' ).AsDateTime    = cdsPesagemLeiteDATA.AsDateTime ) then
                 raise Warning.Create('Já existe uma pesagem nesta data');
            end;
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteNewRecord(DataSet: TDataSet);
begin
 GetKey ( cdsPesagemLeiteKZOO_PESAGEM_LEITE ) ;
 cdsPesagemLeiteKCAD_FAZENDA.asString           := cdsLactacoesKCAD_FAZENDA.asString       ;
 cdsPesagemLeiteKZOO_LACTACAO.asString          := cdsLactacoesKZOO_LACTACAO.asString      ;
 cdsPesagemLeiteKZOO_ANIMAL_FEMEA.asString      := cdsLactacoesKZOO_ANIMAL_FEMEA.asString  ;
 cdsPesagemLeiteDATALACTACAO.asDateTime         := cdsLactacoesDATALACTACAO.asDateTime     ;
 cdsPesagemLeiteLOTE.asString                   := FDadosFemea.DataSet.FieldByName( 'LOTE' ).asString ;
end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteNORDValidate(Sender: TField);
begin
   if Sender.asInteger < 1 then
      raise Warning.Create('O mínimo de ordenhas permitidas é 1');
   if Sender.asInteger > 3 then
      raise Warning.Create('O máximo de ordenhas permitidas é 3');

   cdsPesagemLeiteNORD.OnValidate := nil ;
   cdsPesagemLeiteCalcFields ( cdsPesagemLeite )  ;
   cdsPesagemLeiteNORD.OnValidate := cdsPesagemLeiteNORDValidate ;
end;

procedure TdtmZoo_ProducaoAnimal.cdsPesagemLeiteORDValidate(Sender: TField);
begin
  if ( Sender.AsFloat > 60 ) and Assigned( FOnConfirmaPeso ) then
    begin
       if not FOnConfirmaPeso ( 60 ) then
          Abort ;
    end;
end;

procedure TdtmZoo_ProducaoAnimal.DeleteRecord;
begin
   self.cdsPesagemLeite.Delete ;
   CDSSuppl.TCDSSuppl.ApplyUpdates( self.cdsPesagemLeite );
//   CDSSuppl.TCDSSuppl.ApplyUpdates( self.cdsLactacoes );
end;

function TdtmZoo_ProducaoAnimal.GetNOrdenhas: integer;
begin
   Result := 0 ;

   if ( cdsPesagemLeiteORD1.asFloat > 0 ) then Inc ( Result ) ;
   if ( cdsPesagemLeiteORD2.asFloat > 0 ) then Inc ( Result ) ;
   if ( cdsPesagemLeiteORD3.asFloat > 0 ) then Inc ( Result ) ;
end;

procedure TdtmZoo_ProducaoAnimal.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_GESTACAO, cdsStatusGestacao ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_PRODUCAO, cdsMotivoSecagem ) ;
  TCDSSuppl.SetMasterSource(cdsLactacoes, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
  TCDSSuppl.Open ( cdsLactacoes    ) ;
  TCDSSuppl.Open ( cdsPesagemLeite ) ;
  TCDSSuppl.Open ( cdsAnalises     ) ;
end;

procedure TdtmZoo_ProducaoAnimal.SetDadosFemea(const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TdtmZoo_ProducaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TdtmZoo_ProducaoAnimal.SetOnConfirmaPeso(const Value: TConfirmaPeso);
begin
  FOnConfirmaPeso := Value;
end;

end.
