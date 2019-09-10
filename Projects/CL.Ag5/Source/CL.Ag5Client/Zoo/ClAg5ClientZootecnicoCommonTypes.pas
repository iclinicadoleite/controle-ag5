unit ClAg5ClientZootecnicoCommonTypes;

interface

uses
  System.Classes, DBClient ;

type

  TTipoMacho = (tmUndefined, tmSemen,tmTouro,tmEmbriao) ;

  TParamNovilhas = class
    class function GetParam( const AKCAD_FAZENDA : string ; AParam : String ): integer ;
  end;

  TParamMatriz = class
    class procedure GetParam( const AKCAD_FAZENDA : string ; AParam : String ; out APrimipara, AMultipara : integer  ) ;
    class function GetParamPrimipara( const AKCAD_FAZENDA : string ; AParam : String  ): integer ;
    class function GetParamMultipara( const AKCAD_FAZENDA : string ; AParam : String  ): integer ;
  end;


  TAnimalFemea = class
  public
    class function FindFirstActiveKeyFromList ( AKeys : TClientDataSet ; AResetToTop : boolean = false ) : boolean ;
    class function GetActiveKeyFromBrinco ( const AKCAD_FAZENDA : string ; ABrinco: string ; var AKey : string  ) : boolean ;
    class function GetUltimaMontaFromBrinco (
       const AKCAD_FAZENDA : string ;
       ABrinco: string ;
       var AKey,
       KEVENTO_ZOOTECNICO : string ;
       var ATipoEvento : integer ;
       var ADataEvento : TDateTime ;
       var ANumeroLactacao : integer ) : boolean ;
    class function GetUltimaMontaPossivelPrenhezFromBrinco (
       const AKCAD_FAZENDA : string ;
       ABrinco: string ;
       var AKey,
       KEVENTO_ZOOTECNICO : string ;
       var ATipoEvento : integer ;
       var ADataEvento : TDateTime ;
       var ANumeroLactacao : integer ) : boolean ;
    class function GetUltimaMontaFromKey (
       const AKCAD_FAZENDA : string ;
       const AKey : string ;
       var KEVENTO_ZOOTECNICO : string ;
       var ATipoEvento : integer ;
       var ADataEvento : TDateTime ;
       var APrenhez : boolean ;
       var ADataAbortoParto : TDateTime ;
       var ANumeroLactacao : integer ) : boolean ;

    class function CheckBrincoExists  ( const AKCAD_FAZENDA : string ; ABrinco : string ; AKey : string = ''  ) : boolean;
    class function isPrimipara    ( AKey : string ) : boolean;
    class function isMultipara    ( AKey : string ) : boolean;
    class procedure IncluirFemea   ( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ; ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ; ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ) ;
    class procedure AbortoSemParto ( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ; AKZOO_ANIMAL_EVENTO : string ; ADATA : TDateTime ; AAbrirLactacao : boolean );
    class procedure SecarUltimaLactacaoPorAborto ( AKZOO_ANIMAL : string ; AData : TDateTime  );
  end ;

  TAnimalMacho = class
  public
    class function CheckCodigoExists  ( const AKCAD_FAZENDA : string ; ABrinco : string ; AKey : string = '' ) : boolean;
    class procedure IncluirMacho  ( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ; ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ; ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ) ;
    class function GetEstoque     ( KZOO_ANIMAL_MACHO : string ): integer ;
  end ;

  TAnimalEmbriao = class
  public
    class procedure IncluirEmbriao  ( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ; ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ;
        ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ; AQTDE : integer ) ;
    class function GetEstoque     ( AKZOO_ANIMAL_EMBRIAO : string ): integer ;
  end ;

  IShowFichaAnimal = interface
  ['{DA5EAF45-8C26-4BFE-8D82-7EFE738D7F87}']
     function Execute( AKZOOANIMAL : string ) : string ;
  end;

  TProcTypeAnimalForm = ( ptafMacho, ptafFemea, ptafEmbriao, ptafMachoExterno, ptafFemeaExterno ) ;

  TInterfacedPersistentClass = class of TInterfacedPersistent ;

  TShowFichaAnimal = class
  private
     FKZOO_ANIMAL : string ;
     FSelectedType : TProcTypeAnimalForm ;
     procedure Validate ;
     procedure DoShow ;
     class var FProcs : Array [ TProcTypeAnimalForm ] of TInterfacedPersistentClass ;
  public
    class procedure RegisterClass ( AForm : TInterfacedPersistentClass ; AFormType : TProcTypeAnimalForm ) ;
    class procedure Execute ( AKZOO_ANIMAL : string ) ;
  end;


implementation

