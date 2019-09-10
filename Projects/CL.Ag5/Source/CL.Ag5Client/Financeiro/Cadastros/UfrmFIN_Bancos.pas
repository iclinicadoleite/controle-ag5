unit UfrmFIN_Bancos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms, 
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin, Data.DB, Tc.Data.DB.Helpers, VCL.Menus,
  VCL.Mask, VCL.DBCtrls, JvExExtCtrls, JvDBDotNetControls, JvExMask, JvToolEdit, JvExControls,
  JvXPCore, JvXPContainer, JvXPBar, JvExStdCtrls, JvDBCombobox, JvDBControls, JvDBCheckBox,
  JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker, SysFormListaFicha, JvErrorIndicator,
  JvComponentBase, JvValidators, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvImage, JvExtComponent,
  JvPanel, VCL.ImgList, Tc.VCL.Controls.GDIButton, System.ImageList,
  System.Actions, Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmFIN_Bancos = class(T_FormListaFicha)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnImportaBancos: TTcGDIButton;
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class procedure NovoBanco;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsFinanceiro, UdtmFIN_Bancos;

{$R *.dfm}

constructor TfrmFIN_Bancos.Create(AOwner: TComponent);
begin
  inherited;

  //  defina o tipo de apresentacao do form
  //  caso nao definido, irá usar o default : flLayoutAba
  //  FormLayout := flLayoutAba ; // opcoes : flLayoutAba, flLayoutDual, flLayoutModal

  // insira a criação do datamodule, ex:
  TdtmFIN_Bancos.Create ( self ) ;
  DatamoduleBase.OpenTables ;
end;

class procedure TfrmFIN_Bancos.NovoBanco;
begin
  with Create ( nil ) do
    try
      BorderStyle       := bsDialog ;
      _tbsLista.Visible := False;
      _tbsFicha.Visible := True;
      _actNew.Execute;

      ShowModal ;
    finally
       Free ;
    end;
end;

procedure TfrmFIN_Bancos.Pesquisar;
var
   Key : integer ;
begin
  inherited ;
  with TdtmFIN_Bancos( DatamoduleBase ), TSearchBanco.Create do
    try
      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
           cdsLstBancos.Locate( 'KFIN_BANCO', Result.FieldByName( 'KFIN_BANCO' ).Value, [] ) ;
           ActiveFicha ;
        end ;
    finally
      free ;
    end ;
end;

function TfrmFIN_Bancos._dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field ) and ( Field.FieldName  = 'FEBRABAN' );
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

initialization
  RegisterClass ( TfrmFIN_Bancos ) ;

end.

