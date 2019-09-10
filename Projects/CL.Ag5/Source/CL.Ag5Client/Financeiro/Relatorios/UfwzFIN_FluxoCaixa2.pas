unit UfwzFIN_FluxoCaixa2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, UdtmFIN_FluxoCaixa2, Data.DB, Tc.Data.DB.Helpers,
  VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, Tc.VCL.Controls.GDIButton,
  ReportTypes, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

{$DEFINE _CDL_OPT}

type
  TfwzFIN_FluxoCaixa2 = class(T_FormWizard)
    tbsConfig: TTabSheet;
    tbsAnalitico: TTabSheet;
    gbxAtraso: TGroupBox;
    rbAtrasoAReceber: TCheckBox;
    rbAtrasoAPagar: TCheckBox;
    gbxTipo: TGroupBox;
    rbTipoAnalitico: TRadioButton;
    rbTipoSintetico: TRadioButton;
    cbxTipoSintetico: TComboBox;
    tbsSintetico: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgContasSintetico: TJvDBUltimGrid;
    dbgFluxoSintetico: TJvDBUltimGrid;
    Panel3: TPanel;
    dbgFluxoAnalitico: TJvDBUltimGrid;
    dtsSumarioAtraso: TDataSource;
    gbxPrevisao: TGroupBox;
    rbPrevisaoAReceber: TCheckBox;
    rbPrevisaoAPagar: TCheckBox;
    gbxDuvidosos: TGroupBox;
    rbDuvidosoAReceber: TCheckBox;
    rbDuvidosoAPagar: TCheckBox;
    gbxPeriodo: TGroupBox;
    rbPeriodoTodos: TRadioButton;
    rbPeriodoAte: TRadioButton;
    deDate: TTcDateEdit;
    rbResumoMensal: TRadioButton;
    tbsResumoMensal: TTabSheet;
    dtsFluxoAnalitico: TDataSource;
    dtsContas: TDataSource;
    GroupBox1: TGroupBox;
    dbgSelectContas: TJvDBUltimGrid;
    dtsContasBancarias: TDataSource;
    Panel4: TPanel;
    cbSelectAll: TCheckBox;
    chkAnaliticoSumarios: TCheckBox;
    Panel5: TPanel;
    dbgSumarioAtraso: TJvDBUltimGrid;
    dtsFluxoSintetico: TDataSource;
    Panel6: TPanel;
    Label1: TLabel;
    lblSaldoInicial: TLabel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgFluxoAnaliticoShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgContasSinteticoShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgFluxoSinteticoShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgFluxoAnaliticoGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dbgSelectContasShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure dbgSelectContasKeyPress(Sender: TObject; var Key: Char);
    function dbgSelectContasCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    procedure dbgSelectContasCellClick(Column: TColumn);
    procedure cbSelectAllClick(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure dbgFluxoSinteticoGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dbgContasSinteticoGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dbgSumarioAtrasoGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure rbTipoAnaliticoClick(Sender: TObject);
    procedure rbTipoSinteticoClick(Sender: TObject);
    procedure cbxTipoSinteticoEnter(Sender: TObject);
    procedure rbPeriodoTodosClick(Sender: TObject);
    procedure rbPeriodoAteClick(Sender: TObject);
    procedure deDateEnter(Sender: TObject);
  private
    { Private declarations }
    dtmFIN_FluxoCaixa2 : TdtmFIN_FluxoCaixa2 ;
    procedure OpenTables ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
  end;


implementation

uses Exceptions, UFin_FluxoCaixaAnaliticoReport, UFin_FluxoCaixaSinteticoReport ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TfwzFIN_FluxoCaixa2.cbSelectAllClick(Sender: TObject);
begin
  inherited;
  dtmFIN_FluxoCaixa2.InvertAllContas( cbSelectAll.Checked ) ;
end;

procedure TfwzFIN_FluxoCaixa2.cbxTipoSinteticoEnter(Sender: TObject);
begin
  rbTipoSintetico.Checked := True
end;

constructor TfwzFIN_FluxoCaixa2.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

    dbgSumarioAtraso.ShowHighlighter   := True ;
    dbgContasSintetico.ShowHighlighter := True ;
    dbgFluxoSintetico.ShowHighlighter  := True ;
    dbgFluxoAnalitico.ShowHighlighter  := True ;

   OpenTables ;
   _btbExecute.Caption := 'V&isualizar';
end;

class function TfwzFIN_FluxoCaixa2.Execute : boolean;
var
  ThisForm: TfwzFIN_FluxoCaixa2;
begin
  ThisForm := TfwzFIN_FluxoCaixa2.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TfwzFIN_FluxoCaixa2.dbgFluxoAnaliticoGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

   if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        {$IFNDEF _CDL_OPT}_TIPO_ANALITICO_SUMARIO_NC,{$ENDIF}
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER,
        _TIPO_ANALITICO_SUMARIO ] ) then
     AFont.Style := [fsBold] ;

   if   ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoDEBITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoCREDITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO ) then
      begin
         if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_SALDO ] ) then
           AFont.Color := clNavy
         else if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_ARECEBER_NC, _TIPO_ANALITICO_ARECEBER_EMATRASO ] ) then
           AFont.Color := clGreen
         else if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_APAGAR_NC, _TIPO_ANALITICO_APAGAR_EMATRASO ] ) then
           AFont.Color := clRed
      end
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoDEBITO ) then
        AFont.Color := clRed
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoCREDITO ) then
        AFont.Color := clGreen
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO ) then
        if self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO.asFloat < 0 then
          AFont.Color := clRed
        else
          AFont.Color := clGreen ;

