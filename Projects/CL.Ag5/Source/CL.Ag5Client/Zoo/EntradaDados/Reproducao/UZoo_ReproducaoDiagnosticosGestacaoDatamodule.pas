unit UZoo_ReproducaoDiagnosticosGestacaoDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UdtmSYS_BASE, Tc.DBRTL.AbstractDB, Tc.VCL.Form, GuidSuppl, Tc.VCL.Application, Dialogs;

type
  TZoo_ReproducaoDiagnosticosGestacaoDatamodule = class(T_dtmBASE)
    cdsDiagGestacao: TClientDataSet;
    dspDiagGestacao: TDataSetProvider;
    sqlDiagGestacao: TTcSQLDataSet;
    sqlDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    sqlDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField;
    cdsDiagGestacaoKZOO_EVENTO_ZOOTECNICO: TStringField;
    cdsDiagGestacaoKZOO_ANIMAL_FEMEA: TStringField;
    sqlDiagGestacaoBRINCOFEMEA: TStringField;
    sqlDiagGestacaoNOMEFEMEA: TStringField;
    sqlDiagGestacaoNOMEMACHO: TStringField;
    sqlDiagGestacaoPRENHEZ: TStringField;
    sqlDiagGestacaoREEXAMINAR: TStringField;
    sqlDiagGestacaoDATATOQUE: TSQLTimeStampField;
    cdsDiagGestacaoBRINCOFEMEA: TStringField;
    cdsDiagGestacaoNOMEFEMEA: TStringField;
    cdsDiagGestacaoNOMEMACHO: TStringField;
    cdsDiagGestacaoPRENHEZ: TStringField;
    cdsDiagGestacaoREEXAMINAR: TStringField;
    sqlDiagGestacaoDATAEVENTO: TSQLTimeStampField;
    sqlDiagGestacaoTIPOEVENTO: TIntegerField;
    cdsDiagGestacaoTIPOEVENTO: TIntegerField;
    cdsDiagGestacaoDATAEVENTO: TSQLTimeStampField;
    cdsDiagGestacaoNOVOTOQUE: TSQLTimeStampField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsDiagGestacaoDESC_EVENTO: TStringField;
    cdsDiagGestacaoDATATOQUE: TSQLTimeStampField;
    sqlDiagGestacaoKCAD_VETERINARIO: TStringField;
    sqlDiagGestacaoNOMEVETERINARIO: TStringField;
    cdsDiagGestacaoKCAD_VETERINARIO: TStringField;
    cdsDiagGestacaoNOMEVETERINARIO: TStringField;
    sqlDiagGestacaoPROTOCOLO_TOQUE: TStringField;
    cdsDiagGestacaoPROTOCOLO_TOQUE: TStringField;
    cdsDiagGestacaoPREVISAOPARTO: TDateTimeField;
    sqlDiagGestacaoNUMERO_LACTACAO: TIntegerField;
    cdsDiagGestacaoNUMERO_LACTACAO: TIntegerField;
    sqlDiagGestacaoLOTETOQUE: TStringField;
    sqlDiagGestacaoLOTE: TStringField;
    cdsDiagGestacaoLOTETOQUE: TStringField;
    cdsDiagGestacaoLOTE: TStringField;
    sqlDiagGestacaoNOVOTOQUE: TSQLTimeStampField;
    cdsDiagGestacaoCOUNT_EXAMINADOS: TAggregateField;
    cdsDiagGestacaoBRINCOFEMEA_: TStringField;
    sqlDiagGestacaoBRINCOFEMEA_: TStringField;
    cdsSexoCria: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    cdsStatusGemelar: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    sqlDiagGestacaoGEMELAR: TStringField;
    sqlDiagGestacaoSEXO_CRIA: TIntegerField;
    cdsDiagGestacaoGEMELAR: TStringField;
    cdsDiagGestacaoSEXO_CRIA: TIntegerField;
    cdsDiagGestacaoDESC_GEMELAR: TStringField;
    cdsDiagGestacaoDESC_SEXO_CRIA: TStringField;
    sqlLotes: TTcSQLDataSet;
    dspLotes: TDataSetProvider;
    cdsLotes: TClientDataSet;
    sqlLotesLOTE: TStringField;
    sqlLotesFIELD_NULL: TIntegerField;
    sqlLotesSELECTED: TIntegerField;
    cdsLotesLOTE: TStringField;
    cdsLotesFIELD_NULL: TIntegerField;
    cdsLotesSELECTED: TIntegerField;
    sqlDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField;
    sqlDiagGestacaoULTIMO_DIAGNOSTICO: TStringField;
    cdsDiagGestacaoDATA_ULTIMOTOQUE: TSQLTimeStampField;
    cdsDiagGestacaoULTIMO_DIAGNOSTICO: TStringField;
    cdsLotesTOTAL_SELECTED: TAggregateField;
    cdsLotesTOTAL_FIELD_NULL: TAggregateField;
    sqlDiagGestacaoNOVAPRENHEZ: TStringField;
    cdsDiagGestacaoNOVAPRENHEZ: TStringField;
    sqlDiagGestacaoABORTOPARTO: TIntegerField;
    sqlDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField;
    cdsDiagGestacaoABORTOPARTO: TIntegerField;
    cdsDiagGestacaoDATAABORTOPARTO: TSQLTimeStampField;
    sqlDiagGestacaoKZOO_LACTACAO: TStringField;
    cdsDiagGestacaoKZOO_LACTACAO: TStringField;
    sqlDiagGestacaoPRENHEZ_ANTERIOR: TStringField;
    cdsDiagGestacaoPRENHEZ_ANTERIOR: TStringField;
    procedure cdsDiagGestacaoNewRecord(DataSet: TDataSet);
    procedure cdsDiagGestacaoNOVOTOQUEValidate(Sender: TField);
    procedure cdsDiagGestacaoPRENHEZGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDiagGestacaoREEXAMINARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDiagGestacaoPRENHEZSetText(Sender: TField; const Text: string);
    procedure cdsDiagGestacaoBeforeInsert(DataSet: TDataSet);
    procedure cdsDiagGestacaoBeforeDelete(DataSet: TDataSet);
    procedure cdsDiagGestacaoNOMEVETERINARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsDiagGestacaoBeforePost(DataSet: TDataSet);
    procedure cdsDiagGestacaoPROTOCOLO_TOQUEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsDiagGestacaoBeforeEdit(DataSet: TDataSet);
    procedure cdsDiagGestacaoAfterCancel(DataSet: TDataSet);
    procedure dspDiagGestacaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspDiagGestacaoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure cdsDiagGestacaoPRENHEZValidate(Sender: TField);
    procedure cdsDiagGestacaoNOVAPRENHEZGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsDiagGestacaoNOVAPRENHEZSetText(Sender: TField;
      const Text: string);
    procedure dspDiagGestacaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure cdsDiagGestacaoSEXO_CRIAValidate(Sender: TField);
  private
    FSQLDiagnosticosOriginal: String;
    FSQLAddByKey : String;
    FCountDiagnosticos : integer  ;
    FOldCountDiagnosticos : integer ;
    FDataToque: TDateTime;
    FAplicarProtocolo : boolean ;
    FKVeterinario  : string ;
    FNomeVeterinario : string ;
    DiasPartoPrimipara : integer ;
    DiasPartoMultipara : integer ;
    DiasAbortoPrimipara : integer;
    DiasAbortoMultipara : integer;

    FDiasConfirmacaoPrimipara: integer  ;
    FDiasConfirmacaoMultipara: integer  ;
    FDiasReconfirmacaoPrimipara1: integer  ;
    FDiasReconfirmacaoMultipara1: integer  ;
    FDiasReconfirmacaoPrimipara2: integer  ;
    FDiasReconfirmacaoMultipara2: integer  ;

    FUltimoToque : TDateTime;
    FLoteNull: String;
    FPrenhezOld: String;
    procedure SetDataToque(const Value: TDateTime);
    function ValidaSexoCria: Boolean;
    function GetSqlDiagnostico: String;
    procedure SetSqlAddByKey;
    function GetLotes: String;
    procedure AbortoNovaPrenhezNegativa;
    procedure AbrirLactacao( DSEventos : TCustomClientDataSet );
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure SetPeriodo ( AAte: TDateTime ) ;
    procedure SetVeterinario ( AKFuncionario, ANomeFuncionario : string  ) ;
    procedure OpenTables ; override ;
    procedure OpenLotes;
    property DataToque : TDateTime  read FDataToque write SetDataToque;
    procedure AplicarProtocolos( AAplicar : boolean )  ;
    procedure SetVeterinarioDefault ( AFKVeterinario, ANome : string ) ;
    property  CountDiagnosticos : integer read FCountDiagnosticos ;
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    function AddByKey(AKey: string):Boolean;
    function AddBrinco(ABrinco: string):Boolean;
  end;

