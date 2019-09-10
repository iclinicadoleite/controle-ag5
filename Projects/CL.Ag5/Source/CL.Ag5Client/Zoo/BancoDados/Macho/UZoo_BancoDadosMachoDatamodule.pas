unit UZoo_BancoDadosMachoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
 
  UZoo_GrauDeSangueClass ;

type
  TZoo_BancoDadosMachoDatamodule = class(T_dtmBASEDBListEdit)
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
    cdsDadosMachoKZOO_ANIMAL_MACHO: TStringField;
    sqlDadosMachoKZOO_ANIMAL_MACHO: TStringField;
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
    sqlDadosMachoQTDE_SEMEN: TIntegerField;
    cdsDadosMachoNASCIMENTO: TSQLTimeStampField;
    cdsDadosMachoQTDE_SEMEN: TIntegerField;
    sqlLstMachosQTDE_SEMEN: TIntegerField;
    cdsLstMachosQTDE_SEMEN: TIntegerField;
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
    sqlDadosMachoQTDEINICIAL_SEMEN: TIntegerField;
    sqlDadosMachoQTDECOMPRADA_SEMEN: TIntegerField;
    sqlDadosMachoQTDEUTILIZADA_SEMEN: TIntegerField;
    cdsDadosMachoQTDEINICIAL_SEMEN: TIntegerField;
    cdsDadosMachoQTDECOMPRADA_SEMEN: TIntegerField;
    cdsDadosMachoQTDEUTILIZADA_SEMEN: TIntegerField;
    cdsDadosMachoIDADE: TIntegerField;
    sqlDadosMachoDS_BOTIJAO: TStringField;
    sqlDadosMachoDS_CANECA: TStringField;
    sqlDadosMachoDS_CONCEPCAO: TIntegerField;
    sqlDadosMachoDS_FACILIDADEPARTO: TFloatField;
    sqlDadosMachoDS_HACK: TStringField;
    sqlDadosMachoDS_LEITE: TIntegerField;
    sqlDadosMachoDS_PERNAPE: TFloatField;
    sqlDadosMachoDS_TIPO: TFloatField;
    sqlDadosMachoDS_UBERE: TFloatField;
    cdsDadosMachoDS_BOTIJAO: TStringField;
    cdsDadosMachoDS_CANECA: TStringField;
    cdsDadosMachoDS_CONCEPCAO: TIntegerField;
    cdsDadosMachoDS_FACILIDADEPARTO: TFloatField;
    cdsDadosMachoDS_HACK: TStringField;
    cdsDadosMachoDS_LEITE: TIntegerField;
    cdsDadosMachoDS_PERNAPE: TFloatField;
    cdsDadosMachoDS_TIPO: TFloatField;
    cdsDadosMachoDS_UBERE: TFloatField;
    sqlCrescimento: TTcSQLDataSet;
    sqlCompras: TTcSQLDataSet;
    sqlSanidade: TTcSQLDataSet;
    cdsCrescimento: TClientDataSet;
    cdsSanidade: TClientDataSet;
    cdsCompras: TClientDataSet;
    sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    sqlCrescimentoKZOO_ANIMAL: TStringField;
    sqlCrescimentoDATA: TSQLTimeStampField;
    sqlCrescimentoPESO: TIntegerField;
    sqlCrescimentoALTURA: TIntegerField;
    sqlCrescimentoGANHOPESO: TFloatField;
    sqlCrescimentoOBSERVACAO: TMemoField;
    sqlSanidadeKZOO_ANIMAL_MACHO_SANIDADE: TStringField;
    sqlSanidadeKZOO_ANIMAL_MACHO: TStringField;
    sqlSanidadeDATA: TSQLTimeStampField;
    sqlSanidadeOCORRENCIA: TStringField;
    sqlComprasKZOO_ANIMAL_SEMEN_COMPRA: TStringField;
    sqlComprasKZOO_ANIMAL_MACHO: TStringField;
    sqlComprasDATA: TSQLTimeStampField;
    sqlComprasDOSES: TIntegerField;
    sqlComprasVALORDOSE: TFloatField;
    cdsAnimalsqlSanidade: TDataSetField;
    cdsAnimalsqlCompras: TDataSetField;
    cdsAnimalsqlCrescimento: TDataSetField;
    cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    cdsCrescimentoKZOO_ANIMAL: TStringField;
    cdsCrescimentoDATA: TSQLTimeStampField;
    cdsCrescimentoPESO: TIntegerField;
    cdsCrescimentoALTURA: TIntegerField;
    cdsCrescimentoIDADE: TIntegerField;
    cdsCrescimentoGANHOPESO: TFloatField;
    cdsCrescimentoOBSERVACAO: TMemoField;
    cdsSanidadeKZOO_ANIMAL_MACHO_SANIDADE: TStringField;
    cdsSanidadeKZOO_ANIMAL_MACHO: TStringField;
    cdsSanidadeDATA: TSQLTimeStampField;
    cdsSanidadeOCORRENCIA: TStringField;
    cdsComprasKZOO_ANIMAL_SEMEN_COMPRA: TStringField;
    cdsComprasKZOO_ANIMAL_MACHO: TStringField;
    cdsComprasDATA: TSQLTimeStampField;
    cdsComprasDOSES: TIntegerField;
    cdsComprasVALORDOSE: TFloatField;
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
    sqlLstMachosBRINCO_: TStringField;
    cdsLstMachosBRINCO_: TStringField;
    sqlDadosMachoDS_PROTEINA: TIntegerField;
    sqlDadosMachoDS_GORDURA: TIntegerField;
    cdsDadosMachoDS_PROTEINA: TIntegerField;
    cdsDadosMachoDS_GORDURA: TIntegerField;
    cdsDescartes: TClientDataSet;
    cdsDescartesKZOO_ANIMAL: TStringField;
    cdsDescartesKCAD_COMPRADOR: TStringField;
    cdsDescartesDATA: TSQLTimeStampField;
    cdsDescartesRAZAO: TIntegerField;
    cdsDescartesMOTIVO: TIntegerField;
    cdsDescartesNOMECOMPRADOR: TStringField;
    cdsDescartesDESCR_RAZAO: TStringField;
    cdsDescartesDESCR_MOTIVO: TStringField;
    cdsDescartesPRECOVENDA: TFloatField;
    sqlDescartes: TTcSQLDataSet;
    sqlDescartesKZOO_ANIMAL: TStringField;
    sqlDescartesKCAD_COMPRADOR: TStringField;
    sqlDescartesDATA: TSQLTimeStampField;
    sqlDescartesRAZAO: TIntegerField;
    sqlDescartesMOTIVO: TIntegerField;
    sqlDescartesNOMECOMPRADOR: TStringField;
    sqlDescartesPRECOVENDA: TFloatField;
    cdsAnimalsqlDescartes: TDataSetField;
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
    sqlLstMachosATIVO: TStringField;
    cdsLstMachosATIVO: TStringField;
    sqlDadosMachoDS_ATIVO: TStringField;
    cdsDadosMachoDS_ATIVO: TStringField;
    sqlLstMachosINSEMINACOES: TIntegerField;
    sqlLstMachosPRENHEZES: TIntegerField;
    sqlLstMachosLACTACOES: TIntegerField;
    cdsLstMachosINSEMINACOES: TIntegerField;
    cdsLstMachosPRENHEZES: TIntegerField;
    cdsLstMachosLACTACOES: TIntegerField;
    sqlLinhagemSEXO: TStringField;
    sqlLinhagemNATIMORTO: TStringField;
    sqlLinhagemNASCIMENTO: TSQLTimeStampField;
    sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsLinhagemSEXO: TStringField;
    cdsLinhagemNATIMORTO: TStringField;
    cdsLinhagemNASCIMENTO: TSQLTimeStampField;
    cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlDadosMachoRETIRO: TStringField;
    sqlDadosMachoDATARETIRO: TSQLTimeStampField;
    sqlDadosMachoLOTE: TStringField;
    sqlDadosMachoDATALOTE: TSQLTimeStampField;
    cdsDadosMachoRETIRO: TStringField;
    cdsDadosMachoDATARETIRO: TSQLTimeStampField;
    cdsDadosMachoLOTE: TStringField;
    cdsDadosMachoDATALOTE: TSQLTimeStampField;
    sqlAnimalANIMAL_DE_TERCEIRO: TStringField;
    cdsAnimalANIMAL_DE_TERCEIRO: TStringField;
    procedure cdsLstMachosNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNewRecord(DataSet: TDataSet);
    procedure cdsLstMachosBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalBRINCOValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsDadosMachoCalcFields(DataSet: TDataSet);
    procedure cdsCrescimentoNewRecord(DataSet: TDataSet);
    procedure cdsSanidadeNewRecord(DataSet: TDataSet);
    procedure cdsComprasNewRecord(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsSanidadeDATAValidate(Sender: TField);
    procedure cdsCrescimentoDATAValidate(Sender: TField);
    procedure cdsCrescimentoDATAChange(Sender: TField);
    procedure cdsCrescimentoPESOValidate(Sender: TField);
    procedure cdsDadosMachoBeforeInsert(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalNOMECOMPLETOSetText(Sender: TField; const Text: string);
    procedure cdsCrescimentoBeforePost(DataSet: TDataSet);
    procedure cdsSanidadeBeforePost(DataSet: TDataSet);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsDadosMachoBeforeEdit(DataSet: TDataSet);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsLstMachosBRINCO_GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDadosMachoIDADEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCrescimentoALTURAValidate(Sender: TField);
    procedure cdsAnimalBeforeDelete(DataSet: TDataSet);
    procedure cdsCrescimentoCalcFields(DataSet: TDataSet);
    procedure cdsAnimalDTORIGEMValidate(Sender: TField);
    procedure cdsDadosMachoNASCIMENTOValidate(Sender: TField);
    procedure cdsDescartesBeforePost(DataSet: TDataSet);
    procedure cdsDescartesAfterPost(DataSet: TDataSet);
    procedure cdsAnimalBeforePost(DataSet: TDataSet);
    procedure dspAnimalBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    { Private declarations }
   FGrauDeSangue : TZoo_GrauDeSangue ;
    FKZOOANIMAL: string;
    FExibirDescartados: boolean;
    procedure SetParams ;
    procedure CalculateGrauSangue ;
    procedure SetKZOOANIMAL(const Value: string);
    procedure SetExibirDescartados(const Value: boolean);
    procedure RelacLinhagemEventos;
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
    property ExibirDescartados : boolean  read FExibirDescartados write SetExibirDescartados;
    //Constructor Create ( AOwner : TComponent ) ; override ;
    procedure AfterConstruction ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UApplResources, UDBZootecnico, Exceptions, CLAg5Types, DateUtils,
     ClAg5ClientZootecnicoCommonTypes,
     SQLSuppl ;

{$R *.dfm}

{ TdtmCustomListaFicha }


(*
constructor TZoo_BancoDadosMachoDatamodule.Create(AOwner: TComponent);
begin
   inherited Create( AOwner ) ;
   FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;
*)

procedure TZoo_BancoDadosMachoDatamodule.AfterConstruction ;
begin
   FKZOOANIMAL := '' ;
   FExibirDescartados  := False ;
   cdsLstMachos.Filter := 'ATIVO=''T''' ;
   SetExibirDescartados( False ) ;
   FGrauDeSangue := TZoo_GrauDeSangue.Create ;
   inherited ;
end;

procedure TZoo_BancoDadosMachoDatamodule.OpenTables;
var
  LstRacas : TStringList ;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_MACHO,  cdsStatusAnimal );
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RACA_ANIMAIS,  cdsTipoRacasAnimais ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_COMPOSICAORACA,  cdsTipoComposicaoRaca  ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RAZAO_DESCARTE,       cdsTipoRazaoDescarte   ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_MOTIVO_DESCARTE_MACHO,      cdsTipoMotivoDescarte  ) ;

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


