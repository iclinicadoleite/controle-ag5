unit USYS_VQDWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  TcMPVQDClass, System.WideStrings, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.DBRTL.AbstractDB, Tc.DBRTL.AbstractDB.DBX, atVisualQuery, atMetaSQL,
  UDBEntidades, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TSYS_VQDWizard = class(T_FormWizard)
    TcMPadb_DBX1: TTcadb_DBX;
    atMetaSQL1: TatMetaSQL;
    atVisualQuery1: TatVisualQuery;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;
(*
  TTcVQSQLEngine = class(TTcVQDEngine)
  private
    FSQLConnection: TSQLConnection;
    FQuery: TSQLQuery;
    FClientDataSet : TClientDataSet ;
    procedure SetDatabase(Value: TSQLConnection);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadFieldList(const ATableName: string; var AFieldList: TTcVQDFieldList);
                   override;
    procedure ReadTableList(ATableList: TStrings); override;
    function ResultDataSet: TDataSet; override;
    procedure SetSQL(const Value: string); override;
  published
    property Database: TSQLConnection read FSQLConnection write SetDatabase;
  end;
*)

implementation

uses  UApplResources ;

{$R *.dfm}

(*
constructor TTcVQSQLEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FClientDataSet := TClientDataSet.Create ( nil ) ;
  FQuery := TSQLQuery.Create(Self);
  FQuery.GetMetadata := False ;
end;

destructor TTcVQSQLEngine.Destroy;
begin
  FClientDataSet.Free ;
  FQuery.Free;
  inherited Destroy;
end;

procedure TTcVQSQLEngine.ReadFieldList(const ATableName: string; var AFieldList:
               TTcVQDFieldList);
var
  i: Integer;
  tbl: TSQLTable;
  Fields: TFieldDefs;
  tmpField: TTcVQDField;
begin
  tbl := TSQLTable.Create(Self);
  tbl.GetMetadata := False ;
  tbl.SQLConnection := FSQLConnection;
  tbl.TableName := ATableName;
  Fields := tbl.FieldDefs;
  try
    try
      tbl.Active := True;
      tmpField:= TTcVQDField(AFieldList.Add);
      tmpField.FieldName := '*';
      for i := 0 to Fields.Count - 1 do
      begin
        tmpField:= TTcVQDField(AFieldList.Add);
        tmpField.FieldName := Fields.Items[i].Name;
        tmpField.FieldType := Ord(Fields.Items[i].DataType)
      end
    except
      on E: Exception do
        begin
          ShowMessage(E.Message);
          Exit
        end
    end
  finally
    tbl.Free
  end
end;

procedure TTcVQSQLEngine.ReadTableList(ATableList: TStrings);
begin
  ATableList.Clear;
  FQuery.SQLConnection.GetTableNames(ATableList, ShowSystemTables);
end;

function TTcVQSQLEngine.ResultDataSet: TDataSet;
begin
  FClientDataSet.SetProvider ( FQuery ) ;
  Result := FClientDataSet ;
end;

procedure TTcVQSQLEngine.SetDatabase(Value: TSQLConnection);
begin
  FQuery.Close;
  FSQLConnection := Value;
  FQuery.SQLConnection := FSQLConnection;
end;

procedure TTcVQSQLEngine.SetSQL(const Value: string);
begin
  FQuery.Close;
  FQuery.SQL.Text := Value;
end;
*)

{ TfrmCustomWizard }

constructor TSYS_VQDWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TSYS_VQDWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TSYS_VQDWizard.Execute : boolean;
var
  ThisForm: TSYS_VQDWizard;
begin
  ThisForm := TSYS_VQDWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TSYS_VQDWizard._actExecuteExecute(Sender: TObject);
var
  TcMPVQDDialog: TTcVQDDialog;
//  SQLEngine: TTcVQSQLEngine ;
begin
  TcMPVQDDialog := TTcVQDDialog.Create(nil);
//  SQLEngine := TTcVQSQLEngine.Create(nil);
  try
//    SQLEngine.Database := ApplResources.DBEntidades[0].SQLConnection ;
//    TcMPadb_DBX1.Connection  := ApplResources.DBEntidades[0].SQLConnection ;
    TcMPVQDDialog.AbstractDB := TcMPadb_DBX1 ;
    TcMPVQDDialog.SchemaInsideSQL :=False;
    if TcMPVQDDialog.Execute then
      begin
//        Memo1.Lines.Text := TcMPVQDDialog.SQL;
//        SQLQuery1.SQL.Text := TcMPVQDDialog.SQL;
      end
  finally
//    SQLEngine.Free;
    TcMPVQDDialog.Free;
  end;

//  inherited;

end;

procedure TSYS_VQDWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TSYS_VQDWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TSYS_VQDWizard )

end.
