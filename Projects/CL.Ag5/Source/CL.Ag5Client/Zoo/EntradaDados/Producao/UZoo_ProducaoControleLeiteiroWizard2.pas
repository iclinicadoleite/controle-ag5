unit UZoo_ProducaoControleLeiteiroWizard2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids,
  JvImage, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, JvExExtCtrls,
  SysFormEditaLista, ReportTypes, VCL.Mask, JvExMask, JvToolEdit, JvSpin,
  JvDBSpinEdit, JvExtComponent, JvPanel, JvBaseEdits, JvDBControls,
  Exceptions, VCL.DBCtrls, SysFormWizard, JvExComCtrls, JvComCtrls, UZoo_ProducaoControleLeiteiroDatamodule2,
  JvComponentBase, JvMaskEdit, JvDBFindEdit, Tc.VCL.Edits,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.ControlPopuper,
  Tc.VCL.FloatPanel,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type

  TZoo_ProducaoControleLeiteiroWizard2 = class(TZoo_EntradaDadosBaseWizard)
    PesagensGrid: TJvDBUltimGrid;
    dtsFicha: TDataSource;
    dtsPesagens: TDataSource;
    gbxSelecao: TGroupBox;
    Label2: TLabel;
    lblNumeroOrdenhas: TLabel;
    JvDBSpinEdit1: TJvDBSpinEdit;
    gbxBuscaRapida: TGroupBox;
    Label1: TLabel;
    edtBrinco: TEdit;
    edOrd1: TJvDBCalcEdit;
    edOrd2: TJvDBCalcEdit;
    edOrd3: TJvDBCalcEdit;
    lbl1Ord: TLabel;
    lbl2Ord: TLabel;
    lbl3Ord: TLabel;
    DBMemo1: TDBMemo;
    TabSheet1: TTabSheet;
    btnSelecionarAnimais: TTcGDIButton;
    edtOrd1: TJvDBCalcEdit;
    edtOrd2: TJvDBCalcEdit;
    edtOrd3: TJvDBCalcEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    btnImportarPesagens: TTcGDIButton;
    Button3: TTcGDIButton;
    PanelGrid: TPanel;
    Panel2: TPanel;
    lbNome: TLabel;
    btnCheckDoente: TTcGDIButton;
    SelectRetiroPanel: TTcCaptionedPanel;
    Panel3: TPanel;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    RetirosGrid: TJvDBUltimGrid;
    PopuperRetiros: TTcControlPopuper;
    dtsRetiros: TDataSource;
    btnExcluirSelecao: TTcGDIButton;
    procedure dtsPesagensDataChange(Sender: TObject; Field: TField);
    procedure PesagensGridShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edOrd1KeyPress(Sender: TObject; var Key: Char);
    procedure edOrd2KeyPress(Sender: TObject; var Key: Char);
    procedure edOrd3KeyPress(Sender: TObject; var Key: Char);
    procedure EditEnter(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actNewExecute(Sender: TObject);
    procedure btnSelecionarAnimaisClick(Sender: TObject);
    procedure btnImportarPesagensClick(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PesagensGridKeyPress(Sender: TObject; var Key: Char);
    function PesagensGridCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure PesagensGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBFindEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure JvDBSpinEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PanelGridEnter(Sender: TObject);
    procedure btnCheckDoenteClick(Sender: TObject);
    procedure PopuperRetirosClose(Sender: TObject);
    procedure PopuperRetirosShow(Sender: TObject);
    procedure FloatEditorOKButtonClick(Sender: TObject);
    procedure FloatEditorCancelButtonClick(Sender: TObject);
    procedure RetirosGridDblClick(Sender: TObject);
    procedure RetirosGridShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure btnExcluirSelecaoClick(Sender: TObject);
  private
    { Private declarations }
    LastKey : char ;
    FSelectingAnimais : boolean ;
    Zoo_ProducaoControleLeiteiroDatamodule2 : TZoo_ProducaoControleLeiteiroDatamodule2 ;
    function ConfirmaPesagem ( APeso :double ) : boolean;
    procedure SelecionarAnimais ;
  protected
    { Protected declarations }
    procedure CheckVisible ;
    function DoQueryReopenBatch ( AData : TDateTime ) : Boolean ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsZootecnico, UZoo_ImportaPesagemWizard,
  UMessagePrintDialog ;

{$R *.dfm}

procedure TZoo_ProducaoControleLeiteiroWizard2.dtsFichaDataChange(Sender: TObject; Field: TField);
begin
  if not assigned( Zoo_ProducaoControleLeiteiroDatamodule2 ) then
    exit;

  inherited;
  CheckVisible ;
  if Field = Zoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagemNORD then
     Zoo_ProducaoControleLeiteiroDatamodule2.RecalcTotal
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.dtsPesagensDataChange(Sender: TObject;
  Field: TField);
begin
  if not assigned( Zoo_ProducaoControleLeiteiroDatamodule2 ) then
    exit;

  inherited;
  CheckVisible ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.edOrd1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
       Key := #0 ;
       if ( edOrd2.Visible ) then
         edOrd2.SetFocus
       else
         edtBrinco.SetFocus ;
    end ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.edOrd2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
       Key := #0 ;
       if ( edOrd3.Visible ) then
         edOrd3.SetFocus
       else
         edtBrinco.SetFocus ;
    end ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.edOrd3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
       Key := #0 ;
       edtBrinco.SetFocus ;
    end ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.EditEnter(Sender: TObject);
begin
  inherited;
  TCustomEdit( Sender ).SelectAll
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
     begin
       Key := #0 ;
       if not Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.Locate( 'BRINCO', edtBrinco.Text, [ loCaseInsensitive ] ) then
         begin
          edtBrinco.SelectAll ;
          Raise Warning.Create ( 'Brinco não localizado' ) ;
         end ;

        lbNome.Caption := '- ' + Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensNOMEESTABULO.AsString;
        edOrd1.SetFocus ;
     end;
end;


procedure TZoo_ProducaoControleLeiteiroWizard2.FloatEditorCancelButtonClick(
  Sender: TObject);
begin
  PopuperRetiros.ModalResult := mrCancel ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.FloatEditorOKButtonClick(
  Sender: TObject);
begin
  PopuperRetiros.ModalResult := mrOK ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.JvDBDateEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
        CheckVisible;
        if ( JvDBSpinEdit1.Visible = true ) then
          JvDBSpinEdit1.SetFocus ;
    end;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.JvDBFindEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key = #13 then
//     begin
//       Key := #0 ;
//        edOrd1.SetFocus ;
//     end;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.JvDBSpinEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      if(btnSelecionarAnimais.Enabled = true) then
        btnSelecionarAnimais.SetFocus ;
    end;
end;

function TZoo_ProducaoControleLeiteiroWizard2.PesagensGridCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagensANIMAL_DOENTE ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PesagensGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
      Key := 0 ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PesagensGridKeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  try
    if ( Key = '-' ) then
      begin
        Key := #0 ;
        exit ;
      end
    else if ( Key = ',' ) or ( Key = '.' ) then
      begin
        Key := FormatSettings.DecimalSeparator ;
        exit ;
      end
    else if ( Key <> #13 ) then
      exit ;

    if (  Screen.ActiveControl = PesagensGrid ) then
        Key := #0 ;


     with (PesagensGrid) do
         begin
            SkipDone := False ;
            while selectedindex < (fieldcount - 1) do
              begin
                selectedindex := selectedindex + 1 ;
                if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
                 begin
                   SkipDone := Copy ( Columns[ selectedindex ].Field.FieldName, 1, 3 ) = 'ORD';
                   if  SkipDone then
                       Break ;
                 end;
             end ;

            if not SkipDone then
               begin
                 DataSource.DataSet.Next;
                 selectedindex := 0 ;
                 if ( Key = #13 ) or ( Key = #0 ) then
                    while ( Copy ( Columns[ selectedindex ].Field.FieldName, 1, 3 ) <> 'ORD' ) do
                        selectedindex := selectedindex + 1
                 else
                    while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible )
                      and (selectedindex < (fieldcount - 1)) do
                       selectedindex := selectedindex + 1 ;
               end;
        end;
  finally
    LastKey := Key ;
  end

end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PesagensGridShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

//    if LastKey = #13 then
//       AllowEdit := False ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PanelGridEnter(Sender: TObject);
begin
  self.PesagensGrid.SetFocus
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PopuperRetirosClose(
  Sender: TObject);
begin
   if PopuperRetiros.ModalResult = mrOk then
     SelecionarAnimais ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.PopuperRetirosShow(
  Sender: TObject);
begin
  RetirosGrid.SetFocus ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.RetirosGridDblClick(
  Sender: TObject);
begin
   PopuperRetiros.ModalResult := mrOk ;

end;

procedure TZoo_ProducaoControleLeiteiroWizard2.RetirosGridShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
 AllowEdit := False ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2._actExecuteExecute(Sender: TObject);
var
  AMsg : string ;
const
  DlgCaption = '  Existem animais sem pesagem/status doente' ;
begin
//   TZoo_ProducaoControleLeiteiroDialogImprimir.Execute ( AMsg ) ;
  case Zoo_ProducaoControleLeiteiroDatamodule2.processa ( AMsg ) of
    splNaoProcessado     : TMessagePrintDialog.Execute ( DlgCaption, AMsg ) ;
    splProcessadoParcial :
      begin
         MessageProcessed   := 'Não processado.'#13#10'Existem animais sem pesagem em outro(s) retiro(s).' ;
         MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
         TCLAg5NSMsgEVT_ControleLeiteiro.CreateAndDispatch( self ) ; ;
      end ;
    splProcessado :
      begin
         MessageProcessed   := 'processado com sucesso' ;
         MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
         TCLAg5NSMsgEVT_ControleLeiteiro.CreateAndDispatch( self ) ; ;
         edtBrinco.Text := '' ;
         lbNome.Caption := '' ;
      end  ;
  end;

  inherited;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.IsEmpty

end;

procedure TZoo_ProducaoControleLeiteiroWizard2._actNewExecute(Sender: TObject);
begin
  inherited;
//
end;
procedure TZoo_ProducaoControleLeiteiroWizard2.SelecionarAnimais;
var
  StartTime : TDateTime ;
begin
  Application.processMessages ;
  try
    dtsFicha.OnDataChange     :=   nil ;
    dtsPesagens.OnDataChange  :=   nil ;
    btnSelecionarAnimais.Enabled := False ;
    FSelectingAnimais := True ;

    //if ( not Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.IsEmpty )
    // and ( messageDlg ( 'Os dados digitados serão apagados'#13#10'Deseja continuar ?', mtConfirmation, [mbYes, mbNo] ) <> mrYes ) then
    //    Exit ;

    StartTime := Now ;
    Zoo_ProducaoControleLeiteiroDatamodule2.SelecionaAnimais ;
    PesagensGrid.SetFocus ;
  finally
    dtsFicha.OnDataChange        := dtsFichaDataChange ;
    dtsPesagens.OnDataChange     := dtsPesagensDataChange ;
    FSelectingAnimais            := False ;
    btnSelecionarAnimais.Enabled := True ;
    CheckVisible;
  end;

  if DebugHook <> 0  then
       ShowMessage ( 'tempo decorrido = ' + FormatDateTime ( 'h'' h ''n'' min ''s'' s ''zzz'' m ''', Now - StartTime ) + ' ' + Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.RecordCount.ToString ) ;

end;

procedure TZoo_ProducaoControleLeiteiroWizard2.btnSelecionarAnimaisClick(Sender: TObject);
var
  LClientOrigem : TPoint ;
begin

   if Zoo_ProducaoControleLeiteiroDatamodule2.GetRetiros  then
     PopuperRetiros.PopupFromControl( btnSelecionarAnimais )
   else
     SelecionarAnimais ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.btnExcluirSelecaoClick(
  Sender: TObject);
begin
 Zoo_ProducaoControleLeiteiroDatamodule2.RemoverPesagens;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.btnImportarPesagensClick(Sender: TObject);
var
  FileName : string ;
begin
  inherited;
  if TZoo_ImportaPesagemWizard.Execute ( FileName  ) then
   begin
      Zoo_ProducaoControleLeiteiroDatamodule2.ImportFromXLS ( FileName ) ;
      MessageDlg  ( Format ( 'Importação concluída.'#13#10#13#10'Arquivo :"%s"'#13#10'Total de Pesagens importadas: %d',
         [  FileName, Zoo_ProducaoControleLeiteiroDatamodule2.CountPesagensImportadas ] ) ) ;
   end;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.Button3Click(Sender: TObject);
begin
  inherited;
  Zoo_ProducaoControleLeiteiroDatamodule2.preencheTeste ;
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.btnCheckDoenteClick(Sender: TObject);
begin
  Zoo_ProducaoControleLeiteiroDatamodule2.CheckDoente
end;

procedure TZoo_ProducaoControleLeiteiroWizard2.CheckVisible;
var
 i : integer ;
begin
//   lblNumeroOrdenhas.Visible := not Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.IsEmpty ;
//   JvDBSpinEdit1.Visible  := not Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens.IsEmpty ;

  with Zoo_ProducaoControleLeiteiroDatamodule2 do
     begin
        btnSelecionarAnimais.Enabled := ( cdsLotePesagemDATA.asFloat > 0 ) and not FSelectingAnimais ;
        //JvDBSpinEdit1.Visible  := cdsLotePesagemDATA.asFloat > 0 ;
        JvDBSpinEdit1.Visible  := true ;
        btnImportarPesagens.Enabled := not cdsPesagens.IsEmpty ;
        btnCheckDoente.Enabled      := not cdsPesagens.IsEmpty ;
        btnExcluirSelecao.Enabled   := not cdsPesagens.IsEmpty ;

        lbl1Ord.Visible := cdsLotePesagemNORD.asInteger > 0 ;
        lbl2Ord.Visible := cdsLotePesagemNORD.asInteger > 1 ;
        lbl3Ord.Visible := cdsLotePesagemNORD.asInteger > 2 ;

        edOrd1.Visible := cdsLotePesagemNORD.asInteger > 0 ;
        edOrd2.Visible := cdsLotePesagemNORD.asInteger > 1 ;
        edOrd3.Visible := cdsLotePesagemNORD.asInteger > 2 ;

        for I := 0 to PesagensGrid.Columns.Count - 1 do
          begin
            if PesagensGrid.Columns[ i ].Field = cdsPesagensORD1 then
               PesagensGrid.Columns[ i ].Visible := cdsLotePesagemNORD.asInteger > 0 ;
            if PesagensGrid.Columns[ i ].Field = cdsPesagensORD2 then
               PesagensGrid.Columns[ i ].Visible := cdsLotePesagemNORD.asInteger > 1;
            if PesagensGrid.Columns[ i ].Field = cdsPesagensORD3 then
               PesagensGrid.Columns[ i ].Visible := cdsLotePesagemNORD.asInteger > 2 ;
          end ;
     end;
end;

function TZoo_ProducaoControleLeiteiroWizard2.ConfirmaPesagem ( APeso :double ) : boolean;
begin
   Result := MessageDlg ( 'Confirma peso acima de %f Kg', [ APeso ], mtInformation, [ mbYes, mbNo ] ) = mrYes ;
end;

constructor TZoo_ProducaoControleLeiteiroWizard2.Create(AOwner: TComponent);
begin
  inherited;
  Zoo_ProducaoControleLeiteiroDatamodule2 := TZoo_ProducaoControleLeiteiroDatamodule2.Create ( self ) ;
  Zoo_ProducaoControleLeiteiroDatamodule2.OnQueryReopenBatch := DoQueryReopenBatch ;
  dtsFicha.DataSet := Zoo_ProducaoControleLeiteiroDatamodule2.cdsLotePesagem ;
  dtsPesagens.DataSet := Zoo_ProducaoControleLeiteiroDatamodule2.cdsPesagens ;
  dtsRetiros.DataSet := Zoo_ProducaoControleLeiteiroDatamodule2.cdsRetiros ;
  Zoo_ProducaoControleLeiteiroDatamodule2.OpenTables ;
  Zoo_ProducaoControleLeiteiroDatamodule2.OnConfirmaPeso := ConfirmaPesagem ;
  lbNome.Caption := EmptyStr;
  Button3.Visible := DebugHook <> 0 ;
end;

destructor TZoo_ProducaoControleLeiteiroWizard2.Destroy;
begin
  try
    Zoo_ProducaoControleLeiteiroDatamodule2.ApplyUpdates ;
    FreeAndNil(Zoo_ProducaoControleLeiteiroDatamodule2);
  except
  end;
  inherited;
end;

function TZoo_ProducaoControleLeiteiroWizard2.DoQueryReopenBatch(
  AData: TDateTime): Boolean;
begin
  Result :=
     MessageDlg (
       Format( 'Lote de pesagem de %s já processado.'#13#10'Deseja reabir este lote?',
               [ FormatDateTime ( '', AData ) ]
             ),
       mtConfirmation  ) = mrYes ;
end;

end.
