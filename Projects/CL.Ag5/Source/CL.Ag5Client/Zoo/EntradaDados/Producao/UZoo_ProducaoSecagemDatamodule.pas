unit UZoo_ProducaoSecagemDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_ProducaoSecagemDatamodule = class(T_dtmBASE)
    cdsSecagens: TClientDataSet;
    dspSecagens: TDataSetProvider;
    sqlSecagens: TTcSQLDataSet;
    cdsMotivoSecagem: TClientDataSet;
    cdsMotivoSecagemTIPO: TStringField;
    cdsMotivoSecagemVALOR: TStringField;
    cdsMotivoSecagemDESCRICAO: TStringField;
    cdsMotivoSecagemORDEM: TIntegerField;
    sqlSecagensKZOO_ANIMAL_FEMEA: TStringField;
    sqlSecagensBRINCO: TStringField;
    sqlSecagensNOME: TStringField;
    sqlSecagensKZOO_LACTACAO: TStringField;
    cdsSecagensKZOO_ANIMAL_FEMEA: TStringField;
    cdsSecagensBRINCO: TStringField;
    cdsSecagensNOME: TStringField;
    cdsSecagensKZOO_LACTACAO: TStringField;
    sqlSecagensCAUSA_SECAGEM: TIntegerField;
    sqlSecagensOBS_SECAGEM: TMemoField;
    cdsSecagensCAUSA_SECAGEM: TIntegerField;
    cdsSecagensOBS_SECAGEM: TMemoField;
    sqlSecagensDATA_SECAGEM: TSQLTimeStampField;
    cdsSecagensDATA_SECAGEM: TSQLTimeStampField;
    cdsSecagensDESCR_CAUSA: TStringField;
    sqlSecagensAPLICADO_PROTOCOLO_SECAGEM: TStringField;
    cdsSecagensAPLICADO_PROTOCOLO_SECAGEM: TStringField;
    sqlSecagensULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    cdsSecagensULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    sqlSecagensDATAABORTOPARTO: TSQLTimeStampField;
    cdsSecagensDATAABORTOPARTO: TSQLTimeStampField;
    sqlSecagensBRINCO_: TStringField;
    cdsSecagensBRINCO_: TStringField;
    cdsListaProtocolos: TClientDataSet;
    cdsProtocolosSecagem: TClientDataSet;
    cdsProtocolosSecagemSELECTED: TIntegerField;
    cdsProtocolosSecagemKZOO_PROTOCOLO: TStringField;
    cdsProtocolosSecagemCODIGO: TStringField;
    cdsProtocolosSecagemNOME: TStringField;
    cdsProtocolosSecagemSOMA_SELECTED: TAggregateField;
    cdsProtocolosSecagemKZOO_ANIMAL_FEMEA: TStringField;
    cdsSecagensDESCR_PROTOCOLO: TStringField;
    procedure cdsSecagensBRINCOValidate(Sender: TField);
    procedure dspSecagensBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsSecagensNewRecord(DataSet: TDataSet);
    procedure cdsSecagensDATA_SECAGEMValidate(Sender: TField);
  private
    { Private declarations }
    FAplicarProtocolo : boolean ;
    procedure GetDadosAnimal ( AKey : string ) ;

    procedure LoadListaProtocolos;
    procedure ClearAllCdsProtocolos( ACds: TClientDataSet );
    procedure SetListaProtocolosToCds( ACds: TClientDataSet );
    procedure ClearCdsProtocolosByAnimalFemea( ACds: TClientDataSet );
    procedure InsertProtocolos( ACds: TClientDataSet; AKZooAnimalFemea: String; AData: TDateTime);
  public
    { Public declarations }
    function Processa ( out ErrMsg : string ) : boolean ;
    procedure OpenTables ; override ;
    procedure SelecionaAnimais (AAte: TDateTime);
    procedure RemoveBrincoSelecionado ;
    procedure AplicarProtocolos( AAplicar : boolean )  ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddBrinco ( ABrinco : string  ) : boolean ;


    procedure UpdateDescrProtocolos;
    procedure FilterProtocolosByAnimalFemea;
    procedure InvertSelecao( cds : TClientDataSet);
    procedure InvertAllSelection(
  ASelectAll: Boolean; Acds: TClientDataSet);
    function IsAllSelected( ACds: TClientDataSet ): Boolean;
    function NothingSelected( ACds: TClientDataSet ): Boolean;
  end;

