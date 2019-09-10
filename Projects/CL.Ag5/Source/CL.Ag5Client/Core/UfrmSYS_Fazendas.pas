unit UfrmSYS_Fazendas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, SysFormListaFicha, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExExtCtrls,  
  ReportTypes, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ImgList, JvImage,
  JvExtComponent, JvPanel, Wrappers ;

type
  TfrmCustomListaFicha = class(T_FormListaFicha)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
  public
    { Public declarations }
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SearchsEntidades {, UdtmCAD_Entidades } ;

{$R *.dfm}

procedure TfrmCustomListaFicha.FormCreate(Sender: TObject);
begin
  inherited;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:
  // TdtmCAD_Entidades.Create ( self ) ;

  DatamoduleBase.OpenTables ;
end;

procedure TfrmCustomListaFicha.Pesquisar;
begin
  inherited ;

{   // crie a pesquisa conforme exemplo abaixo,
    // lembrando de definir a classe na unit Searchs :

  with TdtmCAD_Entidades( DatamoduleBase ), TSearchEntidade.Create do
     begin
        TextToFind := _edtSearch.Text ;
        if Execute then
           cdsLstEntidades.Locate( 'KCAD_ENTIDADE',
                   Result.FieldByName( 'KCAD_ENTIDADE' ).asInteger, [] ) ;
        free ;
     end ;
}
end;

end.
