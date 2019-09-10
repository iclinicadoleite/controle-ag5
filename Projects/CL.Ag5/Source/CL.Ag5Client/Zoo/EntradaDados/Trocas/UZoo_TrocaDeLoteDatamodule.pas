unit UZoo_TrocaDeLoteDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE,
  CLAg5Types ;

type
  TZoo_TrocaDeLoteDatamodule = class(T_dtmBASE)
    cdsTrocaLote: TClientDataSet;
    dspTrocaLote: TDataSetProvider;
    sqlTrocaLote: TTcSQLDataSet;
    sqlTrocaLoteKZOO_ANIMAL_FEMEA: TStringField;
    sqlTrocaLoteBRINCO: TStringField;
    sqlTrocaLoteNOMEESTABULO: TStringField;
    sqlTrocaLoteLOTEORIGEM: TStringField;
    sqlTrocaLoteLOTE: TStringField;
    cdsTrocaLoteKZOO_ANIMAL_FEMEA: TStringField;
    cdsTrocaLoteBRINCO: TStringField;
    cdsTrocaLoteNOMEESTABULO: TStringField;
    cdsTrocaLoteLOTEORIGEM: TStringField;
    cdsTrocaLoteLOTE: TStringField;
    sqlTrocaLoteDATALOTE: TSQLTimeStampField;
    cdsTrocaLoteDATALOTE: TSQLTimeStampField;
    sqlTrocaLotePROCESSAR: TStringField;
    cdsTrocaLotePROCESSAR: TStringField;
    sqlTrocaLoteBRINCO_: TStringField;
    cdsTrocaLoteBRINCO_: TStringField;
    procedure dspTrocaLoteBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure cdsTrocaLoteBeforePost(DataSet: TDataSet);
    procedure cdsTrocaLoteLOTESetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    function AddBrinco ( ABrinco : string ; ALote : String ; AData : TDateTime ) : boolean ;
    function AddLote(ASourceLote, ATargetLote : String ; AData : TDateTime ): boolean;
    procedure GetListaLote( AList : TStrings ) ;
    procedure RemoveRecord ;
  end;

implementation

uses Exceptions, UDBZootecnico, CDSSuppl;

{$R *.dfm}

procedure TZoo_TrocaDeLoteDatamodule.ApplyUpdates;
begin
  CDSSuppl.TCDSSuppl.ApplyUpdates( cdsTrocaLote ) ;
  OpenTables ;
end;

procedure TZoo_TrocaDeLoteDatamodule.cdsTrocaLoteBeforePost(DataSet: TDataSet);
begin
  inherited;
//  if Trim ( cdsTrocaLoteLOTE.asString ) = '' then
//    raise Warning.Create('Campo Novo Lote deve ser preenchido');
end;

procedure TZoo_TrocaDeLoteDatamodule.cdsTrocaLoteLOTESetText(Sender: TField;
  const Text: string);
begin
  if Trim ( Text ) = '' then
     Sender.asString := ''
  else
     Sender.asString := Trim ( Text ) ;
end;

procedure TZoo_TrocaDeLoteDatamodule.dspTrocaLoteBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;

  if DeltaDS.FieldByName ( 'PROCESSAR').AsBoolean then
     sqlTrocaLote.SQLConnection.ExecuteDirect(
        Format (
         'UPDATE ZOO_ANIMAIS_FEMEA SET LOTE = %s, DATALOTE = %s WHERE KZOO_ANIMAL_FEMEA = %s',
           [ QuotedStr ( Trim ( DeltaDS.FieldByName ( 'LOTE' ).asString ) ),
             QuotedStr ( FormatDateTime ( 'dd.mm.yyyy', DeltaDS.FieldByName ( 'DATALOTE' ).asDateTime ) ),
             QuotedStr ( DeltaDS.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ) ] ) ) ;
  Applied := True ;

end;

procedure TZoo_TrocaDeLoteDatamodule.OpenTables;
begin
  TCDSSuppl.CreateDataSet( cdsTrocaLote ) ;
  cdsTrocaLote.IndexFieldNames := 'BRINCO_' ;
end;


procedure TZoo_TrocaDeLoteDatamodule.RemoveRecord;
begin
   if not cdsTrocaLote.isEmpty then
      cdsTrocaLote.Delete ;
end;

