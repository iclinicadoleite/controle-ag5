unit UZoo_CrescimentoPesoAlturaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, SQLTimSt,
  Datasnap.Provider, UdtmSYS_BASE, SMIBase, SMI2Cell, SMI2XLS ;

type
  TZoo_CrescimentoPesoAlturaDatamodule = class(T_dtmBASE)
    cdsPesoAltura: TClientDataSet;
    dspPesoAltura: TDataSetProvider;
    sqlPesoAltura: TTcSQLDataSet;
    sqlPesoAlturaKZOO_ANIMAL: TStringField;
    cdsPesoAlturaKZOO_ANIMAL: TStringField;
    cdsPesoAlturaBRINCO: TStringField;
    cdsPesoAlturaNOMEESTABULO: TStringField;
    sqlPesoAlturaKZOO_ANIMAL_CRESCIMENTO: TStringField;
    sqlPesoAlturaDATA: TSQLTimeStampField;
    sqlPesoAlturaALTURA: TIntegerField;
    sqlPesoAlturaPESO: TIntegerField;
    sqlPesoAlturaOBSERVACAO: TMemoField;
    cdsPesoAlturaKZOO_ANIMAL_CRESCIMENTO: TStringField;
    cdsPesoAlturaDATA: TSQLTimeStampField;
    cdsPesoAlturaALTURA: TIntegerField;
    cdsPesoAlturaPESO: TIntegerField;
    cdsPesoAlturaOBSERVACAO: TMemoField;
    cdsImport: TClientDataSet;
    cdsImportBRINCO: TStringField;
    cdsImportPESO: TFloatField;
    cdsImportALTURA: TFloatField;
    cdsImportORD3: TFloatField;
    SMImportFromXLS1: TSMImportFromXLS;
    procedure cdsPesoAlturaNewRecord(DataSet: TDataSet);
    procedure cdsPesoAlturaPESOValidate(Sender: TField);
    procedure cdsPesoAlturaALTURAValidate(Sender: TField);
    procedure cdsPesoAlturaBeforePost(DataSet: TDataSet);
    procedure cdsPesoAlturaDATAValidate(Sender: TField);
    procedure dspPesoAlturaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
    FDateImport : TDateTime ;
    FErrs : TStringBuilder ;
    FPeso, FAltura  : Boolean ;
    FCountDadosImportados : integer ;
    procedure UpdatePesagensFromFile;
  public
    procedure ImportFromXLS ( AFileName : string ; ADate : TDateTime  ; out AErros : string );
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ) : boolean ;
    function AddByKey ( AKey : string ; AData : TDateTime ) : boolean ;
    procedure ApplyUpdates ; override ;
    procedure RemoveRecord ;
    procedure SetPesoAltura ( APeso, AAltura  : Boolean ) ;
    property CountDadosImportados : integer read FCountDadosImportados ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, DateUtils, CLAg5Types, CDSSuppl,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaALTURAValidate(Sender: TField);
begin
   if Sender.IsNull then
      exit ;

   if Sender.AsInteger < 40 then
      raise Warning.Create('Altura mínima permitida 40 cm');

   if Sender.AsInteger > 210 then
      raise Warning.Create('Altura máxima permitida 210 cm');
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaBeforePost(DataSet: TDataSet);
begin
  if FPeso and ( cdsPesoAlturaPESO.AsInteger = 0 ) then
     Raise Warning.Create (  'Informar o peso do animal'  ) ;

  if FAltura and ( cdsPesoAlturaAltura.AsInteger = 0 ) then
     Raise Warning.Create (  'Informar a altura do animal'  ) ;

  if cdsPesoAlturaDATA.AsDateTime < 1 then
     Raise Warning.Create (  'Informar a data da pesgem'  ) ;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime > Date then
     raise Warning.Create('Data da pesagem superior a data atual.');

//  if Sender.AsDateTime < FNascimento then
//    raise Warning.Create('Data da pesagem inferior a data de nascimento do animal');
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsPesoAlturaKZOO_ANIMAL_CRESCIMENTO ) ;
end;


procedure TZoo_CrescimentoPesoAlturaDatamodule.cdsPesoAlturaPESOValidate(Sender: TField);
begin
   if Sender.IsNull then
      exit ;

   if Sender.AsInteger < 25 then
      raise Warning.Create('Peso mínimo permitido 25 Kg');

   if Sender.AsInteger > 1000 then
      raise Warning.Create('Peso máximo permitido 1000 Kg');
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.dspPesoAlturaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
const
  _SELECT_CRESCIMENTO_DATA =
            'SELECT C.KZOO_ANIMAL_CRESCIMENTO'
     +#13#10'  FROM ZOO_ANIMAL_CRESCIMENTO C'
     +#13#10' WHERE C.KZOO_ANIMAL = :KZOO_ANIMAL'
     +#13#10'   AND C.DATA = :DATA'
     +#13#10'  ROWS 1 ';

  _UPDATE_CRESCIMENTO_DATA =
            'UPDATE ZOO_ANIMAL_CRESCIMENTO SET %s '
     +#13#10' WHERE KZOO_ANIMAL_CRESCIMENTO = :KZOO_ANIMAL_CRESCIMENTO';

  _UPDATE_CRESCIMENTO_NASCIMENTO =
            'UPDATE ZOO_ANIMAIS_FEMEA'
     +#13#10'   SET KCRESCIMENTO_NASCIMENTO = :KZOO_ANIMAL_CRESCIMENTO'
     +#13#10' WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
     +#13#10'   AND NASCIMENTO = :DATA';

