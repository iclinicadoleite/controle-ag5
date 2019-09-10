unit UfdlgZoo_CadastroCrias;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, DBCGrids, UZoo_BancoDadosFemeaEventosReprodutivosDatamodule, JvExStdCtrls,
  JvCombobox, JvDBCombobox, JvExMask, JvToolEdit, JvDBControls, Data.DB, Tc.Data.DB.Helpers, VCL.Mask,
  VCL.DBCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvDBCheckBox,
  JvExControls, JvDBLookup, JvBaseEdits, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TfdlgZoo_CadastroCrias = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    DBCtrlGrid1: TDBCtrlGrid;
    dtsLinhagem: TDataSource;
    DBCheckBox1: TJvDBCheckBox;
    DBEdit2: TDBEdit;
    pnlOpts: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    JvDBComboBox1: TJvDBComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    edPeso: TJvDBCalcEdit;
    edAltura: TJvDBCalcEdit;
    DBEdit11: TDBEdit;
    DBEdit9: TDBEdit;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    DBLookupComboBox2: TJvDBLookupCombo;
    dbxGrauSangue: TDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBCtrlGrid1Enter(Sender: TObject);
    procedure _btbSaveClick(Sender: TObject);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FZoo_BancoDadosFemeaEventosReprodutivosDatamodule : TZoo_BancoDadosFemeaEventosReprodutivosDatamodule ;
  public
    { Public declarations }
    class function Execute ( AZoo_BancoDadosFemeaEventosReprodutivosDatamodule : TZoo_BancoDadosFemeaEventosReprodutivosDatamodule ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

procedure TfdlgZoo_CadastroCrias.BitBtn1Click(Sender: TObject);
begin
  inherited;
  FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.Append ;
end;

procedure TfdlgZoo_CadastroCrias.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.IsEmpty then
    FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.Delete ;
end;

procedure TfdlgZoo_CadastroCrias.DBCtrlGrid1Enter(Sender: TObject);
begin
  inherited;
  if DBCheckBox1.Showing then
    DBCheckBox1.SetFocus ;
end;

procedure TfdlgZoo_CadastroCrias.DBCtrlGrid1PaintPanel( DBCtrlGrid: TDBCtrlGrid; Index: Integer );
begin

    DBCtrlGrid1.Canvas.Lock;

//    Panel1.Visible := not Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemNatimorto.asBoolean  ;
//    Panel1.Color   := TDBCtrlPanel( dbctrlgrid1.Controls [ 0 ] ).Brush.Color ;

    if index = dbctrlgrid1.PanelIndex then
       pnlOpts.Top:= 22 + DBCheckBox1.Top + dbctrlgrid1.Top+dbctrlgrid1.PanelIndex*dbctrlgrid1.PanelHeight ;
      // pnlOpts.Top:= 20 + DBCheckBox1.Top + dbctrlgrid1.Top+dbctrlgrid1.PanelIndex*dbctrlgrid1.PanelHeight ;
//       pnlOpts.Top:= 53 + DBCheckBox1.Top + dbctrlgrid1.Top+dbctrlgrid1.PanelIndex*dbctrlgrid1.PanelHeight ;

    DBCtrlGrid1.Canvas.Unlock;

end;

procedure TfdlgZoo_CadastroCrias.dbEdtComposicaoRacaButtonClick(Sender: TObject);
begin
  FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.UpdateRacasGrauSangue ;
  if FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetComposicaoRacas ;
end;

procedure TfdlgZoo_CadastroCrias.dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.UpdateRacasGrauSangue ;
    if FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TfdlgZoo_CadastroCrias.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

class function TfdlgZoo_CadastroCrias.Execute ( AZoo_BancoDadosFemeaEventosReprodutivosDatamodule : TZoo_BancoDadosFemeaEventosReprodutivosDatamodule ) : boolean ;
var
  SavePoint : integer ;
begin

  with TfdlgZoo_CadastroCrias.Create ( nil ) do
    try


      FZoo_BancoDadosFemeaEventosReprodutivosDatamodule :=  AZoo_BancoDadosFemeaEventosReprodutivosDatamodule ;
      FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;
      SavePoint := FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos.SavePoint ;
      if FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.IsEmpty then
         FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.Append ;

      ModalResult := ShowModal ;
      Result  := ( ModalResult = mrOK ) ;

      if not Result then
         FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos.SavePoint  := SavePoint ;
    finally
      free ;
    end ;
end ;

procedure TfdlgZoo_CadastroCrias._btbSaveClick(Sender: TObject);
begin
//  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.PostCria ;

  if FZoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsLinhagem.IsEmpty then
    modalResult := mrCancel
  else
    modalResult := mrOk ;
end;

end.


