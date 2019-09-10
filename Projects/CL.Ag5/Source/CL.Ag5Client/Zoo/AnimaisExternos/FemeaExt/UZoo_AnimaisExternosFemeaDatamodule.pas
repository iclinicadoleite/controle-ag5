unit UZoo_AnimaisExternosFemeaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UZoo_GrauDeSangueClass ;

type
  TZoo_AnimaisExternosFemeaDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstFemeas: TClientDataSet;
    cdsAnimal: TClientDataSet;
    dspLstFemeas: TDataSetProvider;
    dspAnimal: TDataSetProvider;
    sqlLstFemeas: TTcSQLDataSet;
    sqlAnimal: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlDadosFemea: TTcSQLDataSet;
    dtsSQLAnimal: TDataSource;
    cdsDadosFemea: TClientDataSet;
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
    sqlAnimalVACA: TStringField;
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
    cdsAnimalVACA: TStringField;
    cdsAnimalSTATUS: TIntegerField;
    cdsAnimalCRIADOR: TStringField;
    cdsAnimalCIDCRIA: TStringField;
    cdsAnimalPERSISTE: TIntegerField;
    cdsAnimalPOTENCIAL: TIntegerField;
    cdsAnimalsqlDadosFemea: TDataSetField;
    cdsDadosFemeaKZOO_ANIMAL_EXTERNO: TStringField;
    sqlLstFemeasKZOO_ANIMAL: TStringField;
    sqlLstFemeasBRINCO: TStringField;
    sqlLstFemeasNOMEESTABULO: TStringField;
    sqlLstFemeasNOMECOMPLETO: TStringField;
    sqlLstFemeasREGISTRO: TStringField;
    cdsLstFemeasKZOO_ANIMAL: TStringField;
    cdsLstFemeasBRINCO: TStringField;
    cdsLstFemeasNOMEESTABULO: TStringField;
    cdsLstFemeasNOMECOMPLETO: TStringField;
    cdsLstFemeasREGISTRO: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsAnimalDESCR_STATUS: TStringField;
    dtsSQLDadosFemea: TDataSource;
    cdsTipoPartoAborto: TClientDataSet;
    cdsTipoPartoAbortoTIPO: TStringField;
    cdsTipoPartoAbortoVALOR: TStringField;
    cdsTipoPartoAbortoDESCRICAO: TStringField;
    cdsTipoPartoAbortoORDEM: TIntegerField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsAnimalDESCR_RACA: TStringField;
    sqlLstFemeasSYSUI: TStringField;
    sqlLstFemeasSYSDI: TSQLTimeStampField;
    sqlLstFemeasSYSUU: TStringField;
    sqlLstFemeasSYSDU: TSQLTimeStampField;
    cdsLstFemeasSYSUI: TStringField;
    cdsLstFemeasSYSDI: TSQLTimeStampField;
    cdsLstFemeasSYSUU: TStringField;
    cdsLstFemeasSYSDU: TSQLTimeStampField;
    sqlLinhagem: TTcSQLDataSet;
    cdsLinhagem: TClientDataSet;
    sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsTipoDoadorReceptor: TClientDataSet;
    cdsTipoDoadorReceptorTIPO: TStringField;
    cdsTipoDoadorReceptorVALOR: TStringField;
    cdsTipoDoadorReceptorDESCRICAO: TStringField;
    cdsTipoDoadorReceptorORDEM: TIntegerField;
    cdsTipoRazaoDescarte: TClientDataSet;
    cdsTipoRazaoDescarteTIPO: TStringField;
    cdsTipoRazaoDescarteVALOR: TStringField;
    cdsTipoRazaoDescarteDESCRICAO: TStringField;
    cdsTipoRazaoDescarteORDEM: TIntegerField;
    cdsTipoMotivoDescarte: TClientDataSet;
    cdsTipoMotivoDescarteTIPO: TStringField;
    cdsTipoMotivoDescarteVALOR: TStringField;
    cdsTipoMotivoDescarteDESCRICAO: TStringField;
    cdsTipoMotivoDescarteORDEM: TIntegerField;
    sqlLstFemeasNASCIMENTO: TSQLTimeStampField;
    sqlLstFemeasRACA: TIntegerField;
    sqlLstFemeasGRAUSANGUE: TStringField;
    sqlLstFemeasSTATUS: TIntegerField;
    sqlLstFemeasSISBOV: TStringField;
    sqlLstFemeasDATA: TSQLTimeStampField;
    sqlLstFemeasMOTIVO: TIntegerField;
    sqlLstFemeasRAZAO: TIntegerField;
    cdsLstFemeasNASCIMENTO: TSQLTimeStampField;
    cdsLstFemeasRACA: TIntegerField;
    cdsLstFemeasGRAUSANGUE: TStringField;
    cdsLstFemeasSTATUS: TIntegerField;
    cdsLstFemeasSISBOV: TStringField;
    cdsLstFemeasDATA: TSQLTimeStampField;
    cdsLstFemeasMOTIVO: TIntegerField;
    cdsLstFemeasRAZAO: TIntegerField;
    cdsLstFemeasDESCR_RAZAO: TStringField;
    cdsLstFemeasDESCR_MOTIVO: TStringField;
    cdsLstFemeasDESCR_STATUS: TStringField;
    cdsLstFemeasDESCR_RACA: TStringField;
    cdsAnimalIDADE: TIntegerField;
    sqlAnimalSISBOV: TStringField;
    cdsAnimalSISBOV: TStringField;
    sqlLinhagemKZOO_ANIMAL_MACHO: TStringField;
    sqlLinhagemNOMEPAI: TStringField;
    cdsLinhagemKZOO_ANIMAL_MACHO: TStringField;
    cdsLinhagemNOMEPAI: TStringField;
    cdsAnimalsqlLinhagem: TDataSetField;
    sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    sqlLinhagemNOMEMAE: TStringField;
    cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    cdsLinhagemNOMEMAE: TStringField;
    sqlLinhagemKZOO_ANIMAL: TStringField;
    cdsLinhagemKZOO_ANIMAL: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    sqlLinhagemGRAUSANGUEPAI: TStringField;
    sqlLinhagemCOMPOSICAORACAPAI: TStringField;
    sqlLinhagemGRAUSANGUEMAE: TStringField;
    sqlLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemGRAUSANGUEPAI: TStringField;
    cdsLinhagemCOMPOSICAORACAPAI: TStringField;
    cdsLinhagemGRAUSANGUEMAE: TStringField;
    cdsLinhagemCOMPOSICAORACAMAE: TStringField;
    cdsLinhagemGSR_PAI: TStringField;
    cdsLinhagemGSR_MAE: TStringField;
    sqlAnimalGRAUSANGUE: TStringField;
    sqlAnimalCOMPOSICAORACA: TStringField;
    cdsAnimalGRAUSANGUE: TStringField;
    cdsAnimalCOMPOSICAORACA: TStringField;
    sqlDadosFemeaKZOO_ANIMAL_EXTERNO: TStringField;
    sqlAnimalORIGINADO_DE_EMBRIAO: TStringField;
    cdsAnimalORIGINADO_DE_EMBRIAO: TStringField;
    sqlDadosFemeaNASCIMENTO: TSQLTimeStampField;
    sqlDadosFemeaSEXO: TStringField;
    cdsDadosFemeaNASCIMENTO: TSQLTimeStampField;
    cdsDadosFemeaSEXO: TStringField;
    sqlLstFemeasBRINCO_: TStringField;
    cdsLstFemeasBRINCO_: TStringField;
    procedure cdsLstFemeasNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNewRecord(DataSet: TDataSet);
    procedure cdsLstFemeasBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalBRINCOValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsDadosFemeaBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsLstFemeasBRINCO_GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDadosFemeaNASCIMENTOValidate(Sender: TField);
    procedure cdsAnimalDTORIGEMValidate(Sender: TField);
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

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CLAg5Types, DateUtils,
     ClAg5ClientZootecnicoCommonTypes ;

