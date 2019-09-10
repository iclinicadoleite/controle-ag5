unit UfrmSYS_CustomPesquisaFicha;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, TcExDBGrids, SysFormPesquisaFicha, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, VCL.Mask, JvExMask, JvToolEdit, VCL.ComCtrls,
  VCL.ToolWin, , TcDBGrid, VCL.ComCtrls, VCL.ToolWin,
  Data.DB, VCL.Menus, VCL.Mask, VCL.DBCtrls, JvExExtCtrls, JvNetscapeSplitter,
  JvDBDotNetControls, JvExMask, JvToolEdit,
  JvExControls, JvXPCore, JvXPContainer, JvXPBar,
  JvExStdCtrls, JvDBCombobox, JvDBControls, JvDBCheckBox,
  JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  JvErrorIndicator, JvComponentBase,  JvValidators,
  SysFormPesquisaFicha, ReportTypes, Wrappers ;

type
  TfrmCustomPesquisaFicha = class(T_FormPesquisaFicha)
    _JvXPContainer: TJvXPContainer;
    _JvXPBar0: TJvXPBar;
    _JvXPBar1: TJvXPBar;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses Searchs {, UdtmCAD_Entidades } ;

{$R *.dfm}

constructor TfrmCustomPesquisaFicha.Create(AOwner: TComponent);
begin
  inherited;

  // insira a criação do datamodule, ex:
  // TdtmCAD_Entidades.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

procedure TfrmCustomPesquisaFicha.Pesquisar;
//var
//   Key : integer ;
begin
  inherited ;

{   // crie a pesquisa conforme exemplo abaixo,
    // lembrando de definir a classe na unit Searchs :

  with TSearchEntidade.Create do
     begin
        TextToFind := _edtSearch.Text ;
        Execute ;
        Key := Result.FieldByName( 'KCAD_ENTIDADE' ).asInteger ;
        free ;
     end ;
  TdtmCAD_Entidades( DatamoduleBase ).SetParams( Key ) ;
  DatamoduleBase.ReOpenTables ;
}
end ;

end.
