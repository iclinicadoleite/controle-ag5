unit UZoo_TrocaRetirosLotesWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application,
  UZoo_TrocaRetirosLotesDatamodule,  Data.DB, Tc.Data.DB.Helpers, JvExStdCtrls, JvCombobox, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.Mask,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Wrappers ;

type
  TZooTrocaRetirosLotesWizard = class(T_FormWizard)
    dtsOrigem: TDataSource;
    dtsDestino: TDataSource;
    pnlOrigem: TPanel;
    gbOrigem: TGroupBox;
    pnlFieldsOri: TPanel;
    lblRetiroOri: TLabel;
    lblLoteOri: TLabel;
    lblPesquisarOri: TLabel;
    jvcbxRetiroOri: TJvComboBox;
    jvcbxLoteOri: TJvComboBox;
    edtPesqBrincoOri: TEdit;
    JvDBUltimGridOrigem: TJvDBUltimGrid;
    pnlDestino: TPanel;
    pnlBotoes: TPanel;
    btbSelecionarTodos: TTcGDIButton;
    btbSelecionar: TTcGDIButton;
    btbDesselecionar: TTcGDIButton;
    btbDesselecionarTodos: TTcGDIButton;
    gbDestino: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    jvcbxRetiroDes: TJvComboBox;
    jvcbxLoteDes: TJvComboBox;
    deDataTroca: TTcDateEdit;
    JvDBUltimGridDestino: TJvDBUltimGrid;
    TabSheet1: TTabSheet;
    lblTotalAnimaisOri: TLabel;
    lblTotalAnimaisDes: TLabel;
    lblAnimaisSelecionados: TLabel;
    lblExistentesDes: TLabel;
    lblTotal: TLabel;
    lblSelecionados: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure btbSelecionarClick(Sender: TObject);
    procedure btbDesselecionarClick(Sender: TObject);
    procedure btbSelecionarTodosClick(Sender: TObject);
    procedure btbDesselecionarTodosClick(Sender: TObject);
    procedure dtsDestinoDataChange(Sender: TObject; Field: TField);
    procedure dtsOrigemDataChange(Sender: TObject; Field: TField);
    procedure edtPesqBrincoOriChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure JvDBUltimGridOrigemDblClick(Sender: TObject);
    procedure JvDBUltimGridDestinoDblClick(Sender: TObject);
    procedure jvcbxRetiroOriChange(Sender: TObject);
    procedure jvcbxLoteOriChange(Sender: TObject);
    procedure jvcbxRetiroOriKeyPress(Sender: TObject; var Key: Char);
    procedure jvcbxLoteOriKeyPress(Sender: TObject; var Key: Char);
    procedure jvcbxRetiroDesChange(Sender: TObject);
    procedure jvcbxLoteDesChange(Sender: TObject);
  private
    { Private declarations }
    ZooTrocaRetirosLotesDatamodule: TZooTrocaRetirosLotesDatamodule;
    FQtdeAnimaisDestino : Integer;
    procedure LoadRetiros( ACombobox: TComponent );
    procedure LoadLotes  ( ACombobox: TComponent );
    procedure SetParams;
    procedure SetParamsDestino;
    procedure LoadData;
    procedure UpdateTotais;
    procedure CountAnimaisDestino;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZooTrocaRetirosLotesWizard.btbDesselecionarClick(Sender: TObject);
begin
  ZooTrocaRetirosLotesDatamodule.Desselecionar;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.btbDesselecionarTodosClick(
  Sender: TObject);
begin
  ZooTrocaRetirosLotesDatamodule.DesselecionarTodos;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.btbSelecionarClick(Sender: TObject);
begin
  ZooTrocaRetirosLotesDatamodule.Selecionar;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.btbSelecionarTodosClick(Sender: TObject);
begin
  ZooTrocaRetirosLotesDatamodule.SelecionarTodos;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.CountAnimaisDestino;
begin
  SetParamsDestino;
  ZooTrocaRetirosLotesDatamodule.CountAnimaisDestino;
  FQtdeAnimaisDestino := ZooTrocaRetirosLotesDatamodule.QtdeAnimaisDestino;
end;

constructor TZooTrocaRetirosLotesWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  ZooTrocaRetirosLotesDatamodule:= TZooTrocaRetirosLotesDatamodule.Create( Self );
  dtsOrigem.DataSet := ZooTrocaRetirosLotesDatamodule.cdsAnimaisOrigem;
  dtsDestino.DataSet := ZooTrocaRetirosLotesDatamodule.cdsAnimaisDestino;
  LoadRetiros( jvcbxRetiroOri );
  LoadRetiros( jvcbxRetiroDes );
  LoadLotes( jvcbxLoteOri );
  LoadLotes( jvcbxLoteDes );
  btbSelecionar.Enabled := not  TClientDataSet(dtsOrigem.DataSet).IsEmpty;
  btbSelecionarTodos.Enabled := not  TClientDataSet(dtsOrigem.DataSet).IsEmpty;
  lblTotalAnimaisOri.Caption     := '';
  lblTotalAnimaisDes.Caption     := '';
  lblTotal.Caption               := '';
  lblAnimaisSelecionados.Caption := '';
  lblSelecionados.Caption        := '';
  lblExistentesDes.Caption       := '';
  FQtdeAnimaisDestino            :=  0;
  if (jvcbxRetiroOri.CanFocus) and (jvcbxRetiroOri.Showing) then
    jvcbxRetiroOri.SetFocus;
end;

destructor TZooTrocaRetirosLotesWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZooTrocaRetirosLotesWizard.dtsDestinoDataChange(Sender: TObject;
  Field: TField);
begin
  btbDesselecionar.Enabled := not  TClientDataSet(dtsDestino.DataSet).IsEmpty;
  btbDesselecionarTodos.Enabled := not  TClientDataSet(dtsDestino.DataSet).IsEmpty;
end;

procedure TZooTrocaRetirosLotesWizard.dtsOrigemDataChange(Sender: TObject;
  Field: TField);
begin
  btbSelecionar.Enabled := not  TClientDataSet(dtsOrigem.DataSet).IsEmpty;
  btbSelecionarTodos.Enabled := not  TClientDataSet(dtsOrigem.DataSet).IsEmpty;
end;

procedure TZooTrocaRetirosLotesWizard.edtPesqBrincoOriChange(Sender: TObject);
begin
  inherited;
  with ZooTrocaRetirosLotesDatamodule do
   begin
      if Trim(edtPesqBrincoOri.Text) <> '' then
       begin
         cdsAnimaisOrigem.Locate('BRINCO',edtPesqBrincoOri.Text,[loPartialKey]);
       end;
   end;
end;

class function TZooTrocaRetirosLotesWizard.Execute : boolean;
var
  ThisForm: TZooTrocaRetirosLotesWizard;
begin
  ThisForm := TZooTrocaRetirosLotesWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZooTrocaRetirosLotesWizard.FormResize(Sender: TObject);
begin
  inherited;
  pnlOrigem.Width := Trunc(Self.ClientWidth/2)- pnlBotoes.Width;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxLoteDesChange(Sender: TObject);
begin
  CountAnimaisDestino;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxLoteOriChange(Sender: TObject);
begin
  LoadData;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxLoteOriKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    LoadData;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxRetiroDesChange(Sender: TObject);
