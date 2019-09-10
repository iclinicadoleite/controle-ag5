unit UZoo_ProducaoControleLeiteiroDatamodule2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, SMIBase, SMI2Cell, SMI2XLS,
  Dialogs ;

type
  TConfirmaPeso = function ( APeso :double ) : boolean of object ;
  TStatusProcessamentoLote = (splNaoProcessado, splProcessadoParcial, splProcessado );
  TOnQueryReopenBatch = function ( AData : TDateTime ) : boolean of object ;

  TZoo_ProducaoControleLeiteiroDatamodule2 = class(T_dtmBASE)
    cdsPesagens: TClientDataSet;
    dspLotePesagem: TDataSetProvider;
    sqlPesagens: TTcSQLDataSet;
    sqlPesagensKZOO_PESAGEM_LEITE: TStringField;
    sqlPesagensOBSERVACAO: TMemoField;
    sqlPesagensORD1: TFloatField;
    sqlPesagensORD2: TFloatField;
    sqlPesagensORD3: TFloatField;
    sqlPesagensTOTAL: TFloatField;
    cdsPesagensKZOO_PESAGEM_LEITE: TStringField;
    cdsPesagensOBSERVACAO: TMemoField;
    cdsPesagensORD1: TFloatField;
    cdsPesagensORD2: TFloatField;
    cdsPesagensORD3: TFloatField;
    cdsPesagensTOTAL: TFloatField;
    sqlPesagensNOMEESTABULO: TStringField;
    cdsPesagensNOMEESTABULO: TStringField;
    cdsLotePesagem: TClientDataSet;
    sqlLotePesagem: TTcSQLDataSet;
    dtsSQLLotePesagem: TDataSource;
    sqlLotePesagemDATA: TSQLTimeStampField;
    sqlLotePesagemKCAD_FAZENDA: TStringField;
    sqlLotePesagemKZOO_LOTEPESAGEM_LEITE: TStringField;
    sqlLotePesagemNORD: TIntegerField;
    sqlLotePesagemTOTAL: TFloatField;
    cdsLotePesagemKZOO_LOTEPESAGEM_LEITE: TStringField;
    cdsLotePesagemKCAD_FAZENDA: TStringField;
    cdsLotePesagemDATA: TSQLTimeStampField;
    cdsLotePesagemNORD: TIntegerField;
    cdsLotePesagemTOTAL: TFloatField;
    cdsLotePesagemsqlPesagens: TDataSetField;
    sqlPesagensKZOO_LOTEPESAGEM_LEITE: TStringField;
    cdsPesagensKZOO_LOTEPESAGEM_LEITE: TStringField;
    sqlPesagensKZOO_LACTACAO: TStringField;
    cdsPesagensKZOO_LACTACAO: TStringField;
    sqlPesagensBRINCO: TStringField;
    cdsPesagensBRINCO: TStringField;
    sqlPesagensLOTE: TStringField;
    cdsPesagensLOTE: TStringField;
    cdsPesagenstmpCalc: TIntegerField;
    sqlLotePesagemPROCESSADO: TStringField;
    cdsLotePesagemPROCESSADO: TStringField;
    SMImportFromXLS1: TSMImportFromXLS;
    cdsImport: TClientDataSet;
    cdsImportBRINCO: TStringField;
    cdsImportORD1: TFloatField;
    cdsImportORD2: TFloatField;
    cdsImportORD3: TFloatField;
    sqlPesagensDATA: TSQLTimeStampField;
    sqlPesagensANIMAL_DOENTE: TStringField;
    sqlPesagensKCAD_FAZENDA: TStringField;
    cdsPesagensKCAD_FAZENDA: TStringField;
    cdsPesagensDATA: TSQLTimeStampField;
    cdsPesagensANIMAL_DOENTE: TStringField;
    sqlPesagensKZOO_ANIMAL: TStringField;
    cdsPesagensKZOO_ANIMAL: TStringField;
    sqlPesagensULTIMA_PESAGEM: TFloatField;
    cdsPesagensULTIMA_PESAGEM: TFloatField;
    sqlPesagensBRINCO_: TStringField;
    cdsPesagensBRINCO_: TStringField;
    cdsRetiros: TClientDataSet;
    cdsRetirosRETIRO: TStringField;
    sqlLotePesagemRETIRO: TStringField;
    cdsLotePesagemRETIRO: TStringField;
    procedure cdsLotePesagemBeforeOpen(DataSet: TDataSet);
    procedure cdsLotePesagemNewRecord(DataSet: TDataSet);
    procedure cdsLotePesagemDATAValidate(Sender: TField);
    procedure cdsPesagensORD1Validate(Sender: TField);
    procedure cdsPesagensLOTEValidate(Sender: TField);
    procedure dspLotePesagemGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure cdsPesagensTOTALGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPesagensANIMAL_DOENTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPesagensBeforeScroll(DataSet: TDataSet);
    procedure dspLotePesagemBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsPesagensCalcFields(DataSet: TDataSet);
  private
    FOnConfirmaPeso: TConfirmaPeso;
    FCountPesagensImportadas: integer;
    FRetiroCaption : string ;
    FRetiroSelected : string ;
    FLoteAResetar : string ;
    FOnQueryReopenBatch: TOnQueryReopenBatch;
    procedure SetOnConfirmaPeso(const Value: TConfirmaPeso);
    procedure UpdatePesagensFromFile ;
    { Private declarations }
    function CheckLoteProcessado : boolean ;
    function QueryReopenBatch( AData : TDateTime ) : boolean ;
    procedure SetOnQueryReopenBatch(const Value: TOnQueryReopenBatch);
    function GetCaption: string;
    procedure ForceOnCalcFieldsEvent(ADataSet : TDataSet);
  public
    { Public declarations }
    procedure RemoverPesagens;
    function Processa ( out ErrMsg : string ) : TStatusProcessamentoLote ;
    procedure ResetLoteProcessado ;
    procedure SelecionaAnimais ;
    procedure OpenTables ; override ;
    procedure SetParams ;
    procedure preencheTeste ;
    procedure ImportFromXLS ( AFileName : string ) ;
    procedure CheckDoente;
    function GetRetiros : boolean ;
    procedure RecalcTotal ;
    property OnConfirmaPeso : TConfirmaPeso  read FOnConfirmaPeso write SetOnConfirmaPeso;
    property CountPesagensImportadas : integer read FCountPesagensImportadas ;
    property OnQueryReopenBatch : TOnQueryReopenBatch  read FOnQueryReopenBatch write SetOnQueryReopenBatch;
    property Caption: string read GetCaption ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses Exceptions, UDBZootecnico, Data.SQLTimSt, CLAg5Types, CDSSuppl, ThreadSuppl, Data.DBXCommon ;

