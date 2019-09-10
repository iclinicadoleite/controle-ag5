unit UFIN_FluxoCaixaRealizadoWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormWizard, VCL.ActnList, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  Tc.VCL.Controls.GDIButton, VCL.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  UFIN_FluxoCaixaRealizadoDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TFIN_FluxoCaixaRealizadoWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgResultado: TJvDBUltimGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

//  dbgResultado.ShowHighlighter := True ;

initialization
   RegisterClass ( TFIN_FluxoCaixaRealizadoWizard ) ;

end.
