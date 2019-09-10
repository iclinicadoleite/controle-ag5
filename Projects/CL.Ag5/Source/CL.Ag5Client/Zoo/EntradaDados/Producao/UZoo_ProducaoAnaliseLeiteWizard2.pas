unit UZoo_ProducaoAnaliseLeiteWizard2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_ProducaoAnaliseLeiteDatamodule2, VCL.Mask, JvExMask, Tc.VCL.Edits, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers,
  VCL.DBCtrls,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  Vcl.Dialogs, JvDialogs, System.Actions, Tc.RTL.Exceptions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, JvBaseEdits, JvDBControls,
  Tc.VCL.FloatPanel, Tc.VCL.ControlPopuper, Tc.VCL.Edits.Numbers,
  Tc.VCL.Edits.DBControls, Wrappers ;

type
  TZoo_ProducaoAnaliseLeiteWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    pnlTeste: TPanel;
    Button1: TTcGDIButton;
    edtFileTeste: TTcFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    deTeste: TTcDateEdit;
    JvSaveDialog1: TJvSaveDialog;
    gbDadosPadrao: TGroupBox;
    edDataPadrao: TTcDateEdit;
    lbDataPadrao: TLabel;
    btSelecionarAnimais: TTcGDIButton;
    btImportarAnalises: TTcGDIButton;
    cbDigitarCCS: TCheckBox;
    cbDigitarComposicao: TCheckBox;
    cbDigitarNU: TCheckBox;
    pnlImportarArquivo: TPanel;
    edFileName: TTcFilenameEdit;
    Label3: TLabel;
    TcGDIButton1: TTcGDIButton;
    btImportar: TTcGDIButton;
    gbDados: TGroupBox;
    JvDBUltimGrid3: TJvDBUltimGrid;
    dtsAnalises: TDataSource;
    SelectRetiroPanel: TTcCaptionedPanel;
    Panel3: TPanel;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    RetirosGrid: TJvDBUltimGrid;
    PopuperRetiros: TTcControlPopuper;
    dtsRetiros: TDataSource;
    PopuperImportar: TTcControlPopuper;
    edCCSGrid: TTcDBCalcEdit;
    edGorduraGrid: TTcDBCalcEdit;
    edProteinaGrid: TTcDBCalcEdit;
    edLactoseGrid: TTcDBCalcEdit;
    edSolidosTotaisGrid: TTcDBCalcEdit;
    edNUGrid: TTcDBCalcEdit;
    DBMemo1: TDBMemo;
    pnlBrinco: TPanel;
    lbBrinco: TLabel;
    edtBrinco: TEdit;
    pnlCCS: TPanel;
    lbCCS: TLabel;
    edCCS: TTcDBCalcEdit;
    pnlComposicao: TPanel;
    lbGordura: TLabel;
    edGordura: TTcDBCalcEdit;
    lbProteina: TLabel;
    edProteina: TTcDBCalcEdit;
    lbLactose: TLabel;
    edLactose: TTcDBCalcEdit;
    lbSolidosTotais: TLabel;
    edSolidosTotais: TTcDBCalcEdit;
    pnlNU: TPanel;
    lbNU: TLabel;
    edNU: TTcDBCalcEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
    procedure btSelecionarAnimaisClick(Sender: TObject);
    procedure PopuperRetirosClose(Sender: TObject);
    procedure PopuperRetirosShow(Sender: TObject);
    procedure FloatEditorOKButtonClick(Sender: TObject);
    procedure FloatEditorCancelButtonClick(Sender: TObject);
    procedure PopuperImportarClose(Sender: TObject);
    procedure btImportarAnalisesClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure JvDBUltimGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBUltimGrid3ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure cbDigitarCCSClick(Sender: TObject);
    procedure cbDigitarComposicaoClick(Sender: TObject);
    procedure cbDigitarNUClick(Sender: TObject);
    procedure edCCSKeyPress(Sender: TObject; var Key: Char);
    procedure edGorduraKeyPress(Sender: TObject; var Key: Char);
    procedure edProteinaKeyPress(Sender: TObject; var Key: Char);
    procedure edSolidosTotaisKeyPress(Sender: TObject; var Key: Char);
    procedure edLactoseKeyPress(Sender: TObject; var Key: Char);
    procedure edNUKeyPress(Sender: TObject; var Key: Char);
    procedure dtsAnalisesDataChange(Sender: TObject; Field: TField);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FProcessed : Boolean ;
    FImported  : Boolean;
    Zoo_ProducaoAnaliseLeiteDatamodule : TZoo_ProducaoAnaliseLeiteDatamodule ;
    procedure ShowCCS;
    procedure ShowComposicao;
    procedure ShowNU;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;

    procedure SelecionarAnimais ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_ProducaoAnaliseLeiteWizard.btImportarAnalisesClick(
  Sender: TObject);