{$R *.dfm}

procedure TZoo_ProducaoControleLeiteiroDatamodule2.OpenTables;
begin
   inherited ;
//  cdsLotePesagem.Open ;
end;


procedure TZoo_ProducaoControleLeiteiroDatamodule2.preencheTeste;
begin
     with cdsPesagens do
     begin
       disableControls ;
       AfterPost := nil ;
       first ;
       while not eof do
         begin
           edit ;
           cdsPesagensORD1.asFloat := 1 ;
           post ;
           next ;
         end;
       first ;
       enableControls ;
     end;
end;

function TZoo_ProducaoControleLeiteiroDatamodule2.Processa ( out ErrMsg : string ) : TStatusProcessamentoLote ;
begin
  ErrMsg := '' ;
  Result := splProcessado ;

  TCDSSuppl.PostIfNeed (cdsPesagens) ;
  with cdsPesagens do
    try
      DisableControls ;
      First ;
      while not eof  do
        begin

          cdsPesagens.OnCalcFields := nil ;
          cdsPesagens.Edit ;

          // atualiza a soma antes de gravar
          if cdsLotePesagemNORD.asInteger > 2 then
            begin
             cdsPesagensTOTAL.asFloat  :=
                      cdsPesagensORD1.asFloat
                    + cdsPesagensORD2.asFloat
                    + cdsPesagensORD3.asFloat ;
            end
          else if cdsLotePesagemNORD.asInteger > 1 then
            begin
             cdsPesagensTOTAL.asFloat  :=
                      cdsPesagensORD1.asFloat
                    + cdsPesagensORD2.asFloat ;
             cdsPesagensORD3.Clear ;
            end
          else if cdsLotePesagemNORD.asInteger > 0 then
            begin
             cdsPesagensTOTAL.asFloat  := cdsPesagensORD1.asFloat ;
             cdsPesagensORD2.Clear ;
             cdsPesagensORD3.Clear ;
            end
          else
             cdsPesagensTOTAL.asFloat  := 0 ;

          // atualiza a data antes de gravar
          if cdsPesagensDATA.AsDateTime <> cdsLotePesagemDATA.AsDateTime then
             cdsPesagensDATA.AsDateTime := cdsLotePesagemDATA.AsDateTime ;

          cdsPesagens.Post;
          //cdsPesagens.OnCalcFields := cdsPesagensCalcFields ;

          if not (( cdsPesagensTOTAL.asFloat > 0 ) or ( cdsPesagensANIMAL_DOENTE.AsString = 'T' )) then
             ErrMsg := ErrMsg +  #13#10 + cdsPesagensBRINCO.AsString +  ' - ' + cdsPesagensNOMEESTABULO.AsString ;

          next ;
        end;

        if ErrMsg <> '' then
           Exit ( splNaoProcessado ) ;

    finally
      First ;
      EnableControls ;
    end;