uses System.SysUtils, Data.SQLTimSt, DateUtils,
    // Exceptions,
     StrUtils,
     Tc.VCL.Application,
     ClAg5ClientCommonTypes,
     ClAg5Types, Data.DB, Tc.Data.DB.Helpers,
     ThreadSuppl,
     Tc.RTL.Exceptions,
     Tc.DBRTL.AbstractDB ;

{ TParamNovilhas }

class function TParamNovilhas.GetParam(const AKCAD_FAZENDA : string ; AParam: String ): integer;
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  Result := 0 ;
  cds := nil ;
  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'SYSVALUE', ptInput ).asString := AParam  ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').PopulateClientDataSet ( cds, 'VALOR FROM ZOO_CFGPARAMNOVILHAS WHERE SYS$VALUE = :SYSVALUE AND KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
      Result  := cds.FieldByName ( 'VALOR' ).asInteger ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetParam'  )
    end;
  finally
    if Assigned ( cds ) then
       cds.Free ;
    p.free ;
  end;
end;

{ TParamMatriz }

class procedure TParamMatriz.GetParam(const AKCAD_FAZENDA : string;  AParam: String; out APrimipara,
  AMultipara: integer  );
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  cds := nil ;
  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'SYSVALUE', ptInput ).asString := AParam  ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').PopulateClientDataSet ( cds, 'PRIMIPARA, MULTIPARA FROM ZOO_CFGPARAMMATRIZES WHERE SYS$VALUE = :SYSVALUE AND KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
      APrimipara := cds.FieldByName ( 'PRIMIPARA' ).asInteger ;
      AMultipara := cds.FieldByName ( 'MULTIPARA' ).asInteger ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetParam'  )
    end;
  finally
    if Assigned ( cds ) then
       cds.Free ;
    p.free ;
  end;

end;


class function TParamMatriz.GetParamPrimipara(const AKCAD_FAZENDA : string ; AParam: String ): integer;
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  Result := 0 ;
  cds := nil ;
  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'SYSVALUE', ptInput ).asString := AParam  ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').PopulateClientDataSet ( cds, 'PRIMIPARA FROM ZOO_CFGPARAMMATRIZES WHERE SYS$VALUE = :SYSVALUE AND KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
      Result := cds.FieldByName ( 'PRIMIPARA' ).asInteger ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetParamPrimipara'  )
    end;
  finally
    if Assigned ( cds ) then
      cds.free ;
    p.free ;
  end;

end;

class function TParamMatriz.GetParamMultipara(const AKCAD_FAZENDA : string ; AParam: String): integer;
var
  cds : TClientDataSet ;
  p : TParams ;
begin
  Result := 0 ;
  cds := nil ;
  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'SYSVALUE', ptInput ).asString := AParam  ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').PopulateClientDataSet ( cds, 'MULTIPARA FROM ZOO_CFGPARAMMATRIZES WHERE SYS$VALUE = :SYSVALUE AND KCAD_FAZENDA = :KCAD_FAZENDA', p ) ;
      Result := cds.FieldByName ( 'MULTIPARA' ).asInteger ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetParamMultipara'  )
    end;
  finally
    if Assigned ( cds ) then
      cds.free ;
    p.free ;
  end;

end;



{ TAnimalFemea }

class procedure TAnimalFemea.AbortoSemParto( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ; AKZOO_ANIMAL_EVENTO : string ; ADATA: TDateTime ; AAbrirLactacao : boolean );
var
  p : TParams ;