//var RAZAO_VENDA : Integer ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_AnimaisExternosFemeaDatamodule.OpenTables;
var
  LstRacas : TStringList ;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_FEMEA,         cdsStatusAnimal        ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_PARTOABORTO,     cdsTipoPartoAborto     ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RACA_ANIMAIS,         cdsTipoRacasAnimais    ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_DOADOR_RECEPTOR, cdsTipoDoadorReceptor  ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RAZAO_DESCARTE,       cdsTipoRazaoDescarte   ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_MOTIVO_DESCARTE,      cdsTipoMotivoDescarte  ) ;
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

end;

procedure TZoo_AnimaisExternosFemeaDatamodule.ReOpenTables;
var
   KZOO_ANIMAL : String ;
begin
  KZOO_ANIMAL := cdsLstFemeasKZOO_ANIMAL.asString ;
  inherited;
  cdsAnimal.CancelUpdates ;
  cdsAnimal.refresh ;
  cdsLstFemeas.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] ) ;
  cdsAnimal.Refresh;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLstFemeasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLstFemeasBRINCO_GetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalBRINCOValidate(Sender: TField);
begin
  inherited;
  if TAnimalFemea.CheckBrincoExists (  LoggedUser.DomainID,  Sender.asString, cdsAnimalKZOO_ANIMAL.asString ) then
     raise Warning.Create('Brinco em uso por outro animal');
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalDTORIGEMValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Data de origem não pode ser maior que a data atual');
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalGRAUSANGUESetText(
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

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;

  cdsAnimalKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsAnimalORIGINADO_DE_EMBRIAO.asString := 'F' ;


  // campos requided
//  cdsAnimalNASCIMENTO.AsDateTime := Date ;
//  cdsAnimalDTORIGEM.AsDateTime := Date ;
  cdsAnimalSTATUS.asInteger := _ST_STATUS_FEMEA_BEZERRO ;
  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.AsString := '.';
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

  cdsAnimal.DisableConstraints ;
  cdsDadosFemea.Append ;
  cdsDadosFemeaKZOO_ANIMAL_EXTERNO.asString := cdsAnimalKZOO_ANIMAL.asString ;
  cdsDadosFemeaSEXO.asString := 'F' ;
  cdsAnimal.EnableConstraints ;

//  cdsAnimalDTORIGEM.Clear ;
  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.Clear ;
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsDadosFemeaBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsAnimal.IsEmpty ) and not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Append ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsDadosFemeaNASCIMENTOValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Nascimento não pode ser maior que a data atual');
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.CalculateGrauSangue;
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

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsAnimalBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstFemeas.IsEmpty ) and not ( cdsLstFemeas.State in [dsInsert,dsEdit] )  then
     cdsLstFemeas.Append ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLstFemeasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.SetParams;
