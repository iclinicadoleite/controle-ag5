unit UMessagePrintDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type
  TMessagePrintDialog = class(T_FormWizard)
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    Label1: TLabel;
    pnlDSA: TPanel;
    chkDSA: TCheckBox;
    actYes: TAction;
    actNo: TAction;
    TcGDIButton1: TTcGDIButton;
    TcGDIButton2: TTcGDIButton;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
    procedure actYesExecute(Sender: TObject);
  private
    { Private declarations }
    FMessage : TStringList ;
  public
    { Public declarations }
    class function Execute ( ACaption : String ; AMessage : string ): boolean ; reintroduce ;
    class function ExecuteYNC ( ACaption : String ; AMessage : string ): integer ; overload ;
    class function ExecuteDSA ( ACaption : String ; AMessage : string ; out DSA : Boolean  ): boolean; overload ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses UReportMemoList, ReportTypes ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TMessagePrintDialog.actNoExecute(Sender: TObject);
begin
  ModalResult := mrNo ;
end;

procedure TMessagePrintDialog.actYesExecute(Sender: TObject);
begin
  ModalResult := mrYes ;
end;

constructor TMessagePrintDialog.Create(AOwner: TComponent);
begin
  inherited;
  FMessage := TStringList.Create ;
  _actExecute.Caption := 'V&isualizar' ;
  _btbExecute.Caption := 'V&isualizar' ;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TMessagePrintDialog.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  FMessage.Free ;
  inherited;
end;

class function TMessagePrintDialog.Execute ( ACaption : String ; AMessage : string ): boolean;
var
  ThisForm: TMessagePrintDialog ;
begin
  ThisForm := TMessagePrintDialog.Create ( nil ) ;
  with ThisForm do
  try
      Label1.Caption := ACaption ;
      FMessage.text := Amessage ;
      Memo1.Lines.Clear;
      Memo1.Lines.Add ( '' ) ;
      Memo1.Lines.AddStrings( FMessage );
      pnlDSA.Visible := False ;
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

class function TMessagePrintDialog.ExecuteYNC ( ACaption : String ; AMessage : string ): integer ;
var
  ThisForm: TMessagePrintDialog ;
begin
  ThisForm := TMessagePrintDialog.Create ( nil ) ;
  with ThisForm do
  try
      Label1.Caption := ACaption ;
      FMessage.text := Amessage ;
      Memo1.Lines.Clear;
      Memo1.Lines.Add ( '' ) ;
      Memo1.Lines.AddStrings( FMessage );
      pnlDSA.Visible := False ;
      actYes.Visible := True ;
      actNo.Visible   := True ;
      Result := ThisForm.ShowModal ;
  finally
     ThisForm.free ;
  end ;
end ;

class function TMessagePrintDialog.ExecuteDSA(ACaption, AMessage: string ; out DSA : Boolean  ): boolean;
var
  ThisForm: TMessagePrintDialog ;
begin
  ThisForm := TMessagePrintDialog.Create ( nil ) ;
  with ThisForm do
  try
      Label1.Caption := ACaption ;
      FMessage.text := Amessage ;
      Memo1.Lines.Clear;
      Memo1.Lines.Add ( '' ) ;
      Memo1.Lines.AddStrings( FMessage );
      Result := ThisForm.ShowModal = mrOK ;
      DSA := chkDSA.Checked;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end;

procedure TMessagePrintDialog._actExecuteExecute(
  Sender: TObject);
var
 p : TReportParamsMemoList ;
begin
  inherited;
  p := TReportParamsMemoList.Create ;
  p.ReportTitle := Label1.Caption ;
  p.StringList := Memo1.Lines ;
  TReportMemoList.Execute( p );
  p.Free ;
  BringToFront ;
end;

procedure TMessagePrintDialog._actNextExecute(Sender: TObject);
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

procedure TMessagePrintDialog._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

end.
