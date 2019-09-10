unit UdtmZoo_AcasalamentoAnimal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE;

type
  TdtmZoo_AcasalamentoAnimal = class(T_dtmBASE)
    cdsAcasalamento1: TClientDataSet;
    cdsAcasalamento1KZOO_ANIMAL_ACASALAMENTO: TStringField;
    cdsAcasalamento1KZOO_ANIMAL_FEMEA: TStringField;
    cdsAcasalamento1KZOO_ANIMAL_MACHO: TStringField;
    cdsAcasalamento1NOMEMACHO: TStringField;
    sqlAcasalamento1: TTcSQLDataSet;
    sqlAcasalamento1KZOO_ANIMAL_ACASALAMENTO: TStringField;
    sqlAcasalamento1KZOO_ANIMAL_FEMEA: TStringField;
    sqlAcasalamento1KZOO_ANIMAL_MACHO: TStringField;
    sqlAcasalamento1NOMEMACHO: TStringField;
    dspAcasalamento1: TDataSetProvider;
    cdsAcasalamento2: TClientDataSet;
    cdsAcasalamento2KZOO_ANIMAL_ACASALAMENTO: TStringField;
    cdsAcasalamento2KZOO_ANIMAL_FEMEA: TStringField;
    cdsAcasalamento2KZOO_ANIMAL_MACHO: TStringField;
    cdsAcasalamento2NOMEMACHO: TStringField;
    sqlAcasalamento2: TTcSQLDataSet;
    sqlAcasalamento2KZOO_ANIMAL_ACASALAMENTO: TStringField;
    sqlAcasalamento2KZOO_ANIMAL_FEMEA: TStringField;
    sqlAcasalamento2KZOO_ANIMAL_MACHO: TStringField;
    sqlAcasalamento2NOMEMACHO: TStringField;
    dspAcasalamento2: TDataSetProvider;
    cdsAcasalamento3: TClientDataSet;
    cdsAcasalamento3KZOO_ANIMAL_ACASALAMENTO: TStringField;
    cdsAcasalamento3KZOO_ANIMAL_FEMEA: TStringField;
    cdsAcasalamento3KZOO_ANIMAL_MACHO: TStringField;
    cdsAcasalamento3NOMEMACHO: TStringField;
    sqlAcasalamento3: TTcSQLDataSet;
    sqlAcasalamento3KZOO_ANIMAL_ACASALAMENTO: TStringField;
    sqlAcasalamento3KZOO_ANIMAL_FEMEA: TStringField;
    sqlAcasalamento3KZOO_ANIMAL_MACHO: TStringField;
    sqlAcasalamento3NOMEMACHO: TStringField;
    dspAcasalamento3: TDataSetProvider;
    cdsAcasalamento4: TClientDataSet;
    cdsAcasalamento4KZOO_ANIMAL_ACASALAMENTO: TStringField;
    cdsAcasalamento4KZOO_ANIMAL_FEMEA: TStringField;
    cdsAcasalamento4KZOO_ANIMAL_MACHO: TStringField;
    cdsAcasalamento4NOMEMACHO: TStringField;
    sqlAcasalamento4: TTcSQLDataSet;
    sqlAcasalamento4KZOO_ANIMAL_ACASALAMENTO: TStringField;
    sqlAcasalamento4KZOO_ANIMAL_FEMEA: TStringField;
    sqlAcasalamento4KZOO_ANIMAL_MACHO: TStringField;
    sqlAcasalamento4NOMEMACHO: TStringField;
    dspAcasalamento4: TDataSetProvider;
    cdsListaMacho: TClientDataSet;
    dspListaMacho: TDataSetProvider;
    sqlListaMacho: TTcSQLDataSet;
    cdsListaMachoKZOO_ANIMAL_MACHO: TStringField;
    cdsListaMachoBRINCOMACHO: TStringField;
    cdsListaMachoNOMEMACHO: TStringField;
    sqlAcasalamento1PREFERENCIA: TIntegerField;
    sqlAcasalamento2PREFERENCIA: TIntegerField;
    sqlAcasalamento3PREFERENCIA: TIntegerField;
    sqlAcasalamento4PREFERENCIA: TIntegerField;
    cdsAcasalamento1PREFERENCIA: TIntegerField;
    cdsAcasalamento2PREFERENCIA: TIntegerField;
    cdsAcasalamento3PREFERENCIA: TIntegerField;
    cdsAcasalamento4PREFERENCIA: TIntegerField;
    sqlAcasalamento1BRINCOMACHO: TStringField;
    sqlAcasalamento2BRINCOMACHO: TStringField;
    sqlAcasalamento3BRINCOMACHO: TStringField;
    sqlAcasalamento4BRINCOMACHO: TStringField;
    cdsAcasalamento1BRINCOMACHO: TStringField;
    cdsAcasalamento2BRINCOMACHO: TStringField;
    cdsAcasalamento3BRINCOMACHO: TStringField;
    cdsAcasalamento4BRINCOMACHO: TStringField;
    sqlListaMachoKZOO_ANIMAL_MACHO: TStringField;
    sqlListaMachoBRINCOMACHO: TStringField;
    sqlListaMachoNOMEMACHO: TStringField;
    sqlListaMachoREGISTRO: TStringField;
    sqlListaMachoESTOQUE: TIntegerField;
    sqlListaMachoDS_LEITE: TIntegerField;
    sqlListaMachoDS_TIPO: TFloatField;
    sqlListaMachoDS_UBERE: TFloatField;
    sqlListaMachoDS_PERNAPE: TFloatField;
    sqlListaMachoSANIDADE: TStringField;
    sqlListaMachoDS_FACILIDADEPARTO: TFloatField;
    sqlListaMachoPRECO_COMPRA: TFMTBCDField;
    sqlListaMachoDS_CANECA: TStringField;
    sqlListaMachoDS_HACK: TStringField;
    cdsListaMachoREGISTRO: TStringField;
    cdsListaMachoESTOQUE: TIntegerField;
    cdsListaMachoDS_LEITE: TIntegerField;
    cdsListaMachoDS_TIPO: TFloatField;
    cdsListaMachoDS_UBERE: TFloatField;
    cdsListaMachoDS_PERNAPE: TFloatField;
    cdsListaMachoDS_BOTIJAO: TStringField;
    cdsListaMachoSANIDADE: TStringField;
    cdsListaMachoDS_FACILIDADEPARTO: TFloatField;
    cdsListaMachoPRECO_COMPRA: TFMTBCDField;
    cdsListaMachoDS_CANECA: TStringField;
    cdsListaMachoDS_HACK: TStringField;
    sqlAcasalamento1REGISTRO: TStringField;
    sqlAcasalamento1ESTOQUE: TIntegerField;
    sqlAcasalamento1DS_LEITE: TIntegerField;
    sqlAcasalamento1DS_TIPO: TFloatField;
    sqlAcasalamento1DS_UBERE: TFloatField;
    sqlAcasalamento1DS_PERNAPE: TFloatField;
    sqlAcasalamento1DS_FACILIDADEPARTO: TFloatField;
    sqlAcasalamento1PRECO_COMPRA: TFMTBCDField;
    sqlAcasalamento1DS_BOTIJAO: TStringField;
    sqlAcasalamento1DS_CANECA: TStringField;
    sqlAcasalamento1DS_HACK: TStringField;
    cdsAcasalamento1REGISTRO: TStringField;
    cdsAcasalamento1ESTOQUE: TIntegerField;
    cdsAcasalamento1DS_LEITE: TIntegerField;
    cdsAcasalamento1DS_TIPO: TFloatField;
    cdsAcasalamento1DS_UBERE: TFloatField;
    cdsAcasalamento1DS_PERNAPE: TFloatField;
    cdsAcasalamento1DS_FACILIDADEPARTO: TFloatField;
    cdsAcasalamento1PRECO_COMPRA: TFMTBCDField;
    cdsAcasalamento1DS_CANECA: TStringField;
    cdsAcasalamento1DS_HACK: TStringField;
    sqlAcasalamento2REGISTRO: TStringField;
    sqlAcasalamento2ESTOQUE: TIntegerField;
    sqlAcasalamento2DS_LEITE: TIntegerField;
    sqlAcasalamento2DS_TIPO: TFloatField;
    sqlAcasalamento2DS_UBERE: TFloatField;
    sqlAcasalamento2DS_PERNAPE: TFloatField;
    sqlAcasalamento2SANIDADE: TStringField;
    sqlAcasalamento2DS_FACILIDADEPARTO: TFloatField;
    sqlAcasalamento2PRECO_COMPRA: TFMTBCDField;
    sqlAcasalamento2DS_BOTIJAO: TStringField;
    sqlAcasalamento2DS_CANECA: TStringField;
    sqlAcasalamento2DS_HACK: TStringField;
    cdsAcasalamento2REGISTRO: TStringField;
    cdsAcasalamento2ESTOQUE: TIntegerField;
    cdsAcasalamento2DS_LEITE: TIntegerField;
    cdsAcasalamento2DS_TIPO: TFloatField;
    cdsAcasalamento2DS_UBERE: TFloatField;
    cdsAcasalamento2DS_PERNAPE: TFloatField;
    cdsAcasalamento2SANIDADE: TStringField;
    cdsAcasalamento2DS_FACILIDADEPARTO: TFloatField;
    cdsAcasalamento2PRECO_COMPRA: TFMTBCDField;
    cdsAcasalamento2DS_CANECA: TStringField;
    cdsAcasalamento2DS_HACK: TStringField;
    sqlAcasalamento3REGISTRO: TStringField;
    sqlAcasalamento3ESTOQUE: TIntegerField;
    sqlAcasalamento3DS_LEITE: TIntegerField;
    sqlAcasalamento3DS_TIPO: TFloatField;
    sqlAcasalamento3DS_UBERE: TFloatField;
    sqlAcasalamento3DS_PERNAPE: TFloatField;
    sqlAcasalamento3SANIDADE: TStringField;
    sqlAcasalamento3DS_FACILIDADEPARTO: TFloatField;
    sqlAcasalamento3PRECO_COMPRA: TFMTBCDField;
    sqlAcasalamento3DS_BOTIJAO: TStringField;
    sqlAcasalamento3DS_CANECA: TStringField;
    sqlAcasalamento3DS_HACK: TStringField;
    cdsAcasalamento3REGISTRO: TStringField;
    cdsAcasalamento3ESTOQUE: TIntegerField;
    cdsAcasalamento3DS_LEITE: TIntegerField;
    cdsAcasalamento3DS_TIPO: TFloatField;
    cdsAcasalamento3DS_UBERE: TFloatField;
    cdsAcasalamento3DS_PERNAPE: TFloatField;
    cdsAcasalamento3SANIDADE: TStringField;
    cdsAcasalamento3DS_FACILIDADEPARTO: TFloatField;
    cdsAcasalamento3PRECO_COMPRA: TFMTBCDField;
    cdsAcasalamento3DS_CANECA: TStringField;
    cdsAcasalamento3DS_HACK: TStringField;
    sqlAcasalamento4REGISTRO: TStringField;
    sqlAcasalamento4ESTOQUE: TIntegerField;
    sqlAcasalamento4DS_LEITE: TIntegerField;
    sqlAcasalamento4DS_TIPO: TFloatField;
    sqlAcasalamento4DS_UBERE: TFloatField;
    sqlAcasalamento4DS_PERNAPE: TFloatField;
    sqlAcasalamento4SANIDADE: TStringField;
    sqlAcasalamento4DS_FACILIDADEPARTO: TFloatField;
    sqlAcasalamento4PRECO_COMPRA: TFMTBCDField;
    sqlAcasalamento4DS_BOTIJAO: TStringField;
    sqlAcasalamento4DS_CANECA: TStringField;
    sqlAcasalamento4DS_HACK: TStringField;
    cdsAcasalamento4REGISTRO: TStringField;
    cdsAcasalamento4ESTOQUE: TIntegerField;
    cdsAcasalamento4DS_LEITE: TIntegerField;
    cdsAcasalamento4DS_TIPO: TFloatField;
    cdsAcasalamento4DS_UBERE: TFloatField;
    cdsAcasalamento4DS_PERNAPE: TFloatField;
    cdsAcasalamento4SANIDADE: TStringField;
    cdsAcasalamento4DS_FACILIDADEPARTO: TFloatField;
    cdsAcasalamento4PRECO_COMPRA: TFMTBCDField;
    cdsAcasalamento4DS_CANECA: TStringField;
    cdsAcasalamento4DS_HACK: TStringField;
    procedure cdsAcasalamentoNewRecord(DataSet: TDataSet);
    procedure cdsListaMachoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FRemovedKey : String ;
    FMasterSource: TDataSource;
    FInternalDataSource : TDataSource ;
    procedure SetMasterSource(const Value: TDataSource);
    procedure ChangeListaMacho ;
    procedure DoChangeListaMacho(Sender: TObject; Field: TField);
    procedure CopyFieldsFromListaToAcasalamento ( AcdsAcasalamento : TClientDataSet ; APreferencia : integer ) ;
    procedure CopyFieldsFromAcasalamentoToLista ( AcdsAcasalamento : TClientDataSet ) ;
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    procedure AddMacho ( Preferencia : integer ) ;
    procedure RemoveMacho ( Preferencia : integer ) ;
  end;


