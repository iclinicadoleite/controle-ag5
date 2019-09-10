unit UfrmFIN_PlanoContasEspeciais;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application, VirtualTrees, DTDBTreeView,
  DTClientTree, Data.DB, Tc.Data.DB.Helpers, UdtmFIN_PlanoContasEspeciais, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.Mask,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Tc.VCL.Edits.DBControls
  , CL.Ag5.NSMsgs
  , UFIN.DRE.Utils
  , Wrappers ;

type

  TfrmFIN_PlanoContasEspeciais = class(T_FormWizard)
    TabSheet1: TTabSheet;
    dsPlanoContasEspeciais: TDataSource;
    GridPlanoContasEspeciais: TJvDBUltimGrid;
    edtPlanoContaEqv: TTcDBComboEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtReceitaBruta: TEdit;
    edtDeducoesVenda: TEdit;
    edtDespesaCusto: TEdit;
    edtInvestimentos: TEdit;
    edtAmortizacao: TEdit;
    edtDepreciacao: TEdit;
    edtResultadoFinanceiro: TEdit;
    Label9: TLabel;
    edtResultadoNaoOperacional: TEdit;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure GridPlanoContasEspeciaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtPlanoContaEqvButtonClick(Sender: TObject);
    procedure GridPlanoContasEspeciaisShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure edtPlanoContaEqvKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FPlanos : TStrings ;
    dtmFIN_PlanoContasEspeciais : TdtmFIN_PlanoContasEspeciais;
    procedure GetDREList ( AMsg : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

uses
    System.Generics.Collections
  , UFIN_ApropriacaoDialog
  , CLAg5SvcFinanceiroApropriacao
  , SearchsFinanceiro ;


{$R *.dfm}

{ TfrmCustomWizard }


constructor TfrmFIN_PlanoContasEspeciais.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui

  dtmFIN_PlanoContasEspeciais := TdtmFIN_PlanoContasEspeciais.Create ( self ) ;
  dsPlanoContasEspeciais.DataSet :=  dtmFIN_PlanoContasEspeciais.cdsPlanoContasEspeciais;
  dtmFIN_PlanoContasEspeciais.OpenTables ;

  GridPlanoContasEspeciais.ReadOnly := dtmFIN_PlanoContasEspeciais.GetTipoPlanoContas < 1;
  FPlanos := TStringList.Create ;

  TCLAg5NSMsgGetResultListPlanosDRE.Subscribe( GetDREList );
  TCLAg5NSMsgGetListPlanosDRE.CreateAndDispatch( nil ) ;
end;

destructor TfrmFIN_PlanoContasEspeciais.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  TCLAg5NSMsgGetResultListPlanosDRE.UnSubscribe( GetDREList );
  FPlanos.Free ;
  inherited;
end;

procedure TfrmFIN_PlanoContasEspeciais.edtPlanoContaEqvButtonClick(
  Sender: TObject);
begin

  with dtmFIN_PlanoContasEspeciais, TSearchPlanoContas.Create do
     try
        TextToFind := edtPlanoContaEqv.Text ;
        if Execute then
          begin
             SetContaEquivalente(
                Result.FieldByName( 'KFIN_PLANOCONTA' ).asString,
                Result.FieldByName( 'CLASSIFICACAO' ).asString,
                Result.FieldByName( 'NOME' ).asString );
          end ;
     finally
        free ;
     end ;

end;

procedure TfrmFIN_PlanoContasEspeciais.edtPlanoContaEqvKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      edtPlanoContaEqv.DoClick;
    end;
end;

class function TfrmFIN_PlanoContasEspeciais.Execute : boolean;
var
  ThisForm: TfrmFIN_PlanoContasEspeciais;
begin
  ThisForm := TfrmFIN_PlanoContasEspeciais.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;



procedure TfrmFIN_PlanoContasEspeciais.GetDREList(AMsg: TCLAg5NSMsg);
begin
  FPlanos.Text :=  TCLAg5NSMsgGetResultListPlanosDRE( AMsg ).Planos ;

  var Edits := TArray<TEdit>.Create
  (
     edtReceitaBruta
    ,edtDeducoesVenda
    ,edtDespesaCusto
    ,edtAmortizacao
    ,edtInvestimentos
    ,edtDepreciacao
    ,edtResultadoFinanceiro
    ,edtResultadoNaoOperacional
  ) ;

  for var LPlano := Low( TPlanoContasDRE ) to High( TPlanoContasDRE ) do
     Edits[ Ord( LPlano ) ].Text := FPlanos[ Ord( LPlano ) ] ;

end;

procedure TfrmFIN_PlanoContasEspeciais.GridPlanoContasEspeciaisDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'NOME') then
   begin
     GridPlanoContasEspeciais.Canvas.Font.Style := [fsbold];
     GridPlanoContasEspeciais.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmFIN_PlanoContasEspeciais.GridPlanoContasEspeciaisShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := Field.FieldName = 'DESCR_PC_NOME';
end;



procedure TfrmFIN_PlanoContasEspeciais._actExecuteExecute(Sender: TObject);
begin
  inherited;
  dtmFIN_PlanoContasEspeciais.ApplyUpdates;

  var Edits := TArray<TEdit>.Create
  (
     edtReceitaBruta
    ,edtDeducoesVenda
    ,edtDespesaCusto
    ,edtAmortizacao
    ,edtInvestimentos
    ,edtDepreciacao
    ,edtResultadoFinanceiro
    ,edtResultadoNaoOperacional
  ) ;

  for var LPlano := Low( TPlanoContasDRE ) to High( TPlanoContasDRE ) do
     FPlanos[ Ord( LPlano ) ] := Edits[ Ord( LPlano ) ].Text ;

  with TCLAg5NSMsgSetListPlanosDRE.Create( nil ) do
    begin
      Planos := FPlanos.Text ;
      Dispatch
    end;
end;

procedure TfrmFIN_PlanoContasEspeciais._actNextExecute(Sender: TObject);
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

procedure TfrmFIN_PlanoContasEspeciais._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TfrmFIN_PlanoContasEspeciais ) ;

end.
