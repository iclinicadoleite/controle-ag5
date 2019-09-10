unit UZoo_ImportarSISBOVWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvImage, JvExtComponent, JvPanel,
  Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.Mask, VCL.DBCtrls,
  UZoo_ImportarSISBOVDatamodule, JvExMask, JvToolEdit, JvDBUltimGrid,
  JvDialogs, VCL.Dialogs, Tc.VCL.Controls.GDIButton, System.Actions, Tc.RTL.Exceptions,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Application, Wrappers ;

type
  TZoo_ImportarSISBOVWizard = class(T_FormWizard)
    dtsFazenda: TDataSource;
    tbsSelect: TTabSheet;
    TabSheet2: TTabSheet;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    dtsSISBOV: TDataSource;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    edtFileSISBOV: TTcFilenameEdit;
    _ScrollBoxFicha: TScrollBox;
    _pnldbgLista: TPanel;
    JvDBUltimGrid1: TJvDBUltimGrid;
    Button1: TTcGDIButton;
    JvSaveDialog1: TJvSaveDialog;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Zoo_ImportarSISBOVDatamodule : TZoo_ImportarSISBOVDatamodule ;
  protected
    procedure ProcessSuccessInfo ; virtual ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

Uses UApplResources,
     CL.Ag5.NSMsgs ;

{$R *.dfm}

{ TfrmCustomWizard }


(*



procedure TZoo_ImportarSISBOVWizard.Button1Click(Sender: TObject);
var
  source : string ;
begin
  source := ExtractFilePath ( Application.ExeName ) + 'Modelos\Modelo SISBOV.xls' ;
  if JvSaveDialog1.Execute then
    begin
     CopyFile( PChar ( source ), PChar( JvSaveDialog1.FileName ), False ) ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;

*)

procedure SaveRes(const AResourceName, AFileName : string );
var
  ResStream: TResourceStream;
begin
  ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  try
    ResStream.Position := 0;
    ResStream.SaveToFile(AFileName);
  finally
    ResStream.Free;
  end;
end;

procedure TZoo_ImportarSISBOVWizard.Button1Click(Sender: TObject);
begin
  JvSaveDialog1.FileName :=  'Modelo SISBOV.xlsx' ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível exportar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     SaveRes( 'XLS_SISBOV', JvSaveDialog1.FileName )  ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;

constructor TZoo_ImportarSISBOVWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  Zoo_ImportarSISBOVDatamodule    := TZoo_ImportarSISBOVDatamodule.Create( self );
  dtsFazenda.DataSet       := Zoo_ImportarSISBOVDatamodule.cdsFazenda ;
  dtsSISBOV.DataSet := Zoo_ImportarSISBOVDatamodule.cdsSISBOV ;
  Zoo_ImportarSISBOVDatamodule.OpenTables ;
end;

class function TZoo_ImportarSISBOVWizard.Execute : boolean;
begin
  with Create ( nil ) do
  try
      Result := ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     free ;
  end ;

end ;

function TZoo_ImportarSISBOVWizard.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field )
       and (     ( Field = Zoo_ImportarSISBOVDatamodule.cdsSISBOVEXISTS )  ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ImportarSISBOVWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

procedure TZoo_ImportarSISBOVWizard.ProcessSuccessInfo;
begin
  MessageDlg ( 'Importação concluída' ) ;
  TCLAg5NSMsgEVT_ImportacaoSISBOV.CreateAndDispatch( self );
end;

procedure TZoo_ImportarSISBOVWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  Zoo_ImportarSISBOVDatamodule.ExecuteImport ;
  ProcessSuccessInfo ;
  PageControl.ActivePage := self.tbsSelect ;
end;

procedure TZoo_ImportarSISBOVWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  Zoo_ImportarSISBOVDatamodule.OpenXLS ( edtFileSISBOV.Text )  ;
  inherited;

end;

procedure TZoo_ImportarSISBOVWizard._actNextUpdate(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePage = tbsSelect then
    begin
      _actNext.Enabled :=
         ( Zoo_ImportarSISBOVDatamodule.cdsFazendaCERTIFICADORA.AsString <> '' )
      and ( edtFileSISBOV.Text <> '' )
      and (    ( AnsiUpperCase ( ExtractFileExt (  edtFileSISBOV.Text ) ) = '.XLS' )
            or ( AnsiUpperCase ( ExtractFileExt (  edtFileSISBOV.Text ) ) = '.XLSX' )
          )
      and ( FileExists( edtFileSISBOV.Text ) ) ;
    end;
end;

procedure TZoo_ImportarSISBOVWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_ImportarSISBOVWizard ) ;
end.