begin
  PopuperImportar.PopupFromControl( btImportarAnalises );
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.btImportarClick(Sender: TObject);
begin
  if Trunc( Zoo_ProducaoAnaliseLeiteDatamodule.DataAnalise ) = 0 then
     Raise Warning.Create( 'Informe a data da análise antes de prosseguir. ' ) ;

  FProcessed := False ;
  FImported := True;
  Zoo_ProducaoAnaliseLeiteDatamodule.LoadAnaliseFromFile ( edFileName.Text ) ;
  if Zoo_ProducaoAnaliseLeiteDatamodule.MessageImportacaoXLS <> '' then
    MessageDlg( Zoo_ProducaoAnaliseLeiteDatamodule.MessageImportacaoXLS );
  PopuperImportar.ModalResult := mrOK ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.btSelecionarAnimaisClick(
  Sender: TObject);
begin
  FImported := False;
  Zoo_ProducaoAnaliseLeiteDatamodule.DataAnalise := edDataPadrao.Date;

  if Trunc( Zoo_ProducaoAnaliseLeiteDatamodule.DataAnalise ) = 0 then
     Raise Warning.Create( 'Informe a data da análise antes de prosseguir. ' ) ;


  if Zoo_ProducaoAnaliseLeiteDatamodule.GetRetiros  then
     PopuperRetiros.PopupFromControl( btSelecionarAnimais )
   else
     SelecionarAnimais ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.Button1Click(Sender: TObject);
begin
  Zoo_ProducaoAnaliseLeiteDatamodule.GerarTeste( edtFileTeste.Text, deTeste.Date );
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.cbDigitarCCSClick(Sender: TObject);
begin
  inherited;
  ShowCCS;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.cbDigitarComposicaoClick(
  Sender: TObject);
begin
  inherited;
  ShowComposicao;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.cbDigitarNUClick(Sender: TObject);
begin
  inherited;
  ShowNU;
end;

constructor TZoo_ProducaoAnaliseLeiteWizard.Create(AOwner: TComponent);
begin
  inherited;
  FImported := False;
  Zoo_ProducaoAnaliseLeiteDatamodule := TZoo_ProducaoAnaliseLeiteDatamodule.Create( self );
  dtsRetiros.DataSet := Zoo_ProducaoAnaliseLeiteDatamodule.cdsRetiros;
  dtsAnalises.DataSet := Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises;
  pnlTeste.Visible := DebugHook <> 0 ;
  ShowCCS;
  ShowComposicao;
  ShowNU;
end;

destructor TZoo_ProducaoAnaliseLeiteWizard.Destroy;
begin
//
  inherited;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.dtsAnalisesDataChange(Sender: TObject;
  Field: TField);
begin

  if not Assigned( Zoo_ProducaoAnaliseLeiteDatamodule ) then
    Exit;

   if (Assigned(Field)) and (Field.FieldName = 'BRINCO') and
      (not Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises.IsEmpty) then
     edtBrinco.Text := Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalisesBRINCO.AsString;

end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edCCSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;

       if edGordura.Showing and (edGordura.CanFocus) then
          edGordura.SetFocus
       else
       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus
       else
       if edtBrinco.Showing and (edtBrinco.CanFocus) then
         edtBrinco.SetFocus;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edGorduraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;

       if edProteina.Showing and (edProteina.CanFocus) then
          edProteina.SetFocus
       else
       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus
       else
       if edtBrinco.Showing and (edtBrinco.CanFocus) then
         edtBrinco.SetFocus;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edLactoseKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;

       if edSolidosTotais.Showing and (edSolidosTotais.CanFocus) then
          edSolidosTotais.SetFocus
       else
       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus
       else
       if edtBrinco.Showing and (edtBrinco.CanFocus) then
         edtBrinco.SetFocus;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edNUKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;

      if edtBrinco.Showing and (edtBrinco.CanFocus) then
        edtBrinco.SetFocus;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edProteinaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;

       if edLactose.Showing and (edLactose.CanFocus) then
          edLactose.SetFocus
       else
       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus
       else
       if edtBrinco.Showing and (edtBrinco.CanFocus) then
         edtBrinco.SetFocus;
    end;

end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edSolidosTotaisKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;

       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus
       else
       if edtBrinco.Showing and (edtBrinco.CanFocus) then
         edtBrinco.SetFocus;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises.Prior ;
     edtBrinco.text := Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalisesBRINCO.asString ;
     edtBrinco.SelectAll ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises.Next ;
     edtBrinco.text := Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalisesBRINCO.asString ;
     edtBrinco.SelectAll ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      if not Zoo_ProducaoAnaliseLeiteDatamodule.cdsAnalises.Locate( 'BRINCO', edtBrinco.Text, [ loCaseInsensitive ] ) then
       begin
         edtBrinco.SelectAll ;
         Raise Warning.Create ( 'Brinco não localizado' ) ;
       end ;

       //lbNome.Caption := '- ' + Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensNOMEESTABULO.AsString;
       if edCCS.Showing and (edCCS.CanFocus) then
          edCCS.SetFocus
       else
       if edGordura.Showing and (edGordura.CanFocus) then
          edGordura.SetFocus
       else
       if edNU.Showing and (edNU.CanFocus) then
          edNU.SetFocus;
     end;
end;

class function TZoo_ProducaoAnaliseLeiteWizard.Execute : boolean;
var
  ThisForm: TZoo_ProducaoAnaliseLeiteWizard;
