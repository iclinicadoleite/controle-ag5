unit UZoo_CfgTarefasForm2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage, VCL.DBCtrls,
  JvBaseEdits, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvExtComponent, JvPanel, VCL.ImgList, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, uImageListProvider, Tc.VCL.Application, Wrappers,
  SysFormEditaLista ;

type
  TZoo_CfgTarefasForm = class(T_FormEditaLista)
    ImageList1: TImageList;
    _pnlSearch: TPanel;
    _lblPesquisas: TLabel;
    _edtSearch: TJvComboEdit;
    CheckBox1: TCheckBox;
    DBMemo1: TDBMemo;
    JvDBCalcEdit1: TJvDBCalcEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    procedure dblcTipoTarefaCloseUp(Sender: TObject);
    procedure dblcTipoTarefaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBCalcEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioButtonClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _dbgListaShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _dbgListaKeyPress(Sender: TObject; var Key: Char);
    procedure NoAct(Sender: TObject);
    procedure dtsFichaStateChange(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure _actListaExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure edFuncionarioChange(Sender: TObject);
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _dbgListaEditButtonClick(Sender: TObject);
    procedure _edtSearchButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchFuncionario( const TextToSearch: string);
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure  Pesquisar ;
  public
    { Public declarations }
    class procedure ExecuteNewFastRegister;
    class procedure NovaTarefa ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SearchsZootecnico, UZoo_CfgTarefasDatamodule2 ;

{$R *.dfm}

procedure TZoo_CfgTarefasForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgTarefasDatamodule( DatamoduleBase ).cdsTarefas.Filtered := not CheckBox1.Checked ;
end;

constructor TZoo_CfgTarefasForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgTarefasDatamodule.Create ( self ) ;
  DatamoduleBase.OpenTables ;
  _dbgLista.ReadOnly := False ;
//  dblcTipoTarefa.KeyValue := TZoo_CfgTarefasDatamodule ( DatamoduleBase ).cdsTiposTarefaKZOO_CFGTIPOTAREFA.Value ;
end;

procedure TZoo_CfgTarefasForm.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if TZoo_CfgTarefasDatamodule ( DataModuleBase ).cdsTarefas.State = dsBrowse then
    begin
      TZoo_CfgTarefasDatamodule ( DataModuleBase ).cdsTarefas.BeforeEdit ( nil ) ;
      if not TZoo_CfgTarefasDatamodule ( DataModuleBase ).AllowChangeCodigo then
         Key := #0 ;
    end;

end;

procedure TZoo_CfgTarefasForm.dblcTipoTarefaCloseUp(Sender: TObject);
begin
  inherited;
  TZoo_CfgTarefasDatamodule ( DataModuleBase ).ReOpenTables ;
end;

procedure TZoo_CfgTarefasForm.dblcTipoTarefaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;




procedure TZoo_CfgTarefasForm.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned ( TZoo_CfgTarefasDatamodule ( DatamoduleBase ) ) then
     exit ;
(*
  try
  if not Assigned ( Field )
    or (Field = TZoo_CfgTarefasDatamodule ( DatamoduleBase ).cdsTarefas.CAD_FUNCIONARIO) then
     begin
       Image1.Picture := nil ;
       if not TZoo_CfgTarefasDatamodule ( DatamoduleBase ).cdsTarefas.CAD_FUNCIONARIO.isNull then
         begin
            edFuncionario.Font.Color := clNavy ;
            Image1.Hint := 'Funcionário associado ao cadastro.'  ;
            ImageList1.GetBitmap( 0, Image1.Picture.Bitmap )
         end
       else
         begin
            edFuncionario.Font.Color := clRed ;
            Image1.Hint := 'Funcionário não associado ao cadastro.'
                    +#13#10'Efetue a pesquisa.'  ;
            ImageList1.GetBitmap( 2, Image1.Picture.Bitmap ) ;
         end;
     end;
  except
  end;
*)
end;

procedure TZoo_CfgTarefasForm.dtsFichaStateChange(Sender: TObject);
begin
  inherited;

(*
  if TDataSet( Sender ).State in [dsEdit]  then
    try
      DBEdit1.Enabled :=  TZoo_CfgTarefasDatamodule(DatamoduleBase).AllowChangeCodigo ;
      if not DBEdit1.Enabled then
        begin
           DBEdit1.Undo ;
     ///    DBEdit2.Undo ;
        end;
    except

    end;
*)
end;

procedure TZoo_CfgTarefasForm.edFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
//  SetFuncionario ( edFuncionario.text )  ;
end;

procedure TZoo_CfgTarefasForm.edFuncionarioChange(Sender: TObject);
begin
  if not Assigned( TZoo_CfgTarefasDatamodule ( DataModuleBase ) ) then
     exit ;

//  if ( edFuncionario.Text <> TZoo_CfgTarefasDatamodule ( DataModuleBase ).cdsTarefas.OMEFUNCIONARIO.asString )
//  and not TZoo_CfgTarefasDatamodule ( DataModuleBase ).cdsTarefas.CAD_FUNCIONARIO.isNull then
//  TZoo_CfgTarefasDatamodule ( DataModuleBase ).cdsTarefas.CAD_FUNCIONARIO.Clear ;
end;

procedure TZoo_CfgTarefasForm.JvDBCalcEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '-' then
     Key := #0 ;
end;

procedure TZoo_CfgTarefasForm.JvDBCalcEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '-' then
     Key := #0 ;
end;

procedure TZoo_CfgTarefasForm.NoAct(Sender: TObject);
begin
  inherited;
_actOther.Enabled := False
end;

class procedure TZoo_CfgTarefasForm.NovaTarefa;
begin
  with Create ( nil ) do
    try
       BorderStyle := bsDialog ;
       ShowModal ;
    finally
       Free ;
    end;
end;

procedure TZoo_CfgTarefasForm.Pesquisar;
begin
  inherited ;
  if CheckBox1.Checked then
    begin
      with TZoo_CfgTarefasDatamodule( DatamoduleBase ), TSearchTarefa.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsTarefas.Locate( 'KZOO_TAREFA', Result.FieldByName( 'KZOO_TAREFA' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TZoo_CfgTarefasDatamodule( DatamoduleBase ), TSearchTarefaAtiva.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsTarefas.Locate( 'KZOO_TAREFA', Result.FieldByName( 'KZOO_TAREFA' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
end;


procedure TZoo_CfgTarefasForm._actEditExecute(Sender: TObject);
var
  x : integer  ;
  nColumn : integer ;
begin
  inherited;

  nColumn := -1 ;
  for x := 0 to _dbgLista.Columns.Count - 1 do
   begin
      if not _dbgLista.Columns[ x ].ReadOnly then
        begin
          nColumn := x ;
          Break ;
        end;
   end;

 if nColumn <> -1 then
   begin
     _dbgLista.Col := nColumn ;
     _dbgLista.EditorMode := True ;
   end;
end;

procedure TZoo_CfgTarefasForm._actListaExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TZoo_CfgTarefasForm._actNewExecute(Sender: TObject);
var
  x : integer  ;
  nColumn : integer ;
begin
  inherited;

  nColumn := -1 ;
  for x := 0 to _dbgLista.Columns.Count - 1 do
   begin
      if not _dbgLista.Columns[ x ].ReadOnly then
        begin
          nColumn := x ;
          Break ;
        end;
   end;

 if nColumn <> -1 then
   begin
     _dbgLista.Col := nColumn ;
     _dbgLista.EditorMode := True ;
   end;
end;

procedure TZoo_CfgTarefasForm._actSaveExecute(Sender: TObject);
begin
  inherited;
  TCLAg5NSMsgEVT_CfgTarefas.CreateAndDispatch( self );
end;

function TZoo_CfgTarefasForm._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin

 with TZoo_CfgTarefasDatamodule( DatamoduleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsTarefasATIVO ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TZoo_CfgTarefasForm.SearchFuncionario( const TextToSearch: string);
begin
  with TZoo_CfgTarefasDatamodule( DatamoduleBase ), TSearchFuncionarioAtivo.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
         SetFuncionario(
            Result.FieldByName( 'KCAD_ENTIDADE' ).asString,
            Result.FieldByName( 'NOME' ).asString
         ) ;

    finally
      free ;
    end ;
end ;

procedure TZoo_CfgTarefasForm._dbgListaEditButtonClick(Sender: TObject);
begin
   with TZoo_CfgTarefasDatamodule( DatamoduleBase ), _dbgLista do
       if ( SelectedField = cdsTarefasNOMEFUNCIONARIO ) then
         SearchFuncionario( InplaceEditor.Text ) ;
end;

procedure TZoo_CfgTarefasForm._dbgListaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TZoo_CfgTarefasDatamodule( DatamoduleBase ).cdsTarefas.Edit
end;

procedure TZoo_CfgTarefasForm._dbgListaShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin

  AllowEdit := True ;
//     (Field = TZoo_CfgTarefasDatamodule( DatamoduleBase ).cdsTarefasDESCARTECARNE)
// or  (Field = TZoo_CfgTarefasDatamodule( DatamoduleBase ).cdsTarefasDESCARTELEITE)

end;

procedure TZoo_CfgTarefasForm._edtSearchButtonClick(Sender: TObject);
begin
  Pesquisar ;
end;

procedure TZoo_CfgTarefasForm.ShowNewFastRegister(Sender: TObject);
begin
 //
end;


class procedure TZoo_CfgTarefasForm.ExecuteNewFastRegister;
var
  ThisForm: TZoo_CfgTarefasForm;
begin
  try
    ThisForm := TZoo_CfgTarefasForm.Create(nil);
    ThisForm.OnShow := ThisForm.ShowNewFastRegister;
    ThisForm._actNew.Execute ;// _ActionListExecute(ThisForm._actNew, Handled);
    ThisForm.ShowModal;
  finally
    FreeAndNil( ThisForm );
  end;

end;
initialization
  RegisterClass ( TZoo_CfgTarefasForm ) ;

end.