function TZoo_TrocaDeLoteDatamodule.AddBrinco(ABrinco: string ; ALote : String ; AData : TDateTime ): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin
    Result := cdsTrocaLote.Locate( 'BRINCO', ABrinco, [] ) ;
    if Result then
      begin
         cdsTrocaLote.Edit ;
         exit ;
      end ;

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'BRINCO', ptInput ).asString := ABrinco ;
    p.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
              'AF.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.BRINCO_, A.NOMEESTABULO, AF.LOTE'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO )'
       +#13#10'       AND ( A.STATUS <> :STATUS_DESCARTADO )',
       p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
             begin
               cdsTrocaLote.Append ;
               cdsTrocaLoteKZOO_ANIMAL_FEMEA.asString  :=  fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
               cdsTrocaLoteBRINCO.asString       :=  fieldByName ( 'BRINCO' ).asString ;
               cdsTrocaLoteBRINCO_.asString      :=  fieldByName ( 'BRINCO_' ).asString ;
               cdsTrocaLoteNOMEESTABULO.asString :=  fieldByName ( 'NOMEESTABULO' ).asString ;
               cdsTrocaLoteLOTEORIGEM.asString   :=  fieldByName ( 'LOTE' ).asString ;
               cdsTrocaLoteLOTE.asString         :=  fieldByName ( 'LOTE' ).asString {ALote} ;
               cdsTrocaLoteDATALOTE.asDateTime   :=  AData  ;
               cdsTrocaLotePROCESSAR.asString    :=  'T'  ;
               cdsTrocaLote.Post ;
             end
         else
            raise Warning.Create('Brinco não encontrado');

    finally
       cds.Free ;
       p.free ;
    end;

end;


function TZoo_TrocaDeLoteDatamodule.AddLote(ASourceLote, ATargetLote : String ; AData : TDateTime ): boolean;
var
    cds : TClientDataSet ;
    p : TParams ;
begin


    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    p.CreateParam( ftString, 'LOTE', ptInput ).asString := ASourceLote ;
    p.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
              'AF.KZOO_ANIMAL_FEMEA,  A.BRINCO, A.BRINCO_, A.NOMEESTABULO, AF.LOTE'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( AF.LOTE = :LOTE )'
       +#13#10'       AND ( A.STATUS <> :STATUS_DESCARTADO )',
        p ) ;
       Result := not cds.IsEmpty ;

       if Result then
         with cds do
             while not eof do
               begin
                 if cdsTrocaLote.Locate( 'KZOO_ANIMAL_FEMEA', fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString, [] ) then
                   cdsTrocaLote.Edit
                 else
                   cdsTrocaLote.Append ;
                 cdsTrocaLoteKZOO_ANIMAL_FEMEA.asString  :=  fieldByName ( 'KZOO_ANIMAL_FEMEA' ).asString ;
                 cdsTrocaLoteBRINCO.asString       :=  fieldByName ( 'BRINCO' ).asString ;
                 cdsTrocaLoteBRINCO_.asString      := fieldByName  ( 'BRINCO_' ).asString ;
                 cdsTrocaLoteNOMEESTABULO.asString :=  fieldByName ( 'NOMEESTABULO' ).asString ;
                 cdsTrocaLoteLOTEORIGEM.asString   :=  fieldByName ( 'LOTE' ).asString ;
                 cdsTrocaLoteLOTE.asString         :=  ATargetLote ;
                 cdsTrocaLoteDATALOTE.asDateTime   :=  AData  ;
                 cdsTrocaLotePROCESSAR.asString    :=  'T'  ;
                 cdsTrocaLote.Post ;
                 Next ;
               end
         else
            raise Warning.Create('Não há animais neste lote');

    finally
       cds.Free ;
       p.free ;
    end;

end;

procedure TZoo_TrocaDeLoteDatamodule.GetListaLote( AList : TStrings ) ;
var
    cds : TClientDataSet ;
    p : TParams ;
begin

    p := TParams.Create ;
    p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID ;
    cds := nil ;
    try
       DBResources['ZOOTECNICO'].populateClientDataSet( cds,
              'DISTINCT AF.LOTE'
       +#13#10'FROM ZOO_ANIMAIS_FEMEA AF'
       +#13#10'INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA )', p ) ;

       AList.beginUpdate ;
       with cds do
         while not eof do
           begin
             AList.Add( fieldByName ( 'LOTE' ).asString ) ;
             Next ;
           end ;
       AList.EndUpdate ;
    finally
       cds.Free ;
       p.free ;
    end;

end;

end.
