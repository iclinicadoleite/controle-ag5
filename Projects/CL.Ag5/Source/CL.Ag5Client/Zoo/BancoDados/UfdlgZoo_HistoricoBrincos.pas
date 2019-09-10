unit UfdlgZoo_HistoricoBrincos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid,
  UdtmZoo_HistoricoBrincos, JvExExtCtrls, JvExtComponent, JvPanel,
  JvImage, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfdlgZoo_HistoricoBrincos = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsHistoricoBrincos: TDataSource;
  private
    { Private declarations }
    dtmZoo_HistoricoBrincos : TdtmZoo_HistoricoBrincos ;
    constructor Create ( AKAnimal : string ) ;
  public
    { Public declarations }
    class function Execute ( AKANIMAL : string  ) : boolean ;
  end;

implementation


{$R *.dfm}

{ TfrmCustomDialog }

constructor TfdlgZoo_HistoricoBrincos.Create ( AKAnimal : string ) ;
begin
   inherited Create ( nil ) ;
   dtmZoo_HistoricoBrincos := TdtmZoo_HistoricoBrincos.Create ( self ) ;
   dtmZoo_HistoricoBrincos.KAnimal := AKAnimal ;
   dtsHistoricoBrincos.DataSet := dtmZoo_HistoricoBrincos.cdsBrincos ;
end;

class function TfdlgZoo_HistoricoBrincos.Execute( AKANIMAL : string  ) : boolean;
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

end.

