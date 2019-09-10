// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : DBControls - Forms
// Funcionality : Select Record, Edit record..
// License      : veja readme.txt


// License      : internal use


unit SysFormPesquisaFicha;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin,
  Data.DB, Tc.Data.DB.Helpers, VCL.Menus, VCL.Mask, VCL.DBCtrls, JvExExtCtrls,
  JvExMask, JvToolEdit, UdtmSYS_BASE, DBForm, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers  ;

type

  TFormLayout = ( flLayoutAba, flLayoutDual, flLayoutModal ) ;

  T_FormPesquisaFicha = class(T_DBForm)
    _ToolBar: TToolBar;
    _pnlFooter: TPanel;
    _btbCancel: TTcGDIButton;
    _btbSave: TTcGDIButton;
    _ToolButtonNew: TToolButton;
    _ToolButtonEdit: TToolButton;
    _ToolButtonDelete: TToolButton;
    _ToolButtonCancel: TToolButton;
    _ToolButtonSave: TToolButton;
    _pnlSearch: TPanel;
    _ToolButtonSeparator1: TToolButton;
    _ScrollBoxFicha: TScrollBox;
    _ToolButtonSeparator2: TToolButton;
    _ToolButtonPrint: TToolButton;
    _ToolButtonOther: TToolButton;
    _ToolButtonSeparator3: TToolButton;
    _actPrint: TAction;
    _actOther: TAction;
    _popMenuPrint: TPopupMenu;
    _ImprimirLista: TMenuItem;
    _pnlToolButtons: TPanel;
    _popMenuOther: TPopupMenu;
    _pnlFicha: TPanel;
    _AtualizarLista: TMenuItem;
    _actRefresh: TAction;
    _edtSearch: TJvComboEdit;
    _lblPesquisas: TLabel;
    _pnlToolBar: TPanel;
    procedure _actPrintExecute(Sender: TObject);
    procedure _actOtherExecute(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _edtSearchButtonClick(Sender: TObject);
    procedure _popMenuPrintPopup(Sender: TObject);
    procedure _popMenuOtherPopup(Sender: TObject);
  protected
    procedure ActiveFicha ; override ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SysPrintGridDialog ;

{$R *.dfm}

{ T_FormListaFicha }


procedure T_FormPesquisaFicha._actPrintExecute(Sender: TObject);
begin
  inherited;
  _ToolButtonPrint.CheckMenuDropdown ;
end;


procedure T_FormPesquisaFicha._actOtherExecute(Sender: TObject);
begin
  inherited;
  _ToolButtonOther.CheckMenuDropdown ;
end;

procedure T_FormPesquisaFicha._edtSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     TJvComboEdit ( Sender ).DoClick ;
end;

procedure T_FormPesquisaFicha._edtSearchButtonClick(Sender: TObject);
begin
  inherited;
  Pesquisar ;
end;


procedure T_FormPesquisaFicha._popMenuPrintPopup(Sender: TObject);
begin
  inherited;
  Save ;
end;

procedure T_FormPesquisaFicha._popMenuOtherPopup(Sender: TObject);
begin
  inherited;
  Save ;
end;

procedure T_FormPesquisaFicha.ActiveFicha;
begin
  inherited ActiveFicha ;
  _ScrollBoxFicha.VertScrollBar.Position := 0 ;
end;

initialization
 RegisterClass ( T_FormPesquisaFicha )

end.