end;

procedure TfwzFIN_FluxoCaixa2.dbgFluxoAnaliticoShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
   AllowEdit := False ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgFluxoSinteticoGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin

   if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        {$IFNDEF _CDL_OPT}_TIPO_ANALITICO_SUMARIO_NC,{$ENDIF}
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER,
        _TIPO_ANALITICO_SUMARIO ] ) then
     AFont.Style := [fsBold] ;

   if   ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoDEBITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoCREDITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO ) then
      begin
         if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_SALDO ] ) then
           AFont.Color := clNavy
         else if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_ARECEBER_NC, _TIPO_ANALITICO_ARECEBER_EMATRASO ] ) then
           AFont.Color := clGreen
         else if ( self.dtmFIN_FluxoCaixa2.cdsFluxoTIPO.asInteger  in [
              _TIPO_ANALITICO_APAGAR_NC, _TIPO_ANALITICO_APAGAR_EMATRASO ] ) then
           AFont.Color := clRed
      end
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoDEBITO ) then
        AFont.Color := clRed
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoCREDITO ) then
        AFont.Color := clGreen
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO ) then
        if self.dtmFIN_FluxoCaixa2.cdsFluxoSALDO.asFloat < 0 then
          AFont.Color := clRed
        else
          AFont.Color := clGreen ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgFluxoSinteticoShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
   AllowEdit := False ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgSumarioAtrasoGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin

   if ( self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoTIPO.asInteger  in [
        _TIPO_ANALITICO_SUMARIO_SALDO,
        {$IFNDEF _CDL_OPT}_TIPO_ANALITICO_SUMARIO_NC,{$ENDIF}
        _TIPO_ANALITICO_SUMARIO_EMATRASO,
        _TIPO_ANALITICO_SUMARIO_AVENCER,
        _TIPO_ANALITICO_SUMARIO ] ) then
     AFont.Style := [fsBold] ;

   if   ( Field <> self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoDEBITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoCREDITO )
    and ( Field <> self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoSALDO ) then
      begin
         if ( self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoTIPO.asInteger  in [
              _TIPO_ANALITICO_SALDO ] ) then
           AFont.Color := clNavy
         else if ( self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoTIPO.asInteger  in [
              _TIPO_ANALITICO_ARECEBER_NC, _TIPO_ANALITICO_ARECEBER_EMATRASO ] ) then
           AFont.Color := clGreen
         else if ( self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoTIPO.asInteger  in [
              _TIPO_ANALITICO_APAGAR_NC, _TIPO_ANALITICO_APAGAR_EMATRASO ] ) then
           AFont.Color := clRed
      end
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoDEBITO ) then
        AFont.Color := clRed
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoCREDITO ) then
        AFont.Color := clGreen
   else if ( Field = self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoSALDO ) then
        if self.dtmFIN_FluxoCaixa2.cdsSumarioAtrasoSALDO.asFloat < 0 then
          AFont.Color := clRed
        else
          AFont.Color := clGreen ;
