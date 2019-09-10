unit UZoo_RelatorioAvaliacaoBezerrasForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, SysPrintGridDialog,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,  UZoo_RelatorioAvaliacaoBezerrasDatamodule,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.DBCtrls, Wrappers ;

type
  TZooRelatotioAvaliacaoBezerras_frm = class(T_FormWizard)
    dtsResultado: TDataSource;
    TabSheet2: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    dtsCategoria: TDataSource;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    ZooRelatotioAvaliacaoBezerras_dtm: TZooRelatotioAvaliacaoBezerras_dtm;
    FFilterDescription : string ;
    procedure SetParams;
    function GetFilterDescription: String;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZooRelatotioAvaliacaoBezerras_frm.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  ZooRelatotioAvaliacaoBezerras_dtm := TZooRelatotioAvaliacaoBezerras_dtm.Create( Self );
  dtsResultado.DataSet:= ZooRelatotioAvaliacaoBezerras_dtm.cdsResultados;
  dtsCategoria.DataSet:= ZooRelatotioAvaliacaoBezerras_dtm.cdsCategoria;
  _actNextExecute(nil);
end;

destructor TZooRelatotioAvaliacaoBezerras_frm.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZooRelatotioAvaliacaoBezerras_frm.Execute : boolean;
var
  ThisForm: TZooRelatotioAvaliacaoBezerras_frm;
begin
  ThisForm := TZooRelatotioAvaliacaoBezerras_frm.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

function TZooRelatotioAvaliacaoBezerras_frm.GetFilterDescription: String;
begin
   Result:= '';
   {if rgCategoria.Visible then
    case rgCategoria.ItemIndex of
     0 : Result := Result + ' Categoria : Todos,';
     1 : Result := Result + ' Categoria : ' + dblcDescCategoria.Text + ',';
    end ;

   Delete( Result, Result.Length, 1 ) ;}
end;

procedure TZooRelatotioAvaliacaoBezerras_frm.SetParams;
begin
  ZooRelatotioAvaliacaoBezerras_dtm.SelectStatus := 'T';
  {if rgCategoria.ItemIndex = 0 then
     ZooRelatotioAvaliacaoBezerras_dtm.SelectStatus := 'T'
  else
     ZooRelatotioAvaliacaoBezerras_dtm.SelectStatus := '';

  if not(ZooRelatotioAvaliacaoBezerras_dtm.cdsCategoriaVALOR.IsNull) then
      ZooRelatotioAvaliacaoBezerras_dtm.StatusAnimal:= ZooRelatotioAvaliacaoBezerras_dtm.cdsCategoriaVALOR.AsInteger;}
end;

procedure TZooRelatotioAvaliacaoBezerras_frm._actExecuteExecute(
  Sender: TObject);
begin

  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption{,
                                             '',
                                            True, '' }     );
end;

procedure TZooRelatotioAvaliacaoBezerras_frm._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;
  lblTotalLinhas.Visible := False;
  FFilterDescription := GetFilterDescription ;
  if FFilterDescription <> '' then
    DBGridResultados.Title := Self.Caption + ' - ' + FFilterDescription
  else
    DBGridResultados.Title := Self.Caption;
  SetParams;
  ZooRelatotioAvaliacaoBezerras_dtm.OpenTables;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
  lblTotalLinhas.Visible := True;
end;

procedure TZooRelatotioAvaliacaoBezerras_frm._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZooRelatotioAvaliacaoBezerras_frm ) ;

end.
