unit UZoo_CrescimentoDesmameDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_CrescimentoDesmameDatamodule = class(T_dtmBASE)
    cdsDesmame: TClientDataSet;
    dspDesmame: TDataSetProvider;
    sqlDesmame: TTcSQLDataSet;
    sqlDesmameKZOO_ANIMAL: TStringField;
    sqlDesmameBRINCO: TStringField;
    sqlDesmameNOMEESTABULO: TStringField;
    sqlDesmameIDADE: TLargeintField;
    sqlDesmamePESO: TIntegerField;
    cdsDesmameKZOO_ANIMAL: TStringField;
    cdsDesmameBRINCO: TStringField;
    cdsDesmameNOMEESTABULO: TStringField;
    cdsDesmameIDADE: TLargeintField;
    cdsDesmamePESO: TIntegerField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsDesmameDESCR_STATUS: TStringField;
    sqlDesmameSTATUS: TIntegerField;
    cdsDesmameSTATUS: TIntegerField;
    sqlDesmameDATADESMAME: TSQLTimeStampField;
    cdsDesmameDATADESMAME: TSQLTimeStampField;
    procedure cdsDesmameBeforeOpen(DataSet: TDataSet);
    procedure cdsDesmameSTATUSChange(Sender: TField);
    procedure dspDesmameAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cdsDesmameDATADESMAMEChange(Sender: TField);
  private
    FDiasDesmame: integer;
    FPesoDesmame: integer;
    FDataPadrao : TDateTime;
    procedure SetDataPadrao(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    //function AddBrinco ( ABrinco : string  ) : boolean ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ) : boolean ;
    property PesoDesmame : integer read FPesoDesmame ;
    property DiasDesmame: integer read FDiasDesmame ;
    property DataPadrao : TDateTime read FDataPadrao write SetDataPadrao;
    procedure InvertStatus ;
    constructor Create ( AOwner : TComponent ) ; override ;

    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddByKey ( AKey : string ; AData : TDateTime ) : boolean ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CLAg5Types,
   ClAg5ClientZootecnicoCommonTypes,
   DiagnosticosAnimalClass,
   CDSSuppl ;



{$R *.dfm}

procedure TZoo_CrescimentoDesmameDatamodule.OpenTables;
begin
  //inherited;
  //
  TCDSSuppl.Open( cdsDesmame ) ;
end;

  procedure TZoo_CrescimentoDesmameDatamodule.SetDataPadrao(
  const Value: TDateTime);
begin
  FDataPadrao := Value;
end;

{
function TZoo_CrescimentoDesmameDatamodule.AddBrinco( ABrinco: string) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsDesmame.Locate( 'BRINCOORIGEM', ABrinco, [] ) ;
    if Result then
      begin
         cdsDesmame.Edit ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           cdsDesmame.AppendRecord( [ fieldByName ( 'KZOO_ANIMAL' ).asString,
                                   fieldByName ( 'BRINCO' ).asString,
                                   fieldByName ( 'NOMEESTABULO' ).asString,
                                   fieldByName ( 'BRINCO' ).asString ] )
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end; }

function TZoo_CrescimentoDesmameDatamodule.AddBrinco(ABrinco: string;
  AData: TDateTime): boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsDesmame.Edit ;
         if cdsDesmameDATADESMAME.IsNull then
           cdsDesmameDATADESMAME.AsDateTime := AData;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKey ( KeyAnimal, AData )  ;
end;

function TZoo_CrescimentoDesmameDatamodule.AddByKey(AKey: string;
  AData: TDateTime): boolean;
const
  SELECT_ANIMAL = ' AN.KZOO_ANIMAL,    '
           +#13#10' AN.BRINCO,         '
           +#13#10' AN.NOMEESTABULO,   '
           +#13#10' AN.STATUS,         '
           +#13#10' AF.NASCIMENTO,      '
           +#13#10' AN.DATADESMAME,     '
           +#13#10' DateDiff(day, AF.NASCIMENTO, Current_Date) "IDADE", '
           +#13#10' AF.MAIOR_PESO "PESO" '
           +#13#10'FROM ZOO_ANIMAIS AN '
           +#13#10'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL '
           +#13#10'WHERE KCAD_FAZENDA = :KCAD_FAZENDA '
           +#13#10'  AND KZOO_ANIMAL = :KZOO_ANIMAL   '
           +#13#10'  AND AN.STATUS = :BEZERRO '
           +#13#10'  AND ( DateDiff(day, AF.NASCIMENTO, Current_Date)  >= :DIAS '
           +#13#10'       OR AF.MAIOR_PESO >= :PESO )' ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString , 'KCAD_FAZENDA', ptInput ).asString  := LoggedUser.DomainID ;
    p.CreateParam( ftString , 'KZOO_ANIMAL' , ptInput ).asString  := AKey ;
    p.CreateParam( ftInteger, 'BEZERRO'      , ptInput ).asInteger:= _ST_STATUS_FEMEA_BEZERRO ;
    p.CreateParam( ftInteger, 'DIAS'        , ptInput ).asInteger := FDiasDesmame ;
    p.CreateParam( ftInteger, 'PESO'        , ptInput ).asInteger := FPesoDesmame ;
    cds := nil ;

    try
//       DBResources.populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, SELECT_ANIMAL, p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado ou fora dos parâmetros para desmame.');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

      // FNascimento := cds.fieldByName ( 'NASCIMENTO' ).AsDateTime;

       with cds do
         begin
           cdsDesmame.Append ;
           cdsDesmameKZOO_ANIMAL.asString         := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
           cdsDesmameBRINCO.asString              := fieldByName ( 'BRINCO' ).asString       ;
           cdsDesmameNOMEESTABULO.asString        := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsDesmameSTATUS.AsInteger             := _ST_STATUS_FEMEA_NOVILHA;
           cdsDesmameIDADE.AsInteger              := FieldByName('IDADE').AsInteger;
           cdsDesmamePESO.AsInteger               := FieldByName('PESO').AsInteger;
           cdsDesmameDATADESMAME.asDateTime       := AData ;
         end
    finally
       cds.Free ;
       p.free ;
    end;
end;

procedure TZoo_CrescimentoDesmameDatamodule.ApplyUpdates;
begin
  TCDSSuppl.PostIfNeed ( cdsDesmame ) ;
  if cdsDesmame.ChangeCount = 0 then
     raise Warning.Create('Não há animais marcados para desmame ( status = Novilha )');
  inherited;
  TCDSSuppl.Open( cdsDesmame ) ;
end;

procedure TZoo_CrescimentoDesmameDatamodule.cdsDesmameBeforeOpen(DataSet: TDataSet);
begin
   cdsDesmame.Params.ParamByName( 'STATUS_BEZERRA' ).AsInteger := _ST_STATUS_FEMEA_BEZERRO ;
   cdsDesmame.Params.ParamByName( 'DIAS' ).AsInteger := FDiasDesmame ;
   cdsDesmame.Params.ParamByName( 'PESO' ).AsInteger := FPesoDesmame ;
end;

procedure TZoo_CrescimentoDesmameDatamodule.cdsDesmameDATADESMAMEChange(
  Sender: TField);
begin
  inherited;
  if not ( cdsDesmame.State in [dsInsert, dsEdit] ) then
    cdsDesmame.Edit;

  if cdsDesmameDATADESMAME.AsDateTime > Date then
   begin
     cdsDesmameSTATUS.AsInteger := _ST_SIGLA_STATUS_FEMEA_BEZERRO;
     if not ((cdsDesmameDATADESMAME.IsNull) or
          (cdsDesmameDATADESMAME.AsDateTime = 0) or
          (cdsDesmameDATADESMAME.AsString = '') ) then
         cdsDesmameDATADESMAME.Clear;
     raise Warning.Create('Data não pode ser maior que data atual');
   end;

  if not ((cdsDesmameDATADESMAME.IsNull) or
          (cdsDesmameDATADESMAME.AsDateTime = 0) or
          (cdsDesmameDATADESMAME.AsString = '') ) then
   begin
     if cdsDesmameSTATUS.AsInteger <> _ST_SIGLA_STATUS_FEMEA_NOVILHA then
       cdsDesmameSTATUS.AsInteger := _ST_SIGLA_STATUS_FEMEA_NOVILHA;
   end
  else
   begin
     if cdsDesmameSTATUS.AsInteger <> _ST_SIGLA_STATUS_FEMEA_BEZERRO then
       cdsDesmameSTATUS.AsInteger := _ST_SIGLA_STATUS_FEMEA_BEZERRO;
   end;

end;

procedure TZoo_CrescimentoDesmameDatamodule.cdsDesmameSTATUSChange(Sender: TField);
begin

   if not ( cdsDesmame.State in [dsInsert, dsEdit] ) then
    cdsDesmame.Edit;

   if cdsDesmameSTATUS.AsInteger = _ST_SIGLA_STATUS_FEMEA_NOVILHA then
    begin
       if ( (cdsDesmameDATADESMAME.IsNull) or
            (cdsDesmameDATADESMAME.AsDateTime = 0) ) then
          cdsDesmameDATADESMAME.AsDateTime:= FDataPadrao
    end
   else
    begin
       if not( (cdsDesmameDATADESMAME.IsNull) or
               (cdsDesmameDATADESMAME.AsDateTime = 0) ) then
         cdsDesmameDATADESMAME.Clear;
    end;

  cdsDesmame.Post;
end;

constructor TZoo_CrescimentoDesmameDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_DESMAME,  cdsStatusAnimal        ) ;
  FPesoDesmame := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_PESO_DESMAME  ) ;
  FDiasDesmame := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_DESMAME) ;
  FDataPadrao  := Date;
