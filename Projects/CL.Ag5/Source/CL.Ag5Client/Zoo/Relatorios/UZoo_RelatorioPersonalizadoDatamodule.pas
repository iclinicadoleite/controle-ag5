unit UZoo_RelatorioPersonalizadoDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider ;

type
  TZoo_RelatorioPersonalizadoDatamodule = class(T_dtmBASE)
    cdsRelatorioPersonalizados: TClientDataSet;
    dspRelatorioPersonalizados: TDataSetProvider;
    sqlRelatorioPersonalizados: TTcSQLDataSet;
    sqlRelatorioPersonalizadosKCAD_FAZENDA: TStringField;
    sqlRelatorioPersonalizadosKZOO_PERSONALIZADO: TStringField;
    sqlRelatorioPersonalizadosNOME: TStringField;
    cdsRelatorioPersonalizadosKZOO_PERSONALIZADO: TStringField;
    cdsRelatorioPersonalizadosKCAD_FAZENDA: TStringField;
    cdsRelatorioPersonalizadosNOME: TStringField;
    cdsReportCfg: TClientDataSet;
    cdsReportCfgID: TStringField;
    cdsReportCfgWHEREGROUP: TSmallintField;
    cdsReportCfgCOLUMNORDER: TSmallintField;
    cdsReportCfgTABLEALIAS: TStringField;
    cdsReportCfgCOLUMN: TStringField;
    cdsReportCfgCOLUMNTYPE: TSmallintField;
    cdsReportCfgCOLUMNDATATYPE: TSmallintField;
    cdsReportCfgCOLUMNTITLE: TStringField;
    cdsReportCfgVISIBLE: TStringField;
    cdsReportCfgOPERATOR: TSmallintField;
    cdsReportCfgNOT: TStringField;
    cdsReportCfgPARAM1: TStringField;
    cdsReportCfgPARAM2: TStringField;
    cdsReportCfgDSPCONDITION: TStringField;
    sqlRelatorioPersonalizadosCONTENT_VERSION: TIntegerField;
    cdsRelatorioPersonalizadosCONTENT_VERSION: TIntegerField;
    cdsReportCfgLISTVALUES: TStringField;
    procedure cdsReportCfgBeforeInsert(DataSet: TDataSet);
    procedure cdsReportCfgBeforePost(DataSet: TDataSet);
    procedure cdsReportCfgCalcFields(DataSet: TDataSet);
    procedure cdsReportCfgNewRecord(DataSet: TDataSet);
    procedure cdsReportCfgNOTValidate(Sender: TField);
    procedure cdsRelatorioPersonalizadosNewRecord(DataSet: TDataSet);
    procedure cdsRelatorioPersonalizadosBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FColumnOrder : integer ;
    FReportAlias: String;
    procedure MakeDisplayCondition ;
    procedure SaveReport ;
    procedure SetReportAlias(const Value: String);
  protected
    function GetCdsAlias: String; override;
  public
    { Public declarations }
    procedure SaveNew ( AName : string ) ;
    procedure SaveExisting  ;
    procedure MoveUp ;
    procedure MoveDown ;
    procedure LoadReport ;
    procedure CheckAlreadExists ( AReportName : string ) ;
    procedure OpenTables ; override ;
    procedure Delete ; override ;
    procedure UpdateVersion;
    property ReportAlias : String read FReportAlias write SetReportAlias;
    procedure SaveIndexCDS(AClientDataSet: TClientDataSet);
    procedure LoadIndexCDS(AClientDataSet: TClientDataSet);
  end;

CONST
  _CONTENT_VERSION = 2 ;

implementation

uses Tc.DBRTL.AbstractDB, Data.SQLTimSt, Exceptions, Tc.VCL.SysCore.MIB, CDSSuppl ;

{$R *.dfm}

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosBeforeOpen(
  DataSet: TDataSet);
begin
   cdsRelatorioPersonalizados.Params.ParamByName (  'KCAD_FAZENDA'  ).asString := LoggedUser.DomainID ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosNewRecord(
  DataSet: TDataSet);
begin
   GetKey ( cdsRelatorioPersonalizadosKZOO_PERSONALIZADO ) ;
   cdsRelatorioPersonalizadosKCAD_FAZENDA.Value := LoggedUser.DomainID ;
   cdsRelatorioPersonalizadosCONTENT_VERSION.asInteger := _CONTENT_VERSION ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsReportCfgBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Last ;
  FColumnOrder := cdsReportCfgCOLUMNORDER.asInteger + 1 ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsReportCfgBeforePost(DataSet: TDataSet);
begin
   MakeDisplayCondition ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then
     MakeDisplayCondition ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNewRecord(DataSet: TDataSet);
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetKey ( cdsReportCfgID ) ;
  cdsReportCfgCOLUMNORDER.AsInteger := FColumnOrder ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNOTValidate(Sender: TField);
begin
  MakeDisplayCondition
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.CheckAlreadExists ( AReportName : string ) ;
var
   Clone : TClientDataSet ;
