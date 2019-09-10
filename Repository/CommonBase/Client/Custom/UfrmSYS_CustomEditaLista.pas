unit UfrmSYS_CustomEditaLista;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids,
  JvImage, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Menus, Data.DB, VCL.ComCtrls, VCL.ToolWin, JvExExtCtrls,
  SysFormEditaLista, ReportTypes,Wrappers, JvExtComponent, JvPanel  ;

type
  TfrmCustomEditaLista = class(T_FormEditaLista)
    JvDBUltimGrid1: TJvDBUltimGrid;
    _pnlSearch: TPanel;
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses Searchs {, UdtmCAD_Entidades } ;

{$R *.dfm}

constructor TfrmCustomEditaLista.Create(AOwner: TComponent);
begin
  inherited;

  // insira a criação do datamodule, ex:
  // TdtmCAD_Entidades.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

end.