procedure TZoo_BancoDadosMachoDatamodule.RelacLinhagemEventos;
const
  SQL_BUSCA_EVENTO =
            'SELECT E.KZOO_EVENTO_ZOOTECNICO,'
     +#13#10'       E.KZOO_ANIMAL_FEMEA,'
     +#13#10'       AF.BRINCO "BRINCO_MAE",'
     +#13#10'       AF.NOMEESTABULO "NOME_MAE",'
     +#13#10'       E.KZOO_ANIMAL_MACHO,'
     +#13#10'       AM.BRINCO "BRINCO_PAI",'
     +#13#10'       AM.NOMEESTABULO "NOME_PAI",'
     +#13#10'       E.DATAABORTOPARTO'
     +#13#10'  FROM ZOO_EVENTOS_ZOOTECNICOS E'
     +#13#10' INNER JOIN ZOO_ANIMAIS AF ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_FEMEA'
     +#13#10' INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL'
     +#13#10'  LEFT JOIN ZOO_ANIMAIS AM ON AF.KZOO_ANIMAL = E.KZOO_ANIMAL_MACHO_TOUROSEMEN'
     +#13#10'  LEFT JOIN ZOO_ANIMAIS_MACHO M ON M.KZOO_ANIMAL_MACHO = AM.KZOO_ANIMAL'
     +#13#10' WHERE E.DATAABORTOPARTO = :DT_NASC'
     +#13#10'   AND E.ABORTOPARTO = :TIPO_PARTO_ABORTO'
     +#13#10'   AND E.TIPOEVENTO  <> :TIPO_EVENTO_ZOO_IMPLANTE'
     +#13#10'   AND E.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_MAE';
