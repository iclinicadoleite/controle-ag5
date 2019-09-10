unit UfdrFIN_APagarEntidade;


{ DONE -oCaique -cA Pagar : - Alterar Barra de Título }
{ DONE -oCaique -cA Pagar : - Alterar Posição Titulo }
{ DONE -oCaique -cA Pagar : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, SysWizardReportDialog,
  ReportTypes, VCL.Mask, JvExMask, JvToolEdit, VCL.ComCtrls, JvExComCtrls, JvComCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Tc.VCL.Edits, SysReportTypes,
  Tc.VCL.Controls.GDIButton, SysFormWizard, Wrappers, Tc.VCL.Extended.Mask, System.Actions, Tc.VCL.Application ;

type

  TSpecificReportParams = ReportTypes.TReportParamsFIN_APagar ;

  TfdrFIN_APagarEntidade = class(T_FormWizard, IReportDialog )
    _edtSearch: TJvComboEdit;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    rbTodosCLientes: TRadioButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edTermino: TTcDateEdit;
    edInicio: TTcDateEdit;
    procedure _edtSearchChange(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _edtSearchButtonClick(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
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

uses SearchsFinanceiro;

{$R *.dfm}

{ TfrmCustomDialog }


function TfdrFIN_APagarEntidade.Execute(Parameters: TReportParams): boolean;
begin
  edInicio.Date  := Date;
  edTermino.Date := Date + 7;
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TfdrFIN_APagarEntidade.GetParameters( var Parameters: TReportParams);
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;

      edInicio.Date  := StartDate ;
      edTermino.Date := EndDate ;
    end ;
end;

procedure TfdrFIN_APagarEntidade.PesquisaEntidade;
begin
  inherited ;
  with TSearchFornecedorAtivo.Create do
    begin
      TextToFind := _edtSearch.Text ;
      if Execute then
        begin
          _edtSearch.Text := Result.FieldByName( 'APELIDO' ).asString ;
          FKEntidade      := Result.FieldByName( 'KCAD_ENTIDADE' ).Value ;
        end ;
      free ;
    end ;
end;

procedure TfdrFIN_APagarEntidade.SetParameters( var Parameters: TReportParams ) ;
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

procedure TfdrFIN_APagarEntidade._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( ( FKEntidade <> '' ) or ( rbTodosCLientes.Checked ) );
end;

procedure TfdrFIN_APagarEntidade._edtSearchButtonClick(Sender: TObject);
begin
  inherited;
  PesquisaEntidade ;
end;

procedure TfdrFIN_APagarEntidade._edtSearchChange(Sender: TObject);
begin
  inherited;
  FKEntidade := '' ;
end;

procedure TfdrFIN_APagarEntidade._edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
     begin
         Key := #0 ;
         PesquisaEntidade ;
     end ;
end;

end.

