unit UZoo_TrocaDeRetiroWizard;

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
  SysFormWizard, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  uZoo_TrocaDeRetiroDatamodule, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.Mask, JvExMask, JvToolEdit, JvDBControls, VCL.DBCtrls, Tc.VCL.Edits,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions
  , CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_TrocaDeRetiroWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsTrocaRetiro: TDataSource;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtBrinco: TEdit;
    BitBtn2: TTcGDIButton;
    JvDBDateEdit1: TTcDBDateEdit;
    Label2: TLabel;
    edtRetiro: TEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edtBrincoEnter(Sender: TObject);
    procedure dtsTrocaRetiroDataChange(Sender: TObject; Field: TField);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtRetiroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Zoo_TrocaDeRetiroDatamodule : TZoo_TrocaDeRetiroDatamodule ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses Exceptions;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_TrocaDeRetiroWizard.BitBtn2Click(Sender: TObject);
begin
    Zoo_TrocaDeRetiroDatamodule.RemoveRecord ;
end;

constructor TZoo_TrocaDeRetiroWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_TrocaDeRetiroDatamodule := TZoo_TrocaDeRetiroDatamodule.Create ( self ) ;
   Zoo_TrocaDeRetiroDatamodule.OpenTables ;
   dtsTrocaRetiro.DataSet := Zoo_TrocaDeRetiroDatamodule.cdsTrocaRetiro ;

end;

class function TZoo_TrocaDeRetiroWizard.Execute : boolean;
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

procedure TZoo_TrocaDeRetiroWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_TrocaDeRetiroWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
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

procedure TZoo_TrocaDeRetiroWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_TrocaDeRetiroWizard.dtsTrocaRetiroDataChange(Sender: TObject;
  Field: TField);
begin

  with Zoo_TrocaDeRetiroDatamodule.cdsTrocaRetiro do
    dtsTrocaRetiro.AutoEdit := not ( bof and eof ) ;
end;

procedure TZoo_TrocaDeRetiroWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_TrocaDeRetiroWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
      if ( Trim ( edtRetiro.Text ) = '' ) then
        Raise Warning.Create ( 'Informe o retiro' )  ;

     try
        Zoo_TrocaDeRetiroDatamodule.AddBrinco ( edtBrinco.Text, edtRetiro.text, Date ) ;
     finally
        edtBrinco.setFocus ;
        edtBrinco.SelectAll ;
     end;

    end;
end;


procedure TZoo_TrocaDeRetiroWizard.edtRetiroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
       Key := #0 ;
       if Trim ( edtRetiro.Text ) <> '' then
          edtBrinco.SetFocus ;
    end;
end;

procedure TZoo_TrocaDeRetiroWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_TrocaDeRetiroDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_TrocaRetiro.CreateAndDispatch( self ) ;
  inherited;
end;

procedure TZoo_TrocaDeRetiroWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_TrocaDeRetiroDatamodule.cdsTrocaRetiro.IsEmpty ;
  except
  End;
end;

procedure TZoo_TrocaDeRetiroWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_TrocaDeRetiroWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_TrocaDeRetiroWizard ) ;

end.
