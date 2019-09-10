unit UZoo_ReproducaoCiosCoberturasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.Vcl.Dialogs,
  UdtmSYS_BASE, ClAg5ClientZootecnicoCommonTypes ;

{$define _IATF_MONTA}

type


  TZoo_ReproducaoCiosCoberturasDatamodule = class(T_dtmBASE)
    cdsEventosReprodutivos: TClientDataSet;
    dspEventosReprodutivos: TDataSetProvider;
    sqlEventosReprodutivos: TTcSQLDataSet;
    cdsTipoMuco: TClientDataSet;
    cdsTipoMucoTIPO: TStringField;
    cdsTipoMucoVALOR: TStringField;
    cdsTipoMucoDESCRICAO: TStringField;
    cdsTipoMucoORDEM: TIntegerField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    sqlEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField;
    sqlEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField;
    sqlEventosReprodutivosDATAEVENTO: TSQLTimeStampField;
    sqlEventosReprodutivosTIPOEVENTO: TIntegerField;
    sqlEventosReprodutivosDOSES: TIntegerField;
    sqlEventosReprodutivosMUCO: TIntegerField;
    sqlEventosReprodutivosKCAD_FUNCIONARIO: TStringField;
    cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsEventosReprodutivosKZOO_ANIMAL_FEMEA: TStringField;
    cdsEventosReprodutivosKZOO_ANIMAL_MACHO: TStringField;
    cdsEventosReprodutivosDATAEVENTO: TSQLTimeStampField;
    cdsEventosReprodutivosTIPOEVENTO: TIntegerField;
    cdsEventosReprodutivosDOSES: TIntegerField;
    cdsEventosReprodutivosMUCO: TIntegerField;
    cdsEventosReprodutivosKCAD_FUNCIONARIO: TStringField;
    cdsEventosReprodutivosBRINCO: TStringField;
    cdsEventosReprodutivosNOMEESTABULO: TStringField;
    cdsEventosReprodutivosDESC_EVENTO: TStringField;
    cdsEventosReprodutivosDESC_MUCO: TStringField;
    sqlEventosReprodutivosNOMEFUNCIONARIO: TStringField;
    cdsEventosReprodutivosNOMEFUNCIONARIO: TStringField;
    cdsEventosReprodutivosNOMEMACHO: TStringField;
    sqlEventosReprodutivosBRINCO: TStringField;
    sqlEventosReprodutivosNOMEESTABULO: TStringField;
    sqlEventosReprodutivosNOMEMACHO: TStringField;
    sqlEventosReprodutivosOBS_EVENTO: TMemoField;
    cdsEventosReprodutivosOBS_EVENTO: TMemoField;
    sqlEventosReprodutivosKULTIMA_MONTA: TStringField;
    cdsEventosReprodutivosKULTIMA_MONTA: TStringField;
    sqlEventosReprodutivosABRIRLACTACAO: TStringField;
    sqlEventosReprodutivosULTIMA_MONTA: TSQLTimeStampField;
    cdsEventosReprodutivosABRIRLACTACAO: TStringField;
    cdsEventosReprodutivosULTIMA_MONTA: TSQLTimeStampField;
    cdsTipoMucoPadrao: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    cdsTipoEventoPadrao: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    sqlEventosReprodutivosPRENHEZ: TStringField;
    cdsEventosReprodutivosPRENHEZ: TStringField;
    cdsContaEstoque: TClientDataSet;
    cdsContaEstoqueKZOO_ANIMAL: TStringField;
    cdsContaEstoqueQTDEESTOQUE: TIntegerField;
    cdsContaEstoqueQTDEUSADA: TIntegerField;
    cdsContaEstoqueNOMEMACHO: TStringField;
    cdsEventosReprodutivosTipoMacho: TIntegerField;
    sqlEventosReprodutivosLOTE: TStringField;
    cdsEventosReprodutivosLOTE: TStringField;
    cdsProtocolosIATF: TClientDataSet;
    cdsProtocolosIATFKZOO_PROTOCOLO: TStringField;
    cdsProtocolosIATFCODIGO: TStringField;
    cdsEventosReprodutivosIATF: TStringField;
    cdsEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField;
    cdsEventosReprodutivosDESC_PROTOCOLO_IATF: TStringField;
    sqlEventosReprodutivosIATF: TStringField;
    sqlEventosReprodutivosKZOO_PROTOCOLO_IATF: TStringField;
    cdsProtocolosIATFPadrao: TClientDataSet;
    cdsProtocolosIATFPadraoKZOO_PROTOCOLO: TStringField;
    cdsProtocolosIATFPadraoCODIGO: TStringField;
    sqlEventosReprodutivosBRINCO_: TStringField;
    cdsEventosReprodutivosBRINCO_: TStringField;
    DataSource1: TDataSource;
    sqlEventosReprodutivosDOADOR_RECEPTOR: TIntegerField;
    cdsEventosReprodutivosDOADOR_RECEPTOR: TIntegerField;
    procedure cdsEventosReprodutivosNewRecord(DataSet: TDataSet);
    procedure cdsEventosReprodutivosBeforePost(DataSet: TDataSet);
    procedure cdsEventosReprodutivosNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsEventosReprodutivosNOMEMACHOSetText(Sender: TField; const Text: string);
    procedure cdsEventosReprodutivosNOMEMACHOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsEventosReprodutivosNOMEFUNCIONARIOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsEventosReprodutivosDOSESGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dspEventosReprodutivosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspEventosReprodutivosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsEventosReprodutivosTIPOEVENTOSetText(Sender: TField;
      const Text: string);
    procedure cdsEventosReprodutivosIATFValidate(Sender: TField);
    procedure cdsEventosReprodutivosIATFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cdsEventosReprodutivosTIPOEVENTOValidate(Sender: TField);
    procedure dspEventosReprodutivosAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    FUseQuickInput: boolean;
    FAskChangeDoadoraReceptoraBeforeProcess: Boolean;
    { Private declarations }
    procedure InitTable ;
    function VerificaDataEventos(Data:TDateTime; pkAnimal:String) : Boolean;
    procedure SetUseQuickInput(const Value: boolean);
    function CheckDoadoraReceptora : Boolean;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure SetPeriodo ( DataInicial, DataFinal : TDateTime ) ;
    function AddBrinco ( ABrinco : string ; AKMacho, ANomeAnimalMacho : string ; ATipoMacho : TTipoMacho ;  ADataEvento : TDateTime ; ATipoEvento, ADoses, AMuco : integer  ; AKFuncionario : string ; ANomeFuncionario : string ; IATF : boolean ; KPROTOCOLO_IATF : string  ) : boolean ;
    function AddByKey ( AKey : string ; AKMacho, ANomeAnimalMacho : string ; ATipoMacho : TTipoMacho ;  ADataEvento : TDateTime ; ATipoEvento, ADoses, AMuco : integer ; AKFuncionario : string ; ANomeFuncionario : string  ; IATF : boolean ; KPROTOCOLO_IATF : string ) : boolean ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure SetEvento( ATipoEvento: Integer );
    procedure SetMacho ( AKMacho, ANomeMacho : string  ; ATipoMacho : TTipoMacho; ATipoEvento: Integer );
    procedure ApplyUpdates ; override ;
    procedure RemoveEvento ;
    procedure AbrirLactacao(Abrir: Boolean) ;
    procedure GetDadosAborto ( out isPrimipara : boolean ; out ADiasPrimipara, ADiasMultipara: integer);
    procedure GetEstoqueNegativo ( List : TStringList ) ;
    function  GetDSA : boolean ;
    procedure SetDSA  ;
    property UseQuickInput : boolean  read FUseQuickInput write SetUseQuickInput;
  end;

