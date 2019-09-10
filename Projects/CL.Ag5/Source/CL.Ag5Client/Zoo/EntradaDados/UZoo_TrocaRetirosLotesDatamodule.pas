unit UZoo_TrocaRetirosLotesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, SqlTimSt,  Tc.VCL.Form,
  Datasnap.Provider, UdtmSYS_BASE;

type
  TZooTrocaRetirosLotesDatamodule = class(T_dtmBASE)
    sqlAnimaisOrigem: TTcSQLDataSet;
    dspAnimaisOrigem: TDataSetProvider;
    cdsAnimaisOrigem: TClientDataSet;
    sqlAnimaisOrigemBRINCO: TStringField;
    sqlAnimaisOrigemNUMERO_LACTACAO: TIntegerField;
    sqlAnimaisOrigemSTATUS: TIntegerField;
    sqlAnimaisOrigemDPP: TLargeintField;
    sqlAnimaisOrigemSTATUS_REPRODUTIVO: TStringField;
    sqlAnimaisOrigemULTIMA_PRODUCAO: TFloatField;
    sqlAnimaisOrigemCCS: TIntegerField;
    cdsAnimaisOrigemBRINCO: TStringField;
    cdsAnimaisOrigemNUMERO_LACTACAO: TIntegerField;
    cdsAnimaisOrigemSTATUS: TIntegerField;
    cdsAnimaisOrigemDPP: TLargeintField;
    cdsAnimaisOrigemSTATUS_REPRODUTIVO: TStringField;
    cdsAnimaisOrigemULTIMA_PRODUCAO: TFloatField;
    cdsAnimaisOrigemCCS: TIntegerField;
    sqlAnimaisOrigemKZOO_ANIMAL: TStringField;
    cdsAnimaisOrigemKZOO_ANIMAL: TStringField;
    cdsAnimaisDestino: TClientDataSet;
    cdsAnimaisDestinoKZOO_ANIMAL: TStringField;
    cdsAnimaisDestinoBRINCO: TStringField;
    cdsAnimaisDestinoNUMERO_LACTACAO: TIntegerField;
    cdsAnimaisDestinoDPP: TIntegerField;
    cdsAnimaisDestinoSTATUS_REPRODUTIVO: TStringField;
    cdsAnimaisDestinoSTATUS: TIntegerField;
    cdsAnimaisDestinoULTIMA_PRODUCAO: TFloatField;
    cdsAnimaisDestinoCCS: TIntegerField;
    sqlAnimaisOrigemLOTE: TStringField;
    sqlAnimaisOrigemRETIRO: TStringField;
    cdsAnimaisOrigemLOTE: TStringField;
    cdsAnimaisOrigemRETIRO: TStringField;
    cdsAnimaisDestinoLOTE: TStringField;
    cdsAnimaisDestinoRETIRO: TStringField;
    sqlAnimaisOrigemDEG: TIntegerField;
    cdsAnimaisOrigemDEG: TIntegerField;
    cdsAnimaisDestinoDEG: TIntegerField;
  private
    { Private declarations }
    FLoteOri         : String;
    FRetiroOri       : String;
    FAllRetiroOri    : String;
    FAllLoteOri      : String;
    FLoteOriIsNull   : Boolean;
    FRetiroOriIsNull : Boolean;
    FListaLotes      : TStringList;
    FListaRetiro     : TStringList;
    FAllRetiroDes    : String;
    FAllLoteDes      : String;
    FDataTroca       : TDateTime ;
    FLoteDes         : String;
    FRetiroDes       : String;
    FLoteDesIsNull   : Boolean;
    FRetiroDesIsNull : Boolean;
    FQtdeAnimaisDestino : Integer;
    procedure SetAllLoteOri(const Value: String);
    procedure SetAllRetiroOri(const Value: String);
    procedure SetLoteOri(const Value: String);
    procedure SetRetiroOri(const Value: String);
    procedure SetParams;
    procedure SetParamsDestino(var AParam : TParams);
    procedure TransferDataCDS(cdsOri, cdsDes: TClientDataSet);
    procedure LoadListaRetiros;
    procedure LoadListaLotes;
    procedure SetDataTroca(const Value: TDateTime);
    procedure SetLoteDes(const Value: String);
    procedure SetRetiroDes(const Value: String);
    procedure SetLoteOriIsNull(const Value: Boolean);
    procedure SetRetiroOriIsNull(const Value: Boolean);
    procedure ValidFields;
    procedure SetQtdeAnimaisDestino(const Value: Integer);
    procedure SetAllLoteDes(const Value: String);
    procedure SetAllRetiroDes(const Value: String);
    procedure SetLoteDesIsNull(const Value: Boolean);
    procedure SetRetiroDesIsNull(const Value: Boolean);
  public
    { Public declarations }
    procedure Selecionar;
    procedure Desselecionar;
    procedure SelecionarTodos;
    procedure DesselecionarTodos;
    procedure CountAnimaisDestino;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenTables ; override ;
    function  Process: Boolean;
    property  AllLoteOri       : String        read  FAllLoteOri       write SetAllLoteOri;
    property  AllRetiroOri     : String        read  FAllRetiroOri     write SetAllRetiroOri;
    property  LoteOri          : String        read  FLoteOri          write SetLoteOri;
    property  RetiroOri        : String        read  FRetiroOri        write SetRetiroOri;
    property  LoteOriIsNull    : Boolean       read  FLoteOriIsNull    write SetLoteOriIsNull;
    property  RetiroOriIsNull  : Boolean       read  FRetiroOriIsNull  write SetRetiroOriIsNull;
    property  LoteDes          : String        read  FLoteDes          write SetLoteDes;
    property  RetiroDes        : String        read  FRetiroDes        write SetRetiroDes;
    property  AllLoteDEs       : String        read  FAllLoteDes       write SetAllLoteDes;
    property  AllRetiroDes     : String        read  FAllRetiroDes     write SetAllRetiroDes;
    property  LoteDesIsNull    : Boolean       read  FLoteDesIsNull    write SetLoteDesIsNull;
    property  RetiroDesIsNull  : Boolean       read  FRetiroDesIsNull  write SetRetiroDesIsNull;
    property  DataTroca        : TDateTime     read  FDataTroca        write SetDataTroca;
    property  ListaLotes       : TStringList   read  FListaLotes;
    property  ListaRetiros     : TStringList   read  FListaRetiro;
    property  QtdeAnimaisDestino : Integer    read  FQtdeAnimaisDestino write SetQtdeAnimaisDestino;
  end;


