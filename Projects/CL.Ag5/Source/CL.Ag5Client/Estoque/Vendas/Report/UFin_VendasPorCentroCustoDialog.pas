unit UFin_VendasPorCentroCustoDialog;

{ DONE -oCaique -cVendas : - Alterar Barra de Título }
{ DONE -oCaique -cVendas : - Alterar Posição Titulo }
{ DONE -oCaique -cVendas : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, VCL.Mask, JvExMask,
  JvToolEdit, SysWizardReportDialog, SysReportTypes, ReportTypes, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Edits, Tc.VCL.Controls.GDIButton, JvDBControls, SysFormWizard,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsVENDAS_Periodo ;

  TFin_VendasPorCentroCustoDialog = class(T_FormWizard, IReportDialog ) //T_WizardReportDialog)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edInicio: TTcDateEdit;
    Label2: TLabel;
    edTermino: TTcDateEdit;
    rgFornecedor: TRadioGroup;
    rgContacontabil: TRadioGroup;
    rgCentroCusto: TRadioGroup;
    edEntidade: TTcComboEdit;
    edContacontabil: TTcComboEdit;
    edCentroCusto: TTcComboEdit;
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure edContacontabilButtonClick(Sender: TObject);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edContacontabilKeyPress(Sender: TObject; var Key: Char);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FKCAD_ENTIDADE : string;
    FKFIN_PLANOCONTA : string;
    FKFIN_CENTROCUSTO : string;
    procedure SearchEntidade( TextToSearch :string );
    procedure SearchContacontabil( TextToSearch :string );
    procedure SearchCentroCusto( TextToSearch :string );
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ; //override ;
    procedure SetParameters (var Parameters : TReportParams ) ; //override ;
  public
    { Public declarations }
    function Execute (Parameters : TReportParams ) : boolean ; reintroduce ;
  end;

implementation

uses SearchsFinanceiro, DateUtils ;

{$R *.dfm}

{ TfrmCustomDialog }

procedure TFin_VendasPorCentroCustoDialog.edCentroCustoButtonClick(Sender: TObject);
begin
  inherited;
  SearchCentroCusto( TTcComboEdit( Sender ).Text );
end;

procedure TFin_VendasPorCentroCustoDialog.edCentroCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TTcComboEdit( Sender ).DoClick ;
end;

procedure TFin_VendasPorCentroCustoDialog.edContacontabilButtonClick(Sender: TObject);
begin
  inherited;
  SearchContacontabil( TTcComboEdit( Sender ).Text );
end;

procedure TFin_VendasPorCentroCustoDialog.edContacontabilKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TTcComboEdit( Sender ).DoClick ;
end;

procedure TFin_VendasPorCentroCustoDialog.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  rgFornecedor.ItemIndex := 1;
  SearchEntidade( TTcComboEdit( Sender ).Text );
end;

procedure TFin_VendasPorCentroCustoDialog.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TTcComboEdit( Sender ).DoClick ;
end;

function TFin_VendasPorCentroCustoDialog.Execute(Parameters: TReportParams): boolean;
begin
  edInicio.Date         := StartOfTheMonth( Date ) ;
  edTermino.Date        := EndOfTheMonth( Date ) ;
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TFin_VendasPorCentroCustoDialog.GetParameters(var Parameters: TReportParams);
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      FKCAD_ENTIDADE    := EmptyStr ;
      FKFIN_PLANOCONTA  := EmptyStr ;
      FKFIN_CENTROCUSTO := EmptyStr ;
      edInicio.Date     := StartDate ;
      edTermino.Date    := EndDate ;
    end ;
end;

procedure TFin_VendasPorCentroCustoDialog.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if rgFornecedor.ItemIndex = 0 then
    begin
      edEntidade.Text := EmptyStr;
      FKCAD_ENTIDADE  := EmptyStr;
    end;
end;

procedure TFin_VendasPorCentroCustoDialog.SearchCentroCusto(TextToSearch: string);
begin
  with TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        FKFIN_CENTROCUSTO  := Result.FieldByName( 'KFIN_CENTROCUSTO' ).AsString ;
        edCentroCusto.Text := Result.FieldByName( 'NOME' ).AsString ;
    finally
      free;
    end;
end;

procedure TFin_VendasPorCentroCustoDialog.SearchContacontabil(TextToSearch: string);
begin
  with TSearchPlanoContasNotHideByUser.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        FKFIN_PLANOCONTA     := Result.FieldByName( 'KFIN_PLANOCONTA' ).AsString ;
        edContacontabil.Text := Result.FieldByName( 'NOME' ).AsString ;
    finally
      free;
    end;
end;

procedure TFin_VendasPorCentroCustoDialog.SearchEntidade(TextToSearch: string);
begin
  with TSearchClienteAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        FKCAD_ENTIDADE  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
        edEntidade.Text := Result.FieldByName( 'APELIDO' ).AsString ;
    finally
      free;
    end;
end;

procedure TFin_VendasPorCentroCustoDialog.SetParameters( var Parameters: TReportParams );
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      ReportTitle      := 'Notas fiscais de vendas por centro de custo';
      StartDate        := edInicio.Date ;
      EndDate          := edTermino.Date ;
      TODOS_ENTIDADE   := rgFornecedor.ItemIndex = 0 ;
      KCAD_ENTIDADE    := FKCAD_ENTIDADE ;
      TodasContas      := rgContacontabil.ItemIndex = 0 ;
      KFIN_PLANOCONTA  := FKFIN_PLANOCONTA ;
      TodosCentros     := rgCentroCusto.ItemIndex = 0 ;
      KFIN_CENTROCUSTO := FKFIN_CENTROCUSTO ;
    end ;
end;

end.

