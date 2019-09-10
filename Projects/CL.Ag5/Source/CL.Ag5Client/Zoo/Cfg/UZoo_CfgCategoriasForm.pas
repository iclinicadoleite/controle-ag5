unit UZoo_CfgCategoriasForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvExControls, JvXPCore,
  JvXPBar, JvDBUltimGrid, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin,
  JvExDBGrids, JvDBGrid,
  SysFormEditaLista, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.Mask, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls,
  VCL.ImgList, System.ImageList, uImageListProvider, System.Actions,
  Tc.VCL.Application, Wrappers ;

type
  TZoo_CfgCategoriasForm = class(T_FormEditaLista)
    _pnlSearch: TPanel;
    edIdadeInferior: TJvDBCalcEdit;
    edIdadeSuperior: TJvDBCalcEdit;
    edDELInferiror: TJvDBCalcEdit;
    edDELSuperior: TJvDBCalcEdit;
    edNLInferior: TJvDBCalcEdit;
    edNLSuperior: TJvDBCalcEdit;
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: String): Boolean;
    procedure edIdadeInferiorKeyPress(Sender: TObject; var Key: Char);
    procedure NoAct(Sender: TObject);
    procedure _ImprimirListaClick(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
    procedure edIdadeInferiorExit(Sender: TObject);
    procedure edNLSuperiorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsZootecnico, UZoo_CfgCategoriasDatamodule ;

{$R *.dfm}

constructor TZoo_CfgCategoriasForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgCategoriasDatamodule.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

procedure TZoo_CfgCategoriasForm.edIdadeInferiorExit(Sender: TObject);
begin
  if edIdadeInferior.Value = 0 then
     ShowMessage ( 'Serão considerados nesta categoria, animais recém paridos'#13#10#13#10) ;
end;

procedure TZoo_CfgCategoriasForm.edIdadeInferiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = '-' ) or ( Key = '.' ) or ( Key = ',' )  then
    Key := #0 ;

end;

procedure TZoo_CfgCategoriasForm.edNLSuperiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = '-' ) or ( Key = '.' ) or ( Key = ',' )  then
    Key := #0 ;
end;

function TZoo_CfgCategoriasForm.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: String): Boolean;
begin
  inherited;
  with TZoo_CfgCategoriasDatamodule( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsCategoriasATIVO )
             or  ( Field = cdsCategoriasINTERNAL ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_CfgCategoriasForm.NoAct(Sender: TObject);
begin
  inherited;
   _actOther.Enabled := False ;
end;

procedure TZoo_CfgCategoriasForm._actDeleteExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TZoo_CfgCategoriasForm._ImprimirListaClick(Sender: TObject);
begin
  inherited;
//  TfqrSYS_PrintGrid.MakeReport( JvDBUltimGrid1, Caption );
end;

initialization
  RegisterClass ( TZoo_CfgCategoriasForm ) ;

end.
