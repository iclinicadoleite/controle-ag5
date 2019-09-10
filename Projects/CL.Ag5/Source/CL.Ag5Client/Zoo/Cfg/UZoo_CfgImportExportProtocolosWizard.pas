unit UZoo_CfgImportExportProtocolosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask,
  JvToolEdit,
  UZoo_CfgImportExportProtocolosDatamodule, Data.DB, Tc.Data.DB.Helpers,  JvDialogs, VCL.Dialogs,
  Tc.VCL.Dialogs, Tc.VCL.Controls.GDIButton, Tc.VCL.Extended.Mask,
  Tc.VCL.Edits, System.Actions, Tc.VCL.Application, Wrappers ;

type

  TImportExport = ( ieImport, ieExport ) ;

  TZoo_CfgImportExportProtocolosWizard = class(T_FormWizard)
    tbsSelect: TTabSheet;
    tbsSelectExport: TTabSheet;
    rbImportar: TRadioButton;
    rbExportar: TRadioButton;
    Panel1: TPanel;
    dbgOutProtocolos: TJvDBUltimGrid;
    Panel2: TPanel;
    dbgOutTarefas: TJvDBUltimGrid;
    tbsDoImport: TTabSheet;
    Panel3: TPanel;
    dbgInProtocolos: TJvDBUltimGrid;
    Panel4: TPanel;
    dbgInTarefas: TJvDBUltimGrid;
    dtsExportProtocolos: TDataSource;
    dtsExportTarefas: TDataSource;
    cbExportAllProtocolos: TCheckBox;
    cbExportAllTarefas: TCheckBox;
    cbImportAllProtocolos: TCheckBox;
    cbImportAllTarefas: TCheckBox;
    dtsImportProtocolos: TDataSource;
    dtsImportTarefas: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    edtImport: TTcFilenameEdit;
    JvSaveDialog1X: TJvSaveDialog;
    Label1: TLabel;
    JvSaveDialog1: TSaveDialog;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure cbExportAllProtocolosClick(Sender: TObject);
    procedure cbExportAllTarefasClick(Sender: TObject);
    procedure cbImportAllProtocolosClick(Sender: TObject);
    procedure cbImportAllTarefasClick(Sender: TObject);
    function dbgCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgOutProtocolosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgOutTarefasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgInProtocolosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgInTarefasKeyPress(Sender: TObject; var Key: Char);
    procedure rbExportarClick(Sender: TObject);
    procedure rbImportarClick(Sender: TObject);
    procedure dbgShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dbgInProtocolosCellClick(Column: TColumn);
    procedure dbgInTarefasCellClick(Column: TColumn);
    procedure dbgOutProtocolosCellClick(Column: TColumn);
    procedure dbgOutTarefasCellClick(Column: TColumn);
    procedure _actNextUpdate(Sender: TObject);
  private
    { Private declarations }
    FImportExport : TImportExport ;
    Zoo_CfgImportExportProtocolosDatamodule : TZoo_CfgImportExportProtocolosDatamodule ;
   procedure resetCheckBoxAll ;
   function ValidaProcessar : Boolean;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation


