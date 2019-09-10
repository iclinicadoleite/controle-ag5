unit UZoo_EditLinhagemDatamodule;

interface

uses
  System.SysUtils, System.Classes, UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, UZoo_GrauDeSangueClass ;

type
  TZoo_EditLinhagemDatamodule = class(T_dtmBASE)
    sqlLinhagem: TTcSQLDataSet;
    sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    sqlLinhagemKZOO_ANIMAL: TStringField;
    sqlLinhagemKZOO_ANIMAL_MACHO: TStringField;
    sqlLinhagemNOMEPAI: TStringField;
    sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    sqlLinhagemNOMEMAE: TStringField;
    sqlLinhagemGRAUSANGUEPAI: TStringField;
    sqlLinhagemCOMPOSICAORACAPAI: TStringField;
    sqlLinhagemGRAUSANGUEMAE: TStringField;
    sqlLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagem: TClientDataSet;
    cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsLinhagemKZOO_ANIMAL: TStringField;
    cdsLinhagemKZOO_ANIMAL_MACHO: TStringField;
    cdsLinhagemNOMEPAI: TStringField;
    cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    cdsLinhagemNOMEMAE: TStringField;
    cdsLinhagemGRAUSANGUEPAI: TStringField;
    cdsLinhagemCOMPOSICAORACAPAI: TStringField;
    cdsLinhagemGRAUSANGUEMAE: TStringField;
    cdsLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemGSR_PAI: TStringField;
    cdsLinhagemGSR_MAE: TStringField;
    cdsAnimal: TClientDataSet;
    cdsAnimalKZOO_ANIMAL: TStringField;
    cdsAnimalBRINCO: TStringField;
    cdsAnimalNOMEESTABULO: TStringField;
    cdsAnimalNOMECOMPLETO: TStringField;
    cdsAnimalGRAUSANGUE: TStringField;
    cdsAnimalCOMPOSICAORACA: TStringField;
    cdsAnimalsqlLinhagem: TDataSetField;
    dspAnimal: TDataSetProvider;
    sqlAnimal: TTcSQLDataSet;
    sqlAnimalKZOO_ANIMAL: TStringField;
    sqlAnimalBRINCO: TStringField;
    sqlAnimalNOMEESTABULO: TStringField;
    sqlAnimalNOMECOMPLETO: TStringField;
    sqlAnimalGRAUSANGUE: TStringField;
    sqlAnimalCOMPOSICAORACA: TStringField;
    dtsSQLAnimal: TDataSource;
    cdsAnimalBRINCONOME: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure cdsAnimalBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
  private
    { Private declarations }
    FPrimaryKey : string ; // campo reservado para parametro
    FGrauDeSangue: TZoo_GrauDeSangue;
    procedure CalculateGrauSangue ;
  public
    { Public declarations }
    procedure SetPai   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure SetMae   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    property GrauDeSangue : TZoo_GrauDeSangue read FGrauDeSangue ;
    procedure UpdateRacasGrauSangue ;
    procedure SetComposicaoRacas ;
    procedure SetParams ( PK : string ) ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;

  end;


implementation

uses Tc.DBRTL.AbstractDB, CLAg5Types, StrUtils, Exceptions;

{$R *.dfm}

{ TdtmCustomDBEditSingle }


procedure TZoo_EditLinhagemDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] ) then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_EditLinhagemDatamodule.SetMae(Key, Nome, GrauSangue,
  ComposicaoRaca: string);
begin
   if not ( cdsLinhagem.State in [dsInsert,dsEdit] ) then
      cdsLinhagem.Edit ;

   cdsLinhagemNOMEMAE.asString  := Nome ;

   cdsLinhagemGRAUSANGUEMAE.asString     := GrauSangue ;
   cdsLinhagemCOMPOSICAORACAMAE.asString := ComposicaoRaca ;

   cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;

   cdsLinhagemKZOO_ANIMAL_FEMEA.asString := Key  ;

   CalculateGrauSangue ;
end;

procedure TZoo_EditLinhagemDatamodule.SetPai(Key, Nome, GrauSangue,
  ComposicaoRaca: string);
