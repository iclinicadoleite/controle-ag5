unit UZoo_DescartesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_DescartesDatamodule = class(T_dtmBASE)
    dspDescartes: TDataSetProvider;
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
    cdsTipoRazaoDescartePadrao: TClientDataSet;
    cdsTipoRazaoDescartePadraoTIPO: TStringField;
    cdsTipoRazaoDescartePadraoVALOR: TStringField;
    cdsTipoRazaoDescartePadraoDESCRICAO: TStringField;
    cdsTipoRazaoDescartePadraoORDEM: TIntegerField;
    cdsTipoMotivoDescartePadrao: TClientDataSet;
    cdsTipoMotivoDescartePadraoTIPO: TStringField;
    cdsTipoMotivoDescartePadraoVALOR: TStringField;
    cdsTipoMotivoDescartePadraoDESCRICAO: TStringField;
    cdsTipoMotivoDescartePadraoORDEM: TIntegerField;
    sqlDescartesOBS: TMemoField;
    cdsDescartesOBS: TMemoField;
    cdsDescartesBRINCO: TStringField;
    cdsDescartesNOMEESTABULO: TStringField;
    procedure dspDescartesBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsTipoRazaoDescarteFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsTipoMotivoDescarteFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsTipoRazaoDescartePadraoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsTipoMotivoDescartePadraoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure UpdateCalculoLactacao( const AKZOOANIMAL : string ) ;
  public
    { Public declarations }
    function LocateBrinco ( ABrinco : string  ) : boolean ;
    procedure OpenTables ; override ;
    function AddBrinco ( ABrinco : string  ; AData : TDateTime; AValor: Double; ANomeComprador: String ) : boolean ;
    function AddByKey ( AKey : string ; AData : TDateTime;  AValor: Double; ANomeComprador:String ) : boolean ;
    procedure RemoveEvento ;
    procedure ApplyUpdates ; override ;
  end;

implementation

uses Exceptions, Tc.DBRTL.AbstractDB,
     UDBZootecnico,
     CLAg5Types,
     ClAg5ClientZootecnicoCommonTypes,
     CDSSuppl;

{$R *.dfm}

procedure TZoo_DescartesDatamodule.OpenTables;
begin
  //inherited;
  //
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RAZAO_DESCARTE,       cdsTipoRazaoDescarte   ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_MOTIVO_DESCARTE,      cdsTipoMotivoDescarte  ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RAZAO_DESCARTE,       cdsTipoRazaoDescartePadrao   ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_MOTIVO_DESCARTE,      cdsTipoMotivoDescartePadrao  ) ;

  cdsTipoRazaoDescarte.OnFilterRecord        := cdsTipoRazaoDescarteFilterRecord        ;
  cdsTipoMotivoDescarte.OnFilterRecord       := cdsTipoMotivoDescarteFilterRecord       ;
  cdsTipoRazaoDescartePadrao.OnFilterRecord  := cdsTipoRazaoDescartePadraoFilterRecord  ;
  cdsTipoMotivoDescartePadrao.OnFilterRecord := cdsTipoMotivoDescartePadraoFilterRecord ;

  cdsTipoRazaoDescarte.Filtered := True ;
  cdsTipoMotivoDescarte.Filtered := True ;
  cdsTipoRazaoDescartePadrao.Filtered := True ;
  cdsTipoMotivoDescartePadrao.Filtered := True ;
  TCDSSuppl.CreateDataSet( cdsDescartes ) ;
end;


procedure TZoo_DescartesDatamodule.RemoveEvento;
begin
   if not cdsDescartes.isEmpty then
      cdsDescartes.Delete ;
end;

function TZoo_DescartesDatamodule.AddBrinco( ABrinco: string ; AData : TDateTime; AValor: Double; ANomeComprador: String ) : boolean ;
var
    KeyAnimal : string ;
