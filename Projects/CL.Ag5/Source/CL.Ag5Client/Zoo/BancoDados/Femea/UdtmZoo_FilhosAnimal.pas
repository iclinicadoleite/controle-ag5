unit UdtmZoo_FilhosAnimal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, UdtmSYS_BASE;

type
  TdtmZoo_FilhosAnimal = class(T_dtmBASE)
    sqlFilhos: TTcSQLDataSet;
    cdsFilhos: TClientDataSet;
    dspFilhos: TDataSetProvider;
    sqlFilhosKZOO_ANIMAL_LINHAGEM: TStringField;
    sqlFilhosKZOO_ANIMAL_FEMEA: TStringField;
    sqlFilhosNASCIMENTO: TSQLTimeStampField;
    sqlFilhosNOMEANIMAL: TStringField;
    sqlFilhosSEXO: TStringField;
    sqlFilhosNATIMORTO: TStringField;
    sqlFilhosGRAUSANGUE: TStringField;
    sqlFilhosRACA: TIntegerField;
    sqlFilhosNOMEPAI: TStringField;
    sqlFilhosPESO: TIntegerField;
    cdsFilhosKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsFilhosKZOO_ANIMAL_FEMEA: TStringField;
    cdsFilhosNASCIMENTO: TSQLTimeStampField;
    cdsFilhosNOMEANIMAL: TStringField;
    cdsFilhosSEXO: TStringField;
    cdsFilhosNATIMORTO: TStringField;
    cdsFilhosGRAUSANGUE: TStringField;
    cdsFilhosRACA: TIntegerField;
    cdsFilhosNOMEPAI: TStringField;
    cdsFilhosPESO: TIntegerField;
    sqlFilhosBRINCO: TStringField;
    cdsFilhosBRINCO: TStringField;
    sqlFilhosKZOO_ANIMAL: TStringField;
    cdsFilhosKZOO_ANIMAL: TStringField;
    procedure cdsFilhosNewRecord(DataSet: TDataSet);
    procedure cdsFilhosNATIMORTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsFilhosBeforeInsert(DataSet: TDataSet);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure SetFilho ( Key : String ; Nome : string ) ;
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses CDSSuppl, UDBZootecnico;

{$R *.dfm}

procedure TdtmZoo_FilhosAnimal.cdsFilhosBeforeInsert(DataSet: TDataSet);
begin
  Abort
end;

procedure TdtmZoo_FilhosAnimal.cdsFilhosNATIMORTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if ( DisplayText ) then
     begin
      if not cdsFilhos.IsEmpty then
        if cdsFilhosNATIMORTO.asBoolean then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString ;
end;

procedure TdtmZoo_FilhosAnimal.cdsFilhosNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsFilhosKZOO_ANIMAL_LINHAGEM ) ;
//  cdsFilhosKZOO_ANIMAL_FEMEA.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
//  cdsFilhosTIPOPARENTESCO.asInteger := 3 ;
end;

procedure TdtmZoo_FilhosAnimal.OpenTables;
begin
   TCDSSuppl.SetMasterSource(cdsFilhos, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open (  cdsFilhos ) ;
end;

procedure TdtmZoo_FilhosAnimal.SetFilho(Key, Nome: string);
begin
   if not ( cdsFilhos.State in [dsInsert,dsEdit] ) then
      cdsFilhos.Edit ;

//   cdsFilhosNOMEANIMAL_PARENTE.asString := Nome ;
//   cdsFilhosKZOO_ANIMAL_PARENTE.asString := Key ;
end;

procedure TdtmZoo_FilhosAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