implementation

uses UDBZootecnico, Exceptions, CLAg5Types,
     DateUtils, Data.SQLTimSt,
     DiagnosticosAnimalClass,
     ClAg5ClientZootecnicoCommonTypes,
     ProtocolosAnimalClass,
     CDSSuppl ;

{$R *.dfm}

const
  _AUTO_EVT_SECAGEM                  =   'AUTO_EVT_SECAGEM'                ;


function TZoo_ProducaoSecagemDatamodule.AddBrinco(ABrinco: string): boolean;
var
    KeyAnimal : string ;
begin
  Result := LocateBrinco ( ABrinco ) ;

  if Result then
    begin
       cdsSecagens.Edit ;
       exit ;
    end ;

  Result := TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

  if Result then
     begin
      cdsSecagens.Append ; // restante dos dados pegos no validate do brinco
      cdsSecagensBRINCO.asString := ABrinco ;
      cdsSecagens.Post ;  // ordenar ...
      cdsSecagens.Edit ;
     end;
end;



procedure TZoo_ProducaoSecagemDatamodule.AplicarProtocolos(AAplicar: boolean);
var
  strAplicar : string ;
begin
   FAplicarProtocolo := AAplicar ;

   if FAplicarProtocolo then
     strAplicar := 'T'
   else
     strAplicar := 'F' ;

   with cdsSecagens do
     try
        disableControls ;
        first ;
        while not eof  do
           begin
             edit ;
             cdsSecagensAPLICADO_PROTOCOLO_SECAGEM.AsString := strAplicar ;
             post;
             next ;
           end;
        first ;
     finally
        EnableControls ;
     end;
end;


procedure TZoo_ProducaoSecagemDatamodule.cdsSecagensBRINCOValidate(Sender: TField);
var
 AKey : string ;
begin
   if not TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, Sender.asString, AKey ) then
      raise Warning.Create('Animal não encontrado/descartado');

   try
     GetDadosAnimal ( AKey ) ;
   except
      cdsSecagens.Cancel ;
     raise  ;
   end;
end;

procedure TZoo_ProducaoSecagemDatamodule.cdsSecagensDATA_SECAGEMValidate(
  Sender: TField);
begin
  if cdsSecagensDATA_SECAGEM.isNull then
   begin
     ClearCdsProtocolosByAnimalFemea( cdsProtocolosSecagem );
     UpdateDescrProtocolos;
   end
  else
   begin
     SetListaProtocolosToCds( cdsProtocolosSecagem );
     UpdateDescrProtocolos;
   end;


end;

procedure TZoo_ProducaoSecagemDatamodule.cdsSecagensNewRecord(
  DataSet: TDataSet);
begin
  if FAplicarProtocolo then
     cdsSecagensAPLICADO_PROTOCOLO_SECAGEM.AsString := 'T'
  else
     cdsSecagensAPLICADO_PROTOCOLO_SECAGEM.AsString := 'F'

end;

procedure TZoo_ProducaoSecagemDatamodule.ClearAllCdsProtocolos(
  ACds: TClientDataSet);
begin
  ACds.Filtered := False;
  ACds.DisableControls;
  ACds.First;
  while not ACds.Eof do
    ACds.Delete;

  ACds.EnableControls;
end;

procedure TZoo_ProducaoSecagemDatamodule.ClearCdsProtocolosByAnimalFemea(
  ACds: TClientDataSet);
begin
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_ANIMAL_FEMEA = ''%s'' ', [cdsSecagensKZOO_ANIMAL_FEMEA.AsString] );
  ACds.Filtered := True;

  ACds.DisableControls;
  ACds.First;
  while not ACds.Eof do
    ACds.Delete;

  ACds.EnableControls;
end;

