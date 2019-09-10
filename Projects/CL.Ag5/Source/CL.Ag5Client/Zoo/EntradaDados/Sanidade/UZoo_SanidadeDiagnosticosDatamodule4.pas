unit UZoo_SanidadeDiagnosticosDatamodule4;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_SanidadeDiagnosticosDatamodule = class(T_dtmBASE)
    sqlDiagnosticoAplicar: TTcSQLDataSet;
    sqlDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField;
    sqlDiagnosticoAplicarBRINCO: TStringField;
    sqlDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField;
    sqlDiagnosticoAplicarQUARTO: TSmallintField;
    sqlDiagnosticoAplicarDATA: TSQLTimeStampField;
    sqlDiagnosticoAplicarKZOO_PROTOCOLO: TStringField;
    dspDiagnosticoAplicar: TDataSetProvider;
    cdsDiagnosticoAplicar: TClientDataSet;
    cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField;
    cdsDiagnosticoAplicarBRINCO: TStringField;
    cdsDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticoAplicarQUARTO: TSmallintField;
    cdsDiagnosticoAplicarDATA: TSQLTimeStampField;
    cdsDiagnosticoAplicarKZOO_PROTOCOLO: TStringField;
    sqlDiagnosticos: TTcSQLDataSet;
    sqlDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    sqlDiagnosticosKCAD_FAZENDA: TStringField;
    sqlDiagnosticosCODIGO: TStringField;
    sqlDiagnosticosTIPODIAGNOSTICO: TIntegerField;
    sqlDiagnosticosTIPOEVENTO: TIntegerField;
    sqlDiagnosticosSYSEVENTOID: TStringField;
    sqlDiagnosticosNOME: TStringField;
    sqlDiagnosticosPOR_QUARTO: TStringField;
    sqlDiagnosticosATIVO: TStringField;
    sqlDiagnosticosINTERNAL: TStringField;
    dspDiagnosticos: TDataSetProvider;
    cdsDiagnosticos: TClientDataSet;
    cdsDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosKCAD_FAZENDA: TStringField;
    cdsDiagnosticosCODIGO: TStringField;
    cdsDiagnosticosTIPODIAGNOSTICO: TIntegerField;
    cdsDiagnosticosTIPOEVENTO: TIntegerField;
    cdsDiagnosticosSYSEVENTOID: TStringField;
    cdsDiagnosticosNOME: TStringField;
    cdsDiagnosticosPOR_QUARTO: TStringField;
    cdsDiagnosticosATIVO: TStringField;
    cdsDiagnosticosINTERNAL: TStringField;
    cdsProtocolos: TClientDataSet;
    sqlDiagnosticosPadrao: TTcSQLDataSet;
    dspDiagnosticosPadrao: TDataSetProvider;
    sqlDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField;
    sqlDiagnosticosPadraoKCAD_FAZENDA: TStringField;
    sqlDiagnosticosPadraoCODIGO: TStringField;
    sqlDiagnosticosPadraoTIPODIAGNOSTICO: TIntegerField;
    sqlDiagnosticosPadraoTIPOEVENTO: TIntegerField;
    sqlDiagnosticosPadraoSYSEVENTOID: TStringField;
    sqlDiagnosticosPadraoNOME: TStringField;
    sqlDiagnosticosPadraoPOR_QUARTO: TStringField;
    sqlDiagnosticosPadraoATIVO: TStringField;
    sqlDiagnosticosPadraoINTERNAL: TStringField;
    cdsDiagnosticosPadrao: TClientDataSet;
    cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosPadraoKCAD_FAZENDA: TStringField;
    cdsDiagnosticosPadraoCODIGO: TStringField;
    cdsDiagnosticosPadraoTIPODIAGNOSTICO: TIntegerField;
    cdsDiagnosticosPadraoTIPOEVENTO: TIntegerField;
    cdsDiagnosticosPadraoSYSEVENTOID: TStringField;
    cdsDiagnosticosPadraoNOME: TStringField;
    cdsDiagnosticosPadraoPOR_QUARTO: TStringField;
    cdsDiagnosticosPadraoATIVO: TStringField;
    cdsDiagnosticosPadraoINTERNAL: TStringField;
    cdsProtocolosPadrao: TClientDataSet;
    cdsQuarto: TClientDataSet;
    cdsQuartoTIPO: TStringField;
    cdsQuartoVALOR: TStringField;
    cdsQuartoDESCRICAO: TStringField;
    cdsQuartoORDEM: TIntegerField;
    cdsQuartoPadrao: TClientDataSet;
    cdsQuartoPadraoTIPO: TStringField;
    cdsQuartoPadraoVALOR: TStringField;
    cdsQuartoPadraoDESCRICAO: TStringField;
    cdsQuartoPadraoORDEM: TIntegerField;
    cdsDiagnosticoAplicarCODIGO_DIAGNOSTICO: TStringField;
    cdsDiagnosticoAplicarCODIGO_PROTOCOLO: TStringField;
    cdsDiagnosticoAplicarQUARTO_DESCR: TStringField;
    cdsDiagnosticoAplicarGUID20: TStringField;
    SQLDataSet1: TTcSQLDataSet;
    SQLDataSet1KZOO_DIAGNOSTICO: TStringField;
    SQLDataSet1KZOO_PROTOCOLO: TStringField;
    SQLDataSet1CODIGO: TStringField;
    cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField;
    cdsProtocolosPadraoCODIGO: TStringField;
    cdsProtocolosKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosCODIGO: TStringField;
    dtsDiagnosticos: TDataSource;
    dtsPadroes: TDataSource;
    cdsPadroes: TClientDataSet;
    cdsPadroesDATA: TSQLTimeStampField;
    cdsPadroesKZOO_DIAGNOSTICO: TStringField;
    cdsPadroesCODIGO_DIAGNOSTICO: TStringField;
    cdsPadroesQUARTO: TSmallintField;
    cdsPadroesKZOO_PROTOCOLO: TStringField;
    cdsPadroesCODIGO_PROTOCOLO: TStringField;
    cdsPadroesQUARTO_DESCR: TStringField;
    dtsDiagnosticoAplicar: TDataSource;
    cdsDiagnosticoAplicarDESC_PROTOCOLO: TStringField;
    cdsProtocolosVINCULADO: TStringField;
    cdsProtocolosPadraoVINCULADO: TStringField;
    procedure dspDiagnosticoAplicarBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsDiagnosticoAplicarBeforePost(DataSet: TDataSet);
    procedure cdsDiagnosticoAplicarNewRecord(DataSet: TDataSet);
    procedure cdsDiagnosticoAplicarAfterPost(DataSet: TDataSet);
    procedure cdsDiagnosticoAplicarAfterOpen(DataSet: TDataSet);
    procedure cdsProtocolosPadraoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dtsPadroesDataChange(Sender: TObject; Field: TField);
    procedure cdsProtocolosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dtsDiagnosticoAplicarDataChange(Sender: TObject; Field: TField);
    procedure cdsDiagnosticoAplicarKZOO_PROTOCOLOChange(Sender: TField);
    procedure cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange(Sender: TField);
  private
    { Private declarations }
    FCDSClone : TClientDataSet;
    FUseQuickInput: boolean;
    procedure InsereDiagnostico ( AKAnimal : string ; ADiagnostico : String ; AQuarto : integer ; ADate : TDateTime ; AProtocolo: String )  ;
    procedure CloneCDS;
    function ValidRegister: Boolean;
    procedure ClearQuarto;
    procedure SetUseQuickInput(const Value: boolean);
    procedure SetProtocoloVinculado;
  public
    { Public declarations }
    procedure OpenDiagnosticosAplicar  ;
    function PorQuartoDefault: Boolean;
    function PorQuarto       : Boolean;
    procedure OpenTables; override;
    procedure SetProtocolo(KProtocolo : Variant);
    procedure AddByKey(AKey, ABrinco: String );
    function AddBrinco ( ABrinco : string ) : boolean ;
    procedure RemoveDiagnostico;
    property UseQuickInput : boolean  read FUseQuickInput write SetUseQuickInput;
    constructor Create(AOwner: TComponent); override;
    function GetProtocoloVinculadoDefault( KDiagnosticoPadrao: Variant ): Variant;
  end;


