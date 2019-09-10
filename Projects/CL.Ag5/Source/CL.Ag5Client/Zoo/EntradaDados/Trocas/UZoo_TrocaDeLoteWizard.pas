unit UZoo_TrocaDeLoteWizard;

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
  SysFormWizard, VCL.Mask, VCL.DBCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_TrocaDeLoteDatamodule, Data.DB, Tc.Data.DB.Helpers, JvExExtCtrls, JvExtComponent, JvPanel,
  JvImage, JvExMask, JvToolEdit, JvDBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  Tc.VCL.Edits.DBControls, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_TrocaDeLoteWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsPorAnimal: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsTrocaLote: TDataSource;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtBrinco: TEdit;
    Label5: TLabel;
    dbeLote: TDBEdit;
    BitBtn2: TTcGDIButton;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBDateEdit2: TTcDBDateEdit;
    Data: TLabel;
    tbsSelect: TTabSheet;
    rbPorAninal: TRadioButton;
    rbPorLote: TRadioButton;
    tbsPorLote: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TcGDIButton1: TTcGDIButton;
    JvDBUltimGrid2: TJvDBUltimGrid;
    btnSelecionarAnimais: TTcGDIButton;
    cbxLotesSource: TComboBox;
    cbxLotesTarget: TComboBox;
    deDataLote: TTcDateEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbeLoteKeyPress(Sender: TObject; var Key: Char);
    procedure dtsTrocaLoteDataChange(Sender: TObject; Field: TField);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure JvDBDateEdit2Enter(Sender: TObject);
    procedure JvDBDateEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarAnimaisClick(Sender: TObject);
    procedure GetListaLotes ;
    function JvDBUltimGrid2CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
  private
    { Private declarations }
    Zoo_TrocaDeLoteDatamodule : TZoo_TrocaDeLoteDatamodule ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;


implementation

uses Exceptions;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_TrocaDeLoteWizard.BitBtn2Click(Sender: TObject);
begin
  Zoo_TrocaDeLoteDatamodule.RemoveRecord ;
end;

procedure TZoo_TrocaDeLoteWizard.btnSelecionarAnimaisClick(Sender: TObject);
begin
   Zoo_TrocaDeLoteDatamodule.AddLote(cbxLotesSource.Text, cbxLotesTarget.Text, deDataLote.Date )
end;

constructor TZoo_TrocaDeLoteWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_TrocaDeLoteDatamodule := TZoo_TrocaDeLoteDatamodule.Create ( self ) ;
   Zoo_TrocaDeLoteDatamodule.OpenTables ;
   dtsTrocaLote.DataSet := Zoo_TrocaDeLoteDatamodule.cdsTrocaLote ;
   deDataLote.Date := Date ;
end;

class function TZoo_TrocaDeLoteWizard.Execute : boolean;
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


procedure TZoo_TrocaDeLoteWizard.GetListaLotes;
begin
  if not rbPorLote.Checked then
     exit ;

  cbxLotesSource.Items.Clear ;
  Zoo_TrocaDeLoteDatamodule.GetListaLote( cbxLotesSource.Items ) ;
  cbxLotesTarget.Items.Assign( cbxLotesSource.Items ) ;
end;

procedure TZoo_TrocaDeLoteWizard.JvDBDateEdit2Enter(Sender: TObject);
begin
  JvDBDateEdit2.SelectAll ;
end;

procedure TZoo_TrocaDeLoteWizard.JvDBDateEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
     begin
       Key := #0 ;
       edtBrinco.SetFocus ;
     end;
end;

procedure TZoo_TrocaDeLoteWizard.JvDBUltimGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_TrocaDeLoteWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
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

procedure TZoo_TrocaDeLoteWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

function TZoo_TrocaDeLoteWizard.JvDBUltimGrid2CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_TrocaDeLoteDatamodule.cdsTrocaLotePROCESSAR ;
  StringForTrue  := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_TrocaDeLoteWizard.dbeLoteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if Key = #13 then
     begin
       Key := #0 ;
       JvDBDateEdit2.SetFocus ;
     end;
end;

procedure TZoo_TrocaDeLoteWizard.dtsTrocaLoteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with Zoo_TrocaDeLoteDatamodule.cdsTrocaLote do
    dtsTrocaLote.AutoEdit := not ( bof and eof ) ;
end;

procedure TZoo_TrocaDeLoteWizard.edtBrincoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Zoo_TrocaDeLoteDatamodule.cdsTrocaLote.State in [dsInsert,dsEdit] then
     Zoo_TrocaDeLoteDatamodule.cdsTrocaLote.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtLote.Text ) = '' ) then
//        Raise Warning.Create ( 'Informe o lote' )  ;

     try
       Zoo_TrocaDeLoteDatamodule.AddBrinco ( edtBrinco.Text, '', Date )
     finally
       dbeLote.setFocus ;
     end;

    end;
end;


procedure TZoo_TrocaDeLoteWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_TrocaDeLoteDatamodule.ApplyUpdates ;
  GetListaLotes ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_TrocaLote.CreateAndDispatch( self ) ;
  inherited;
end;

procedure TZoo_TrocaDeLoteWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  Try
    _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and  not Zoo_TrocaDeLoteDatamodule.cdsTrocaLote.IsEmpty ;
  except
  End;
end;

procedure TZoo_TrocaDeLoteWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  self.tbsPorAnimal.Enabled := rbPorAninal.Checked ;
  self.tbsPorLote.Enabled   := rbPorLote.Checked ;

  if rbPorLote.Checked then
    GetListaLotes;

  inherited;

end;

procedure TZoo_TrocaDeLoteWizard._actPriorExecute(Sender: TObject);
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
  RegisterClass ( TZoo_TrocaDeLoteWizard ) ;

end.