implementation

uses UDBZootecnico, Exceptions, DateUtils, SQLTimSt , CLAg5Types,
     DiagnosticosAnimalClass,
     ClAg5ClientZootecnicoCommonTypes,
     CDSSuppl ;

{$R *.dfm}

{ TdtmCustomListaFicha }

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenLotes;
begin
  TCDSSuppl.Open ( cdsLotes ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenTables;
begin
  self.FAplicarProtocolo := True ;
  DBResources['ZOOTECNICO'].GetSystemTypes( _ST_TIPO_EVENTO_ZOO, cdsTipoEvento );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_STATUS_GEMELAR,   cdsStatusGemelar   ); // utilizado para Popup ...
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_SEXO_CRIA,   cdsSexoCria   ); // utilizado para Popup ...
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, DiasPartoPrimipara, DiasPartoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID,  _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO, DiasAbortoPrimipara, DiasAbortoMultipara ) ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetDataToque(const Value: TDateTime);
begin
  FDataToque := Value;
end;



procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinario(AKFuncionario,
  ANomeFuncionario: string);
begin
   if not ( cdsDiagGestacao.State in [dsInsert, dsEdit] ) then
      cdsDiagGestacao.Edit ;

   cdsDiagGestacaoNOMEVETERINARIO.Clear ;
   cdsDiagGestacaoKCAD_VETERINARIO.Clear ;

   if AKFuncionario <> '' then
     begin
       cdsDiagGestacaoNOMEVETERINARIO.Text  := ANomeFuncionario ;
       cdsDiagGestacaoKCAD_VETERINARIO.asString := AKFuncionario ;
     end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinarioDefault(AFKVeterinario,
  ANome: string);