procedure TZoo_ProducaoSecagemDatamodule.dspSecagensBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  p : TParams ;
  KZOO_ANIMAL, KZOO_LACTACAO : string ;


  procedure UpdateAnimal ;
  begin
     p.Clear ;
     p.CreateParam( ftInteger, 'VS',          ptInput ).asInteger       := _ST_STATUS_FEMEA_VACASECA ;
     p.CreateParam( ftString,  'DATASTATUS',  ptInput ).asSQLTimeStamp  := DeltaDS.FieldByName( 'DATA_SECAGEM' ).asSQLTimeStamp ;
     p.CreateParam( ftString,  'KZOO_ANIMAL', ptInput ).AsString        := KZOO_ANIMAL ;
     DBResources['ZOOTECNICO'].Execute( 'UPDATE ZOO_ANIMAIS SET STATUS = :VS, DATASTATUS = :DATASTATUS WHERE KZOO_ANIMAL = :KZOO_ANIMAL', p );
  end;

  procedure UpdateLactacao ;
  const
    UPDATE_LACTACAO = 'UPDATE ZOO_LACTACOES'
      +#13#10'SET'
      +#13#10'DATA_SECAGEM = :DATA_SECAGEM,'
      +#13#10'CAUSA_SECAGEM = :CAUSA_SECAGEM,'
      +#13#10'APLICADO_PROTOCOLO_SECAGEM = :APLICADO_PROTOCOLO_SECAGEM,'
      +#13#10'OBS_SECAGEM = :OBS_SECAGEM'
      +#13#10'WHERE KZOO_LACTACAO = :KZOO_LACTACAO' ;
  var
     Stm : TStringStream ;
  begin
     if DeltaDS.FieldByName( 'KZOO_LACTACAO' ).NewValue = null then
        exit ;

     p.Clear ;
     p.CreateParam( ftTimeStamp, 'DATA_SECAGEM', ptInput ).asSQLTimeStamp         := DeltaDS.FieldByName( 'DATA_SECAGEM' ).asSQLTimeStamp ;
     p.CreateParam( ftInteger,   'CAUSA_SECAGEM', ptInput ).AsInteger             := DeltaDS.FieldByName( 'CAUSA_SECAGEM' ).asInteger ;
     p.CreateParam( ftString,    'APLICADO_PROTOCOLO_SECAGEM', ptInput ).asString := DeltaDS.FieldByName( 'APLICADO_PROTOCOLO_SECAGEM' ).asString ;
     p.CreateParam( ftBlob,      'OBS_SECAGEM',  ptInput ).Bound := False ;

     if DeltaDS.FieldByName ( 'OBS_SECAGEM' ).asString <> '' then
       begin
          Stm := TStringStream.Create ( DeltaDS.FieldByName ( 'OBS_SECAGEM' ).asString ) ;
          Stm.Position := 0 ;
          p.ParamByName ( 'OBS_SECAGEM' ).LoadFromStream ( stm, ftBlob ) ;
          Stm.free ;
       end;

     p.CreateParam( ftString, 'KZOO_LACTACAO', ptInput ).AsString := KZOO_LACTACAO ;
     DBResources['ZOOTECNICO'].Execute( UPDATE_LACTACAO, p );
  end;

  procedure AplicarProtocolo;
  begin
     //if DeltaDS.FieldByName( 'APLICADO_PROTOCOLO_SECAGEM' ).asBoolean then
     //   DiagnosticosAnimalClass.TEventosAnimal.AddSecagem( KZOO_ANIMAL, DeltaDS.FieldByName( 'DATA_SECAGEM' ).AsDateTime );
  end;

begin
  try
     if  ( DeltaDS.FieldByName( 'DATA_SECAGEM' ).NewValue = Unassigned )
      or ( DeltaDS.FieldByName( 'CAUSA_SECAGEM' ).NewValue = Unassigned ) then
       exit ;

     p := TParams.Create ;
     KZOO_ANIMAL := DeltaDS.FieldByName( 'KZOO_ANIMAL_FEMEA' ).NewValue ;
     KZOO_LACTACAO := DeltaDS.FieldByName( 'KZOO_LACTACAO' ).NewValue ;

     UpdateAnimal ;
     UpdateLactacao ;
     //AplicarProtocolo;
     InsertProtocolos( cdsProtocolosSecagem,
                       DeltaDS.FieldByName( 'KZOO_ANIMAL_FEMEA' ).NewValue,
                       DeltaDS.FieldByName( 'DATA_SECAGEM' ).asDateTime);

  finally
     p.Free ;
     Applied := True ;
  end;

