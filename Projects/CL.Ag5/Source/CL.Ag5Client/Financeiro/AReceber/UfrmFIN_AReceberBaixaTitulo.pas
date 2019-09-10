unit UfrmFIN_AReceberBaixaTitulo;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin,
  Data.DB, Tc.Data.DB.Helpers, VCL.Menus, VCL.Mask, VCL.DBCtrls, JvExExtCtrls,
  JvDBDotNetControls, JvExMask, JvToolEdit,
  JvExControls, JvXPCore, JvXPContainer, JvXPBar,
  JvExStdCtrls, JvDBCombobox, JvDBControls, JvDBCheckBox,
  JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  SysFormEditaLista, JvBaseEdits, FIN_AReceberTypes, JvImage,
  JvExtComponent, JvPanel, SysFormDialog,
  UdtmFIN_AReceberBaixaTitulo, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Controls.GDIButton, System.Actions, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Tc.VCL.FloatPanel, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TfrmFIN_AReceberBaixaTitulo = class(T_FormDialog)
    BtnOk: TTcGDIButton;
    btbCancel: TTcGDIButton;
    dtsFicha: TDataSource;
    pnlSuperior: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    DBEdit5: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dblcCC: TDBLookupComboBox;
    Label12: TLabel;
    dbHistorico: TDBEdit;
    Label5: TLabel;
    edtData: TTcDBDateEdit;
    Label3: TLabel;
    edtRecebido: TJvDBCalcEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    dbcbCheque: TDBCheckBox;
    actEstornar: TAction;
    actBaixar: TAction;
    btbEstornar: TTcGDIButton;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    dtsApropriacao: TDataSource;
    pnlCentroCustos: TTcCaptionedPanel;
    dbtTotalPorcentagem: TDBText;
    Label13: TLabel;
    DBText4: TDBText;
    Label7: TLabel;
    dbgCentroCustos: TJvDBUltimGrid;
    btnAdicionaCentro: TTcGDIButton;
    btnRemoveCentro: TTcGDIButton;
    JvDBCalcEdit1: TJvDBCalcEdit;
    edtValor: TTcDBCalcEdit;
    edVencto: TTcDBDateEdit;
    DBEdit1: TDBEdit;
    procedure edtRecebidoChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure actBaixarUpdate(Sender: TObject);
    procedure actBaixarExecute(Sender: TObject);
    procedure actEstornarExecute(Sender: TObject);
    procedure actEstornarUpdate(Sender: TObject);
    procedure btnAdicionaCentroClick(Sender: TObject);
    procedure btnRemoveCentroClick(Sender: TObject);
    procedure dbgCentroCustosEditButtonClick(Sender: TObject);
    procedure dbgCentroCustosExit(Sender: TObject);
    procedure dbgCentroCustosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCentroCustosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FNotaFiscal : integer ;
    FKFIN_AReceber_PARCELA : string ;
    DatamoduleBase : TdtmFIN_AReceberBaixaTitulo ;
    procedure OpenData ;
    procedure Estornar ;
    procedure SearchCentroCusto(TextToSearch: string);
  public
    { Public declarations }
    class function Execute ( var BaixaTitulo : TBaixaTitulo ) : boolean ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses Tc.VCL.Dialogs, SearchsFinanceiro, Data.SQLTimSt, CDSSuppl ;

{$R *.DFM}

procedure TfrmFIN_AReceberBaixaTitulo.Estornar;
begin
  if MessageDlg ( 'Confirma estorno do Titulo?', mtConfirmation ) <> mrYes then
    exit ;
  DatamoduleBase.Estornar ;

  edtValor.Visible := ( TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsAReceberParcelaPROVISAO.asBoolean ) ;
  edVencto.Visible  := edtValor.Visible ;
  if edtValor.Visible then
    edtValor.SetFocus
  else
    edtRecebido.SetFocus ;

end;

class function TfrmFIN_AReceberBaixaTitulo.Execute ( var BaixaTitulo : TBaixaTitulo ) : boolean ;
var
  frmFIN_AReceberBaixaTitulo : TfrmFIN_AReceberBaixaTitulo;
begin
  frmFIN_AReceberBaixaTitulo := TfrmFIN_AReceberBaixaTitulo.Create ( nil );

  with frmFIN_AReceberBaixaTitulo do
    try
      //ClientHeight := 335;
      FKFIN_AReceber_PARCELA := BaixaTitulo.KParcela ;
      OpenData ;

      edtValor.Visible :=   ( not DatamoduleBase.TituloPago )
                        and ( TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsAReceberParcelaPROVISAO.asBoolean ) ;
      edVencto.Visible  := edtValor.Visible ;

      Result := ( ShowModal = mrOK ) ;

      if Result then
        begin
           with DatamoduleBase do
             begin
               BaixaTitulo.Data      := cdsAReceberParcelaPAGTO.asDateTime ;
               BaixaTitulo.Recebido  := cdsAReceberParcelaPAGO.AsCurrency ;
               BaixaTitulo.NomeConta := cdsAReceberParcelaNOMECONTA.asString ;
             end ;
        end ;
    finally
      free ;
    end;