implementation

uses UDBZootecnico, CDSSuppl, CLAg5Types ;

{$R *.dfm}

{ TdtmZoo_AcasalamentoAnimal }

procedure TdtmZoo_AcasalamentoAnimal.cdsAcasalamentoNewRecord( DataSet: TDataSet ) ;
begin
  GetKey ( DataSet.FieldByName( 'KZOO_ANIMAL_ACASALAMENTO' ) ) ;
  DataSet.FieldByName( 'KZOO_ANIMAL_FEMEA' ).Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
  DataSet.FieldByName( 'KZOO_ANIMAL_MACHO' ).Value := cdsListaMachoKZOO_ANIMAL_MACHO.Value ;
end;

procedure TdtmZoo_AcasalamentoAnimal.cdsListaMachoBeforeOpen(DataSet: TDataSet);
begin
  cdsListaMacho.Params.ParamByName( 'KZOO_ANIMAL_FEMEA' ).Value     :=  FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
  cdsListaMacho.Params.ParamByName( 'STATUS_DESCARTADO' ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
end;

procedure TdtmZoo_AcasalamentoAnimal.ChangeListaMacho;
begin
   cdsListaMacho.Close ;
   TCDSSuppl.Open ( cdsListaMacho ) ;
end;

procedure TdtmZoo_AcasalamentoAnimal.AddMacho(Preferencia: integer);
var
  Chave : string ;
begin
  if ( Preferencia < 1 ) or ( Preferencia > 4 ) or (cdsListaMacho.IsEmpty) then
     exit ;

  Chave := cdsListaMachoKZOO_ANIMAL_MACHO.Value ;
  RemoveMacho ( Preferencia ) ;
  cdsListaMacho.Locate ( 'KZOO_ANIMAL_MACHO', Chave, [] ) ;

  case Preferencia of
    1 :   CopyFieldsFromListaToAcasalamento ( cdsAcasalamento1, Preferencia ) ;
    2 :   CopyFieldsFromListaToAcasalamento ( cdsAcasalamento2, Preferencia ) ;
    3 :   CopyFieldsFromListaToAcasalamento ( cdsAcasalamento3, Preferencia ) ;
    4 :   CopyFieldsFromListaToAcasalamento ( cdsAcasalamento4, Preferencia ) ;
  end;


  if FRemovedKey <> '' then
   begin
    cdsListaMacho.Locate ( 'KZOO_ANIMAL_MACHO', FRemovedKey, [] ) ;
    FRemovedKey := '' ;
   end;

end;


procedure TdtmZoo_AcasalamentoAnimal.RemoveMacho(Preferencia: integer);
begin
  case Preferencia of
    1 : CopyFieldsFromAcasalamentoToLista( cdsAcasalamento1 ) ;
    2 : CopyFieldsFromAcasalamentoToLista( cdsAcasalamento2 ) ;
    3 : CopyFieldsFromAcasalamentoToLista( cdsAcasalamento3 ) ;
    4 : CopyFieldsFromAcasalamentoToLista( cdsAcasalamento4 ) ;
  end ;
end;


procedure TdtmZoo_AcasalamentoAnimal.CopyFieldsFromAcasalamentoToLista ( AcdsAcasalamento : TClientDataSet ) ;
var
  i : integer ;
  Field : TField ;
begin
  if AcdsAcasalamento.isEmpty then
     exit ;
  self.cdsListaMacho.append ;
  FRemovedKey := AcdsAcasalamento.FieldByName ( 'KZOO_ANIMAL_MACHO' ).asString  ;

  for I := 0 to cdsListaMacho.fieldCount - 1 do
    begin
      Field :=  AcdsAcasalamento.FindField( cdsListaMacho.Fields[ I ].FieldName ) ;
      if Assigned ( Field ) then
         cdsListaMacho.Fields[ I ].Value := Field.Value ;
     end;
  cdsListaMacho.Post ;
  AcdsAcasalamento.Delete ;
  TCDSSuppl.ApplyUpdates( AcdsAcasalamento );
end;


procedure TdtmZoo_AcasalamentoAnimal.CopyFieldsFromListaToAcasalamento(
  AcdsAcasalamento: TClientDataSet; APreferencia : integer ) ;
var
  i : integer ;
  Field : TField ;
begin
  if cdsListaMacho.isEmpty then
     exit ;

  AcdsAcasalamento.Append ;
  AcdsAcasalamento.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).Value      := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
  AcdsAcasalamento.FieldByName ( 'PREFERENCIA' ).asInteger        := APreferencia ;
  for I := 0 to AcdsAcasalamento.fieldCount - 1 do
     if AcdsAcasalamento.Fields[ I ].IsNull then
       begin
        Field := cdsListaMacho.FindField( AcdsAcasalamento.Fields[ I ].FieldName ) ;
        if Assigned ( Field ) then
           AcdsAcasalamento.Fields[ I ].Value := Field.Value ;
       end;
  AcdsAcasalamento.Post ;
  cdsListaMacho.Delete ;
  TCDSSuppl.ApplyUpdates( AcdsAcasalamento );
end;

procedure TdtmZoo_AcasalamentoAnimal.DoChangeListaMacho(Sender: TObject;
  Field: TField);
begin
  ChangeListaMacho ;
end;

procedure TdtmZoo_AcasalamentoAnimal.OpenTables;
begin

   FInternalDataSource := TDataSource.Create ( self ) ;
   FInternalDataSource.OnDataChange := DoChangeListaMacho ;
   FInternalDataSource.DataSet := FMasterSource.DataSet ;

   TCDSSuppl.SetMasterSource(cdsAcasalamento1, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsAcasalamento1 ) ;

   TCDSSuppl.SetMasterSource(cdsAcasalamento2, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsAcasalamento2 ) ;

   TCDSSuppl.SetMasterSource(cdsAcasalamento3, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsAcasalamento3 ) ;

   TCDSSuppl.SetMasterSource(cdsAcasalamento4, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open ( cdsAcasalamento4 ) ;

   cdsListaMacho.LogChanges := False ;
   TCDSSuppl.Open ( cdsListaMacho ) ;

end;


procedure TdtmZoo_AcasalamentoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
