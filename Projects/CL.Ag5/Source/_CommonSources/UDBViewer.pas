unit UDBViewer;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, System.WideStrings, VCL.StdCtrls, Tc.VCL.SimpleSyntaxeMemo,
  VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, Tc.DBRTL.AbstractDB,
  Data.DB, Tc.Data.DB.Helpers,
  Data.DBCommon,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Datasnap.Provider, VCL.ComCtrls, JvDBGridFooter, VCL.DBCtrls,
  JvDBControls, JvDBUltimGrid, JvExControls, JvLabel, VCL.Buttons,
  Tc.RTL.Exceptions, Vcl.CheckLst, System.Actions, Vcl.ActnList,
  Vcl.Menus,
  Tc.VCL.Form,
  Tc.RTL.NotificationService,
  System.Generics.Collections,
  {Tc.DBXFBExtract,}System.ImageList, Vcl.ImgList
  , pFIBMetaData
  , pFIBScripter
  , pFIBSQLParser
  , Vcl.AppEvnts, Tc.VCL.Application, Vcl.Mask,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Edits.DBControls, SynEdit, SynMemo,
  SynEditHighlighter, SynHighlighterSQL, UDBViewerDatamodule,
  SysPrintGridDialog
  {$IFNDEF TESTE} ,Wrappers {$ENDIF}
  , SynEditMiscClasses, SynEditSearch, SynEditTypes, SynCompletionProposal ;

