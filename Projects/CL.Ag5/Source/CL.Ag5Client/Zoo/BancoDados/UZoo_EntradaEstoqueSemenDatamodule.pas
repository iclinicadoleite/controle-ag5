unit UZoo_EntradaEstoqueSemenDatamodule;


interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_EntradaEstoqueSemenDatamodule = class(T_dtmBASE)
    cdsEstoqueSemen: TClientDataSet;
    dspEstoqueSemen: TDataSetProvider;
    sqlEstoqueSemen: TTcSQLDataSet;
    sqlEstoqueSemenKZOO_ANIMAL_SEMEN_COMPRA: TStringField;
    sqlEstoqueSemenKZOO_ANIMAL_MACHO: TStringField;
    sqlEstoqueSemenDATA: TSQLTimeStampField;
    cdsEstoqueSemenKZOO_ANIMAL_SEMEN_COMPRA: TStringField;
    cdsEstoqueSemenKZOO_ANIMAL_MACHO: TStringField;
    cdsEstoqueSemenDATA: TSQLTimeStampField;
    cdsEstoqueSemenBRINCO: TStringField;
    cdsEstoqueSemenNOMEESTABULO: TStringField;
    sqlEstoqueSemenVALORDOSE: TFloatField;
    sqlEstoqueSemenDOSES: TIntegerField;
    cdsEstoqueSemenVALORDOSE: TFloatField;
    cdsEstoqueSemenDOSES: TIntegerField;
    procedure cdsEstoqueSemenNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueSemenDATAValidate(Sender: TField);
    procedure cdsEstoqueSemenDOSESValidate(Sender: TField);
    procedure cdsEstoqueSemenVALORDOSEValidate(Sender: TField);
  private
    { Private declarations }
    function GetActiveKeyFromBrinco (ABrinco : string; var AKey : string ) : Boolean;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddBrinco ( ABrinco : string  ; AData : TDateTime ) : boolean ;
    function AddByKey ( AKey : string ; AData : TDateTime ) : boolean ;
    procedure RemoveCompra ;
    procedure ApplyUpdates ; override ;
  end;

implementation

uses Exceptions,Tc.DBRTL.AbstractDB, UDBZootecnico, CLAg5Types, CDSSuppl ;

{$R *.dfm}

function TZoo_EntradaEstoqueSemenDatamodule.LocateBrinco(
  ABrinco: string): boolean;
begin
   Result := cdsEstoqueSemen.Locate( 'BRINCO', ABrinco, [] ) ;
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsEstoqueSemen ) ;
end;

function TZoo_EntradaEstoqueSemenDatamodule.AddBrinco(ABrinco: string; AData: TDateTime): boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsEstoqueSemen.Edit ;
         exit ;
      end ;

    Result := GetActiveKeyFromBrinco ( ABrinco, KeyAnimal );

    if Result then
       AddByKey ( KeyAnimal, AData )  ;
end;

function TZoo_EntradaEstoqueSemenDatamodule.AddByKey(AKey: string;
  AData: TDateTime): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKey ;

    try
       cds := nil ;
       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'KZOO_ANIMAL, BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Código/Sêmen não encontrado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Sêmen Descartado');

       with cds do
         begin
           cdsEstoqueSemen.Append ;
           cdsEstoqueSemenKZOO_ANIMAL_MACHO.asString := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
           cdsEstoqueSemenBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
           cdsEstoqueSemenNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsEstoqueSemenDATA.asDateTime            := AData ;
         end

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_EntradaEstoqueSemenDatamodule.ApplyUpdates;
begin
   TCDSSuppl.ApplyUpdates ( cdsEstoqueSemen ) ;
   TCDSSuppl.CreateDataSet( cdsEstoqueSemen ) ;
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.RemoveCompra;
begin
   if not cdsEstoqueSemen.isEmpty then
      cdsEstoqueSemen.Delete ;
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenDATAValidate(Sender: TField);
begin
  if Sender.AsDateTime < 1 then
    raise warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
    raise warning.Create('Data não pode ser superior a data atual');
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenDOSESValidate(Sender: TField);
begin
  if ( Sender.AsInteger < 1 ) then
     raise Warning.Create('Necessário digitar a quantidade de dose');
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsEstoqueSemenKZOO_ANIMAL_SEMEN_COMPRA ) ;
end;

procedure TZoo_EntradaEstoqueSemenDatamodule.cdsEstoqueSemenVALORDOSEValidate(Sender: TField);
begin
  if ( Sender.AsFloat < 0 ) then
    raise  Warning.Create('Valor da dose inválido.');
end;

function TZoo_EntradaEstoqueSemenDatamodule.GetActiveKeyFromBrinco(ABrinco: string; var Akey :string ): Boolean;
const
  _SELECT_SEMEN =
       ' AN.KZOO_ANIMAL ' +
       ' FROM ZOO_ANIMAIS AN' +
       ' JOIN ZOO_ANIMAIS_MACHO AM ON AM.KZOO_ANIMAL_MACHO = AN.KZOO_ANIMAL ' +
       ' WHERE AN.KCAD_FAZENDA = :KCAD_FAZENDA' +
       ' AND AN.STATUS = :SEMEN ' +
       ' AND AN.BRINCO = :CODIGO ' ;
var
  cds : TClientDataSet ;
  p : TParams ;

begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftInteger, 'SEMEN', ptInput ).AsInteger := _ST_STATUS_ANIMAL_SEMEN ;
    p.CreateParam( ftString, 'CODIGO', ptInput ).asString := ABrinco ;

    try
      cds := nil ;
      TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_SEMEN, p);

      Result := not cds.IsEmpty ;
      if Result then
        AKey := cds.FieldByName('KZOO_ANIMAL').asString ;

    finally
      cds.Free ;
      p.free ;
    end;
end;

end.
