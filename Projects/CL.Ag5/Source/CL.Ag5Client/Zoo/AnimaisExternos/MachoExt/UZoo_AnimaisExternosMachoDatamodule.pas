unit UZoo_AnimaisExternosMachoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
 
  UZoo_GrauDeSangueClass ;

type
  TZoo_AnimaisExternosMachoDatamodule = class(T_dtmBASEDBListEdit)
    cdsLstMachos: TClientDataSet;
    cdsAnimal: TClientDataSet;
    dspLstMachos: TDataSetProvider;
    dspAnimal: TDataSetProvider;
    sqlLstMachos: TTcSQLDataSet;
    sqlAnimal: TTcSQLDataSet;
    dtsList: TDataSource;
    sqlDadosMacho: TTcSQLDataSet;
    dtsSQLAnimal: TDataSource;
    cdsDadosMacho: TClientDataSet;
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
    cdsAnimalsqlDadosMacho: TDataSetField;
    sqlLstMachosKZOO_ANIMAL: TStringField;
    sqlLstMachosBRINCO: TStringField;
    sqlLstMachosNOMEESTABULO: TStringField;
    sqlLstMachosNOMECOMPLETO: TStringField;
    sqlLstMachosREGISTRO: TStringField;
    cdsLstMachosKZOO_ANIMAL: TStringField;
    cdsLstMachosBRINCO: TStringField;
    cdsLstMachosNOMEESTABULO: TStringField;
    cdsLstMachosNOMECOMPLETO: TStringField;
    cdsLstMachosREGISTRO: TStringField;
    cdsDadosMachoKZOO_ANIMAL_EXTERNO: TStringField;
    sqlDadosMachoKZOO_ANIMAL_EXTERNO: TStringField;
    cdsAnimalDESCR_STATUS: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsAnimalDESCR_RACA: TStringField;
    sqlLstMachosSYSUI: TStringField;
    sqlLstMachosSYSDI: TSQLTimeStampField;
    sqlLstMachosSYSUU: TStringField;
    sqlLstMachosSYSDU: TSQLTimeStampField;
    cdsLstMachosSYSUI: TStringField;
    cdsLstMachosSYSDI: TSQLTimeStampField;
    cdsLstMachosSYSUU: TStringField;
    cdsLstMachosSYSDU: TSQLTimeStampField;
    sqlLstMachosSTATUS: TIntegerField;
    cdsLstMachosSTATUS: TIntegerField;
    cdsLstMachosDESCR_STATUS: TStringField;
    sqlDadosMachoNASCIMENTO: TSQLTimeStampField;
    cdsDadosMachoNASCIMENTO: TSQLTimeStampField;
    dtsSQLDadosMacho: TDataSource;
    sqlLinhagem: TTcSQLDataSet;
    sqlLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    sqlLinhagemKZOO_ANIMAL: TStringField;
    sqlLinhagemKZOO_ANIMAL_MACHO: TStringField;
    sqlLinhagemNOMEPAI: TStringField;
    sqlLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    sqlLinhagemNOMEMAE: TStringField;
    cdsLinhagem: TClientDataSet;
    cdsLinhagemKZOO_ANIMAL_LINHAGEM: TStringField;
    cdsLinhagemKZOO_ANIMAL: TStringField;
    cdsLinhagemKZOO_ANIMAL_MACHO: TStringField;
    cdsLinhagemNOMEPAI: TStringField;
    cdsLinhagemKZOO_ANIMAL_FEMEA: TStringField;
    cdsLinhagemNOMEMAE: TStringField;
    cdsAnimalsqlLinhagem: TDataSetField;
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
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    sqlAnimalORIGINADO_DE_EMBRIAO: TStringField;
    cdsAnimalORIGINADO_DE_EMBRIAO: TStringField;
    sqlDadosMachoSEXO: TStringField;
    cdsDadosMachoSEXO: TStringField;
    sqlLstMachosBRINCO_: TStringField;
    cdsLstMachosBRINCO_: TStringField;
    procedure cdsLstMachosNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNewRecord(DataSet: TDataSet);
    procedure cdsLstMachosBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalBRINCOValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsComprasNewRecord(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsCrescimentoPESOValidate(Sender: TField);
    procedure cdsDadosMachoBeforeInsert(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalNOMECOMPLETOSetText(Sender: TField; const Text: string);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsDadosMachoBeforeEdit(DataSet: TDataSet);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsLstMachosBRINCO_GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnimalDTORIGEMValidate(Sender: TField);
    procedure cdsDadosMachoNASCIMENTOValidate(Sender: TField);
  private
    { Private declarations }
   FGrauDeSangue : TZoo_GrauDeSangue ;
    FKZOOANIMAL: string;
    procedure SetParams ;
    procedure CalculateGrauSangue ;
    function PesoAnterior( Data : TDateTime) : Double ;
    procedure SetKZOOANIMAL(const Value: string);
 public
    { Public declarations }
    procedure SetPai   ( Key : String ; Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure SetMae   ( Key : String ; Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_AnimaisExternosMachoDatamodule.OpenTables;
var
  LstRacas : TStringList ;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_MACHO,  cdsStatusAnimal );
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RACA_ANIMAIS,  cdsTipoRacasAnimais ) ;
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

function TZoo_AnimaisExternosMachoDatamodule.PesoAnterior( Data : TDateTime) : Double ;
const
  _SELECT_ULTIMO_PESO =
      ' SELECT PESO ' +
      ' FROM ZOO_ANIMAL_CRESCIMENTO ' +
      ' WHERE KZOO_ANIMAL = :KZOO_ANIMAL ' +
      ' AND DATA < :DATA ' +
      ' ORDER BY DATA DESC ' +
      ' ROWS 1 ';

var
  cds : TClientDataSet ;
  p : TParams ;

begin
  try
    cds := nil ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := cdsDadosMachoKZOO_ANIMAL_EXTERNO.AsString ;
    p.CreateParam( ftDateTime, 'DATA', ptInput ).AsDateTime := Data ;

    TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, _SELECT_ULTIMO_PESO, p ) ;

    Result := cds.FieldByName('PESO' ).AsFloat ;
  finally
    p.Free;
    cds.Free;
  end;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.ReOpenTables;
var
   KZOO_ANIMAL : String ;
begin
  KZOO_ANIMAL := cdsLstMachosKZOO_ANIMAL.asString ;
  inherited;
  cdsLstMachos.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] ) ;
  cdsAnimal.Refresh;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLstMachosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLstMachosBRINCO_GetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLinhagemBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsDadosMacho.IsEmpty ) and not ( cdsDadosMacho.State in [dsInsert,dsEdit] )  then
     cdsDadosMacho.Append
  else if not ( cdsDadosMacho.State in [dsInsert,dsEdit] ) then
     cdsDadosMacho.Edit  ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLinhagemCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLinhagemNOMEMAESetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsLinhagemNOMEPAISetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

