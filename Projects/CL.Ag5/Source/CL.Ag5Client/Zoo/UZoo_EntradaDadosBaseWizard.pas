unit UZoo_EntradaDadosBaseWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.FormIntf, Tc.VCL.Application, Tc.VCL.Controls.GDIButton,
  System.Actions, Wrappers ;

type
  TZoo_EntradaDadosBaseWizard = class(T_FormWizard, ITcQuerySaveChanges)
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  protected
    FMessageProcessed: string;
    procedure SetMessageProcessed(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
    function QuerySaveChanges : TQuerySaveCancelOption ;
//    procedure ProcessSuccessInfo ; virtual ;

  public
    { Public declarations }
    property MessageProcessed  : string  read FMessageProcessed write SetMessageProcessed;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;


implementation

{$R *.dfm}

uses SysQueryProcessIgnoreCancel ;

{ TZoo_EntradaDadosBaseWizard }

constructor TZoo_EntradaDadosBaseWizard.Create(AOwner: TComponent);
begin
  inherited;
  FMessageProcessed := 'processado com sucesso'
end;

//procedure TZoo_EntradaDadosBaseWizard.ProcessSuccessInfo;
//begin
//   MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
//   NotificationService.NotifyStr( self, 'PROCESS_' + ClassName );
//end;

function TZoo_EntradaDadosBaseWizard.QuerySaveChanges: TQuerySaveCancelOption;
begin
  if self._btbExecute.Visible and self._actExecute.Enabled then
    begin
     Result := qscCancel ;
     Case TQueryProcessIgnoreCancel.Execute( Caption ) of
       qscSave :
         begin
           self._actExecute.Execute ;
           Result := qscIgnore ;
         end;
       qscIgnore : Result := qscIgnore ;
     End ;
    end
  else
    Result := qscIgnore ;
end;

procedure TZoo_EntradaDadosBaseWizard.SetMessageProcessed(const Value: string);
begin
  FMessageProcessed := Value;
end;

procedure TZoo_EntradaDadosBaseWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TZoo_EntradaDadosBaseWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TZoo_EntradaDadosBaseWizard ) ;

end.
