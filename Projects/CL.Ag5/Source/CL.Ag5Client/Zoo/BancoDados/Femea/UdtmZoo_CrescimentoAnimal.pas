unit UdtmZoo_CrescimentoAnimal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE,
  System.Variants, Data.SqlTimSt;

type
  TdtmZoo_CrescimentoAnimal = class(T_dtmBASE)
    cdsCrescimento: TClientDataSet;
    sqlCrescimento: TTcSQLDataSet;
    dspCrescimento: TDataSetProvider;
    sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    sqlCrescimentoKZOO_ANIMAL: TStringField;
    sqlCrescimentoDATA: TSQLTimeStampField;
    sqlCrescimentoPESO: TIntegerField;
    sqlCrescimentoGANHOPESO: TFloatField;
    sqlCrescimentoALTURA: TIntegerField;
    sqlCrescimentoOBSERVACAO: TMemoField;
    cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    cdsCrescimentoKZOO_ANIMAL: TStringField;
    cdsCrescimentoDATA: TSQLTimeStampField;
    cdsCrescimentoIDADE: TIntegerField;
    cdsCrescimentoPESO: TIntegerField;
    cdsCrescimentoGANHOPESO: TFloatField;
    cdsCrescimentoALTURA: TIntegerField;
    cdsCrescimentoOBSERVACAO: TMemoField;
    procedure cdsCrescimentoNewRecord(DataSet: TDataSet);
    procedure cdsCrescimentoDATAValidate(Sender: TField);
    procedure cdsCrescimentoPESOValidate(Sender: TField);
    procedure cdsCrescimentoALTURAValidate(Sender: TField);
    procedure cdsCrescimentoBeforePost(DataSet: TDataSet);
    procedure cdsCrescimentoCalcFields(DataSet: TDataSet);
    procedure dspCrescimentoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses UDBZootecnico, Exceptions, DateUtils, CDSSuppl;

{$R *.dfm}

{ TdtmZoo_CrescimentoAnimal }

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoALTURAValidate(Sender: TField);
begin
  // regras alteradas em 20.07.2012 - em conversa com Vitor/Marsola
  // para utilizar a mesa regra de ''Crias'' em ''Partos/Abortos'' e ''Reprodução - Ficha Femea''
  (*
  if Sender.AsInteger < 40 then
    raise Warning.Create('Altura mínima permitida 40 cm');

  if Sender.AsInteger > 210 then
    raise Warning.Create('Altura máxima permitida 210 cm');
  *)

  if Sender.AsInteger < 0 then
     raise Warning.Create('Altura não pode ser inferior a 0.');
  if Sender.AsInteger > 210 then
     raise Warning.Create('Altura máxima permitida 210 cm');

end;

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoBeforePost(DataSet: TDataSet);
begin
  if cdsCrescimentoDATA.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

  if    ( cdsCrescimentoPESO.IsNull {or (cdsCrescimentoPESO.asInteger = 0)})
   and  ( cdsCrescimentoALTURA.IsNull {or (cdsCrescimentoALTURA.asInteger = 0)}) then
    raise Warning.Create('Necessário digitar peso e/ou altura');

end;

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoCalcFields(DataSet: TDataSet);
begin
  if  Assigned ( FMasterSource )
  and Assigned (  FMasterSource.DataSet )
  and FMasterSource.DataSet.Active then
    cdsCrescimentoIDADE.asInteger := Trunc ( cdsCrescimentoDATA.asDateTime - FMasterSource.DataSet.FieldByName( 'NASCIMENTO' ).asDateTime )


end;

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoDATAValidate(Sender: TField);
var
 cds: TClientDataSet;
begin
  if Sender.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data não pode ser superior a data atual');

  if Sender.AsDateTime < FMasterSource.DataSet.FieldByName( 'NASCIMENTO' ).asDateTime then
    raise Warning.Create(' Data da pesagem inferior a data de nascimento ');

  cds:= TClientDataSet.Create( nil );
  cds.PacketRecords := 0;
  cds.CloneCursor(cdsCrescimento, False, False);
  if cds.Locate('DATA',cdsCrescimentoDATA.AsVariant,[]) then
   begin
     cds.Free;
     raise Warning.Create('Já existe um registro de crescimento nesta mesma data');
   end;
  cds.Free;