begin
  p := TParams.Create ;
  try
    try
     if AAbrirLactacao then
       p.CreateParam ( ftInteger,   'ABORTOPARTO',      ptInput ).asInteger      := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
     else
       p.CreateParam ( ftInteger,   'ABORTOPARTO',      ptInput ).asInteger      := _ST_TIPO_PARTOABORTO_ABORTO;
     p.CreateParam ( ftTimeStamp, 'DATAABORTOPARTO',         ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay ( ADATA )) ;
     p.CreateParam ( ftString,    'KZOO_EVENTO_ZOOTECNICO',  ptInput ).AsString       := AKZOO_ANIMAL_EVENTO ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(
         'UPDATE ZOO_EVENTOS_ZOOTECNICOS SET ABORTOPARTO = :ABORTOPARTO, DATAABORTOPARTO = :DATAABORTOPARTO WHERE KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO', p );

     if not AAbrirLactacao then
        exit ;

     SecarUltimaLactacaoPorAborto ( AKZOO_ANIMAL, AData - 1 ) ;

     p.Clear ;
     p.CreateParam ( ftString,    'KZOO_EVENTO_ZOOTECNICO',  ptInput ).AsString  := AKZOO_ANIMAL_EVENTO ;
     p.CreateParam ( ftString,    'KCAD_FAZENDA',  ptInput ).AsString            := AKCAD_FAZENDA ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(
      'INSERT INTO ZOO_LACTACOES ( KZOO_LACTACAO, KZOO_EVENTO_ZOOTECNICO, KCAD_FAZENDA ) VALUES ( Guid20(), :KZOO_EVENTO_ZOOTECNICO, :KCAD_FAZENDA)', p ) ;

     p.Clear ;
     p.CreateParam( ftInteger, 'VL',          ptInput ).asInteger       := _ST_STATUS_FEMEA_VACALACTACAO ;
     p.CreateParam( ftString,  'DATASTATUS',  ptInput ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( AData ) ;
     p.CreateParam( ftString,  'KZOO_ANIMAL', ptInput ).AsString        := AKZOO_ANIMAL ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute( 'UPDATE ZOO_ANIMAIS SET STATUS = :VL, DATASTATUS = :DATASTATUS WHERE KZOO_ANIMAL = :KZOO_ANIMAL', p );
    except On E : Exception do
        RaiseException ( E, UnitName, ClassName, 'AbortoSemParto' ) ;
    end;

  finally
     p.Free ;
  end;
end;

class function TAnimalFemea.CheckBrincoExists ( const AKCAD_FAZENDA : string ; ABrinco : string ; AKey : string = ''  ) : boolean;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin
 Result :=  False ;
 p := TParams.Create ;
 try
   try

     sql :='FIRST 1 1 RESULT'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND (A.STATUS<>:DESCARTADO) AND (A.STATUS<>:NATIMORTO)' ;

     if AKey <> '' then
        sql :=  sql + ' AND ( KZOO_ANIMAL <> :KZOO_ANIMAL )' ;

     p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
     p.CreateParam( ftString, 'BRINCO',       ptInput).asString := ABrinco ;
     p.CreateParam( ftString, 'DESCARTADO',   ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
     p.CreateParam( ftString, 'NATIMORTO',    ptInput ).asInteger := _ST_STATUS_ANIMAL_NATIMORTO ;

     if AKey <> '' then
        p.CreateParam( ftString, 'KZOO_ANIMAL',    ptInput ).asString := AKey ;

     cds := nil ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,  sql, p );

     result := cds.FieldByName( 'RESULT' ).asInteger = 1 ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'CheckBrincoExists'  )
    end;
 finally
   if Assigned ( cds ) then
      cds.free ;
   p.free ;
 end;
end;



class function TAnimalFemea.FindFirstActiveKeyFromList(AKeys: TClientDataSet;
  AResetToTop: boolean): boolean;
begin
   Result := False ;
   AKeys.First ;
   while not AKeys.eof do
     begin
        Result :=
             ( AKeys.FieldByName( 'STATUS' ).asInteger <> _ST_STATUS_ANIMAL_DESCARTADO )
         and ( AKeys.FieldByName( 'STATUS' ).asInteger <> _ST_STATUS_ANIMAL_NATIMORTO )
     end ;
   if AResetToTop then
      AKeys.First ;
end;

class function TAnimalFemea.GetActiveKeyFromBrinco( const AKCAD_FAZENDA : string ; ABrinco: string ; var AKey : string ) : boolean ;
var
  p : TParams  ;
  cds : TClientDataSet ;
begin
  Result := False ;
  AKey := '' ;
  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
  p.CreateParam( ftString, 'BRINCO', ptInput ).asString := UpperCase(ABrinco) ;
  p.CreateParam( ftString, 'DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  p.CreateParam( ftString, 'NATIMORTO', ptInput ).asInteger := _ST_STATUS_ANIMAL_NATIMORTO ;

  try
    cds := nil ;
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,
              'A.KZOO_ANIMAL'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA )'
       +#13#10'AND (UPPER(A.BRINCO) = :BRINCO )'
       +#13#10'AND (A.STATUS<>:DESCARTADO)'
       +#13#10'AND (A.STATUS<>:NATIMORTO)', p ) ;
       Result := not cds.IsEmpty ;
       if Result then
          AKey := cds.FieldByName('KZOO_ANIMAL').asString ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetActiveKeyFromBrinco'  )
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;
end;

class function TAnimalFemea.GetUltimaMontaFromBrinco(
  const AKCAD_FAZENDA : string ;  ABrinco: string;
  var AKey,
  KEVENTO_ZOOTECNICO : string ;
  var ATipoEvento : integer ;
  var ADataEvento : TDateTime ;
  var ANumeroLactacao : integer ) : boolean ;
var
  p : TParams  ;
  cds : TClientDataSet ;