implementation

uses UDBZootecnico, Tc.DBRTL.AbstractDB,
     Exceptions,
     Data.SQLTimSt, DateUtils , CLAg5Types, CDSSuppl,
     DiagnosticosAnimalClass,
     ClAg5ClientCommonTypes ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_ReproducaoCiosCoberturasDatamodule.OpenTables;
const
  _SQL_PROTOCOLO_IATF =
         'SELECT '''' AS KZOO_PROTOCOLO, CAST('''' AS VARCHAR(32)) AS CODIGO FROM RDB$DATABASE'
  +#13#10'UNION ALL'
  +#13#10'SELECT KZOO_PROTOCOLO, CODIGO FROM ZOO_PROTOCOLOS WHERE TIPOPROTOCOLO = :TIPOPROTOCOLO';

var
  p : TParams ;
begin
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEventoPadrao );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_MUCO, cdsTipoMucoPadrao );

  p := TParams.Create ;
  p.CreateParam(ftInteger, 'TIPOPROTOCOLO', ptInput ).AsInteger :=  _ST_TIPO_PROTOCOLO_IATF ;
  DBResources['ZOOTECNICO'].PopulateClientDataSet( cdsProtocolosIATFPadrao, _SQL_PROTOCOLO_IATF, p ) ;
  p.DisposeOf ;


  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_MUCO, cdsTipoMuco );

  p := TParams.Create ;
  p.CreateParam(ftInteger, 'TIPOPROTOCOLO', ptInput ).AsInteger :=  _ST_TIPO_PROTOCOLO_IATF ;
  DBResources['ZOOTECNICO'].PopulateClientDataSet( cdsProtocolosIATF, _SQL_PROTOCOLO_IATF, p ) ;
  p.DisposeOf ;

  InitTable ;
  FAskChangeDoadoraReceptoraBeforeProcess := False;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.RemoveEvento;