var
  p: TParams;
  cds: TClientDataSet;
  update_fields: String;
begin
  {Se for encontrado um registro de crescimento na mesma data para o mesmo animal então
   altera esse registro.}
  cds:= nil;
  p := TParams.Create ;
  p.Clear;
  p.CreateParam( ftString   , 'KZOO_ANIMAL', ptInput ).asString       := VarToStr( DeltaDs.FieldByName('KZOO_ANIMAL').NewValue ) ;
  p.CreateParam( ftTimeStamp, 'DATA'       , ptInput ).AsSQLTimeStamp := DateTimeToSQLTimesTamp( VarToDateTime( DeltaDs.FieldByName('DATA').AsDateTime ) );

  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_CRESCIMENTO_DATA, p ) ;



  if not cds.IsEmpty then
   begin
     Applied:= True;
     p.Clear;

     if (DeltaDS.FieldByName('PESO').NewValue <> Unassigned) and
        (not ( (VarIsEmpty(DeltaDS.FieldByName('PESO').NewValue)) or (VarIsNull(DeltaDS.FieldByName('PESO').NewValue) ) ) )then
      begin
        update_fields := update_fields + ' PESO = :PESO,';
        p.CreateParam( ftInteger, 'PESO'      , ptInput ).AsInteger := DeltaDs.FieldByName('PESO').NewValue;
      end;
     if (DeltaDS.FieldByName('ALTURA').NewValue <> Unassigned) and
        (not ( (VarIsEmpty(DeltaDS.FieldByName('ALTURA').NewValue)) or (VarIsNull(DeltaDS.FieldByName('ALTURA').NewValue) ) ) ) then
      begin
        update_fields := update_fields + ' ALTURA = :ALTURA,';
        p.CreateParam( ftInteger, 'ALTURA'    , ptInput ).AsInteger := DeltaDs.FieldByName('ALTURA').NewValue;
      end;
     if (DeltaDS.FieldByName('OBSERVACAO').NewValue <> Unassigned) and
        (not ( (VarIsEmpty(DeltaDS.FieldByName('OBSERVACAO').NewValue)) or (VarIsNull(DeltaDS.FieldByName('OBSERVACAO').NewValue) ) ) ) then
      begin
        update_fields := update_fields + ' OBSERVACAO = :OBSERVACAO,';
        p.CreateParam( ftBlob,    'OBSERVACAO', ptInput ).AsBlob    := DeltaDs.FieldByName('OBSERVACAO').NewValue;
      end;

     p.CreateParam( ftString,  'KZOO_ANIMAL_CRESCIMENTO', ptInput ).asString  :=  cds.FieldByName('KZOO_ANIMAL_CRESCIMENTO').AsString ;

     update_fields := Copy(update_fields,1,Length(update_fields)-1);

     DBResources['ZOOTECNICO'].Execute( Format( _UPDATE_CRESCIMENTO_DATA,[update_fields]) , p );

     p.Clear;
     p.CreateParam( ftString,  'KZOO_ANIMAL_CRESCIMENTO', ptInput ).asString  := cds.FieldByName('KZOO_ANIMAL_CRESCIMENTO').AsString ;
     p.CreateParam( ftString   , 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := VarToStr( DeltaDs.FieldByName('KZOO_ANIMAL').NewValue ) ;
     p.CreateParam( ftTimeStamp, 'DATA'       , ptInput ).AsSQLTimeStamp      := DateTimeToSQLTimesTamp( VarToDateTime( DeltaDs.FieldByName('DATA').AsDateTime ) );
     DBResources['ZOOTECNICO'].Execute( _UPDATE_CRESCIMENTO_NASCIMENTO, p );

   end
  else
   begin
     p.Clear;
     p.CreateParam( ftString,  'KZOO_ANIMAL_CRESCIMENTO', ptInput ).asString  := VarToStr( DeltaDs.FieldByName('KZOO_ANIMAL_CRESCIMENTO').NewValue );
     p.CreateParam( ftString   , 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := VarToStr( DeltaDs.FieldByName('KZOO_ANIMAL').NewValue ) ;
     p.CreateParam( ftTimeStamp, 'DATA'       , ptInput ).AsSQLTimeStamp      := DateTimeToSQLTimesTamp( VarToDateTime( DeltaDs.FieldByName('DATA').AsDateTime ) );
     DBResources['ZOOTECNICO'].Execute( _UPDATE_CRESCIMENTO_NASCIMENTO, p );
   end;

  p.Free;
  cds.Free;

end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.ImportFromXLS(AFileName: string ; ADate : TDateTime ; out AErros : string );
begin
   FErrs := TStringBuilder.Create ;

   TCDSSuppl.CreateDataSet( cdsImport ) ;
   SMImportFromXLS1.SourceFileName := AFileName ;
   SMImportFromXLS1.Execute ;
   FCountDadosImportados := 0 ;

   FDateImport := ADate ;
   cdsImport.DisableControls ;
   cdsPesoAltura.DisableControls ;
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
//     ApplyUpdates ;
   finally
     cdsImport.EnableControls ;
     cdsPesoAltura.EnableControls ;
   end;

   AErros := FErrs.ToString ;
   FErrs.DisposeOf ;
end;

function TZoo_CrescimentoPesoAlturaDatamodule.LocateBrinco(ABrinco: string): boolean;
begin
   Result := cdsPesoAltura.Locate( 'BRINCO', ABrinco, [] ) ;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsPesoAltura ) ;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.RemoveRecord;
begin
   if not cdsPesoAltura.isEmpty then
    cdsPesoAltura.Delete ;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.SetPesoAltura(APeso, AAltura: Boolean);
begin
 FPeso   := APeso ;
 FAltura := AAltura ;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.UpdatePesagensFromFile;
var
   LBrinco : string ;
begin

  try
   LBrinco := cdsImportBrinco.asString ;
   if not AddBrinco ( cdsImportBrinco.AsString, FDateImport ) then
     raise Warning.Create('Animal não encontrado ');
   FCountDadosImportados := FCountDadosImportados + 1 ;
   cdsPesoAlturaPESO.Clear ;
   cdsPesoAlturaALTURA.Clear ;
   // cdsPesoAlturaORD3.Clear ;
   if not cdsImportPESO.isNull then
     cdsPesoAlturaPESO.AsFloat := cdsImportPESO.AsFloat ;
   if not cdsImportALTURA.isNull then
     cdsPesoAlturaALTURA.AsFloat := cdsImportALTURA.AsFloat ;
   //if not cdsImportDATA.isNull then
   //  cdsPesoAlturaDATA.AsFloat := cdsImportDATA.AsFloat ;
   cdsPesoAltura.Post ;
  except on E : exception do
    begin
     if cdsPesoAltura.State in [dsInsert,dsEdit] then
        cdsPesoAltura.Cancel ;
     FErrs.AppendLine ( 'Brinco: ' + LBrinco + ', ' + e.Message )
    end;
  end;
end;

function TZoo_CrescimentoPesoAlturaDatamodule.AddBrinco(ABrinco: string; AData: TDateTime): boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsPesoAltura.Edit ;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKey ( KeyAnimal, AData )  ;

end;

function TZoo_CrescimentoPesoAlturaDatamodule.AddByKey(AKey: string ; AData : TDateTime  ): boolean;
const
  SELECT_ANIMAL = ' AN.KZOO_ANIMAL,    ' +
                  ' AN.BRINCO,         ' +
                  ' AN.NOMEESTABULO,   ' +
                  ' AN.STATUS,         ' +
                  ' AF.NASCIMENTO      ' +
                  'FROM ZOO_ANIMAIS AN ' +
                  'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
                  'WHERE KCAD_FAZENDA = :KCAD_FAZENDA ' +
                  '  AND KZOO_ANIMAL = :KZOO_ANIMAL   ' ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKey ;
    cds := nil ;

    try
//       DBResources.populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, SELECT_ANIMAL, p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

      // FNascimento := cds.fieldByName ( 'NASCIMENTO' ).AsDateTime;

       with cds do
         begin
           cdsPesoAltura.Append ;
           GetKey ( cdsPesoAlturaKZOO_ANIMAL ) ;
           cdsPesoAlturaKZOO_ANIMAL.asString  := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
           cdsPesoAlturaBRINCO.asString       := fieldByName ( 'BRINCO' ).asString       ;
           cdsPesoAlturaNOMEESTABULO.asString := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsPesoAlturaDATA.asDateTime       := AData ;
         end
    finally
       cds.Free ;
       p.free ;
    end;
end;

procedure TZoo_CrescimentoPesoAlturaDatamodule.ApplyUpdates;
begin
  CDSSuppl.TCDSSuppl.ApplyUpdates( cdsPesoAltura ) ;
  OpenTables ;
end;

end.
