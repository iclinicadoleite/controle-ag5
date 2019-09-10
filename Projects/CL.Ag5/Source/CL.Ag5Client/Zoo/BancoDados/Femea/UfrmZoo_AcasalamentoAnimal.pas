unit UfrmZoo_AcasalamentoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers, UdtmZoo_AcasalamentoAnimal, VCL.StdCtrls,
  VCL.Mask, VCL.DBCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Form,Tc.VCL.Application, Wrappers ;

type
  TfrmZoo_AcasalamentoAnimal = class(TTcForm)
    dtsAcasalamento1: TDataSource;
    GroupBox4: TGroupBox;
    Button1: TTcGDIButton;
    Button2: TTcGDIButton;
    DBEdit26: TDBEdit;
    GroupBox5: TGroupBox;
    Button3: TTcGDIButton;
    Button4: TTcGDIButton;
    DBEdit29: TDBEdit;
    GroupBox6: TGroupBox;
    Button5: TTcGDIButton;
    Button6: TTcGDIButton;
    DBEdit45: TDBEdit;
    GroupBox7: TGroupBox;
    Button7: TTcGDIButton;
    Button8: TTcGDIButton;
    DBEdit46: TDBEdit;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsAcasalamento2: TDataSource;
    dtsAcasalamento3: TDataSource;
    dtsAcasalamento4: TDataSource;
    dtsListaMachos: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    edtQuickSearch: TJvDBSearchEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
  private
    { Private declarations }
    dtmZoo_AcasalamentoAnimal: TdtmZoo_AcasalamentoAnimal;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property MasterSource: TDataSource read FMasterSource write SetMasterSource;
  end;

implementation

{$R *.dfm}

procedure TfrmZoo_AcasalamentoAnimal.Button1Click(Sender: TObject);
begin
  dtmZoo_AcasalamentoAnimal.AddMacho(1);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button2Click(Sender: TObject);
begin
  if not dtmZoo_AcasalamentoAnimal.cdsAcasalamento1.Eof then
    dtmZoo_AcasalamentoAnimal.RemoveMacho(1);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button3Click(Sender: TObject);
begin
  dtmZoo_AcasalamentoAnimal.AddMacho(2);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button4Click(Sender: TObject);
begin
  if not dtmZoo_AcasalamentoAnimal.cdsAcasalamento2.Eof then
    dtmZoo_AcasalamentoAnimal.RemoveMacho(2);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button5Click(Sender: TObject);
begin
  dtmZoo_AcasalamentoAnimal.AddMacho(3);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button6Click(Sender: TObject);
begin
  if not dtmZoo_AcasalamentoAnimal.cdsAcasalamento3.Eof then
    dtmZoo_AcasalamentoAnimal.RemoveMacho(3);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button7Click(Sender: TObject);
begin
  dtmZoo_AcasalamentoAnimal.AddMacho(4);
end;

procedure TfrmZoo_AcasalamentoAnimal.Button8Click(Sender: TObject);
begin
  if not dtmZoo_AcasalamentoAnimal.cdsAcasalamento4.Eof then
    dtmZoo_AcasalamentoAnimal.RemoveMacho(4);
end;

constructor TfrmZoo_AcasalamentoAnimal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  dtmZoo_AcasalamentoAnimal := TdtmZoo_AcasalamentoAnimal.Create(self);
  // dtsAcasalamento.DataSet := dtmZoo_AcasalamentoAnimal.cdsAcasalamento ;
end;

procedure TfrmZoo_AcasalamentoAnimal.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TfrmZoo_AcasalamentoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_AcasalamentoAnimal.MasterSource := FMasterSource;
  dtmZoo_AcasalamentoAnimal.OpenTables;
end;

end.