begin
   if not cdsEventosReprodutivos.isEmpty then
      begin
        cdsEventosReprodutivos.Delete ;
      end;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetDSA;
begin
    TFazendaParams.SetDSA_ESTQ_MACHO ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetEvento(
  ATipoEvento: Integer);
begin
   if cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.IsNull then
     Exit;

   if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
      cdsEventosReprodutivos.Edit ;
   cdsEventosReprodutivosTIPOEVENTO.AsInteger  := ATipoEvento ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
   if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
      cdsEventosReprodutivos.Edit ;
   cdsEventosReprodutivosNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
   cdsEventosReprodutivosKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetMacho( AKMacho, ANomeMacho : string  ; ATipoMacho : TTipoMacho; ATipoEvento: Integer );
var
  LControlsDisabled : Boolean;
begin
   if cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.IsNull then
   begin
     raise Warning.Create('Animal fêmea deve ser informado' );
   end;

   try
     LControlsDisabled := cdsEventosReprodutivos.ControlsDisabled;
     cdsEventosReprodutivos.DisableControls;
     if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
        cdsEventosReprodutivos.Edit;
     cdsEventosReprodutivosNOMEMACHO.AsString  := ANomeMacho ;
     cdsEventosReprodutivosNOMEMACHO.Text      := ANomeMacho ;
     cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString := AKMacho ;
     cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( ATipoMacho ) + 1 ;
     cdsEventosReprodutivosTIPOEVENTO.AsInteger  := ATipoEvento ;

     if (Trim( cdsEventosReprodutivosDESC_PROTOCOLO_IATF.AsString ) <> '') and
       (not cdsEventosReprodutivosDESC_PROTOCOLO_IATF.IsNull) then
       cdsEventosReprodutivosIATF.AsString := 'T'
     else
       cdsEventosReprodutivosIATF.AsString := 'F';


     if cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString = '' then
      begin
        cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear;
      end;

     if cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA then
        cdsEventosReprodutivosDOSES.AsInteger := 1;

     if (not CheckDoadoraReceptora) then
      begin
        cdsEventosReprodutivos.Cancel;
      end
     else
      begin
        cdsEventosReprodutivos.BeforePost := nil;
        cdsEventosReprodutivos.Post;
        cdsEventosReprodutivos.BeforePost := cdsEventosReprodutivosBeforePost;
        if not ( cdsEventosReprodutivos.State in [dsInsert, dsEdit] ) then
          cdsEventosReprodutivos.Edit ;
      end;

   finally
      if (not LControlsDisabled) or (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_CIO) then
        cdsEventosReprodutivos.EnableControls;
   end;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetPeriodo(DataInicial, DataFinal: TDateTime);
begin
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.SetUseQuickInput(
  const Value: boolean);
begin
  FUseQuickInput := Value;
end;

function TZoo_ReproducaoCiosCoberturasDatamodule.VerificaDataEventos(
  Data: TDateTime; pkAnimal:String) : Boolean;
var
p : TParams;
cds : TClientDataSet;
sql : String;
begin

  sql :='SELECT'
+#13#10' E.DATAEVENTO'
+#13#10' FROM ZOO_EVENTOS_ZOOTECNICOS E'
+#13#10' WHERE E.KZOO_ANIMAL_FEMEA = :PK'
+#13#10' AND E.DATAEVENTO > :DATA';

    p := TParams.Create ;
    p.CreateParam ( ftString,   'PK',      ptInput ).asString := pkAnimal ;
    p.CreateParam ( ftDateTime, 'DATA',    ptInput ).asDateTime := Data;

    cds := nil;

    try

      TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, sql, p );

      if (cds.RecordCount = 0) then
        Result := True
      else
        Result := False;

    finally
      cds.free;
      p.free;
    end;

end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.AbrirLactacao(Abrir: Boolean) ;
begin
  cdsEventosReprodutivos.Edit ;
  if Abrir then
    cdsEventosReprodutivosABRIRLACTACAO.AsString := 'T'
  else
    cdsEventosReprodutivosABRIRLACTACAO.AsString := 'F';
//  cdsEventosReprodutivos.Post ;
end;

function TZoo_ReproducaoCiosCoberturasDatamodule.AddBrinco(ABrinco: string ; AKMacho, ANomeAnimalMacho : string ; ATipoMacho : TTipoMacho ;  ADataEvento : TDateTime ; ATipoEvento, ADoses, AMuco : integer  ; AKFuncionario : string ; ANomeFuncionario : string ; IATF : boolean ; KPROTOCOLO_IATF : string  ) : boolean ;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsEventosReprodutivos.Edit ;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKey ( KeyAnimal, AKMacho, ANomeAnimalMacho, ATipoMacho, ADataEvento, ATipoEvento, ADoses, AMuco, AKFuncionario, ANomeFuncionario, IATF, KPROTOCOLO_IATF )  ;
end;