begin

  Clone := TClientDataSet.Create ( nil ) ;
  Clone.PacketRecords := 0 ;
  Clone.CloneCursor( cdsRelatorioPersonalizados, False, False );

  AReportName := Trim ( AReportName ) ;

  with Clone do
    try
      first ;
      while not eof do
        begin
          if   ( FieldByName( 'NOME' ).asString = AReportName ) then
             raise Warning.CreateFmt('Já existe um relatório com o nome %s'#13#10'Informe outro nome', [ QuotedStr ( AReportName ) ] );
          Next ;
        end;
    finally
      Clone.free ;
    end;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.Delete;
begin
  inherited;
  ApplyUpdates ;
end;


function TZoo_RelatorioPersonalizadoDatamodule.GetCdsAlias: String;
begin
  Result := FReportAlias;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.LoadIndexCDS(
  AClientDataSet: TClientDataSet);
begin
  TcdsSuppl.LoadPersistedIndexes(AClientDataSet, ReportAlias);
  AClientDataSet.First;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.LoadReport;
const

  _SELECT_PERSONALIZADO =
    'SELECT REPORT, CONTENT_VERSION FROM ZOO_PERSONALIZADO WHERE KZOO_PERSONALIZADO = :KZOO_PERSONALIZADO' ;

var
  rpt : TMemoryStream ;
  cds,  cdsLoadXML : TClientDataSet ;
  p : TParams ;
  Field: TField;
  I, J: Integer;
begin

  TCDSSuppl.CreateDataSet( cdsReportCfg ) ;

  rpt := TMemoryStream.Create ;
  p := TParams.Create ;
  try
    p.CreateParam ( ftString, 'KZOO_PERSONALIZADO', ptInput ).asString := cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
    cds := nil ;
    cdsLoadXML := TClientDataSet.Create(nil);
    TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet ( cds, _SELECT_PERSONALIZADO, p ) ;
    TBlobField ( cds.fieldByName ( 'REPORT' ) ).SaveToStream( rpt );
    rpt.Position := 0 ;

    if ( not cds.IsEmpty ) and ( cds.fieldByName ( 'CONTENT_VERSION' ).AsInteger < _CONTENT_VERSION ) then
    begin

      cdsLoadXML.LoadFromStream ( rpt ) ;
      cdsLoadXML.First;
      while not cdsLoadXML.Eof do
       begin
         cdsReportCfg.Append;
         for I := 0 to cdsLoadXML.Fields.Count -1 do
          begin

            for J := 0 to cdsReportCfg.Fields.Count -1 do
             begin
               if cdsReportCfg.Fields[J].FieldName = cdsLoadXML.Fields[I].FieldName then
                 begin
                   cdsReportCfg.Fields[J].AsVariant := cdsLoadXML.Fields[I].AsVariant;
                 end;
             end;

          end;
         cdsReportCfg.Post;
         cdsLoadXML.Next;
       end;
       SaveExisting;
       UpdateVersion;
    end
    else
      cdsReportCfg.LoadFromStream ( rpt ) ;

  finally
     if cdsReportCfg.Active then
        cdsReportCfg.IndexFieldNames := cdsReportCfgWHEREGROUP.FieldName + ';' + cdsReportCfgCOLUMNORDER.FieldName ;
     cds.free ;
     rpt.free ;
     p.Free ;
     cdsLoadXML.Free;
  end;


end;

procedure TZoo_RelatorioPersonalizadoDatamodule.MakeDisplayCondition;
var
   SelectedOperator : TVRptOperators ;
   DataType : TVRptDataTypes ;
   StrDspCondition : string ;
begin

   SelectedOperator := TVRptOperators ( cdsReportCfgOPERATOR.AsInteger ) ;

   if ( SelectedOperator = opNone ) then
     begin
       cdsReportCfgDSPCONDITION.Clear ;
       exit ;
     end;

   DataType := TVRptDataTypes( cdsReportCfgCOLUMNDATATYPE.AsInteger ) ;

   try
     StrDspCondition := StrOperators [ SelectedOperator ] ;

     if SelectedOperator = opIsEmpty then
        Exit ;

     case DataType of
       dtDate    :
          if cdsReportCfgPARAM1.asString <> '' then
                   StrDspCondition := StrDspCondition + ' ' + FormatDateTime ( 'dd.mm.yyyy', SQLTimeStampToDateTime ( cdsReportCfgPARAM1.asSQLTimeStamp ) ) ;
       dtInteger : StrDspCondition := StrDspCondition + ' ' + cdsReportCfgPARAM1.asString ;
       dtFloat   : StrDspCondition := StrDspCondition + ' ' + cdsReportCfgPARAM1.asString ;
     else
        StrDspCondition := StrDspCondition + ' "' + cdsReportCfgPARAM1.asString + '"' ;
     end;

     if SelectedOperator <> opBetween then
        Exit ;

     StrDspCondition := StrDspCondition + ' e ' ;

     case DataType of
       dtDate    :
          if cdsReportCfgPARAM2.asString <> '' then
                   StrDspCondition := StrDspCondition + FormatDateTime ( 'dd.mm.yyyy', SQLTimeStampToDateTime ( cdsReportCfgPARAM2.asSQLTimeStamp ) ) ;
       dtInteger : StrDspCondition := StrDspCondition + cdsReportCfgPARAM2.asString ;
       dtFloat   : StrDspCondition := StrDspCondition + cdsReportCfgPARAM2.asString ;
     else
       StrDspCondition := '"' + cdsReportCfgPARAM2.asString + '"' ;
     end;

   finally
     if cdsReportCfgNOT.asBoolean then
        StrDspCondition := 'não ' + StrDspCondition ;

     cdsReportCfgDSPCONDITION.AsString := StrDspCondition

   end;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.MoveUp;
var
  recID : string ;
  priorOrder, Order : integer ;

begin
   with cdsReportCfg do
     try
       DisableControls ;

       recID := cdsReportCfgID.asString ;
       Order := cdsReportCfgCOLUMNORDER.AsInteger ;
       prior ;

       if bof then
          exit ;

       priorOrder := cdsReportCfgCOLUMNORDER.AsInteger ;
       edit ;
       cdsReportCfgCOLUMNORDER.AsInteger := Order ;
       post ;

       Locate( 'ID', recID, [] ) ;

       edit ;
       cdsReportCfgCOLUMNORDER.AsInteger := priorOrder ;
       post ;
     finally
       EnableControls ;
     end;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.OpenTables;
begin
  inherited;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.SaveNew(AName: string);
var
  KZOO_PERSONALIZADO : string ;
begin
 cdsRelatorioPersonalizados.Append ;
 KZOO_PERSONALIZADO := cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
 cdsRelatorioPersonalizadosNOME.asString := Trim ( AName ) ;
 cdsRelatorioPersonalizados.Post ;
 ApplyUpdates ;
 cdsRelatorioPersonalizados.Locate ( 'KZOO_PERSONALIZADO', KZOO_PERSONALIZADO, [] ) ;
 SaveExisting;
 ReportAlias := KZOO_PERSONALIZADO;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.SaveExisting;
begin
  SaveReport ;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.SaveIndexCDS(AClientDataSet: TClientDataSet);
begin

  TcdsSuppl.PersistIndexes(AClientDataSet, FReportAlias );
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.SaveReport;
const
  _UPDATE_PERSONALIZADO =
    'UPDATE ZOO_PERSONALIZADO SET REPORT = :REPORT WHERE KZOO_PERSONALIZADO = :KZOO_PERSONALIZADO' ;
var
  rpt : TMemoryStream ;
  p : TParams ;
begin
  cdsReportCfg.MergeChangeLog ;
  rpt := TMemoryStream.Create ;
  p := TParams.Create ;
  try
    cdsReportCfg.SaveToStream( rpt, dfXML);
    p.CreateParam ( ftBlob,   'REPORT', ptInput ).LoadFromStream( rpt, ftBlob );
    p.CreateParam ( ftString, 'KZOO_PERSONALIZADO', ptInput ).asString := cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
    sqlRelatorioPersonalizados.SQLConnection.Execute( _UPDATE_PERSONALIZADO, p ) ;
  finally
    rpt.free ;
     p.Free ;
  end;
end;


procedure TZoo_RelatorioPersonalizadoDatamodule.SetReportAlias(
  const Value: String);
begin
  FReportAlias := Value;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.UpdateVersion;
const
  _UPDATE_PERSONALIZADO =
    'UPDATE ZOO_PERSONALIZADO SET CONTENT_VERSION = :VERSION WHERE KZOO_PERSONALIZADO = :KZOO_PERSONALIZADO' ;
var
  rpt : TMemoryStream ;
  p : TParams ;
begin
  cdsReportCfg.MergeChangeLog ;
  rpt := TMemoryStream.Create ;
  p := TParams.Create ;
  try
    cdsReportCfg.SaveToStream( rpt, dfXML);
    p.CreateParam ( ftInteger,   'VERSION', ptInput ).AsInteger := _CONTENT_VERSION ;
    p.CreateParam ( ftString, 'KZOO_PERSONALIZADO', ptInput ).asString := cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
    sqlRelatorioPersonalizados.SQLConnection.Execute( _UPDATE_PERSONALIZADO, p ) ;
  finally
    rpt.free ;
     p.Free ;
  end;
end;

procedure TZoo_RelatorioPersonalizadoDatamodule.MoveDown;
var
  recID : string ;
  nextOrder, Order : integer ;

begin
   with cdsReportCfg do
     try
       DisableControls ;

       recID := cdsReportCfgID.asString;
       Order := cdsReportCfgCOLUMNORDER.AsInteger ;
       next ;

       if eof then
          exit ;

       nextOrder := cdsReportCfgCOLUMNORDER.AsInteger ;
       edit ;
       cdsReportCfgCOLUMNORDER.AsInteger := Order ;
       post ;

       Locate( 'ID', recID, [] ) ;

       edit ;
       cdsReportCfgCOLUMNORDER.AsInteger := nextOrder ;
       post ;

     finally
       EnableControls ;
     end;
end;


end.