implementation

uses Exceptions, UDBZootecnico, GuidSuppl, SQLTimSt , CLAg5Types,
     DiagnosticosAnimalClass, ProtocolosAnimalClass, ThreadSuppl,
     CDSSuppl, ClAg5ClientZootecnicoCommonTypes ;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TZoo_SanidadeDiagnosticosDatamodule.AddBrinco( ABrinco : string ) : boolean ;
var
    KeyAnimal : string ;
begin
    //cdsDiagnosticoAplicar.Edit ;
    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;
    if Result then
       AddByKey ( KeyAnimal, ABrinco  )
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.AddByKey(AKey, ABrinco: String );
begin

  if cdsDiagnosticoAplicar.State in [dsInsert, dsEdit] then
    cdsDiagnosticoAplicar.Post;


  if ABrinco = '' then
    exit;
  cdsDiagnosticoAplicar.DisableControls;
  cdsDiagnosticoAplicar.Append;
  cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.AsString := AKey;
  cdsDiagnosticoAplicarBRINCO.AsString            := ABrinco;

  if FUseQuickInput and ( cdsPadroesDATA.asDateTime > 0 ) then
    cdsDiagnosticoAplicarDATA.AsDateTime            := cdsPadroesDATA.asDateTime
  else
    cdsDiagnosticoAplicarDATA.AsDateTime            := Date ;

  if FUseQuickInput and ( cdsPadroesKZOO_DIAGNOSTICO.AsString <> '' ) then
    cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString  := cdsPadroesKZOO_DIAGNOSTICO.AsString ;

  if FUseQuickInput and ( cdsPadroesKZOO_PROTOCOLO.AsString <> '' ) then
    begin
      cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsString    := cdsPadroesKZOO_PROTOCOLO.AsString ;
      cdsDiagnosticoAplicarCODIGO_PROTOCOLO.asString  := cdsPadroesCODIGO_PROTOCOLO.AsString ;
      cdsDiagnosticoAplicarDESC_PROTOCOLO.asString  := cdsPadroesCODIGO_PROTOCOLO.AsString ;
    end;

  if FUseQuickInput and PorQuartoDefault and ( cdsPadroesQUARTO.AsString <> '' ) then
    cdsDiagnosticoAplicarQUARTO.AsString := cdsPadroesQUARTO.AsString;

  if not ValidRegister then
   begin
    cdsDiagnosticoAplicar.Cancel;
    cdsDiagnosticoAplicar.EnableControls;
    raise Warning.Create('Já existe um registro com os mesmos dados.' );
   end;

  cdsDiagnosticoAplicar.BeforePost := nil;
  cdsDiagnosticoAplicar.Post;
  cdsDiagnosticoAplicar.BeforePost := cdsDiagnosticoAplicarBeforePost;
  cdsDiagnosticoAplicar.EnableControls;
  cdsDiagnosticoAplicar.Edit;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarAfterOpen(
  DataSet: TDataSet);