begin
 FKVeterinario  := AFKVeterinario ;
 FNomeVeterinario := ANome ;
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.ValidaSexoCria: Boolean;
begin
  Result:= True;
  if (cdsDiagGestacaoPRENHEZ.IsNull) or (cdsDiagGestacaoPRENHEZ.AsString = '') or
     (cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE)  then
   begin
     cdsDiagGestacaoGEMELAR.Clear;
     cdsDiagGestacaoSEXO_CRIA.Clear;
   end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetPeriodo(AAte: TDateTime);
begin
   FCountDiagnosticos    := 0 ;
   FOldCountDiagnosticos := 0 ;

   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ, FDiasConfirmacaoPrimipara, FDiasConfirmacaoMultipara ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_1VEZ, FDiasReconfirmacaoPrimipara1, FDiasReconfirmacaoMultipara1 ) ;
   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_2VEZ, FDiasReconfirmacaoPrimipara2, FDiasReconfirmacaoMultipara2 ) ;

   cdsDiagGestacao.Close ;
   sqlDiagGestacao.CommandText := Format( GetSqlDiagnostico, [ GetLotes ] );
   sqlDiagGestacao.Params.Clear;
   sqlDiagGestacao.Params.CreateParam(ftFixedChar, 'KCAD_FAZENDA',ptInput).AsString            := LoggedUser.DomainID ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'STATUS_DESCARTADO',ptInput).AsInteger      := _ST_STATUS_ANIMAL_DESCARTADO ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DOADOR'           ,ptInput).AsInteger      := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
   sqlDiagGestacao.Params.CreateParam(ftString   , 'LOTE_NULL'        ,ptInput).AsString       := FLoteNull ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'EMBRIAO'          ,ptInput).AsInteger      := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoMultipara ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoPrimipara ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA_1VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA_1VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA_2VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA_2VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'EMBRIAO'          ,ptInput).AsInteger      := _ST_TIPO_EVENTO_ZOO_IMPLANTE ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoMultipara ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA'    ,ptInput).AsInteger      := FDiasConfirmacaoPrimipara ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA_1VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA_1VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara1 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASMULTIPARA_2VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoMultipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;
   sqlDiagGestacao.Params.CreateParam(ftInteger  , 'DIASPRIMIPARA_2VEZ'    ,ptInput).AsInteger := FDiasReconfirmacaoPrimipara2 ;
   sqlDiagGestacao.Params.CreateParam(ftTimeStamp, 'DATA'             ,ptInput).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( AAte ) ) ;

   cdsDiagGestacao.FetchParams;
   TCDSSuppl.Open ( cdsDiagGestacao ) ;
   cdsDiagGestacao.IndexFieldNames := 'BRINCOFEMEA_';

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoAfterCancel(
  DataSet: TDataSet);