end;

procedure TfrmFIN_AReceberBaixaTitulo.FormShow(Sender: TObject);
begin
  inherited;
  if edtValor.Visible then
    edtValor.SetFocus
  else
    edtRecebido.SetFocus ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.OpenData;
begin
   TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).SetParams( FKFIN_AReceber_PARCELA );
   DatamoduleBase.OpenTables ;
   DatamoduleBase.EditRecord ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.SearchCentroCusto(TextToSearch: string);
begin
  with TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto, TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin

          if not(TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.State in [dsInsert, dsEdit]) then
            TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Edit;

          FieldByName('KFIN_CENTROCUSTO').asString := Result.FieldByName('KFIN_CENTROCUSTO').asString;
          //FieldByName('CLASSIFICACAO').asString    := Result.FieldByName('CLASSIFICACAO').asString;
          FieldByName('NOME').asString             := Result.FieldByName('NOME').asString;
          FieldByName('CODIGO').AsInteger          := Result.FieldByName('CODIGO').AsInteger;
        end;
    finally
      free;
    end;
end;

procedure TfrmFIN_AReceberBaixaTitulo.BtnOkClick(Sender: TObject);
var consResult : Integer;
begin
end;

procedure TfrmFIN_AReceberBaixaTitulo.btnRemoveCentroClick(Sender: TObject);
begin
  if TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Eof then
    Exit;

  TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Delete;
end;

procedure TfrmFIN_AReceberBaixaTitulo.actBaixarExecute(Sender: TObject);
begin
  if (assigned(Screen.ActiveControl)) then
    SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  DataModuleBase.Baixar ;
  modalResult := mrOk;
end;

procedure TfrmFIN_AReceberBaixaTitulo.actBaixarUpdate(Sender: TObject);
begin
  actBaixar.Enabled := not DatamoduleBase.TituloPago
                     and not DatamoduleBase.cdsAReceberParcelaPAGTO.IsNull
                     and (DatamoduleBase.cdsAReceberParcelaPAGO.asFloat >= 0) ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.actEstornarExecute(Sender: TObject);
begin
  Estornar ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.actEstornarUpdate(Sender: TObject);
begin
  actEstornar.Enabled := DatamoduleBase.TituloPago ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.btnAdicionaCentroClick(Sender: TObject);
begin
  if not( TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.State in [ dsInsert, dsEdit ] ) then
    TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Edit;

  TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Append;
  dbgCentroCustos.SetFocus;
  dbgCentroCustos.SelectedIndex := 0 ;
end;

constructor TfrmFIN_AReceberBaixaTitulo.Create(AOwner: TComponent);
begin
  inherited ;
  DataModuleBase        := TdtmFIN_AReceberBaixaTitulo.Create ( self ) ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.dbgCentroCustosEditButtonClick(
  Sender: TObject);
begin
  with dbgCentroCustos, TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if (SelectedField = FieldByName('NOME')) or (SelectedField = FieldByName('CODIGO')) { or (SelectedField = FieldByName('CLASSIFICACAO')) } then
      SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_AReceberBaixaTitulo.dbgCentroCustosExit(Sender: TObject);
begin
  TCDSSuppl.PostIfNeed ( TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto ) ;
end;

procedure TfrmFIN_AReceberBaixaTitulo.dbgCentroCustosKeyPress(Sender: TObject;
  var Key: Char);
begin
  with dbgCentroCustos, TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if (Key = #13) and Assigned(InplaceEditor) and (InplaceEditor.Visible) then
      if (SelectedField = FieldByName('CODIGO')) or (SelectedField = FieldByName('NOME')) {or (SelectedField = FieldByName('CLASSIFICACAO'))} then
        SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_AReceberBaixaTitulo.dbgCentroCustosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid( Sender ), TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if  ( Field = FieldByName( 'PORCENTAGEM' ) ) then
      AllowEdit := ( not FieldByName( 'KFIN_CENTROCUSTO' ).IsNull );
end;

procedure TfrmFIN_AReceberBaixaTitulo.edtRecebidoChange(Sender: TObject);
begin
  inherited;
//  edtSaldo.Value := TdtmFIN_AReceberBaixaTitulo( DatamoduleBase ).cdsAReceberParcelaVALOR.asCurrency - edtRecebido.Value ;
end;

end.