begin
  CloneCDS;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarAfterPost(
  DataSet: TDataSet);
begin
  CloneCDS;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBeforePost(
  DataSet: TDataSet);
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  if cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.IsNull then
     AddErr ( 'Brinco da fêmea ainda não foi preenchido' ) ;

  if Trunc(cdsDiagnosticoAplicarDATA.AsDateTime) = 0 then
     AddErr ( 'A data não pode estar em branco' ) ;

  if cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.IsNull then
     AddErr ( 'Diagnóstico deve ser informado' ) ;

  //if cdsDiagnosticoAplicarKZOO_PROTOCOLO.IsNull then
  //   AddErr ( 'Protocolo deve ser informado' ) ;

  if PorQuarto and (cdsDiagnosticoAplicarQUARTO.IsNull) then
     AddErr ( 'Quarto deve ser informado para o diagnóstico selecionado.' ) ;


  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos para o registro atual'#13#10#13#10 + ErrMsg );

  if not ValidRegister then
    raise Warning.Create('Já existe um registro com os mesmos dados.' );


end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange(
  Sender: TField);
begin
  if not cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.IsNull then
   begin
     SetProtocoloVinculado;
   end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_PROTOCOLOChange(
  Sender: TField);
begin
   cdsDiagnosticoAplicarDESC_PROTOCOLO.asString := cdsDiagnosticoAplicarCODIGO_PROTOCOLO.asString ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNewRecord(
  DataSet: TDataSet);