begin
    FCountDiagnosticos := FOldCountDiagnosticos ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeDelete(
  DataSet: TDataSet);
begin
   Abort ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeEdit(
  DataSet: TDataSet);
begin

  if ( FDataToque = 0  ) then
       raise Warning.Create('Data padrão do toque inválida')
  else if ( FDataToque > Date  ) then
       raise Warning.Create('Data padrão do toque superior a atual') ;

  FUltimoToque := cdsDiagGestacaoDATA_ULTIMOTOQUE.AsDateTime;
  FPrenhezOld  := cdsDiagGestacaoPRENHEZ.AsString;
//  else if ( FKVeterinario = ''  ) then
//       raise Warning.Create('Veterinário padrão inválido') ;

//  else if ( deDataEvento.date < ( Date - 30 )) then
//     begin
//       deDataEvento.SetFocus ;
//       raise Warning.Create('Data inferiror a 30 dias');
//     end;

  if  VarIsEmpty ( cdsDiagGestacaoCOUNT_EXAMINADOS.Value )
   or VarIsNull ( cdsDiagGestacaoCOUNT_EXAMINADOS.Value ) then
    FOldCountDiagnosticos := 0
 else
    FOldCountDiagnosticos := cdsDiagGestacaoCOUNT_EXAMINADOS.Value ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforeInsert(
  DataSet: TDataSet);
begin
   Abort ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBeforePost(
  DataSet: TDataSet);
begin
//   if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> '')) and ( cdsDiagGestacaoKCAD_VETERINARIO.asString = '' )  then
//     raise Warning.Create('Veterinário deve ser preenchido / pesquisado');
//  if not ValidaSexoCria then
//       raise Warning.Create('Sexagem da cria não confere com o status da gestação gemelar' );

  ValidaSexoCria;

  if (not ( (VarIsNull( cdsDiagGestacaoDATATOQUE.OldValue)) or (VarIsEmpty( cdsDiagGestacaoDATATOQUE.OldValue) )) ) and
    (not (cdsDiagGestacaoDATATOQUE.IsNull) ) and
    (cdsDiagGestacaoDATATOQUE.AsDateTime < FUltimoToque) then
    raise Warning.Create('A data do último toque é posterior à data do toque' );


  AbortoNovaPrenhezNegativa;



end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ( Sender.IsNull ) OR ( Sender.AsString = '' ) then
    begin
//      if DisplayText then
//        Text := 'n.e.'
//      else
        Text := 'Não examinada'
    end
  else if Sender.asBoolean then
     Text := 'Prenhe'
  else
     Text := 'Não prenhe' ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZSetText(
  Sender: TField; const Text: string);
begin
  inherited;
  if Text = 'Não examinada' then
     Sender.Clear
  else if Text = 'Prenhe' then
     Sender.asString := 'T'
  else if Text = 'Não prenhe' then
     Sender.asString := 'F' ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZValidate(
  Sender: TField);
begin
   if not (( cdsDiagGestacaoPRENHEZ.isNull ) or (Trim(cdsDiagGestacaoPRENHEZ.asString) = ''))
   {and cdsDiagGestacaoNOVOTOQUE.IsNull} then
   begin
//     cdsDiagGestacaoNOVOTOQUE.OnValidate := nil ;
     cdsDiagGestacaoNOVOTOQUE.AsDateTime := FDataToque ;
//     cdsDiagGestacaoNOVOTOQUE.OnValidate := cdsDiagGestacaoNOVOTOQUEValidate ;
//     cdsDiagGestacaoNOVOTOQUEValidate( cdsDiagGestacaoNOVOTOQUE ) ;

     if cdsDiagGestacaoKCAD_VETERINARIO.asString = '' then
        SetVeterinario ( FKVeterinario, FNomeVeterinario ) ;
   end
   else
     cdsDiagGestacaoNOVOTOQUE.Clear;

   if ((cdsDiagGestacaoPRENHEZ.isNull ) or (Trim ( cdsDiagGestacaoPRENHEZ.asString ) = ''))  then
     self.FCountDiagnosticos := FOldCountDiagnosticos -1
   else
     self.FCountDiagnosticos := FOldCountDiagnosticos +1;