end;

procedure TfwzFIN_FluxoCaixa2.deDateEnter(Sender: TObject);
begin
   rbPeriodoAte.Checked := True
end;

procedure TfwzFIN_FluxoCaixa2.dbgContasSinteticoGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin

   if ( Field = self.dtmFIN_FluxoCaixa2.cdsContasSALDOCC ) then
       if self.dtmFIN_FluxoCaixa2.cdsContasSALDOCC.asFloat < 0 then
         AFont.Color := clRed
       else
         AFont.Color := clGreen ;

end;

procedure TfwzFIN_FluxoCaixa2.dbgContasSinteticoShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  inherited;
   AllowEdit := False ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgSelectContasCellClick(Column: TColumn);
begin
  if not ( dtmFIN_FluxoCaixa2.cdsLstContas.IsEmpty )
   and ( Column.Field =  dtmFIN_FluxoCaixa2.cdsLstContasSELECT ) then
     dtmFIN_FluxoCaixa2.InvertSelecaoContas ;
end;

function TfwzFIN_FluxoCaixa2.dbgSelectContasCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  with dtmFIN_FluxoCaixa2 do
    Result := ( Field = cdsLstContasSELECT  ) ;

  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgSelectContasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #32 ) and (  dbgSelectContas.SelectedField <> dtmFIN_FluxoCaixa2.cdsLstContasSELECT  ) then
    dtmFIN_FluxoCaixa2.InvertSelecaoContas ;
end;

procedure TfwzFIN_FluxoCaixa2.dbgSelectContasShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TfwzFIN_FluxoCaixa2.OpenTables;
begin
   dtmFIN_FluxoCaixa2 := TdtmFIN_FluxoCaixa2.Create ( self ) ;
   cbSelectAll.Checked := True;
//   dtmFIN_FluxoCaixa2.OpenTables ;
//   DataSource1.DataSet := dtmFIN_FluxoCaixa2.cdsEdit ;
end;

procedure TfwzFIN_FluxoCaixa2.rbPeriodoAteClick(Sender: TObject);
begin
  deDate.TabStop := True ;
end;

procedure TfwzFIN_FluxoCaixa2.rbPeriodoTodosClick(Sender: TObject);
begin
  deDate.TabStop := False ;
end;

procedure TfwzFIN_FluxoCaixa2.rbTipoAnaliticoClick(Sender: TObject);
begin
  cbxTipoSintetico.TabStop := False ;
end;

procedure TfwzFIN_FluxoCaixa2.rbTipoSinteticoClick(Sender: TObject);
begin
  cbxTipoSintetico.TabStop := True ;
end;

procedure TfwzFIN_FluxoCaixa2._actExecuteExecute(Sender: TObject);
var
  PReport : TReportParamsFluxoCaixa ;
begin
  PReport := ReportTypes.TReportParamsFluxoCaixa.Create ;
  PReport.FDataModule := dtmFIN_FluxoCaixa2 ;
  if PageControl.ActivePage = tbsAnalitico then
    try
      dtmFIN_FluxoCaixa2.cdsFluxo.DisableControls;
      dtmFIN_FluxoCaixa2.cdsFluxo.First;

      TFIN_FluxoCaixaAnaliticoReport.Execute( PReport );
    finally
      dtmFIN_FluxoCaixa2.cdsFluxo.First;
      dtmFIN_FluxoCaixa2.cdsFluxo.EnableControls;
    end;

  if PageControl.ActivePage = tbsSintetico then
    begin
      PReport.SaldoContas   := dtmFIN_FluxoCaixa2.SaldoInicialContas ;
      PReport.TotalAReceber := dtmFIN_FluxoCaixa2.AReceberEmAtraso ;
      PReport.TotalAPagar   := dtmFIN_FluxoCaixa2.APagarEmAtraso ;

      TFIN_FluxoCaixaSinteticoReport.Execute( PReport );
    end;

  inherited;
  PReport.Free ;
