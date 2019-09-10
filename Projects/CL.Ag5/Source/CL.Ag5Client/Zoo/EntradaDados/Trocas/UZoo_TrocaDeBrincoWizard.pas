unit UZoo_TrocaDeBrincoWizard;

{ DONE -oCaique -cDados do Periodo / Troca : - Acertar tela para abrir em aba }
{ DONE -oCaique -cDados do Periodo / Troca : - Acertar disposição da grid }
{ DONE -oCaique -cDados do Periodo / Troca : - Bloquear inclusão direta na grid }
{ DONE -oCaique -cDados do Periodo / Troca : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Troca : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Troca : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, UZoo_TrocaDeBrincoDatamodule, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, VCL.DBCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvImage, JvExMask, JvToolEdit, JvDBControls,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions
  , CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_TrocaDeBrincoWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsTrocaBrinco: TDataSource;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtBrincoTrocar: TEdit;
    Label2: TLabel;
    dbeBrinco: TDBEdit;
    actAutoEdit: TAction;
    JvDBDateEdit2: TTcDBDateEdit;
    BitBtn2: TTcGDIButton;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoTrocarKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbeBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoTrocarEnter(Sender: TObject);
    procedure dbeBrincoEnter(Sender: TObject);
    procedure dtsTrocaBrincoDataChange(Sender: TObject; Field: TField);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Zoo_TrocaDeBrincoDatamodule : TZoo_TrocaDeBrincoDatamodule ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation


{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_TrocaDeBrincoWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_TrocaDeBrincoDatamodule.RemoveRecord ;
end;

constructor TZoo_TrocaDeBrincoWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_TrocaDeBrincoDatamodule := TZoo_TrocaDeBrincoDatamodule.Create ( self ) ;
   Zoo_TrocaDeBrincoDatamodule.OpenTables ;
   dtsTrocaBrinco.DataSet := Zoo_TrocaDeBrincoDatamodule.cdsTrocaBrinco ;

end;


class function TZoo_TrocaDeBrincoWizard.Execute : boolean;
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


procedure TZoo_TrocaDeBrincoWizard.JvDBDateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      edtBrincoTrocar.setFocus ;
      edtBrincoTrocar.SelectAll ;
    end;
end;

procedure TZoo_TrocaDeBrincoWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_TrocaDeBrincoWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;


   if (  Screen.ActiveControl = JvDBUltimGrid1 ) then
      Key := #0 ;

   with (JvDBUltimGrid1) do
       begin
          SkipDone := False ;
          while selectedindex < (fieldcount - 1) do
            begin
              selectedindex := selectedindex + 1 ;
              if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
               begin
                 SkipDone := True ;
                 Break ;
               end;
           end ;

          if not SkipDone then
             begin
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;
end;

procedure TZoo_TrocaDeBrincoWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_TrocaDeBrincoWizard.dbeBrincoEnter(Sender: TObject);
begin
  inherited;
  dbeBrinco.SelectAll ;
end;

procedure TZoo_TrocaDeBrincoWizard.dbeBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      edtBrincoTrocar.SetFocus ;
    end;
end;

procedure TZoo_TrocaDeBrincoWizard.dtsTrocaBrincoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with Zoo_TrocaDeBrincoDatamodule.cdsTrocaBrinco do
    dtsTrocaBrinco.AutoEdit := not ( bof and eof ) ;
end;

procedure TZoo_TrocaDeBrincoWizard.edtBrincoTrocarEnter(Sender: TObject);
begin
  inherited;
  edtBrincoTrocar.selectAll ;
end;

procedure TZoo_TrocaDeBrincoWizard.edtBrincoTrocarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      if ( Trim ( edtBrincoTrocar.Text ) = '' ) then
        exit ;


      try
        Zoo_TrocaDeBrincoDatamodule.AddBrinco ( edtBrincoTrocar.Text, Date ) ;
         dbeBrinco.enabled := True ;
         dbeBrinco.setFocus ;
         dbeBrinco.SelectAll ;
      except
         edtBrincoTrocar.SetFocus ;
         edtBrincoTrocar.SelectAll ;
         raise ;
      end ;
    end;
end;

procedure TZoo_TrocaDeBrincoWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_TrocaDeBrincoDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_TrocaBrinco.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_TrocaDeBrincoWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and
                not Zoo_TrocaDeBrincoDatamodule.cdsTrocaBrinco.IsEmpty ;
    dbeBrinco.Enabled := _actExecute.Enabled ;
  except
  End;
end;

procedure TZoo_TrocaDeBrincoWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_TrocaDeBrincoWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_TrocaDeBrincoWizard ) ;

end.