end;

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO ) ;
  cdsCrescimentoKZOO_ANIMAL.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL_FEMEA' ).Value ;
end;

procedure TdtmZoo_CrescimentoAnimal.cdsCrescimentoPESOValidate(Sender: TField);
begin
  // regras alteradas em 20.07.2012 - em conversa com Vitor/Marsola
  // para utilizar a mesa regra de ''Crias'' em ''Partos/Abortos'' e ''Reprodução - Ficha Femea''
  (*
  if Sender.AsInteger < 25 then
    raise Warning.Create('Peso mínimo permitido 25 Kg');

  if Sender.AsInteger > 1000 then
    raise Warning.Create('Peso máximo permitido 1000 Kg');
    *)

  if Sender.AsInteger < 0 then
    raise Warning.Create('Peso não pode ser inferior a zero.');
  if Sender.AsInteger > 999 then
    raise Warning.Create('Peso máximo permitido 999 Kg');

end;


procedure TdtmZoo_CrescimentoAnimal.dspCrescimentoAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
const
  _UPDATE_CRESCIMENTO_NASCIMENTO =
            'UPDATE ZOO_ANIMAIS_FEMEA'
     +#13#10'   SET KCRESCIMENTO_NASCIMENTO = :KZOO_ANIMAL_CRESCIMENTO'
     +#13#10' WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
     +#13#10'   AND NASCIMENTO = :DATA';

var
  p: TParams;
  LKCrescimento, LKZOO_ANIMAL : String;
begin
  if UpdateKind = ukDelete then
    Exit;

  if (VarIsNull(DeltaDs.FieldByName('KZOO_ANIMAL_CRESCIMENTO').NewValue)) or
     (VarIsEmpty(DeltaDs.FieldByName('KZOO_ANIMAL_CRESCIMENTO').NewValue)) then
     LKCrescimento := DeltaDs.FieldByName('KZOO_ANIMAL_CRESCIMENTO').OldValue
  else
     LKCrescimento := DeltaDs.FieldByName('KZOO_ANIMAL_CRESCIMENTO').NewValue;


  if (VarIsNull(DeltaDs.FieldByName('KZOO_ANIMAL').NewValue)) or
     (VarIsEmpty(DeltaDs.FieldByName('KZOO_ANIMAL').NewValue)) then
     LKZOO_ANIMAL := DeltaDs.FieldByName('KZOO_ANIMAL').OldValue
  else
     LKZOO_ANIMAL := DeltaDs.FieldByName('KZOO_ANIMAL').NewValue;

  p := TParams.Create ;
  p.Clear;
  p.CreateParam( ftString,  'KZOO_ANIMAL_CRESCIMENTO', ptInput ).asString  := LKCrescimento;
  p.CreateParam( ftString   , 'KZOO_ANIMAL_FEMEA', ptInput ).asString      := LKZOO_ANIMAL;
  p.CreateParam( ftTimeStamp, 'DATA'       , ptInput ).AsSQLTimeStamp      := DateTimeToSQLTimesTamp( VarToDateTime( DeltaDs.FieldByName('DATA').AsDateTime ) );
  DBResources['ZOOTECNICO'].Execute( _UPDATE_CRESCIMENTO_NASCIMENTO, p );
  p.Free;

end;

procedure TdtmZoo_CrescimentoAnimal.OpenTables;
begin
   TCDSSuppl.SetMasterSource(cdsCrescimento, 'KZOO_ANIMAL', FMasterSource, 'KZOO_ANIMAL_FEMEA' ) ;
   TCDSSuppl.Open (  cdsCrescimento ) ;
end;

procedure TdtmZoo_CrescimentoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
