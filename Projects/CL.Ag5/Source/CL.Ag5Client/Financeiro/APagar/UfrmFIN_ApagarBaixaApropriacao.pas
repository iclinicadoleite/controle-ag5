unit UfrmFIN_ApagarBaixaApropriacao;

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
  JvExtComponent, JvPanel, SysFormDialog, UFin_BaixaAPagarColetivoDatamodule,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Controls.GDIButton, System.Actions, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Tc.VCL.FloatPanel, Tc.VCL.Edits.Numbers, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TfrmFIN_ApagarBaixaApropriacao = class(T_FormDialog)
    dtsFicha : TDataSource ;
    btnOk: TTcGDIButton;
    btbCancel: TTcGDIButton;
    pnlSuperior: TPanel;
    Label2: TLabel;
    DBEdit3: TDBText;
    Label6: TLabel;
    DBEdit2: TDBText;
    Label7: TLabel;
    DBEdit1: TDBText;
    actEstornar: TAction;
    actOK: TAction;
    pnlCentroCustos: TTcCaptionedPanel;
    dbgCentroCustos: TJvDBUltimGrid;
    dbtTotalPorcentagem: TDBText;
    Label13: TLabel;
    btnRemoveCentro: TTcGDIButton;
    btnAdicionaCentro: TTcGDIButton;
    Label1: TLabel;
    DBText4: TDBText;
    dtsApropriacao: TDataSource;
    JvDBCalcEdit1: TTcDBCalcEdit;
    procedure edtPagoChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
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
    FDatamodule :  TFin_BaixaAPagarColetivoDatamodule ;
    procedure SearchCentroCusto(TextToSearch: string);
  public
    { Public declarations }
    class function Execute ( ADatamodule :  TFin_BaixaAPagarColetivoDatamodule ) : boolean ;
    constructor Create ( AOwner : TComponent ; ADatamodule :  TFin_BaixaAPagarColetivoDatamodule ) ;
  end;

implementation

uses Tc.VCL.Dialogs, SearchsFinanceiro, Data.SQLTimSt, CDSSuppl ;

{$R *.DFM}


class function TfrmFIN_ApagarBaixaApropriacao.Execute( ADatamodule :  TFin_BaixaAPagarColetivoDatamodule ) : boolean ;
var
  frmFIN_ApagarBaixaApropriacao: TfrmFIN_ApagarBaixaApropriacao;
begin
  frmFIN_ApagarBaixaApropriacao := TfrmFIN_ApagarBaixaApropriacao.Create ( nil, ADatamodule ) ;

  with frmFIN_ApagarBaixaApropriacao do
    try
      
      Result := ( ShowModal = mrOK ) ;

      if Result then
        begin
          with FDatamodule do
            begin
//              BaixaTitulo.Data      := cdsAPagarParcelaPAGTO.asDateTime ;
//              BaixaTitulo.Pago      := cdsAPagarParcelaPAGO.AsCurrency ;
//              BaixaTitulo.NomeConta := cdsAPagarParcelaNOMECONTA.asString ;
            end ;
        end ;
    finally
      Free ;
    end;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.FormShow(Sender: TObject);
begin
  inherited;
 // set focus
end;


procedure TfrmFIN_ApagarBaixaApropriacao.SearchCentroCusto(TextToSearch: string);
begin
  with FDatamodule.cdsApropriacaoJuroDesconto, TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin

          if not(FDatamodule.cdsApropriacaoJuroDesconto.State in [dsInsert, dsEdit]) then
            FDatamodule.cdsApropriacaoJuroDesconto.Edit;

          FieldByName('KFIN_CENTROCUSTO').asString := Result.FieldByName('KFIN_CENTROCUSTO').asString;
          //FieldByName('CLASSIFICACAO').asString    := Result.FieldByName('CLASSIFICACAO').asString;
          FieldByName('NOME').asString             := Result.FieldByName('NOME').asString;
          FieldByName('CODIGO').AsInteger          := Result.FieldByName('CODIGO').AsInteger;
        end;
    finally
      free;
    end;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.actOKExecute(Sender: TObject);
begin
  if (assigned(Screen.ActiveControl)) then
    SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  //FDatamodule.Baixar ;
  modalResult := mrOK ;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.btnAdicionaCentroClick(Sender: TObject);
begin
  if not( FDatamodule.cdsApropriacaoJuroDesconto.State in [ dsInsert, dsEdit ] ) then
    FDatamodule.cdsApropriacaoJuroDesconto.Edit;

  FDatamodule.cdsApropriacaoJuroDesconto.Append;
  dbgCentroCustos.SetFocus;
  dbgCentroCustos.SelectedIndex := 0 ;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.btnRemoveCentroClick(Sender: TObject);
begin
  if FDatamodule.cdsApropriacaoJuroDesconto.Eof then
    Exit;

  FDatamodule.cdsApropriacaoJuroDesconto.Delete;
end;

constructor TfrmFIN_ApagarBaixaApropriacao.Create(AOwner: TComponent; ADatamodule :  TFin_BaixaAPagarColetivoDatamodule ) ;
begin
  inherited Create( AOwner );
  FDatamodule := ADatamodule ;
  dtsFicha.dataSet := FDatamodule.cdsBaixaAPagar ;
  dtsApropriacao.dataSet := FDatamodule.cdsApropriacaoJuroDesconto ;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.dbgCentroCustosEditButtonClick(
  Sender: TObject);
begin
  with dbgCentroCustos, FDatamodule.cdsApropriacaoJuroDesconto do
    if (SelectedField = FieldByName('NOME')) or (SelectedField = FieldByName('CODIGO')) { or (SelectedField = FieldByName('CLASSIFICACAO')) } then
      SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_ApagarBaixaApropriacao.dbgCentroCustosExit(Sender: TObject);
begin
  TCDSSuppl.PostIfNeed ( FDatamodule.cdsApropriacaoJuroDesconto ) ;
end;

procedure TfrmFIN_ApagarBaixaApropriacao.dbgCentroCustosKeyPress(Sender: TObject;
  var Key: Char);
begin
  with dbgCentroCustos, FDatamodule.cdsApropriacaoJuroDesconto do
    if (Key = #13) and Assigned(InplaceEditor) and (InplaceEditor.Visible) then
      if (SelectedField = FieldByName('CODIGO')) or (SelectedField = FieldByName('NOME')) {or (SelectedField = FieldByName('CLASSIFICACAO'))} then
        SearchCentroCusto(InplaceEditor.Text);
end;

procedure TfrmFIN_ApagarBaixaApropriacao.dbgCentroCustosShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid( Sender ), FDatamodule.cdsApropriacaoJuroDesconto do
    if  ( Field = FieldByName( 'PORCENTAGEM' ) ) then
      AllowEdit := ( not FieldByName( 'KFIN_CENTROCUSTO' ).IsNull );
end;

procedure TfrmFIN_ApagarBaixaApropriacao.edtPagoChange(Sender: TObject);
begin
  inherited;
//  edtSaldo.Value := FDatamodule.cdsAPagarParcelaVALOR.asCurrency - edtPago.Value ;
end;

end.