//  cdsLotePesagem.Edit ;
//  cdsLotePesagemPROCESSADO.asString := 'T' ;
//  cdsLotePesagem.Post ;

  if cdsPesagens.IndexName = '__Idx' then
    begin
     cdsPesagens.DeleteIndex('__Idx') ;
     cdsPesagens.IndexName :='DEFAULT_ORDER' ;
    end;

  ApplyUpdates ;

  if not CheckLoteProcessado then
    Result := splProcessadoParcial ;

  cdsLotePesagem.Close ;
  TCDSSuppl.Open ( cdsLotePesagem ) ;

end;


function TZoo_ProducaoControleLeiteiroDatamodule2.QueryReopenBatch(
  AData: TDateTime) : boolean ;
begin
  Result := False ;
  if not Assigned ( FOnQueryReopenBatch )  then
     exit ;
  Result := FOnQueryReopenBatch( AData ) ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.RecalcTotal;
var
 LBM : TBookmark ;
 LIndex : string;
begin
 with cdsPesagens do
   begin
     DisableControls ;
     LBM       := Bookmark ;
     LIndex    := IndexName ;
     IndexName := 'DEFAULT_ORDER' ;
     first;
     while not EOF do
       begin
         //ForceOnCalcFieldsEvent(cdsPesagens);
         Edit ;
         cdsPesagensCalcFields(cdsPesagens);
         Post ;
         Next ;
       end;
     IndexName := LIndex ;
     Bookmark  := LBM ;
     EnableControls ;
   end;
// ForceOnCalcFieldsEvent( cdsPesagens );
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.RemoverPesagens;
const
  _SQL_EXECUTE_BLOCK = 
                     'EXECUTE BLOCK'
              +#13#10'AS' 
              +#13#10'BEGIN' 
              +#13#10' RDB$SET_CONTEXT( ''USER_SESSION'', ''ZOO$CLOFF'', ''1'' ) ;'
              +#13#10'%s'
              +#13#10' RDB$SET_CONTEXT( ''USER_SESSION'', ''ZOO$CLOFF'', NULL ) ;'
              +#13#10'END' ;
  _SQL_DELETE_PESAGEM = 
              ' DELETE FROM ZOO_PESAGEM_LEITE WHERE KZOO_PESAGEM_LEITE = %s ;' ;
