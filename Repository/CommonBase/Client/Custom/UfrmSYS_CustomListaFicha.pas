unit UfrmSYS_CustomListaFicha;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, Wrappers, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, Vcl.ImgList, System.Actions, System.ImageList ;

type
  TfrmCustomListaFicha = class(T_FormListaFicha)
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

uses Searchs {, UdtmCAD_Entidades } ;

{$R *.dfm}

constructor TfrmCustomListaFicha.Create(AOwner: TComponent);
begin
  inherited;

  // TdtmCAD_Entidades.Create ( self ) ;

  DatamoduleBase.OpenTables ;
end;

procedure TfrmCustomListaFicha.Pesquisar;
begin
  inherited ;

{
  with TdtmCAD_Entidades( DatamoduleBase ), TSearchEntidade.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsList.Locate( 'KCAD_ENTIDADE',
                     Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
}
end;

end.