end;

procedure TZoo_ProducaoSecagemDatamodule.FilterProtocolosByAnimalFemea;
begin
  cdsProtocolosSecagem.Filtered := False;
  cdsProtocolosSecagem.Filter   := Format( 'KZOO_ANIMAL_FEMEA= ''%s'' ', [cdsSecagensKZOO_ANIMAL_FEMEA.AsString] );
  cdsProtocolosSecagem.Filtered := True;
end;

procedure TZoo_ProducaoSecagemDatamodule.GetDadosAnimal ( AKey : string ) ;
const
  _SELECT_ANIMAL_ASECAR =
           'F.KZOO_ANIMAL_FEMEA, A.BRINCO, A.BRINCO_, COALESCE ( A.NOMEESTABULO, A.NOMECOMPLETO ) NOME,'
    +#13#10'A.STATUS, L.KZOO_LACTACAO, L.ULTIMA_PESAGEMLEITE, E.DATAABORTOPARTO'
    +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
    +#13#10'INNER JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
    +#13#10'INNER JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = F.KULTIMA_LACTACAO'
    +#13#10'INNER JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'WHERE F.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA AND A.KCAD_FAZENDA = :KCAD_FAZENDA' ;

var
  cds : TClientDataSet ;
  p : TParams ;
  cdsLocate : TClientDataSet  ;
begin
   cds := nil ;
   cdsLocate := nil ;
   p := nil ;

  try

    cdsLocate := TClientDataSet.Create( nil ) ;
    cdsLocate.CloneCursor ( cdsSecagens, False, False ) ;

    if cdsLocate.Locate ( 'KZOO_ANIMAL_FEMEA', AKey, [] ) then
       raise Warning.Create('Animal já esta na lista');

    p := TParams.Create ;
    p.CreateParam ( ftString,    'KCAD_FAZENDA',      ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam ( ftString,    'KZOO_ANIMAL_FEMEA', ptInput ).asString := AKey ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_ANIMAL_ASECAR, p ) ;

    if cds.IsEmpty then
       raise Warning.Create('Animal não encontrado') ;

    if cds.FieldByName ( 'STATUS' ).asInteger <> _ST_STATUS_FEMEA_VACALACTACAO  then
       raise Warning.Create('Animal não é VL') ;

    cdsSecagensBRINCO.OnValidate := nil ;
    cdsSecagens.DisableControls ;
    cdsSecagensKZOO_ANIMAL_FEMEA.asString     := cds.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
    cdsSecagensBRINCO.asString                := cds.FieldByName ( 'BRINCO' ).asString ;
    cdsSecagensBRINCO_.asString               := cds.FieldByName ( 'BRINCO_' ).asString ;
    cdsSecagensNOME.asString                  := cds.FieldByName ( 'NOME' ).asString ;
    cdsSecagensKZOO_LACTACAO.asString         := cds.FieldByName ( 'KZOO_LACTACAO' ).asString ;
    if not cds.FieldByName ( 'ULTIMA_PESAGEMLEITE' ).isNull then
       cdsSecagensULTIMA_PESAGEMLEITE.AsDateTime := cds.FieldByName ( 'ULTIMA_PESAGEMLEITE' ).asDateTime ;
    if not cds.FieldByName ( 'DATAABORTOPARTO' ).isNull then
       cdsSecagensDATAABORTOPARTO.asString     := cds.FieldByName ( 'DATAABORTOPARTO' ).asString ;

    if FAplicarProtocolo then
       cdsSecagensAPLICADO_PROTOCOLO_SECAGEM.asString           := 'T'
    else
       cdsSecagensAPLICADO_PROTOCOLO_SECAGEM.asString           := 'F' ;
    //cdsSecagens.Post ;
    //cdsSecagens.Edit ;
    cdsSecagensBRINCO.OnValidate := cdsSecagensBRINCOValidate ;

  finally
    cdsLocate.free ;
    cdsSecagens.EnableControls ;
    if Assigned ( cds )  then
       cds.Free ;
    if Assigned ( p )  then
       p.free ;
  end;