var
  LCount : integer ;
  LSQLStmts : TStringBuilder ;
  LDBXTransaction : TDBXTransaction ;
  
begin
  ApplyUpdates ;

  LDBXTransaction := TSQLConnection( DBResources['ZOOTECNICO'].Connection ).BeginTransaction ;

  LSQLStmts := TStringBuilder.Create ;

  with cdsPesagens do
    begin
      disableControls ;
      first ;
      Repeat
        LCount := 0 ;
        LSQLStmts.Clear ;
        while ( not eof ) and ( LCount < 150 ) do
          begin
            Inc ( LCount ) ;
            LSQLStmts.AppendLine( Format ( _SQL_DELETE_PESAGEM, [ QuotedStr( cdsPesagensKZOO_PESAGEM_LEITE.AsString ) ] ) ) ;
            next ;
          end;
        if LSQLStmts.Length > 0 then
           DBResources['ZOOTECNICO'].ExecuteDirect (  Format( _SQL_EXECUTE_BLOCK, [ LSQLStmts.ToString ] ) ) ;        
      Until ( eof )  ;
      First ;
      EnableControls ;
    end;
    
  TSQLConnection( DBResources['ZOOTECNICO'].Connection ).CommitFreeAndNil( LDBXTransaction ) ;
  
  if cdsPesagens.IndexName = '__Idx' then
   begin
    cdsPesagens.DeleteIndex('__Idx') ;
    cdsPesagens.IndexName :='DEFAULT_ORDER' ;
   end;

  cdsLotePesagem.Close ;
  TCDSSuppl.Open( cdsLotePesagem ) ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.ResetLoteProcessado;
const
  _SQL_RESET_LOTE_PROCESSADO = 
              'UPDATE ZOO_LOTEPESAGEM_LEITE'
       +#13#10'  SET PROCESSADO = ''F'''
       +#13#10'WHERE'
       +#13#10'  KZOO_LOTEPESAGEM_LEITE = :KZOO_LOTEPESAGEM_LEITE' ;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam ( ftString, 'KZOO_LOTEPESAGEM_LEITE', ptInput ).asString := FLoteAResetar ;
  DBResources['ZOOTECNICO'].Execute ( _SQL_RESET_LOTE_PROCESSADO, p  ) ;
  p.Free ;

  cdsLotePesagem.CancelUpdates ;
  cdsLotePesagem.Close ;
  cdsLotePesagem.Open ;
       
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.SelecionaAnimais;
const
  _SQL_INITLOTEPESAGEM = 'EXECUTE PROCEDURE ZOO_INIT_LOTEPESAGEM ( %s, %s )' ;
var
  LSQLStmt : string ;
begin

    try
      cdsPesagens.CancelUpdates ;
      cdsPesagens.DisableControls ;
      ApplyUpdates ;

      if ( cdsRetiros.RecordCount < 3 ) or ( cdsRetiros.RecNo = 1 ) then
         begin
            if FRetiroSelected = 'NULL'  then
           FRetiroCaption  := 'Todos os animais em lactação' ;
           FRetiroSelected := 'NULL' ;
         end
      //else if ( cdsRetiros.RecNo = cdsRetiros.RecordCount ) then
      else if ( cdsRetirosRETIRO.AsString = '<animais sem retiro>' ) then
         begin
           FRetiroCaption  := 'animais sem retiro'  ;
           FRetiroSelected := QuotedStr ( '' )
         end
      else
         begin
           FRetiroCaption  := Format ( 'animais do retiro : %s', [cdsRetirosRETIRO.AsString] )  ;
           FRetiroSelected := QuotedStr ( cdsRetirosRETIRO.AsString ) 
         end;
      LSQLStmt :=
       Format ( _SQL_INITLOTEPESAGEM,
                [  QuotedStr ( cdsLotePesagemKZOO_LOTEPESAGEM_LEITE.asString ),
                   FRetiroSelected  ] ) ;

      sqlLotePesagem.SQLConnection.ExecuteDirect( LSQLStmt ) ;
      cdsLotePesagem.Close ;
      OpenTables ;

    finally
      cdsPesagens.EnableControls ;
    end;

