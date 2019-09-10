unit UfdlgZoo_HistoricoStatus;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UdtmZoo_HistoricoStatus, JvExExtCtrls,
  JvExtComponent, JvPanel, JvImage, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfdlgZoo_HistoricoStatus = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsHistoricoStatus: TDataSource;
  private
    { Private declarations }
    dtmZoo_HistoricoStatus : TdtmZoo_HistoricoStatus ;
    constructor Create ( AKAnimal : string ) ;
  public
    { Public declarations }
    class function Execute ( AKANIMAL : string  ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

constructor TfdlgZoo_HistoricoStatus.Create ( AKAnimal : string ) ;
begin
   inherited Create ( nil ) ;
   dtmZoo_HistoricoStatus := TdtmZoo_HistoricoStatus.Create ( self ) ;
   dtmZoo_HistoricoStatus.KAnimal := AKAnimal ;
   dtsHistoricoStatus.DataSet := dtmZoo_HistoricoStatus.cdsStatus ;
end;

class function TfdlgZoo_HistoricoStatus.Execute( AKANIMAL : string  ) : boolean;
begin
  with Create ( AKANIMAL ) do
    try
       Result  := ( ShowModal = mrOK ) ;
       if Result then
         {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end ;

initialization
  RegisterClass ( TfdlgZoo_HistoricoStatus ) ;

end.

