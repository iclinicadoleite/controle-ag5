// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Lançamentos
// Funcionality : Dar baixa em contas a receber
//
// License      : veja readme.txt





unit UFin_BaixaAReceberWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExMask,
  Tc.VCL.Controls.GDIButton, JvToolEdit, VCL.Mask, Tc.VCL.Edits, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, UFin_BaixaAReceberDatamodule,
  Data.DB, Tc.Data.DB.Helpers, SysFormEditaLista, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TFin_BaixaAReceberWizard = class(T_FormWizard)
    dtsResultado: TDataSource;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataInicial: TTcDateEdit;
    edDataFinal: TTcDateEdit;
    GroupBox2: TGroupBox;
    edEntidade: TJvComboEdit;
    rbTodos: TRadioButton;
    rbEntidade: TRadioButton;
    DBGridResultados: TJvDBUltimGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure edEntidadeButtonClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edEntidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridResultadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridResultadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
    Fin_BaixaAReceberDatamodule : TFin_BaixaAReceberDatamodule ;
    FDBGridResultados : TJvDBUltimGrid ;
    FKCad_Entidade : string ;
    FSelectedTipoTitulo : TTipoTitulo ;
    procedure BaixarTitulo ;
    procedure SearchCliente;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses SearchsFinanceiro, FIN_AReceberTypes, SysPrintGridDialog, UfrmFIN_AReceberBaixaTitulo;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TFin_BaixaAReceberWizard.BaixarTitulo;
var
  BaixaTitulo : TBaixaTitulo ;
begin
//  inherited;
  if Fin_BaixaAReceberDatamodule.cdsBaixaAReceber.IsEmpty then
    Exit ;

//  if not ( Fin_BaixaAReceberDatamodule.cdsBaixaAReceber.State in [dsInsert, dsEdit] ) then
//    Fin_BaixaAReceberDatamodule.cdsBaixaAReceber.Edit;

  BaixaTitulo.KParcela := Fin_BaixaAReceberDatamodule.cdsBaixaAReceberKFIN_ARECEBER_PARCELA.asString ;
  { if } TfrmFIN_AReceberBaixaTitulo.Execute(  BaixaTitulo ) ; //then
     Fin_BaixaAReceberDatamodule.RefreshList ;
end;


constructor TFin_BaixaAReceberWizard.Create(AOwner: TComponent);
begin
  inherited;
  Fin_BaixaAReceberDatamodule := TFin_BaixaAReceberDatamodule.Create( Self );
  FSelectedTipoTitulo := ttAReceber ;
  Fin_BaixaAReceberDatamodule.OpenTables;
  edDataInicial.Date := Date;
  edDataFinal.Date   := Date + 7;
//  _actExecute.Caption := 'V&isualizar' ;
  _btbExecute.Caption := 'V&isualizar' ;
  FDBGridResultados := DBGridResultados ;
  DBGridResultados.ShowHighlighter := True ;
end;

destructor TFin_BaixaAReceberWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TFin_BaixaAReceberWizard.edEntidadeButtonClick(Sender: TObject);
begin
  inherited;
  rbEntidade.Checked := True;
  SearchCliente;
end;

procedure TFin_BaixaAReceberWizard.edEntidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0;
      rbEntidade.Checked := True;
      SearchCliente;
    end;
end;

class function TFin_BaixaAReceberWizard.Execute : boolean;
var
  ThisForm: TFin_BaixaAReceberWizard;
begin
  ThisForm := TFin_BaixaAReceberWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFin_BaixaAReceberWizard.RadioButton1Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAReceber ;
end;

procedure TFin_BaixaAReceberWizard.RadioButton2Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttRecebidos ;
end;

procedure TFin_BaixaAReceberWizard.RadioButton3Click(Sender: TObject);
begin
  FSelectedTipoTitulo := ttAmbos ;
end;

procedure TFin_BaixaAReceberWizard.DBGridResultadosDblClick(Sender: TObject);
begin
   BaixarTitulo ;
end;

procedure TFin_BaixaAReceberWizard.DBGridResultadosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin

  if Highlight then
    Exit;

  if not Fin_BaixaAReceberDatamodule.cdsBaixaAReceberPAGTO.isNull then
    AFont.Color := clBlack // clGray
  else if Fin_BaixaAReceberDatamodule.cdsBaixaAReceberVENCTO.asDateTime < Date then
    AFont.Color := clMaroon
  else if Fin_BaixaAReceberDatamodule.cdsBaixaAReceberVENCTO.AsDateTime > Date then
    AFont.Color := clGreen
  else
    AFont.Color := clNavy ;

end;

procedure TFin_BaixaAReceberWizard.DBGridResultadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
   begin
       Key := 0 ;
       BaixarTitulo
   end;
end;

procedure TFin_BaixaAReceberWizard.rbTodosClick(Sender: TObject);
begin
  inherited;
  if rbTodos.Checked then
    begin
      FKCad_Entidade := EmptyStr;
      edEntidade.Clear;
    end;
end;

procedure TFin_BaixaAReceberWizard.SearchCliente;
begin
  with TSearchClienteAtivo.Create do
    try
      TextToFind := edEntidade.Text ;
      if Execute then
        begin
         FKCad_Entidade  := Result.FieldByName( 'KCAD_ENTIDADE' ).Value ;
         edEntidade.Text := Result.FieldByName( 'NOME' ).Value ;
        end ;
    finally
      free ;
    end ;
end;

procedure TFin_BaixaAReceberWizard._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( FDBGridResultados, DBGridResultados.Title );
  inherited;
end;

procedure TFin_BaixaAReceberWizard._actNextExecute(Sender: TObject);
var
 i : integer ;
begin
  with Fin_BaixaAReceberDatamodule do
    begin
      SetParam( edDataInicial.Date, edDataFinal.Date, FSelectedTipoTitulo, FKCad_Entidade );

  case FSelectedTipoTitulo of
   ttAReceber   : DBGridResultados.Title := Format( 'Titulos a receber - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
   ttRecebidos  : DBGridResultados.Title := Format( 'Titulos a recebidos - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
   ttAmbos      : DBGridResultados.Title := Format( 'Titulos a receber/recebidos - %s a  %s', [ FormatDateTime( 'dd.mm.yyyy', edDataInicial.Date ), FormatDateTime( 'dd.mm.yyyy', edDataFinal.Date ) ] ) ;
  end;


  with Fin_BaixaAReceberDatamodule do
    begin              // Volts eh foda manooo... :D
      for i := 0 to DBGridResultados.Columns.Count - 1 do
        begin
          if DBGridResultados.Columns[i].FieldName = cdsBaixaAReceberPAGO.FieldName then
            DBGridResultados.Columns[i].Visible := FSelectedTipoTitulo >= ttRecebidos ;

          if DBGridResultados.Columns[i].FieldName = cdsBaixaAReceberPAGTO.FieldName then
            DBGridResultados.Columns[i].Visible := FSelectedTipoTitulo >= ttRecebidos ;
        end;
    end;


      OpenTables;
    end;

  inherited;
end;

procedure TFin_BaixaAReceberWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TFin_BaixaAReceberWizard ) ;

end.
