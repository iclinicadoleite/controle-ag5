unit UDBViewerDatamodule;

interface

uses
    System.SysUtils
  , System.Classes
  , Data.DB
  , Tc.Data.DB.Helpers, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, Datasnap.DBClient
  , Data.DBXCommon
  , Data.DBXMetaDataNames
  , Data.SqlTimSt
  , Data.DBCommon
  , Tc.DataSnap.DBClient.Helpers
  , Tc.RTL.NotificationService ;

type
  TTcNSMsgEndFetch = class ( Tc.RTL.NotificationService.TTcNSMsg ) ;
  TTcNSMsgEndWithError = class ( Tc.RTL.NotificationService.TTcNSMsg ) ;

  TdtmDBViewer = class(TDataModule)
    ResultSet: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TTcSQLDataSet;
    procedure SQLDataSet1AfterOpen(DataSet: TDataSet);
    procedure ResultSetFieldGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FSQLStmt:string ;
    FInTransaction : boolean ;
    TD : TDBXTransaction ;
    FErrors : TStrings ;
    procedure DoException ( Sender : TObject ; E : Exception ; var Handled : boolean ) ;
  public
    { Public declarations }
    procedure StartTransaction;
    procedure CommitTransaction ;
    procedure RollbackTransaction ;
    procedure ApplyUpdates ;
    procedure CancelUpdates ;
    procedure OpenResultSet ( ASQLStmt : string ) ;
    procedure OpenPacked( FCDS : TClientDataSet ) ;

    procedure ExecSQL ( ASQLStmt : string ) ;
    procedure CloseResultSet ;
    procedure GetFieldsNameFromTable( ATableName : string ; AFieldsNameList : TStrings );
    procedure SetConnection( AConnection : TCustomConnection ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
    property Errors : TStrings read FErrors ;
    procedure UpdateFieldsGetText ;

  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Math,
     Forms,
     CDSSuppl,
     ThreadSuppl, Dialogs,
     UDBViewerHelpers;

{$R *.dfm}

type
  TCDSFetch = class(ThreadSuppl.TProtectedExceptionThread)
  private
    { Private declarations }
    FCDS: TClientDataSet ;
  protected
    procedure Execute; override;
  public
    constructor Create ( ACDS : TClientDataSet )  ;
  end;


procedure TdtmDBViewer.SetConnection(AConnection: TCustomConnection);
begin
  SQLDataSet1.SQLConnection := TSQLConnection ( AConnection ) ;
end;

procedure TdtmDBViewer.SQLDataSet1AfterOpen(DataSet: TDataSet);
var
 Field : TField ;
begin
  for Field in DataSet.Fields do
   if Field.DataType = ftTimeStamp then
    Field.ProviderFlags := Field.ProviderFlags - [pfInWhere] ;
end;

procedure TdtmDBViewer.StartTransaction;
begin
  RollbackTransaction ;
  TD := sqlDataSet1.SQLConnection.BeginTransaction ;
  FInTransaction := True ;
end;

procedure TdtmDBViewer.UpdateFieldsGetText;
var
 LField: TField ;
begin
  for LField in ResultSet.Fields do
     LField.OnGetText := ResultSetFieldGetText
end;

procedure TdtmDBViewer.ApplyUpdates;
begin
  CDSSuppl.TCDSSuppl.ApplyUpdates( ResultSet ) ;
end;

procedure TdtmDBViewer.CancelUpdates;
begin
   ResultSet.CancelUpdates
end;

procedure TdtmDBViewer.CloseResultSet;
begin
   ResultSet.Close ;
end;

procedure TdtmDBViewer.CommitTransaction;
begin
  if FInTransaction then
     sqlDataSet1.SQLConnection.CommitFreeAndNil( TD ) ;
  FInTransaction := False ;
end;

constructor TdtmDBViewer.Create(AOwner: TComponent);
begin
  inherited;
  FErrors := TStringList.Create ;
end;

procedure TdtmDBViewer.DoException(Sender: TObject; E: Exception;
  var Handled: boolean);
var
  LErrors : TStringList;
begin
  FErrors.Clear ;

  LErrors := TStringList.Create ;
  LErrors.Text := E.Message ;

  if LErrors.Count > 0  then
    begin
      FErrors.Add('Erro: ' + LErrors[0])  ;
      LErrors.Delete(0) ;
      FErrors.AddStrings(LErrors) ;
    end
  else
      FErrors.Add('Erro:' )  ;
  FErrors.Add('')  ;
  FErrors.Add('Statement:')  ;

  LErrors.Text := self.FSQLStmt ;

  FErrors.AddStrings(LErrors) ;

  LErrors.Free ;

  RollbackTransaction ;

  TTcNSMsgEndWithError.CreateAndDispatch( ResultSet ) ;

  Handled := True ;
end;

procedure TdtmDBViewer.ExecSQL(ASQLStmt: string);
var
 AHandled : boolean ;
begin
  FSQLStmt := ASQLStmt ;
  ResultSet.Close ;
  sqlDataSet1.ParamCheck  := False ;
  sqlDataSet1.CommandText := FSQLStmt ;
  try
    sqlDataSet1.ExecSQL ;
  except On E : Exception do
      DoException( Self, E, AHandled  ) ;
  end ;
end;

procedure TdtmDBViewer.ResultSetFieldGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Sender.AsString ;
  if DisplayText and Sender.IsNull then
     Text := '<null>' ;
end;

procedure TdtmDBViewer.RollbackTransaction;
begin
  if FInTransaction then
     sqlDataSet1.SQLConnection.RollbackFreeAndNil( TD ) ;
  FInTransaction := False ;
end;

procedure TdtmDBViewer.GetFieldsNameFromTable(ATableName: string;
  AFieldsNameList : TStrings );
begin
 try
  TD := TSQLConnection2( SQLDataSet1.SQLConnection ).BeginTransaction ;
  TSQLConnection2( SQLDataSet1.SQLConnection ).GetFieldNames( ATableName, AFieldsNameList );
  TSQLConnection2( SQLDataSet1.SQLConnection ).CommitFreeAndNil( TD );
 except on E: Exception do
  begin
    TSQLConnection2( SQLDataSet1.SQLConnection ).RollbackFreeAndNil(TD) ;
    showMessage ( E.Message ) ;
  end;
 end;
end;


procedure TdtmDBViewer.OpenResultSet( ASQLStmt : string ) ;
begin
  ResultSet.Close ;
  Application.ProcessMessages ;
  FSQLStmt := ASQLStmt ;

  if ResultSet.IndexName = '__Idx' then
    begin
     //ResultSet.DeleteIndex('__Idx') ;
     ResultSet.IndexName :='DEFAULT_ORDER' ;
    end;

  sqlDataSet1.ParamCheck  := False ;
  sqlDataSet1.CommandText := FSQLStmt ;

//    ResultSet.open ;
  StartTransaction ;
//  ResultSet.Open ;
//  CommitTransaction;
//  Tc.RTL.NotificationService.TTcNSMsg.CreateAndDispatch( ResultSet ) ;
//  TTcNSMsgEndFetch.CreateAndDispatch( ResultSet ) ;

  //
//  EXIT ; // NO THREAD


  //ResultSet.Open ;
  //TTcNSMsgEndFetch.CreateAndDispatch( ResultSet ) ;

    TCDSFetch.Create( ResultSet ).OnException := DoException ;

  //OpenPacked( ResultSet ) ;
end;


procedure TdtmDBViewer.OpenPacked( FCDS : TClientDataSet ) ;
begin
  { Place thread code here }
  FCDS.PacketRecords := 1 ;
//  try

  TThread.Synchronize(
     nil
   , procedure
     begin
       FCDS.Open ;
     end
   ) ;


//  Synchronize(
//     nil
//   , procedure
//     begin
//       Application.ProcessMessages ;
//     end
//   ) ;

//  FCDS.PacketRecords := 1500 ;
  FCDS.PacketRecords := Max ( 4096, ((1000*1024) div FCDS.RecordSize) ) ;
//  ShowMessage ( FCDS.PacketRecords.ToString ) ;
  while FCDS.GetNextPacket > 0 do
    Tc.RTL.NotificationService.TTcNSMsg.CreateAndDispatch( FCDS ) ;
  TTcNSMsgEndFetch.CreateAndDispatch( FCDS ) ;
end;

{ TCDSFetch }
constructor TCDSFetch.Create(ACDS: TClientDataSet);
begin
  FCDS := ACDS ;
  inherited Create( False ) ;
end;

procedure TCDSFetch.Execute;
var
  LFinish : boolean  ;
begin
  { Place thread code here }
  FCDS.PacketRecords := 1 ;
//  try
   TThread.Synchronize( nil
    , procedure
      begin
       FCDS.Open ;
       TTcNSMsg.CreateAndDispatch ( FCDS ) ;
       FCDS.DisableControls ;
      end
    ) ;

//  Synchronize(
//     nil
//   , procedure
//     begin
//       Application.ProcessMessages ;
//     end
//   ) ;

//  FCDS.PacketRecords := 1500 ;
  FCDS.PacketRecords := 50 ; Max ( 4096, ((1000*1024) div FCDS.RecordSize) ) ;
//  ShowMessage ( FCDS.PacketRecords.ToString ) ;
  Repeat
   LFinish := FCDS.GetNextPacket = 0 ;
   TThread.Synchronize( nil
    , procedure
      begin
       TTcNSMsg.CreateAndDispatch ( FCDS ) ;
//        FCDS.EnableControls ;
//        FCDS.DisableControls ;
      end
   );
  Until LFinish ;

   TThread.Synchronize( nil
    , procedure
      begin
        FCDS.EnableControls ;
        Tc.RTL.NotificationService.TTcNSMsg.CreateAndDispatch( FCDS ) ;
        TTcNSMsgEndFetch.CreateAndDispatch( FCDS ) ;
      end
   );

end;


end.
