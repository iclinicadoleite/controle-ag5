unit UdtmZoo_CondicaoCorporalAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TdtmZoo_CondicaoCorporalAnimal = class(T_dtmBASE)
    cdsCC: TClientDataSet;
    cdsCCKZOO_ANIMAL_FEMEA_CC: TStringField;
    cdsCCKZOO_ANIMAL_FEMEA: TStringField;
    cdsCCBRINCO: TStringField;
    cdsCCNOMEESTABULO: TStringField;
    dspCC: TDataSetProvider;
    sqlCC: TTcSQLDataSet;
    sqlCCKZOO_ANIMAL_FEMEA_CC: TStringField;
    sqlCCKZOO_ANIMAL_FEMEA: TStringField;
    sqlCCDATA: TSQLTimeStampField;
    sqlCCCC: TFloatField;
    sqlCCOBSERVACAO: TMemoField;
    cdsCCDATA: TSQLTimeStampField;
    cdsCCCC: TFloatField;
    cdsCCOBSERVACAO: TMemoField;
    sqlCCKCAD_FUNCIONARIO: TStringField;
    sqlCCNOMEFUNCIONARIO: TStringField;
    cdsCCKCAD_FUNCIONARIO: TStringField;
    cdsCCNOMEFUNCIONARIO: TStringField;
    sqlCCLOTE: TStringField;
    cdsCCLOTE: TStringField;
    procedure cdsCCNewRecord(DataSet: TDataSet);
    procedure cdsCCCCValidate(Sender: TField);
    procedure cdsCCDATAValidate(Sender: TField);
    procedure cdsCCBeforePost(DataSet: TDataSet);
    procedure cdsCCNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
  private
    FMasterSource: TDataSource;
    procedure UpdateCC ;
    procedure SetMasterSource(const Value: TDataSource);

    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, Math, ThreadSuppl, CDSSuppl ;

{$R *.dfm}

procedure TdtmZoo_CondicaoCorporalAnimal.cdsCCBeforePost(DataSet: TDataSet);
begin
  if cdsCCDATA.IsNull then
     raise Warning.Create('Data inválida');  

  if cdsCCCC.IsNull then
     raise Warning.Create('Digite a condição corporal do animal.');

  if cdsCCKCAD_FUNCIONARIO.IsNull then
     raise Warning.Create('Pesquise o funcionário.');

  updateCC;
end;

procedure TdtmZoo_CondicaoCorporalAnimal.cdsCCCCValidate(Sender: TField);
begin
//   TSimpleThread.Create ( updateCC ) ;
  updateCC;
end;

procedure TdtmZoo_CondicaoCorporalAnimal.cdsCCDATAValidate(Sender: TField);
begin
//  if Sender.AsDateTime < (Date - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias');

  if Sender.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data não pode ser superior a data atual');
end;

procedure TdtmZoo_CondicaoCorporalAnimal.cdsCCNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsCCKZOO_ANIMAL_FEMEA_CC ) ;
  cdsCCKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
end;

procedure TdtmZoo_CondicaoCorporalAnimal.cdsCCNOMEFUNCIONARIOSetText(Sender: TField;
  const Text: string);
begin
  Sender.AsString := text ;
  cdsCCKCAD_FUNCIONARIO.Clear
end;

procedure TdtmZoo_CondicaoCorporalAnimal.OpenTables;
begin
   TCDSSuppl.SetMasterSource(cdsCC, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open (  cdsCC ) ;
end;


procedure TdtmZoo_CondicaoCorporalAnimal.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsCC.State in [dsInsert, dsEdit] ) then
    cdsCC.Edit ;

  cdsCCNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
  cdsCCKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TdtmZoo_CondicaoCorporalAnimal.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
end;

procedure TdtmZoo_CondicaoCorporalAnimal.UpdateCC;
begin
   cdsCCCC.OnValidate := nil ;

   if cdsCCCC.AsFloat > 5 then
      cdsCCCC.Value := 5
   else
     if cdsCCCC.AsFloat < 0.25 then
        cdsCCCC.Value := 0.25
   else
     try
       cdsCCCC.AsFloat := RoundTo( cdsCCCC.AsFloat * 4, 0) / 4 ;
     except
       cdsCCCC.AsFloat := 0.25 ;
     end;

   cdsCCCC.OnValidate := cdsCCCCValidate ;
end;

function TdtmZoo_CondicaoCorporalAnimal.AddBrinco(ABrinco: string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsCC.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsCC.Edit ;
         cdsCCKCAD_FUNCIONARIO.asString  := AKFuncionario ;
         cdsCCNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
         cdsCCDATA.asDateTime            := AData ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    cds := nil ;
    try
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
           begin
             cdsCC.Append ;
             GetKey ( cdsCCKZOO_ANIMAL_FEMEA_CC ) ;
             cdsCCKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
             cdsCCBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsCCNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsCCKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsCCNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsCCDATA.asDateTime            := AData ;
           end
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

end.