function TZoo_ReproducaoCiosCoberturasDatamodule.AddByKey ( AKey : string ; AKMacho, ANomeAnimalMacho : string ; ATipoMacho : TTipoMacho ; ADataEvento : TDateTime ; ATipoEvento, ADoses, AMuco : integer  ; AKFuncionario : string ; ANomeFuncionario : string ; IATF : boolean ; KPROTOCOLO_IATF : string ) : boolean ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKey ;
    cds := nil ;

    cdsEventosReprodutivos.DisableControls ;

    try
//     DBResources['ZOOTECNICO'].populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
                'A.KZOO_ANIMAL, A.BRINCO, A.BRINCO_, A.NOMEESTABULO, A.STATUS, F.LOTE,'
        + #13#10'IIF ( E.ABORTOPARTO IS NULL, F.KULTIMA_MONTA, NULL ) KULTIMA_MONTA, F.ULTIMA_MONTA, E.PRENHEZ, F.DOADOR_RECEPTOR '
        + #13#10'FROM ZOO_ANIMAIS A'
        + #13#10'INNER JOIN ZOO_ANIMAIS_FEMEA F ON F.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL'
        + #13#10'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = F.KULTIMA_MONTA'
        + #13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_FEMEA_BEZERRO ) then
         raise Warning.Create('Não é possível lançar eventos reprodutivos para bezerro(a)');

       with cds do
         begin

           cdsEventosReprodutivos.Append ;
           GetKey ( cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO ) ;
           cdsEventosReprodutivosBRINCO.asString                   := fieldByName ( 'BRINCO' ).asString ;
           cdsEventosReprodutivosBRINCO_.asString                  := fieldByName ( 'BRINCO_' ).asString ;
           cdsEventosReprodutivosNOMEESTABULO.asString             := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString        := fieldByName ( 'KZOO_ANIMAL' ).asString ;
           cdsEventosReprodutivosLOTE.asString                     := fieldByName ( 'LOTE' ).asString ;
           cdsEventosReprodutivosABRIRLACTACAO.asString            := 'F' ;
           cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger         := FieldByName ( 'DOADOR_RECEPTOR' ).AsInteger;

           if not fieldByName ( 'KULTIMA_MONTA' ).isNull then
             begin
              cdsEventosReprodutivosKULTIMA_MONTA.asString    := fieldByName ( 'KULTIMA_MONTA' ).asString ;
              cdsEventosReprodutivosULTIMA_MONTA.asDateTime   := fieldByName ( 'ULTIMA_MONTA' ).asDateTime ;
              cdsEventosReprodutivosPRENHEZ.asString          := fieldByName ( 'PRENHEZ' ).asString ;
             end;
           //cdsEventosReprodutivosDATAEVENTO.Clear       ;
         end;

         if not FUseQuickInput then
           begin
              if Trunc( ADataEvento ) > 0 then
                cdsEventosReprodutivosDATAEVENTO.asDateTime     :=  ADataEvento
              else
                cdsEventosReprodutivosDATAEVENTO.asDateTime  := cdsEventosReprodutivosULTIMA_MONTA.asDateTime + 1 ;
             cdsEventosReprodutivosTIPOEVENTO.asInteger      := ATipoEvento ;