end;


procedure TZoo_ProducaoControleLeiteiroDatamodule2.SetOnConfirmaPeso(const Value: TConfirmaPeso);
begin
  FOnConfirmaPeso := Value;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.SetOnQueryReopenBatch(
  const Value: TOnQueryReopenBatch);
begin
  FOnQueryReopenBatch := Value;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.SetParams;
begin
   cdsLotePesagem.params.paramByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;

   if FRetiroSelected = 'NULL'  then
     begin
       cdsLotePesagem.params.paramByName ( 'RETIRO' ).Clear ;
       cdsLotePesagem.params.paramByName ( 'RETIRO' ).Bound := True ;
     end
   else if FRetiroSelected = QuotedStr ( '' ) then
     begin
      cdsLotePesagem.params.paramByName ( 'RETIRO' ).asString := '' ;
      cdsLotePesagem.params.paramByName ( 'RETIRO' ).Bound := True ;
     end
   else
     begin
      cdsLotePesagem.params.paramByName ( 'RETIRO' ).asString := AnsiDequotedStr( FRetiroSelected, '''' ) ;
      cdsLotePesagem.params.paramByName ( 'RETIRO' ).Bound := True ;
     end

end;




procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagemBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

(*
procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagemDATAValidate(Sender: TField);
const
  _SQL_MAIOR_DATA = 'MAX ( DATA ) DATA from ZOO_LOTEPESAGEM_LEITE'
                  +#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
                  +#13#10'AND PROCESSADO = ''T''' ;
var
  cds : TClientDataSet ;
  p : TParams ;
begin
   if Sender.AsDateTime = 0 then
      raise Warning.Create('Data Inválida');

   if Sender.AsDateTime > Date then
      raise Warning.Create('Data da pesagem não pode ser superior a data atual.');

   cds := nil ;
   p := TParams.Create ;
   p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
   DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_MAIOR_DATA, p ) ;
   try
     if Sender.AsDateTime <= cds.FieldByName('DATA').AsDateTime then
        raise Warning.Create( 'Último processamento foi em ' + FormatDateTime ( 'dd.mm.yyyy', cds.FieldByName('DATA').AsDateTime ) ) ;
   finally
     cds.Free ;
     p.Free ;
   end;

end;
*)

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagemDATAValidate(Sender: TField);
const
  _SQL_PESAGEM_DATA = 'KZOO_LOTEPESAGEM_LEITE from ZOO_LOTEPESAGEM_LEITE'
                  +#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA AND DATA = :DATA' ;

  _SQL_MAIOR_DATA = 'MAX ( DATA ) DATA from ZOO_LOTEPESAGEM_LEITE'
                  +#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA'
                  +#13#10'AND PROCESSADO = ''T''' ;

var
  cds : TClientDataSet ;
  p : TParams ;
  LUltimoProcessamento : TDateTime ;
