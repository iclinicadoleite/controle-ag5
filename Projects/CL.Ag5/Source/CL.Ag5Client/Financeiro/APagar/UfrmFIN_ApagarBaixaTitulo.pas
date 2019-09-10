unit UfrmFIN_ApagarBaixaTitulo;

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
  JvBaseEdits, SysFormEditaLista, FIN_APagarTypes, JvImage,
  JvExtComponent, JvPanel, SysFormDialog, UdtmFIN_ApagarBaixaTitulo,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Controls.GDIButton, System.Actions, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Tc.VCL.FloatPanel, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TfrmFIN_ApagarBaixaTitulo = class(T_FormDialog)
    dtsFicha : TDataSource ;
    btnOk: TTcGDIButton;
    btbCancel: TTcGDIButton;
    pnlSuperior: TPanel;
    Label2: TLabel;
    DBEdit3: TDBText;
    Label8: TLabel;
    DBEdit5: TDBText;
    Label6: TLabel;
    DBEdit2: TDBText;
    Label7: TLabel;
    DBEdit1: TDBText;
    GroupBox2: TGroupBox;
    lblConta: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    dbDataPgto: TTcDBDateEdit;
    Label3: TLabel;
    edtPago: TTcDBCalcEdit;
    dbcbCheque: TDBCheckBox;
    Label10: TLabel;
    dbHistorico: TDBEdit;
    actEstornar: TAction;
    btbEstornar: TTcGDIButton;
    actBaixar: TAction;
    pnlCentroCustos: TTcCaptionedPanel;
    dbgCentroCustos: TJvDBUltimGrid;
    dbtTotalPorcentagem: TDBText;
    Label13: TLabel;
    btnRemoveCentro: TTcGDIButton;
    btnAdicionaCentro: TTcGDIButton;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBText4: TDBText;
    dtsApropriacao: TDataSource;
    JvDBCalcEdit1: TTcDBCalcEdit;
    edtValor: TTcDBCalcEdit;
    edVencto: TTcDBDateEdit;
    DBEdit4: TDBEdit;
    procedure edtPagoChange(Sender: TObject);
    procedure actEstornarExecute(Sender: TObject);
    procedure actEstornarUpdate(Sender: TObject);
    procedure actBaixarExecute(Sender: TObject);
    procedure actBaixarUpdate(Sender: TObject);
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
    FKFIN_APagar_PARCELA : string ;
    DatamoduleBase : TdtmFIN_ApagarBaixaTitulo ;
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

procedure TfrmFIN_ApagarBaixaTitulo.Estornar;
begin
  if MessageDlg ( 'Confirma estorno do Titulo?', mtConfirmation ) <> mrYes then
    exit ;
  DatamoduleBase.Estornar ;

  edtValor.Visible := ( TdtmFIN_ApagarBaixaTitulo( DatamoduleBase ).cdsAPagarParcelaPROVISAO.asBoolean ) ;
  edVencto.Visible := edtValor.Visible ;

  if edtValor.Visible then
    edtValor.SetFocus
  else
    edtPago.SetFocus ;

end;

class function TfrmFIN_ApagarBaixaTitulo.Execute( var BaixaTitulo : TBaixaTitulo ) : boolean ;
var
  frmFIN_ApagarBaixaTitulo: TfrmFIN_ApagarBaixaTitulo;
begin
  frmFIN_ApagarBaixaTitulo := TfrmFIN_ApagarBaixaTitulo.Create ( nil ) ;

  with frmFIN_ApagarBaixaTitulo do
    try
      //ClientHeight := 335;
      FKFIN_APagar_PARCELA := BaixaTitulo.KParcela ;
      OpenData ;

      edtValor.Visible :=   ( not DatamoduleBase.TituloPago )
                        and ( TdtmFIN_ApagarBaixaTitulo( DatamoduleBase ).cdsAPagarParcelaPROVISAO.asBoolean ) ;
      edVencto.Visible := edtValor.Visible ;

      Result := ( ShowModal = mrOK ) ;

      if Result then
        begin
          with DatamoduleBase do
            begin
              BaixaTitulo.Data      := cdsAPagarParcelaPAGTO.asDateTime ;
              BaixaTitulo.Pago      := cdsAPagarParcelaPAGO.AsCurrency ;
              BaixaTitulo.NomeConta := cdsAPagarParcelaNOMECONTA.asString ;
            end ;
        end ;
    finally
      Free ;
    end;