//             cdsEventosReprodutivosKCAD_FUNCIONARIO.asString := 'x' ;
             if Trim ( AKMacho ) = '' then
              begin
                 cdsEventosReprodutivosNOMEMACHO.Clear;
                 cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
                 cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmUndefined ) + 1 ;
              end
             else
              begin
                 cdsEventosReprodutivosNOMEMACHO.asString                := ANomeAnimalMacho ;
                 cdsEventosReprodutivosNOMEMACHO.Text                    := ANomeAnimalMacho ;
                 cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString        := AKMacho ;
                 cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( ATipoMacho ) + 1 ;
              end;

             cdsEventosReprodutivosIATF.asString             := 'F' ;


             cdsEventosReprodutivos.BeforePost := nil ;
             cdsEventosReprodutivos.Post ;
             cdsEventosReprodutivos.BeforePost := cdsEventosReprodutivosBeforePost ;
             cdsEventosReprodutivos.Edit ;
             cdsEventosReprodutivosTIPOEVENTO.Clear       ;
             cdsEventosReprodutivosDATAEVENTO.Clear       ;

             cdsEventosReprodutivosIATF.Clear             ;
             cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
             exit ;
           end;

       with cds do
         begin
           if Trim ( AKMacho ) = '' then
              begin
                 cdsEventosReprodutivosNOMEMACHO.Clear;
                 cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
                 cdsEventosReprodutivosNOMEMACHO.Text                    := '' ;
                 cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmUndefined ) + 1 ;
              end
           else
              begin
                 cdsEventosReprodutivosNOMEMACHO.asString                := ANomeAnimalMacho ;
                 cdsEventosReprodutivosNOMEMACHO.Text                    := ANomeAnimalMacho ;
                 cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString        := AKMacho ;
                 cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( ATipoMacho ) + 1 ;
              end;

           if Trunc(ADataEvento) = 0 then
             ADataEvento := Date;
           cdsEventosReprodutivosDATAEVENTO.asDateTime     := ADataEvento;

           cdsEventosReprodutivosTIPOEVENTO.asInteger      := ATipoEvento ;

           if ( ATipoEvento = 2 {INSEMINA} ) then
              cdsEventosReprodutivosDOSES.asInteger                := ADoses ;

           if AMuco <> -1 then
             cdsEventosReprodutivosMUCO.asInteger                    := AMuco ;

           if Trim ( AKFuncionario ) = '' then
             begin
              cdsEventosReprodutivosNOMEFUNCIONARIO.Clear ;
              cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
             end
           else
             begin
              cdsEventosReprodutivosNOMEFUNCIONARIO.Text          := ANomeFuncionario ;
              cdsEventosReprodutivosKCAD_FUNCIONARIO.asString     := AKFuncionario ;
             end ;

           cdsEventosReprodutivosIATF.asString             := 'F' ;
           if (   ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA )
               {$IFDEF _IATF_MONTA }
               or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA    ) // added
               {$ENDIF _IATF_MONTA}
               or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
              ) and ( IATF ) then
             begin
               cdsEventosReprodutivosIATF.asString    := 'T' ;
               cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.asString    := KPROTOCOLO_IATF
             end;

           cdsEventosReprodutivos.BeforePost := nil ;
           cdsEventosReprodutivos.Post ;
           cdsEventosReprodutivos.BeforePost := cdsEventosReprodutivosBeforePost ;
           cdsEventosReprodutivos.Edit ;
          // cdsEventosReprodutivosTIPOEVENTO.Clear       ;
          // cdsEventosReprodutivosDATAEVENTO.Clear       ;

         end

    finally
       cdsEventosReprodutivos.EnableControls ;
       cds.Free ;
       p.free ;
    end;


end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.ApplyUpdates;
begin
     CDSSuppl.TCDSSuppl.PostIfNeed( cdsEventosReprodutivos ) ;
     CDSSuppl.TCDSSuppl.ApplyUpdates( cdsEventosReprodutivos ) ;
     ReOpenTables;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosBeforePost(DataSet: TDataSet);
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;


  if ( cdsEventosReprodutivosDATAEVENTO.asDateTime = 0 ) {or ( cdsEventosReprodutivosDATAEVENTO.asDateTime < ( date - 30  ) )} then
