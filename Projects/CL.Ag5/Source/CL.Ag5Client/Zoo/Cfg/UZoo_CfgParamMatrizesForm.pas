unit UZoo_CfgParamMatrizesForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvExControls, JvXPCore,
  JvXPBar, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid,
  SysFormEditaLista, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.Mask, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls,
  JvMenus, VCL.ImgList, System.ImageList, System.Actions,
  uImageListProvider, Tc.VCL.Application, Wrappers ;

type
  TZoo_CfgParamMatrizesForm = class(T_FormEditaLista)
    edValorPrimipara: TJvDBCalcEdit;
    edValorMultipara: TJvDBCalcEdit;
    JvPopupMenu1: TJvPopupMenu;
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: String): Boolean;
    procedure edValorPrimiparaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure NoAct(Sender: TObject);
    procedure JvPopupMenu1MeasureItem(Sender: TMenu; Item: TMenuItem; var Width,
      Height: Integer);
    procedure _actEditExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _ImprimirListaClick(Sender: TObject);
  private
    { Private declarations }
    procedure EQAPadraoClick(Sender: TObject);
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsZootecnico, ClAg5Types, UZoo_CfgParamMatrizesDatamodule ;

{$R *.dfm}

constructor TZoo_CfgParamMatrizesForm.Create(AOwner: TComponent);
var
 mi : TMenuItem ;
begin
  inherited;

  TZoo_CfgParamMatrizesDatamodule.Create ( self ) ;
  DatamoduleBase.OpenTables ;
  with TZoo_CfgParamMatrizesDatamodule ( DatamoduleBase ), cdsEQAPadrao do
     begin
       while not eof  do
         begin
           mi := TMenuItem.Create( JvPopUpMenu1 ) ;
           mi.Caption := cdsEQAPADRAODESCRICAO.asString ;
           mi.onclick := EQAPadraoClick ;
           JvPopUpMenu1.Items.Add( mi ) ;
           next ;
         end ;
     end ;
end;

procedure TZoo_CfgParamMatrizesForm.edValorPrimiparaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if ( Key = '-' ) or ( Key = '.' ) or ( Key = ',' )  then
    Key := #0 ;
end;


function TZoo_CfgParamMatrizesForm.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: String): Boolean;
begin
  inherited;

  with TZoo_CfgParamMatrizesDatamodule( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsEditATIVO )
             or  ( Field = cdsEditINTERNAL ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_CfgParamMatrizesForm.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

  if ( AllowEdit and (TZoo_CfgParamMatrizesDatamodule( DataModuleBase ).cdsEditSYS_VALUE.asString = _ST_PARAM_MATRIZES_EQA_REBANHO )) then
    begin
      AllowEdit := False ;

  //    JvDBUltimGrid1.Columns[ JvDBUltimGrid1.SelectedIndex ]
      with _dbgLista, ClientToScreen( CellRect( _dbgLista.Col + 1, _dbgLista.Row ).TopLeft ) do
         JvPopupMenu1.Popup( X, Y );
    end;

end;

procedure TZoo_CfgParamMatrizesForm.JvPopupMenu1MeasureItem(Sender: TMenu;
  Item: TMenuItem; var Width, Height: Integer);
begin
  inherited;
  Width := _dbgLista.Columns [ _dbgLista.Col ].Width ;
end;

procedure TZoo_CfgParamMatrizesForm.EQAPadraoClick(Sender: TObject);
   function CaptionToValue : double ;
   begin
     Result := StrToInt (
                          StringReplace (
                                          StringReplace ( TMenuItem ( Sender ).Caption,
                                                          '&', '', [rfReplaceAll]
                                                        ),
                                           '.', '', [rfReplaceAll]
                                        )
                        ) ;
   end;
begin
  TZoo_CfgParamMatrizesDatamodule( DataModuleBase ).SetValor ( CaptionToValue )
end;

procedure TZoo_CfgParamMatrizesForm.NoAct(Sender: TObject);
begin
  inherited;
  _actNew.Enabled := False ;
  _actDelete.Enabled := False ;
  _actOther.Enabled := False ;
end;


procedure TZoo_CfgParamMatrizesForm._actEditExecute(Sender: TObject);
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

procedure TZoo_CfgParamMatrizesForm._actSaveExecute(Sender: TObject);
begin
  inherited;
  _dbgLista.EditorMode := False ;
  edValorPrimipara.Hide ;
  edValorMultipara.Hide ;
  _dbgLista.SetFocus ;
end;

procedure TZoo_CfgParamMatrizesForm._ImprimirListaClick(Sender: TObject);
begin
  inherited;
//  TfqrSYS_PrintGrid.MakeReport( JvDBUltimGrid1, Caption );
end;

procedure TZoo_CfgParamMatrizesForm._actCancelExecute(Sender: TObject);
begin
  inherited;
  _dbgLista.EditorMode := False ;
  edValorPrimipara.Hide ;
  edValorMultipara.Hide ;
  _dbgLista.SetFocus ;
end;


initialization
   RegisterClass ( TZoo_CfgParamMatrizesForm )

end.



