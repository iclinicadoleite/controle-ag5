unit UfdlgZoo_HistoricoLotes;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, Exceptions, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid,
  UdtmZoo_HistoricoLotes, JvExExtCtrls, JvExtComponent, JvPanel,
  JvImage, Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfdlgZoo_HistoricoLotes = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsHistoricoLotes: TDataSource;
  private
    { Private declarations }
    dtmZoo_HistoricoLotes : TdtmZoo_HistoricoLotes ;
    constructor Create ( AKAnimal : string ) ;
  public
    { Public declarations }
    class function Execute ( KANIMAL : string  ) : boolean ;
  end;

implementation

{$R *.dfm}

{ TfrmCustomDialog }

constructor TfdlgZoo_HistoricoLotes.Create(AKAnimal: string);
begin
   inherited Create ( nil ) ;
   dtmZoo_HistoricoLotes := TdtmZoo_HistoricoLotes.Create ( self ) ;
   dtmZoo_HistoricoLotes.KAnimal := AKAnimal ;
   dtsHistoricoLotes.DataSet := dtmZoo_HistoricoLotes.cdsLotes ;
end;

class function TfdlgZoo_HistoricoLotes.Execute( KANIMAL : string  ) : boolean;
begin
  with Create ( KANIMAL ) do
    try
        ModalResult := ShowModal ;
        Result  := ( ModalResult = mrOK ) ;
        if Result then
          {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end ;

end.