begin
  cdsDiagnosticoAplicarGUID20.AsString := GuidStr20;//Campo criado apenas para fazer validação
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept := //cdsProtocolosKZOO_DIAGNOSTICO.IsNull
             //or
            (   cdsProtocolosKZOO_DIAGNOSTICO.asString
              = cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.asString
            ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosPadraoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept := //cdsProtocolosPadraoKZOO_DIAGNOSTICO.IsNull
     //or
             (   cdsProtocolosPadraoKZOO_DIAGNOSTICO.asString
              = cdsDiagnosticosPadraoKZOO_DIAGNOSTICO.asString
            ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.ClearQuarto;
begin
  if (cdsDiagnosticoAplicar.RecNo <= 0) or (cdsDiagnosticoAplicarQUARTO.IsNull) then
    exit;

  if cdsDiagnosticoAplicar.State in [dsInsert, dsEdit] then
   cdsDiagnosticoAplicar.Edit;

  cdsDiagnosticoAplicarQUARTO.Clear;
  cdsDiagnosticoAplicarQUARTO_DESCR.Text := '';
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.CloneCDS;
begin
  FCDSClone.PacketRecords := 0 ;
  FCDSClone.CloneCursor(cdsDiagnosticoAplicar, false, false);
end;

constructor TZoo_SanidadeDiagnosticosDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  FCDSClone := TClientDataSet.Create(Self);
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.dtsDiagnosticoAplicarDataChange(
  Sender: TObject; Field: TField);
begin
  if not Assigned( Field )
 or  (Assigned( Field ) and (Field = cdsDiagnosticoAplicarKZOO_DIAGNOSTICO)) then
    begin

      cdsProtocolos.Filtered := False ;
      cdsProtocolos.Filtered := True ;
//      cdsProtocolos.Locate(
//            'KZOO_PROTOCOLO'
//          , cdsPadroesKZOO_PROTOCOLO.asString
//          ,[] )

    end;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.dtsPadroesDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned( Field ) and (Field = cdsPadroesKZOO_DIAGNOSTICO) then
    begin

      cdsProtocolosPadrao.Filtered := False ;
      cdsProtocolosPadrao.Filtered := True ;
//      cdsPadroesCODIGO_PROTOCOLO.RefreshLookupList ;
//      cdsProtocolos.Locate(
//            'KZOO_PROTOCOLO'
//          , cdsPadroesKZOO_PROTOCOLO.asString
//          ,[] )

    end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.dspDiagnosticoAplicarBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if ( SourceDS = sqlDiagnosticoAplicar ) then
    InsereDiagnostico ( DeltaDS.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString,
                        DeltaDS.FieldByName( 'KZOO_DIAGNOSTICO' ).asString,
                        DeltaDS.FieldByName( 'QUARTO' ).asInteger,
                        DeltaDS.FieldByName( 'DATA' ).asDateTime,
                        DeltaDS.FieldByName( 'KZOO_PROTOCOLO' ).asString ) ;

  Applied := True ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.InsereDiagnostico( AKAnimal : string ; ADiagnostico : String ; AQuarto : integer ; ADate : TDateTime ; AProtocolo: String )  ;
var
  KDiagnosticoAnimal : string ;
begin
    Try

      KDiagnosticoAnimal := TDiagnosticosAnimal.AddDiagnostico ( AKAnimal, ADiagnostico, AQuarto, ADate, '', True,  False  ) ;

      if AProtocolo <> '' then
        TProtocolosAnimal.AddProtocolo ( AKAnimal, AProtocolo, ADate, KDiagnosticoAnimal, '', '', 0, True, '', True, False ) ;

    except on E : Exception do
        RaiseException( E, UnitName, ClassName,  'InsereDiagnostico' )
    End;

end;




procedure TZoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticosAplicar;
begin
  TCDSSuppl.Open (  cdsDiagnosticoAplicar ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenTables;
//const
//  _SELECT_PROTOCOLOS =
//         'SELECT KZOO_PROTOCOLO, CODIGO FROM ZOO_PROTOCOLOS'
//  +#13#10' UNION ALL '
//  +#13#10' SELECT NULL AS KZOO_PROTOCOLO, '''' AS CODIGO FROM RDB$DATABASE ';

(*
const
  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS =
         'SELECT'
  +#13#10'  DP.KZOO_DIAGNOSTICO'
  +#13#10', P.KZOO_PROTOCOLO'
  +#13#10', ''*'' || P.CODIGO || '''' AS CODIGO'
  +#13#10'FROM ZOO_DIAGNOSTICO_PROTOCOLOS DP'
  +#13#10'INNER JOIN ZOO_PROTOCOLOS P ON DP.KZOO_PROTOCOLO = P.KZOO_PROTOCOLO'
  +#13#10'INNER JOIN ZOO_DIAGNOSTICOS D ON D.KZOO_DIAGNOSTICO = DP.KZOO_DIAGNOSTICO'
  +#13#10'WHERE'
  +#13#10'     D.ATIVO = ''T'''
  +#13#10' AND P.ATIVO = ''T'''
  +#13#10'UNION ALL'
  +#13#10'SELECT'
  +#13#10'  NULL'
  +#13#10', P.KZOO_PROTOCOLO'
  +#13#10', P.CODIGO'
  +#13#10'FROM ZOO_PROTOCOLOS P'
  +#13#10'WHERE P.ATIVO = ''T'''
  +#13#10'ORDER BY 1 NULLS LAST, 3' ;
*)
//  _SELECT_DIAGNOSTICOS =
//     'SELECT D.KZOO_DIAGNOSTICO,D.CODIGO FROM ZOO_DIAGNOSTICOS D';

const
  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS2 =
          'WITH DIAGNOSTICOS_PROTOCOLOS AS'
   +#13#10'  (SELECT'
   +#13#10'    D.KZOO_DIAGNOSTICO'
   +#13#10'  , P.KZOO_PROTOCOLO'
   +#13#10'  , P.CODIGO'
   +#13#10'  FROM ZOO_DIAGNOSTICOS D,ZOO_PROTOCOLOS P'
   +#13#10'   WHERE D.ATIVO = ''T'''
   +#13#10'    AND P.ATIVO IS DISTINCT FROM ''F'''
   +#13#10' )'
   +#13#10' SELECT'
   +#13#10'    D.KZOO_DIAGNOSTICO,'
   +#13#10'    '''' KZOO_PROTOCOLO,'
   +#13#10'    '''' CODIGO,'
   +#13#10'    '''' VINCULADO'
   +#13#10' FROM ZOO_DIAGNOSTICOS D'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'    DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO,  DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO,'
   +#13#10'    CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'      ELSE ''*''||DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'    END CODIGO,'
   +#13#10'    CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN ''F'' '
   +#13#10'      ELSE ''T'' '
   +#13#10'    END VINCULADO '
   +#13#10' FROM DIAGNOSTICOS_PROTOCOLOS'
   +#13#10' LEFT JOIN ZOO_DIAGNOSTICO_PROTOCOLOS DP'
   +#13#10'    ON     DP.KZOO_DIAGNOSTICO = DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO'
   +#13#10'      AND  DP.KZOO_PROTOCOLO = DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO'
   +#13#10'ORDER BY  1, 3, 2' ;
  // +#13#10'ORDER BY  1, 2, 3' ;

begin
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsQuartoPadrao );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsQuarto );

  TCDSSuppl.Open (  cdsDiagnosticosPadrao ) ;
  TCDSSuppl.Open (  cdsDiagnosticos ) ;

  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolos,       _SELECT_PROTOCOLOS_X_DIAGNOSTICOS2 ) ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolosPadrao, _SELECT_PROTOCOLOS_X_DIAGNOSTICOS2 ) ;

  inherited;

  cdsPadroes.CreateDataSet  ;
  OpenDiagnosticosAplicar   ;

