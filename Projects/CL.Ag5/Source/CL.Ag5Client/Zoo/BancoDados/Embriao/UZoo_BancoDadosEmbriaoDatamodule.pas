unit UZoo_BancoDadosEmbriaoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Dialogs,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
 
  UZoo_GrauDeSangueClass ;

type
  TZoo_BancoDadosEmbriaoDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstEmbrioes: TClientDataSet;
    cdsAnimal: TClientDataSet;
    dspLstEmbrioes: TDataSetProvider;
    dspAnimal: TDataSetProvider;
    sqlLstEmbrioes: TTcSQLDataSet;
    sqlAnimal: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlDadosEmbriao: TTcSQLDataSet;
    dtsSQLAnimal: TDataSource;
    cdsDadosEmbriao: TClientDataSet;
    sqlAnimalKZOO_ANIMAL: TStringField;
    sqlAnimalKCAD_FAZENDA: TStringField;
    sqlAnimalBRINCO: TStringField;
    sqlAnimalNOMEESTABULO: TStringField;
    sqlAnimalNOMECOMPLETO: TStringField;
    sqlAnimalREGISTRO: TStringField;
    sqlAnimalDTORIGEM: TSQLTimeStampField;
    sqlAnimalLOCAL_ORIGEM: TStringField;
    sqlAnimalPRECO_COMPRA: TFMTBCDField;
    sqlAnimalRACA: TIntegerField;
    sqlAnimalSTATUS: TIntegerField;
    sqlAnimalCRIADOR: TStringField;
    sqlAnimalCIDCRIA: TStringField;
    sqlAnimalPERSISTE: TIntegerField;
    sqlAnimalPOTENCIAL: TIntegerField;
    cdsAnimalKZOO_ANIMAL: TStringField;
    cdsAnimalKCAD_FAZENDA: TStringField;
    cdsAnimalBRINCO: TStringField;
    cdsAnimalNOMEESTABULO: TStringField;
    cdsAnimalNOMECOMPLETO: TStringField;
    cdsAnimalREGISTRO: TStringField;
    cdsAnimalDTORIGEM: TSQLTimeStampField;
    cdsAnimalLOCAL_ORIGEM: TStringField;
    cdsAnimalPRECO_COMPRA: TFMTBCDField;
    cdsAnimalRACA: TIntegerField;
    cdsAnimalSTATUS: TIntegerField;
    cdsAnimalCRIADOR: TStringField;
    cdsAnimalCIDCRIA: TStringField;
    cdsAnimalPERSISTE: TIntegerField;
    cdsAnimalPOTENCIAL: TIntegerField;
    cdsAnimalsqlDadosEmbriao: TDataSetField;
    sqlLstEmbrioesKZOO_ANIMAL: TStringField;
    sqlLstEmbrioesBRINCO: TStringField;
    sqlLstEmbrioesNOMECOMPLETO: TStringField;
    sqlLstEmbrioesREGISTRO: TStringField;
    cdsLstEmbrioesKZOO_ANIMAL: TStringField;
    cdsLstEmbrioesBRINCO: TStringField;
    cdsLstEmbrioesNOMECOMPLETO: TStringField;
    cdsLstEmbrioesREGISTRO: TStringField;
    cdsDadosEmbriaoKZOO_ANIMAL_EMBRIAO: TStringField;
    sqlDadosEmbriaoKZOO_ANIMAL_EMBRIAO: TStringField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsAnimalDESCR_RACA: TStringField;
    sqlLstEmbrioesSYSUI: TStringField;
    sqlLstEmbrioesSYSDI: TSQLTimeStampField;
    sqlLstEmbrioesSYSUU: TStringField;
    sqlLstEmbrioesSYSDU: TSQLTimeStampField;
    cdsLstEmbrioesSYSUI: TStringField;
    cdsLstEmbrioesSYSDI: TSQLTimeStampField;
    cdsLstEmbrioesSYSUU: TStringField;
    cdsLstEmbrioesSYSDU: TSQLTimeStampField;
    sqlDadosEmbriaoQTDE_EMBRIAO: TIntegerField;
    cdsDadosEmbriaoQTDE_EMBRIAO: TIntegerField;
    sqlLstEmbrioesQTDE_EMBRIAO: TIntegerField;
    cdsLstEmbrioesQTDE_EMBRIAO: TIntegerField;
    dtsSQLDadosEmbriao: TDataSource;
    cdsAnimalsqlLinhagem: TDataSetField;
    sqlDadosEmbriaoQTDEINICIAL_EMBRIAO: TIntegerField;
    sqlDadosEmbriaoQTDEUTILIZADA_EMBRIAO: TIntegerField;
    cdsDadosEmbriaoQTDEINICIAL_EMBRIAO: TIntegerField;
    cdsDadosEmbriaoQTDEUTILIZADA_EMBRIAO: TIntegerField;
    sqlAnimalGRAUSANGUE: TStringField;
    sqlAnimalCOMPOSICAORACA: TStringField;
    cdsAnimalGRAUSANGUE: TStringField;
    cdsAnimalCOMPOSICAORACA: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
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
    sqlLstEmbrioesPADBRINCO: TStringField;
    cdsLstEmbrioesPADBRINCO: TStringField;
    cdsDadosEmbriaoTmpCalc: TSmallintField;
    sqlLstEmbrioesCODIGO_EMBRIAO: TStringField;
    cdsLstEmbrioesCODIGO_EMBRIAO: TStringField;
    sqlDadosEmbriaoCODIGO_EMBRIAO: TStringField;
    cdsDadosEmbriaoCODIGO_EMBRIAO: TStringField;
    procedure cdsLstEmbrioesNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNewRecord(DataSet: TDataSet);
    procedure cdsLstEmbrioesBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalBRINCOValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNOMECOMPLETOSetText(Sender: TField; const Text: string);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsDadosEmbriaoBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsLstEmbrioesPADBRINCOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnimalBeforeDelete(DataSet: TDataSet);
    procedure cdsAnimalDTORIGEMValidate(Sender: TField);
    procedure cdsDadosEmbriaoCalcFields(DataSet: TDataSet);
    procedure cdsAnimalBeforePost(DataSet: TDataSet);
    procedure cdsDadosEmbriaoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FGrauDeSangue : TZoo_GrauDeSangue ;
    FKZOOANIMAL: string;
    procedure SetParams ;
    procedure CalculateGrauSangue ;
    procedure SetKZOOANIMAL(const Value: string);
  public
    { Public declarations }
    procedure SetPai   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure SetMae   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure ReOpenTables ; override ;
    procedure OpenTables ; override ;
    property GrauDeSangue : TZoo_GrauDeSangue read FGrauDeSangue ;
    procedure UpdateRacasGrauSangue ;
    procedure SetComposicaoRacas ;
    property  KZOOANIMAL : string  read FKZOOANIMAL write SetKZOOANIMAL;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CLAg5Types,
     CDSSuppl, SQLSuppl, ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_BancoDadosEmbriaoDatamodule.OpenTables;
