unit UZoo_ProducaoRecalculoLactacao;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormWizard, VCL.ActnList, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  Tc.VCL.Controls.GDIButton, VCL.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  VCL.StdCtrls, Tc.DBRTL.AbstractDB ;

type
  TfrmZoo_ProducaoRecalculoLactacao = class(T_FormWizard)
    TabSheet1: TTabSheet;
    Label3: TLabel;
    ProgressBar: TProgressBar;
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmZoo_ProducaoRecalculoLactacao._actExecuteExecute(Sender: TObject);
begin
  ProgressBar.visible := True ;
  Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias('ZOOTECNICO').ExecuteDirect('EXECUTE PROCEDURE ZOO_RECALC_LACTACAO_FAZENDAS');
  ProgressBar.visible := False ;
  ShowMessage ( 'Recalculo da lactação concluído.' ) ;
  inherited;

end;

Initialization
   RegisterClass ( TfrmZoo_ProducaoRecalculoLactacao ) ;

end.
