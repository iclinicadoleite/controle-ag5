// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesDiarioDaMastiteWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesDiarioDaMastiteDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, UDBZootecnico,
  UZoo_AtividadesBaseWizard, Data.DB, Tc.Data.DB.Helpers, VCL.DBCtrls, JvDBControls,
  Tc.VCL.Controls.GDIButton, System.Actions, QRCtrls, QuickRpt,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesDiarioDaMastiteWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    edFuncionario: TTcComboEdit;
    RadioGroup1: TRadioGroup;
    gbMensagem: TPanel;
    Image1:  TImage;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edFuncionarioButtonClick(Sender: TObject);
    procedure edFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioChange(Sender: TObject);
    procedure DBGridResultadosDrawColumnCell(Sender: TObject;
      const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    FKCAD_FUNCIONARIO : string ;
    Zoo_AtividadesDiarioDaMastiteDatamodule : TZoo_AtividadesDiarioDaMastiteDatamodule ;
    procedure OpenTables ; override ;
    procedure SearchFuncionario( TextToSearch :string );
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

  TZoo_AtividadesDiarioDaMastiteProximosDias   = class(TZoo_AtividadesDiarioDaMastiteWizard)
  private
    procedure OpenTables ; override ;
 public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end ;

implementation

uses ClAg5ClientCommonTypes,
     UZoo_AtividadesDiarioDaMastiteReport2,
     ThreadSuppl,
     ReportTypes,
     SearchsZootecnico;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesDiarioDaMastiteWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   deAte.Date := Date ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesDiarioDaMastiteWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesDiarioDaMastiteWizard ;
begin
  ThisForm := TZoo_AtividadesDiarioDaMastiteWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_AtividadesDiarioDaMastiteWizard.OpenTables;
begin
   Zoo_AtividadesDiarioDaMastiteDatamodule := TZoo_AtividadesDiarioDaMastiteDatamodule.Create ( self ) ;
   Zoo_AtividadesDiarioDaMastiteDatamodule.ProxXDias := False ;
   dtsResultado.DataSet := Zoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefas ;
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard.DBGridResultadosDrawColumnCell(
  Sender: TObject; const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if assigned ( column.Field ) and ( column.Field = TJvDBUltimGrid ( Sender ).DataSource.DataSet.FieldByName('DATAPREVISTA') )
   and ( not TJvDBUltimGrid ( Sender ).DataSource.DataSet.IsEmpty )
   and (TJvDBUltimGrid ( Sender ).DataSource.DataSet.FieldByName('DATAPREVISTA').AsDateTime < Date) then
     TJvDBUltimGrid ( Sender ).Canvas.Draw( Rect.Left + 2, Rect.Top + 2, Image1.Picture.Graphic );
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard.edFuncionarioButtonClick(
  Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    RadioGroup1.ItemIndex := 1;

  SearchFuncionario( TTcComboEdit( Sender ).Text );
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard.edFuncionarioChange(
  Sender: TObject);
begin
  FKCAD_FUNCIONARIO  := '' ;
  edFuncionario.Font.Color := clMaroon ;
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard.edFuncionarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TTcComboEdit( Sender ).DoClick ;
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard._actExecuteExecute(
  Sender: TObject);
var
  PReport : TSpecificReportParams ;
begin
//  inherited;
  PReport := TSpecificReportParams.Create ;
  PReport.ReportTitle := 'Relatório diário de ordenha' ;
  PReport.EndDate := deAte.date ;
  PReport.PorFuncionario:= RadioGroup1.ItemIndex = 1;
  PReport.SourceClientDataSet := Zoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefas ;
  TZoo_AtividadesDiarioDaMastiteReport.Execute( PReport );
  PReport.Free ;
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard._actNextExecute(Sender: TObject);
begin
  Caption := 'Atividades - Mastite' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  if RadioGroup1.ItemIndex = 0 then
    Zoo_AtividadesDiarioDaMastiteDatamodule.KCAD_FUNCIONARIO := ''
  else
    Zoo_AtividadesDiarioDaMastiteDatamodule.KCAD_FUNCIONARIO := FKCAD_FUNCIONARIO ;
  // open table on set ''Ate''
  Zoo_AtividadesDiarioDaMastiteDatamodule.Ate := deAte.date ;
  inherited;

  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesDiarioDaMastiteWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Mastite' ;

end;

procedure TZoo_AtividadesDiarioDaMastiteWizard.SearchFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).AsString ;
               FKCAD_FUNCIONARIO  := Result.FieldByName( 'KCAD_ENTIDADE' ).AsString ;
               edFuncionario.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

{ TZoo_AtividadesDiarioDaMastiteProximosDias }

constructor TZoo_AtividadesDiarioDaMastiteProximosDias.Create(AOwner: TComponent);
begin
  inherited;
  Caption        := Format ( '%s próx. %d dias', [ 'Atividades - Mastite', ParametrosFazenda( LoggedUser.DomainID ).TarefasProxDias ] ) ;
  PageControl.ActivePage     := TabSheetResultado ;
  TabSheetParametros.Enabled := False ;
end;



procedure TZoo_AtividadesDiarioDaMastiteProximosDias.OpenTables;
begin
  inherited;
  Zoo_AtividadesDiarioDaMastiteDatamodule.ProxXDias := True ;
  Zoo_AtividadesDiarioDaMastiteDatamodule.Ate := Date + ParametrosFazenda ( LoggedUser.DomainID ).TarefasProxDias ;
  EditControlsDBGrid;
end;

initialization
  RegisterClass ( TZoo_AtividadesDiarioDaMastiteWizard ) ;
  RegisterClass ( TZoo_AtividadesDiarioDaMastiteProximosDias ) ;


end.