begin
  Result := False ;
  AKey := '' ;
  KEVENTO_ZOOTECNICO := '' ;
  ATipoEvento := 0 ;
  ADataEvento := 0 ;
  ANumeroLactacao := 0 ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
  p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
  p.CreateParam( ftString, 'DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  p.CreateParam( ftString, 'NATIMORTO', ptInput ).asInteger := _ST_STATUS_ANIMAL_NATIMORTO ;

  cds := nil ;
  try
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,
              'A.KZOO_ANIMAL, EZ.KZOO_EVENTO_ZOOTECNICO, EZ.TIPOEVENTO, EZ.DATAEVENTO, AF.NUMERO_LACTACAO'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON ( EZ.KZOO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA )'
       +#13#10'AND (A.BRINCO = :BRINCO )'
       +#13#10'AND (A.STATUS<>:DESCARTADO)'
       +#13#10'AND (A.STATUS<>:NATIMORTO)'
       +#13#10'AND ( AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )'
       +#13#10'AND ( EZ.ABORTOPARTO IS NULL )' , p ) ;
       Result := not cds.IsEmpty ;
       if Result then
         begin
          AKey                := cds.FieldByName('KZOO_ANIMAL').asString ;
          KEVENTO_ZOOTECNICO  := cds.FieldByName('KZOO_EVENTO_ZOOTECNICO').asString ;
          ATipoEvento         := cds.FieldByName('TIPOEVENTO').asInteger ;
          ADataEvento         := cds.FieldByName('DATAEVENTO').asDateTime ;
          ANumeroLactacao     := cds.FieldByName('NUMERO_LACTACAO').asInteger ;
         end;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetUltimaMontaFromBrinco'  )
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;

end;

class function TAnimalFemea.GetUltimaMontaFromKey(const AKCAD_FAZENDA,
  AKey: string; var KEVENTO_ZOOTECNICO: string; var ATipoEvento: integer;
  var ADataEvento: TDateTime; var APrenhez : boolean  ; var ADataAbortoParto : TDateTime ; var ANumeroLactacao: integer): boolean;
var
  p : TParams  ;
  cds : TClientDataSet ;
begin
  Result := False ;
  KEVENTO_ZOOTECNICO := '' ;
  ATipoEvento := 0 ;
  ADataEvento := 0 ;
  ADataAbortoParto := 0 ;
  ANumeroLactacao  := 0 ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA',      ptInput ).asString  := AKCAD_FAZENDA ;
  p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString  := AKey ;

  try
    try
       cds := nil ;
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,
              'A.KZOO_ANIMAL, EZ.KZOO_EVENTO_ZOOTECNICO, EZ.TIPOEVENTO, EZ.DATAEVENTO, EZ.PRENHEZ, EZ.DATAABORTOPARTO, AF.NUMERO_LACTACAO'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON ( EZ.KZOO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA )'
       +#13#10'AND (EZ.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA)'
       +#13#10'AND ( AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )', p ) ;
       Result := not cds.IsEmpty ;
       if Result then
         begin
          KEVENTO_ZOOTECNICO  := cds.FieldByName('KZOO_EVENTO_ZOOTECNICO').asString ;
          ATipoEvento         := cds.FieldByName('TIPOEVENTO').asInteger ;
          ADataEvento         := cds.FieldByName('DATAEVENTO').asDateTime ;
          APrenhez            := cds.FieldByName('PRENHEZ').asString = 'T' ;
          ADataAbortoParto    := cds.FieldByName('DATAABORTOPARTO').asDateTime ;
          ANumeroLactacao     := cds.FieldByName('NUMERO_LACTACAO').asInteger ;
         end;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetUltimaMontaFromKey'  )
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;
end;

class function TAnimalFemea.GetUltimaMontaPossivelPrenhezFromBrinco(
  const AKCAD_FAZENDA: string; ABrinco: string; var AKey,
  KEVENTO_ZOOTECNICO: string; var ATipoEvento: integer;
  var ADataEvento: TDateTime; var ANumeroLactacao: integer): boolean;
var
  p : TParams  ;
  cds : TClientDataSet ;
  LExibirSemConfirmacaoPrennhez : boolean ;
  LSQLConfirmacaoPrenhez : string ;
begin
  Result := False ;
  AKey := '' ;
  KEVENTO_ZOOTECNICO := '' ;
  ATipoEvento := 0 ;
  ADataEvento := 0 ;
  ANumeroLactacao := 0 ;

  LExibirSemConfirmacaoPrennhez := ParametrosFazenda ( LoggedUser.DomainID ).ExibirPartoSemconfirmacao ;
  if ( LExibirSemConfirmacaoPrennhez ) then
     LSQLConfirmacaoPrenhez := 'AND ( EZ.PRENHEZ IS DISTINCT FROM ''F'' )'
  else
     LSQLConfirmacaoPrenhez := 'AND ( EZ.PRENHEZ = ''T'' )' ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
  p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
  p.CreateParam( ftString, 'DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  p.CreateParam( ftString, 'NATIMORTO', ptInput ).asInteger := _ST_STATUS_ANIMAL_NATIMORTO ;

  cds := nil ;
  try
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,
              'A.KZOO_ANIMAL, EZ.KZOO_EVENTO_ZOOTECNICO, EZ.TIPOEVENTO, EZ.DATAEVENTO, AF.NUMERO_LACTACAO'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON ( EZ.KZOO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA )'
       +#13#10'AND (A.BRINCO = :BRINCO )'
       +#13#10'AND (A.STATUS<>:DESCARTADO)'
       +#13#10'AND (A.STATUS<>:NATIMORTO)'
       +#13#10'AND ( AF.KULTIMO_EVENTO_ZOOTECNICO = AF.KULTIMA_MONTA )'
       +#13#10 + LSQLConfirmacaoPrenhez
       +#13#10'AND ( EZ.ABORTOPARTO IS NULL )' , p ) ;
       Result := not cds.IsEmpty ;
       if Result then
         begin
          AKey                := cds.FieldByName('KZOO_ANIMAL').asString ;
          KEVENTO_ZOOTECNICO  := cds.FieldByName('KZOO_EVENTO_ZOOTECNICO').asString ;
          ATipoEvento         := cds.FieldByName('TIPOEVENTO').asInteger ;
          ADataEvento         := cds.FieldByName('DATAEVENTO').asDateTime ;
          ANumeroLactacao     := cds.FieldByName('NUMERO_LACTACAO').asInteger ;
         end;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetUltimaMontaFromBrinco'  )
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;

end;

class procedure TAnimalFemea.IncluirFemea(const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ;
       ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ;
       ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ) ;
var
  p : TParams ;
begin

  p := TParams.Create ;

  try
    try
      p.CreateParam ( ftString, 'KZOO_ANIMAL',   ptInput ).AsString  := AKZOO_ANIMAL   ;
      p.CreateParam ( ftString, 'BRINCO',        ptInput ).AsString  := ABRINCO        ;
      p.CreateParam ( ftString, 'NOMEESTABULO',  ptInput ).AsString  := ANOMEESTABULO  ;
      p.CreateParam ( ftString, 'NOMECOMPLETO',  ptInput ).AsString  := ANOMECOMPLETO  ;
      p.CreateParam ( ftString, 'RACA',          ptInput ).asInteger := ARACA          ;
      p.CreateParam ( ftString, 'STATUS',        ptInput ).asInteger := ASTATUS        ;
      p.CreateParam ( ftString, 'DTORIGEM',      ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( ADTORIGEM  )    ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA',  ptInput ).AsString  := AKCAD_FAZENDA ;
                                   // inclui animal
      TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute (
                      'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DTORIGEM, KCAD_FAZENDA )'
                     +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DTORIGEM, :KCAD_FAZENDA )', p ) ;
       p.Clear ;
       p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).AsString := AKZOO_ANIMAL ;
       p.CreateParam ( ftString, 'NASCIMENTO',        ptInput ).Bound := False ;
       if ( ADTORIGEM <= 0  ) then
         p.ParamByName (  'NASCIMENTO'  ).AsSQLTimeStamp  := DateTimeToSQLTimeStamp ( 1  )
       else
          p.ParamByName (  'NASCIMENTO'  ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( ADTOrigem )    ;

       TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(
                      'INSERT INTO ZOO_ANIMAIS_FEMEA ( KZOO_ANIMAL_FEMEA, NASCIMENTO ) VALUES ( :KZOO_ANIMAL_FEMEA, :NASCIMENTO )', p ) ;
    except On E : Exception do
        RaiseException ( E, UnitName, ClassName, 'IncluirFemea' ) ;

    end;
  finally
   p.Free ;
  end;
end;

class function TAnimalFemea.isMultipara(AKey: string): boolean;
begin
  Result := False ;
  try
   Result := not isPrimipara  ( AKey ) ;
  Except On E : Exception do
    RaiseException ( E, UnitName, ClassName, 'isMultipara'  )
  end;
end;

class function TAnimalFemea.isPrimipara(AKey: string): boolean;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin
  Result := False ;
  cds := nil ;
  p := TParams.Create ;
  try
   try

     sql :='NUMERO_LACTACAO'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'WHERE ( AF.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA )' ;

     p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString :=  AKey ;

     TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,  sql, p );

     result := cds.isEmpty or ( cds.FieldByName( 'NUMERO_LACTACAO' ).asInteger < 2 ) ;

    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'isPrimipara'  ) ;
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;
end;


class procedure TAnimalFemea.SecarUltimaLactacaoPorAborto( AKZOO_ANIMAL : string ; AData : TDateTime  );
const
  _SECAR_LACTACAO =
           'UPDATE ZOO_LACTACOES'
    +#13#10'SET'
    +#13#10' DATA_SECAGEM = :DATA_SECAGEM,'
    +#13#10' CAUSA_SECAGEM = :CAUSA_SECAGEM'
    +#13#10'WHERE KZOO_LACTACAO = :KZOO_LACTACAO AND DATA_SECAGEM IS NULL';
var
  p : TParams ;
  cds : TClientDataSet ;
  LKUltimaLactacao : string ;
begin
     cds := nil ;
     p := TParams.Create ;
     p.CreateParam ( ftString,    'KZOO_ANIMAL_FEMEA',  ptInput ).AsString  := AKZOO_ANIMAL ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').
        populateClientDataSet( cds, 'F.KULTIMA_LACTACAO'
      +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
      +#13#10'WHERE ( F.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA )', p ) ;

     LKUltimaLactacao := cds.FieldByName('KULTIMA_LACTACAO').asString ;
     cds.Free ;

    if LKUltimaLactacao <> '' then
       begin
        p.Clear ;
        p.CreateParam( ftDateTime, 'DATA_SECAGEM',  ptInput ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( AData ) ;
        p.CreateParam( ftInteger,  'CAUSA_SECAGEM', ptInput ).asInteger       := 43 ; //_ST_STATUS_PRODUCAO: _ST_STATUS_PRODUCAO_ABORTO
        p.CreateParam( ftString,   'KZOO_LACTACAO', ptInput ).AsString        := LKUltimaLactacao ;
        TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute ( _SECAR_LACTACAO, p ) ;
       end;
    p.Free ;
end;

class function TAnimalMacho.CheckCodigoExists(const AKCAD_FAZENDA : string ; ABrinco, AKey: string): boolean;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin
 Result := False ;
 p := TParams.Create ;

 try

   try
     sql :='FIRST 1 1 RESULT'
       +#13#10'FROM ZOO_ANIMAIS_MACHO AM'
       +#13#10'JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AM.KZOO_ANIMAL_MACHO'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND (A.STATUS<>:DESCARTADO) AND (A.STATUS<>:NATIMORTO)' ;

     if AKey <> '' then
        sql :=  sql + ' AND ( KZOO_ANIMAL <> :KZOO_ANIMAL )' ;


     p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  AKCAD_FAZENDA ;
     p.CreateParam( ftString, 'BRINCO',       ptInput).asString := ABrinco ;
     p.CreateParam( ftString, 'DESCARTADO',   ptInput ).asInteger := 4 ; //_ST_STATUS_MACHO_DES ;
     p.CreateParam( ftString, 'NATIMORTO',    ptInput ).asInteger := 5 ; //_ST_STATUS_MACHO_NM ;

     if AKey <> '' then
        p.CreateParam( ftString, 'KZOO_ANIMAL',    ptInput ).asString := AKey ;

     cds := nil ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,  sql, p );

     result := cds.FieldByName( 'RESULT' ).asInteger = 1 ;

    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'CheckCodigoExists'  ) ;
    end;
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;

end;


class function TAnimalMacho.GetEstoque(KZOO_ANIMAL_MACHO: string): integer;
var
  p : TParams ;
  CDS : TClientDataSet ;
begin
  p := TParams.Create ;
  p.CreateParam ( ftString, 'KZOO_ANIMAL_MACHO',   ptInput ).AsString  := KZOO_ANIMAL_MACHO   ;
  try
    CDS := nil ;
    try
      TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( CDS, 'QTDE_SEMEN FROM ZOO_ANIMAIS_MACHO WHERE KZOO_ANIMAL_MACHO = :KZOO_ANIMAL_MACHO', p );
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'GetEstoque'  ) ;
    end;
    Result := CDS.FieldByName('QTDE_SEMEN').AsInteger ;
    if cds.IsEmpty then
      raise Warning.Create('Estoque sêmen : Animal não é sêmen');
  finally
     if Assigned ( cds ) then
        cds.free ;
     p.free ;
  end;