end;

function TZoo_SanidadeDiagnosticosDatamodule.PorQuarto: Boolean;
begin
  Result := cdsDiagnosticosPOR_QUARTO.AsBoolean;

  if not Result then
    ClearQuarto;
end;

function TZoo_SanidadeDiagnosticosDatamodule.PorQuartoDefault: Boolean;
begin
  Result := cdsDiagnosticosPadraoPOR_QUARTO.AsBoolean;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.RemoveDiagnostico;
begin
  if not cdsDiagnosticoAplicar.IsEmpty then
     cdsDiagnosticoAplicar.Delete;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetProtocolo(KProtocolo: Variant);
begin
  if not  (cdsDiagnosticoAplicar.State in [dsEdit, dsInsert])  then
   exit;

  if (VarIsNull( KProtocolo )) or (VarIsEmpty( KProtocolo )) and
     (not cdsDiagnosticoAplicarKZOO_PROTOCOLO.IsNull ) then
     cdsDiagnosticoAplicarKZOO_PROTOCOLO.Clear
  else
  if (not ((VarIsNull( KProtocolo )) or (VarIsEmpty( KProtocolo ))) ) and
     ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant <> KProtocolo ) then
      cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant := KProtocolo;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetProtocoloVinculado;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolos, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr(cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.NewValue)+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if ( cds.RecordCount = 1 ) and
     ( (cdsDiagnosticoAplicarKZOO_PROTOCOLO.isNull ) or
       ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant <> cds.FieldByName('KZOO_PROTOCOLO').AsVariant ) ) then
   begin
    cdsDiagnosticoAplicarCODIGO_PROTOCOLO.AsVariant := cds.FieldByName('CODIGO').AsVariant;
    cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant := cds.FieldByName('KZOO_PROTOCOLO').AsVariant;
    cdsDiagnosticoAplicarDESC_PROTOCOLO.asString  := cds.FieldByName('CODIGO').AsVariant;
   end;

  FreeAndNil(cds);
