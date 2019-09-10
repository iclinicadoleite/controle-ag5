unit UZoo_ConfigurarImpressaoAutomatica;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, JvExMask, JvSpin, VCL.Mask,
  Tc.VCL.Dialogs,
  UReportServerConfig,
  JvComponentBase, JvChangeNotify, System.Actions, Wrappers, Tc.VCL.Application ;

type
  TZoo_ConfigurarImpressaoAutomatica = class(T_FormWizard)
    TabSheet1: TTabSheet;
    rbActive: TRadioGroup;
    GroupBox1: TGroupBox;
    cbxSegunda: TCheckBox;
    cbxTerca: TCheckBox;
    cbxQuarta: TCheckBox;
    cbxQuinta: TCheckBox;
    cbxSexta: TCheckBox;
    cbxSabado: TCheckBox;
    cbxDomingo: TCheckBox;
    GroupBox2: TGroupBox;
    rgPageBreak: TRadioGroup;
    GroupBox3: TGroupBox;
    speNextDays: TJvSpinEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    cbxOrder: TComboBox;
    speTime: TJvSpinEdit;
    speMinute: TJvSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    PrinterNamesComboBox: TComboBox;
    JvChangeNotify1: TJvChangeNotify;
    chkAll: TCheckBox;
    Label2: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
    procedure cbxDOWChecked(Sender: TObject);
  private
    { Private declarations }
    FReportCfg : TReportCfg ;
    procedure LoadReportCfg ;
    procedure SaveReportCfg ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses   Registry,
      StrUtils, Math, Printers ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_ConfigurarImpressaoAutomatica.cbxDOWChecked(Sender: TObject);
var
  isAllChecked, isAllUnChecked, isAnyUnChecked  : boolean ;
begin
  isAllChecked := cbxSegunda.Checked
              and cbxTerca.Checked
              and cbxQuarta.Checked
              and cbxQuinta.Checked
              and cbxSexta.Checked
              and cbxSabado.Checked
              and cbxDomingo.Checked ;

  isAllUnChecked := ( not cbxSegunda.Checked )
               and ( not cbxTerca.Checked   )
               and ( not cbxQuarta.Checked  )
               and ( not cbxQuinta.Checked  )
               and ( not cbxSexta.Checked   )
               and ( not cbxSabado.Checked  )
               and ( not cbxDomingo.Checked ) ;

  isAnyUnChecked := ( not cbxSegunda.Checked )
                or ( not cbxTerca.Checked   )
                or ( not cbxQuarta.Checked  )
                or ( not cbxQuinta.Checked  )
                or ( not cbxSexta.Checked   )
                or ( not cbxSabado.Checked  )
                or ( not cbxDomingo.Checked ) ;

  chkAll.OnClick := nil ;
  if ( isAllChecked ) and not chkAll.Checked then
     chkAll.Checked := True
  else if ( isAnyUnChecked ) and chkAll.Checked then
     chkAll.Checked := False ;
  chkAll.OnClick := chkAllClick ;


end;

procedure TZoo_ConfigurarImpressaoAutomatica.chkAllClick(Sender: TObject);
begin
  inherited;

  cbxSegunda.OnClick  := nil ;
  cbxTerca.OnClick    := nil ;
  cbxQuarta.OnClick   := nil ;
  cbxQuinta.OnClick   := nil ;
  cbxSexta.OnClick    := nil ;
  cbxSabado.OnClick   := nil ;
  cbxDomingo.OnClick  := nil ;

  cbxSegunda.Checked  := chkAll.Checked ;
  cbxTerca.Checked    := chkAll.Checked ;
  cbxQuarta.Checked   := chkAll.Checked ;
  cbxQuinta.Checked   := chkAll.Checked ;
  cbxSexta.Checked    := chkAll.Checked ;
  cbxSabado.Checked   := chkAll.Checked ;
  cbxDomingo.Checked  := chkAll.Checked ;

  cbxSegunda.OnClick  := cbxDOWChecked ;
  cbxTerca.OnClick    := cbxDOWChecked ;
  cbxQuarta.OnClick   := cbxDOWChecked ;
  cbxQuinta.OnClick   := cbxDOWChecked ;
  cbxSexta.OnClick    := cbxDOWChecked ;
  cbxSabado.OnClick   := cbxDOWChecked ;
  cbxDomingo.OnClick  := cbxDOWChecked ;

end;

constructor TZoo_ConfigurarImpressaoAutomatica.Create(AOwner: TComponent);
begin
  inherited;
  _btbExecute.Caption := _actExecute.Caption ;
  LoadReportCfg ;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TZoo_ConfigurarImpressaoAutomatica.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_ConfigurarImpressaoAutomatica.Execute : boolean;
var
  ThisForm: T_FormWizard;
begin
  ThisForm := T_FormWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_ConfigurarImpressaoAutomatica.LoadReportCfg;