end;

class procedure TAnimalMacho.IncluirMacho( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ;
     ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ;
     ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ) ;
var
  p : TParams ;
const
  _INSERT_ANIMAL = 'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DTORIGEM, KCAD_FAZENDA )'
            +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DTORIGEM, :KCAD_FAZENDA )' ;

  _INSERT_ANIMAL_MACHO = 'INSERT INTO ZOO_ANIMAIS_MACHO ( KZOO_ANIMAL_MACHO, NASCIMENTO ) VALUES ( :KZOO_ANIMAL_MACHO, :NASCIMENTO )' ;

begin

  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'KZOO_ANIMAL',   ptInput ).AsString  := AKZOO_ANIMAL   ;
      p.CreateParam ( ftString, 'BRINCO',        ptInput ).AsString  := ABRINCO        ;
      p.CreateParam ( ftString, 'NOMEESTABULO',  ptInput ).AsString  := ANOMEESTABULO  ;
      p.CreateParam ( ftString, 'NOMECOMPLETO',  ptInput ).AsString  := ANOMECOMPLETO  ;
      p.CreateParam ( ftString, 'RACA',          ptInput ).asInteger := ARACA          ;
      p.CreateParam ( ftString, 'STATUS',        ptInput ).asInteger := ASTATUS        ;

      p.CreateParam ( ftString, 'DTORIGEM',      ptInput ).Bound := False ;

      if ( ADTORIGEM <= 0  ) then
         p.ParamByName('DTORIGEM').AsSQLTimeStamp := DateTimeToSQLTimeStamp ( 1  )
      else
         p.ParamByName('DTORIGEM').AsSQLTimeStamp := DateTimeToSQLTimeStamp ( ADTORIGEM  )    ;

      p.CreateParam ( ftString, 'KCAD_FAZENDA',  ptInput ).AsString := AKCAD_FAZENDA  ;

      // inclui animal
      TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute ( _INSERT_ANIMAL, p ) ;

      p.Clear ;
      p.CreateParam ( ftString, 'KZOO_ANIMAL_MACHO', ptInput ).AsString := AKZOO_ANIMAL ;
      p.CreateParam ( ftString, 'NASCIMENTO',        ptInput ).Bound := False ;
      if ( ASTATUS <> _ST_STATUS_MACHO_SEMEN ) and ( ADTORIGEM > 0  )then
         p.ParamByName ( 'NASCIMENTO' ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( ADTORIGEM  ) ;

      TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute( _INSERT_ANIMAL_MACHO,  p ) ;
    except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'IncluirMacho' ) ;
    end ;
  finally
     p.Free ;
  end;

