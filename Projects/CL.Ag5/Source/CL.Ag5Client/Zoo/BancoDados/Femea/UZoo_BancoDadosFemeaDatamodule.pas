unit UZoo_BancoDadosFemeaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UZoo_GrauDeSangueClass, Data.SqlTimSt, GuidSuppl ;

type
  TZoo_BancoDadosFemeaDatamodule = class(T_dtmBASEDBListEdit)
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
    cdsDadosFemeaKZOO_ANIMAL_FEMEA: TStringField;
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
    cdsDadosFemeaDOADOR_RECEPTOR: TIntegerField;
    cdsTipoDoadorReceptor: TClientDataSet;
    cdsTipoDoadorReceptorTIPO: TStringField;
    cdsTipoDoadorReceptorVALOR: TStringField;
    cdsTipoDoadorReceptorDESCRICAO: TStringField;
    cdsTipoDoadorReceptorORDEM: TIntegerField;
    cdsDadosFemeaDESCR_DOADOR_RECEPTOR: TStringField;
    cdsDescartes: TClientDataSet;
    sqlDescartes: TTcSQLDataSet;
    sqlDescartesKZOO_ANIMAL: TStringField;
    sqlDescartesKCAD_COMPRADOR: TStringField;
    sqlDescartesDATA: TSQLTimeStampField;
    sqlDescartesRAZAO: TIntegerField;
    sqlDescartesMOTIVO: TIntegerField;
    sqlDescartesNOMECOMPRADOR: TStringField;
    sqlDescartesPRECOVENDA: TFloatField;
    cdsAnimalsqlDescartes: TDataSetField;
    cdsDescartesKZOO_ANIMAL: TStringField;
    cdsDescartesKCAD_COMPRADOR: TStringField;
    cdsDescartesDATA: TSQLTimeStampField;
    cdsDescartesRAZAO: TIntegerField;
    cdsDescartesMOTIVO: TIntegerField;
    cdsDescartesNOMECOMPRADOR: TStringField;
    cdsDescartesPRECOVENDA: TFloatField;
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
    cdsDescartesDESCR_RAZAO: TStringField;
    cdsDescartesDESCR_MOTIVO: TStringField;
    sqlLstFemeasNASCIMENTO: TSQLTimeStampField;
    sqlLstFemeasCOMPOSICAORACA: TStringField;
    sqlLstFemeasGRAUSANGUE: TStringField;
    sqlLstFemeasSTATUS: TIntegerField;
    sqlLstFemeasDOADOR_RECEPTOR: TIntegerField;
    sqlLstFemeasSISBOV: TStringField;
    sqlLstFemeasDATA: TSQLTimeStampField;
    sqlLstFemeasMOTIVO: TIntegerField;
    sqlLstFemeasRAZAO: TIntegerField;
    cdsLstFemeasNASCIMENTO: TSQLTimeStampField;
    cdsLstFemeasCOMPOSICAORACA: TStringField;
    cdsLstFemeasGRAUSANGUE: TStringField;
    cdsLstFemeasSTATUS: TIntegerField;
    cdsLstFemeasDOADOR_RECEPTOR: TIntegerField;
    cdsLstFemeasSISBOV: TStringField;
    cdsLstFemeasDATA: TSQLTimeStampField;
    cdsLstFemeasMOTIVO: TIntegerField;
    cdsLstFemeasRAZAO: TIntegerField;
    cdsLstFemeasDESCR_RAZAO: TStringField;
    cdsLstFemeasDESCR_MOTIVO: TStringField;
    cdsLstFemeasDESCR_STATUS: TStringField;
    cdsLstFemeasDESCR_DOADOR_RECEPTOR: TStringField;
    cdsAnimalIDADE: TIntegerField;
    cdsDadosFemeaNASCIMENTO: TSQLTimeStampField;
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
    cdsDadosFemeaRETIRO: TStringField;
    cdsDadosFemeaLOTE: TStringField;
    cdsDadosFemeaINTENCAO_DESCARTE: TStringField;
    cdsTipoComposicaoRaca: TClientDataSet;
    cdsTipoComposicaoRacaTIPO: TStringField;
    cdsTipoComposicaoRacaVALOR: TStringField;
    cdsTipoComposicaoRacaDESCRICAO: TStringField;
    cdsTipoComposicaoRacaORDEM: TIntegerField;
    cdsDadosFemeaIDADE: TStringField;
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
    sqlDadosFemeaKZOO_ANIMAL_FEMEA: TStringField;
    sqlDadosFemeaDOADOR_RECEPTOR: TIntegerField;
    sqlDadosFemeaRETIRO: TStringField;
    sqlDadosFemeaLOTE: TStringField;
    sqlDadosFemeaNASCIMENTO: TSQLTimeStampField;
    sqlDadosFemeaINTENCAO_DESCARTE: TStringField;
    sqlDadosFemeaSCL: TStringField;
    cdsDadosFemeaSCL: TStringField;
    sqlDadosFemeaEMBRIAO: TStringField;
    cdsDadosFemeaEMBRIAO: TStringField;
    sqlAnimalORIGINADO_DE_EMBRIAO: TStringField;
    cdsAnimalORIGINADO_DE_EMBRIAO: TStringField;
    sqlLstFemeasBRINCO_: TStringField;
    cdsLstFemeasPADBRINCO: TStringField;
    sqlDadosFemeaVLOTE1: TStringField;
    sqlDadosFemeaVLOTE2: TStringField;
    sqlDadosFemeaVLOTE3: TStringField;
    cdsDadosFemeaVLOTE1: TStringField;
    cdsDadosFemeaVLOTE2: TStringField;
    cdsDadosFemeaVLOTE3: TStringField;
    sqlDescartesOBS: TMemoField;
    cdsDescartesOBS: TMemoField;
    sqlLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsLinhagemKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlLinhagemSEXO: TStringField;
    sqlLinhagemNATIMORTO: TStringField;
    sqlLinhagemNASCIMENTO: TSQLTimeStampField;
    cdsLinhagemSEXO: TStringField;
    cdsLinhagemNATIMORTO: TStringField;
    cdsLinhagemNASCIMENTO: TSQLTimeStampField;
    sqlCrescimento: TTcSQLDataSet;
    sqlCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    sqlCrescimentoKZOO_ANIMAL: TStringField;
    sqlCrescimentoDATA: TSQLTimeStampField;
    sqlCrescimentoPESO: TIntegerField;
    sqlCrescimentoALTURA: TIntegerField;
    sqlCrescimentoOBSERVACAO: TMemoField;
    sqlCrescimentoGANHOPESO: TFloatField;
    sqlCrescimentoLOTE: TStringField;
    sqlCrescimentoSYSUI: TStringField;
    sqlCrescimentoSYSDI: TSQLTimeStampField;
    sqlCrescimentoSYSUU: TStringField;
    sqlCrescimentoSYSDU: TSQLTimeStampField;
    cdsCrescimento: TClientDataSet;
    cdsDadosFemeasqlCrescimento: TDataSetField;
    cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO: TStringField;
    cdsCrescimentoKZOO_ANIMAL: TStringField;
    cdsCrescimentoDATA: TSQLTimeStampField;
    cdsCrescimentoPESO: TIntegerField;
    cdsCrescimentoALTURA: TIntegerField;
    cdsCrescimentoOBSERVACAO: TMemoField;
    cdsCrescimentoGANHOPESO: TFloatField;
    cdsCrescimentoLOTE: TStringField;
    cdsCrescimentoSYSUI: TStringField;
    cdsCrescimentoSYSDI: TSQLTimeStampField;
    cdsCrescimentoSYSUU: TStringField;
    cdsCrescimentoSYSDU: TSQLTimeStampField;
    sqlDadosFemeaKCRESCIMENTO_NASCIMENTO: TStringField;
    cdsDadosFemeaKCRESCIMENTO_NASCIMENTO: TStringField;
    sqlAnimalANIMAL_DE_TERCEIRO: TStringField;
    cdsAnimalANIMAL_DE_TERCEIRO: TStringField;
    procedure cdsLstFemeasNewRecord(DataSet: TDataSet);
    procedure cdsAnimalNewRecord(DataSet: TDataSet);
    procedure cdsLstFemeasBeforeOpen(DataSet: TDataSet);
    procedure cdsAnimalBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalBRINCOValidate(Sender: TField);
    procedure cdsLinhagemNewRecord(DataSet: TDataSet);
    procedure cdsDadosFemeaNewRecord(DataSet: TDataSet);
    procedure cdsDadosFemeaCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemCalcFields(DataSet: TDataSet);
    procedure cdsLinhagemBeforeInsert(DataSet: TDataSet);
    procedure cdsDadosFemeaBeforeInsert(DataSet: TDataSet);
    procedure cdsAnimalGRAUSANGUESetText(Sender: TField; const Text: string);
    procedure cdsDescartesBeforePost(DataSet: TDataSet);
    procedure cdsAnimalSTATUSChange(Sender: TField);
    procedure cdsAnimalSTATUSValidate(Sender: TField);
    procedure cdsDescartesAfterPost(DataSet: TDataSet);
    procedure cdsLinhagemNOMEPAISetText(Sender: TField; const Text: string);
    procedure cdsLinhagemNOMEMAESetText(Sender: TField; const Text: string);
    procedure dspAnimalAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure cdsAnimalGRAUSANGUEValidate(Sender: TField);
    procedure cdsAnimalCOMPOSICAORACAValidate(Sender: TField);
    procedure cdsLstFemeasPADBRINCOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDadosFemeaNASCIMENTOValidate(Sender: TField);
    procedure cdsAnimalDTORIGEMValidate(Sender: TField);
    procedure cdsStatusAnimalFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsAnimalBeforePost(DataSet: TDataSet);
    procedure dspAnimalBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsCrescimentoBeforePost(DataSet: TDataSet);
    procedure cdsAnimalBeforeEdit(DataSet: TDataSet);
    procedure cdsCrescimentoNewRecord(DataSet: TDataSet);
    procedure cdsDadosFemeaNASCIMENTOChange(Sender: TField);
  private
    { Private declarations }
    FExibirDescartados: boolean;
    FGrauDeSangue : TZoo_GrauDeSangue ;
    FKZOOANIMAL: string;
    FInsertOrUpdate: String;
    procedure SetParams ;
    procedure SetExibirDescartados(const Value: boolean);
    function IdadeAnoMes ( Intervalo : integer ) : String;
    procedure CalculateGrauSangue ;
    procedure SetKZOOANIMAL(const Value: string);
    procedure RelacLinhagemEventos;
    procedure UpdateCalculoLactacao( const AKZOOANIMAL : string ) ;

    function GetCrescimentoNascimento: String;

  public
    { Public declarations }
    procedure FilterStatusOptions ;
    procedure ResetStatusOptions ;
    procedure NewRecord ; override ;
    procedure EditRecord ; override ;
    procedure ApplyUpdates ; override ;
    procedure CancelUpdates ; override ;
    procedure SetPai   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure SetMae   ( Key : String ; Nome : string  ; GrauSangue : string ; ComposicaoRaca : string ) ;
    procedure OpenTables ; override ;
    procedure ReOpenTables ; override ;
    property ExibirDescartados : boolean  read FExibirDescartados write SetExibirDescartados;
    property GrauDeSangue : TZoo_GrauDeSangue read FGrauDeSangue ;
    procedure UpdateRacasGrauSangue ;
    procedure SetComposicaoRacas ;
    procedure ClearMotivoDescarte ;
    property  KZOOANIMAL : string  read FKZOOANIMAL write SetKZOOANIMAL;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;