begin
  ThisForm := TZoo_ProducaoAnaliseLeiteWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;



procedure TZoo_ProducaoAnaliseLeiteWizard.FloatEditorCancelButtonClick(
  Sender: TObject);
begin
  PopuperRetiros.ModalResult := mrCancel ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.FloatEditorOKButtonClick(
  Sender: TObject);
begin
  PopuperRetiros.ModalResult := mrOK ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.JvDBUltimGrid3DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'BRINCO') and (FImported) then
   begin
     if JvDBUltimGrid3.DataSource.DataSet.FieldByName('IMPORTADO').AsString <> 'T' then
      begin
        JvDBUltimGrid3.Canvas.Font.Style := [fsbold];
        JvDBUltimGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
     else
      begin
        JvDBUltimGrid3.Canvas.Font.Style := [];
        JvDBUltimGrid3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.JvDBUltimGrid3ShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;

  AllowEdit  :=    (Field.FieldName = 'CCS') or
                   (Field.FieldName = 'GORDURA') or
                   (Field.FieldName = 'PROTEINA') or
                   (Field.FieldName = 'LACTOSE') or
                   (Field.FieldName = 'SOLIDOS_TOTAIS') or
                   (Field.FieldName = 'UREIA') or
                   (Field.FieldName = 'OBS');

end;

procedure TZoo_ProducaoAnaliseLeiteWizard.PopuperImportarClose(Sender: TObject);
begin
  inherited;
  if PopuperRetiros.ModalResult = mrOk then
     exit ; //colocar a função para importar do excel
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.PopuperRetirosClose(Sender: TObject);
begin
  if PopuperRetiros.ModalResult = mrOk then
     SelecionarAnimais ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.PopuperRetirosShow(Sender: TObject);
begin
  RetirosGrid.SetFocus ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.SelecionarAnimais;
begin
  Zoo_ProducaoAnaliseLeiteDatamodule.SelecionaAnimais ;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.ShowCCS;
begin


  pnlCCS.Visible := cbDigitarCCS.Checked;
  jvDBUltimGrid3.Columns[6].Visible := cbDigitarCCS.Checked;

  pnlCCS.Left := 0;
  pnlBrinco.Left := 0;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.ShowComposicao;
begin
  pnlComposicao.Visible := cbDigitarComposicao.Checked;
  jvDBUltimGrid3.Columns[7].Visible := cbDigitarComposicao.Checked;
  jvDBUltimGrid3.Columns[8].Visible := cbDigitarComposicao.Checked;
  jvDBUltimGrid3.Columns[9].Visible := cbDigitarComposicao.Checked;
  jvDBUltimGrid3.Columns[10].Visible := cbDigitarComposicao.Checked;

  pnlComposicao.Left := 0;
  pnlCCS.Left := 0;
  pnlBrinco.Left := 0;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.ShowNU;
begin
   pnlNU.Visible := cbDigitarNU.Checked;
  jvDBUltimGrid3.Columns[11].Visible := cbDigitarNU.Checked;

  pnlNu.Left := 0;
  pnlComposicao.Left := 0;
  pnlCCS.Left := 0;
  pnlBrinco.Left := 0;
end;

(*
procedure SaveRes(const AResName, AFileName : string );
var
  HResource: TResourceHandle;
  HResData: THandle;
  PWav: Pointer;
begin
 HResource := FindResource(HInstance, PChar(AResName), 'WAV');

 if HResource <> 0 then begin
   HResData:=LoadResource(HInstance, HResource);
   if HResData <> 0 then begin
     PWav:=LockResource(HResData);
     if Assigned(PWav) then
     begin
       // uses MMSystem
       sndPlaySound(nil, SND_NODEFAULT); // nil = stop currently playing
       sndPlaySound(PWav, SND_ASYNC or SND_MEMORY);
     end;
//      UnlockResource(HResData); // unnecessary per MSDN
//      FreeResource(HResData);   // unnecessary per MSDN
    end;
  end
  else
    RaiseLastOSError;
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

procedure TZoo_ProducaoAnaliseLeiteWizard.TcGDIButton1Click(Sender: TObject);
var
  source : string ;
begin
  JvSaveDialog1.FileName := 'Modelo Análises.xlsx' ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível exportar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     SaveRes ( 'XLS_ANALISES', JvSaveDialog1.FileName )  ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_ProducaoAnaliseLeiteDatamodule.ApplyUpdates ;
  FProcessed := True ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.CreateAndDispatch( self ) ; ;
  inherited;
  FImported := False;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actExecuteUpdate(Sender: TObject);
begin

    _actExecute.Enabled := Zoo_ProducaoAnaliseLeiteDatamodule.HasRegisterToSave;

   // inherited
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  FProcessed := False ;
  Zoo_ProducaoAnaliseLeiteDatamodule.LoadAnaliseFromFile ( edFileName.Text ) ;
  inherited;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := ( Application.LicenseState <> lsReadOnly )
     and  (edFileName.Text <> '')
     and  (    (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.cdla')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.sql')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.xls')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.xlsx')
          )
     and   FileExists ( edFileName.Text )
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

end.
