unit UZoo_SanidadeCMTDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_SanidadeCMTDatamodule = class(T_dtmBASE)
    cdsCMT: TClientDataSet;
    dspCMT: TDataSetProvider;
    sqlCMT: TTcSQLDataSet;
    sqlCMTKZOO_ANIMAL_FEMEA_CMT: TStringField;
    sqlCMTKZOO_ANIMAL_FEMEA: TStringField;
    sqlCMTDATA: TSQLTimeStampField;
    sqlCMTAD: TStringField;
    sqlCMTAE: TStringField;
    sqlCMTPD: TStringField;
    sqlCMTPE: TStringField;
    sqlCMTWMT: TIntegerField;
    sqlCMTOBSERVACAO: TMemoField;
    cdsCMTKZOO_ANIMAL_FEMEA_CMT: TStringField;
    cdsCMTKZOO_ANIMAL_FEMEA: TStringField;
    cdsCMTDATA: TSQLTimeStampField;
    cdsCMTAD: TStringField;
    cdsCMTAE: TStringField;
    cdsCMTPD: TStringField;
    cdsCMTPE: TStringField;
    cdsCMTWMT: TIntegerField;
    cdsCMTOBSERVACAO: TMemoField;
    cdsCMTBRINCO: TStringField;
    cdsCMTNOMEESTABULO: TStringField;
    sqlCMTKCAD_FUNCIONARIO: TStringField;
    sqlCMTNOMEFUNCIONARIO: TStringField;
    cdsCMTKCAD_FUNCIONARIO: TStringField;
    cdsCMTNOMEFUNCIONARIO: TStringField;
    cdsTipoCMTAD: TClientDataSet;
    cdsTipoCMTADTIPO: TStringField;
    cdsTipoCMTADVALOR: TStringField;
    cdsTipoCMTADDESCRICAO: TStringField;
    cdsTipoCMTADORDEM: TIntegerField;
    cdsTipoCMTAE: TClientDataSet;
    cdsTipoCMTAETIPO: TStringField;
    cdsTipoCMTAEVALOR: TStringField;
    cdsTipoCMTAEDESCRICAO: TStringField;
    cdsTipoCMTAEORDEM: TIntegerField;
    cdsTipoCMTPE: TClientDataSet;
    cdsTipoCMTPETIPO: TStringField;
    cdsTipoCMTPEVALOR: TStringField;
    cdsTipoCMTPEDESCRICAO: TStringField;
    cdsTipoCMTPEORDEM: TIntegerField;
    cdsTipoCMTPD: TClientDataSet;
    cdsTipoCMTPDTIPO: TStringField;
    cdsTipoCMTPDVALOR: TStringField;
    cdsTipoCMTPDDESCRICAO: TStringField;
    cdsTipoCMTPDORDEM: TIntegerField;
    cdsCMTDESC_AD: TStringField;
    cdsCMTDESC_AE: TStringField;
    cdsCMTDESC_PD: TStringField;
    cdsCMTDESC_PE: TStringField;
    sqlCMTLOTE: TStringField;
    cdsCMTLOTE: TStringField;
    procedure cdsCMTBRINCOValidate(Sender: TField);
    procedure cdsCMTNOMEFUNCIONARIOSetText(Sender: TField; const Text: string);
    procedure cdsCMTDATAValidate(Sender: TField);
    procedure cdsCMTBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure GetDadosAnimal ( AKey : string ) ;
    procedure InitTables ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure RemoveRecord ;
    procedure ApplyUpdates ; override ;
  end;

implementation

uses Exceptions, Tc.DBRTL.AbstractDB, UDBZootecnico, CLAg5Types, 
     ClAg5ClientZootecnicoCommonTypes, CDSSuppl ;

{$R *.dfm}

procedure TZoo_SanidadeCMTDatamodule.ApplyUpdates;
begin
  inherited;
  TCDSSuppl.ApplyUpdates ( cdsCMT ) ;
  InitTables ;
end;

procedure TZoo_SanidadeCMTDatamodule.cdsCMTBeforePost(DataSet: TDataSet);
begin
  if cdsCMTKCAD_FUNCIONARIO.IsNull then
     raise Warning.Create('Pesquise o funcionário');

  if (cdsCMTAD.IsNull and cdsCMTAE.IsNull and cdsCMTPD.IsNull and cdsCMTPE.IsNull) then
     raise Warning.Create('Deve ser preenchido ao menos um dos campos (AE / AD / PE / PD)');