var
  p : TParams;
  cds : TClientDataSet;
begin


  if //( not cdsLinhagemKZOO_EVENTO_ZOOTECNICO.IsNull ) or
     ( ( cdsDadosMachoNASCIMENTO.IsNull ) or ( cdsDadosMachoNASCIMENTO.AsDateTime = 0 ) )  then
     exit;

  p := TParams.Create;
  p.CreateParam( ftTimeStamp, 'DT_NASC',           ptInput ).AsSQLTimeStamp   := cdsDadosMachoNASCIMENTO.AsSQLTimeStamp;
  p.CreateParam( ftInteger,   'TIPO_PARTO_ABORTO', ptInput ).AsInteger        := _ST_TIPO_PARTOABORTO_PARTO;
  p.CreateParam( ftInteger,   'TIPO_EVENTO_ZOO_IMPLANTE', ptInput ).AsInteger := _ST_TIPO_EVENTO_ZOO_IMPLANTE;
  p.CreateParam( ftString,    'KZOO_ANIMAL_MAE',   ptInput ).AsString         := cdsLinhagemKZOO_ANIMAL_FEMEA.AsString;


  cds:= nil;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, SQL_BUSCA_EVENTO, p ) ;

  if cds.IsEmpty then
    begin
      cds.Free;
      p.Free;
      exit;
    end;

  if ( cdsLinhagem.IsEmpty ) and not ( cdsLinhagem.State in [dsInsert,dsEdit] )  then
     cdsLinhagem.Append
  else
  if not ( cdsLinhagem.State in [dsEdit,dsInsert] ) then
    cdsLinhagem.Edit;

  cdsLinhagemKZOO_EVENTO_ZOOTECNICO.AsString := cds.FieldByName('KZOO_EVENTO_ZOOTECNICO').AsString;
  cdsLinhagemSEXO.AsString := 'M';
  cdsLinhagemNATIMORTO.AsString := 'F';
  cdsLinhagemNASCIMENTO.AsDateTime := cdsDadosMachoNASCIMENTO.AsDateTime;

  cds.Free;
  p.Free;