implementation

uses UDBZootecnico, Exceptions, CLAg5Types, DateUtils,
     ClAg5ClientZootecnicoCommonTypes,
     DiagnosticosAnimalClass,
     Tc.RTL.Exceptions,
     Tc.DBRTL.AbstractDB ;

//var RAZAO_VENDA : Integer ;

{$R *.dfm}

const _INSERT = 'I';
      _UPDATE = 'U';


type
  IDadosAnimalFemea = interface
    ['{D1C34045-78E5-456B-B792-62B1438DAED6}']
    function HasEventosZootecnicos : boolean ;
    function HasLactacoes : boolean ;
    function IsLactante : boolean ;
  end;

  TIDadosAnimalFemea =class ( TInterfacedObject, IDadosAnimalFemea )
  private
    FKZOO_ANIMALFEMEA : string ;
    FHasEventosZootecnicos : Variant ;
    FHasLactacoes : Variant ;
    FIsLactante : Variant ;
    FIDBZootecnico : ITcAbstractDB ;
    procedure CheckConnection ;
    procedure GetHasEventosZootecnicos ;
    procedure GetHasLactacoes  ;
    procedure GetIsLactante  ;
  private // interfaces
    function HasEventosZootecnicos : boolean ;
    function HasLactacoes : boolean ;
    function IsLactante : boolean ;
    constructor Create ( AKZOO_ANIMALFEMEA : string ; ADBZootecnico : ITcAbstractDB = nil ) ;
  end ;