constructor TZoo_AnimaisExternosMachoDatamodule.Create(AOwner: TComponent);
begin
   inherited Create( AOwner ) ;
   FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;

destructor TZoo_AnimaisExternosMachoDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalBRINCOValidate(Sender: TField);
begin
  inherited;
  if TAnimalMacho.CheckCodigoExists ( LoggedUser.DomainID, Sender.asString, cdsAnimalKZOO_ANIMAL.asString ) then
     raise Warning.Create('Código em uso por outro animal');
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalDTORIGEMValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Data de origem não pode ser maior que a data atual');
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalGRAUSANGUESetText(
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

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;

  cdsAnimalKCAD_FAZENDA.asString := LoggedUser.DomainID ;
//  cdsAnimalDTNASC.AsDateTime := Date ;
  cdsAnimalDTORIGEM.AsDateTime := Date ;
  cdsAnimalSTATUS.asInteger := _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  cdsAnimalORIGINADO_DE_EMBRIAO.asString := 'F' ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.AsString := '.';
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

  cdsAnimal.DisableConstraints ;
  cdsDadosMacho.Append ;
  cdsDadosMachoKZOO_ANIMAL_EXTERNO.asString := cdsAnimalKZOO_ANIMAL.asString ;
  cdsDadosMachoSEXO.asString              := 'M' ;
  cdsAnimal.EnableConstraints ;

//  cdsAnimalDTNASC.Clear ;
  cdsAnimalDTORIGEM.Clear ;
  cdsAnimalSTATUS.Clear ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.Clear ;
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalNOMECOMPLETOSetText(
  Sender: TField; const Text: string);
begin
   cdsAnimalNOMECOMPLETO.asString := Text ;
   cdsAnimalNOMEESTABULO.asString := Text ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsComprasNewRecord(DataSet: TDataSet);
begin
//   GetKey ( cdsComprasKZOO_ANIMAL_SEMEN_COMPRA ) ;
//   cdsComprasKZOO_ANIMAL_EXTERNO.Value := cdsAnimalKZOO_ANIMAL.Value ;

end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsCrescimentoPESOValidate(Sender: TField);
begin
  if Sender.AsFloat < 1 then
    raise Warning.Create('Necessário digitar o peso');
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsDadosMachoBeforeEdit(
  DataSet: TDataSet);
begin
  if not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Edit ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsDadosMachoBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsAnimal.IsEmpty ) and not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Append ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.cdsDadosMachoNASCIMENTOValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Nascimento não pode ser maior que a data atual');
end;

procedure TZoo_AnimaisExternosMachoDatamodule.CalculateGrauSangue;
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

procedure TZoo_AnimaisExternosMachoDatamodule.cdsAnimalBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstMachos.IsEmpty ) and not ( cdsLstMachos.State in [dsInsert,dsEdit] )  then
     cdsLstMachos.Append ;
end;


procedure TZoo_AnimaisExternosMachoDatamodule.cdsLstMachosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.SetPai(Key, Nome: string; GrauSangue : string ; ComposicaoRaca : string ) ;
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

procedure TZoo_AnimaisExternosMachoDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] )then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.SetKZOOANIMAL(const Value: string);
begin
  FKZOOANIMAL := Value;
end;

procedure TZoo_AnimaisExternosMachoDatamodule.SetMae(Key, Nome: string; GrauSangue : string ; ComposicaoRaca : string ) ;
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


procedure TZoo_AnimaisExternosMachoDatamodule.SetParams;
begin
  with cdsLstMachos.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
       if FKZOOANIMAL = '' then
          ParamByName ( 'LISTALL' ).asString := 'T'
       else
          ParamByName ( 'LISTALL' ).asString := 'F' ;

       ParamByName ( 'KZOO_ANIMAL' ).asString := FKZOOANIMAL ;
    end ;
end;


procedure TZoo_AnimaisExternosMachoDatamodule.UpdateRacasGrauSangue;begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

end.