end;

{ TAnimalEmbriao }

class function TAnimalEmbriao.GetEstoque(AKZOO_ANIMAL_EMBRIAO: string): integer;
var
  p : TParams ;
  CDS : TClientDataSet ;
begin
  p := TParams.Create ;
  p.CreateParam ( ftString, 'KZOO_ANIMAL_EMBRIAO',   ptInput ).AsString  := AKZOO_ANIMAL_EMBRIAO   ;
  try
     CDS := nil ;
     try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( CDS, 'QTDE_EMBRIAO FROM ZOO_ANIMAIS_EMBRIAO WHERE KZOO_ANIMAL_EMBRIAO = :KZOO_ANIMAL_EMBRIAO', p );
     except On E : Exception do
         RaiseException ( E, UnitName, ClassName, 'GetEstoque' ) ;
     end ;
     if cds.IsEmpty then
        raise Warning.Create('Estoque embrião = Animal não é embrião');
     Result := CDS.FieldByName('QTDE_EMBRIAO').AsInteger ;
  finally
     if Assigned ( cds ) then
        cds.Free ;
     p.Free ;
  end;
end;

class procedure TAnimalEmbriao.IncluirEmbriao( const AKCAD_FAZENDA : string ; AKZOO_ANIMAL : string ;
     ABRINCO : string ;ANOMEESTABULO : string ;ANOMECOMPLETO : string ;
     ARACA : integer ; ASTATUS : integer ; ADTORIGEM : TDateTime ; AQTDE : integer ) ;