end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPROTOCOLO_TOQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if DisplayText then
     begin
       if cdsDiagGestacaoPROTOCOLO_TOQUE.AsBoolean then
          Text := 'Aplicar protocolo ao animal : sim '
       else
          Text := 'Aplicar protocolo ao animal : não '
     end
   else
         Text := Sender.AsString
     (*
   else
     begin
       if cdsDiagGestacaoPROTOCOLO_TOQUE.AsBoolean then
         Text := 'T'
       else
         Text := 'F'
     end;
     *)
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoREEXAMINARGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if (( cdsDiagGestacaoPRENHEZ.isNull ) or (Trim ( cdsDiagGestacaoPRENHEZ.asString ) = '')) then
         Text := 'não avalidada'
      else if Sender.asBoolean then
         Text := 'Rexaminar'
      else
         Text := 'Não Rexaminar' ;
    end
  else
    Text := Sender.asString ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoSEXO_CRIAValidate(
  Sender: TField);
begin

  if ((cdsDiagGestacaoPRENHEZ.IsNull) or (cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE))
     and (not cdsDiagGestacaoSEXO_CRIA.IsNull) then
   begin
     raise Warning.Create('Não é possível informar o sexo da cria para um animal não prenhe' );
   end;


  if cdsDiagGestacaoSEXO_CRIA.AsInteger < _ST_SEXO_CRIA_F_F then
    cdsDiagGestacaoGEMELAR.AsString := 'F'
  else
    cdsDiagGestacaoGEMELAR.AsString := 'T';


end;

constructor TZoo_ReproducaoDiagnosticosGestacaoDatamodule.Create(
  AOwner: TComponent);
begin
  inherited;
  SetSqlAddByKey;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if  ( DeltaDS.FieldByName('PROTOCOLO_TOQUE').AsBoolean )
  and ( not DeltaDS.FieldByName('DATATOQUE' ).isNull ) then
    begin
       if DeltaDS.FieldByName('PRENHEZ').AsBoolean then
          DiagnosticosAnimalClass.TEventosAnimal.AddDiagnosticoGestacaoPositivo(
            DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
            DeltaDS.FieldByName('DATATOQUE' ).AsDateTime )
       else
          DiagnosticosAnimalClass.TEventosAnimal.AddDiagnosticoGestacaoNegativo(
            DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
            DeltaDS.FieldByName('DATATOQUE' ).AsDateTime ) ;

       if DeltaDS.FieldByName('REEXAMINAR').AsBoolean then
           DiagnosticosAnimalClass.TEventosAnimal.AddReexaminar(
            DeltaDS.FieldByName('KZOO_ANIMAL_FEMEA' ).OldValue,
            DeltaDS.FieldByName('DATATOQUE' ).AsDateTime );
    end;

  if  ( SourceDS = sqlDiagGestacao ) then
   begin
     AbrirLactacao( DeltaDS );
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
   Applied := False ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.dspDiagGestacaoGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
  TableName := 'ZOO_EVENTOS_ZOOTECNICOS';

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.GetLotes: String;
var
  LLotes : String;
begin
  Result := '';
  LLotes := '';
  FLoteNull := 'F';
  cdsLotes.DisableControls;
  cdsLotes.First;
  while not cdsLotes.Eof do
   begin
     if cdsLotes.FieldByName('SELECTED').AsInteger = 1 then
      begin
       LLotes := LLotes + QuotedStr(cdsLotes.FieldByName('LOTE').AsString) + ', ';
       if cdsLotes.FieldByName('FIELD_NULL').AsInteger = 1 then
         FLoteNull := 'T';
      end;
     cdsLotes.Next;
   end;
  cdsLotes.EnableControls;

  System.Delete( LLotes, Length( LLotes )-1, 2);

  Result := LLotes;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.SetSqlAddByKey;