end;

procedure TZoo_BancoDadosMachoDatamodule.ReOpenTables;
var
   KZOO_ANIMAL : String ;
begin
  KZOO_ANIMAL := cdsLstMachosKZOO_ANIMAL.asString ;
  inherited;
  cdsLstMachos.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] ) ;
  cdsAnimal.Refresh;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLstMachosNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLstMachosBRINCO_GetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsSanidadeBeforePost(DataSet: TDataSet);
begin
  if cdsSanidadeDATA.AsDateTime < 1 then
    raise Warning.Create('Data inválida');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsSanidadeDATAValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
    raise Warning.Create('Data superior a data atual');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsSanidadeNewRecord(
  DataSet: TDataSet);
begin
   GetKey ( cdsSanidadeKZOO_ANIMAL_MACHO_SANIDADE ) ;
   cdsSanidadeKZOO_ANIMAL_MACHO.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLinhagemBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsDadosMacho.IsEmpty ) and not ( cdsDadosMacho.State in [dsInsert,dsEdit] )  then
     cdsDadosMacho.Append
  else if not ( cdsDadosMacho.State in [dsInsert,dsEdit] ) then
     cdsDadosMacho.Edit  ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLinhagemCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
          GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLinhagemNOMEMAESetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLinhagemNOMEPAISetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