{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_CfgImportExportProtocolosWizard.cbExportAllProtocolosClick(Sender: TObject);
begin
  Zoo_CfgImportExportProtocolosDatamodule.ExportAllProtocolos ( cbExportAllProtocolos.Checked ) ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.cbExportAllTarefasClick(
  Sender: TObject);
begin
  inherited;
  Zoo_CfgImportExportProtocolosDatamodule.ExportAllTarefas ( cbExportAllTarefas.Checked ) ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.cbImportAllProtocolosClick(
  Sender: TObject);
begin
  Zoo_CfgImportExportProtocolosDatamodule.ImportAllProtocolos ( cbImportAllProtocolos.Checked ) ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.cbImportAllTarefasClick(
  Sender: TObject);
begin
  inherited;
  Zoo_CfgImportExportProtocolosDatamodule.ImportAllTarefas ( cbImportAllTarefas.Checked ) ;
end;

constructor TZoo_CfgImportExportProtocolosWizard.Create(AOwner: TComponent);
begin
  inherited;
  Zoo_CfgImportExportProtocolosDatamodule := TZoo_CfgImportExportProtocolosDatamodule.Create ( self ) ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgOutProtocolosCellClick(
  Column: TColumn);
begin
  if ( not Zoo_CfgImportExportProtocolosDataModule.cdsProtocolos.IsEmpty )
  and ( Column.Field =  Zoo_CfgImportExportProtocolosDatamodule.cdsProtocolosEXPORT ) then
     Zoo_CfgImportExportProtocolosDataModule.InvertExportProtocolos ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgOutProtocolosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
     Zoo_CfgImportExportProtocolosDataModule.InvertExportProtocolos ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

class function TZoo_CfgImportExportProtocolosWizard.Execute : boolean;
var
  ThisForm: TZoo_CfgImportExportProtocolosWizard;
begin
  ThisForm := TZoo_CfgImportExportProtocolosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_CfgImportExportProtocolosWizard.dbgOutTarefasCellClick(
  Column: TColumn);
begin
  if ( not Zoo_CfgImportExportProtocolosDataModule.cdsTarefas.IsEmpty )
  and ( Column.Field =  Zoo_CfgImportExportProtocolosDataModule.cdsTarefasEXPORT ) then
     Zoo_CfgImportExportProtocolosDataModule.InvertExportTarefas ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgOutTarefasKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #32 then
     Zoo_CfgImportExportProtocolosDataModule.InvertExportTarefas ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgGetCellProps(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
 inherited;

 with Zoo_CfgImportExportProtocolosDatamodule do
 if (    (( Field.DataSet = cdsTmpProtocolos ) and ( cdsTmpProtocolosEXISTS.asInteger = 1 ))
      or (( Field.DataSet = cdsTmpTarefas    )  and ( cdsTmpTarefasEXISTS.asInteger   = 1 )) ) then
      AFont.Color := clRed ;
end;

function TZoo_CfgImportExportProtocolosWizard.dbgCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;

 with Zoo_CfgImportExportProtocolosDatamodule do
  Result := ( Field = cdsProtocolosEXPORT  )
        or  ( Field = cdsTarefasEXPORT )
        or  ( Field = cdsTmpProtocolosIMPORT )
        or  ( Field = cdsTmpTarefasIMPORT ) ;

  StringForTrue  := '1' ;
  StringForFalse := '0' ;

end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgInProtocolosCellClick(
  Column: TColumn);
begin
  if ( not Zoo_CfgImportExportProtocolosDataModule.cdsTmpProtocolos.IsEmpty )
  and ( Column.Field =  Zoo_CfgImportExportProtocolosDataModule.cdsTmpProtocolosIMPORT ) then
     Zoo_CfgImportExportProtocolosDataModule.InvertImportProtocolos ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgInProtocolosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #32 then
     Zoo_CfgImportExportProtocolosDataModule.InvertImportProtocolos ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgInTarefasCellClick(
  Column: TColumn);
begin
  if ( not Zoo_CfgImportExportProtocolosDataModule.cdsTmpTarefas.IsEmpty )
  and ( Column.Field =  Zoo_CfgImportExportProtocolosDatamodule.cdsTmpTarefasIMPORT ) then
     Zoo_CfgImportExportProtocolosDataModule.InvertImportTarefas ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.dbgInTarefasKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #32 then
     Zoo_CfgImportExportProtocolosDataModule.InvertImportTarefas ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.rbExportarClick(Sender: TObject);
begin
  inherited;
  edtImport.Enabled := False ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.rbImportarClick(Sender: TObject);
begin
  inherited;
  edtImport.Enabled := True ;
end;

procedure TZoo_CfgImportExportProtocolosWizard.resetCheckBoxAll;
begin

  cbExportAllProtocolos.OnClick := nil ;
  cbExportAllTarefas.OnClick    := nil ;
  cbImportAllProtocolos.OnClick := nil ;
  cbImportAllProtocolos.OnClick := nil ;

  cbExportAllProtocolos.Checked := False ;
  cbExportAllTarefas.Checked    := False ;
  cbImportAllProtocolos.Checked := False ;
  cbImportAllProtocolos.Checked := False ;

  cbExportAllProtocolos.OnClick := cbExportAllProtocolosClick  ;
  cbExportAllTarefas.OnClick    := cbExportAllTarefasClick     ;
  cbImportAllProtocolos.OnClick := cbImportAllProtocolosClick  ;
  cbImportAllProtocolos.OnClick := cbImportAllProtocolosClick  ;

end;

function TZoo_CfgImportExportProtocolosWizard.ValidaProcessar: Boolean;
var //VTS
  SomaExistsProt : Integer;
  SomaExistsTar  : Integer;
begin
  SomaExistsProt := 0;
  SomaExistsTar  := 0;

  with Zoo_CfgImportExportProtocolosDatamodule do
    begin
      with cdsTmpProtocolos do
        begin
          if Active = False then
            Exit ;

          First;
          DisableControls;
          while not Eof do
            begin
              if cdsTmpProtocolosEXISTS.AsInteger = 1 then
                SomaExistsProt := SomaExistsProt + 1;

              Next;
            end;
          First;
          EnableControls;
        end;

      with cdsTmpTarefas do
        begin
          First;
          DisableControls;
          while not Eof do
            begin
              if cdsTmpTarefasEXISTS.AsInteger = 1 then
                SomaExistsTar := SomaExistsTar + 1;

              Next;
            end;
          First;
          EnableControls;
        end;

      Result := (     ( SomaExistsProt = cdsTmpProtocolos.RecordCount )
                  and ( SomaExistsTar = cdsTmpTarefas.RecordCount ) );
    end;
end;

procedure TZoo_CfgImportExportProtocolosWizard._actExecuteExecute(
  Sender: TObject);
begin
  if ( FImportExport = ieExport ) then
    begin
//      JvSaveDialog1.DefBtnCaption := 'Salvar' ;

      if not JvSaveDialog1.Execute then
         Exit ;

       Zoo_CfgImportExportProtocolosDatamodule.DoExport( JvSaveDialog1.fileName ) ;
    end
  else
    Zoo_CfgImportExportProtocolosDatamodule.DoImport ;

  inherited;
  MessageDlg ( 'Processado com sucesso!' ) ;
  PageControl.ActivePage := tbsSelect ;
end;

procedure TZoo_CfgImportExportProtocolosWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  tbsDoImport.Enabled     := rbImportar.checked ;
  tbsSelectExport.Enabled := rbExportar.checked ;

  inherited;

  resetCheckBoxAll ;

  if ( PageControl.ActivePage = tbsSelectExport ) then
    begin
     FImportExport := ieExport ;
     Zoo_CfgImportExportProtocolosDatamodule.OpenExportTables ;
    end;

  if ( PageControl.ActivePage = tbsDoImport ) then
    begin
     FImportExport := ieImport ;
     Zoo_CfgImportExportProtocolosDatamodule.OpenImportTables( edtImport.Text )  ;
    end;

  _actExecute.Enabled := ( not ValidaProcessar ) or ( rbExportar.Checked );
end;

procedure TZoo_CfgImportExportProtocolosWizard._actNextUpdate(Sender: TObject);
begin
  _actNext.Enabled := ( rbExportar.Checked ) or (rbImportar.Checked and FileExists (edtImport.Text)  )

end;

procedure TZoo_CfgImportExportProtocolosWizard._actPriorExecute(Sender: TObject);
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

  RegisterClass ( TZoo_CfgImportExportProtocolosWizard ) ;

end.