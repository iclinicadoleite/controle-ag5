unit UfdlgZoo_HistoricoToques;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  System.Actions, Tc.VCL.Application, Tc.VCL.Controls.GDIButton, Data.DB, Tc.Data.DB.Helpers,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, UdtmZoo_HistoricoToques, Wrappers ;

type
  TfdlgZoo_HistoricoToques = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dsHistoricoToques: TDataSource;
    procedure TcFormCreate(Sender: TObject);
   { _btbSave: TTcMPGDIButton;
    _btbCancel: TTcMPGDIButton;}
  private
    { Private declarations }
    dtmZoo_HistoricoToques: TdtmZoo_HistoricoToques;
  public
    { Public declarations }
    class function Execute (KZOO_ANIMAL_FEMEA : String) : boolean ;
  end;

implementation


{$R *.dfm}

{ TfrmCustomDialog }

class function TfdlgZoo_HistoricoToques.Execute( KZOO_ANIMAL_FEMEA : String ): boolean;
var
  ThisForm: TfdlgZoo_HistoricoToques;
  ModalResult : integer ;
begin
  ThisForm := TfdlgZoo_HistoricoToques.Create ( nil ) ;
  try
      ThisForm.dtmZoo_HistoricoToques.KZooAnimalFemea :=  KZOO_ANIMAL_FEMEA;
      ThisForm.dtmZoo_HistoricoToques.OpenTables;
      ThisForm.dsHistoricoToques.DataSet := ThisForm.dtmZoo_HistoricoToques.cdsHistoricoToques;
      ModalResult := ThisForm.ShowModal ;
      Result  := ( ModalResult = mrOK ) ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

procedure TfdlgZoo_HistoricoToques.TcFormCreate(Sender: TObject);
begin
  inherited;
  Self.dtmZoo_HistoricoToques := TdtmZoo_HistoricoToques.Create( Self );

end;

end.