end;

procedure TZoo_ProducaoSecagemDatamodule.InsertProtocolos(ACds: TClientDataSet;
  AKZooAnimalFemea: String; AData: TDateTime);
begin
  ACds.DisableControls;
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_ANIMAL_FEMEA = ''%s'' ', [ AKZooAnimalFemea ] );
  ACds.Filtered := True;

  ACds.First;
  while not ACds.Eof do
   begin
     if ACds.FieldByName('SELECTED').AsInteger = 1 then
       TProtocolosAnimal.AddProtocolo (
            AKZooAnimalFemea                                   // AKAnimal
          , ACds.FieldByName('KZOO_PROTOCOLO')    .asString    // AKProtocolo
          , AData                                              // AData
          , ''                                                 // AKDiagnosticoAnimal
          , ''                                                 // AKTarefaAnimal
          , ''                                                 // AKResultadoTarefa
          , 0                                                  // AResultado
          , True                                               // InsertTarefas
          , ''                                                 // ALote :
          , True                                               // AGetLoteIfEmpty
          , False                                              // ANotify
        ) ;
     ACds.Next;
   end;


  ACds.EnableControls;
end;

procedure TZoo_ProducaoSecagemDatamodule.InvertAllSelection(ASelectAll: Boolean;
  Acds: TClientDataSet);
var
  checked : integer ;
  LIndexName: String;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  with  TClientDataSet( Acds ) do
    begin
      DisableControls ;
      LIndexName := IndexName;
      IndexName := '';
      First ;
      while not eof do
         begin
           Edit ;
           FieldByName('SELECTED').asInteger := checked ;
           Post ;
           Next ;
         end;
      IndexName := LIndexName;
      First ;
      EnableControls ;
    end;

end;

procedure TZoo_ProducaoSecagemDatamodule.InvertSelecao(cds: TClientDataSet);
begin
  with  cds  do
   begin
     Edit ;
     if FieldByName('SELECTED').asInteger = 0 then
        FieldByName('SELECTED').asInteger := 1
     else
        FieldByName('SELECTED').asInteger := 0 ;

     Post ;
   end;
end;

function TZoo_ProducaoSecagemDatamodule.IsAllSelected(
  ACds: TClientDataSet): Boolean;
begin
  Result := ACds.FieldByName('SOMA_SELECTED').Value = ACds.RecordCount;
end;

procedure TZoo_ProducaoSecagemDatamodule.LoadListaProtocolos;
const
  _SELECT_PROTOCOLOS =
         'select'
  +#13#10'       0 SELECTED,'
  +#13#10'       P.KZOO_PROTOCOLO,'
  +#13#10'       P.CODIGO,'
  +#13#10'       P.NOME,'
  +#13#10'       P.TIPOPROTOCOLO,'
  +#13#10'       D.TIPOEVENTO,'
  +#13#10'       D.SYS$EVENTOID EVENTO_ID'
  +#13#10'  FROM ZOO_PROTOCOLOS P'
  +#13#10'  LEFT JOIN ZOO_DIAGNOSTICO_PROTOCOLOS DP ON P.KZOO_PROTOCOLO = DP.KZOO_PROTOCOLO'
  +#13#10'  LEFT JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = DP.KZOO_DIAGNOSTICO'
  +#13#10' WHERE P.ATIVO = ''T'''
  +#13#10'  ORDER BY 3, 2'
  ;

var
  p: TParams;
begin

  DBResources['ZOOTECNICO'].populateClientDataSet( cdsListaProtocolos, _SELECT_PROTOCOLOS ) ;


end;

function TZoo_ProducaoSecagemDatamodule.LocateBrinco(ABrinco: string): boolean;
begin
   Result := cdsSecagens.Locate( 'BRINCO', ABrinco, [] ) ;
