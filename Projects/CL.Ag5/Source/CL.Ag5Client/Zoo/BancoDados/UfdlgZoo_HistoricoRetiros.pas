unit UfdlgZoo_HistoricoRetiros;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UdtmZoo_HistoricoRetiros, JvExExtCtrls,
  JvExtComponent, JvPanel, JvImage, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfdlgZoo_HistoricoRetiros = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsHistoricoRetiros: TDataSource;
  private
    { Private declarations }
    dtmZoo_HistoricoRetiros : TdtmZoo_HistoricoRetiros ;
    constructor Create ( AKAnimal : string ) ;
  public
    { Public declarations }
    class function Execute ( KANIMAL : string  ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

constructor TfdlgZoo_HistoricoRetiros.Create(AKAnimal: string);
begin
   inherited Create ( nil ) ;
   dtmZoo_HistoricoRetiros := TdtmZoo_HistoricoRetiros.Create ( self ) ;
   dtmZoo_HistoricoRetiros.KAnimal := AKAnimal ;
   dtsHistoricoRetiros.DataSet := dtmZoo_HistoricoRetiros.cdsRetiros ;
end;

class function TfdlgZoo_HistoricoRetiros.Execute( KANIMAL : string  ) : boolean;
begin
  with Create ( KANIMAL ) do
    try
       Result  := ( ShowModal = mrOK ) ;
       if Result then
          {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end ;

end.