begin
   if not ( cdsLinhagem.State in [dsInsert,dsEdit] ) then
      cdsLinhagem.Edit ;

   cdsLinhagemNOMEPAI.asString  := Nome ;

   cdsLinhagemGRAUSANGUEPAI.asString     := GrauSangue ;
   cdsLinhagemCOMPOSICAORACAPAI.asString := ComposicaoRaca ;

   cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;

   cdsLinhagemKZOO_ANIMAL_MACHO.asString := Key  ;

   CalculateGrauSangue ;
end;

procedure TZoo_EditLinhagemDatamodule.SetParams(PK: string );
begin
     FPrimaryKey := PK ;
end;

procedure TZoo_EditLinhagemDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsAnimalCalcFields(DataSet: TDataSet);
begin
   if DataSet.State in [dsInternalCalc] then
      cdsAnimalBRINCONOME.asString := cdsAnimalBRINCO.asString + '-' + IfThen ( Trim ( cdsAnimalNOMEESTABULO.asString ) = '', cdsAnimalNOMECOMPLETO.asString, cdsAnimalNOMEESTABULO.asString ) ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsAnimalGRAUSANGUESetText(Sender: TField;
  const Text: string);
var
  gs : string ;
  posSpace : integer ;
begin
  gs := Trim ( Text ) ;
  posSpace := Pos ( ' ', gs ) ;
  if posSpace > 0 then
    gs := Copy ( gs, 1, posSpace -1 ) ;
  Sender.AsString := gs ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsLinhagemCalcFields(DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_EditLinhagemDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.asString := cdsAnimalKZOO_ANIMAL.AsString ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsLinhagemNOMEMAESetText(Sender: TField;
  const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_EditLinhagemDatamodule.cdsLinhagemNOMEPAISetText(Sender: TField;
  const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

constructor TZoo_EditLinhagemDatamodule.Create(AOwner: TComponent);
var
  LstRacas : TStringList ;
begin
  inherited;
  FGrauDeSangue := TZoo_GrauDeSangue.Create ;


  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_COMPOSICAORACA,  cdsTipoComposicaoRaca  ) ;


  with cdsTipoComposicaoRaca do
    begin
      LstRacas := TStringList.Create ;
      while not eof do
         begin
            LstRacas.Add ( cdsTipoComposicaoRacaVALOR.asString ) ;
            Next ;
         end;

      self.FGrauDeSangue.ListaRacas := LstRacas.CommaText ;
      LstRacas.Free ;

    end;

end;

destructor TZoo_EditLinhagemDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_EditLinhagemDatamodule.CalculateGrauSangue;
begin
  self.FGrauDeSangue.GrauSanguePai  := cdsLinhagemGRAUSANGUEPAI.asString ;
  self.FGrauDeSangue.RacaPai        := cdsLinhagemCOMPOSICAORACAPAI.asString ;

  self.FGrauDeSangue.GrauSangueMae  := cdsLinhagemGRAUSANGUEMAE.asString ;
  self.FGrauDeSangue.RacaMae        := cdsLinhagemCOMPOSICAORACAMAE.asString ;

  self.FGrauDeSangue.Calculate ;

  try
    cdsAnimalGRAUSANGUE.OnValidate     := nil ;
    cdsAnimalCOMPOSICAORACA.OnValidate := nil ;
    cdsAnimalGRAUSANGUE.asString     := self.FGrauDeSangue.GrauSangue ;
    cdsAnimalCOMPOSICAORACA.asString := self.FGrauDeSangue.Raca ;
  finally
    cdsAnimalGRAUSANGUE.OnValidate     := cdsAnimalGRAUSANGUEValidate ;
    cdsAnimalCOMPOSICAORACA.OnValidate := cdsAnimalCOMPOSICAORACAValidate ;
  end;

end;

procedure TZoo_EditLinhagemDatamodule.cdsAnimalBeforeOpen(DataSet: TDataSet);
begin
  cdsAnimal.Params.ParamByName( 'KZOO_ANIMAL' ).asString := FPrimaryKey ;
end;

end.