end;

procedure TfrmFIN_ApagarBaixaTitulo.FormShow(Sender: TObject);
begin
  inherited;
  if edtValor.Visible then
    edtValor.SetFocus
  else
    edtPago.SetFocus ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.OpenData;
begin
   TdtmFIN_ApagarBaixaTitulo( DatamoduleBase ).SetParams( FKFIN_APagar_PARCELA );
   DatamoduleBase.OpenTables ;
   DatamoduleBase.EditRecord ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.SearchCentroCusto(TextToSearch: string);
begin
  with TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto, TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin

          if not(TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.State in [dsInsert, dsEdit]) then
            TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Edit;

          FieldByName('KFIN_CENTROCUSTO').asString := Result.FieldByName('KFIN_CENTROCUSTO').asString;
          //FieldByName('CLASSIFICACAO').asString    := Result.FieldByName('CLASSIFICACAO').asString;
          FieldByName('NOME').asString             := Result.FieldByName('NOME').asString;
          FieldByName('CODIGO').AsInteger          := Result.FieldByName('CODIGO').AsInteger;
        end;
    finally
      free;
    end;
end;

procedure TfrmFIN_ApagarBaixaTitulo.actBaixarExecute(Sender: TObject);
begin
  if (assigned(Screen.ActiveControl)) then
    SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  DataModuleBase.Baixar ;
  modalResult := mrOK ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.actBaixarUpdate(Sender: TObject);
begin
  actBaixar.Enabled := not DatamoduleBase.TituloPago
                     and not DatamoduleBase.cdsAPagarParcelaPAGTO.IsNull
                     and (DatamoduleBase.cdsAPagarParcelaPAGO.asFloat >= 0) ;

end;

procedure TfrmFIN_ApagarBaixaTitulo.actEstornarExecute(Sender: TObject);
begin
  Estornar ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.actEstornarUpdate(Sender: TObject);
begin
  actEstornar.Enabled := DatamoduleBase.TituloPago ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.btnAdicionaCentroClick(Sender: TObject);
begin
  if not( TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.State in [ dsInsert, dsEdit ] ) then
    TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Edit;

  TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Append;
  dbgCentroCustos.SetFocus;
  dbgCentroCustos.SelectedIndex := 0 ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.btnRemoveCentroClick(Sender: TObject);
begin
  if TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Eof then
    Exit;

  TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto.Delete;
end;

constructor TfrmFIN_ApagarBaixaTitulo.Create(AOwner: TComponent);
begin
  inherited;
  DatamoduleBase        := TdtmFIN_ApagarBaixaTitulo.Create ( self ) ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.dbgCentroCustosEditButtonClick(
  Sender: TObject);
begin
  with dbgCentroCustos, TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if (SelectedField = FieldByName('NOME')) or (SelectedField = FieldByName('CODIGO')) { or (SelectedField = FieldByName('CLASSIFICACAO')) } then
      SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_ApagarBaixaTitulo.dbgCentroCustosExit(Sender: TObject);
begin
  TCDSSuppl.PostIfNeed ( TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto ) ;
end;

procedure TfrmFIN_ApagarBaixaTitulo.dbgCentroCustosKeyPress(Sender: TObject;
  var Key: Char);
begin
  with dbgCentroCustos, TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if (Key = #13) and Assigned(InplaceEditor) and (InplaceEditor.Visible) then
      if (SelectedField = FieldByName('CODIGO')) or (SelectedField = FieldByName('NOME')) {or (SelectedField = FieldByName('CLASSIFICACAO'))} then
        SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_ApagarBaixaTitulo.dbgCentroCustosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid( Sender ), TdtmFIN_APagarBaixaTitulo( DatamoduleBase ).cdsApropriacaoJuroDesconto do
    if  ( Field = FieldByName( 'PORCENTAGEM' ) ) then
      AllowEdit := ( not FieldByName( 'KFIN_CENTROCUSTO' ).IsNull );
end;

procedure TfrmFIN_ApagarBaixaTitulo.edtPagoChange(Sender: TObject);
begin
  inherited;
//  edtSaldo.Value := TdtmFIN_ApagarBaixaTitulo( DatamoduleBase ).cdsAPagarParcelaVALOR.asCurrency - edtPago.Value ;
end;

end.