//     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;
     AddErr ( 'Data - inválida' ) ;

  if ( cdsEventosReprodutivosDATAEVENTO.asDateTime >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if not( VerificaDataEventos(cdsEventosReprodutivosDATAEVENTO.AsDateTime,cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.AsString)) then
     AddErr ( 'Existem eventos posteriores ao dia '+cdsEventosReprodutivosDATAEVENTO.AsString) ;

  if cdsEventosReprodutivosTIPOEVENTO.asInteger = 0 then
     AddErr ( 'Evento' ) ;

  case cdsEventosReprodutivosTIPOEVENTO.asInteger of
    _ST_TIPO_EVENTO_ZOO_CIO :
       begin
//         if Trim( cdsEventosReprodutivosKCAD_FUNCIONARIO.asString ) = '' then
//            AddErr ( 'Funcionário obrigatório' ) ;
       end ;

    _ST_TIPO_EVENTO_ZOO_INSEMINA :
      begin
         if ( cdsEventosReprodutivosDOSES.asInteger < 1 ) then
             AddErr ( 'inseminação - Doses para o evento' ) ;
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
            AddErr ( 'inseminação - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger -1 ) <> tmSemen then
            AddErr ( 'inseminação - O macho selecionado não é um semen' ) ;
         if  ( cdsEventosReprodutivosIATF.asBoolean )
         and ( cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.isNull ) then
            AddErr ( 'inseminação - Indicar o protocolo de IATF' ) ;
      end ;

    _ST_TIPO_EVENTO_ZOO_MONTA :
      begin
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
            AddErr ( 'monta - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger - 1 ) <> tmTouro then
            AddErr ( 'monta - O macho selecionado não é um touro' ) ;
      end ;

    _ST_TIPO_EVENTO_ZOO_IMPLANTE :
      begin
         if Trim ( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString ) = '' then
            AddErr ( 'implante - Macho obrigatório' ) ;
         if TTipoMacho ( cdsEventosReprodutivosTIPOMACHO.asInteger - 1 ) <> tmEmbriao then
            AddErr ( 'implante - O macho selecionado não é um embrião' ) ;
//         if Trim( cdsEventosReprodutivosKCAD_FUNCIONARIO.asString ) = '' then
//            AddErr ( 'implante - Funcionário obrigatório' ) ;
         if  ( cdsEventosReprodutivosIATF.asBoolean )
         and ( cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.isNull ) then
            AddErr ( 'inseminação - Indicar o protocolo de IATF' ) ;
      end ;
  end ;

// -  este if nao faz sentido, nunca sera null
//  if VarIsNull ( cdsEventosReprodutivosMUCO.asInteger = 0  ) then
//     AddErr ( 'Muco' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos para o registro atual'#13#10#13#10 + ErrMsg );

(*-- removido a pedido do augusto, conforme email.
  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_CIO )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) ) then
     begin
             cdsEventosReprodutivosNOMEFUNCIONARIO.Clear ;
             cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
     end ;
*)
  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
        cdsEventosReprodutivosDOSES.Clear ;

 (* if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
     {$IFDEF _IATF_MONTA}
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA    ) // added
     {$ENDIF _IATF_MONTA}
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
     begin
             cdsEventosReprodutivosIATF.asString := 'F' ;
     end ;                        *)
  if (Trim( cdsEventosReprodutivosDESC_PROTOCOLO_IATF.AsString ) = '') then
    cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.Clear;

  if (Trim( cdsEventosReprodutivosDESC_PROTOCOLO_IATF.AsString ) <> '') and
     (not cdsEventosReprodutivosDESC_PROTOCOLO_IATF.IsNull) then
    cdsEventosReprodutivosIATF.AsString := 'T'
  else
    cdsEventosReprodutivosIATF.AsString := 'F';

  if not (
        ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) ) then
     begin
             cdsEventosReprodutivosNOMEMACHO.Clear ;
             cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
     end ;

  {if (not FAskChangeDoadoraReceptoraBeforeProcess) and (not CheckDoadoraReceptora) then
   begin
    cdsEventosReprodutivos.Cancel;
    Abort;
   end;}

end;


procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosDOSESGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) then
     Text := cdsEventosReprodutivosDOSES.asString ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosIATFGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
     begin
       if Sender.DataSet.IsEmpty then
          exit ;
       if not (( Sender.IsNull ) or ( Sender.asString = '' ))  then
         begin
          if Sender.AsBoolean then
             Text := 'Sim'
          else
            Text := 'Não'
         end;
     end
  else
    Text := Sender.asString ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosIATFValidate(
  Sender: TField);
begin
   if not Sender.asBoolean then
      cdsEventosReprodutivosKZOO_PROTOCOLO_IATF.Clear ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNewRecord(DataSet: TDataSet);
const
  _SELECT_DOADOR_RECEPTOR = 'SELECT DOADOR_RECEPTOR FROM ZOO_ANIMAIS_FEMEA WHERE KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA';
var
 p : TParams ;
 cds : TClientDataSet ;
begin
  self.InitializeKeys ;
  cdsEventosReprodutivosIATF.asString := 'F' ;
  cdsEventosReprodutivosTIPOMACHO.asInteger := Ord ( tmUndefined ) + 1 ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL_FEMEA', ptInput ).asString := cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.asString ;
  cds :=  nil ;
  DBResources['ZOOTECNICO'].populateClientDataSet ( cds, _SELECT_DOADOR_RECEPTOR, p ) ;
  cdsEventosReprodutivosDOADOR_RECEPTOR.asInteger := cds.FieldByName ( 'DOADOR_RECEPTOR' ).asInteger ;
  cds.Free;
  p.free ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEFUNCIONARIOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

// removido a verificacao, conforme solicitado nas especificacoes.

//   if  ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_CIO )
//     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )  then
        Text := cdsEventosReprodutivosNOMEFUNCIONARIO.asString ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsEventosReprodutivosKCAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if    ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA )
     or ( cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) then
        Text := cdsEventosReprodutivosNOMEMACHO.asString ;

end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosNOMEMACHOSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := Text ;
  cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTOSetText(
  Sender: TField; const Text: string);
begin
   //self.cdsEventosReprodutivosKZOO_ANIMAL_MACHO.Clear ;
   Sender.AsString := Text ;
//   self.cdsEventosReprodutivosNOMEMACHO.Clear
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.cdsEventosReprodutivosTIPOEVENTOValidate(
  Sender: TField);
begin
  if (cdsEventosReprodutivosTIPOEVENTO.AsInteger <> _ST_TIPO_EVENTO_ZOO_CIO) and
     (not cdsEventosReprodutivosTIPOEVENTO.IsNull) and
     (cdsEventosReprodutivosKZOO_ANIMAL_MACHO.AsString = '') then
   begin
     raise Warning.Create('Touro/Embrião deve ser selecionado');
   end;
