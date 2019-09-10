unit UZoo_RelatorioEventosReprodutivos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application,
  UZoo_RelatorioEventosReprodutivosDataModule, Vcl.Mask,
  Data.DB, Tc.Data.DB.Helpers, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid,
  SysPrintGridDialog,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits,
  Wrappers {Deixar a unit wrappers como ultima no uses} ;

type
  TZoo_RelatorioEventosReprodutivos = class(T_FormWizard)
    TabSheet1: TTabSheet;
    gbOpcoes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    rgTipoData: TRadioGroup;
    deInicial: TTcDateEdit;
    deFinal: TTcDateEdit;
    rgTipoAbortoParto: TRadioGroup;
    dblcDescPartoAborto: TDBLookupComboBox;
    dtsResultados: TDataSource;
    dtsTipoPartoAborto: TDataSource;
    TabSheet2: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    rgTipoEvento: TRadioGroup;
    dblcDescTipoEvento: TDBLookupComboBox;
    dsTipoEvento: TDataSource;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure rgTipoAbortoPartoClick(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    { Private declarations }
    FFilterDescription : string ;
    Zoo_RelatorioEventosReprodutivosDataModule: TZoo_RelatorioEventosReprodutivosDataModule;
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


uses
  ClAg5ClientZootecnicoCommonTypes ;


{ TfrmCustomWizard }

const
  _TIPO_PESQUISA_DATA_COBERTURA    = 'C';
  _TIPO_PESQUISA_DATA_PARTO_ABORTO = 'P';

constructor TZoo_RelatorioEventosReprodutivos.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  Zoo_RelatorioEventosReprodutivosDataModule:= TZoo_RelatorioEventosReprodutivosDataModule.Create( Self );
  DBGridResultados.ShowHighlighter := True ;
  dtsResultadoS.DataSet:= Zoo_RelatorioEventosReprodutivosDataModule.cdsResultados;
  dtsTipoPartoAborto.DataSet:= Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoPartoAborto;
end;

procedure TZoo_RelatorioEventosReprodutivos.DBGridResultadosDblClick(
  Sender: TObject);
begin
  inherited;
  if ( DBGridResultados.ScreenToClient( Mouse.CursorPos ).Y <= DBGridResultados.TitleRowHeight ) then
    exit ;

  with DBGridResultados.DataSource, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
    if Assigned ( Fields.FindField( 'KZOO_ANIMAL_FEMEA'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString )
    else if Assigned ( Fields.FindField( 'KZOO_ANIMAL'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL').AsString );
end;

destructor TZoo_RelatorioEventosReprodutivos.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_RelatorioEventosReprodutivos.Execute : boolean;
var
  ThisForm: TZoo_RelatorioEventosReprodutivos;
begin
  ThisForm := TZoo_RelatorioEventosReprodutivos.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_RelatorioEventosReprodutivos.rgTipoAbortoPartoClick(
  Sender: TObject);
begin
  inherited;
  dblcDescPartoAborto.Enabled:= rgTipoAbortoParto.ItemIndex = 1;
end;

function TZoo_RelatorioEventosReprodutivos.GetFilterDescription: String;
begin
  Result:= '';

  case rgTipoData.ItemIndex of
   0 : Result := Result + ' Tipo de ocorrência : Cobertura,' ;
   1 : Result := Result + ' Tipo de ocorrência : Parto,';
  end;

  if ( deinicial.Date > 0 ) or ( deFinal.Date > 0 )then
   begin
     if ( deinicial.Date > 0 ) then
       Result := Result + ' Data inical : ' + FormatDateTime( 'dd.mm.yyyy', deinicial.Date ) + ',';
     if ( deFinal.Date > 0 ) then
       Result := Result + ' Data final : ' + FormatDateTime( 'dd.mm.yyyy', deFinal.Date ) + ',';
   end;

  case  rgTipoEvento.ItemIndex of
     0 : Result := Result + ' Tipo de cobertura : Todos,';
     1 : Result := Result + ' Tipo de cobertura : ' + dblcDescTipoEvento.Text + ',';
  end;

  if rgTipoAbortoParto.Visible then
    case rgTipoAbortoParto.ItemIndex of
     0 : Result := Result + ' Tipo Aborto / Parto : Todos,';
     1 : Result := Result + ' Tipo Aborto / Parto : ' + dblcDescPartoAborto.Text + ',';
    end ;

  Delete( Result, Result.Length, 1 ) ;

end;

procedure TZoo_RelatorioEventosReprodutivos.SetParams;
begin

   Zoo_RelatorioEventosReprodutivosDataModule.DataIni:= deInicial.Date;
   Zoo_RelatorioEventosReprodutivosDataModule.DataFim:= deFinal.Date;


   if RgTipoData.ItemIndex = 0 then
      Zoo_RelatorioEventosReprodutivosDataModule.PesqDataOcorrencia:= _TIPO_PESQUISA_DATA_COBERTURA
   else
      Zoo_RelatorioEventosReprodutivosDataModule.PesqDataOcorrencia:= _TIPO_PESQUISA_DATA_PARTO_ABORTO;

   if rgTipoAbortoParto.ItemIndex = 0 then
      Zoo_RelatorioEventosReprodutivosDataModule.PesqTipoAborto:= 'T'
   else
      Zoo_RelatorioEventosReprodutivosDataModule.PesqTipoAborto:= 'F';


   if not(Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoPartoAbortoVALOR.IsNull) then
      Zoo_RelatorioEventosReprodutivosDataModule.AbortoParto:= Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoPartoAbortoVALOR.AsInteger;

   if rgTipoEvento.ItemIndex = 0 then
      Zoo_RelatorioEventosReprodutivosDataModule.PesqTipoEvento:= 'T'
   else
      Zoo_RelatorioEventosReprodutivosDataModule.PesqTipoEvento:= 'F';


   if not(Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoEventoVALOR.IsNull) then
      Zoo_RelatorioEventosReprodutivosDataModule.TipoEvento:= Zoo_RelatorioEventosReprodutivosDataModule.cdsTipoEventoVALOR.AsInteger;

end;

procedure TZoo_RelatorioEventosReprodutivos._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption, '', True, FFilterDescription  );
  inherited;

end;

procedure TZoo_RelatorioEventosReprodutivos._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;
  FFilterDescription := GetFilterDescription ;
  DBGridResultados.Title := Self.Caption + ' - ' + FFilterDescription ;
  SetParams;
  Zoo_RelatorioEventosReprodutivosDataModule.OpenTables;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultados.Dataset.RecordCount]);
end;

procedure TZoo_RelatorioEventosReprodutivos._actNextUpdate(Sender: TObject);
begin
  inherited;

  _actNext.Enabled := (deInicial.Date > 0) and (deFinal.Date >= deInicial.Date) and (deInicial.Date <= Date) and
                     ((rgTipoAbortoParto.ItemIndex = 0) or (not VarIsNull(dblcDescPartoAborto.KeyValue) )) and
                     ((rgTipoEvento.ItemIndex = 0) or (not VarIsNull(dblcDescTipoEvento.KeyValue) )) ;
end;

procedure TZoo_RelatorioEventosReprodutivos._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_RelatorioEventosReprodutivos ) ;

end.