destructor TZoo_BancoDadosMachoDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_BancoDadosMachoDatamodule.dspAnimalBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
const
   UPDATE_ZOO_EVENTOS_ZOOTECNICOS =
            'UPDATE ZOO_EVENTOS_ZOOTECNICOS'
     +#13#10'   SET KZOO_ANIMAL_MACHO = :KZOO_ANIMAL_MACHO,'
     +#13#10'       KZOO_ANIMAL_MACHO_TOUROSEMEN = :KZOO_TOUROSEMEN '
     +#13#10' WHERE KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO '
     +#13#10'   AND TIPOEVENTO <> :TIPO_EVENTO_ZOO_IMPLANTE';

   UPDATE_ZOO_ANIMAL_LINHAGEM =
            'UPDATE ZOO_ANIMAL_LINHAGEM '
     +#13#10'   SET KZOO_ANIMAL_MACHO = :KZOO_ANIMAL_MACHO,'
     +#13#10'       NOMEPAI = :NOMEPAI,'
     +#13#10'       REGISTROPAI = :REGISTROPAI,'
     +#13#10'       GRAUSANGUEPAI = :GRAUSANGUEPAI,'
     +#13#10'       COMPOSICAORACAPAI = :COMPOSICAORACAPAI'
     +#13#10' WHERE KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO';

var
  p : TParams;
begin

  {Altera o pai no evento zootecnico que é atribuído à linhagem na procedure RelacLinhagemEventos deste DataModule}
  if ( not cdsLinhagemKZOO_ANIMAL_MACHO.IsNull ) and ( not cdsLinhagemKZOO_EVENTO_ZOOTECNICO.IsNull ) then
    begin
      try

        p := TParams.Create;
        p.CreateParam( ftString, 'KZOO_ANIMAL_MACHO',         ptInput ).AsString  := cdsLinhagemKZOO_ANIMAL_MACHO.AsString;
        p.CreateParam( ftString, 'KZOO_TOUROSEMEN',           ptInput ).AsString  := cdsLinhagemKZOO_ANIMAL_MACHO.AsString;
        p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO',    ptInput ).AsString  := cdsLinhagemKZOO_EVENTO_ZOOTECNICO.AsString;
        p.CreateParam( ftInteger,'TIPO_EVENTO_ZOO_IMPLANTE',  ptInput ).AsInteger := _ST_TIPO_EVENTO_ZOO_IMPLANTE;
        sqlAnimal.SQLConnection.Execute(UPDATE_ZOO_EVENTOS_ZOOTECNICOS, p);

        p.Clear;
        p.CreateParam( ftString, 'KZOO_ANIMAL_MACHO',         ptInput ).AsString := cdsLinhagemKZOO_ANIMAL_MACHO.AsString;
        p.CreateParam( ftString, 'NOMEPAI',                   ptInput ).AsString := cdsLinhagemNOMEPAI.AsString;
        p.CreateParam( ftString, 'REGISTROPAI',               ptInput ).Clear;
        p.CreateParam( ftString, 'GRAUSANGUEPAI',             ptInput ).AsString := cdsLinhagemGRAUSANGUEPAI.AsString;
        p.CreateParam( ftString, 'COMPOSICAORACAPAI',         ptInput ).AsString := cdsLinhagemCOMPOSICAORACAPAI.AsString;
        p.CreateParam( ftString, 'KZOO_EVENTO_ZOOTECNICO',    ptInput ).AsString := cdsLinhagemKZOO_EVENTO_ZOOTECNICO.AsString;
        sqlAnimal.SQLConnection.Execute(UPDATE_ZOO_ANIMAL_LINHAGEM, p);

        p.Free;
      except
        p.Free;
      end;

    end;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalBRINCOValidate(Sender: TField);
begin
  inherited;
  if TAnimalMacho.CheckCodigoExists ( LoggedUser.DomainID, Sender.asString, cdsAnimalKZOO_ANIMAL.asString ) then
     raise Warning.Create('Código em uso por outro animal');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalDTORIGEMValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Data de origem não pode ser maior que a data atual');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalGRAUSANGUESetText(
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

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;

  cdsAnimalKCAD_FAZENDA.asString := LoggedUser.DomainID ;