begin
   FLoteAResetar := '' ;
   if Sender.AsDateTime = 0 then
      raise Warning.Create('Data Inválida');

   if Sender.AsDateTime > Date then
      raise Warning.Create('Data da pesagem não pode ser superior a data atual.');

   if cdsPesagens.RecordCount = 0 then
     begin
       cds := nil ;
       p := TParams.Create ;
       p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
       p.CreateParam ( ftString, 'DATA',         ptInput ).asSQLTimeStamp  := Sender.AsSQLTimeStamp ;
       DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_PESAGEM_DATA, p ) ;     
       FLoteAResetar := cds.FieldByName('KZOO_LOTEPESAGEM_LEITE').AsString  ;
       cds.Free ;
       p.Free ;       
     end ;
                                     
   if FLoteAResetar <> '' then  
     begin
       if QueryReopenBatch( Sender.AsDateTime ) then
         begin
            ThreadSuppl.TSyncThread.Create ( ResetLoteProcessado ) ;
            exit ;
         end;
     end;

   cds := nil ;
   p := TParams.Create ;
   p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
   DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SQL_MAIOR_DATA, p ) ;
   LUltimoProcessamento := cds.FieldByName('DATA').AsDateTime ;
   cds.Free ;
   p.Free ;
   
   if Sender.AsDateTime <= LUltimoProcessamento then
     raise Warning.Create( 'Último processamento foi em ' + FormatDateTime ( 'dd.mm.yyyy', LUltimoProcessamento ) ) ;

end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagemNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsLotePesagemKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsLotePesagemNORD.asInteger := 3 ;
  cdsLotePesagemPROCESSADO.AsString := 'F' ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensANIMAL_DOENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if cdsPesagens.BOF and cdsPesagens.EOF  then
     exit ;
  if DisplayText then
     begin
       if Sender.AsBoolean then
          Text := 'Sim'
       else
          Text := 'Não'
     end;

end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensBeforeScroll(
  DataSet: TDataSet);
begin
   if DataSet.State in [dsInsert,dsEdit] then
     begin
        DataSet.Post
     end;
end;

type
TDataSetHack = class(TDataSet);

procedure TZoo_ProducaoControleLeiteiroDatamodule2.ForceOnCalcFieldsEvent(ADataSet : TDataSet);
begin
 If Not (ADataSet.State in ([dsCalcFields, dsInternalCalc, dsInActive])) then
   TDataSetHack(ADataSet).GetCalcFields(TDataSetHack(ADataSet).CalcBuffer);
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensCalcFields(
  DataSet: TDataSet);
begin

 if ( DataSet.State  in [ dsInsert, dsEdit ] ) then
   begin
     cdsPesagens.OnCalcFields := nil ;
      if cdsLotePesagemNORD.asInteger > 2 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat + cdsPesagensORD3.asFloat
      else if cdsLotePesagemNORD.asInteger > 1 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat
      else if cdsLotePesagemNORD.asInteger > 0 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat
      else
         cdsPesagensTOTAL.AsFloat := 0 ;
     cdsPesagens.OnCalcFields := cdsPesagensCalcFields ;
   end;
(*
 if ( DataSet.State  in [ dsInsert, dsEdit ] ) then
   begin
     cdsPesagens.OnCalcFields := nil ;
      if cdsLotePesagemNORD.asInteger > 2 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat + cdsPesagensORD3.asFloat
      else if cdsLotePesagemNORD.asInteger > 1 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat
      else if cdsLotePesagemNORD.asInteger > 0 then
         cdsPesagensTOTAL.AsFloat := cdsPesagensORD1.asFloat
      else
         cdsPesagensTOTAL.AsFloat := 0 ;
     cdsPesagens.OnCalcFields := cdsPesagensCalcFields ;
   end;
*)
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensLOTEValidate(Sender: TField);
begin
   DBResources['ZOOTECNICO'].ExecuteDirect(
     Format ( 'UPDATE ZOO_ANIMAIS_FEMEA SET LOTE = ''%s'' WHERE KZOO_ANIMAL_FEMEA = ''%s''',
     [ Sender.AsString, cdsPesagensKZOO_ANIMAL.asString ] ) ) ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensORD1Validate(Sender: TField);
begin
  if ( Sender.AsFloat > 60 ) and Assigned( FOnConfirmaPeso ) then
    begin
       if not FOnConfirmaPeso ( 60 ) then
          Abort ;
    end;
end;



procedure TZoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensTOTALGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
 somaTotal : double ;