end;

function TZoo_SanidadeDiagnosticosDatamodule.GetProtocoloVinculadoDefault( KDiagnosticoPadrao: Variant): Variant;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolosPadrao, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr( KDiagnosticoPadrao )+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if ( cds.RecordCount = 1 ) then
   begin
    Result := cds.FieldByName('KZOO_PROTOCOLO').AsVariant;
   end
  else
    Result := null;

  FreeAndNil(cds);

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetUseQuickInput(
  const Value: boolean);
begin
  FUseQuickInput := Value;
end;

function TZoo_SanidadeDiagnosticosDatamodule.ValidRegister: Boolean;
var
 LQuarto : Integer;
begin
  Result := True;
  if (cdsDiagnosticoAplicarDATA.AsString = '') or
     (cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString = '') or
     (cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsString = '')  then
   exit;

  LQuarto := 0;
  if not cdsDiagnosticoAplicarQUARTO.IsNull then
    LQuarto := cdsDiagnosticoAplicarQUARTO.AsInteger;

  if (not FCDSClone.IsEmpty) and
     FCDSClone.Locate('KZOO_ANIMAL_FEMEA;DATA;KZOO_DIAGNOSTICO;KZOO_PROTOCOLO;QUARTO',
                varArrayOf([cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.AsString,
                            cdsDiagnosticoAplicarDATA.AsString,
                            cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString,
                            cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsString,
                            LQuarto ]),[]) then
   begin
     if FCDSClone.FieldByName('GUID20').AsString <> cdsDiagnosticoAplicarGUID20.AsString then
      begin
        Result := False;

      end;

   end;
end;

end.
