unit UdtmZoo_HistoricoToques;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TdtmZoo_HistoricoToques = class(T_dtmBASE)
    sqlHistoricoToques: TTcSQLDataSet;
    sqlHistoricoToquesKZOO_ANIMAL_FEMEA: TStringField;
    sqlHistoricoToquesBRINCOFEMEA: TStringField;
    sqlHistoricoToquesBRINCOFEMEA_: TStringField;
    sqlHistoricoToquesDATAEVENTO: TSQLTimeStampField;
    sqlHistoricoToquesDESC_TIPOEVENTO: TStringField;
    sqlHistoricoToquesNOMEFEMEA: TStringField;
    sqlHistoricoToquesNOMEMACHO: TStringField;
    sqlHistoricoToquesDATATOQUE: TSQLTimeStampField;
    sqlHistoricoToquesDIAGNOSTICO: TStringField;
    sqlHistoricoToquesKCAD_VETERINARIO: TStringField;
    sqlHistoricoToquesNOMEVETERINARIO: TStringField;
    dspHistoricoToques: TDataSetProvider;
    cdsHistoricoToques: TClientDataSet;
    cdsHistoricoToquesKZOO_ANIMAL_FEMEA: TStringField;
    cdsHistoricoToquesBRINCOFEMEA: TStringField;
    cdsHistoricoToquesBRINCOFEMEA_: TStringField;
    cdsHistoricoToquesDATAEVENTO: TSQLTimeStampField;
    cdsHistoricoToquesDESC_TIPOEVENTO: TStringField;
    cdsHistoricoToquesNOMEFEMEA: TStringField;
    cdsHistoricoToquesNOMEMACHO: TStringField;
    cdsHistoricoToquesDATATOQUE: TSQLTimeStampField;
    cdsHistoricoToquesDIAGNOSTICO: TStringField;
    cdsHistoricoToquesKCAD_VETERINARIO: TStringField;
    cdsHistoricoToquesNOMEVETERINARIO: TStringField;
  private
    { Private declarations }
    FKZooAnimalFemea : String;
    procedure SetKZooAnimalFemea(const Value: String);
    procedure SetParams;
  public
    { Public declarations }
    procedure OpenTables;
    property KZooAnimalFemea : String read FKZooAnimalFemea write SetKZooAnimalFemea;
  end;

{var
  dtmZoo_HistoricoToques: TdtmZoo_HistoricoToques;}

implementation

uses Exceptions, CDSSuppl;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmZoo_HistoricoToques }

procedure TdtmZoo_HistoricoToques.OpenTables;
begin
  SetParams;
  TCDSSuppl.Open( cdsHistoricoToques );
end;

procedure TdtmZoo_HistoricoToques.SetKZooAnimalFemea(const Value: String);
begin
  FKZooAnimalFemea := Value;
end;

procedure TdtmZoo_HistoricoToques.SetParams;
begin
  cdsHistoricoToques.Params.ParamByName ( 'KZOO_ANIMAL_FEMEA' ).asString := FKZooAnimalFemea  ;
end;

end.