begin
    UReportServerConfig.LoadReportCfg( FReportCfg ) ;

    rbActive.ItemIndex   := Math.ifThen ( FReportCfg.Active, 0, 1  ) ;

    speTime.AsInteger   := StrToInt ( Copy ( self.FReportCfg.Time, 1, 2 ) ) ;
    speMinute.AsInteger := StrToInt ( Copy ( self.FReportCfg.Time, 4, 2 ) ) ;

    PrinterNamesComboBox.Items.Assign( Printer.Printers );
    PrinterNamesComboBox.ItemIndex :=
       PrinterNamesComboBox.Items.IndexOf( FReportCfg.PrinterName ) ;

    cbxSegunda.Checked  := FReportCfg.DOW[1] = 'T' ;
    cbxTerca.Checked    := FReportCfg.DOW[2] = 'T' ;
    cbxQuarta.Checked   := FReportCfg.DOW[3] = 'T' ;
    cbxQuinta.Checked   := FReportCfg.DOW[4] = 'T' ;
    cbxSexta.Checked    := FReportCfg.DOW[5] = 'T' ;
    cbxSabado.Checked   := FReportCfg.DOW[6] = 'T' ;
    cbxDomingo.Checked  := FReportCfg.DOW[7] = 'T' ;
//    chkAll.OnClick      := FReportCfg.DOW

    speNextDays.AsInteger := FReportCfg.NextDays  ;
    cbxOrder.ItemIndex    := FReportCfg.Order     ;

    rgPageBreak.ItemIndex := ifThen ( FReportCfg.PageBreak, 0, 1  ) ;

end;

procedure RegisterServerStartup ;
var
  Registry: TRegistry;
begin
  Registry := Tregistry.Create;
  Registry.rootkey := HKEY_LOCAL_MACHINE;
  Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);

  Registry.WriteString('CL.Ag5.ReportServerApp', ExtractFilePath ( ParamStr ( 0 ) ) + 'CL.Ag5.ReportServerApp.exe'  );

  Registry.CloseKey;
  Registry.Free;
end;

procedure UnRegisterServerStartup ;
var
  Registry: TRegistry;
begin
  Registry := Tregistry.Create;
  Registry.rootkey := HKEY_LOCAL_MACHINE;
  Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);

  Registry.DeleteValue ('CL.Ag5.ReportServerApp' );

  Registry.CloseKey;
  Registry.Free;
end;

procedure TZoo_ConfigurarImpressaoAutomatica.SaveReportCfg;
begin

    self.FReportCfg.Active       := rbActive.ItemIndex = 0 ;

    if self.FReportCfg.Active then
      RegisterServerStartup
    else
      UnRegisterServerStartup ;
 //   self.FReportCfg.FarmCode     := '' ;

    if PrinterNamesComboBox.ItemIndex = -1 then
       self.FReportCfg.PrinterName  := ''
    else
       self.FReportCfg.PrinterName  := PrinterNamesComboBox.Items [ PrinterNamesComboBox.ItemIndex ] ;

    self.FReportCfg.Time         := Format ( '%2.2d:%2.2d', [speTime.AsInteger,speMinute.AsInteger] ) ;

    self.FReportCfg.DOW[1]   := AnsiChar ( IfThen ( cbxSegunda.Checked, 'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[2]   := AnsiChar ( IfThen ( cbxTerca.Checked,   'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[3]   := AnsiChar ( IfThen ( cbxQuarta.Checked,  'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[4]   := AnsiChar ( IfThen ( cbxQuinta.Checked,  'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[5]   := AnsiChar ( IfThen ( cbxSexta.Checked,   'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[6]   := AnsiChar ( IfThen ( cbxSabado.Checked,  'T', 'F' )[1] ) ;
    self.FReportCfg.DOW[7]   := AnsiChar ( IfThen ( cbxDomingo.Checked, 'T', 'F' )[1] ) ;

    self.FReportCfg.NextDays  := speNextDays.AsInteger ;
    self.FReportCfg.Order     := cbxOrder.ItemIndex    ;
    self.FReportCfg.PageBreak := rgPageBreak.ItemIndex = 0 ;

    UReportServerConfig.SaveReportCfg( FReportCfg ) ;
end;

procedure TZoo_ConfigurarImpressaoAutomatica._actCancelExecute(Sender: TObject);
begin
  if MessageDlg ( 'Encerrar sem salvar ?', mtConfirmation ) = mrYes then
     Application.Application.Terminate ;
end;

procedure TZoo_ConfigurarImpressaoAutomatica._actExecuteExecute(
  Sender: TObject);
begin
  SaveReportCfg ;
  MessageDlg ( 'Salvo com sucesso' ) ;
end;

procedure TZoo_ConfigurarImpressaoAutomatica._actNextExecute(Sender: TObject);
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

procedure TZoo_ConfigurarImpressaoAutomatica._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_ConfigurarImpressaoAutomatica ) ;

end.