begin
  if FSQLAddByKey <> '' then
    Exit;

  FSQLAddByKey := Copy(sqlDiagGestacao.CommandText, 1, Pos('--(LOTES)',sqlDiagGestacao.CommandText)-1);

  FSQLAddByKey := FSQLAddByKey+
     #13#10' AND ( AF.KZOO_ANIMAL = :KZOO_ANIMAL) ';
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.GetSqlDiagnostico: String;
begin

  if FSQLDiagnosticosOriginal = '' then
    FSQLDiagnosticosOriginal := sqlDiagGestacao.CommandText;

  Result := StringReplace(FSQLDiagnosticosOriginal,
                           '--(LOTES)',
                           ' AND ( DAF.LOTE IN (%s) or (:LOTE_NULL = ''T'' AND (DAF.LOTE IS NULL OR DAF.LOTE = '''' ) ) ) ',
                           []);

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.LocateBrinco(
  ABrinco: string): boolean;
begin
  Result := cdsDiagGestacao.Locate( 'BRINCOFEMEA', ABrinco, [] ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOMEVETERINARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsDiagGestacaoKCAD_VETERINARIO.Clear ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVAPRENHEZGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) OR ( Sender.AsString = '' ) then
    begin
        //Text := 'Não examinada'
        Text := '';
    end
  else if Sender.asBoolean then
     Text := 'Prenhe'
  else
     Text := 'Não prenhe' ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVAPRENHEZSetText(
  Sender: TField; const Text: string);
begin
  if (Text = 'Não examinada') or (Text = '') then
   begin
     Sender.Clear;
     cdsDiagGestacaoPRENHEZ.Clear;
   end
  else if Text = 'Prenhe' then
   begin
     Sender.asString := 'T';
     cdsDiagGestacaoPRENHEZ.AsString := 'T';
   end
  else if Text = 'Não prenhe' then
   begin
     Sender.asString := 'F';
     cdsDiagGestacaoPRENHEZ.AsString := 'F';
   end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVOTOQUEValidate( Sender: TField ) ;
begin
  inherited;

  if Sender.AsDateTime > Date then
     raise Warning.Create('Não é possível incluir diagnósticos com data futura');

  if (not ( (VarIsNull( Sender.AsVariant)) or (VarIsEmpty( Sender.AsVariant) )) ) and
     ( Sender.AsDateTime < FUltimoToque ) then
    raise Warning.Create('A data do último toque é posterior à data do toque' );

  if ( Sender.IsNull ) or ( Sender.asDateTime = 0 ) then
      cdsDiagGestacaoDATATOQUE.Clear ;

  if ( cdsDiagGestacaoNOVOTOQUE.IsNull ) or ( cdsDiagGestacaoNOVOTOQUE.asDateTime = 0 ) then
      cdsDiagGestacaoDATATOQUE.Clear
  else if cdsDiagGestacaoNOVOTOQUE.asDateTime <= cdsDiagGestacaoDATAEVENTO.asDateTime then
       raise Warning.Create('A data do toque tem que ser superior a data do evento')
  else
      cdsDiagGestacaoDATATOQUE.asDateTime := cdsDiagGestacaoNOVOTOQUE.asDateTime ;

  if ( cdsDiagGestacaoDATATOQUE.IsNull ) or ( cdsDiagGestacaoDATATOQUE.asDateTime = 0 ) then
    begin
     cdsDiagGestacaoPRENHEZ.OnValidate := nil ;
     cdsDiagGestacaoPRENHEZ.Clear ;
     cdsDiagGestacaoREEXAMINAR.asString      := 'F' ;
     cdsDiagGestacaoPROTOCOLO_TOQUE.AsString := 'F' ;
     cdsDiagGestacaoLOTETOQUE.clear  ;
     cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate ;
    end
  else
     cdsDiagGestacaoLOTETOQUE.asString := cdsDiagGestacaoLOTE.asString ;

 if cdsDiagGestacaoPRENHEZ.asBoolean then
   begin
      if cdsDiagGestacaoNUMERO_LACTACAO.AsInteger > 1  then
        cdsDiagGestacaoPREVISAOPARTO.asDateTime := cdsDiagGestacaoDATAEVENTO.asDateTime + DiasPartoMultipara
      else
        cdsDiagGestacaoPREVISAOPARTO.asDateTime := cdsDiagGestacaoDATAEVENTO.asDateTime + DiasPartoPrimipara ;

      cdsDiagGestacaoREEXAMINAR.asString := 'F' ;
      if self.FAplicarProtocolo then
         cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'T'
      else
         cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'F' ;
   end ;

(* não esta na especificacao

 else if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> ''))  then
   begin
      cdsDiagGestacaoREEXAMINAR.asString := 'T' ;
   end ;
*)
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  //cdsDiagGestacaoPROTOCOLO_TOQUE.asString := 'T' ;
  FUltimoToque := 0;
  FPrenhezOld  := '';
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AbortoNovaPrenhezNegativa;
var
 isPrimipara, AbrirLactacao : Boolean;
 diasEvento  : integer;
begin
   diasEvento  := Trunc ( cdsDiagGestacaoNOVOTOQUE.AsDateTime - cdsDiagGestacaoDATAEVENTO.asDateTime ) ;
   AbrirLactacao := False;
   if ( cdsDiagGestacaoPRENHEZ.AsString = _ST_STATUS_PRENHEZ_NAOPRENHE ) and ( cdsDiagGestacaoPRENHEZ_ANTERIOR.AsString = _ST_STATUS_PRENHEZ_PRENHE ) and
      ( cdsDiagGestacaoNOVOTOQUE.AsDateTime > cdsDiagGestacaoDATA_ULTIMOTOQUE.AsDateTime ) and
      ( not ((VarIsEmpty(cdsDiagGestacaoPRENHEZ.OldValue)) or (VarIsNull(cdsDiagGestacaoPRENHEZ.OldValue)) ) ) then
    begin
      isPrimipara := TAnimalFemea.isPrimipara( cdsDiagGestacaoKZOO_ANIMAL_FEMEA.AsString ) ;
      if (  isPrimipara and (diasEvento > DiasAbortoPrimipara) ) then
       begin
         AbrirLactacao :=  TTcCustomForm.MessageDlg (
         Format ( 'Animal prenhe (primípara) com mais de %d dias de gestação.', [ DiasAbortoPrimipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes
       end

      else if ( not isPrimipara and (diasEvento > DiasAbortoMultipara) ) then
       begin
         AbrirLactacao :=  TTcCustomForm.MessageDlg (
         Format ( 'Animal prenhe (multípara) com mais de %d dias de gestação.', [ DiasAbortoMultipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes
       end

      else
       begin
         TTcCustomForm.MessageDlg ('Animal prenhe, será lançado um aborto.', mtWarning ) ;
       end;

      cdsDiagGestacaoDATAABORTOPARTO.AsDateTime := ( cdsDiagGestacaoNOVOTOQUE.AsDateTime );

      if AbrirLactacao then
         cdsDiagGestacaoABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO
      else
         cdsDiagGestacaoABORTOPARTO.asInteger := _ST_TIPO_PARTOABORTO_ABORTO ;

      cdsDiagGestacaoNOVAPRENHEZ.OnSetText := nil;
      cdsDiagGestacaoPRENHEZ.OnValidate := nil;

      cdsDiagGestacaoNOVAPRENHEZ.AsString := _ST_STATUS_PRENHEZ_NAOPRENHE;

      cdsDiagGestacaoDATATOQUE.AsDateTime := FUltimoToque;
      cdsDiagGestacaoPRENHEZ.AsString := _ST_STATUS_PRENHEZ_PRENHE;

      cdsDiagGestacaoNOVAPRENHEZ.OnSetText := cdsDiagGestacaoNOVAPRENHEZSetText;
      cdsDiagGestacaoPRENHEZ.OnValidate := cdsDiagGestacaoPRENHEZValidate;
    end
    else
     begin
       cdsDiagGestacaoABORTOPARTO.Clear;
       cdsDiagGestacaoDATAABORTOPARTO.Clear;
     end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AbrirLactacao(
  DSEventos: TCustomClientDataSet);
const
 _INSERT_LACTACAO = 'INSERT INTO ZOO_LACTACOES ( KZOO_LACTACAO, KZOO_EVENTO_ZOOTECNICO, KZOO_ANIMAL_FEMEA, KCAD_FAZENDA )'
              +#13#10'VALUES ( :KZOO_LACTACAO, :KZOO_EVENTO_ZOOTECNICO, :KZOO_ANIMAL_FEMEA, :KCAD_FAZENDA )' ;

 _DELETE_LACTACAO = 'DELETE FROM ZOO_LACTACOES WHERE KZOO_LACTACAO = :KZOO_LACTACAO';
var
  p : TParams ;
begin


  if ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger in [ _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO, _ST_TIPO_PARTOABORTO_PARTO ] )
  and ( VarIsNull ( DSEventos.FieldByName ( 'KZOO_LACTACAO' ).OldValue ) ) then
    begin

      if not VarIsNull ( DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue )
      and ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger = _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )then
        TAnimalFemea.SecarUltimaLactacaoPorAborto( DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).OldValue,
                                                   DSEventos.FieldByName ( 'DATAABORTOPARTO' ).asDateTime -1 ) ;


      DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).NewValue := GuidSuppl.GuidStr20 ;

      p := TParams.Create ;
      p.CreateParam ( ftString, 'KZOO_LACTACAO',          ptInput ).asString := DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).NewValue ;

      if VarIsNull ( DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ) then
       begin
        p.CreateParam ( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).asString ;
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',      ptInput ).asString := DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).asString ;
       end
      else
       begin
        p.CreateParam ( ftString, 'KZOO_EVENTO_ZOOTECNICO', ptInput ).asString := DSEventos.FieldByName ( 'KZOO_EVENTO_ZOOTECNICO' ).OldValue ;
        p.CreateParam ( ftString, 'KZOO_ANIMAL_FEMEA',      ptInput ).asString := DSEventos.FieldByName ( 'KZOO_ANIMAL_FEMEA'      ).OldValue ;
       end;

      p.CreateParam ( ftString, 'KCAD_FAZENDA',           ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute( _INSERT_LACTACAO, p ) ;
      p.free ;

    end
   else
    if ( DSEventos.FieldByName ( 'ABORTOPARTO' ).asInteger = _ST_TIPO_PARTOABORTO_ABORTO  )
       and ( not VarIsNull ( DSEventos.FieldByName ( 'KZOO_LACTACAO' ).OldValue ) ) then
    begin
      p := TParams.Create ;
      p.CreateParam ( ftString, 'KZOO_LACTACAO',          ptInput ).asString := DSEventos.FieldByName ( 'KZOO_LACTACAO'          ).OldValue ;
      TTcAbstractDB.GetByAlias ( 'ZOOTECNICO' ).Execute( _DELETE_LACTACAO, p ) ;
      p.free ;
    end;

end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddBrinco(
  ABrinco: string): Boolean;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsDiagGestacao.Edit ;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKey ( KeyAnimal{, ADataToque, ANomeVeterinario, Reexaminar} )  ;
end;

function TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AddByKey(AKey: string): boolean;

var
    cds : TClientDataSet ;
    p : TParams ;
begin
    p := TParams.Create ;
    p.CreateParam( ftString,  'KCAD_FAZENDA',      ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftInteger, 'STATUS_DESCARTADO', ptInput).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
    p.CreateParam( ftInteger, 'DOADOR',            ptInput).asInteger := _ST_TIPO_DOADOR_RECEPTOR_DOADOR ;
    p.CreateParam( ftString,  'KZOO_ANIMAL',       ptInput ).asString := AKey ;

    cds := nil ;
    try

       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, FSQLAddByKey{ _SELECT_ANIMAL_DIAGNOSTICO}, p ) ;


       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não possui evento de cobertura');


       with cds do
         begin
           cdsDiagGestacao.AppendData(cds.Data, True) ;
           cdsDiagGestacao.Locate('KZOO_ANIMAL_FEMEA',AKey,[]);
         end;




    finally
       cds.Free ;
       p.free ;
    end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoDatamodule.AplicarProtocolos(AAplicar: boolean);
var
  strAplicar : string ;
begin
   FAplicarProtocolo := AAplicar ;

   if FAplicarProtocolo then
     strAplicar := 'T'
   else
     strAplicar := 'F' ;

   with cdsDiagGestacao do
     try
        disableControls ;
        first ;
        while not eof  do
           begin
             if (( not cdsDiagGestacaoPRENHEZ.isNull ) and (Trim ( cdsDiagGestacaoPRENHEZ.asString ) <> '')) then
               begin
                 edit ;
                 cdsDiagGestacaoPROTOCOLO_TOQUE.AsString := strAplicar ;
                 post;
               end;
             next ;
           end;
        first ;
     finally
        EnableControls ;
     end;
end;


end.