//  cdsAnimalDTNASC.AsDateTime := Date ;
  cdsAnimalDTORIGEM.AsDateTime := Date ;
  cdsAnimalSTATUS.asInteger := _ST_SIGLA_STATUS_ANIMAL_SEMEN ;
  cdsAnimalORIGINADO_DE_EMBRIAO.asString := 'F' ;
  cdsAnimalANIMAL_DE_TERCEIRO.asString   := 'F' ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.AsString := '.';
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

  cdsAnimal.DisableConstraints ;
  cdsDadosMacho.Append ;
  cdsDadosMachoKZOO_ANIMAL_MACHO.asString := cdsAnimalKZOO_ANIMAL.asString ;
  cdsDadosMachoQTDE_SEMEN.asInteger          := 0 ;
  cdsDadosMachoQTDEINICIAL_SEMEN.asInteger   := 0 ;
  cdsDadosMachoQTDECOMPRADA_SEMEN.asInteger  := 0 ;
  cdsDadosMachoQTDEUTILIZADA_SEMEN.asInteger := 0 ;
  cdsDadosMachoDS_ATIVO.asString             := 'T' ;
  cdsAnimal.EnableConstraints ;

//  cdsAnimalDTNASC.Clear ;
  cdsAnimalDTORIGEM.Clear ;
  cdsAnimalSTATUS.Clear ;

  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.Clear ;
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalNOMECOMPLETOSetText(
  Sender: TField; const Text: string);
begin
   cdsAnimalNOMECOMPLETO.asString := Text ;
   cdsAnimalNOMEESTABULO.asString := Text ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsComprasNewRecord(DataSet: TDataSet);
begin
   GetKey ( cdsComprasKZOO_ANIMAL_SEMEN_COMPRA ) ;
   cdsComprasKZOO_ANIMAL_MACHO.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoALTURAValidate(
  Sender: TField);
begin
  if Sender.AsInteger < 40 then
    raise Warning.Create('Altura mínima permitida 40 cm');

  if Sender.AsInteger > 210 then
    raise Warning.Create('Altura máxima permitida 210 cm');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoBeforePost(DataSet: TDataSet);
begin
  if cdsCrescimentoDATA.AsDateTime < 1 then
     raise Warning.Create('Data inválida');

  if    ( cdsCrescimentoPESO.IsNull or (cdsCrescimentoPESO.asInteger = 0))
   and  ( cdsCrescimentoALTURA.IsNull or (cdsCrescimentoALTURA.asInteger = 0)) then
    raise Warning.Create('Necessário digitar peso e/ou altura');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoCalcFields(
  DataSet: TDataSet);
begin
  if cdsDadosMacho.Active then
    cdsCrescimentoIDADE.asInteger := MonthsBetween( cdsCrescimentoDATA.asDateTime, cdsDadosMachoNASCIMENTO.asDateTime )
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoDATAChange(Sender: TField);
begin
  cdsCrescimentoIDADE.AsInteger := MonthsBetween( cdsCrescimentoDATA.AsDateTime, cdsDadosMachoNASCIMENTO.AsDateTime );

end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoDATAValidate(Sender: TField);
begin
  if Sender.IsNull then
    raise Warning.Create('Data inválida');

  if Sender.AsDateTime > Date then
    raise Warning.Create('Data superior a data atual');

end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoNewRecord(
  DataSet: TDataSet);
begin
  GetKey ( cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO ) ;
  cdsCrescimentoKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsCrescimentoPESOValidate(Sender: TField);
begin
  if Sender.AsInteger < 25 then
    raise Warning.Create('Peso mínimo permitido 25 Kg');

  if Sender.AsInteger > 1000 then
    raise Warning.Create('Peso máximo permitido 1000 Kg');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDadosMachoBeforeEdit(
  DataSet: TDataSet);
begin
  if not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Edit ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDadosMachoBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsAnimal.IsEmpty ) and not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Append ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDadosMachoCalcFields(DataSet: TDataSet);
begin


  if ( DataSet.State in [dsInternalCalc, dsEdit, dsInsert] )   then
    begin
       if cdsAnimalSTATUS.asInteger = _ST_STATUS_ANIMAL_SEMEN then
         cdsDadosMachoIDADE.Clear
       else
         cdsDadosMachoIDADE.AsInteger := MonthsBetween ( Date, cdsDadosMachoNASCIMENTO.AsDateTime )
    end ;

  if ( DataSet.State in [dsEdit, dsInsert] ) then
    begin
       cdsDadosMacho.OnCalcFields := nil ;
       cdsDadosMachoQTDE_SEMEN.asFloat :=  cdsDadosMachoQTDEINICIAL_SEMEN.asFloat
                                         - cdsDadosMachoQTDEUTILIZADA_SEMEN.asFloat
                                         +  cdsDadosMachoQTDECOMPRADA_SEMEN.asFloat ;
       cdsDadosMacho.OnCalcFields := cdsDadosMachoCalcFields ;
    end;