end;

function TZoo_ProducaoSecagemDatamodule.NothingSelected(
  ACds: TClientDataSet): Boolean;
begin
  Result := ACds.FieldByName('SOMA_SELECTED').Value = 0;
end;

procedure TZoo_ProducaoSecagemDatamodule.OpenTables;
begin
//  inherited;
  LoadListaProtocolos;
  ClearAllCdsProtocolos( cdsProtocolosSecagem );

  FAplicarProtocolo := True ;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_STATUS_PRODUCAO, cdsMotivoSecagem );
  TCDSSuppl.CreateDataSet( cdsSecagens ) ;
  cdsSecagens.IndexFieldNames := 'BRINCO_' ;
end;


function TZoo_ProducaoSecagemDatamodule.Processa(
  out ErrMsg: string): boolean;
var
   Processa : boolean ;
begin
  ErrMsg := '' ;
  Processa := False ;

  with  cdsSecagens do
    try
         disableControls ;
         first ;
         while not eof do
           begin
             Processa := Processa or (( not cdsSecagensDATA_SECAGEM.isNull ) and ( not cdsSecagensCAUSA_SECAGEM.isNull )) ;

             if ( cdsSecagensDATA_SECAGEM.isNull ) and not cdsSecagensCAUSA_SECAGEM.isNull then
                ErrMsg := Format (  '%s'#13#10'- %s : sem data de secagem', [ ErrMsg, cdsSecagensBRINCO.AsString ] ) ;

             if ( cdsSecagensCAUSA_SECAGEM.isNull ) and not cdsSecagensDATA_SECAGEM.isNull then
                ErrMsg := Format (  '%s'#13#10'- %s : sem causa de secagem', [ ErrMsg, cdsSecagensBRINCO.AsString ] ) ;

             if ( cdsSecagensDATA_SECAGEM.AsDateTime > Date ) then
                ErrMsg := Format (  '%s'#13#10'- %s : Data da Secagem ( %s ) maior que data atual',
                          [ ErrMsg, cdsSecagensBRINCO.AsString, formatDateTime ( 'dd.mm.yyyy', cdsSecagensDATA_SECAGEM.AsDateTime ) ] )  ;

             if    ( not cdsSecagensDATA_SECAGEM.isNull )
               and ( not cdsSecagensULTIMA_PESAGEMLEITE.isNull )
               and ( cdsSecagensDATA_SECAGEM.AsDateTime < cdsSecagensULTIMA_PESAGEMLEITE.asDateTime ) then
                ErrMsg := Format (  '%s'#13#10'- %s : Data da Secagem ( %s ) menor que data da ultima pesagem de leite ( %s )',
                              [ ErrMsg,
                                cdsSecagensBRINCO.AsString,
                                formatDateTime ( 'dd.mm.yyyy', cdsSecagensDATA_SECAGEM.AsDateTime ),
                                formatDateTime ( 'dd.mm.yyyy', cdsSecagensULTIMA_PESAGEMLEITE.asDateTime  )
                              ] )  ;

             if    ( not cdsSecagensDATA_SECAGEM.isNull )
               and ( not cdsSecagensDATAABORTOPARTO.isNull )
               and ( cdsSecagensDATA_SECAGEM.AsDateTime < cdsSecagensDATAABORTOPARTO.asDateTime ) then
                ErrMsg := Format (  '%s'#13#10'- %s : Data da Secagem ( %s ) menor que data da lactação ( %s )',
                              [ ErrMsg,
                                cdsSecagensBRINCO.AsString,
                                formatDateTime ( 'dd.mm.yyyy', cdsSecagensDATA_SECAGEM.AsDateTime ),
                                formatDateTime ( 'dd.mm.yyyy', cdsSecagensDATAABORTOPARTO.asDateTime  )
                              ] )  ;

             next ;
           end;
      if ( ErrMsg <> '' ) then
        begin
         ErrMsg := 'Brinco   -  Erro'#13#10 + ErrMsg ;
         Exit ( False ) ;
        end;

      if not Processa then
         raise Warning.Create( 'Não processado' + #13#10 + 'Nenhum animal possui data/causa de secagem' ) ;
    finally
      EnableControls ;
    end;
    ApplyUpdates ;
    Result := True ;
end;

procedure TZoo_ProducaoSecagemDatamodule.RemoveBrincoSelecionado;
begin
   if not cdsSecagens.isEmpty then
    begin
     ClearCdsProtocolosByAnimalFemea( cdsProtocolosSecagem );
     cdsSecagens.Delete ;
    end;


end;

procedure TZoo_ProducaoSecagemDatamodule.SelecionaAnimais(AAte: TDateTime);
const
  _SELECT_ASECAR =
           'SELECT'
    +#13#10' F.KZOO_ANIMAL_FEMEA,'
    +#13#10' A.BRINCO,'
    +#13#10' A.BRINCO_,'
    +#13#10' COALESCE ( A.NOMEESTABULO, A.NOMECOMPLETO ) NOME,'
    +#13#10' L.KZOO_LACTACAO,'
    +#13#10' L.ULTIMA_PESAGEMLEITE,'
    +#13#10' E.DATAABORTOPARTO'
    +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
    +#13#10'INNER JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
    +#13#10'INNER JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = F.KULTIMA_LACTACAO'
    +#13#10'INNER JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
    +#13#10'WHERE A.KCAD_FAZENDA = :KCAD_FAZENDA'
    +#13#10'  AND A.STATUS = :VL'
    +#13#10'  AND ( ( SELECT EZ.PRENHEZ FROM ZOO_EVENTOS_ZOOTECNICOS EZ'
    +#13#10'            WHERE EZ.KZOO_EVENTO_ZOOTECNICO = F.KULTIMA_MONTA'
    +#13#10'              AND EZ.DATAABORTOPARTO IS NULL'
    +#13#10'         ) IS NOT DISTINCT FROM ''T'' )'
    +#13#10'  AND ( F.ULTIMA_LACTACAO IS NULL OR ( F.ULTIMA_MONTA > F.ULTIMA_LACTACAO ) )'
    +#13#10'  AND (    (( F.NUMERO_LACTACAO  > 1 ) AND ( DATEADD( :DIASMULTIPARA DAY TO F.ULTIMA_MONTA ) <= :DATA ))'
    +#13#10'        OR (( F.NUMERO_LACTACAO <= 1 ) AND ( DATEADD( :DIASPRIMIPARA DAY TO F.ULTIMA_MONTA ) <= :DATA ))'
    +#13#10'       )' ;

var
  cds : TClientDataSet ;
  p : TParams ;
  gestacaoPrimipara, gestacaoMultipara : integer  ;
  secarPrimipara, secarMultipara : integer  ;
begin
   cds := nil ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, gestacaoPrimipara, gestacaoMultipara ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, secarPrimipara, secarMultipara ) ;
////----   cdsSecagensBRINCO.OnValidate := nil ;

  try
    p := TParams.Create ;
    p.CreateParam( ftString,    'KCAD_FAZENDA',  ptInput ).asString       := LoggedUser.DomainID ;
    p.CreateParam( ftInteger,   'VL',            ptInput ).asInteger      := _ST_STATUS_FEMEA_VACALACTACAO ;
    p.CreateParam( ftInteger,   'DIASMULTIPARA', ptInput ).asInteger      := gestacaoMultipara - secarMultipara ;
    p.CreateParam( ftInteger,   'DIASPRIMIPARA', ptInput ).asInteger      := gestacaoPrimipara - secarPrimipara ;
    p.CreateParam( ftTimeStamp, 'DATA',          ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay( AAte ) ) ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_ASECAR, p ) ;

    if cds.IsEmpty then
       raise Warning.Create('Não há animais para secagem ') ;

    cdsSecagens.DisableControls ;
    cds.First ;
    cds.DisableControls;
    while not cds.eof  do
       begin
          if not  cdsSecagens.Locate ( 'KZOO_ANIMAL_FEMEA', cds.FieldByName( 'KZOO_ANIMAL_FEMEA' ).AsString, [] ) then
            begin
              cdsSecagens.Append ;
              cdsSecagensBRINCO.asString            := cds.FieldByName ( 'BRINCO' ).asString ;
              cdsSecagens.Post ;
            end;
          cds.next ;
       end;
  finally
    cds.EnableControls;
    cdsSecagens.First;
    cdsSecagens.EnableControls ;
//--------    cdsSecagensBRINCO.OnValidate := cdsSecagensBRINCOValidate ;
    cds.Free ;
    p.free ;
  end;

end;

procedure TZoo_ProducaoSecagemDatamodule.SetListaProtocolosToCds(
  ACds: TClientDataSet);
var
  LProtocolo_Previous: String;
begin
  ACds.Filtered := False;
  ACds.Filter   := Format( 'KZOO_ANIMAL_FEMEA = ''%s'' ', [cdsSecagensKZOO_ANIMAL_FEMEA .AsString] );
  ACds.Filtered := True;

  if ACds.RecordCount > 0 then
    Exit;

  if cdsListaProtocolos.IsEmpty then
    Exit;

  LProtocolo_Previous := '';
  cdsListaProtocolos.First;
  while not cdsListaProtocolos.Eof do
   begin

     if LProtocolo_Previous <> cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString then
       ACds.Append
     else
       Acds.Edit;

     ACds.FieldByName('KZOO_ANIMAL_FEMEA').AsString      := cdsSecagensKZOO_ANIMAL_FEMEA.AsString;
     ACds.FieldByName('KZOO_PROTOCOLO').AsString         := cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString;
     ACds.FieldByName('CODIGO').AsString                 := cdsListaProtocolos.FieldByName('CODIGO').AsString;
     ACds.FieldByName('NOME').AsString                   := cdsListaProtocolos.FieldByName('NOME').AsString;
     if ((ACds = cdsProtocolosSEcagem) and
         (cdsListaProtocolos.FieldByName('TIPOEVENTO').AsInteger = _ST_AUTO_EVT_SECAGEM) and
         (cdsListaProtocolos.FieldByName('EVENTO_ID').AsString = _AUTO_EVT_SECAGEM)
        )  then
       ACds.FieldByName('SELECTED').AsInteger := 1
     else
     if ACds.FieldByName('SELECTED').AsInteger <> 1 then
       ACds.FieldByName('SELECTED').AsInteger := 0;

     ACds.Post;
     LProtocolo_Previous := cdsListaProtocolos.FieldByName('KZOO_PROTOCOLO').AsString;
     cdsListaProtocolos.Next;
   end;
end;

procedure TZoo_ProducaoSecagemDatamodule.UpdateDescrProtocolos;
var
  LDescricao: String;
  LQtde_Protocolos_Selecionados_Secagem: Integer;
  LIndexName: String;
begin
  LDescricao := '';
  LQtde_Protocolos_Selecionados_Secagem := 0;
  LIndexName :=  cdsProtocolosSecagem.IndexName;
  cdsProtocolosSecagem.IndexName := '';

  cdsProtocolosSecagem.First;
  while not cdsProtocolosSecagem.Eof do
   begin
     if cdsProtocolosSecagemSELECTED.AsInteger = 1 then
      begin
        LDescricao := cdsProtocolosSecagemNOME.AsString;
        LQtde_Protocolos_Selecionados_Secagem := LQtde_Protocolos_Selecionados_Secagem + 1;
      end;
     cdsProtocolosSecagem.Next;
   end;

  cdsProtocolosSecagem.IndexName := LIndexName;
  cdsProtocolosSecagem.First;

  if (LQtde_Protocolos_Selecionados_Secagem = 0) then
     LDescricao := ''
  else
  if LQtde_Protocolos_Selecionados_Secagem > 1 then
   begin
     LDescricao := 'Protocolos : '+IntToStr(LQtde_Protocolos_Selecionados_Secagem)+' selecionado(s)';
   end;

  if not (cdsSecagens.State in [dsInsert, dsEdit] )then
     cdsSecagens.Edit;

  cdsSecagensDESCR_PROTOCOLO.AsString := LDescricao;



end;

end.