var
  p : TParams ;
begin

  p := TParams.Create ;
  try
    try
      p.CreateParam ( ftString, 'KZOO_ANIMAL',   ptInput ).AsString  := AKZOO_ANIMAL   ;
      p.CreateParam ( ftString, 'BRINCO',        ptInput ).AsString  := ABRINCO        ;
      p.CreateParam ( ftString, 'NOMEESTABULO',  ptInput ).AsString  := ANOMEESTABULO  ;
      p.CreateParam ( ftString, 'NOMECOMPLETO',  ptInput ).AsString  := ANOMECOMPLETO  ;
      p.CreateParam ( ftString, 'RACA',          ptInput ).AsInteger := ARACA          ;
      p.CreateParam ( ftString, 'STATUS',        ptInput ).AsInteger := ASTATUS        ;
      p.CreateParam ( ftString, 'DTORIGEM',      ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp ( ADTORIGEM  )    ;
      p.CreateParam ( ftString, 'KCAD_FAZENDA',  ptInput ).AsString  := '' ; // LoggedUser.DomainID  ;
                                   // inclui animal
      TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute (
                      'INSERT INTO ZOO_ANIMAIS ( KZOO_ANIMAL, BRINCO, NOMEESTABULO, NOMECOMPLETO, RACA, STATUS, DTORIGEM, KCAD_FAZENDA )'
                     +#13#10'VALUES ( :KZOO_ANIMAL, :BRINCO, :NOMEESTABULO, :NOMECOMPLETO, :RACA, :STATUS, :DTORIGEM, :KCAD_FAZENDA )', p ) ;

       p.Clear ;
       p.CreateParam ( ftString, 'KZOO_ANIMAL_MACHO', ptInput ).AsString  := AKZOO_ANIMAL ;
       p.CreateParam ( ftString, 'QTDE_EMBRIAO',      ptInput ).asInteger := AQtde ;

       TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(
                      'INSERT INTO ZOO_ANIMAIS_EMBRIAO ( KZOO_ANIMAL_EMBRIAO, NASCIMENTO ) VALUES ( :KZOO_ANIMAL_EMBRIAO, :QTDE_EMBRIAO ) ', p ) ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'IncluirEmbriao'  ) ;
    end;
  finally
     p.free ;
  end;

end;

{ TShowFichaAnimal }


procedure TShowFichaAnimal.DoShow;
begin
    FKZOO_ANIMAL := (FProcs [ FSelectedType ].Create as IShowFichaAnimal ).Execute( FKZOO_ANIMAL ) ;
end;

class procedure TShowFichaAnimal.Execute(AKZOO_ANIMAL: string);
begin
  with Create do
    try
      FKZOO_ANIMAL := AKZOO_ANIMAL ;
      repeat
         Validate ;
         DoShow ;
      until (FKZOO_ANIMAL = '');
    finally
      free ;
    end ;
end ;

procedure TShowFichaAnimal.Validate ;
const
  StrTipoForm : Array [ TProcTypeAnimalForm ] of string = ( 'Macho', 'Femea', 'Embriao', 'Macho Externo', 'Femea Externa' );
var
  cds : TClientDataSet ;
  p : TParams ;
begin

  cds := nil ;
  p := TParams.Create ;
  try
    p.CreateParam ( ftString, 'KZOO_ANIMAL', ptInput ).asString := FKZOO_ANIMAL ;

    try
      TTcAbstractDB.GetByAlias('ZOOTECNICO').PopulateClientDataSet ( cds,
             'A.KZOO_ANIMAL, M.KZOO_ANIMAL_MACHO, F.KZOO_ANIMAL_FEMEA, E.KZOO_ANIMAL_EMBRIAO, EX.KZOO_ANIMAL_EXTERNO, EX.SEXO'
      +#13#10'FROM ZOO_ANIMAIS A'
      +#13#10'LEFT JOIN ZOO_ANIMAIS_MACHO   M  ON  M.KZOO_ANIMAL_MACHO    =  A.KZOO_ANIMAL'
      +#13#10'LEFT JOIN ZOO_ANIMAIS_FEMEA   F  ON  F.KZOO_ANIMAL_FEMEA    =  A.KZOO_ANIMAL'
      +#13#10'LEFT JOIN ZOO_ANIMAIS_EMBRIAO E  ON  E.KZOO_ANIMAL_EMBRIAO  =  A.KZOO_ANIMAL'
      +#13#10'LEFT JOIN ZOO_ANIMAIS_EXTERNO EX ON  EX.KZOO_ANIMAL_EXTERNO =  A.KZOO_ANIMAL'
      +#13#10'WHERE A.KZOO_ANIMAL = :KZOO_ANIMAL', p ) ;
    Except On E : Exception do
      RaiseException ( E, UnitName, ClassName, 'Validate'  ) ;
    end;

    if cds.FieldByName ( 'KZOO_ANIMAL' ).IsNull then
       raise Warning.Create('Animal não encontrado' )
    else if not cds.FieldByName ( 'KZOO_ANIMAL_MACHO' ).isNull then
      FSelectedType := ptafMacho
    else if not cds.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).isNull then
      FSelectedType := ptafFemea
    else if not cds.FieldByName ( 'KZOO_ANIMAL_EMBRIAO' ).isNull then
      FSelectedType := ptafEmbriao
    else if ( not cds.FieldByName ( 'KZOO_ANIMAL_EXTERNO' ).isNull ) and ( cds.FieldByName ( 'SEXO' ).asString = 'M' ) then
      FSelectedType := ptafMachoExterno
    else if not cds.FieldByName ( 'KZOO_ANIMAL_EXTERNO' ).isNull and ( cds.FieldByName ( 'SEXO' ).asString = 'F' ) then
      FSelectedType := ptafFemeaExterno
    else
       raise Warning.Create('Não foi possível determinar o tipo do animal' ) ;

    if not Assigned ( FProcs[ FSelectedType ] ) then
       raise Warning.Create('Formulário não registrado para tipo de animal ' + StrTipoForm[ FSelectedType ] ) ;

  finally
    if Assigned ( cds ) then
       cds.free ;
    p.free ;
  end;

end;

class procedure TShowFichaAnimal.RegisterClass(AForm: TInterfacedPersistentClass;
  AFormType: TProcTypeAnimalForm);
begin
   FProcs[ AFormType ] := AForm ;
end;

//initialization
//  TShowFichaAnimal.Initialize ;
end.