{ TdtmCustomListaFicha }

procedure TZoo_BancoDadosFemeaDatamodule.OpenTables;
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

procedure TZoo_BancoDadosFemeaDatamodule.RelacLinhagemEventos;
const
  SQL_BUSCA_EVENTO =
            'SELECT E.KZOO_EVENTO_ZOOTECNICO,'
     +#13#10'       E.KZOO_ANIMAL_FEMEA,'
     +#13#10'       AF.BRINCO "BRINCO_MAE",'
     +#13#10'       AF.NOMEESTABULO "NOME_MAE",'
     +#13#10'       E.KZOO_ANIMAL_MACHO_TOUROSEMEN,'
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
     ( ( cdsDadosFemeaNASCIMENTO.IsNull ) or ( cdsDadosFemeaNASCIMENTO.AsDateTime = 0 ) ) then
     exit;

  p := TParams.Create;
  p.CreateParam( ftTimeStamp, 'DT_NASC',           ptInput ).AsSQLTimeStamp   := cdsDadosFemeaNASCIMENTO.AsSQLTimeStamp;
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
  cdsLinhagemSEXO.AsString := 'F';
  cdsLinhagemNATIMORTO.AsString := 'F';
  cdsLinhagemNASCIMENTO.AsDateTime := cdsDadosFemeaNASCIMENTO.AsDateTime;


  cds.Free;
  p.Free;
end;

procedure TZoo_BancoDadosFemeaDatamodule.ReOpenTables;
var
  LKZOO_ANIMAL : String ;
begin
  LKZOO_ANIMAL := cdsLstFemeasKZOO_ANIMAL.asString ;
  inherited;
  cdsAnimal.CancelUpdates ;
  cdsAnimal.refresh ;
  cdsLstFemeas.Locate('KZOO_ANIMAL', LKZOO_ANIMAL, [] ) ;
  cdsAnimal.Refresh;
end;


procedure TZoo_BancoDadosFemeaDatamodule.cdsLstFemeasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;


procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalBRINCOValidate(Sender: TField);
begin
  inherited;
  if TAnimalFemea.CheckBrincoExists ( LoggedUser.DomainID, Sender.asString, cdsAnimalKZOO_ANIMAL.asString ) then
     raise Warning.Create('Brinco em uso por outro animal');
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalCOMPOSICAORACAValidate(
  Sender: TField);
