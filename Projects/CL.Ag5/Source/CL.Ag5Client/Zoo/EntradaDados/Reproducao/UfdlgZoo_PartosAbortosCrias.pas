unit UfdlgZoo_PartosAbortosCrias;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, DBCGrids, UZoo_ReproducaoPartosAbortosDatamodule, JvExStdCtrls,
  JvCombobox,JvDBCombobox, JvExMask, JvToolEdit, JvDBControls, Data.DB, Tc.Data.DB.Helpers, VCL.Mask,
  VCL.DBCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvDBCheckBox,
  JvExControls, JvDBLookup, JvBaseEdits, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TfdlgZoo_PartosAbortosCrias = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    DBCtrlGrid1: TDBCtrlGrid;
    dtsLinhagem: TDataSource;
    DBCheckBox1: TJvDBCheckBox;
    DBEdit2: TDBEdit;
    pnlOpts: TPanel;
    BitBtn1:  TBitBtn;
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
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBLookupComboBox2: TJvDBLookupCombo;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    Shape1: TShape;
    Label2: TLabel;
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
    Zoo_ReproducaoPartosAbortosDatamodule : TZoo_ReproducaoPartosAbortosDatamodule ;
  public
    { Public declarations }
    class function Execute ( AZoo_ReproducaoPartosAbortosDatamodule : TZoo_ReproducaoPartosAbortosDatamodule ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }


procedure TfdlgZoo_PartosAbortosCrias.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.Append ;
end;

procedure TfdlgZoo_PartosAbortosCrias.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.IsEmpty then
    Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.Delete ;
end;


procedure TfdlgZoo_PartosAbortosCrias.DBCtrlGrid1Enter(Sender: TObject);
begin
  inherited;
  DBCheckBox1.SetFocus ;
end;

procedure TfdlgZoo_PartosAbortosCrias.DBCtrlGrid1PaintPanel( DBCtrlGrid: TDBCtrlGrid; Index: Integer );
begin

    DBCtrlGrid1.Canvas.Lock;

//    Panel1.Visible := not Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagemNatimorto.asBoolean  ;
//    Panel1.Color   := TDBCtrlPanel( dbctrlgrid1.Controls [ 0 ] ).Brush.Color ;

    if index = dbctrlgrid1.PanelIndex then
       pnlOpts.Top:= 22 + DBCheckBox1.Top + dbctrlgrid1.Top+dbctrlgrid1.PanelIndex*dbctrlgrid1.PanelHeight ;
//       pnlOpts.Top:= 53 + DBCheckBox1.Top + dbctrlgrid1.Top+dbctrlgrid1.PanelIndex*dbctrlgrid1.PanelHeight ;

    DBCtrlGrid1.Canvas.Unlock;

end;

procedure TfdlgZoo_PartosAbortosCrias.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  Zoo_ReproducaoPartosAbortosDatamodule.UpdateRacasGrauSangue ;
  if Zoo_ReproducaoPartosAbortosDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_ReproducaoPartosAbortosDatamodule.SetComposicaoRacas ;
end;

procedure TfdlgZoo_PartosAbortosCrias.dbEdtComposicaoRacaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_ReproducaoPartosAbortosDatamodule.UpdateRacasGrauSangue ;
    if Zoo_ReproducaoPartosAbortosDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_ReproducaoPartosAbortosDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TfdlgZoo_PartosAbortosCrias.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

class function TfdlgZoo_PartosAbortosCrias.Execute ( AZoo_ReproducaoPartosAbortosDatamodule : TZoo_ReproducaoPartosAbortosDatamodule ) : boolean ;
var
  SavePoint : integer ;
begin

  with TfdlgZoo_PartosAbortosCrias.Create ( nil ) do
  try
      Zoo_ReproducaoPartosAbortosDatamodule :=  AZoo_ReproducaoPartosAbortosDatamodule ;
      SavePoint := Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.SavePoint ;

      Zoo_ReproducaoPartosAbortosDatamodule.GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

      if Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.IsEmpty then
         Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.Append ;

      ModalResult := ShowModal ;
      Result  := ( ModalResult = mrOK ) ;

      if not Result then
         Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.SavePoint := SavePoint ;
  finally
     free ;
  end ;
end ;

procedure TfdlgZoo_PartosAbortosCrias._btbSaveClick(Sender: TObject);
begin
  Zoo_ReproducaoPartosAbortosDatamodule.PostCria ;

  if Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem.IsEmpty then
    modalResult := mrCancel
  else
    modalResult := mrOk ;
end;

end.