type

  TScriptNodesInfo = record
    MainNode : TTreeNode ;
    ChildNodes : TDictionary<string,TTreeNode> ;
  end ;


  TfrmDBViewer = class(TTcForm)
    DBGResultSet: TJvDBUltimGrid;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    DataSource1: TDataSource;
    Panel3: TPanel;
    cbxDB: TComboBox;
    Button1: TButton;
    JvDBNavigator1: TJvDBNavigator;
    JvDBStatusLabel1: TJvDBStatusLabel;
    Panel4: TPanel;
    btbApply: TBitBtn;
    btbCancel: TBitBtn;
    BitBtn1: TBitBtn;
    Button2: TButton;
    PageControlResult: TPageControl;
    tbsResultSet: TTabSheet;
    tbsTextResult: TTabSheet;
    TextResult: TTcSimpleSyntaxMemo;
    PopupMenuResultSet: TPopupMenu;
    ActionList1: TActionList;
    Action1: TAction;
    ExportScriptUPDATEORINSERT1: TMenuItem;
    JvDBGridFooter1: TJvDBGridFooter;
    mmExecInfo: TTcSimpleSyntaxMemo;
    DBObjectsTree: TTreeView;
    Button3: TButton;
    ImageList1: TImageList;
    TimerDBObjectsTree: TTimer;
    Button4: TButton;
    lblCountRecords: TLabel;
    ApplicationEvents1: TApplicationEvents;
    tbsScript: TTabSheet;
    Splitter3: TSplitter;
    SynEditorSQLSintaxeHighlighter: TSynSQLSyn;
    SQLEditor: TSynMemo;
    ScriptObjectsTree: TTreeView;
    Splitter4: TSplitter;
    TimerScriptObjects: TTimer;
    StatusBar: TStatusBar;
    OpenDialog1: TOpenDialog;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    SearchPanel: TPanel;
    Button5: TButton;
    btnSearchPrev: TButton;
    btnSearchNext: TButton;
    lblSearchResult: TLabel;
    SynEditSearch: TSynEditSearch;
    SynCompletionProposal: TSynCompletionProposal;
    SynAutoComplete: TSynAutoComplete;
    Button6: TButton;
    ClientDataSet1: TClientDataSet;
    procedure SQLEditorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure btbApplyClick(Sender: TObject);
    procedure btbCancelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure DBObjectsTreeDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure DBObjectsTreeCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure DBObjectsTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBObjectsTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TimerDBObjectsTreeTimer(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure TcFormDestroy(Sender: TObject);
    procedure ScriptObjectsTreeChange(Sender: TObject; Node: TTreeNode);
    procedure SQLEditorChange(Sender: TObject);
    procedure TimerScriptObjectsTimer(Sender: TObject);
    procedure SQLEditorStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure DoFindText(Sender: TObject);
    procedure DoReplaceText(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnSearchNextPrevClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    dtmDBViewer: TdtmDBViewer;
    FIndexDB : integer ;
    FDB : ITcAbstractDB ;
    FSQLStmt : string ;
    LastTreeClick : THitTests ;
    FStartTime : TDateTime ;
    FEndTime : TDateTime ;
    FOpenedDataSet : boolean ;
    FAutoEditControls : TObjectList<TControl> ;

    FUpdatingScriptObjects : boolean ;
    FScriptNodesInfo : Array [otDatabase..otUser] of TScriptNodesInfo ;

    procedure UpdateScriptObjectsTree ;
    procedure DeleteScriptObjectsTree ;
    procedure InitScriptObjectsTree ;

    procedure ClearAutoEditors ;
    procedure CreateAutoEditors( ADataSet : TDataSet ) ;
    procedure AddEditControl ( AField : TField ) ;
    procedure OnLoadMetaData(Sender:TObject; const Message:string; var Stop:boolean) ;
    procedure CheckSQL( AStmtType : TStmtType ) ;
//    procedure A ( Sender : TObject ; E : Exception ; var Handled : boolean ) ;
    procedure OpenResultSet ;
    procedure ExecSQL ;
    procedure InitExecInfo ;
    procedure EndExecInfo ;
//    procedure ExecuteParse ;
    procedure ExecuteParse2 ;
//    procedure DoParse(AStatement, AText : String ) ;
//    procedure GetFieldsNode( ATableName : string ; ATableNode : TTreeNode );
    procedure Listener ( AMsg : TTcNSMsg )  ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
  end;


implementation

{$R *.dfm}

uses
  Tc.RTL.StringUtils,
//  SysPrintGridDialog,
////  Tc.IBEScriptParser,
//  UDBViewerHelpers,
  UXTheme ;

const
  _IMG_DATABASE     =  0  ;
  _IMG_DOMAINS      =  1  ;
  _IMG_TABLES       =  2  ;
  _IMG_VIEWS        =  3  ;
  _IMG_PROCEDURES   =  4  ;
  _IMG_FUNCTIONS    =  5  ;
  _IMG_PACKAGES     =  6  ;
  _IMG_TRIGGERS     =  7  ;
  _IMG_GENERATORS   =  8  ;
  _IMG_EXCEPTIONS   =  9  ;
  _IMG_UDF          = 10  ;
  _IMG_USERS        = 11  ;
  _IMG_ROLES        = 12  ;
  _IMG_INDICES      = 13  ;
  _IMG_BLOCK1       = 14  ;
  _IMG_BLOCK2       = 15  ;

 ImgIndx : array[ TObjectType ] of integer =
  ( -1,
   _IMG_DATABASE,  _IMG_DOMAINS,  _IMG_TABLES,  _IMG_VIEWS,
  //_IMG_FUNCTIONS, _IMG_PACKAGES,
  _IMG_PROCEDURES, _IMG_TRIGGERS,  _IMG_UDF,
  _IMG_EXCEPTIONS,_IMG_GENERATORS,  _IMG_INDICES, _IMG_TABLES {constraint}, _IMG_TABLES {filter},
  _IMG_TABLES {fields},_IMG_TABLES {parameters},
  _IMG_ROLES,  _IMG_BLOCK1, _IMG_USERS) ;

procedure TfrmDBViewer.ApplicationEvents1Activate(Sender: TObject);
begin
//   FormStyle := fsStayOnTop ;
end;

procedure TfrmDBViewer.ApplicationEvents1Deactivate(Sender: TObject);
begin
   FormStyle := fsNormal ;
end;

procedure TfrmDBViewer.BitBtn1Click(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGResultSet, Caption );
end;

procedure TfrmDBViewer.btbApplyClick(Sender: TObject);
begin
  dtmDBViewer.ApplyUpdates ;
end;

procedure TfrmDBViewer.btbCancelClick(Sender: TObject);
begin
   dtmDBViewer.CancelUpdates
end;

procedure TfrmDBViewer.btnSearchNextPrevClick(Sender: TObject);
begin
  if (Sender = btnSearchNext) then
    FindDialog1.Options := FindDialog1.Options + [frDown]
  else if (Sender = btnSearchPrev) then
    FindDialog1.Options := FindDialog1.Options - [frDown];
  DoFindText(Sender);
  SQLEditor.SetFocus;
end;
(*
procedure TfrmDBViewer.Button1Click(Sender: TObject);
var
 LDB : ITcAbstractDB ;
 LIndexDB : integer ;
 LTablesList, LProceduresList : TStringList ;
 LTableName, LProcedureName : string ;
 LTablesNode, LTableNode : TTreeNode ;
 LProceduresNode, LProcedureNode, LSystemTablesNode : TTreeNode ;
begin

 LIndexDB := cbxDB.ItemIndex ;

 if LIndexDB = FIndexDB then
    exit ;

 LDB := TTcAbstractDB.GetItem ( LIndexDB ) ;

 if not Assigned ( LDB )  then
    raise Exception.Create('Banco não encontrado');

 FIndexDB := LIndexDB ;
 FDB      := LDB ;

 dtmDBViewer.SetConnection( FDB.Connection ) ;

 dtmDBViewer.CloseResultSet ;
 DBObjectsTree.Items.Clear ;
 SQLEditor.lines.clear ;



 DBObjectsTree.Items.AddChild( nil, 'Dominios' ) ;
 LTablesNode := DBObjectsTree.Items.AddChild( nil, 'Tabelas' ) ;
 with LTablesNode do
   begin
     SelectedIndex :=  _IMG_TABLES ;
     ImageIndex    :=  _IMG_TABLES ;
   end;

 with DBObjectsTree.Items.AddChild( nil, 'Views' ) do
   begin
     SelectedIndex :=  _IMG_VIEWS ;
     ImageIndex    :=  _IMG_VIEWS ;
   end;

 LProceduresNode := DBObjectsTree.Items.AddChild( nil, 'Procedures' ) ;
 with LProceduresNode do
   begin
     SelectedIndex :=  _IMG_PROCEDURES ;
     ImageIndex    :=  _IMG_PROCEDURES ;
   end;

 with DBObjectsTree.Items.AddChild( nil, 'Generators' ) do
   begin
     SelectedIndex :=  _IMG_GENERATORS ;
     ImageIndex    :=  _IMG_GENERATORS ;
   end;

 with DBObjectsTree.Items.AddChild( nil, 'Exceptions' ) do
   begin
     SelectedIndex :=  _IMG_EXCEPTIONS ;
     ImageIndex    :=  _IMG_EXCEPTIONS ;
   end;

 with DBObjectsTree.Items.AddChild( nil, 'UDF' ) do
   begin
     SelectedIndex :=  _IMG_UDF ;
     ImageIndex    :=  _IMG_UDF ;
   end;

 LSystemTablesNode :=   DBObjectsTree.Items.AddChild( nil, 'SystemTables' ) ;
 with LSystemTablesNode do
   begin
     SelectedIndex :=  _IMG_TABLES ;
     ImageIndex    :=  _IMG_TABLES ;
   end;


 try

   LTablesList := TStringList.Create ;
   TSQLConnection2( FDB.Connection ).GetTableNames( LTablesList, False );
   for LTableName in LTablesList do
    begin
     LTableNode := DBObjectsTree.Items.AddChild( LTablesNode, LTableName ) ;
     LTableNode.SelectedIndex :=  LTablesNode.SelectedIndex ;
     LTableNode.ImageIndex    :=  LTablesNode.ImageIndex  ;
     GetFieldsNode( LTableName, LTableNode );
    end;


   LTablesList.Clear ;
   TSQLConnection2( FDB.Connection ).GetTableNames( LTablesList, True );
   for LTableName in LTablesList do
    begin
      LTableNode := DBObjectsTree.Items.AddChild( LSystemTablesNode, LTableName ) ;
      LTableNode.SelectedIndex :=  LSystemTablesNode.SelectedIndex ;
      LTableNode.ImageIndex    :=  LSystemTablesNode.ImageIndex  ;
      GetFieldsNode( LTableName, LTableNode );
    end;

   LProceduresList := TStringList.Create ;
   TSQLConnection2( FDB.Connection ).GetProcedureNames( LProceduresList );
   for LProcedureName in LProceduresList do
    begin
     LProcedureNode := DBObjectsTree.Items.AddChild( LProceduresNode, LProcedureName ) ;
     LProcedureNode.SelectedIndex :=  LProceduresNode.SelectedIndex ;
     LProcedureNode.ImageIndex    :=  LProceduresNode.ImageIndex  ;
    end;
   LProceduresList.Free ;

   LTablesList.Free ;

 except on E : Exception do
   SQLEditor.Lines.Text := E.Message
 end;

end;
*)


procedure TfrmDBViewer.Button1Click(Sender: TObject);
var
 LDB : ITcAbstractDB ;
 LIndexDB : integer ;
 LName : string ;
 LDomainsNode, LTablesNode, LTableNode, LViewsNode, LGeneratorsNode, LExceptionsNode, LUDFSNode, LNode : TTreeNode ;

 LProceduresNode, LSystemTablesNode : TTreeNode ;
 Extractor:TpFIBDBSchemaExtract ;
 I,Y: Integer;
begin

 LIndexDB := cbxDB.ItemIndex ;

 if LIndexDB = FIndexDB then
    exit ;

 LDB := TTcAbstractDB.GetItem ( LIndexDB ) ;

 if not Assigned ( LDB )  then
    raise Exception.Create('Banco não encontrado');

 FIndexDB := LIndexDB ;
 FDB      := LDB ;

 dtmDBViewer.SetConnection( FDB.Connection ) ;

 dtmDBViewer.CloseResultSet ;
 DBObjectsTree.Items.Clear ;
 SQLEditor.lines.clear ;


  Extractor:=TpFIBDBSchemaExtract.Create( nil ) ;
  Extractor.OnLoadMetaData := self.OnLoadMetaData ;
  Extractor.Database := dtmDBViewer.SQLDataSet1.SQLConnection ;
  Extractor.LoadOptions.SysInfo := True ;
  Extractor.LoadOptions.TableInfo := [soTableFields] ;
  Extractor.LoadOptions.ViewInfo  := [soViewFields] ;
///     Extractor.OnLoadMetaData := self.OnLoadMetaData ;
  Extractor.LoadMetaData ;

 LDomainsNode :=  DBObjectsTree.Items.AddChild( nil, 'Dominios' ) ;
 with LDomainsNode do
   begin
     SelectedIndex :=  _IMG_DOMAINS ;
     ImageIndex    :=  _IMG_DOMAINS ;
   end;

 LTablesNode := DBObjectsTree.Items.AddChild( nil, 'Tabelas' ) ;
 with LTablesNode do
   begin
     SelectedIndex :=  _IMG_TABLES ;
     ImageIndex    :=  _IMG_TABLES ;
   end;

 LViewsNode := DBObjectsTree.Items.AddChild( nil, 'Views' ) ;
 with LViewsNode do
   begin
     SelectedIndex :=  _IMG_VIEWS ;
     ImageIndex    :=  _IMG_VIEWS ;
   end;

 LProceduresNode := DBObjectsTree.Items.AddChild( nil, 'Procedures' ) ;
 with LProceduresNode do
   begin
     SelectedIndex :=  _IMG_PROCEDURES ;
     ImageIndex    :=  _IMG_PROCEDURES ;
   end;

 LGeneratorsNode :=  DBObjectsTree.Items.AddChild( nil, 'Generators' ) ;
 with LGeneratorsNode  do
   begin
     SelectedIndex :=  _IMG_GENERATORS ;
     ImageIndex    :=  _IMG_GENERATORS ;
   end;

 LExceptionsNode := DBObjectsTree.Items.AddChild( nil, 'Exceptions' ) ;
 with LExceptionsNode do
   begin
     SelectedIndex :=  _IMG_EXCEPTIONS ;
     ImageIndex    :=  _IMG_EXCEPTIONS ;
   end;

 LUDFSNode  := DBObjectsTree.Items.AddChild( nil, 'UDF' ) ;
 with LUDFSNode do
   begin
     SelectedIndex :=  _IMG_UDF ;
     ImageIndex    :=  _IMG_UDF ;
   end;

 LSystemTablesNode :=   DBObjectsTree.Items.AddChild( nil, 'SystemTables' ) ;
 with LSystemTablesNode do
   begin
     SelectedIndex :=  _IMG_TABLES ;
     ImageIndex    :=  _IMG_TABLES ;
   end;


 try

   for I := 0 to Extractor.DomainsCount - 1 do
    if not Extractor.Domains[ I ].Name.StartsWith('RDB$') then
      begin
       LName := Extractor.Domains[ I ].Name ;
       LNode := DBObjectsTree.Items.AddChild( LDomainsNode, LName ) ;
       LNode.SelectedIndex :=  LDomainsNode.SelectedIndex ;
       LNode.ImageIndex    :=  LDomainsNode.ImageIndex  ;
      end;

   for I := 0 to Extractor.TablesCount -1 do
    begin
     LName := Extractor.Tables[ I ].Name ;
      if LName.StartsWith('MON$') or LName.StartsWith('RDB$') then
         LTableNode := DBObjectsTree.Items.AddChild( LSystemTablesNode, LName )
      else
         LTableNode := DBObjectsTree.Items.AddChild( LTablesNode, LName ) ;

      LTableNode.SelectedIndex :=  LTablesNode.SelectedIndex ;
      LTableNode.ImageIndex    :=  LTablesNode.ImageIndex  ;
      for Y := 0 to Extractor.Tables[ I ].FieldsCount -1 do
        DBObjectsTree.Items.AddChild( LTableNode, Extractor.Tables[ I ].Fields[ Y ].Name ) ;
    end;

   for I := 0 to Extractor.ViewsCount - 1 do
    begin
     LName := Extractor.Views[ I ].Name ;
     LNode := DBObjectsTree.Items.AddChild( LViewsNode, LName ) ;
     LNode.SelectedIndex :=  LViewsNode.SelectedIndex ;
     LNode.ImageIndex    :=  LViewsNode.ImageIndex  ;
      for Y := 0 to Extractor.Views[ I ].FieldsCount -1 do
        DBObjectsTree.Items.AddChild( LNode, Extractor.Views[ I ].Fields[ Y ].Name ) ;
    end;

   for I := 0 to Extractor.ProceduresCount - 1 do
    begin
     LName := Extractor.Procedures[ I ].Name ;
     LNode := DBObjectsTree.Items.AddChild( LProceduresNode, LName ) ;
     LNode.SelectedIndex :=  LProceduresNode.SelectedIndex ;
     LNode.ImageIndex    :=  LProceduresNode.ImageIndex  ;
    end;

   for I := 0 to Extractor.UDFSCount - 1 do
    begin
     LName := Extractor.UDFS[ I ].Name ;
     LNode := DBObjectsTree.Items.AddChild( LUDFSNode, LName ) ;
     LNode.SelectedIndex :=  LUDFSNode.SelectedIndex ;
     LNode.ImageIndex    :=  LUDFSNode.ImageIndex  ;
    end;

   for I := 0 to Extractor.ExceptionsCount - 1 do
    begin
     LName := Extractor.Exceptions[ I ].Name ;
     LNode := DBObjectsTree.Items.AddChild( LExceptionsNode, LName ) ;
     LNode.SelectedIndex :=  LExceptionsNode.SelectedIndex ;
     LNode.ImageIndex    :=  LExceptionsNode.ImageIndex  ;
    end;

   for I := 0 to Extractor.GeneratorsCount - 1 do
    begin
     LName := Extractor.Generators[ I ].Name ;
     LNode := DBObjectsTree.Items.AddChild( LGeneratorsNode, LName ) ;
     LNode.SelectedIndex :=  LGeneratorsNode.SelectedIndex ;
     LNode.ImageIndex    :=  LGeneratorsNode.ImageIndex  ;
    end;

 except on E : Exception do
   SQLEditor.Lines.Text := E.Message
 end;

end;




(*
procedure TfrmDBViewer.Button32Click(Sender: TObject);
var
  Extractor:TMetaDataBase;
  Database : TSQLConnection ;
 TD : TDBXTransaction ;
begin
  PageControlResult.ActivePage := tbsTextResult ;
  Database := TSQLConnection( FDB.Connection ) ;
//     TD := Database.BeginTransaction ;
  Extractor:=TMetaDataBase.Create(nil,'');
  try
   try
     Extractor.OnLoadMetaData := self.OnLoadMetaData ;
     Extractor.LoadFromDatabase(Database);
     TextResult.Lines.Text:=Extractor.AsDDL ;
//      Database.CommitFreeAndNil ( TD )  ;
   except On E : Exception do
     begin
//     Database.RollBackFreeAndNil ( TD )  ;
       TextResult.Lines.Text:=Extractor.AsDDL ;
       TextResult.Lines.Add ( E.Message ) ;
       TextResult.Lines.Add ( LastQueryOpened ) ;

     end;
   end;
  finally
   Extractor.Free;
  end;
end;
*)
procedure TfrmDBViewer.Button32Click(Sender: TObject);
var
  Extractor:TpFIBDBSchemaExtract ;
begin
  PageControlResult.ActivePage := tbsTextResult ;
//  TD := Database.BeginTransaction ;
  Extractor:=TpFIBDBSchemaExtract.Create( nil ) ;
  try
   try
     Extractor.OnLoadMetaData := self.OnLoadMetaData ;
     Extractor.Database := dtmDBViewer.SQLDataSet1.SQLConnection ;
     TextResult.Lines.Text:=Extractor.GetDDLText ;
//      Database.CommitFreeAndNil ( TD )  ;
   except On E : Exception do
     begin
//     Database.RollBackFreeAndNil ( TD )  ;
       TextResult.Lines.Text:=Extractor.GetDDLText ;
       TextResult.Lines.Add ( E.Message ) ;
       TextResult.Lines.Add ( LastQueryOpened ) ;
     end;
   end;
  finally
   Extractor.Free;
  end;
end;



procedure TfrmDBViewer.Button3Click(Sender: TObject);
var
  Extractor:TMetaDataBase;
//  Database : TSQLConnection ;
// TD : TDBXTransaction ;
begin

(*
 try
 except on E: Exception do
  begin
    sqlDataSet1.SQLConnection.RollbackFreeAndNil(TD) ;
    showMessage ( E.Message ) ;
  end;
 end;
*)
   (* --- teste externo
 with TTcDBXFBExtract.Create( nil ) do
  try
    try
     Database := TSQLConnection( FDB.Connection ) ;
     TD := Database.BeginTransaction ;
     ExtractObject( eoDatabase ) ;
     TextResult.Lines.Assign( Items );
     PageControlResult.ActivePage := tbsTextResult ;
     Database.CommitFreeAndNil ( TD )  ;
    except
      begin
        TextResult.Lines.Assign( Items );
        Database.RollBackFreeAndNil ( TD )  ;
        Raise ;
      end;
    end;
  finally
    free ;
  end;

  *)

end;



procedure TfrmDBViewer.Button5Click(Sender: TObject);
begin
  FindDialog1.Execute;
  btnSearchNext.Enabled := TRUE;
  btnSearchPrev.Enabled := TRUE;
end;

procedure TfrmDBViewer.Button6Click(Sender: TObject);
begin
   ReplaceDialog1.Execute ;
end;

function GetSQLFieldValue ( AField: TField ) : string ;
begin

    if AField.IsNull then
      Result := 'NULL'
    else if (AField.DataType = ftString) or (AField.DataType = ftWideString)  then
      Result := QuotedStr( AField.asString )
    else if (AField is TDateField ) then
      Result := QuotedStr ( FormatDateTime( 'yyyy-mm-dd', AField.AsDateTime ) )
    else if (AField is TTimeField) then
      Result := QuotedStr ( FormatDateTime( 'hh:nn:ss', AField.AsDateTime ) )
    else if ( (AField is TDateTimeField) or (AField is TSQLTimeStampField )  )then
      Result := QuotedStr ( FormatDateTime( 'yyyy-mm-dd hh:nn:ss', AField.AsDateTime ) )
    else if (AField is TNumericField ) then
      Result := StringReplace( AField.Text, ',', '.', [rfReplaceAll] )

end;

procedure GenInsertSQLFromDataSet(TableName: string; SQL: TStrings ; DataSet: TDataSet ; AUpdateOrInsert : boolean = false ) ;
var
   sqlFields : TStringList ;
   SQLValuesString : string ;
   MatchingString : string ;
   procedure GetFieldsAndParams ;
   var
      x  : integer ;
   begin
     sqlFields.Clear ;
     SQLValuesString := '' ;
     MatchingString := '' ;
     try
        with DataSet do
        for x := 0 to Fields.Count - 1 do
           begin
              if not ( ( Fields[ x ].DataType in [ ftDataSet ] ) ) then
                 begin
                    sqlFields.add ( format ( '%s',  [ Fields[ x ].FieldName ] ) ) ;
                    SQLValuesString := format ( '%s, %s', [SQLValuesString, GetSQLFieldValue ( Fields[ x ] ) ] ) ;
                    if (AUpdateOrInsert) and (  pfInKey in Fields[ x ].ProviderFlags ) then
                       MatchingString := format ( '%s, %s', [MatchingString, Fields[ x ].FieldName ] ) ;
                 end ;
           end ;
        Delete( SQLValuesString, 1 , 2 ) ;
        Delete( MatchingString,  1 , 2 ) ;
     except
           on E: Exception do
              Raise ;
     end ;

   end ;

begin

   sqlFields := TStringList.Create ;

   SQL.BeginUpdate ;
   SQL.Clear ;
   DataSet.DisableControls ;
   DataSet.First ;
   while not DataSet.EOF do
     begin
       GetFieldsAndParams ;
       if (AUpdateOrInsert) then
         SQL.Add ( format ( 'UPDATE OR INSERT INTO %s ( %s ) VALUES (  %s  ) MATCHING ( %s ) ;', [ TableName, sqlFields.DelimitedText, SQLValuesString, MatchingString ] ) )
       else
         SQL.Add ( format ( 'INSERT INTO %s ( %s ) VALUES (  %s  ) ;', [ TableName, sqlFields.CommaText, SQLValuesString ] ) ) ;
       DataSet.Next ;
     end;
   DataSet.EnableControls ;
   SQL.EndUpdate ;
   sqlFields.free ;


end;


(*
procedure TfrmDBViewer.ExecuteParse ;
var
  LIBEScript : TTcIBEScriptParser ;
  LSQLStmt  : string ;
begin
 if Length ( SQLEditor.SelText ) > 1 then
   LSQLStmt := SQLEditor.SelText
 else
   LSQLStmt := SQLEditor.Lines.Text ;

  LIBEScript := TTcIBEScriptParser.Create ( self ) ;
  LIBEScript.IBEScriptDLLName := 'fbsrun.dll' ;
  LIBEScript.OnParse := DoParse ;
  LIBEScript.Script.Text := LSQLStmt ;
  LIBEScript.Parse ;
  LIBEScript.DisposeOf ;
end;
*)


procedure TfrmDBViewer.ExecuteParse2;
var
 LpFIBScripter : TpFIBScripter ;
 LStatementsIterate: integer ;
 LStatementDesc : PStatementDesc ;
 LNode : TTreeNode ;
 I : TObjectType ;
 List : TStringList ;
 LObjName : string ;
 LObjType : TObjectType ;
begin

  LpFIBScripter := TpFIBScripter.Create(nil) ;

  if SQLEditor.SelAvail then
   LpFIBScripter.Script.Add( SQLEditor.SelText )
  else
   LpFIBScripter.Script.AddStrings( SQLEditor.Lines );

  LpFIBScripter.Parse;

  mmExecInfo.Lines.Clear ;
  List := TStringList.Create ;
  for LStatementsIterate := 1 to  LpFIBScripter.StatementsCount do
    begin
      LStatementDesc := LpFIBScripter.GetStatement( LStatementsIterate, List ) ;
     //****++++---- mmExecInfo.Lines.Add( StmtTypeDescr[LStatementDesc.smtType] +  ' '  + ObjectTypeDescr[LStatementDesc.objType] ) ;
      mmExecInfo.Lines.AddStrings( List );
      FSQLStmt := List.Text ;
      //EXIT ;
      CheckSQL( LStatementDesc.smtType ) ;
    end;
(*
    if LStatementDesc.objType > otNone then
      begin
        LObjType := LStatementDesc.objType ;
        if  LObjType = otField then
          begin
            LObjName := Copy ( LStatementDesc.objName, 1, Pos( '.', LStatementDesc.objName ) -1 ) ;
            LObjType := pFIBScripter.otTable ;
          end
        else
          LObjName := LStatementDesc.objName ;

        if not FScriptNodesInfo[LObjType].ChildNodes.TryGetValue( LObjName, LNode ) then
           begin
             LNode := DBObjectsTree.Items.AddChild( FScriptNodesInfo[ LObjType ].MainNode, LObjName ) ;
             //LNode.StateIndex :=  0 ;
             LNode.SelectedIndex :=  ImgIndx[ LStatementDesc.objType ] ;
             LNode.SelectedIndex :=  ImgIndx[ LStatementDesc.objType ] ;
             LNode.ImageIndex    :=  ImgIndx[ LStatementDesc.objType ] ;
             FScriptNodesInfo[LStatementDesc.objType].ChildNodes.Add( LStatementDesc.objName, LNode );
           end;
        LNode := DBObjectsTree.Items.AddChild( LNode, StmtTypeDescr[ LStatementDesc.smtType ] + ' ' + LStatementDesc.ObjName ) ;
        LNode.Data := LStatementDesc ;
      end;
    end;
*)
  List.Free ;
end;


(*
procedure TfrmDBViewer.DoParse(AStatement, AText : String ) ;
begin
  FSQLStmt := AStatement ;
  CheckSQL ;
end;
*)


procedure TfrmDBViewer.CheckSQL( AStmtType : TStmtType ) ;
var
  LSelect : boolean ;
  stmtWith, stmtSELECT, stmtINSERT, stmtUPDATE, stmtDELETE, stmtRETURNING,
  stmtExecute, stmtBlock, stmtRetuns, stmtBegin,
  stmtPROCEDURE, stmtRETURNING_VALUES : integer ;
  LLowerSQLStmt : string ;
begin

 LLowerSQLStmt := LowerCase ( FSQLStmt.Trim ) ;

 LLowerSQLStmt := StringReplace ( LLowerSQLStmt, #13, '', [rfReplaceAll] ) ;
 LLowerSQLStmt := StringReplace ( LLowerSQLStmt, #10, '', [rfReplaceAll] ) ;

 stmtWITH              := Pos ( 'with',    LLowerSQLStmt ) ;
 stmtSELECT            := Pos ( 'select',  LLowerSQLStmt ) ;
 stmtINSERT            := Pos ( 'insert',  LLowerSQLStmt ) ;
 stmtUPDATE            := Pos ( 'update',  LLowerSQLStmt ) ;
 stmtDELETE            := Pos ( 'delete',  LLowerSQLStmt ) ;
 stmtRETURNING_VALUES  := Pos ( 'returning_values', LLowerSQLStmt ) ;

 if stmtRETURNING_VALUES > 0 then
   stmtRETURNING         := 0
 else
   stmtRETURNING         := Pos ( 'returning', LLowerSQLStmt ) ;

 stmtExecute := Pos ( 'execute', LLowerSQLStmt ) ;
 stmtBlock   := Pos ( 'block',   LLowerSQLStmt ) ;
 stmtRetuns  := Pos ( 'returns', LLowerSQLStmt ) ;
 stmtBegin   := Pos ( 'begin',   LLowerSQLStmt ) ;

 stmtPROCEDURE  := Pos ( 'procedure',   LLowerSQLStmt ) ;


 LSelect :=  (    ( stmtSELECT > 0 )
              and (Copy ( LLowerSQLStmt, 1, stmtSELECT -1  ) = '')
             )
             or  ( ( stmtWITH > 0 )
                  and (Copy ( LLowerSQLStmt, 1, stmtWITH -1  ) = '')
                  and (stmtSELECT > stmtWITH)
                 )
             or (      ( stmtExecute <> 0 )
                  and  ( stmtBlock   > stmtExecute )
                  and  ( stmtRetuns  > stmtBlock )
                  and  ( stmtBegin   > stmtRetuns   )
                )
             or (      ( stmtExecute <> 0 )
                  and  ( stmtPROCEDURE > stmtExecute )
                  and  ( stmtRETURNING_VALUES > stmtPROCEDURE )
                )
             or (      ( stmtINSERT <> 0 )
                  and  ( stmtRETURNING > stmtINSERT  )
                )
             or (      ( stmtUPDATE <> 0 )
                  and  ( stmtRETURNING > stmtUPDATE  )
                )
             or (      ( stmtDELETE <> 0 )
                  and  ( stmtRETURNING > stmtDELETE  )
                ) ;

    if LSelect then
      OpenResultSet
    else
      ExecSQL  ;

end;

procedure TfrmDBViewer.ClearAutoEditors;
var
  LIndex : integer ;
  LDBGridControl : TJvDBGridControl ;
begin

  if not Assigned ( FAutoEditControls ) then
    exit ;

  try

  LIndex := DBGResultSet.EditControls.Count -1 ;
  while LIndex > -1 do
    with DBGResultSet, EditControls[ LIndex ] do
      if ControlName.StartsWith ( 'AutoEditControl' ) then
        begin
         EditControls.Delete(LIndex) ;
         Dec ( LIndex ) ;
        end
      else
        Break ;
  except On E: exception do
     Raise Exception.Create( 'TfrmDBViewer.ClearAutoEditors : ' +  E.Message )
  end ;

  FreeAndNil ( FAutoEditControls ) ;
end;


constructor TfrmDBViewer.Create(AOwner: TComponent);
var
   LDB : ITcAbstractDB ;
   IterateItem : integer ;
begin
  inherited;

  dtmDBViewer := TdtmDBViewer.Create(self);

  DataSource1.DataSet := dtmDBViewer.ResultSet ;

//  FormStyle := fsStayOnTop ;
  FIndexDB := -1 ;
  IterateItem := 0 ;
  TimerDBObjectsTree.Interval := GetDoubleClickTime * 2 ;
  Repeat
     LDB := TTcAbstractDB.GetItem ( IterateItem ) ;
     if Assigned ( LDB ) then
        cbxDB.Items.Add ( LDB.Alias ) ;
     Inc ( IterateItem ) ;
  Until not Assigned ( LDB ) ;

  PageControlResult.ActivePage := tbsScript ;
  SQLEditor.Lines.Clear ;
  SQLEditor.SelText := '' ;

  lblCountRecords.Caption := '' ;

  InitScriptObjectsTree ;

  Tc.RTL.NotificationService.TTcNSMsg.Subscribe( Listener, dtmDBViewer.ResultSet );
  TTcNSMsgEndFetch.Subscribe( Listener, dtmDBViewer.ResultSet );
  TTcNSMsgEndWithError.Subscribe( Listener, dtmDBViewer.ResultSet );

end;

procedure TfrmDBViewer.InitScriptObjectsTree ;
var
 I : TObjectType ;
begin
  SetWindowTheme(ScriptObjectsTree.Handle, nil , nil);

  for I := otDatabase to otUser do
    begin
     FScriptNodesInfo[ I ].MainNode := ScriptObjectsTree.Items.AddChild( nil, ObjectTypeDescr[ I ] ) ;//
     FScriptNodesInfo[ I ].MainNode.ImageIndex    :=  ImgIndx[ I ] ;
     FScriptNodesInfo[ I ].MainNode.SelectedIndex :=  ImgIndx[ I ] ;
     FScriptNodesInfo[ I ].ChildNodes :=  TDictionary<string,TTreeNode>.Create ;
    end;

end;


procedure TfrmDBViewer.CreateAutoEditors(ADataSet: TDataSet);
var
 LField : TField ;
begin
 FAutoEditControls := TObjectList<TControl>.Create ;

 try
  for LField in ADataSet.Fields do
     AddEditControl(LField)
  except On E: exception do
     Raise Exception.Create( 'TfrmDBViewer.CreateAutoEditors : ' +  E.Message )
  end ;
end;

procedure TfrmDBViewer.DataSource1StateChange(Sender: TObject);
begin

   if not Assigned( dtmDBViewer ) then
      exit;

   if TDataSource(Sender).State = dsInactive then
     begin
       FOpenedDataSet := False ;
       mmExecInfo.Lines.Add( 'Clear AutoEditors' ) ;
       //TThread.Synchronize ( nil
       // , procedure
       //   begin
            ClearAutoEditors ;
       //   end
       //) ;
     end
   else if ( TDataSource(Sender).State = dsBrowse ) and not FOpenedDataSet then
    begin
     mmExecInfo.Lines.Add( 'Create AutoEditors' ) ;
     FOpenedDataSet := True ;
     //TThread.Synchronize ( nil
     // , procedure
     //   begin
         CreateAutoEditors( TDataSource(Sender).DataSet ) ;
    //    end
    // ) ;

    end;

end;

procedure TfrmDBViewer.EndExecInfo;
begin
   FEndTime := Now ;
   mmExecInfo.Lines.Add( 'Tempo decorrido: ' + FormatDateTime ( 'hh:nn:ss:zzz', FEndTime - FStartTime ) ) ;
end;

procedure TfrmDBViewer.ExecSQL;
begin
  InitExecInfo ;
  mmExecInfo.Lines.Add( 'ExecSQL' ) ;
  DBGResultSet.Visible := False ;
  try
  dtmDBViewer.ExecSQL( FSQLStmt );
  except
  end;
  EndExecInfo;
end;

(*
procedure TfrmDBViewer.GetFieldsNode( ATableName : string ; ATableNode : TTreeNode );
var
 LFieldsList : TStringList ;
 LFieldName  : string ;
begin

 LFieldsList := TStringList.Create ;

 dtmDBViewer.GetFieldsNameFromTable( ATableName, LFieldsList ) ;

 for LFieldName in LFieldsList do
   DBObjectsTree.Items.AddChild( ATableNode, LFieldName ) ;

 LFieldsList.Free ;

end;
*)


procedure TfrmDBViewer.InitExecInfo;
begin
  lblCountRecords.Caption := '' ;
  FStartTime := now ;
  mmExecInfo.Lines.Clear ;
end;

procedure TfrmDBViewer.Listener(AMsg: TTcNSMsg);
var
   LEnd : boolean ;
begin
   LEnd := False;
   if AMsg.IsMessage(TTcNSMsgEndWithError) then
     begin
        mmExecInfo.Lines.AddStrings( dtmDBViewer.Errors ) ;
        exit ;
     end
   else if AMsg.IsMessage(TTcNSMsgEndFetch) then
     begin
        LEnd := True ;
       try
          dtmDBViewer.CommitTransaction ;
       except on E : Exception do
         mmExecInfo.Lines.Add(e.message)
       end;
       EndExecInfo;
     end ;


  if PageControlResult.ActivePage <> tbsResultSet then
    begin
      PageControlResult.ActivePage := tbsResultSet ;
      DBGResultSet.Visible := True ;
      Panel4.Parent := tbsResultSet ;
    end;


   if LEnd then
     lblCountRecords.Caption := TClientDataSet( AMsg.Sender ).RecordCount.ToString
       + ' - ' + TClientDataSet( AMsg.Sender ).RecordSize.ToString + '   Tempo decorrido: ' + FormatDateTime ( 'hh:nn:ss:zzz', Now - FStartTime )
   else
     lblCountRecords.Caption := TClientDataSet( AMsg.Sender ).RecordCount.ToString
        + ' - ' + TClientDataSet( AMsg.Sender ).RecordSize.ToString  + '   carregando : ' + FormatDateTime ( 'hh:nn:ss:zzz', Now - FStartTime ) ;


   dtmDBViewer.UpdateFieldsGetText ;

   Application.processMessages ;
end;

procedure TfrmDBViewer.OnLoadMetaData(Sender: TObject; const Message: string;
  var Stop: boolean);
begin
   TextResult.Lines.Add ( Message ) ;
end;



procedure TfrmDBViewer.OpenResultSet ;
var
  LFields : TStringList ;
  LFieldName : string ;
  LFieldsClause : string ;
begin
  InitExecInfo ;
  mmExecInfo.Lines.Add( 'OpenResultSet' ) ;
(*
  LFieldsClause := FieldsClause( FSQLStmt ) ;
  mmExecInfo.Lines.Add( 'Fields: ' + LFieldsClause ) ;
  LFields := TStringList.Create ;
  LFields.StrictDelimiter := True ;
  LFields.CommaText := LFieldsClause ;
  for LFieldName in LFields do
    mmExecInfo.Lines.Add( ' - ' + LFieldName ) ;

  mmExecInfo.Lines.Add( 'FullField: ' + FullFieldName( FSQLStmt, LFields[0] ) ) ;
  LFields.Free ;

*)
  mmExecInfo.Lines.Add( 'Where: ' + MainWhereClause( FSQLStmt ) ) ;

  DBGResultSet.Visible := False ;
  DBGResultSet.AutoSizeColumns := False ;
  dtmDBViewer.OpenResultSet ( FSQLStmt )  ;


end;



procedure TfrmDBViewer.ScriptObjectsTreeChange(Sender: TObject;
  Node: TTreeNode);
var
 LBeginBlock, LEndBlock : TBufferCoord ;
begin

  if not Assigned ( Node.Data ) then
     exit ;

  with PStatementDesc(Node.Data).smdBegin do
   begin
    LBeginBlock.Char := X  ;
    LBeginBlock.Line := Y +1 ;
   end;

  with PStatementDesc(Node.Data).smdEnd do
   begin
    LEndBlock.Char := X + 1 ;
    LEndBlock.Line := Y + 1 ;
   end;

  SQLEditor.TopLine := LBeginBlock.Line - 2 ;
  SQLEditor.SetCaretAndSelection( LBeginBlock, LBeginBlock, LEndBlock );

end;


procedure TfrmDBViewer.SQLEditorChange(Sender: TObject);
begin
   TimerScriptObjects.Enabled := False ;
   TimerScriptObjects.Enabled := not FUpdatingScriptObjects ;
end;

procedure TfrmDBViewer.SQLEditorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) and ( Shift = [ ssCtrl ] ) then
      ExecuteParse2 ;
end;

procedure TfrmDBViewer.SQLEditorStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
const
  ModifiedStrs: array[boolean] of string = ('', 'Modified');
  InsertModeStrs: array[boolean] of string = ('Overwrite', 'Insert');
var
  p: TBufferCoord;
  Token: UnicodeString;
  Attri: TSynHighlighterAttributes;
begin
  // Note: scAll for new file loaded
  // caret position has changed
  if Changes * [scAll, scCaretX, scCaretY] <> [] then begin
    p := SQLEditor.CaretXY;
    Statusbar.Panels[0].Text := Format('%6d:%3d', [p.Line, p.Char]);
  end;

  if Changes * [scAll, scInsertMode, scReadOnly] <> [] then begin
    if SQLEditor.ReadOnly then
      Statusbar.Panels[2].Text := 'ReadOnly'
    else
      Statusbar.Panels[2].Text := InsertModeStrs[SQLEditor.InsertMode];
  end;

  // Modified property has changed
  if Changes * [scAll, scModified] <> [] then
    Statusbar.Panels[1].Text := ModifiedStrs[SQLEditor.Modified];
  // selection has changed
  (*
  if Changes * [scAll, scSelection] <> [] then
    cbExportSelected.Enabled := SQLEditor.SelAvail;
  // select highlighter attribute at caret
  if (SQLEditor.Highlighter <> nil) and (Changes * [scAll, scCaretX, scCaretY] <> [])
  then begin
    if not SQLEditor.GetHighlighterAttriAtRowCol(
        SQLEditor.CaretXY
      , Token,
        Attri) then
      Attri := SQLEditor.Highlighter.WhitespaceAttribute ;

    if Assigned(Attri) then
      begin
        cbxAttrSelect.ItemIndex := cbxAttrSelect.Items.IndexOf(Attri.Name);
        cbxAttrSelectChange(Self);
      end;
  end;
  *)
end;

procedure TfrmDBViewer.TcFormDestroy(Sender: TObject);
begin
  TimerDBObjectsTree.Enabled := False ;
  TimerScriptObjects.Enabled := False ;
end;

procedure TfrmDBViewer.TimerDBObjectsTreeTimer(Sender: TObject);
begin
  TimerDBObjectsTree.Enabled := False;
  LastTreeClick := [];
end;

procedure TfrmDBViewer.TimerScriptObjectsTimer(Sender: TObject);
begin
   mmExecInfo.Lines.Add( 'TimerScriptObjectsTimer' ) ;
   TimerScriptObjects.Enabled := False ;
   if FUpdatingScriptObjects then
     exit ;
   FUpdatingScriptObjects := True ;
   UpdateScriptObjectsTree ;
   FUpdatingScriptObjects := False ;
end;

procedure TfrmDBViewer.DBObjectsTreeCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  AllowCollapse := not (htOnItem in LastTreeClick);
end;

procedure TfrmDBViewer.DBObjectsTreeDblClick(Sender: TObject);
var
  Node: TTreeNode;
  p : TBufferCoord ; //TPoint ;
begin
  if PageControlResult.ActivePage <> tbsScript then
    exit ;

  TimerDBObjectsTree.Enabled := False ;

  if (htOnButton in LastTreeClick) then
     exit  ;

  with DBObjectsTree.ScreenToClient(Mouse.CursorPos) do
    Node := DBObjectsTree.GetNodeAt(X, Y);

  if not Assigned ( Node ) then
    Exit;

  //p := SQLEditor.GetPos  ;
  p := SQLEditor.CaretXY ;

  if Node.Level = 0 then
     Node.Expanded := not Node.Expanded
  else if Node.Level = 1 then
    begin

     SQLEditor.Lines.Insert( p.Line -1, 'select * from ' + Node.Text );
     //SQLEditor.SetPos( 9, p.Line ) ;
     SQLEditor.SetFocus ;
    end
  else if Node.Level = 2 then
    begin
     SQLEditor.SelText := ' ' + Node.Text + ',' ;
     SQLEditor.SetFocus ;
    end;

end;

procedure TfrmDBViewer.DBObjectsTreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  AllowExpansion := not (htOnItem in LastTreeClick);
end;

procedure TfrmDBViewer.DBObjectsTreeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  HitTestStrs : array[ THitTest ]
  of string =('htAbove', ' htBelow', ' htNowhere', ' htOnItem', ' htOnButton', ' htOnIcon',
    'htOnIndent', ' htOnLabel', ' htOnRight', ' htOnStateIcon', ' htToLeft', ' htToRight');
begin
  if (Button = mbLeft) then
  begin
    LastTreeClick := DBObjectsTree.GetHitTestInfoAt(x,y);
    TimerDBObjectsTree.Enabled := True ;
  end;
end;

procedure TfrmDBViewer.DeleteScriptObjectsTree;
var
 I : TObjectType ;
begin
  for I := otDatabase to otUser do
   begin
     FScriptNodesInfo[ I ].MainNode.DeleteChildren ;
     FScriptNodesInfo[ I ].ChildNodes.Clear ;
   end;
end;

(*

procedure TfrmDBViewer.A(Sender: TObject; E: Exception; var Handled: boolean);
var
  LErrors : TStringList;
begin
  LErrors := TStringList.Create ;
  LErrors.Text := E.Message ;

  if LErrors.Count > 0  then
    begin
      mmExecInfo.Lines.Add('Erro: ' + LErrors[0])  ;
      LErrors.Delete(0) ;
      mmExecInfo.Lines.AddStrings(LErrors) ;
    end
  else
      mmExecInfo.Lines.Add('Erro:' )  ;
  mmExecInfo.Lines.Add('')  ;
  mmExecInfo.Lines.Add('Statement:')  ;
  LErrors.Text := self.FSQLStmt ;
  mmExecInfo.Lines.AddStrings(LErrors) ;
  LErrors.Free ;

  dtmDBViewer.RollbackTransaction ;

  Handled := True ;
end;
*)


procedure TfrmDBViewer.Action1Execute(Sender: TObject);
var
  LSQL: TStringList ;
begin
  LSQL := TStringList.Create ;

  GenInsertSQLFromDataSet(
     GetTableNameFromSQL(
        dtmDBViewer.SQLDataSet1.CommandText
     )
   , LSQL
   , dtmDBViewer.ResultSet
   , True ) ;

  TextResult
     .Lines
     .Assign(
       LSQL
  ) ;

  LSQL.DisposeOf ;
  PageControlResult.ActivePage := tbsTextResult ;
end;


procedure TfrmDBViewer.AddEditControl(AField: TField);
var
  LControlName : string ;
  LIndex : integer ;
begin
    with DBGResultSet.EditControls do
      if Assigned( ControlByField( AField.FieldName ) ) then
        Exit ;

    if not (AField.DataType = ftTimeStamp) then
      exit ;

    LIndex := FAutoEditControls.Add( TTcDBDateEdit.Create ( DBGResultSet.Owner ) ) ;
    with TTcDBDateEdit( FAutoEditControls[ LIndex ] ) do
      begin
         Visible      := False ;
         LControlName := Format ( 'AutoEditControl%d', [ DBGResultSet.EditControls.Count ] ) ;
         Name         := LControlName ;
         DataSource   := DBGResultSet.DataSource ;
         DataField    := AField.FieldName ;
         Parent       := Self
      end;

    with DBGResultSet.EditControls.Add do
      begin
       ControlName      := LControlName     ;
       FieldName        := AField.FieldName ;
       FitCell          := fcCellSize       ;
       LeaveOnEnterKey  := True             ;
       LeaveOnUpDownKey := True             ;
      end ;
end;

(*

  else if (AColumn.Field is TFloatField) then
    begin
      AControl := TJvDBCalcEdit.Create (  Self ) ;
      TJvDBCalcEdit ( AControl ).DataSource := dtsResultado ;
      TJvDBCalcEdit ( AControl ).DataField  := AColumn.FieldName ;
      TJvDBCalcEdit ( AControl ).ShowButton := False ;
    end ;


*)

procedure TfrmDBViewer.UpdateScriptObjectsTree ;
var
 LpFIBScripter : TpFIBScripter ;
 LStatementsIterate: integer ;
 LStatementDesc : PStatementDesc ;
 LNode : TTreeNode ;
 List : TStringList ;
 LObjName : string ;
 LObjType : TObjectType ;
begin

  DeleteScriptObjectsTree ;

  LpFIBScripter := TpFIBScripter.Create(nil) ;
  LpFIBScripter.Script.AddStrings( SQLEditor.Lines );
  LpFIBScripter.Parse;

  List := TStringList.Create ;
  for LStatementsIterate := 1 to  LpFIBScripter.StatementsCount do
    begin
    LStatementDesc := LpFIBScripter.GetStatement( LStatementsIterate, List ) ;
    if LStatementDesc.objType > otNone then
      begin
        LObjType := LStatementDesc.objType ;
        if  LObjType = otField then
          begin
            LObjName := Copy ( LStatementDesc.objName, 1, Pos( '.', LStatementDesc.objName ) -1 ) ;
            LObjType := pFIBScripter.otTable ;
          end
        else
          LObjName := LStatementDesc.objName ;

        if not FScriptNodesInfo[LObjType].ChildNodes.TryGetValue( LObjName, LNode ) then
           begin
             LNode := ScriptObjectsTree.Items.AddChild( FScriptNodesInfo[ LObjType ].MainNode, LObjName ) ;
             //LNode.StateIndex :=  0 ;
             LNode.SelectedIndex :=  ImgIndx[ LStatementDesc.objType ] ;
             LNode.SelectedIndex :=  ImgIndx[ LStatementDesc.objType ] ;
             LNode.ImageIndex    :=  ImgIndx[ LStatementDesc.objType ] ;
             FScriptNodesInfo[LStatementDesc.objType].ChildNodes.Add( LStatementDesc.objName, LNode );
           end;
//        if List.Count > 0 then
//           ScriptObjectsTree.Items.AddChild( LNode, StmtTypeDescr[ LStatementDesc.smtType ] + ' ' + List[0] ) ;
           //****++++---- LNode := ScriptObjectsTree.Items.AddChild( LNode, StmtTypeDescr[ LStatementDesc.smtType ] + ' ' + LStatementDesc.ObjName ) ;
           LNode.Data := LStatementDesc ;


      end;
     // SynMemo1.SelStart :=
    //  SynMemo1.SelEnd   :=
//    memo2.Lines.Add ( LStatementDesc.objName + ' ' + ObjectTypeDescr[LStatementDesc.objType] ) ;
    end;
  List.Free ;
end;


procedure TfrmDBViewer.DoFindText(Sender: TObject);
var
  rOptions: TSynSearchOptions;
  dlg: TFindDialog;
  sSearch: string;
begin
  if Sender = ReplaceDialog1 then
    dlg := ReplaceDialog1
  else
    dlg   := FindDialog1;
  sSearch := dlg.FindText;
  if Length(sSearch) = 0 then
    begin
      Beep;
      lblSearchResult.Caption := 'Can''t search for empty text!';
      lblSearchResult.Visible := True;
    end
  else
    begin
      rOptions := [];
      if not(frDown in dlg.Options) then
        Include(
          rOptions,
          ssoBackwards);
      if frMatchCase in dlg.Options then
        Include(
          rOptions,
          ssoMatchCase);
      if frWholeWord in dlg.Options then
        Include(
          rOptions,
          ssoWholeWord);
      if SQLEditor.SearchReplace(sSearch, '', rOptions) = 0 then
        begin
          Beep;
          lblSearchResult.Caption := 'SearchText ''' + sSearch +
            ''' not found!';
          lblSearchResult.Visible := True;
        end
      else
        lblSearchResult.Visible := False;
    end;
end;

procedure TfrmDBViewer.DoReplaceText(Sender: TObject);
var
  rOptions: TSynSearchOptions;
  sSearch: string;
begin
  sSearch := ReplaceDialog1.FindText;
  if Length(sSearch) = 0 then
    begin
      Beep;
      lblSearchResult.Caption := 'Can''t replace an empty text!';
      lblSearchResult.Visible := True;
    end
  else
    begin
      rOptions := [ssoReplace];
      if frMatchCase in ReplaceDialog1.Options then
        Include(
          rOptions,
          ssoMatchCase);
      if frWholeWord in ReplaceDialog1.Options then
        Include(
          rOptions,
          ssoWholeWord);
      if frReplaceAll in ReplaceDialog1.Options then
        Include(
          rOptions,
          ssoReplaceAll);
      if SQLEditor.SearchReplace(
           sSearch
         , ReplaceDialog1.ReplaceText
         , rOptions)
        = 0
      then
        begin
          Beep;
          lblSearchResult.Caption :=
              'SearchText '''
            + sSearch
            + ''' could not be replaced!';
          lblSearchResult.Visible := True;
        end
      else
        lblSearchResult.Visible := False;
    end;
end;

initialization
   RegisterClass ( TfrmDBViewer ) ;

end.
