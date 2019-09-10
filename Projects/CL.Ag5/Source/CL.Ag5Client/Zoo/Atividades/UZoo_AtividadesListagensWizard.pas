// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Listagens (BST / CMT / CC / ESCORES)
//
// License      : veja readme.txt





unit UZoo_AtividadesListagensWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids, VCL.DBGrids,
  UZoo_AtividadesBaseWizard, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UZoo_AtividadesListagensDataModule, VCL.DBCtrls, Tc.VCL.Controls.GDIButton,
  VCL.Mask, JvExMask, Tc.VCL.Edits, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesListagensWizard = class(TZoo_AtividadesBaseWizard)
    dtsListaEscores: TDataSource;
    rgListagens: TRadioGroup;
    gbMensagem: TGroupBox;
    lbBST: TLabel;
    lbDPP: TLabel;
    lbProd: TLabel;
    GroupBox2: TGroupBox;
    edDPPPrimipara: TEdit;
    edProdPrimipara: TEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    edDPPMultipara: TEdit;
    edProdMultipara: TEdit;
    Label6: TLabel;
    edBSTPrim: TEdit;
    edBSTMult: TEdit;
    dblcEscores: TDBLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    dtBST: TTcDateEdit;
    lblRetiradaBST: TLabel;
    edtDiasPreSecagemPrimipara: TEdit;
    edtDiasPreSecagemMultipara: TEdit;
    edtDiasSecagemPrimipara: TEdit;
    edtDiasSecagemMultipara: TEdit;
    lblDiasSecagem: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    function GetValidGridName ( AGridName : string ) : string ;
    procedure _actExecuteExecute(Sender: TObject);
    procedure rgListagensClick(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject); // escore
  private
    { Private declarations }
    FGridName : string ;
    FGridNewName : string ;
    Zoo_AtividadesListagensDataModule : TZoo_AtividadesListagensDataModule ;
  protected
    { Protected declarations }
  protected
    { Protected declarations }
    procedure OpenTables ; override ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses ThreadSuppl, Exceptions, UDBZootecnico,
     ClAg5ClientCommonTypes,
     ClAg5ClientZootecnicoCommonTypes, CLAg5Types;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesListagensWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

 // dias antes da secagem para retirada do BST :

  dtBST.Date           := Date;

  FGridName := DBGridResultados.Name ;
//  ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesListagensWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesListagensWizard;
begin
  ThisForm := TZoo_AtividadesListagensWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

function TZoo_AtividadesListagensWizard.GetValidGridName(AGridName: string): String;
begin
   Result := AGridName ;
   Result := StringReplace( Result, '/', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '\', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, ':', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '*', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '?', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '"', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '<', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '>', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, '|', '', [rfReplaceAll] ) ;
   Result := StringReplace( Result, ' ', '', [rfReplaceAll] ) ;
end;

procedure TZoo_AtividadesListagensWizard.OpenTables;
begin
  Zoo_AtividadesListagensDataModule := TZoo_AtividadesListagensDataModule.Create ( self )  ;
  Zoo_AtividadesListagensDataModule.OpenTables ;
  dtsListaEscores.DataSet := Zoo_AtividadesListagensDataModule.cdsListaEscores ;
//  dtsResultado.DataSet    := Zoo_AtividadesListagensDataModule.cdsAListagensBST ;
  dblcEscores.KeyValue    := Zoo_AtividadesListagensDataModule.cdsListaEscoresKZOO_CFGESCORE.Value ;

  lbBST.Caption           := Zoo_AtividadesListagensDataModule.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_INTERVALO );
  lbDPP.Caption           := Zoo_AtividadesListagensDataModule.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_DEL );
  lbProd.Caption          := Zoo_AtividadesListagensDataModule.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_PRODUCAO );
  lblDiasSecagem.Caption  := Zoo_AtividadesListagensDataModule.GetDescricaoBST( _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR );
  lblRetiradaBST.Caption  := Zoo_AtividadesListagensDataModule.GetDescricaoBST( _ST_PARAM_MATRIZES_BST_DIAS_PRE_SECAGEM );

  edBSTPrim.Text       := Zoo_AtividadesListagensDataModule.IntervaloAplicacaoBSTPrimipara.ToString ;
  edBSTMult.Text       := Zoo_AtividadesListagensDataModule.IntervaloAplicacaoBSTMultipara.ToString ;

  edDPPPrimipara.Text  := Zoo_AtividadesListagensDataModule.BSTDelPrimipara.ToString ;
  edDPPMultipara.Text  := Zoo_AtividadesListagensDataModule.BSTDelMultipara.ToString ;

  edProdPrimipara.Text := Zoo_AtividadesListagensDataModule.ProducaoPrimipara.ToString ;
  edProdMultipara.Text := Zoo_AtividadesListagensDataModule.ProducaoMultipara.ToString ;

  edtDiasSecagemPrimipara.Text := Zoo_AtividadesListagensDataModule.DiasPrePartoSecarPrimipara.toString ;
  edtDiasSecagemMultipara.Text := Zoo_AtividadesListagensDataModule.DiasPrePartoSecarMultipara.toString ;

  edtDiasPreSecagemPrimipara.Text := Zoo_AtividadesListagensDataModule.DiasPreSecagemBSTPrimipara.toString ;
  edtDiasPreSecagemMultipara.Text := Zoo_AtividadesListagensDataModule.DiasPreSecagemBSTMultipara.toString ;

