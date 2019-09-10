unit UFin_VendasPorPeriodoDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, ReportTypes,
  VCL.Mask, JvExMask, JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel,
  SysFormWizard, SysReportTypes, VCL.ComCtrls, Tc.VCL.Edits, JvImage,
  JvExComCtrls, JvComCtrls, Tc.VCL.Controls.GDIButton, JvDBControls,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsVENDAS_Periodo ;

  TFin_VendasPorPeriodoDialog = class(T_FormWizard, IReportDialog )
    TabSheet1: TTabSheet;
    RadioGroup1: TRadioGroup;
    edEntidade: TTcComboEdit;
    GroupBox1: TGroupBox;
    edInicio: TTcDateEdit;
    Label1: TLabel;
    edTermino: TTcDateEdit;
    Label2: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FKCAD_ENTIDADE : string ;
    procedure SearchEntidade( TextToSearch :string );
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

procedure TFin_VendasPorPeriodoDialog.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 0 then
    RadioGroup1.ItemIndex := 1;

  SearchEntidade( TTcComboEdit( Sender ).Text );
end;

procedure TFin_VendasPorPeriodoDialog.edEntidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    TTcComboEdit( Sender ).DoClick ;
end;

function TFin_VendasPorPeriodoDialog.Execute( Parameters: TReportParams ) : boolean ;
begin
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TFin_VendasPorPeriodoDialog.GetParameters( var Parameters: TReportParams );
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;
      edInicio.Date  := StartDate ;
      edTermino.Date := EndDate ;
    end ;
end;

procedure TFin_VendasPorPeriodoDialog.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 0 then
    begin
      edEntidade.Text := EmptyStr;
      FKCAD_ENTIDADE  := EmptyStr;
    end;
end;

procedure TFin_VendasPorPeriodoDialog.SearchEntidade(TextToSearch: string);
begin
  with TSearchClienteAtivo.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin
          FKCAD_ENTIDADE  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
          edEntidade.Text := Result.FieldByName( 'APELIDO' ).AsString ;
        end;
    finally
      free;
    end;
end;

procedure TFin_VendasPorPeriodoDialog.SetParameters( var Parameters: TReportParams ) ;
begin
   inherited ;

   with TSpecificReportParams ( Parameters ) do
      begin
        // Param := FormControl ;
        StartDate      := edInicio.Date ;
        EndDate        := edTermino.Date  ;
        TODOS_ENTIDADE := RadioGroup1.ItemIndex = 0 ;
        KCAD_ENTIDADE  := FKCAD_ENTIDADE ;
      end ;
end;

end.