begin
 try
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvRaca, True ) ;
 except
     raise ;

 end;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalDTORIGEMValidate(
  Sender: TField);
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Data de origem não pode ser maior que a data atual');
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalGRAUSANGUESetText(
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

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalGRAUSANGUEValidate(
  Sender: TField);
begin
   TValidateGrauDeSangue.Validate(
      cdsLinhagemGRAUSANGUEPAI.asString, cdsLinhagemCOMPOSICAORACAPAI.asString,
      cdsLinhagemGRAUSANGUEMAE.asString, cdsLinhagemCOMPOSICAORACAMAE.asString,
      cdsAnimalGRAUSANGUE.asString, cdsAnimalCOMPOSICAORACA.asString,
      gsvGrauSangue, True ) ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;

  cdsAnimalKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsAnimalORIGINADO_DE_EMBRIAO.asString := 'F' ;
  cdsAnimalANIMAL_DE_TERCEIRO.asString   := 'F' ;


  // campos requided
//  cdsAnimalNASCIMENTO.AsDateTime := Date ;
//  cdsAnimalDTORIGEM.AsDateTime := Date ;
  cdsAnimalSTATUS.asInteger := _ST_STATUS_FEMEA_BEZERRO ;
  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.AsString := '.';
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

  cdsAnimal.DisableConstraints ;
  if not (cdsDadosFemea.State in [dsInsert, dsEdit]) then
   begin
    cdsDadosFemea.Append ;
    cdsDadosFemeaKZOO_ANIMAL_FEMEA.asString := cdsAnimalKZOO_ANIMAL.asString ;
    cdsDadosFemeaDOADOR_RECEPTOR.AsInteger := _ST_TIPO_DOADOR_RECEPTOR_ND ;
    cdsDadosFemeaNASCIMENTO.AsDateTime := Date ;
    cdsDadosFemeaINTENCAO_DESCARTE.AsString := 'F';
   end;
  cdsAnimal.EnableConstraints ;

//  cdsAnimalDTORIGEM.Clear ;
  cdsAnimalBRINCO.OnValidate :=  nil ;
  cdsAnimalBRINCO.Clear ;
  cdsAnimalBRINCO.OnValidate :=  cdsAnimalBRINCOValidate ;

end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalSTATUSChange(Sender: TField);
begin
  if Sender.AsInteger = _ST_STATUS_FEMEA_DESCARTADO then
    begin
      if not (cdsDescartes.State in [dsInsert,dsEdit]) then
        cdsDescartes.Edit;

        cdsDescartesDATA.AsDateTime := Date ;
    end
  else
    if cdsDescartes.State in [dsInsert, dsEdit] then
      begin
        cdsDescartes.ClearFields ;
      end;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalSTATUSValidate(Sender: TField);
begin
  case   ( Sender.AsInteger  ) of
    _ST_STATUS_FEMEA_BEZERRO :
     if ( TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).HasEventosZootecnicos ) then
      raise Warning.Create( 'Existe(m) evento(s) zootécnico(s) para este animal'
                     +#13#10'Status não pode ser mudado para Bezerra') ;
    _ST_STATUS_FEMEA_NOVILHA :
     if ( TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).HasLactacoes ) then
      raise Warning.Create( 'Existe(m) lactação(ões) para este animal'
                     +#13#10'Status não pode ser mudado para Novilha') ;
  //  else if ( Sender.AsInteger = _ST_STATUS_FEMEA_VACASECA ) then
  //    raise Warning.Create('Opção não permitida')
    _ST_STATUS_FEMEA_VACASECA :
      begin
          if not TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).HasLactacoes then
            raise Warning.Create( 'Animal não possui lactação(ões).'
                           +#13#10'Status não pode ser mudado para Vaca Seca') ;

          if( TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).IsLactante ) then
            raise Warning.Create( 'Animal em lactação.'
                         +#13#10'Status não pode ser mudado para Vaca Seca')
      end ;
  //  else if Sender.AsInteger = _ST_STATUS_FEMEA_VACALACTACAO then
  //    raise Warning.Create('Opção não permitida')
    _ST_STATUS_FEMEA_VACALACTACAO :
       begin
            if not TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).HasLactacoes then
              raise Warning.Create( 'Animal não possui lactação(ões).'
                             +#13#10'Status não pode ser mudado para Vaca em Lactação') ;
            if ( not TIDadosAnimalFemea.Create( cdsAnimalKZOO_ANIMAL.asString ).IsLactante ) then
              raise Warning.Create( 'A ultima lactação esta seca.'
                             +#13#10'Status não pode ser mudado para Vaca em Lactação') ;
       end;
  end;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsCrescimentoBeforePost(
  DataSet: TDataSet);
var
  LKCrescimentoNascimento: String;
begin
  {
  LKCrescimentoNascimento :=  GetCrescimentoNascimento;

  if (cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString <> LKCrescimentoNascimento) and
     (LKCrescimentoNascimento <> '') then
   begin
     if not (cdsDadosFemea.State in [dsEdit, dsInsert]) then
       cdsDadosFemea.Edit;
     cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString := LKCrescimentoNascimento;
     cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString := LKCrescimentoNascimento;
   end
 else
 if (cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString = '') then
   begin
     if not (cdsDadosFemea.State in [dsEdit, dsInsert]) then
       cdsDadosFemea.Edit;
     cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString := GuidStr20;
     cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString := cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString;
   end;

                                                                }
  cdsCrescimentoDATA.AsDateTime := cdsDadosFemeaNASCIMENTO.AsDateTime;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsCrescimentoNewRecord(
  DataSet: TDataSet);
var
  LKCrescimentoNascimento: String;
begin

  LKCrescimentoNascimento :=  GetCrescimentoNascimento;

  if (cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString <> LKCrescimentoNascimento) and
     (LKCrescimentoNascimento <> '') then
   begin
     if not (cdsDadosFemea.State in [dsEdit, dsInsert]) then
       cdsDadosFemea.Edit;
     cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString := LKCrescimentoNascimento;
     cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString := LKCrescimentoNascimento;
   end
 else
 if (cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString = '') and
    (cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString = '') then
   begin
     if not (cdsDadosFemea.State in [dsEdit, dsInsert]) then
       cdsDadosFemea.Edit;
     cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString := GuidStr20;
     cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString := cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString;
   end;
  cdsCrescimentoKZOO_ANIMAL_CRESCIMENTO.AsString := cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString;
  cdsCrescimentoKZOO_ANIMAL.AsString := cdsAnimalKZOO_ANIMAL.asString;
  cdsCrescimentoDATA.AsDateTime := cdsDadosFemeaNASCIMENTO.AsDateTime;
end;

procedure TZoo_BancoDadosFemeaDatamodule.FilterStatusOptions;
begin
  cdsStatusAnimal.OnFilterRecord := cdsStatusAnimalFilterRecord ;
  cdsStatusAnimal.Filtered := True ;
end;

function TZoo_BancoDadosFemeaDatamodule.GetCrescimentoNascimento: String;
const
  _SELECT_CRESCIMENTO_NASCIMENTO =
         'SELECT C.KZOO_ANIMAL_CRESCIMENTO, C.DATA'
  +#13#10'  FROM ZOO_ANIMAL_CRESCIMENTO C'
  +#13#10' WHERE C.KZOO_ANIMAL = :KZOO_ANIMAL_FEMEA'
  +#13#10'   AND C.DATA = :NASCIMENTO';
var
  cds: TClientDataSet;
  p: TParams;
begin
  p:= TParams.Create( nil );
  cds:= nil;

  p.Clear;
  p.CreateParam(ftString, 'KZOO_ANIMAL_FEMEA', ptInput).AsString := cdsDadosFemeaKZOO_ANIMAL_FEMEA.AsString;
  p.CreateParam(ftTimestamp, 'NASCIMENTO', ptInput).AsSQLTimeStamp := cdsDadosFemeaNASCIMENTO.AsSQLTimeStamp;

  DBResources['ZOOTECNICO'].populateClientDataSet(cds, _SELECT_CRESCIMENTO_NASCIMENTO, p);

  Result := '';
  if not cds.IsEmpty then
    Result := cds.FieldByName('KZOO_ANIMAL_CRESCIMENTO').AsString;

  cds.Free;
  p.Free;
end;

procedure TZoo_BancoDadosFemeaDatamodule.ResetStatusOptions;
begin
  cdsStatusAnimal.Filtered := False ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsStatusAnimalFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept := ( cdsStatusAnimalTIPO.asString = _ST_STATUS_FEMEA)
         and ( cdsStatusAnimalVALOR.AsInteger <>  _ST_STATUS_FEMEA_VACALACTACAO )
         and ( cdsStatusAnimalVALOR.AsInteger <>  _ST_STATUS_FEMEA_VACASECA )
         and ( cdsStatusAnimalVALOR.AsInteger <>  _ST_STATUS_FEMEA_DESCARTADO ) ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLstFemeasPADBRINCOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Trim ( Sender.DataSet.FieldByName ( 'BRINCO' ).asString ) ;
end;


procedure TZoo_BancoDadosFemeaDatamodule.cdsDadosFemeaBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsAnimal.IsEmpty ) and not ( cdsAnimal.State in [dsInsert,dsEdit] )  then
     cdsAnimal.Append ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDadosFemeaCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then
    begin
      if cdsDadosFemeaNASCIMENTO.isNull then
        cdsDadosFemeaIDADE.clear
      else //Formatar para exibir ANO/MESES
        cdsDadosFemeaIDADE.AsString := IdadeAnoMes(MonthsBetween(Date, cdsDadosFemeaNASCIMENTO.asDateTime));
    end;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDadosFemeaNASCIMENTOChange(
  Sender: TField);
begin
  if not ( cdsCrescimento.State in [dsInsert, dsEdit] ) then
     cdsCrescimento.Edit;

   cdsCrescimentoDATA.AsDateTime := VarToDateTime( cdsDadosFemeaNASCIMENTO.NewValue );
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDadosFemeaNASCIMENTOValidate(
  Sender: TField);
var idadeNovilha: Integer;
begin
   if Sender.AsDateTime > Date then
     raise Warning.Create('Nascimento não pode ser maior que a data atual');

   idadeNovilha := TParamNovilhas.GetParam ( LoggedUser.DomainID, _ST_PARAM_NOVILHAS_IDADE_DESMAME ) ;
   if FInsertOrUpdate = _INSERT then
    begin
      if (Date - cdsDadosFemeaNASCIMENTO.AsDateTime) >= idadeNovilha then
       begin
         cdsAnimalSTATUS.AsInteger := _ST_SIGLA_STATUS_FEMEA_NOVILHA;
       end
      else
        cdsAnimalSTATUS.AsInteger := _ST_SIGLA_STATUS_FEMEA_BEZERRO;
    end;


   

end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDadosFemeaNewRecord(DataSet: TDataSet);
begin
  cdsDadosFemeaINTENCAO_DESCARTE.AsString := 'F';
  {cdsDadosFemeaKZOO_ANIMAL_FEMEA.asString := cdsAnimalKZOO_ANIMAL.asString ;
  cdsDadosFemeaDOADOR_RECEPTOR.AsInteger := _ST_TIPO_DOADOR_RECEPTOR_ND ;
  cdsDadosFemeaNASCIMENTO.AsDateTime := Date;}
  cdsDadosFemeaKCRESCIMENTO_NASCIMENTO.AsString := GuidStr20;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDescartesAfterPost(
  DataSet: TDataSet);
begin
    if cdsDescartesDATA.IsNull
    and cdsDescartesRAZAO.IsNull
    and cdsDescartesMOTIVO.IsNull
    and (Trim ( cdsDescartesNOMECOMPRADOR.asString) = '' )
    and cdsDescartesPRECOVENDA.IsNull then
      cdsDescartes.delete ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsDescartesBeforePost(DataSet: TDataSet);
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

procedure TZoo_BancoDadosFemeaDatamodule.ApplyUpdates;
begin
  inherited;
  FInsertOrUpdate := '';
  ResetStatusOptions;
end;

procedure TZoo_BancoDadosFemeaDatamodule.CalculateGrauSangue;
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

procedure TZoo_BancoDadosFemeaDatamodule.CancelUpdates;
begin
  inherited;
  FInsertOrUpdate := '';
  ResetStatusOptions;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalBeforeEdit(DataSet: TDataSet);
begin
  {cdsAnimal.BeforeEdit := nil;
  if ( cdsCrescimento.IsEmpty ) then
   begin
     if not(cdsCrescimento.State in [dsEdit, dsInsert]) then
       cdsCrescimento.Append;
   end;
  cdsAnimal.BeforeEdit := cdsAnimalBeforeEdit;}
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstFemeas.IsEmpty ) and not ( cdsLstFemeas.State in [dsInsert,dsEdit] )  then
     cdsLstFemeas.Append ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsAnimalBeforePost(DataSet: TDataSet);