implementation

uses Exceptions, Tc.DBRTL.AbstractDB,
     UDBZootecnico,
     CLAg5Types,
     ClAg5ClientZootecnicoCommonTypes,
     CDSSuppl;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TZooTrocaRetirosLotesDatamodule }



{ TZooTrocaRetirosLotesDatamodule }



procedure TZooTrocaRetirosLotesDatamodule.CountAnimaisDestino;
var
  cds: TClientDataSet;
  select_count : String;
  p : TParams;
begin
  cds := nil;
  select_count := Copy(sqlAnimaisOrigem.CommandText,
                       Pos('FROM ZOO_ANIMAIS',sqlAnimaisOrigem.CommandText),
                       sqlAnimaisOrigem.CommandText.Length);

  select_count := Copy(select_count,
                       1,
                       select_count.Length - (select_count.Length - (Pos('ORDER BY',select_count) - 1)) );

  select_count := 'SELECT COUNT(*) ' + select_count;
  SetParamsDestino(p);
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, select_count , p );
  FQtdeAnimaisDestino := cds.Fields[0].AsInteger;
  cds.Free;
  p.Free;
end;

constructor TZooTrocaRetirosLotesDatamodule.Create(AOwner: TComponent);
begin
  inherited;
  FListaRetiro := TStringList.Create;
  FListaLotes  := TStringList.Create;
  LoadListaLotes;
  LoadListaRetiros;
end;

procedure TZooTrocaRetirosLotesDatamodule.Desselecionar;
begin
  cdsAnimaisOrigem.DisableControls;
  cdsAnimaisDestino.DisableControls;
  TransferDataCDS( cdsAnimaisDestino ,cdsAnimaisOrigem );
  cdsAnimaisOrigem.EnableControls;
  cdsAnimaisDestino.EnableControls;
end;

procedure TZooTrocaRetirosLotesDatamodule.DesselecionarTodos;
begin
  cdsAnimaisOrigem.DisableControls;
  cdsAnimaisDestino.DisableControls;
  cdsAnimaisDestino.First;
  while not cdsAnimaisDestino.Eof do
   begin
     TransferDataCDS( cdsAnimaisDestino, cdsAnimaisOrigem );
   end;
  cdsAnimaisOrigem.EnableControls;
  cdsAnimaisDestino.EnableControls;
end;

destructor TZooTrocaRetirosLotesDatamodule.Destroy;
begin
  FListaRetiro.Free;;
  FListaLotes.Free;
  inherited;
end;

