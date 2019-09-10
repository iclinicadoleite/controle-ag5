unit UZoo_RelatorioNascimentos;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, SysFormWizard, JvExExtCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls, JvExtComponent, JvPanel, JvImage,
  Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask, Tc.VCL.Edits, Exceptions,
  SysPrintGridDialog, Tc.VCL.Edits.DBControls,
  Tc.VCL.Controls.GDIButton, CDSSuppl,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioNascimentos = class(T_FormWizard)
    TabSheetParametros: TTabSheet;
    Label1: TLabel;
    TabSheetResultado: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    Label2: TLabel;
    dtsResultado: TDataSource;
    cdsNascimentos: TClientDataSet;
    dspNascimentos: TDataSetProvider;
    sqlNascimentos: TTcSQLDataSet;
    sqlNascimentosBRINCO: TStringField;
    sqlNascimentosNOMEESTABULO: TStringField;
    sqlNascimentosNASCIMENTO: TSQLTimeStampField;
    sqlNascimentosDATACOBERTURA: TSQLTimeStampField;
    sqlNascimentosSEXO: TStringField;
    sqlNascimentosGRAUSANGUE: TStringField;
    sqlNascimentosNOMEMAE: TStringField;
    sqlNascimentosREGISTRO_MAE: TStringField;
    sqlNascimentosNOMEPAI: TStringField;
    sqlNascimentosREGISTRO_PAI: TStringField;
    sqlNascimentosCOMUNICACAO_COBERTURA: TStringField;
    cdsNascimentosBRINCO: TStringField;
    cdsNascimentosNOMEESTABULO: TStringField;
    cdsNascimentosNASCIMENTO: TSQLTimeStampField;
    cdsNascimentosDATACOBERTURA: TSQLTimeStampField;
    cdsNascimentosSEXO: TStringField;
    cdsNascimentosGRAUSANGUE: TStringField;
    cdsNascimentosNOMEMAE: TStringField;
    cdsNascimentosREGISTRO_MAE: TStringField;
    cdsNascimentosNOMEPAI: TStringField;
    cdsNascimentosREGISTRO_PAI: TStringField;
    cdsNascimentosCOMUNICACAO_COBERTURA: TStringField;
    deIni: TTcDateEdit;
    deAte: TTcDateEdit;
    sqlNascimentosBRINCO_: TStringField;
    cdsNascimentosBRINCO_: TStringField;
    sqlNascimentosNATIMORTO: TStringField;
    cdsNascimentosNATIMORTO: TStringField;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    sqlNascimentosKZOO_ANIMAL: TStringField;
    cdsNascimentosKZOO_ANIMAL: TStringField;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure DBGridResultadosShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure deIniKeyPress(Sender: TObject; var Key: Char);
    procedure deAteKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetParams ;
    procedure VerificaPeriodo;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;        

implementation

uses
   CLAg5Types
   , DateUtils
   , SqlTimSt
   , ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_RelatorioNascimentos.Create(AOwner: TComponent);
begin
  inherited;
  DBGridResultados.ShowHighlighter := True ;
end;

procedure TZoo_RelatorioNascimentos.DBGridResultadosDblClick(Sender: TObject);
begin
  inherited;
  if ( DBGridResultados.ScreenToClient( Mouse.CursorPos ).Y <= DBGridResultados.TitleRowHeight ) then
    exit ;

  with dtsResultado, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
    if Assigned ( Fields.FindField( 'KZOO_ANIMAL_FEMEA'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString )
    else if Assigned ( Fields.FindField( 'KZOO_ANIMAL'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL').AsString );
end;

procedure TZoo_RelatorioNascimentos.DBGridResultadosShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  AllowEdit := Field = cdsNascimentosCOMUNICACAO_COBERTURA ;
end;

procedure TZoo_RelatorioNascimentos.deAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      VerificaPeriodo;
      _btbNext.SetFocus ;
    end ;
end;

procedure TZoo_RelatorioNascimentos.deIniKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      deAte.SetFocus;
    end ;
end;

destructor TZoo_RelatorioNascimentos.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  TcdsSuppl.PersistIndexes( cdsNascimentos );
  inherited;
end;

class function TZoo_RelatorioNascimentos.Execute : boolean;
var
  ThisForm: TZoo_RelatorioNascimentos;
begin
  ThisForm := TZoo_RelatorioNascimentos.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_RelatorioNascimentos.SetParams;
begin
  cdsNascimentos.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
  //cdsNascimentos.Params.ParamByName ( 'STATUS_DESCARTADO' ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  cdsNascimentos.Params.ParamByName ( 'STATUS_SEMEM' ).asInteger := _ST_STATUS_MACHO_SEMEN ;
  cdsNascimentos.Params.paramByName ( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  deIni.Date ) ) ;
  cdsNascimentos.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  deAte.Date ) ) ;
   cdsNascimentos.Params.ParamByName ( 'NATIMORTO' ).asString := 'T';
end;

procedure TZoo_RelatorioNascimentos.VerificaPeriodo;
begin
  if deIni.Date < 1 then
    begin
      deIni.SetFocus;
      raise Warning.Create('Data inicial inválida');
    end;
    
  if deIni.Date > deAte.Date then
    begin
      deIni.SetFocus;
      raise Warning.Create('Data inicial maior que data final');
    end;

  if deAte.Date > Now  then
    begin 
      deAte.SetFocus;
      raise Warning.Create('Data final superior a data atual');
    end;
end;

procedure TZoo_RelatorioNascimentos._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption );
  inherited;
end;

procedure TZoo_RelatorioNascimentos._actNextExecute(Sender: TObject);
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
  PageControl.ActivePage := TabSheetResultado;
  SetParams;
  TCDSSuppl.Open(cdsNascimentos);
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_RelatorioNascimentos._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := ( PageControl.ActivePage = TabSheetParametros )
                    and ( deIni.Date > 0 ) and ( deAte.Date > 0 ) ;
end;

procedure TZoo_RelatorioNascimentos._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  cdsNascimentos.Active := False;
  PageControl.ActivePage := TabSheetParametros;
end;

initialization
  RegisterClass ( TZoo_RelatorioNascimentos ) ;

end.