end;

procedure TZoo_CrescimentoDesmameDatamodule.dspDesmameAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if ( SourceDS = sqlDesmame ) and ( UpdateKind = ukModify )
     and ( not VarIsEmpty ( DeltaDS.FieldByName('STATUS').NewValue ) )
     and  ( not VarIsNull  ( DeltaDS.FieldByName('STATUS').NewValue ) )
     and  ( DeltaDS.FieldByName('STATUS').NewValue = _ST_STATUS_FEMEA_NOVILHA ) then
       TEventosAnimal.AddLiberacaoReproducao( DeltaDS.FieldByName('KZOO_ANIMAL').OldValue, Date );

end;

procedure TZoo_CrescimentoDesmameDatamodule.InvertStatus;
begin
  if cdsDesmame.IsEmpty then
   exit;

  cdsDesmame.Edit ;

  if self.cdsDesmameSTATUS.AsInteger = _ST_STATUS_FEMEA_BEZERRO then
    self.cdsDesmameSTATUS.AsInteger := _ST_STATUS_FEMEA_NOVILHA
  else
    self.cdsDesmameSTATUS.AsInteger := _ST_STATUS_FEMEA_BEZERRO
end;

function TZoo_CrescimentoDesmameDatamodule.LocateBrinco(
  ABrinco: string): boolean;
begin
  Result := cdsDesmame.Locate( 'BRINCO', ABrinco, [] ) ;
end;

end.
