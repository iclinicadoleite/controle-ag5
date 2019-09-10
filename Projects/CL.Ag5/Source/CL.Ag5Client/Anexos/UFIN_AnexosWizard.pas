unit UFIN_AnexosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, Exceptions,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Tc.VCL.Controls.GDIButton,
  Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask,
  JvToolEdit, JvDialogs, UFIN_AnexosDatamodule, VCL.DBCtrls,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Application, Wrappers ;

type
  TFIN_AnexosWizard = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    GroupBox1: TGroupBox;
    edtFileNotas: TTcFilenameEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsArquivosAnexos: TDataSource;
    Panel1: TPanel;
    btnRemoveItem: TTcGDIButton;
    DBMemo1: TDBMemo;
    SaveDialog1: TSaveDialog;
    btnAdicionaItem: TTcGDIButton;
    TcGDIButton1: TTcGDIButton;
    actAdd: TAction;
    actRemove: TAction;
    actSaveAs: TAction;
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actSaveAsUpdate(Sender: TObject);
    procedure actRemoveUpdate(Sender: TObject);
  private
    { Private declarations }
    FIN_AnexosDatamodule : TFIN_AnexosDatamodule ;
    FTableName : string ;
    FTableKey  : string ;
    procedure ChangeFilter ;
    procedure SaveAs ;
  public
    { Public declarations }
    class procedure ExecuteWizard( ATableName, ATableKey : string ) ;
    constructor Create( AOwner : TComponent ) ; override ;
    class procedure DeletaAnexos( ATableName, ATableKey : string ) ;
  end;

implementation

uses UDBAnexos, ShellAPI ;

{$R *.dfm}

{ TfrmCustomDialog }

procedure TFIN_AnexosWizard.actAddExecute(Sender: TObject);
var
  NomeArquivo : string ;
begin
  NomeArquivo := ExtractFileName( Trim( edtFileNotas.Text ) ) ;

  if FIN_AnexosDatamodule.cdsAnexos.Locate( 'FILENAME', NomeArquivo, [] ) then
    raise Warning.Create( 'Arquivo já anexado anteriormente.' );

  with FIN_AnexosDatamodule do
    begin
      NewRecord;
      if not( cdsAnexos.State in [ dsInsert, dsEdit] ) then
        cdsAnexos.Edit ;

      cdsAnexosFILENAME.AsString := NomeArquivo ;
      cdsAnexosDATA.LoadFromFile( Trim( edtFileNotas.Text ) ) ;
    end;

  edtFileNotas.Clear;
end;

procedure TFIN_AnexosWizard.actAddUpdate(Sender: TObject);
begin
 try
  actAdd.Enabled :=   ( edtFileNotas.Text <> '' )
                 and  ( FileExists ( edtFileNotas.Text ) ) ;

 except
 end;

end;

procedure TFIN_AnexosWizard.actRemoveExecute(Sender: TObject);
begin
  with FIN_AnexosDatamodule do
    begin
      if not( cdsAnexos.State in [ dsInsert, dsEdit ] ) then
        cdsAnexos.Edit ;

      cdsAnexos.Delete ;
    end;
end;

procedure TFIN_AnexosWizard.actRemoveUpdate(Sender: TObject);
begin
  try
   actRemove.Enabled := not FIN_AnexosDatamodule.cdsAnexos.IsEmpty ;
  except
  end;

end;

procedure TFIN_AnexosWizard.actSaveAsExecute(Sender: TObject);
begin
  SaveAs ;
end;

procedure TFIN_AnexosWizard.actSaveAsUpdate(Sender: TObject);
begin
  try
   actSaveAs.Enabled := not FIN_AnexosDatamodule.cdsAnexos.IsEmpty ;
  except
  end;

end;

procedure TFIN_AnexosWizard.ChangeFilter;
begin
  FIN_AnexosDatamodule.SetFilter( FTableName, FTableKey );
end;

constructor TFIN_AnexosWizard.Create(AOwner: TComponent);
begin
  inherited;
  TDBAnexos.Create( Self ) ;
  FIN_AnexosDatamodule := TFIN_AnexosDatamodule.Create( Self );
  FIN_AnexosDatamodule.OpenTables;

  Caption := 'Anexar arquivos' ;
end;

class procedure TFIN_AnexosWizard.DeletaAnexos(ATableName, ATableKey: string);
var
  FIN_Datamodule : TFIN_AnexosDatamodule;
  FIN_Anexos : TFIN_AnexosWizard;
begin
  FIN_Anexos     := TFIN_AnexosWizard.Create ( nil ) ;

  with FIN_Datamodule do
    begin
      SetFilter( ATableName, ATableKey );

      if cdsAnexos.RecordCount > 0 then
        cdsAnexos.First;
        cdsAnexos.DisableControls;
        while not cdsAnexos.Eof do
          cdsAnexos.Delete;

        cdsAnexos.EnableControls ;

      ApplyUpdates;
    end;

  FIN_Anexos.Free;
end;

class procedure TFIN_AnexosWizard.ExecuteWizard( ATableName, ATableKey : string );
const
  MSG_ARQUIVO  = 'Arquivo anexado com sucesso!';
  MSG_ARQUIVOS = 'Arquivos anexados com sucesso!';
var
  FIN_Anexos : TFIN_AnexosWizard;
  ModalResult, PontoSalvamento: Integer;
  Result : Boolean ;
begin
  FIN_Anexos := TFIN_AnexosWizard.Create ( nil ) ;

  with FIN_Anexos do
    begin
      FTableName := ATableName ;
      FTableKey  := ATableKey ;
      ChangeFilter;

      try
        ModalResult := ShowModal ;
        Result  := ( ModalResult = mrOK ) ;
        if Result then
          begin
            FIN_AnexosDatamodule.ApplyUpdates;
            if FIN_AnexosDatamodule.cdsAnexos.RecordCount > 1 then
              ShowMessage( MSG_ARQUIVOS )
            else
              ShowMessage( MSG_ARQUIVO );
          end;
            {ThisForm.DoSomething}  ;
      finally
         Free ;
      end ;
    end;
end;


procedure TFIN_AnexosWizard.SaveAs ;
var
  FExtensao : string ;
begin
  with FIN_AnexosDatamodule do
    begin

      FExtensao := ExtractFileExt( cdsAnexosFILENAME.AsString ) ;
      FExtensao := Copy( FExtensao, 2, Length( FExtensao ) ) ;

      SaveDialog1.FileName := cdsAnexosFILENAME.AsString ;
      SaveDialog1.Filter   := 'Arquivos ' + FExtensao + '|' + FExtensao;

      if not cdsAnexosFILENAME.IsNull then
        if SaveDialog1.Execute then
          TBlobField ( cdsAnexosDATA ).SaveToFile ( SaveDialog1.FileName + '.' + FExtensao ) ;

      ShellExecute( 0, 'open', PChar ( SaveDialog1.FileName + '.' + FExtensao ), nil, nil, SW_SHOW ) ;
    end;
end;


procedure TFIN_AnexosWizard.JvDBUltimGrid1DblClick(Sender: TObject);
begin
  SaveAs ;
end;

procedure TFIN_AnexosWizard.JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid( Sender ), FIN_AnexosDatamodule do
    begin
      if ( Field = cdsAnexosFILENAME ) then
        AllowEdit := False;
    end;
end;

end.

