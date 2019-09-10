unit UZoo_AtividadesLVCiclosAnormaisDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider ;

type
  TZoo_AtividadesLVCiclosAnormaisDatamodule = class(T_dtmBASE)
    cdsCiclosAnormais: TClientDataSet ;
    dspCiclosAnormais: TDataSetProvider;
    sqlCiclosAnormais: TTcSQLDataSet;
    sqlCiclosAnormaisBRINCO: TStringField;
    sqlCiclosAnormaisDATA: TSQLTimeStampField;
    sqlCiclosAnormaisLOTE: TStringField;
    sqlCiclosAnormaisEVENTO: TStringField;
    sqlCiclosAnormaisNOME: TStringField;
    sqlCiclosAnormaisINTERVALO: TIntegerField;
    sqlCiclosAnormaisFUNCIONARIO: TStringField;
    sqlCiclosAnormaisDIAGNOSTICO: TStringField;
    sqlCiclosAnormaisOBS: TMemoField;
    cdsCiclosAnormaisBRINCO: TStringField;
    cdsCiclosAnormaisDATA: TSQLTimeStampField;
    cdsCiclosAnormaisLOTE: TStringField;
    cdsCiclosAnormaisEVENTO: TStringField;
    cdsCiclosAnormaisNOME: TStringField;
    cdsCiclosAnormaisINTERVALO: TIntegerField;
    cdsCiclosAnormaisFUNCIONARIO: TStringField;
    cdsCiclosAnormaisDIAGNOSTICO: TStringField;
    cdsCiclosAnormaisOBS: TMemoField;
    sqlCiclosAnormaisBRINCO_: TStringField;
    cdsCiclosAnormaisBRINCO_: TStringField;
    sqlCiclosAnormaisKZOO_ANIMAL_FEMEA: TStringField;
    cdsCiclosAnormaisKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsCiclosAnormaisBeforeOpen(DataSet: TDataSet);
    procedure cdsCiclosAnormaisAfterOpen(DataSet: TDataSet);
    procedure cdsCiclosAnormaisEVENTOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure SetParams ;
    procedure CalculaIntervalos ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    Constructor Create ( AOwner : TComponent  ) ;override ;
  end;

implementation

uses Exceptions, CLAg5Types, UDBZootecnico, Data.SQLTimSt, DateUtils ;

{$R *.dfm}

var
  KZOO_ANIMAL : string ;
  N_PARTOS : Integer ;

procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.CalculaIntervalos;
var
  LastBrinco : string ;
  nAborto : integer ;
  LastEvento : TDateTime ;
begin
   with cdsCiclosAnormais do
     begin
       DisableControls ;
       LogChanges := False ;
       First ;
       while (not eof ) do
         begin
           LastBrinco := cdsCiclosAnormaisBRINCO.asString ;
           LastEvento := cdsCiclosAnormaisDATA.asDateTime ;
           nAborto    := 0 ;
           while (not eof) and ( cdsCiclosAnormaisBRINCO.asString = LastBrinco ) do
             begin
               if not cdsCiclosAnormaisINTERVALO.isNull then
                  begin
                    Edit ;

                    cdsCiclosAnormaisINTERVALO.asInteger :=  Trunc ( cdsCiclosAnormaisDATA.asDateTime - LastEvento ) ;
                    LastEvento := cdsCiclosAnormaisDATA.asDateTime ;

                    if Trim ( cdsCiclosAnormaisDiagnostico.asString ) <> '' then
                       begin
                         Inc ( nAborto ) ;
                         cdsCiclosAnormaisEVENTO.asString := IntToStr ( nAborto ) ;
                       end;
                    Post ;
                  end;
               Next ;
             end;
         end;
       First ;
       EnableControls ;
     end;
end;

procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormaisAfterOpen(
  DataSet: TDataSet);
begin
   CalculaIntervalos ;
end;

procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormaisBeforeOpen(DataSet: TDataSet);
begin
  SetParams;
end;


procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.cdsCiclosAnormaisEVENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.DataSet.FieldByName ( 'DIAGNOSTICO' ).asString = 'Aborto' then
      Text := 'Diagnóstico ' + Sender.AsString
    else
      Text := Sender.AsString;
end;

constructor TZoo_AtividadesLVCiclosAnormaisDatamodule.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.OpenTables;
begin
//  inherited;
end;

procedure TZoo_AtividadesLVCiclosAnormaisDatamodule.SetParams;
begin
  cdsCiclosAnormais.Params.ParamByName ( 'KCAD_FAZENDA' ).asString       := LoggedUser.DomainID ;
  cdsCiclosAnormais.Params.paramByName ( 'STATUS_DESCARTADO' ).asInteger := _ST_STATUS_FEMEA_DESCARTADO ;
  cdsCiclosAnormais.Params.paramByName ( 'RECEPTORA' ).asInteger         := _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ;
end;

end.
