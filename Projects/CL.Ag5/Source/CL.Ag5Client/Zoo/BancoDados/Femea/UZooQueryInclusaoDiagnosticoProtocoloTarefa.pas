unit UZooQueryInclusaoDiagnosticoProtocoloTarefa;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, VCL.StdCtrls, VCL.Buttons, VCL.ActnList, JvExExtCtrls, JvImage,
  VCL.ExtCtrls, JvExtComponent, JvPanel,
  Tc.VCL.FormIntf, Tc.VCL.Controls.GDIButton, Wrappers, System.Actions,
  Tc.VCL.Application ;

type
  TTipoOcorrenciaAnimal = ( toaCancel, toaDiagnostico, toaProtocolo ) ;

  TZooQueryInclusaoDiagnosticoProtocoloTarefa = class(T_FormDialog)
    _btbHelp: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    _btbExecute: TTcGDIButton;
    _btbNoExecute: TTcGDIButton;
    QueryLabel: TLabel;
    procedure _btbExecuteClick(Sender: TObject);
    procedure _btbNoExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FTipoOcorrenciaAnimal : TTipoOcorrenciaAnimal ;
  public
    { Public declarations }
    class function Execute  : TTipoOcorrenciaAnimal ;
  end;

implementation

{$R *.dfm}

{ TZooQueryInclusaoDiagnosticoProtocoloTarefa }

class function TZooQueryInclusaoDiagnosticoProtocoloTarefa.Execute : TTipoOcorrenciaAnimal ;
begin
    with Create ( nil ) do
      try
         ShowModal ;
         result := FTipoOcorrenciaAnimal ;
      finally
         free ;
      end;
end;

procedure TZooQueryInclusaoDiagnosticoProtocoloTarefa._btbExecuteClick(
  Sender: TObject);
begin
  FTipoOcorrenciaAnimal := toaDiagnostico ;
  ModalResult := mrOk ;
end;

procedure TZooQueryInclusaoDiagnosticoProtocoloTarefa._btbNoExecuteClick(
  Sender: TObject);
begin
  FTipoOcorrenciaAnimal := toaProtocolo ;
  ModalResult := mrOk ;
end;

end.
