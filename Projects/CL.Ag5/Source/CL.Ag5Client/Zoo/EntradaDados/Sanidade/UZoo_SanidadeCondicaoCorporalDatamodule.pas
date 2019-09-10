unit UZoo_SanidadeCondicaoCorporalDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_SanidadeCondicaoCorporalDatamodule = class(T_dtmBASE)
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
    cdsCCBRINCO_: TStringField;
    procedure cdsCCBRINCOValidate(Sender: TField);
    procedure cdsCCNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
    procedure cdsCCCCValidate(Sender: TField);
    procedure cdsCCDATAValidate(Sender: TField);
    procedure cdsCCBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure GetDadosAnimal ( AKey : string ) ;
    procedure InitTables ;
    procedure UpdateCC ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    procedure RemoveRecord ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure ApplyUpdates ; override ;
  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl, CLAg5Types, Math, ThreadSuppl,
     ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

procedure TZoo_SanidadeCondicaoCorporalDatamodule.ApplyUpdates;
begin
  inherited;
  TCDSSuppl.ApplyUpdates ( cdsCC ) ;
  InitTables ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.cdsCCBeforePost(DataSet: TDataSet);
begin
  if cdsCCCC.IsNull then
     raise Warning.Create('Digite a condição corporal do animal.');

  if cdsCCKCAD_FUNCIONARIO.IsNull then
     raise Warning.Create('Pesquise o funcionário.');
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.cdsCCBRINCOValidate(Sender: TField);
var
 AKey : string ;
begin
   if not TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, Sender.asString, AKey ) then
      raise Warning.Create('Animal não encontrado/descartado');

   GetDadosAnimal ( AKey ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.cdsCCCCValidate( Sender: TField ) ;
begin
  TSimpleThread.Create ( updateCC ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.cdsCCDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

//  if Sender.AsDateTime < (Date - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias.');

  if Sender.AsDateTime > Date then
     raise Warning.Create('Data não pode ser maior que data atual.');
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.cdsCCNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsCCKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.GetDadosAnimal(AKey: string);
const
  _SELECT_ANIMAL_ASECAR =
           'F.KZOO_ANIMAL_FEMEA, A.BRINCO, COALESCE ( A.NOMEESTABULO, A.NOMECOMPLETO ) NOME,'
    +#13#10'A.STATUS, F.KULTIMA_MONTA, F.ULTIMA_MONTA, L.KZOO_LACTACAO'
    +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
    +#13#10'LEFT JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
    +#13#10'LEFT JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = F.KULTIMA_LACTACAO'
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
    cdsLocate.CloneCursor ( cdsCC, False ) ;

    if cdsLocate.Locate ( 'KZOO_ANIMAL_FEMEA', AKey, [] ) then
       raise Warning.Create('Animal já esta na lista');

    p := TParams.Create ;
    p.CreateParam ( ftString,    'KCAD_FAZENDA',      ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam ( ftString,    'KZOO_ANIMAL_FEMEA', ptInput ).asString := AKey ;

    DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_ANIMAL_ASECAR, p ) ;

    if cds.IsEmpty then
       raise Warning.Create('Animal não encontrado') ;

    cdsCC.BeforePost := nil ;
    cdsCCBRINCO.OnValidate := nil ;
    cdsCC.DisableControls ;
    cdsCCKZOO_ANIMAL_FEMEA.asString := cds.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
    cdsCCBRINCO.asString            := cds.FieldByName ( 'BRINCO' ).asString ;
    cdsCCBRINCO_.asString           := cds.FieldByName ( 'BRINCO_' ).asString ;
    cdsCCCC.asInteger               := -1;
    cdsCC.Post;
    cdsCC.Edit;
    cdsCCCC.Clear ;
    //cdsCCBRINCO.OnValidate := cdsCCBRINCOValidate ;
    cdsCC.BeforePost := cdsCCBeforePost ;

  finally
    cdsLocate.free ;
    cdsCC.EnableControls ;
    if Assigned ( cds )  then
       cds.Free ;
    if Assigned ( p )  then
       p.free ;
  end;

end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.InitTables;
begin
  TCDSSuppl.CreateDataSet( cdsCC ) ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsCC ) ;
  cdsCC.IndexFieldNames := 'BRINCO_' ;
end;


procedure TZoo_SanidadeCondicaoCorporalDatamodule.RemoveRecord;
begin
    if not cdsCC.IsEmpty then
      cdsCC.Delete ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsCC.State in [dsInsert, dsEdit] ) then
      cdsCC.Edit ;
   cdsCCNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsCCKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_SanidadeCondicaoCorporalDatamodule.UpdateCC;
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

function TZoo_SanidadeCondicaoCorporalDatamodule.AddBrinco(ABrinco: string  ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
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
    p.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

    cds := nil ;
    try
//       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
               'F.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.BRINCO_, A.NOMEESTABULO, F.LOTE'
        +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
        +#13#10'LEFT JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
        +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND ( A.STATUS <> :STATUS_DESCARTADO )', p ) ;


       Result := not cds.IsEmpty ;

       // matem o validate do brinco sempre desabilitado ... caso
       // necessite so retornar...
       cdsCCBRINCO.OnValidate := nil ;
       cdsCC.BeforePost := nil ;
       cdsCCCC.OnValidate := nil ;

       if Result then
         with cds do
           begin
             cdsCC.Append ;
             GetKey ( cdsCCKZOO_ANIMAL_FEMEA_CC ) ;
             cdsCCKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString  ;
             cdsCCBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsCCBRINCO_.asString           := fieldByName ( 'BRINCO_' ).asString       ;
             cdsCCNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsCCKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsCCNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsCCDATA.asDateTime            := AData ;
             cdsCCLOTE.asString              := fieldByName ( 'LOTE' ).asString ;
             cdsCCCC.asInteger               := 0 ;
             cdsCC.Post ;
             cdsCC.Edit ;
             cdsCCCC.Clear ;
           end
       else
          raise Warning.Create('Brinco não encontrado/Animal descartado');

    finally
       cdsCC.BeforePost   := cdsCCBeforePost ;
       cdsCCCC.OnValidate := cdsCCCCValidate ;
       cds.Free ;
       p.free ;
    end;

end;

end.