end;

procedure TfwzFIN_FluxoCaixa2._actNextExecute(Sender: TObject);
var
  LDataTitulos : TDateTime ;
  Contas      : Integer;
begin
  Contas := 0;
  with dtmFIN_FluxoCaixa2 do
    begin
      cdsLstContas.First;
      cdsLstContas.DisableControls;

      while not ( cdsLstContas.Eof ) do
        begin
          if cdsLstContasSELECT.AsInteger = 1 then
            Contas := Contas + 1;

          cdsLstContas.Next;
        end;

      cdsLstContas.First;
      cdsLstContas.EnableControls;
    end;

  if Contas = 0 then
    raise Warning.Create('Favor selecionar ao menos uma conta.');

  if rbPeriodoTodos.checked then
     LDataTitulos := 0
  else
     LDataTitulos := deDate.Date ;

  if rbTipoAnalitico.checked then
    dtmFIN_FluxoCaixa2.Config.TipoFluxo                       := tfAnalitico
  else
    dtmFIN_FluxoCaixa2.Config.TipoFluxo                       := TTipoFluxo( cbxTipoSintetico.ItemIndex + 1) ;

  dtsFluxoAnalitico.Enabled := dtmFIN_FluxoCaixa2.Config.TipoFluxo = tfAnalitico ;
  dtsFluxoSintetico.Enabled := dtmFIN_FluxoCaixa2.Config.TipoFluxo <> tfAnalitico ;

  dtmFIN_FluxoCaixa2.Config.Data                                := LDataTitulos ;
  dtmFIN_FluxoCaixa2.Config.AtrasoAReceber                      := rbAtrasoAReceber.Checked ;
  dtmFIN_FluxoCaixa2.Config.AtrasoAPagar                        := rbAtrasoAPagar.Checked ;
  dtmFIN_FluxoCaixa2.Config.PrevisaoAReceber                    := rbPrevisaoAReceber.Checked ;
  dtmFIN_FluxoCaixa2.Config.PrevisaoAPagar                      := rbPrevisaoAPagar.Checked ;
  dtmFIN_FluxoCaixa2.Config.DuvidosoAReceber                    := rbDuvidosoAReceber.Checked ;
  dtmFIN_FluxoCaixa2.Config.DuvidosoAPagar                      := rbDuvidosoAPagar.Checked ;
  dtmFIN_FluxoCaixa2.Config.ExibirSumarios := chkAnaliticoSumarios.Checked ;
  dtmFIN_FluxoCaixa2.Execute ;

  if rbTipoAnalitico.checked then
    begin
      PageControl.ActivePage := tbsAnalitico ;
    end
  else if rbTipoSintetico.checked then
    begin


      lblSaldoInicial.Caption := FormatFloat ( '#,0.00 ;(#,0.00) ;- ', dtmFIN_FluxoCaixa2.SaldoInicialContas ) ;
      if dtmFIN_FluxoCaixa2.SaldoInicialContas < 0  then
        lblSaldoInicial.Font.Color := clRed
      else
        lblSaldoInicial.Font.Color := clGreen ;

      dtsContas.DataSet := dtmFIN_FluxoCaixa2.cdsContas ;

      PageControl.ActivePage := tbsSintetico ;
    end
  else if rbResumoMensal.checked then
    begin
      self.dtmFIN_FluxoCaixa2.FluxoResumoMensal ;
      PageControl.ActivePage := tbsResumoMensal ;
    end ;

  _btbExecute.Visible := True;
  _btbNext.Visible    := False;

end;

procedure TfwzFIN_FluxoCaixa2._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

//  inherited;
   PageControl.ActivePage := tbsConfig ;
   _btbExecute.Visible    := False;
   _btbNext.Visible       := True;
end;

initialization
   RegisterClass ( TfwzFIN_FluxoCaixa2 ) ;
end.