begin
  if cdsPesagens.IsEmpty then
    begin
     Text := '' ;
     exit ;
    end ;

  if cdsLotePesagemNORD.asInteger > 2 then
     somaTotal := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat + cdsPesagensORD3.asFloat
  else if cdsLotePesagemNORD.asInteger > 1 then
     somaTotal := cdsPesagensORD1.asFloat + cdsPesagensORD2.asFloat
  else if cdsLotePesagemNORD.asInteger > 0 then
     somaTotal := cdsPesagensORD1.asFloat
  else
     somaTotal := 0 ;

  Text := FormatFloat ( cdsPesagensTOTAL.DisplayFormat, somaTotal ) ;

end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.CheckDoente;
begin

   cdsPesagens.DisableControls ;
   TCDSSuppl.PostIfNeed ( cdsPesagens ) ;
   try
     with cdsPesagens do
       begin
          first ;
          while not eof do
             begin
               if   cdsPesagensORD1.isNull
                and cdsPesagensORD2.isNull
                and cdsPesagensORD3.isNull then
                  begin
                    Edit ;
                    cdsPesagensANIMAL_DOENTE.asString := 'T' ;
                    Post ;
                  end;

               next ;
             end;
       end;
     ApplyUpdates ;
   finally
     cdsPesagens.EnableControls ;
   end;

end;

function TZoo_ProducaoControleLeiteiroDatamodule2.CheckLoteProcessado : boolean;
const
  _SELECT_ANIMAIS_SEM_PESAGEM =
           'SELECT 1 RESULT FROM ZOO_PESAGEM_LEITE'
    +#13#10'WHERE KZOO_LOTEPESAGEM_LEITE = :KZOO_LOTEPESAGEM_LEITE'
    +#13#10' AND (TOTAL = 0)'
    +#13#10' AND ANIMAL_DOENTE = ''F'''
    +#13#10'ROWS 1' ;

  _UPDATE_LOTE_PROCESSADO =
           'UPDATE ZOO_LOTEPESAGEM_LEITE' 
    +#13#10' SET PROCESSADO = ''T''' 
    +#13#10'WHERE KZOO_LOTEPESAGEM_LEITE = :KZOO_LOTEPESAGEM_LEITE' ;
var

  p : TParams ;
  cds : TClientDataSet ;
  LExisteSemPesagem : boolean ;

begin

 cds := nil ;
 p := TParams.Create ;
 p.CreateParam( ftString, 'KZOO_LOTEPESAGEM_LEITE', ptInput ).AsString := cdsLotePesagemKZOO_LOTEPESAGEM_LEITE.AsString ;
 DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_ANIMAIS_SEM_PESAGEM, p ) ;

 LExisteSemPesagem := cds.FieldByName('RESULT').asInteger = 1 ;
 cds.Free ;

 if not LExisteSemPesagem then
   DBResources['ZOOTECNICO'].Execute( _UPDATE_LOTE_PROCESSADO, p ) ;
 p.Free ;

 Result := not LExisteSemPesagem ;
end;

constructor TZoo_ProducaoControleLeiteiroDatamodule2.Create(AOwner: TComponent);
begin
  inherited;
  FRetiroSelected := 'NULL' ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.dspLotePesagemBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
   if SourceDS = sqlLotePesagem then
      OutputDebugString ( 'Lote' )
   else if SourceDS = sqlPesagens then
      OutputDebugString ( 'Leite' ) ;

   Applied := False ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.dspLotePesagemGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
   if DataSet = sqlLotePesagem then
      TableName :=  'ZOO_LOTEPESAGEM_LEITE'
   else if DataSet = sqlPesagens then
      TableName :=  'ZOO_PESAGEM_LEITE'
end;

function TZoo_ProducaoControleLeiteiroDatamodule2.GetCaption: string;
begin
   Result := FRetiroCaption
end;