begin
    Result := LocateBrinco ( ABrinco ) ;

    if Result then
      begin
         cdsDescartes.Edit ;
         exit ;
      end ;

    Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

    if Result then
       AddByKey ( KeyAnimal, AData, AValor, ANomeComprador )  ;

end ;

function TZoo_DescartesDatamodule.AddByKey(AKey: string; AData: TDateTime; AValor: Double; ANomeComprador:String ): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKey ;
    cds := nil ;
    try
//       DBResources.populateClientDataSet( cds, 'KZOO_ANIMAL,  BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( BRINCO = :BRINCO )', p ) ;

       TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'KZOO_ANIMAL, BRINCO, NOMEESTABULO, STATUS FROM ZOO_ANIMAIS WHERE ( KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( KZOO_ANIMAL = :KZOO_ANIMAL )', p ) ;

       Result := not cds.IsEmpty ;

       if not Result then
         raise Warning.Create('Brinco/Animal não encontrado');

       if ( cds.fieldByName ( 'STATUS' ).asInteger = _ST_STATUS_ANIMAL_DESCARTADO ) then
         raise Warning.Create('Animal Descartado');

       with cds do
         begin
           cdsDescartes.Append ;
           cdsDescartesKZOO_ANIMAL.asString       := fieldByName ( 'KZOO_ANIMAL' ).asString  ;
           cdsDescartesBRINCO.asString            := fieldByName ( 'BRINCO' ).asString       ;
           cdsDescartesNOMEESTABULO.asString      := fieldByName ( 'NOMEESTABULO' ).asString ;
           cdsDescartesDATA.asDateTime            := AData ;
           cdsDescartesRAZAO.asString             := cdsTipoRazaoDescartePadraoVALOR.asString ;
           cdsDescartesMOTIVO.asString            := cdsTipoMotivoDescartePadraoVALOR.asString ;
           cdsDescartesPRECOVENDA.AsFloat         := AValor;
           cdsDescartesNOMECOMPRADOR.AsString     := ANomeComprador;
         end

    finally
       cds.Free ;
       p.free ;
    end;

end;


procedure TZoo_DescartesDatamodule.ApplyUpdates;
begin
   TCDSSuppl.ApplyUpdates ( cdsDescartes ) ;
   TCDSSuppl.CreateDataSet( cdsDescartes ) ;
end;

procedure TZoo_DescartesDatamodule.cdsTipoMotivoDescarteFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    Accept := ( cdsTipoMotivoDescarteTIPO.asString = _ST_MOTIVO_DESCARTE )
         // and ( Trim ( cdsTipoMotivoDescarteVALOR.AsString ) <> '' )
end;

procedure TZoo_DescartesDatamodule.cdsTipoMotivoDescartePadraoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    Accept := ( cdsTipoMotivoDescartePadraoTIPO.asString = _ST_MOTIVO_DESCARTE )
       //   and ( Trim ( cdsTipoMotivoDescartePadraoVALOR.AsString ) <> '' )
end;

procedure TZoo_DescartesDatamodule.cdsTipoRazaoDescarteFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept :=  ( cdsTipoRazaoDescarteTIPO.asString = _ST_RAZAO_DESCARTE )
          and ( Trim ( cdsTipoRazaoDescarteVALOR.AsString ) <> '' )
end;

procedure TZoo_DescartesDatamodule.cdsTipoRazaoDescartePadraoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    Accept := ( cdsTipoRazaoDescartePadraoTIPO.asString = _ST_RAZAO_DESCARTE )
          and ( Trim ( cdsTipoRazaoDescartePadraoVALOR.AsString ) <> '' )
end;


procedure TZoo_DescartesDatamodule.UpdateCalculoLactacao( const AKZOOANIMAL : string ) ;
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