begin
  
  RelacLinhagemEventos;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLstFemeasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.SetParams;
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


procedure TZoo_BancoDadosFemeaDatamodule.UpdateRacasGrauSangue;
begin
   FGrauDeSangue.Raca := cdsAnimalCOMPOSICAORACA.asString ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLinhagemBeforeInsert(
  DataSet: TDataSet);
begin
  if ( cdsDadosFemea.IsEmpty ) and not ( cdsDadosFemea.State in [dsInsert,dsEdit] )  then
     cdsDadosFemea.Append ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLinhagemCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
     begin
       cdsLinhagemGSR_PAI.asString := cdsLinhagemGRAUSANGUEPAI.asString + ' - ' + cdsLinhagemCOMPOSICAORACAPAI.asString ;
       cdsLinhagemGSR_MAE.asString := cdsLinhagemGRAUSANGUEMAE.asString + ' - ' + cdsLinhagemCOMPOSICAORACAMAE.asString ;
     end;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLinhagemNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsLinhagemKZOO_ANIMAL_LINHAGEM ) ;
  cdsLinhagemKZOO_ANIMAL.Value := cdsAnimalKZOO_ANIMAL.Value ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLinhagemNOMEMAESetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_FEMEA.Clear ;
  cdsLinhagemGRAUSANGUEMAE.Clear ;
  cdsLinhagemCOMPOSICAORACAMAE.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.cdsLinhagemNOMEPAISetText(
  Sender: TField; const Text: string);