begin
  with cdsLstFemeas.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
       if FKZOOANIMAL = '' then
          ParamByName ( 'LISTALL' ).asString := 'T'
       else
          ParamByName ( 'LISTALL' ).asString := 'F' ;

       ParamByName ( 'KZOO_ANIMAL' ).asString := FKZOOANIMAL ;
    end ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLinhagemBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsDadosFemea.IsEmpty ) and not ( cdsDadosFemea.State in [dsInsert,dsEdit] )  then
     cdsDadosFemea.Append ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLinhagemCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;


procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLinhagemNOMEMAESetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.cdsLinhagemNOMEPAISetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

constructor TZoo_AnimaisExternosFemeaDatamodule.Create(AOwner: TComponent);
begin
   inherited Create( AOwner ) ;
   KZOOANIMAL := '' ;
   FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;

destructor TZoo_AnimaisExternosFemeaDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.SetPai(Key, Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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

procedure TZoo_AnimaisExternosFemeaDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] ) then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.SetKZOOANIMAL(const Value: string);
begin
  FKZOOANIMAL := Value;
end;

procedure TZoo_AnimaisExternosFemeaDatamodule.SetMae(Key, Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
begin
   if not ( cdsLinhagem.State in [dsInsert,dsEdit] ) then
      cdsLinhagem.Edit ;

   cdsLinhagemNOMEMAE.asString := Nome ;

   cdsLinhagemGRAUSANGUEMAE.asString     := GrauSangue ;
   cdsLinhagemCOMPOSICAORACAMAE.asString := ComposicaoRaca ;

   cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;


   cdsLinhagemKZOO_ANIMAL_FEMEA.asString := Key ;


   CalculateGrauSangue ;
end;

end.