end;

procedure TZoo_SanidadeCMTDatamodule.cdsCMTBRINCOValidate(Sender: TField);
var
 AKey : string ;
begin
   if not TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, Sender.asString, AKey ) then
      raise Warning.Create('Animal não encontrado/descartado');

   GetDadosAnimal ( AKey ) ;
end;

procedure TZoo_SanidadeCMTDatamodule.cdsCMTDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime < 1 then
     raise Warning.Create('Data inválida.');

//  if Sender.AsDateTime < (Now - 30) then
//     raise Warning.Create('Data não pode ser inferior a 30 dias.');

  if Sender.AsDateTime > Now then
     raise Warning.Create('Data não pode ser superior a data atual.');
end;

procedure TZoo_SanidadeCMTDatamodule.cdsCMTNOMEFUNCIONARIOSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  cdsCMTKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_SanidadeCMTDatamodule.GetDadosAnimal(AKey: string);
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
    cdsLocate.CloneCursor ( cdsCMT, False ) ;

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

    cdsCMTBRINCO.OnValidate := nil ;
    cdsCMT.DisableControls ;
    cdsCMTKZOO_ANIMAL_FEMEA.asString := cds.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
    cdsCMTBRINCO.asString            := cds.FieldByName ( 'BRINCO' ).asString ;
    cdsCMT.Post;
    cdsCMTBRINCO.OnValidate := cdsCMTBRINCOValidate ;

  finally
    cdsLocate.free ;
    cdsCMT.EnableControls ;
    if Assigned ( cds )  then
       cds.Free ;
    if Assigned ( p )  then
       p.free ;
  end;

end;

procedure TZoo_SanidadeCMTDatamodule.InitTables;
begin
  TCDSSuppl.CreateDataSet( cdsCMT ) ;
end;

procedure TZoo_SanidadeCMTDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTAE ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTAD ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTPE ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_CMT, cdsTipoCMTPD ) ;

  TCDSSuppl.CreateDataSet( cdsCMT ) ;
end;


procedure TZoo_SanidadeCMTDatamodule.RemoveRecord;
begin
   if not cdsCMT.isEmpty then
     cdsCMT.Delete ;
end;

procedure TZoo_SanidadeCMTDatamodule.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsCMT.State in [dsInsert, dsEdit] ) then
      cdsCMT.Edit ;
   cdsCMTNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsCMTKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

function TZoo_SanidadeCMTDatamodule.AddBrinco(ABrinco: string ; AData : TDateTime ; AKFuncionario, ANomeFuncionario : string  ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsCMT.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsCMT.Edit ;
         cdsCMTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
         cdsCMTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
         cdsCMTDATA.asDateTime            := AData ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    p.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

    cds := nil ;
    try
//       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;
       DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'F.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.NOMEESTABULO, F.LOTE'
        +#13#10'FROM ZOO_ANIMAIS_FEMEA F'
        +#13#10'LEFT JOIN ZOO_ANIMAIS A on A.KZOO_ANIMAL = F.KZOO_ANIMAL_FEMEA'
        +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO ) AND ( A.STATUS <> :STATUS_DESCARTADO )', p ) ;

       Result := not cds.IsEmpty ;

       // matem o validate do brinco sempre desabilitado ... caso
       // necessite so retornar...
       cdsCMTBRINCO.OnValidate := nil ;

       if Result then
         with cds do
           begin
             cdsCMT.Append ;
             GetKey ( cdsCMTKZOO_ANIMAL_FEMEA_CMT ) ;
             cdsCMTKZOO_ANIMAL_FEMEA.asString := fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString  ;
             cdsCMTBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
             cdsCMTNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
             cdsCMTKCAD_FUNCIONARIO.asString  := AKFuncionario ;
             cdsCMTNOMEFUNCIONARIO.asString   := ANomeFuncionario ;
             cdsCMTDATA.asDateTime            := AData ;
             cdsCMTLOTE.asString              := fieldByName ( 'LOTE' ).asString ;
           end
         else
            raise Warning.Create('Brinco não encontrado/Animal descartado');

    finally
       cds.Free ;
       p.free ;
    end;

end;

end.