begin
  cdsLinhagemKZOO_ANIMAL_MACHO.Clear ;
  cdsLinhagemGRAUSANGUEPAI.Clear ;
  cdsLinhagemCOMPOSICAORACAPAI.Clear ;
  Sender.AsString := Text ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.ClearMotivoDescarte;
begin
  if not ( cdsAnimal.state in [dsInsert,dsEdit] ) then
    exit ;
  if cdsDescartes.IsEmpty then
     exit ;

  if not ( cdsDescartes.state in [dsInsert,dsEdit] ) then
     cdsDescartes.Edit ;

   cdsDescartesMOTIVO.Clear
end;

constructor TZoo_BancoDadosFemeaDatamodule.Create(AOwner: TComponent);
begin
   inherited Create( AOwner ) ;
   FKZOOANIMAL := '' ;
   cdsLstFemeas.Filter := Format (  'STATUS<>%d', [ _ST_STATUS_ANIMAL_DESCARTADO ] ) ;
   SetExibirDescartados(False) ;
   FGrauDeSangue := TZoo_GrauDeSangue.Create ;
end;

destructor TZoo_BancoDadosFemeaDatamodule.Destroy;
begin
  FGrauDeSangue.free ;
  inherited;
end;

procedure TZoo_BancoDadosFemeaDatamodule.dspAnimalAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if ( SourceDS = sqlDadosFemea ) and ( UpdateKind = ukModify )
     and ( not VarIsEmpty ( DeltaDS.FieldByName('INTENCAO_DESCARTE').NewValue ) )
     and  ( not VarIsNull  ( DeltaDS.FieldByName('INTENCAO_DESCARTE').NewValue ) )
     and  ( DeltaDS.FieldByName('INTENCAO_DESCARTE').NewValue = 'T' ) then
        TEventosAnimal.AddIntencaoDescarte( DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA').OldValue, Date );
  if ( SourceDS = sqlDescartes  ) then
    if ( UpdateKind = ukInsert ) then
      UpdateCalculoLactacao( DeltaDS.FieldByName('KZOO_ANIMAL' ).NewValue )
    else
      UpdateCalculoLactacao( DeltaDS.FieldByName('KZOO_ANIMAL' ).OldValue ) ;

end;


procedure TZoo_BancoDadosFemeaDatamodule.UpdateCalculoLactacao( const AKZOOANIMAL : string ) ;
const
  _EXECUTE_PROCEDURE_ZOO_RECALC_LACTACOES_ANIMAL =
    'EXECUTE PROCEDURE ZOO_RECALC_LACTACOES_ANIMAL %s' ;
var
  LProcedure : string ;
begin

  LProcedure := Format (
       _EXECUTE_PROCEDURE_ZOO_RECALC_LACTACOES_ANIMAL
     , [
         QuotedStr( AKZOOANIMAL )
       ]
  ) ;

  TTcAbstractDB
    .GetByAlias('ZOOTECNICO')
    .ExecuteDirect ( LProcedure ) ;

end;


procedure TZoo_BancoDadosFemeaDatamodule.dspAnimalBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
const
   UPDATE_ZOO_EVENTOS_ZOOTECNICOS =
            'UPDATE ZOO_EVENTOS_ZOOTECNICOS'
     +#13#10'   SET KZOO_ANIMAL_MACHO = :KZOO_ANIMAL_MACHO,'
     +#13#10'       KZOO_ANIMAL_MACHO_TOUROSEMEN = :KZOO_TOUROSEMEN '
     +#13#10' WHERE KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO '
     +#13#10'   AND TIPOEVENTO  <> :TIPO_EVENTO_ZOO_IMPLANTE';

   UPDATE_ZOO_ANIMAL_LINHAGEM =
            'UPDATE ZOO_ANIMAL_LINHAGEM '
     +#13#10'   SET KZOO_ANIMAL_MACHO = :KZOO_ANIMAL_MACHO,'
     +#13#10'       NOMEPAI = :NOMEPAI,'
     +#13#10'       REGISTROPAI = :REGISTROPAI,'
     +#13#10'       GRAUSANGUEPAI = :GRAUSANGUEPAI,'
     +#13#10'       COMPOSICAORACAPAI = :COMPOSICAORACAPAI'
     +#13#10' WHERE KZOO_EVENTO_ZOOTECNICO = :KZOO_EVENTO_ZOOTECNICO';

   DELETE_CRESCIMENTO_NASCIMENTO =
            'DELETE FROM ZOO_ANIMAL_CRESCIMENTO'
     +#13#10' WHERE KZOO_ANIMAL_CRESCIMENTO = :KZOO_ANIMAL_CRESCIMENTO';

   UPDATE_OR_INSERT_CRESCIMENTO_NASCIMENTO =
            'UPDATE OR INSERT INTO ZOO_ANIMAL_CRESCIMENTO (KZOO_ANIMAL_CRESCIMENTO, KZOO_ANIMAL, DATA, PESO, ALTURA)'
     +#13#10'   VALUES (:KZOO_ANIMAL_CRESCIMENTO, :KZOO_ANIMAL, :DATA, :PESO, :ALTURA)'
     +#13#10'MATCHING (KZOO_ANIMAL_CRESCIMENTO)';

    function GetValue(Field: TField): Variant;
    begin
      if ( Field.NewValue <> Unassigned ) {and
         ( ( ( (not VarIsEmpty(Field.NewValue)) and (not VarIsNull(Field.NewValue) ) ) ) )} then
        Result := Field.NewValue
      else
        Result := Field.OldValue;
    end;
var
  p : TParams;
begin

   if (SourceDS = sqlCrescimento) then
   begin
      Applied := True;
      if  ( ( ((DeltaDS.FieldByName('PESO').NewValue <> Unassigned) or (UpdateKind = ukInsert) ) and   ( (VarIsEmpty(DeltaDS.FieldByName('PESO').NewValue)) or (VarIsNull(DeltaDS.FieldByName('PESO').NewValue) ) ) ) and
          ( ((DeltaDS.FieldByName('ALTURA').NewValue <> Unassigned) or (UpdateKind = ukInsert)) and ( (VarIsEmpty(DeltaDS.FieldByName('ALTURA').NewValue)) or (VarIsNull(DeltaDS.FieldByName('ALTURA').NewValue) ) ) ) ) then
       begin
         p := TParams.Create;
         p.CreateParam( ftString, 'KZOO_ANIMAL_CRESCIMENTO',         ptInput ).AsString  := VarToStr( DeltaDS.FieldByName('KZOO_ANIMAL_CRESCIMENTO').OldValue );
         sqlAnimal.SQLConnection.Execute(DELETE_CRESCIMENTO_NASCIMENTO, p);
         p.Free;
       end
      else
      if  (UpdateKind <> ukDelete) and
          ((not VarIsEmpty( GetValue(DeltaDS.FieldByName('KZOO_ANIMAL_CRESCIMENTO'))  )) and (not VarIsNull(GetValue(DeltaDS.FieldByName('KZOO_ANIMAL_CRESCIMENTO'))) )) and
          ( ( ( (not VarIsEmpty(  GetValue(DeltaDS.FieldByName('PESO'))  )) and (not VarIsNull(  GetValue(DeltaDS.FieldByName('PESO'))  ) ) ) ) or
            ( ( (not VarIsEmpty(  GetValue(DeltaDS.FieldByName('ALTURA'))   )) and (not VarIsNull(  GetValue(DeltaDS.FieldByName('ALTURA'))  ) ) ) ) ) then
       begin
         p := TParams.Create;

         p.CreateParam( ftString, 'KZOO_ANIMAL_CRESCIMENTO',         ptInput ).AsString  := VarToStr(  GetValue(DeltaDS.FieldByName('KZOO_ANIMAL_CRESCIMENTO'))  );
         p.CreateParam( ftString, 'KZOO_ANIMAL',         ptInput ).AsString  := VarToStr(  GetValue(DeltaDS.FieldByName('KZOO_ANIMAL')) );
         p.CreateParam( ftTimestamp, 'DATA',         ptInput ).AsSQlTimestamp  := DateTimeToSqlTimestamp( VarToDateTime (  GetValue(DeltaDS.FieldByName('DATA'))  ));
         if ((not VarIsEmpty(  GetValue(DeltaDS.FieldByName('PESO') )) ) and (not VarIsNull(  GetValue(DeltaDS.FieldByName('PESO') )  ) )) then
           p.CreateParam( ftInteger, 'PESO',         ptInput ).AsInteger  := GetValue(DeltaDS.FieldByName('PESO') )
         else
           p.CreateParam( ftInteger, 'PESO',         ptInput ).Clear;

         if ((not VarIsEmpty( GetValue(DeltaDS.FieldByName('ALTURA'))   )) and (not VarIsNull( GetValue(DeltaDS.FieldByName('ALTURA'))   ) )) then
           p.CreateParam( ftInteger, 'ALTURA',         ptInput ).AsInteger  := GetValue(DeltaDS.FieldByName('ALTURA'))
         else
           p.CreateParam( ftInteger, 'ALTURA',         ptInput ).Clear;
         sqlAnimal.SQLConnection.Execute( UPDATE_OR_INSERT_CRESCIMENTO_NASCIMENTO, p );
         p.Free;
       end;
   end;


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

procedure TZoo_BancoDadosFemeaDatamodule.EditRecord;
begin
  FInsertOrUpdate := _UPDATE;
  inherited;

end;

function TZoo_BancoDadosFemeaDatamodule.IdadeAnoMes(Intervalo: integer): String;
var
  Ano, Mes : Integer;
begin
  Ano := 0 ;
  Mes := 0 ;

  Ano := Trunc (Intervalo / 12);
  Mes := (Intervalo mod 12);

  Result := IntToStr(Ano) + '/' + IntToStr(Mes) ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.NewRecord;
begin
  FInsertOrUpdate := _INSERT;
  inherited;

end;

procedure TZoo_BancoDadosFemeaDatamodule.SetPai(Key, Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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

procedure TZoo_BancoDadosFemeaDatamodule.SetComposicaoRacas;
begin
   if not ( cdsAnimal.State in [dsInsert, dsEdit] ) then
     cdsAnimal.Edit ;

   cdsAnimalCOMPOSICAORACA.asString := FGrauDeSangue.Raca ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.SetExibirDescartados(
  const Value: boolean);
begin
  FExibirDescartados := Value;
  cdsLstFemeas.Filtered := not FExibirDescartados ;
end;

procedure TZoo_BancoDadosFemeaDatamodule.SetKZOOANIMAL(const Value: string);
begin
  ExibirDescartados := Value <> '' ;
  FKZOOANIMAL := Value;
end;

procedure TZoo_BancoDadosFemeaDatamodule.SetMae(Key, Nome : string ; GrauSangue : string ; ComposicaoRaca : string ) ;
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

{ TIDadosAnimalFemea }

procedure TIDadosAnimalFemea.CheckConnection;
begin
  FIDBZootecnico := TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ) ;
  if not assigned ( FIDBZootecnico )  then
     Raise TcException.Create( UnitName, ClassName, 'CheckConnection',  'Não foi possível conectar o banco de dados Zootécnico');
end;

constructor TIDadosAnimalFemea.Create(AKZOO_ANIMALFEMEA: string ; ADBZootecnico : ITcAbstractDB );
begin
   FKZOO_ANIMALFEMEA := AKZOO_ANIMALFEMEA ;
end;

procedure TIDadosAnimalFemea.GetHasEventosZootecnicos;
const
  _SELECT_STMT ='SELECT ''T'' HAS FROM ZOO_EVENTOS_ZOOTECNICOS WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA ROWS 1' ;
var
  CDS : TClientDataSet ;
  p : TParams ;
begin
  try
    CheckConnection ;
    p := TParams.Create ;
    cds := nil ;
    try
      p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := FKZOO_ANIMALFEMEA ;
      FIDBZootecnico.populateClientDataSet( cds, _SELECT_STMT, p ) ;
      FHasEventosZootecnicos := cds.FieldByName('HAS').asBoolean ;
    Except On E: Exception do
      RaiseException ( E, UnitName, ClassName, 'GetHasEventosZootecnicos' ) ;
    end;
  finally
    p.Free ;
    if Assigned ( cds ) then
       cds.free ;
  end ;
end;

procedure TIDadosAnimalFemea.GetHasLactacoes;
const
  _SELECT_STMT ='SELECT ''T'' HAS FROM ZOO_LACTACOES WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA ROWS 1' ;
var
  CDS : TClientDataSet ;
  p : TParams ;
begin
  try
    CheckConnection ;
    p := TParams.Create ;
    cds := nil ;
    try
      p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := FKZOO_ANIMALFEMEA ;
      FIDBZootecnico.populateClientDataSet( cds, _SELECT_STMT, p ) ;
      FHasLactacoes := cds.FieldByName('HAS').asBoolean ;
    Except On E: Exception do
      RaiseException ( E, UnitName, ClassName, 'GetHasLactacoes' ) ;
    end;
  finally
    p.Free ;
    if Assigned ( cds ) then
       cds.free ;
  end ;
end;

procedure TIDadosAnimalFemea.GetIsLactante;
const
  _SELECT_STMT = 'SELECT ''T'' "IS"'
         +#13#10'   FROM ZOO_ANIMAIS_FEMEA AF'
         +#13#10'   LEFT JOIN ZOO_LACTACOES L ON L.KZOO_LACTACAO = AF.KULTIMA_LACTACAO'
         +#13#10'  WHERE AF.KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA'
         +#13#10'    AND L.KZOO_LACTACAO IS NOT NULL'
         +#13#10'    AND L.DATA_SECAGEM IS NULL' ;
var
  CDS : TClientDataSet ;
  p : TParams ;
begin
  try
    CheckConnection ;
    p := TParams.Create ;
    cds := nil ;
    try
      p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := FKZOO_ANIMALFEMEA ;
      FIDBZootecnico.populateClientDataSet( cds, _SELECT_STMT, p ) ;
      FIsLactante := cds.FieldByName('IS').asBoolean ;
    Except On E: Exception do
      RaiseException ( E, UnitName, ClassName, 'GetIsLactante' ) ;
    end;
  finally
    p.Free ;
    if Assigned ( cds ) then
       cds.free ;
  end ;
end;

function TIDadosAnimalFemea.HasEventosZootecnicos: boolean;
begin
   if VarIsEmpty ( FHasEventosZootecnicos ) then
      GetHasEventosZootecnicos ;
   Exit ( FHasEventosZootecnicos ) ;
end;

function TIDadosAnimalFemea.HasLactacoes: boolean;
begin
   if VarIsEmpty ( FHasLactacoes ) then
      GetHasLactacoes ;
   Exit ( FHasLactacoes )
end;

function TIDadosAnimalFemea.IsLactante: boolean;
begin
   if VarIsEmpty ( FIsLactante ) then
      GetIsLactante ;
   Exit ( FIsLactante )
end;

end.