var
  LstRacas : TStringList ;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_RACA_ANIMAIS,  cdsTipoRacasAnimais ) ;

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

  inherited;
  //
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.ReOpenTables;
var
   KZOO_ANIMAL : String ;
begin
  KZOO_ANIMAL := cdsLstEmbrioesKZOO_ANIMAL.asString ;
  inherited;
  cdsAnimal.CancelUpdates ;
  cdsAnimal.refresh ;
  cdsLstEmbrioes.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] ) ;
  cdsAnimal.Refresh;
end;


procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLstEmbrioesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLstEmbrioesPADBRINCOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

constructor TZoo_BancoDadosEmbriaoDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;

destructor TZoo_BancoDadosEmbriaoDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLinhagemBeforeInsert(
  DataSet: TDataSet);
begin
//  if ( cdsDadosEmbriao.IsEmpty ) and not ( cdsDadosEmbriao.State in [dsInsert,dsEdit] )  then
//     cdsDadosEmbriao.Append ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLinhagemCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLinhagemNOMEMAESetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLinhagemNOMEPAISetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalBRINCOValidate(Sender: TField);
begin
  inherited;
  if TAnimalMacho.CheckCodigoExists ( LoggedUser.DomainID,Sender.asString, cdsAnimalKZOO_ANIMAL.asString ) then
     raise Warning.Create('Código em uso por outro animal');
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalDTORIGEMValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Data de origem não pode ser maior que a data atual');
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalGRAUSANGUESetText(
  Sender: TField; const Text: string);
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

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;

  cdsAnimalKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsAnimalDTORIGEM.AsDateTime := Date ;
  cdsAnimalSTATUS.asInteger := _ST_STATUS_ANIMAL_EMBRIAO ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.AsString := '.';
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;


  cdsAnimalDTORIGEM.Clear ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

  cdsDadosEmbriao.Edit;