end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDadosMachoIDADEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if cdsAnimalSTATUS.asInteger = _ST_STATUS_ANIMAL_SEMEN then
     Text := ''
  else
     Text := Sender.asString
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDadosMachoNASCIMENTOValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Nascimento não pode ser maior que a data atual');
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDescartesAfterPost(
  DataSet: TDataSet);
begin
    if cdsDescartesDATA.IsNull
    and cdsDescartesRAZAO.IsNull
    and cdsDescartesMOTIVO.IsNull
    and (Trim ( cdsDescartesNOMECOMPRADOR.asString) = '' )
    and cdsDescartesPRECOVENDA.IsNull then
      cdsDescartes.delete ;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsDescartesBeforePost(
  DataSet: TDataSet);
begin
  if //(cdsDadosFemeaINTENCAO_DESCARTE.asBoolean)
       (not cdsDescartesDATA.IsNull)
    or (not cdsDescartesRAZAO.IsNull)
    or (not cdsDescartesMOTIVO.IsNull)
    or (Trim ( cdsDescartesNOMECOMPRADOR.asString)  <> '' )
    or (not cdsDescartesPRECOVENDA.IsNull) then
    begin
      if (cdsDescartesDATA.IsNull) or (cdsDescartesDATA.AsDateTime < 0 ) then
        raise Warning.Create('Data de descarte necessária');

//      if cdsDescartesRAZAO.IsNull then
//        raise Warning.Create('Razão de descarte necessária');

      if cdsDescartesMOTIVO.IsNull then
        raise Warning.Create('Motivo de descarte necessário');

(*
      if (cdsDescartesRAZAO.AsInteger = RAZAO_VENDA)
        and (   (cdsDescartesNOMECOMPRADOR.IsNull) or (cdsDescartesNOMECOMPRADOR.AsString = EmptyStr)
             or (cdsDescartesPRECOVENDA.IsNull) or (cdsDescartesPRECOVENDA.Value < 1))then
        begin
          if (cdsDescartesNOMECOMPRADOR.IsNull) or (cdsDescartesNOMECOMPRADOR.AsString = EmptyStr) then
            raise Warning.Create('Necessário preencher comprador');

          if (cdsDescartesPRECOVENDA.IsNull) or (cdsDescartesPRECOVENDA.Value < 1) then
            raise Warning.Create('Necessário preencher o preço da venda');
        end;
*)
    end;

end;

procedure TZoo_BancoDadosMachoDatamodule.CalculateGrauSangue;
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

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalBeforeDelete(
  DataSet: TDataSet);
begin
     if TSQLSuppl.CheckExistsIn( 'ZOO_EVENTOS_ZOOTECNICOS', 'KZOO_ANIMAL_MACHO_TOUROSEMEN', cdsAnimalKZOO_ANIMAL.asString, '', TSQLConnection ( DBResources[ 'ZOOTECNICO' ].Connection )  ) then
        Raise Warning.Create( 'Existem eventos zooténcos associados para este animal.' )

end;

procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstMachos.IsEmpty ) and not ( cdsLstMachos.State in [dsInsert,dsEdit] )  then
     cdsLstMachos.Append ;
end;


procedure TZoo_BancoDadosMachoDatamodule.cdsAnimalBeforePost(DataSet: TDataSet);
begin
  RelacLinhagemEventos;
end;

procedure TZoo_BancoDadosMachoDatamodule.cdsLstMachosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_BancoDadosMachoDatamodule.SetPai(Key, Nome: string; GrauSangue : string ; ComposicaoRaca : string ) ;
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

procedure TZoo_BancoDadosMachoDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] )then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_BancoDadosMachoDatamodule.SetExibirDescartados(
  const Value: boolean);
begin
  FExibirDescartados := Value;
  cdsLstMachos.Filtered := not FExibirDescartados ;
end;

procedure TZoo_BancoDadosMachoDatamodule.SetKZOOANIMAL(const Value: string);
begin
  ExibirDescartados := Value <> '' ;
  FKZOOANIMAL := Value;
end;

procedure TZoo_BancoDadosMachoDatamodule.SetMae(Key, Nome: string; GrauSangue : string ; ComposicaoRaca : string ) ;
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


procedure TZoo_BancoDadosMachoDatamodule.SetParams;
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


procedure TZoo_BancoDadosMachoDatamodule.UpdateRacasGrauSangue;begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

end.