end;

procedure TZoo_AtividadesListagensWizard.rgListagensClick(Sender: TObject);
begin
  inherited;
  case rgListagens.ItemIndex of
    0 : // BST
      begin
        gbMensagem.Visible  := True;
        dblcEscores.Visible := False;
        Panel1.Visible      := True;
      end;
    1 : // CMT
      begin
        gbMensagem.Visible  := False;
        dblcEscores.Visible := False;
        Panel1.Visible      := False;
      end;
    2 : // CC
      begin
        gbMensagem.Visible  := False;
        dblcEscores.Visible := False;
        Panel1.Visible      := False;
      end;
    3 : // ESCORES
      begin
        gbMensagem.Visible  := False;
        dblcEscores.Visible := True;
        Panel1.Visible      := False;
      end;
  end;
end;

procedure TZoo_AtividadesListagensWizard._actExecuteExecute(Sender: TObject);
begin

  DBGridResultados := TJvDBUltimGrid( findComponent ( FGridNewName ) ) ;

  if not Assigned ( DBGridResultados ) then
     ShowMessage ( 'Nao associado' ) ;
  inherited;
end;

procedure TZoo_AtividadesListagensWizard._actNextExecute(Sender: TObject);
begin
  ClearEditors ;
  lblTotalLinhas.Caption := '';

  with Zoo_AtividadesListagensDataModule do
    case rgListagens.ItemIndex of
      0 : //BST
        begin
          BSTAte               := dtBST.Date;
          dtsResultado.DataSet := cdsAListagensBST;
          Caption              := 'Atividades - Listagens - BST' ;
          FGridNewName         := 'DBGridResultados_BST' ;
        end;

      1 : //CMT
        begin
          dtsResultado.DataSet    := cdsAListagensCMT;
          Caption                 := 'Atividades - Listagens - CMT' ;
          cdsAListagensCMT.Active := True;
          FGridNewName            := 'DBGridResultados_CMT' ;
        end;

      2 : // CC
        begin
          dtsResultado.DataSet   := cdsAListagensCC;
          Caption                := 'Atividades - Listagens - CC' ;
          cdsAListagensCC.Active := True;
          FGridNewName           := 'DBGridResultados_CC' ;
        end;

      3 : // Escores
        begin
          KeyEscore            := dblcEscores.KeyValue ;
          dtsResultado.DataSet := cdsEscores ;
          Caption              := 'Atividades - Listagens - ' + cdsTable.FieldByName( 'SIGLA' ).asString ;
          FGridNewName         := 'DBGridEscores_' + GetValidGridName(cdsTable.FieldByName( 'SIGLA' ).asString ) ;
        end;
    end; // Fim do case

  DBGridResultados := TJvDBUltimGrid( findComponent ( FGridName ) ) ;

  if not Assigned ( DBGridResultados ) then
     ShowMessage ( 'Nao associado' ) ;

  DBGridResultados.Name := FGridNewName ;
  FGridName := FGridNewName ;

  inherited;

  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesListagensWizard._actNextUpdate(Sender: TObject);
begin
  if rgListagens.itemIndex = 3 then // ESCORES
    _actNext.Enabled := not Zoo_AtividadesListagensDataModule.cdsListaEscores.isEmpty
  else
    _actNext.Enabled := True;

  inherited;
end;

procedure TZoo_AtividadesListagensWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //
  Caption := 'Atividades - Listagens' ;

  if dtsResultado.DataSet.Active then
    dtsResultado.DataSet.Close;

  inherited;
end;

initialization
  RegisterClass ( TZoo_AtividadesListagensWizard )

end.
