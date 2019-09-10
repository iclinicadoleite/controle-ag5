unit UZoo_RelatorioCoberturas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Data.FMTBcd,
  Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Datasnap.Provider, Data.SqlExpr, Tc.Data.SQLExpr, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, VCL.Mask, JvExMask, Tc.VCL.Edits, UdtmSYS_BASE,
  SysPrintGridDialog, Exceptions, Tc.VCL.Controls.GDIButton,  CDSSuppl,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioCoberturas = class(T_FormWizard)
    TabSheetParametros: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    deIni: TTcDateEdit;
    deAte: TTcDateEdit;
    TabSheetResultado: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    sqlCoberturas: TTcSQLDataSet;
    dspCoberturas: TDataSetProvider;
    cdsCoberturas: TClientDataSet;
    dtsResultado: TDataSource;
    cdsCoberturasBRINCO: TStringField;
    cdsCoberturasNOMEESTABULO: TStringField;
    cdsCoberturasREGISTRO: TStringField;
    cdsCoberturasTOURO: TStringField;
    cdsCoberturasREGISTRO_TOURO: TStringField;
    sqlCoberturasBRINCO: TStringField;
    sqlCoberturasNOMEESTABULO: TStringField;
    sqlCoberturasREGISTRO: TStringField;
    sqlCoberturasTOURO: TStringField;
    sqlCoberturasREGISTRO_TOURO: TStringField;
    sqlCoberturasDATAEVENTO: TSQLTimeStampField;
    sqlCoberturasCOMUNICACAO_COBERTURA: TStringField;
    cdsCoberturasDATAEVENTO: TSQLTimeStampField;
    cdsCoberturasCOMUNICACAO_COBERTURA: TStringField;
    sqlCoberturasBRINCO_: TStringField;
    cdsCoberturasBRINCO_: TStringField;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    sqlCoberturasKZOO_ANIMAL: TStringField;
    cdsCoberturasKZOO_ANIMAL: TStringField;
    sqlCoberturasQTDE_COBERTURA: TIntegerField;
    cdsCoberturasQTDE_COBERTURA: TIntegerField;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure DBGridResultadosShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure deIniKeyPress(Sender: TObject; var Key: Char);
    procedure deAteKeyPress(Sender: TObject; var Key: Char);
    procedure cdsCoberturasAfterClose(DataSet: TDataSet);
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

Uses
     DateUtils
   , Data.SQLTimSt
   , CLAg5Types
   , ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_RelatorioCoberturas.cdsCoberturasAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsCoberturas.IndexName :='';
end;

constructor TZoo_RelatorioCoberturas.Create(AOwner: TComponent);
begin
  inherited;
  DBGridResultados.ShowHighlighter := True ;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

procedure TZoo_RelatorioCoberturas.DBGridResultadosDblClick(Sender: TObject);
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

procedure TZoo_RelatorioCoberturas.DBGridResultadosShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  AllowEdit := Field = cdsCoberturasCOMUNICACAO_COBERTURA ;
end;

procedure TZoo_RelatorioCoberturas.deAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      VerificaPeriodo;
      _btbNext.SetFocus ;
    end ;
end;

procedure TZoo_RelatorioCoberturas.deIniKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      deAte.SetFocus;
    end ;
end;

destructor TZoo_RelatorioCoberturas.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  TcdsSuppl.PersistIndexes( cdsCoberturas );
  inherited;
end;

class function TZoo_RelatorioCoberturas.Execute : boolean;
var
  ThisForm: TZoo_RelatorioCoberturas;
begin
  ThisForm := TZoo_RelatorioCoberturas.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_RelatorioCoberturas.SetParams;
begin
  cdsCoberturas.Params.ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
  cdsCoberturas.Params.ParamByName ( 'STATUS_DESCARTADO' ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;
  cdsCoberturas.Params.paramByName ( 'DATAINI' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay (  deIni.Date ) ) ;
  cdsCoberturas.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay (  deAte.Date ) ) ;
end;

procedure TZoo_RelatorioCoberturas.VerificaPeriodo;
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

procedure TZoo_RelatorioCoberturas._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption );
  inherited;
end;

procedure TZoo_RelatorioCoberturas._actNextExecute(Sender: TObject);
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
  SetParams;
  TCDSSuppl.Open(cdsCoberturas);
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_RelatorioCoberturas._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := ( PageControl.ActivePage = TabSheetParametros )
                    and ( deIni.Date > 0 ) and ( deAte.Date > 0 ) ;
end;

procedure TZoo_RelatorioCoberturas._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  cdsCoberturas.Active := False;
end;

initialization
  RegisterClass ( TZoo_RelatorioCoberturas ) ;


end.
