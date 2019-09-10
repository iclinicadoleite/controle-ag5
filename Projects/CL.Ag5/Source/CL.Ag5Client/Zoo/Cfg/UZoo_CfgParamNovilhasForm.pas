unit UZoo_CfgParamNovilhasForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvExControls, JvXPCore,
  JvXPBar, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid,
  SysFormEditaLista, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.Mask, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls,
  JvDialogs, VCL.ImgList, VCL.Dialogs, System.ImageList,
  uImageListProvider, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_CfgParamNovilhasForm = class(T_FormEditaLista)
    edValor: TJvDBCalcEdit;
    JvSaveDialog1: TJvSaveDialog;
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: String): Boolean;
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure NoAct(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _ImprimirListaClick(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsZootecnico, UZoo_CfgParamNovilhasDatamodule ;

{$R *.dfm}

constructor TZoo_CfgParamNovilhasForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgParamNovilhasDatamodule.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

procedure TZoo_CfgParamNovilhasForm.edValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if ( Key = '-' ) or ( Key = '.' ) or ( Key = ',' )  then
    Key := #0 ;
end;

function TZoo_CfgParamNovilhasForm.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: String): Boolean;
begin
  inherited;

  with TZoo_CfgParamNovilhasDatamodule( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsEditATIVO )
             or  ( Field = cdsEditINTERNAL ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_CfgParamNovilhasForm.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_CfgParamNovilhasForm.NoAct(Sender: TObject);
begin
  inherited;
  _actNew.Enabled := False ;
  _actDelete.Enabled := False ;
  _actOther.Enabled := False ;
end;

procedure TZoo_CfgParamNovilhasForm._actEditExecute(Sender: TObject);
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

procedure TZoo_CfgParamNovilhasForm._actNewExecute(Sender: TObject);
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

procedure TZoo_CfgParamNovilhasForm._actSaveExecute(Sender: TObject);
begin
  inherited;
  _dbgLista.EditorMode := False ;
  edValor.Hide ;
  _dbgLista.SetFocus ;
end;

procedure TZoo_CfgParamNovilhasForm._ImprimirListaClick(Sender: TObject);
begin
  inherited;
//  TfqrSYS_PrintGrid.MakeReport( JvDBUltimGrid1, Caption );
end;

procedure TZoo_CfgParamNovilhasForm._actCancelExecute(Sender: TObject);
begin
  inherited;
  _dbgLista.EditorMode := False ;
  edValor.Hide ;
  _dbgLista.SetFocus ;
end;


initialization
   RegisterClass ( TZoo_CfgParamNovilhasForm )


end.
