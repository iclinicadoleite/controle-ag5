unit UZoo_CfgParametrosFazendaWizard;

// 23-10 - Alteração na descrição da flag ( DBCheckBox2 ) solicitada por Rafael Marsola.
// alteração realizada por Caique Rodrigues

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  VCL.DBCtrls, VCL.Mask, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls,
  UZoo_CfgParametrosFazendaDatamodule,
  Tc.VCL.FormIntf,
  Tc.VCL.Application,
  Data.DB, Tc.Data.DB.Helpers, Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Wrappers  ;

type
  TZoo_CfgParametrosFazendaWizard = class(T_FormWizard, ITcQuerySaveChanges)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    Label4: TLabel;
    Label5: TLabel;
    JvDBCalcEdit3: TJvDBCalcEdit;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    dtsParametrosFazenda: TDataSource;
    Label7: TLabel;
    JvDBCalcEdit4: TJvDBCalcEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    JvDBCalcEdit5: TJvDBCalcEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    JvDBCalcEdit6: TJvDBCalcEdit;
    dbckConsiderarNaoPrenheSemDiagnostico: TDBCheckBox;
    dbckConsiderarNaoPrenheDescartado: TDBCheckBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    Zoo_CfgParametrosFazendaDatamodule : TZoo_CfgParametrosFazendaDatamodule ;
    function QuerySaveChanges : TQuerySaveCancelOption ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses SysQueryProcessIgnoreCancel ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_CfgParametrosFazendaWizard.Create(AOwner: TComponent);
begin
  inherited;
  Zoo_CfgParametrosFazendaDatamodule := TZoo_CfgParametrosFazendaDatamodule.Create ( self ) ;
  dtsParametrosFazenda.DataSet  := Zoo_CfgParametrosFazendaDatamodule.cdsParametrosFazenda ;
  Zoo_CfgParametrosFazendaDatamodule.OpenTables ;

  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TZoo_CfgParametrosFazendaWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_CfgParametrosFazendaWizard.Execute : boolean;
var
  ThisForm: TZoo_CfgParametrosFazendaWizard;
begin
  ThisForm := TZoo_CfgParametrosFazendaWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

function TZoo_CfgParametrosFazendaWizard.QuerySaveChanges: TQuerySaveCancelOption;
begin
  if self._actExecute.Enabled then
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

procedure TZoo_CfgParametrosFazendaWizard._actCancelExecute(Sender: TObject);
begin
  Zoo_CfgParametrosFazendaDatamodule.CancelUpdates ;
  inherited;

end;

procedure TZoo_CfgParametrosFazendaWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_CfgParametrosFazendaDatamodule.ApplyUpdates ;
  MessageDlg ( Caption + ' salvo com sucesso' ) ;
  TCLAg5NSMsgParamsChanged.CreateAndDispatch ( self ) ;
  //NotificationService.NotifyStr( self, 'PROCESS_TZoo_CfgParametrosFazendaWizard' );
  inherited;

end;

procedure TZoo_CfgParametrosFazendaWizard._ActionListUpdate(
  Action: TBasicAction; var Handled: Boolean);
begin

  inherited;
  try
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and
         ( Zoo_CfgParametrosFazendaDatamodule.cdsParametrosFazenda.State in [ dsInsert, dsEdit] )
      or ( Zoo_CfgParametrosFazendaDatamodule.cdsParametrosFazenda.ChangeCount > 0 ) ;
  _actCancel.Enabled := _actExecute.Enabled ;
  except
  end;

end;

procedure TZoo_CfgParametrosFazendaWizard._actNextExecute(Sender: TObject);
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

procedure TZoo_CfgParametrosFazendaWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_CfgParametrosFazendaWizard ) ;

end.