procedure TZooTrocaRetirosLotesDatamodule.LoadListaLotes;
const
  SELECT_LOTES =
             'WITH LOTES AS('
      +#13#10'  SELECT DISTINCT COALESCE(AF.LOTE,'''') AS LOTE,  lpad(AF.LOTE, 10, ''0'' ) LOTE_'
      +#13#10'    FROM ZOO_ANIMAIS_FEMEA AF'
      +#13#10'   INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
      +#13#10'   WHERE A.STATUS <> :STATUS_DESCARTE '
    {  +#13#10'  UNION ALL'
      +#13#10'  SELECT DISTINCT COALESCE(AM.LOTE,'''') AS LOTE,  lpad(AM.LOTE, 10, ''0'' ) LOTE_'
      +#13#10'    FROM ZOO_ANIMAIS_MACHO AM'
      +#13#10'   INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AM.KZOO_ANIMAL_MACHO'
      +#13#10'   WHERE A.STATUS <> :STATUS_DESCARTE'         }
      +#13#10')'
      +#13#10'SELECT DISTINCT LOTE FROM LOTES ORDER BY LOTE_'
      ;
var
  cds : TClientDataSet;
  p : TParams;
begin
  cds:= nil;
  p:= TParams.Create(nil);
  p.Clear;
  p.CreateParam(ftInteger,'STATUS_DESCARTE',ptInput).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;
 // p.CreateParam(ftInteger,'STATUS_DESCARTE',ptInput).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, SELECT_LOTES,p);
  cds.First;
  FListaLotes.Clear;
  while not cds.Eof do
   begin
     FListaLotes.Add(cds.FieldByName('LOTE').AsString);
     cds.Next;
   end;
  cds.Free;

end;

procedure TZooTrocaRetirosLotesDatamodule.LoadListaRetiros;
const
  SELECT_RETIROS =
             'WITH RETIROS AS('
      +#13#10'  SELECT DISTINCT COALESCE(AF.RETIRO,'''') AS RETIRO,  lpad(AF.RETIRO, 10, ''0'' ) RETIRO_'
      +#13#10'    FROM ZOO_ANIMAIS_FEMEA AF'
      +#13#10'   INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AF.KZOO_ANIMAL_FEMEA'
      +#13#10'   WHERE A.STATUS <> :STATUS_DESCARTE '
    { +#13#10'  UNION ALL'
      +#13#10'  SELECT DISTINCT COALESCE(AM.RETIRO,'''') AS RETIRO,  lpad(AM.RETIRO, 10, ''0'' ) RETIRO_'
      +#13#10'    FROM ZOO_ANIMAIS_MACHO AM'
      +#13#10'   INNER JOIN ZOO_ANIMAIS A ON A.KZOO_ANIMAL = AM.KZOO_ANIMAL_MACHO'
      +#13#10'   WHERE A.STATUS <> :STATUS_DESCARTE'}
      +#13#10')'
      +#13#10'SELECT DISTINCT RETIRO FROM RETIROS ORDER BY RETIRO_'
      ;
var
  cds : TClientDataSet;
  p : TParams;
begin
  cds:= nil;
  p:= TParams.Create(nil);
  p.Clear;
  p.CreateParam(ftInteger,'STATUS_DESCARTE',ptInput).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;
 // p.CreateParam(ftInteger,'STATUS_DESCARTE',ptInput).AsInteger := _ST_STATUS_ANIMAL_DESCARTADO;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, SELECT_RETIROS, p);
  cds.First;
  FListaRetiro.Clear;
  while not cds.Eof do
   begin
     FListaRetiro.Add(cds.FieldByName('RETIRO').AsString);
     cds.Next;
   end;
   p.Free;
  cds.Free;
end;

procedure TZooTrocaRetirosLotesDatamodule.OpenTables;
begin
  //inherited;
  if not cdsAnimaisDestino.IsEmpty then
    cdsAnimaisDestino.EmptyDataSet;

  SetParams;
  TCDSSuppl.Open ( cdsAnimaisOrigem );
end;

procedure TZooTrocaRetirosLotesDatamodule.SetParamsDestino(var AParam : TParams);
begin

  if not Assigned( AParam ) then
    AParam := TParams.Create(nil);

  AParam.CreateParam(ftString,'KCAD_FAZENDA'    ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'STATUS_DESCARTE' ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'ALL_RETIRO'      ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'RETIRO'          ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'RETIRO_NULL'     ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'ALL_LOTES'       ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'LOTE'            ,ptInput).Bound := False;
  AParam.CreateParam(ftString,'LOTE_NULL'       ,ptInput).Bound := False;

  AParam.ParamByName( 'KCAD_FAZENDA'   ).AsString   := LoggedUser.DomainID ;
  AParam.ParamByName( 'STATUS_DESCARTE').AsInteger  := _ST_STATUS_ANIMAL_DESCARTADO;
  AParam.ParamByName( 'ALL_RETIRO'     ).AsString   := FAllRetiroDes;
  AParam.ParamByName( 'RETIRO'         ).AsString   := FRetiroDes;
  if FRetiroDesIsNull then
    AParam.ParamByName( 'RETIRO_NULL'    ).AsString  := 'T'
  else
    AParam.ParamByName( 'RETIRO_NULL'    ).AsString  := 'F';
  AParam.ParamByName( 'ALL_LOTES'      ).AsString   := FAllLoteDes;
  AParam.ParamByName( 'LOTE'           ).AsString   := FLoteDes;
  if FLoteDesIsNull then
    AParam.ParamByName( 'LOTE_NULL'      ).AsString  := 'T'
  else
    AParam.ParamByName( 'LOTE_NULL'      ).AsString  := 'F';


end;

function TZooTrocaRetirosLotesDatamodule.Process: Boolean;
const
   UPDATE_LOTE_RETIRO =
             'UPDATE ZOO_ANIMAIS_FEMEA'
      +#13#10'SET'
      +#13#10'    RETIRO     = :RETIRO,'
      +#13#10'    LOTE       = :LOTE,'
      +#13#10'    DATALOTE   = :DATALOTE,'
      +#13#10'    DATARETIRO = :DATARETIRO'
      +#13#10'WHERE (KZOO_ANIMAL_FEMEA = :KZOO_ANIMAL_FEMEA)';
var
  p: TParams;
begin
  Result := False;
  ValidFields;

  p:= TParams.Create(nil);
  p.CreateParam(ftString    , 'RETIRO'              , ptInput).Bound  := False;
  p.CreateParam(ftString    , 'LOTE'                , ptInput).Bound  := False;
  p.CreateParam(ftTimesTamp , 'DATALOTE'            , ptInput).Bound  := False;
  p.CreateParam(ftTimesTamp , 'DATARETIRO'          , ptInput).Bound  := False;
  p.CreateParam(ftString    , 'KZOO_ANIMAL_FEMEA'   , ptInput).Bound  := False;

  cdsAnimaisDestino.DisableControls;
  cdsAnimaisDestino.First;

  try
    try
      while not cdsAnimaisDestino.Eof do
       begin
        // if FRetiroDes <> '' then
        //  begin
           p.ParamByName('RETIRO').AsString := FRetiroDes;
           p.ParamByName('DATARETIRO').AsSQLTimeStamp := DateTimeTOSQLTimeStamp( FDataTroca );
        //  end
        { else
          begin
           p.ParamByName('RETIRO').Clear;
           p.ParamByName('DATARETIRO').Clear;
          end;}

         //if FLoteDes <> '' then
         // begin
           p.ParamByName('LOTE').AsString := FLoteDes;
           p.ParamByName('DATALOTE').AsSQLTimeStamp := DateTimeTOSQLTimeStamp( FDataTroca );
         { end
         else
          begin
           p.ParamByName('LOTE').Clear;
           p.ParamByName('DATALOTE').Clear;
          end;}

         p.ParamByName('KZOO_ANIMAL_FEMEA').AsString := cdsAnimaisDestinoKZOO_ANIMAL.AsString;
         TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(UPDATE_LOTE_RETIRO, p);
         cdsAnimaisDestino.Next;
       end;
       Result := True;
       LoadListaRetiros;
       LoadListaLotes;

       if not cdsAnimaisDestino.IsEmpty then
         cdsAnimaisDestino.EmptyDataSet;

       if not cdsAnimaisOrigem.IsEmpty then
         cdsAnimaisOrigem.EmptyDataSet;

       //OpenTables;
    except
      raise Warning.Create('Erro ao gravar os dados');
    end;


  finally
    cdsAnimaisDestino.EnableControls;
    p.Free;
  end;


end;

procedure TZooTrocaRetirosLotesDatamodule.Selecionar;
begin
  cdsAnimaisOrigem.DisableControls;
  cdsAnimaisDestino.DisableControls;
  TransferDataCDS( cdsAnimaisOrigem, cdsAnimaisDestino );
  cdsAnimaisOrigem.EnableControls;
  cdsAnimaisDestino.EnableControls;
end;

procedure TZooTrocaRetirosLotesDatamodule.SelecionarTodos;
begin
  cdsAnimaisOrigem.DisableControls;
  cdsAnimaisDestino.DisableControls;
  cdsAnimaisOrigem.First;
  while not cdsAnimaisOrigem.Eof do
   begin
     TransferDataCDS( cdsAnimaisOrigem, cdsAnimaisDestino );
   end;
  cdsAnimaisOrigem.EnableControls;
  cdsAnimaisDestino.EnableControls;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetAllLoteDes(const Value: String);
begin
  FAllLoteDes := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetAllLoteOri(const Value: String);
begin
  FAllLoteOri := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetAllRetiroDes(const Value: String);
begin
  FAllRetiroDes := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetAllRetiroOri(const Value: String);
begin
  FAllRetiroOri := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetDataTroca(const Value: TDateTime);
begin
  FDataTroca := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetLoteDes(const Value: String);
begin
  FLoteDes := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetLoteDesIsNull(
  const Value: Boolean);
begin
  FLoteDesIsNull := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetLoteOri(const Value: String);
begin
  FLoteOri := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetLoteOriIsNull(
  const Value: Boolean);
begin
  FLoteOriIsNull := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetParams;
begin
  cdsAnimaisOrigem.ParamByName( 'KCAD_FAZENDA'   ).AsString   := LoggedUser.DomainID ;;
  cdsAnimaisOrigem.ParamByName( 'STATUS_DESCARTE').AsInteger  := _ST_STATUS_ANIMAL_DESCARTADO;
  cdsAnimaisOrigem.ParamByName( 'ALL_RETIRO'     ).AsString   := FAllRetiroOri;
  cdsAnimaisOrigem.ParamByName( 'RETIRO'         ).AsString   := FRetiroOri;
  if FRetiroOriIsNull then
    cdsAnimaisOrigem.ParamByName( 'RETIRO_NULL'    ).AsString  := 'T'
  else
    cdsAnimaisOrigem.ParamByName( 'RETIRO_NULL'    ).AsString  := 'F';
  cdsAnimaisOrigem.ParamByName( 'ALL_LOTES'      ).AsString   := FAllLoteOri;
  cdsAnimaisOrigem.ParamByName( 'LOTE'           ).AsString   := FLoteOri;
  if FLoteOriIsNull then
    cdsAnimaisOrigem.ParamByName( 'LOTE_NULL'      ).AsString  := 'T'
  else
    cdsAnimaisOrigem.ParamByName( 'LOTE_NULL'      ).AsString  := 'F';
end;

procedure TZooTrocaRetirosLotesDatamodule.SetQtdeAnimaisDestino(
  const Value: Integer);
begin
  FQtdeAnimaisDestino := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetRetiroDes(const Value: String);
begin
  FRetiroDes := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetRetiroDesIsNull(
  const Value: Boolean);
begin
  FRetiroDesIsNull := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetRetiroOri(const Value: String);
begin
  FRetiroOri := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.SetRetiroOriIsNull(
  const Value: Boolean);
begin
  FRetiroOriIsNull := Value;
end;

procedure TZooTrocaRetirosLotesDatamodule.TransferDataCDS(cdsOri,
  cdsDes: TClientDataSet);
begin
  if cdsOri.IsEmpty then
    exit;

  cdsDes.Append;
  cdsDes.FieldByName('KZOO_ANIMAL').Value        := cdsOri.FieldByName('KZOO_ANIMAL').Value;
  cdsDes.FieldByName('BRINCO').Value             := cdsOri.FieldByName('BRINCO').Value;
  cdsDes.FieldByName('NUMERO_LACTACAO').Value    := cdsOri.FieldByName('NUMERO_LACTACAO').Value;
  cdsDes.FieldByName('STATUS').Value             := cdsOri.FieldByName('STATUS').Value;
  cdsDes.FieldByName('DPP').Value                := cdsOri.FieldByName('DPP').Value;
  cdsDes.FieldByName('STATUS_REPRODUTIVO').Value := cdsOri.FieldByName('STATUS_REPRODUTIVO').Value;
  cdsDes.FieldByName('ULTIMA_PRODUCAO').Value    := cdsOri.FieldByName('ULTIMA_PRODUCAO').Value;
  cdsDes.FieldByName('CCS').Value                := cdsOri.FieldByName('CCS').Value;
  cdsDes.FieldByName('RETIRO').Value             := cdsOri.FieldByName('RETIRO').Value;
  cdsDes.FieldByName('LOTE').Value               := cdsOri.FieldByName('LOTE').Value;
  cdsDes.FieldByName('DEG').Value                := cdsOri.FieldByName('DEG').Value;
  cdsDes.Post;
  cdsOri.Delete;
end;

procedure TZooTrocaRetirosLotesDatamodule.ValidFields;
begin
  if (Trunc( FDataTroca ) = 0) or (DateTimeToStr( FDataTroca ) = '') then
    raise Warning.Create('O campo data de troca deve ser informado.');
end;

end.
