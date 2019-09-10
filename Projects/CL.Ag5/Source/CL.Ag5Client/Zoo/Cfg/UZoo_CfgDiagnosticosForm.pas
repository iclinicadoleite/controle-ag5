unit UZoo_CfgDiagnosticosForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids,
  JvImage, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, JvExExtCtrls,
  SysFormEditaLista, ReportTypes, JvExtComponent, JvPanel, VCL.ImgList,
  System.Actions, System.ImageList, uImageListProvider,
  Tc.VCL.Application, Wrappers  ;

type
  TZoo_CfgDiagnosticosForm = class(T_FormEditaLista)
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure NoAct(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    class procedure ExecuteNewFastRegister;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SearchsZootecnico, UZoo_CfgDiagnosticosDatamodule ;

{$R *.dfm}

constructor TZoo_CfgDiagnosticosForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgDiagnosticosDatamodule.Create ( self ) ;

  dtsFicha.DataSet :=  TZoo_CfgDiagnosticosDatamodule( DataModuleBase ).cdsDiagnosticos;
  DatamoduleBase.OpenTables ;
end;

class procedure TZoo_CfgDiagnosticosForm.ExecuteNewFastRegister;
var
  ThisForm: TZoo_CfgDiagnosticosForm;
begin
  try
    ThisForm := TZoo_CfgDiagnosticosForm.Create( nil ) ;
    ThisForm._actNew.Execute ;
    ThisForm.ShowModal;
  finally
    FreeAndnil (ThisForm);
  end;
end;

function TZoo_CfgDiagnosticosForm.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;

//  with TZoo_CfgDiagnosticosDatamodule( DataModuleBase ) do
//     Result := Assigned ( Field )
//       and (     ( Field = cdsDiagnosticosATIVO ) ) ;

  with TZoo_CfgDiagnosticosDatamodule( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsDiagnosticosPOR_QUARTO )
             or  ( Field = cdsDiagnosticosPERMITE_EDICAO )
           ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TZoo_CfgDiagnosticosForm.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  with TZoo_CfgDiagnosticosDatamodule( DataModuleBase ) do
    AllowEdit := cdsDiagnosticosPERMITE_EDICAO.asBoolean
      and ( Field <> cdsDiagnosticosCODIGO)
      and ( Field <> cdsDiagnosticosPERMITE_EDICAO) ;
end;

procedure TZoo_CfgDiagnosticosForm.NoAct(Sender: TObject);
begin
  inherited;
//  _actNew.Enabled := False ;
//  _actEdit.Enabled := False ;
//  _actDelete.Enabled := False ;
  _actOther.Enabled := False ;
end;

procedure TZoo_CfgDiagnosticosForm._actEditExecute(Sender: TObject);
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

procedure TZoo_CfgDiagnosticosForm._actNewExecute(Sender: TObject);
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

initialization
  RegisterClass ( TZoo_CfgDiagnosticosForm ) ;

end.