function TZoo_ProducaoControleLeiteiroDatamodule2.GetRetiros: boolean;
const

   _SELECT_RETIROS =
         'SELECT ''<todos animais em lactação>'' RETIRO'
  +#13#10'FROM RDB$DATABASE'
  +#13#10'UNION ALL'
  +#13#10'SELECT DISTINCT TRIM( F.RETIRO ) RETIRO'
  +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
  +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
  +#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA AND F.RETIRO IS NOT NULL AND TRIM(F.RETIRO) <> '''''
  +#13#10'  AND A.STATUS <> :STATUS_DESCARTADA'
  +#13#10'UNION ALL'
  +#13#10'SELECT ''<animais sem retiro>'' RETIRO'
  +#13#10'FROM RDB$DATABASE'
  +#13#10'WHERE EXISTS (SELECT 1 FROM ZOO_ANIMAIS_FEMEA F INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
  +#13#10'                WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA AND (F.RETIRO IS NULL OR TRIM(F.RETIRO) = '''')'
   +#13#10'                 AND A.STATUS <> :STATUS_DESCARTADA'
  +#13#10'                ROWS 1 )' ;
var
  p : TParams ;
begin
  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).AsString := LoggedUser.DomainID ;
  p.CreateParam( ftString, 'STATUS_DESCARTADA', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsRetiros, _SELECT_RETIROS, p ) ;
  p.Free ;
  Result := cdsRetiros.RecordCount > 2 ;
  if not Result then
     FRetiroSelected := 'NULL' ;
end;

procedure TZoo_ProducaoControleLeiteiroDatamodule2.UpdatePesagensFromFile;
begin
   if cdsPesagens.Locate( 'BRINCO', cdsImportBrinco.AsString, [] ) then
     begin
       FCountPesagensImportadas := FCountPesagensImportadas + 1 ;
       cdsPesagens.Edit ;
       cdsPesagensORD1.Clear ;
       cdsPesagensORD2.Clear ;
       cdsPesagensORD3.Clear ;
       if not cdsImportORD1.isNull then
         cdsPesagensORD1.AsFloat := cdsImportORD1.AsFloat ;
       if not cdsImportORD2.isNull then
          cdsPesagensORD2.AsFloat := cdsImportORD2.AsFloat ;
       if not cdsImportORD3.isNull then
          cdsPesagensORD3.AsFloat := cdsImportORD3.AsFloat ;
       cdsPesagens.Post ;
     end;
end;

function TryExclusiveFileAccess(const AFileName: String ; ACount : integer = 1  ; ADelay : integer = 1000 ) : boolean ;
var
  LFileHandle : Integer;
begin
  if not FileExists( AFileName )  then
     Exit  ( False ) ;

  repeat
     LFileHandle := System.SysUtils.FileOpen(AFileName, fmOpenRead or fmShareExclusive );
     Result := (LFileHandle >= 0) ;
     if ( not Result )  and ( ACount > 0 ) then
        Sleep ( ADelay ) ;
     Dec ( ACount ) ;
  until (Result) or (ACount = 0);

  if (Result) then
     System.SysUtils.FileClose( LFileHandle ) ;
end;


procedure TZoo_ProducaoControleLeiteiroDatamodule2.ImportFromXLS(AFileName: string);
begin
   if not TryExclusiveFileAccess(AFileName, 2 ) then
       Raise Fail.Create( 'Não foi possível importar o arquivo. '
           +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;

   TCDSSuppl.CreateDataSet( cdsImport ) ;
   SMImportFromXLS1.SourceFileName := AFileName ;
   SMImportFromXLS1.Execute ;
   FCountPesagensImportadas := 0 ;

   cdsImport.DisableControls ;
   cdsPesagens.DisableControls ;
   try
     with cdsImport do
       begin
          first ;
          while not eof do
             begin
               UpdatePesagensFromFile;
               next ;
             end;
       end;
     ApplyUpdates ;
   finally
     cdsImport.EnableControls ;
     cdsPesagens.EnableControls ;
   end;

end;

end.