procedure TZoo_DescartesDatamodule.dspDescartesBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
const
  _UPDATE_STMT =  'UPDATE OR INSERT INTO ZOO_ANIMAL_DESCARTES'
   +#13#10'  ( KZOO_ANIMAL, KCAD_COMPRADOR, DATA, RAZAO, MOTIVO, NOMECOMPRADOR, PRECOVENDA, OBS )'
   +#13#10'VALUES'
   +#13#10'  ( :KZOO_ANIMAL, :KCAD_COMPRADOR, :DATA, :RAZAO, :MOTIVO, :NOMECOMPRADOR, :PRECOVENDA, :OBS )'
   +#13#10'MATCHING ( KZOO_ANIMAL )' ;

(*  _UPDATE_STMT =  'UPDATE ZOO_ANIMAIS SET STATUS '
   + #13#10'  ( KZOO_ANIMAL, KCAD_COMPRADOR, DATA, RAZAO, MOTIVO, NOMECOMPRADOR, PRECOVENDA, OBS )'
   + #13#10'VALUES'
   + #13#10'  ( :KZOO_ANIMAL, :KCAD_COMPRADOR, :DATA, :RAZAO, :MOTIVO, :NOMECOMPRADOR, :PRECOVENDA, :OBS )'
   + #13#10'MATCHING KZOO_ANIMAL' ;
  *)
var
 p: TParams;
 obsStrm : TMemoryStream ;
 LKAnimal : string ;
begin

  LKAnimal := DeltaDS.FieldByName ( 'KZOO_ANIMAL'     ).asString ;

  p := TParams.Create( nil );
  p.CreateParam( ftString,    'KZOO_ANIMAL',    ptInput ).asString       := LKAnimal ;
  with p.CreateParam( ftString,    'KCAD_COMPRADOR', ptInput ) do
    begin
      bound := false ;
      if DeltaDS.FieldByName ( 'KCAD_COMPRADOR'  ).AsString <> '' then
         AsString       := DeltaDS.FieldByName ( 'KCAD_COMPRADOR'  ).AsString ;
    end ;
  p.CreateParam( ftTimeStamp, 'DATA',           ptInput ).AsSQLTimeStamp := DeltaDS.FieldByName ( 'DATA'            ).AsSQLTimeStamp  ;
  p.CreateParam( ftString,    'RAZAO',          ptInput ).AsString       := DeltaDS.FieldByName ( 'RAZAO'           ).AsString ;

  if DeltaDS.FieldByName ( 'MOTIVO'          ).AsString = '' then
     p.CreateParam( ftString,    'MOTIVO',         ptInput ).Clear
  else
     p.CreateParam( ftString,    'MOTIVO',         ptInput ).AsString       := DeltaDS.FieldByName ( 'MOTIVO'          ).AsString ;

  p.CreateParam( ftString,    'NOMECOMPRADOR',  ptInput ).AsString       := DeltaDS.FieldByName ( 'NOMECOMPRADOR'   ).AsString ;
  p.CreateParam( ftString,    'PRECOVENDA',     ptInput ).AsFloat        := DeltaDS.FieldByName ( 'PRECOVENDA'      ).AsFloat ;
  with p.CreateParam( ftBlob, 'OBS',            ptInput ) do
    begin
       Bound := False ;
       if not DeltaDS.FieldByName ( 'OBS' ).isNull then
          try
            obsStrm := TStringStream.Create ;
            TBlobField ( DeltaDS.FieldByName ( 'OBS' ) ).SaveToStream( obsStrm );
            obsStrm.Position := 0 ;
            LoadFromStream ( obsStrm, ftBlob ) ;
          finally
            obsStrm.Free
          end;
    end ;

  try
     sqlDescartes.SQLConnection.Execute( _UPDATE_STMT, p ) ;
     UpdateCalculoLactacao ( LKAnimal ) ;
     Applied := True ;
  finally
    p.Free ;
  end;

end;

function TZoo_DescartesDatamodule.LocateBrinco(ABrinco: string): boolean;
begin
   Result := cdsDescartes.Locate( 'BRINCO', ABrinco, [] ) ;
end;

end.