begin
  inherited;
  CountAnimaisDestino;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxRetiroOriChange(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TZooTrocaRetirosLotesWizard.jvcbxRetiroOriKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    LoadData;
end;

procedure TZooTrocaRetirosLotesWizard.JvDBUltimGridDestinoDblClick(
  Sender: TObject);
begin
  inherited;
  ZooTrocaRetirosLotesDatamodule.Desselecionar;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.JvDBUltimGridOrigemDblClick(
  Sender: TObject);
begin
  ZooTrocaRetirosLotesDatamodule.Selecionar;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.LoadData;
begin
  edtPesqBrincoOri.Clear;
  SetParams;
  ZooTrocaRetirosLotesDatamodule.OpenTables;
  CountAnimaisDestino;
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard.LoadLotes(ACombobox: TComponent);
var i: Integer;
begin
  TJvCombobox( ACombobox ).Clear;

  if TJvCombobox( ACombobox ) = jvcbxLoteOri then
     TJvCombobox( ACombobox ).Items.Add('<Todos>');

  with ZooTrocaRetirosLotesDatamodule do
   begin
     for I := 0 to ListaLotes.Count - 1 do
      begin
        TJvCombobox( ACombobox ).Items.Add(ListaLotes[I]);
      end;
   end;

  if TJvCombobox( ACombobox ) = jvcbxLoteOri then
    TJvCombobox( ACombobox ).ItemIndex := 0;

end;

procedure TZooTrocaRetirosLotesWizard.LoadRetiros(ACombobox: TComponent);
var i: Integer;
begin
  TJvCombobox( ACombobox ).Clear;

  if TJvCombobox( ACombobox ) = jvcbxRetiroOri then
     TJvCombobox( ACombobox ).Items.Add('<Todos>');

  with ZooTrocaRetirosLotesDatamodule do
   begin
     for I := 0 to ListaRetiros.Count - 1 do
      begin
        TJvCombobox( ACombobox ).Items.Add(ListaRetiros[I]);
      end;
   end;

  if TJvCombobox( ACombobox ) = jvcbxRetiroOri then
    TJvCombobox( ACombobox ).ItemIndex := 0;
end;

procedure TZooTrocaRetirosLotesWizard.SetParams;
begin
  if jvcbxRetiroOri.ItemIndex = 0 then
    ZooTrocaRetirosLotesDatamodule.AllRetiroOri  := 'T'
  else
    ZooTrocaRetirosLotesDatamodule.AllRetiroOri  := 'F';

  if jvcbxLoteOri.ItemIndex = 0 then
    ZooTrocaRetirosLotesDatamodule.AllLoteOri    := 'T'
  else
    ZooTrocaRetirosLotesDatamodule.AllLoteOri    := 'F';

  ZooTrocaRetirosLotesDatamodule.RetiroOri       := jvcbxRetiroOri.Text;
  ZooTrocaRetirosLotesDatamodule.LoteOri         := jvcbxLoteOri.Text;
  ZooTrocaRetirosLotesDatamodule.RetiroOriIsNull := jvcbxRetiroOri.Text = '';
  ZooTrocaRetirosLotesDatamodule.LoteOriIsNull   := jvcbxLoteOri.Text = '';
end;

procedure TZooTrocaRetirosLotesWizard.SetParamsDestino;
begin

  ZooTrocaRetirosLotesDatamodule.AllRetiroDes  := 'F';

  ZooTrocaRetirosLotesDatamodule.AllLoteDes    := 'F';

  ZooTrocaRetirosLotesDatamodule.RetiroDes       := jvcbxRetiroDes.Text;
  ZooTrocaRetirosLotesDatamodule.LoteDes         := jvcbxLoteDes.Text;
  ZooTrocaRetirosLotesDatamodule.RetiroDesIsNull := jvcbxRetiroDes.Text = '';
  ZooTrocaRetirosLotesDatamodule.LoteDesIsNull   := jvcbxLoteDes.Text = '';
end;

procedure TZooTrocaRetirosLotesWizard.UpdateTotais;
begin
  lblTotalAnimaisOri.Caption := Format('Total de animais : %d',
                                       [  ZooTrocaRetirosLotesDatamodule.cdsAnimaisOrigem.RecordCount ]);

  lblTotalAnimaisDes.Caption := Format('Total :', []);

  lblTotal.Caption           := Format('%d',
                                     [ ZooTrocaRetirosLotesDatamodule.cdsAnimaisDestino.RecordCount + FQtdeAnimaisDestino ]);

  lblAnimaisSelecionados.Caption := Format('Selecionados :',[]);

  lblSelecionados.Caption    := Format('%d',
                                    [  ZooTrocaRetirosLotesDatamodule.cdsAnimaisDestino.RecordCount ]);

  lblExistentesDes.Caption   := Format('Existentes no lote/retiro : %d',[FQtdeAnimaisDestino]);

  Application.ProcessMessages;
end;

procedure TZooTrocaRetirosLotesWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  edtPesqBrincoOri.Clear;
  ZooTrocaRetirosLotesDatamodule.RetiroDes := jvcbxRetiroDes.Text;
  ZooTrocaRetirosLotesDatamodule.LoteDes   := jvcbxLoteDes.Text;
  ZooTrocaRetirosLotesDatamodule.DataTroca := deDataTroca.Date;
  if ZooTrocaRetirosLotesDatamodule.Process then
    MessageDlg ( 'Salvo com sucesso.' ) ;
  LoadRetiros( jvcbxRetiroOri );
  LoadRetiros( jvcbxRetiroDes );
  LoadLotes( jvcbxLoteOri );
  LoadLotes( jvcbxLoteDes );
  UpdateTotais;
end;

procedure TZooTrocaRetirosLotesWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := not dtsDestino.DataSet.IsEmpty;
end;

procedure TZooTrocaRetirosLotesWizard._actNextExecute(Sender: TObject);
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

procedure TZooTrocaRetirosLotesWizard._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZooTrocaRetirosLotesWizard ) ;

end.