end;

function TZoo_ReproducaoCiosCoberturasDatamodule.CheckDoadoraReceptora: Boolean;
begin
  Result := True;
  if ( not cdsEventosReprodutivosPRENHEZ.IsNull ) and ( cdsEventosReprodutivosPRENHEZ.AsString <> '' ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger =  _ST_TIPO_DOADOR_RECEPTOR_DOADOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas com diagnóstico de gestação serão desmarcadas como Doadoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end
  else
  if ( cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger <>  _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas com transferência de embrião serão marcadas como Receptoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end
  else
  if ( (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA) or
       (cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_MONTA) ) and
     ( cdsEventosReprodutivosDOADOR_RECEPTOR.AsInteger =  _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR ) then
   begin
     Result :=
     MessageDlg (
         Format ( 'Fêmeas receptoras cobertas por touro ou inseminadas serão desmarcadas como Receptoras.', [ ] )
        +#13#10'Deseja continuar?', mtWarning, [mbYes, mbNo] ) = mrYes
   end;
end;


procedure TZoo_ReproducaoCiosCoberturasDatamodule.DataSource1DataChange(
  Sender: TObject; Field: TField);
begin
  if Field = cdsEventosReprodutivosTIPOEVENTO then
    begin
      if cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA then
       begin
        if cdsEventosReprodutivosDOSES.asInteger < 1 then
           cdsEventosReprodutivosDOSES.asInteger := 1 ;
       end
      else
        cdsEventosReprodutivosDOSES.Clear ;

    // if (  ( cdsEventosReprodutivosTIPOEVENTO.asInteger <> _ST_TIPO_EVENTO_ZOO_CIO )
    //   and ( cdsEventosReprodutivosTIPOEVENTO.asInteger <> _ST_TIPO_EVENTO_ZOO_IMPLANTE )
    //   and ( cdsEventosReprodutivosNOMEFUNCIONARIO.Text <> '' ) ) then
    //        cdsEventosReprodutivosNOMEFUNCIONARIO.Text := '' ;

    end;

end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.dspEventosReprodutivosAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
var
 LPrenhez, LTipoEvento: String;
begin
   if (UpdateKind= ukDelete) then
      exit ;

   if    ( SourceDS = sqlEventosReprodutivos ) then
     begin

          if (VarISNull(DeltaDS.FieldByName('PRENHEZ').NewValue)) or
             (VarIsEmpty(DeltaDS.FieldByName('PRENHEZ').NewValue)) then
             LPrenhez := 'NULL'
          else
             LPrenhez := QuotedStr(DeltaDS.FieldByName('PRENHEZ').NewValue);

          if (VarISNull(DeltaDS.FieldByName('TIPOEVENTO').NewValue)) or
             (VarIsEmpty(DeltaDS.FieldByName('TIPOEVENTO').NewValue)) then
             LTipoEvento := '-1'
          else
             LTipoEvento := DeltaDS.FieldByName('TIPOEVENTO').NewValue;

          // Atualiza o status de doadora e receptora do animal de acorodo com o tipo do evento
          DBResources['ZOOTECNICO'].ExecuteDirect(Format(' EXECUTE PROCEDURE ZOO_UPDATE_DOADORA_RECEPTORA %s, %s, %s' ,
                                    [ QuotedStr(DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA').OldValue)
                                    , LTipoEvento
                                    , LPrenhez]));
     end;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.dspEventosReprodutivosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  LKAnimalFemea : string ;
  LKUltimaMonta : string ;
  LDataEvento : TDateTime ;
begin

   Applied := False ;

   LKAnimalFemea := DeltaDS.FieldByName( 'KZOO_ANIMAL_FEMEA' ).AsString ;
   LKUltimaMonta := DeltaDS.FieldByName( 'KULTIMA_MONTA' ).AsString ;
   LDataEvento   := DeltaDS.FieldByName( 'DATAEVENTO' ).asDateTime  ;

   case DeltaDS.FieldByName( 'TIPOEVENTO' ).asInteger  of
     _ST_TIPO_EVENTO_ZOO_CIO      :  DiagnosticosAnimalClass.TEventosAnimal.AddCio           ( LKAnimalFemea, LDataEvento ) ;
     _ST_TIPO_EVENTO_ZOO_INSEMINA :  DiagnosticosAnimalClass.TEventosAnimal.AddInseminacao   ( LKAnimalFemea, LDataEvento ) ;
     _ST_TIPO_EVENTO_ZOO_MONTA    :  DiagnosticosAnimalClass.TEventosAnimal.AddMonta         ( LKAnimalFemea, LDataEvento ) ;
     _ST_TIPO_EVENTO_ZOO_IMPLANTE :  DiagnosticosAnimalClass.TEventosAnimal.AddImplante      ( LKAnimalFemea, LDataEvento ) ;
   end;

   if   ( Trim ( LKUltimaMonta ) = '' )
     or ( DeltaDS.FieldByName( 'PRENHEZ' ).asString <> 'T' ) then
      exit ;

   TAnimalFemea.AbortoSemParto(
      LoggedUser.DomainID,
      LKAnimalFemea,
      LKUltimaMonta,
      LDataEvento -1,
      DeltaDS.FieldByName( 'ABRIRLACTACAO' ).asBoolean ) ;

end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.dspEventosReprodutivosGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
   TableName := 'ZOO_EVENTOS_ZOOTECNICOS' ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.GetDadosAborto(out isPrimipara : boolean ; out ADiasPrimipara, ADiasMultipara: integer);
begin
  isPrimipara := TAnimalFemea.isPrimipara( cdsEventosReprodutivosKZOO_ANIMAL_FEMEA.AsString ) ;
  TParamMatriz.GetParam(LoggedUser.DomainID,  _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, ADiasPrimipara, ADiasMultipara ) ;
end;

function TZoo_ReproducaoCiosCoberturasDatamodule.GetDSA: boolean;
begin
   Result := TFazendaParams.GetDSA_ESTQ_MACHO ;
end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.GetEstoqueNegativo( List: TStringList ) ;

   function Update ( AQtdeUsada : integer ) : boolean ;
   begin
     Result := cdsContaEstoque.Locate('KZOO_ANIMAL', cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString, [] ) ;

     if not Result then
       exit ;

     cdsContaEstoque.Edit ;
     cdsContaEstoqueQTDEUSADA.AsInteger := cdsContaEstoqueQTDEUSADA.AsInteger + AQtdeUsada ;
     cdsContaEstoque.Post  ;
   end ;

   procedure AddRecord ( AEstoque, AQtdeUsada : integer ) ;
   begin
     cdsContaEstoque.Append ;
     cdsContaEstoqueKZOO_ANIMAL.AsString  := cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString ;
     cdsContaEstoqueNOMEMACHO .AsString   := cdsEventosReprodutivosNOMEMACHO.asString ;
     cdsContaEstoqueQTDEESTOQUE.AsInteger := AEstoque ;
     cdsContaEstoqueQTDEUSADA.AsInteger   := AQtdeUsada ;
     cdsContaEstoque.Post ;
   end;

begin

   TCDSSuppl.PostIfNeed ( cdsEventosReprodutivos ) ;
   TCDSSuppl.CreateDataSet( cdsContaEstoque ) ;

   try

     with cdsEventosReprodutivos do
       begin
          first ;
          while not eof do
            begin
              if ( cdsEventosReprodutivosTIPOEVENTO.AsInteger =_ST_TIPO_EVENTO_ZOO_INSEMINA )
                 and not Update ( cdsEventosReprodutivosDOSES.AsInteger ) then
                     AddRecord ( TAnimalMacho.GetEstoque( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString ), cdsEventosReprodutivosDOSES.AsInteger )
              else if ( cdsEventosReprodutivosTIPOEVENTO.AsInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE )
                 and not Update ( 1 ) then
                    AddRecord ( TAnimalEmbriao.GetEstoque( cdsEventosReprodutivosKZOO_ANIMAL_MACHO.asString ), 1 ) ;
              next ;
            end;
       end;

     with cdsContaEstoque do
       begin
          first ;
          while not eof do
            begin
              if (  cdsContaEstoqueQTDEESTOQUE.AsInteger - cdsContaEstoqueQTDEUSADA.AsInteger ) < 0 then
                 List.Add( Format ( '%s = %d',
                    [ cdsContaEstoqueNOMEMACHO.asString,
                      cdsContaEstoqueQTDEESTOQUE.AsInteger - cdsContaEstoqueQTDEUSADA.AsInteger ] ) ) ;
              next ;
            end;
       end;

   finally
      cdsContaEstoque.emptyDataSet ;
      cdsContaEstoque.Close ;
   end ;

end;

procedure TZoo_ReproducaoCiosCoberturasDatamodule.InitTable;
begin
// cdsEventosReprodutivos.Close ;
 TCDSSuppl.Open (  cdsEventosReprodutivos ) ;

// cdsEventosReprodutivos.IndexFieldNames := 'BRINCO_' ; -- removido a pedido do JM, seguir ordem de digitação
end;

function TZoo_ReproducaoCiosCoberturasDatamodule.LocateBrinco(ABrinco: string): boolean;
begin
   Result := cdsEventosReprodutivos.Locate( 'BRINCO', ABrinco, [] ) ;
end;

end.