end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalNOMECOMPLETOSetText(
  Sender: TField; const Text: string);
begin
   Sender.asString := Text ;
   cdsAnimalNOMEESTABULO.asString := Text ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriaoBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsAnimal.IsEmpty ) and not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Append ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriaoCalcFields(
  DataSet: TDataSet);
begin
    if DataSet.State in [dsInsert,dsEdit] then
      begin
        cdsDadosEmbriao.OnCalcFields := nil ;
        cdsDadosEmbriaoQTDE_EMBRIAO.asInteger := cdsDadosEmbriaoQTDEINICIAL_EMBRIAO.asInteger - cdsDadosEmbriaoQTDEUTILIZADA_EMBRIAO.asInteger ;
        cdsDadosEmbriao.OnCalcFields := cdsDadosEmbriaoCalcFields ;
      end;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsDadosEmbriaoNewRecord(
  DataSet: TDataSet);
begin
  cdsDadosEmbriaoKZOO_ANIMAL_EMBRIAO.asString := cdsAnimalKZOO_ANIMAL.asString ;
  cdsDadosEmbriaoQTDEINICIAL_EMBRIAO.asInteger   := 1 ;
  cdsDadosEmbriaoQTDEUTILIZADA_EMBRIAO.asInteger := 0 ;
  cdsDadosEmbriaoQTDE_EMBRIAO.asInteger          := 1 ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.CalculateGrauSangue;
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

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalBeforeDelete(
  DataSet: TDataSet);
begin
     if TSQLSuppl.CheckExistsIn( ' ZOO_EVENTOS_ZOOTECNICOS', 'KZOO_ANIMAL_MACHO_EMBRIAO', cdsAnimalKZOO_ANIMAL.asString, '', TSQLConnection ( DBResources[ 'ZOOTECNICO' ].Connection )  ) then
        Raise Warning.Create( 'Existem eventos zooténcos associados para este embrião.' )
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstEmbrioes.IsEmpty ) and not ( cdsLstEmbrioes.State in [dsInsert,dsEdit] )  then
     cdsLstEmbrioes.Append ;
end;


procedure TZoo_BancoDadosEmbriaoDatamodule.cdsAnimalBeforePost(
  DataSet: TDataSet);
const
  _SELECT_GENERATOR_BRINCO_EMBRIAO =
           'SELECT GEN_ID(BRINCO_EMBRIAO, 1) RESULT FROM RDB$DATABASE';
var
  cds: TClientDataSet;
begin

  if cdsDadosEmbriao.IsEmpty then
    exit;

  if not ( cdsDadosEmbriao.State in [dsInsert, dsEdit] ) then
     cdsDadosEmbriao.Edit;

  if (cdsAnimalBRINCO.AsString = '.') or
     (cdsAnimalBRINCO.AsString = EmptyStr) then
    begin
     cds:= nil ;
     DBResources['ZOOTECNICO'].populateClientDataSet( cds, _SELECT_GENERATOR_BRINCO_EMBRIAO );
     cdsAnimalBRINCO.AsString := Format('E_%d',[ cds.fieldByName  ( 'RESULT' ).asInteger ] ) ;
     cds.Free;
    end;

  cdsDadosEmbriao.Post;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.cdsLstEmbrioesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.SetPai(Key, Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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


procedure TZoo_BancoDadosEmbriaoDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] ) then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.SetKZOOANIMAL(const Value: string);
begin
  FKZOOANIMAL := Value;
end;

procedure TZoo_BancoDadosEmbriaoDatamodule.SetMae(Key, Nome: string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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


procedure TZoo_BancoDadosEmbriaoDatamodule.SetParams;
begin
  with cdsLstEmbrioes.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
       if FKZOOANIMAL = '' then
          ParamByName ( 'LISTALL' ).asString := 'T'
       else
          ParamByName ( 'LISTALL' ).asString := 'F' ;

       ParamByName ( 'KZOO_ANIMAL' ).asString := FKZOOANIMAL ;
    end ;
end;


procedure TZoo_BancoDadosEmbriaoDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

end.
