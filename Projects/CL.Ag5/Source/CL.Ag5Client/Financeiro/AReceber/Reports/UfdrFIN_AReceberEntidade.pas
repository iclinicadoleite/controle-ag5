unit UfdrFIN_AReceberEntidade;

{ DONE -oCaique -cA Receber : - Alterar Barra de Título }
{ DONE -oCaique -cA Receber : - Alterar Posição Titulo }
{ DONE -oCaique -cA Receber : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, SysFormWizard, VCL.Buttons,
  SysWizardReportDialog, SysReportTypes, ReportTypes, VCL.Mask, JvExMask,
  JvToolEdit, VCL.ComCtrls, JvExComCtrls, JvComCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, JvImage, Tc.VCL.Edits, Tc.VCL.Controls.GDIButton, Wrappers, Tc.VCL.Extended.Mask, System.Actions, Tc.VCL.Application ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_AReceber ;

  TfdrFIN_AReceberEntidade = class(T_FormWizard, IReportDialog )
    Label3: TLabel;
    _edtSearch: TJvComboEdit;
    TabSheet1: TTabSheet;
    rbTodosCLientes: TRadioButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edTermino: TTcDateEdit;
    edInicio: TTcDateEdit;
    procedure _edtSearchChange(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure rbTodosCLientesClick(Sender: TObject);
    procedure _edtSearchButtonClick(Sender: TObject);
  private
    { Private declarations }
    FKEntidade : string ;
    procedure PesquisaEntidade ;
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ;
    procedure SetParameters (var Parameters : TReportParams ) ;
  public
    { Public declarations }
    function Execute (Parameters : TReportParams ) : boolean ; reintroduce ;
  end;

implementation

uses SearchsFinanceiro, UDBFinanceiro;

{$R *.dfm}

{ TfrmCustomDialog }


function TfdrFIN_AReceberEntidade.Execute(Parameters: TReportParams): boolean;
begin
  edInicio.Date  := Date;
  edTermino.Date := Date + 7;
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TfdrFIN_AReceberEntidade.GetParameters( var Parameters: TReportParams);
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;

      edInicio.Date  := StartDate ;
      edTermino.Date := EndDate ;
    end ;
end;

procedure TfdrFIN_AReceberEntidade.PesquisaEntidade;
begin
  inherited ;
  with TSearchClienteAtivo.Create do
    begin
      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
          _edtSearch.Text := Result.FieldByName( 'APELIDO' ).asString ;
          FKEntidade      := Result.FieldByName( 'KCAD_ENTIDADE' ). AsString ;
        end ;
      free ;
    end ;
end;


procedure TfdrFIN_AReceberEntidade.rbTodosCLientesClick(Sender: TObject);
begin
  if rbTodosCLientes.Checked then
    begin
      FKEntidade := '';
      _edtSearch.Clear;
    end;
end;

procedure TfdrFIN_AReceberEntidade.SetParameters( var Parameters: TReportParams ) ;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // Param := FormControl ;
      FTODOS        := rbTodosCLientes.Checked ;
      KCAD_Entidade := FKEntidade ;
      StartDate     := edInicio.Date ;
      EndDate       := edTermino.Date  ;
    end ;
end;

procedure TfdrFIN_AReceberEntidade._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( ( FKEntidade <> '' ) or ( rbTodosCLientes.Checked ) );
end;

procedure TfdrFIN_AReceberEntidade._edtSearchButtonClick(Sender: TObject);
begin
  inherited;
  PesquisaEntidade;
end;

procedure TfdrFIN_AReceberEntidade._edtSearchChange(Sender: TObject);
begin
  inherited;
  FKEntidade := '' ;
end;

procedure TfdrFIN_AReceberEntidade._edtSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     begin
         Key := #0 ;
         PesquisaEntidade ;
     end ;
end;

end.

