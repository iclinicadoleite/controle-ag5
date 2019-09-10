unit UFinQueryInclusaoReceitaDespesa;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, Exceptions,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Tc.VCL.Controls.GDIButton,
  searchsFinanceiro, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TFinQueryInclusaoReceitaDespesa = class(T_FormDialog)
    TcMPGDIButton1: TTcGDIButton;
    _btbExecute: TTcGDIButton;
    _btbNoExecute: TTcGDIButton;
    _btbHelp: TTcGDIButton;
    QueryLabel: TLabel;
    procedure _btbExecuteClick(Sender: TObject);
    procedure _btbNoExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FTipoAjusteSaldo : TTipoReceitaDespesa ;
  public
    { Public declarations }
    class function Execute : TTipoReceitaDespesa ;
  end;

implementation

uses CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

{ TfrmCustomDialog }

class function TFinQueryInclusaoReceitaDespesa.Execute : TTipoReceitaDespesa ;
begin
  with Create ( nil ) do
    try
       ShowModal ;
       result := FTipoAjusteSaldo ;
    finally
       free ;
    end;
end ;

procedure TFinQueryInclusaoReceitaDespesa._btbExecuteClick(Sender: TObject);
begin
  FTipoAjusteSaldo := toaReceita ;
  ModalResult := mrOk ;
end;

procedure TFinQueryInclusaoReceitaDespesa._btbNoExecuteClick(Sender: TObject);
begin
  FTipoAjusteSaldo := toaDespesa ;
  ModalResult := mrOk ;
end;

end.

