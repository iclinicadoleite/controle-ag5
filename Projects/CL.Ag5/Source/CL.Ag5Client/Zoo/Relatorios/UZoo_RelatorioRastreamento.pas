// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Rastreamento
//
// License      : veja readme.txt



unit UZoo_RelatorioRastreamento;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvSpin, VCL.Mask,
  JvExMask, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  JvDBUltimGrid, UdtmSYS_BASE, UDBZootecnico, JvExStdCtrls, JvCombobox,
  JvDBCombobox, VCL.DBCtrls, DateUtils, CheckLst, Contnrs, Tc.VCL.Edits,
  SysPrintGridDialog, Tc.VCL.Dialogs, Tc.VCL.Controls.GDIButton,
  Tc.VCL.FloatPanel, Tc.VCL.ControlPopuper,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TDataReferencia = ( drPeriodo, drRelativa, drUltimaPesagem ) ;
  TStatusAnimal   = ( saTodos, saPrenhe, saCoberto, saVazio ) ;
  TTipoRelatorio  = ( trMensal, trDiasEmLactacao ) ;

  TZoo_RelatorioRastreamento = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dtsRelatorioRastreamento: TDataSource;
    dtsAtividades: TDataSource;
    Panel6: TPanel;
    dtsSelecionados: TDataSource;
    pnRelatorios: TPanel;
    Label3: TLabel;
    dtsRelatorios: TDataSource;
    btnSalvarRelatorio: TTcGDIButton;
    btnDelete: TTcGDIButton;
    ScrollBox1: TScrollBox;
    GroupBox2: TGroupBox;
    cbCategoriaCondicao: TComboBox;
    seCategoriaValor: TJvSpinEdit;
    GroupBox3: TGroupBox;
    rbDataPeriodo: TRadioButton;
    rbDataRelativa: TRadioButton;
    rbDataUltimaPesagem: TRadioButton;
    GroupBox5: TGroupBox;
    Panel3: TPanel;
    cbFiltroRepeteAnimal: TCheckBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Button3: TTcGDIButton;
    Button4: TTcGDIButton;
    Button2: TTcGDIButton;
    Button1: TTcGDIButton;
    Panel7: TPanel;
    dbgAtividades: TJvDBUltimGrid;
    Panel8: TPanel;
    dbgSelecionadas: TJvDBUltimGrid;
    Label2: TLabel;
    Label4: TLabel;
    lbTiporelatorio: TLabel;
    Label5: TLabel;
    lbCategoria: TLabel;
    Label6: TLabel;
    lbDataRelativa: TLabel;
    Label7: TLabel;
    lbStatus: TLabel;
    Label8: TLabel;
    lbRepete: TLabel;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    seDiasDataRelativa: TJvSpinEdit;
    cbTipoDataRelativa: TComboBox;
    Memo1: TMemo;
    dbgRelatorioRastreamento: TJvDBUltimGrid;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    rbCategoriaNovilhas: TCheckBox;
    rbCategoriaVacas: TCheckBox;
    SaveAsPanel: TTcCaptionedPanel;
    btbPanelSaveOk: TTcGDIButton;
    btbPanelSaveCancel: TTcGDIButton;
    rbSaveAs: TRadioButton;
    edtSaveAs: TEdit;
    rbSaveExisting: TRadioButton;
    dblcRastreamento: TDBLookupComboBox;
    PopuperSaveAs: TTcControlPopuper;
    rgStatusAnimal: TRadioGroup;
    rgTipoRelatorio: TRadioGroup;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure rbDataReferenciaClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSalvarRelatorioClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgRelatorioRastreamentoDblClick(Sender: TObject);
    procedure dbgRelatorioRastreamentoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure seDiasDataRelativaChange(Sender: TObject);
    procedure cbTipoDataRelativaChange(Sender: TObject);
    procedure dbgRelatorioRastreamentoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure rgTipoRelatorioClick(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure dbcbRelatoriosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbcbRelatoriosCloseUp(Sender: TObject);
    procedure btbPanelSaveOkClick(Sender: TObject);
    procedure dbcbRelatoriosEnter(Sender: TObject);
    procedure dblcRastreamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcRastreamentoEnter(Sender: TObject);
    procedure dblcRastreamentoCloseUp(Sender: TObject);
    procedure rgStatusAnimalClick(Sender: TObject);
    procedure rbCategoriaVacasClick(Sender: TObject);
  private
    FSelecionados   : TStringList;
    cdsAtividades   : TClientDataSet;
    cdsSelecionados : TClientDataSet;
    cdsRastreadores : TClientDataSet;
    cdsRelatorios   : TClientDataSet;
    cdsResultado    : TClientDataSet;

    FKZOO_RASTREAMENTO : string;

    //++KIQ
    FDataReferencia : TDataReferencia ;
    FStatusAnimal   : TStatusAnimal   ;
    FTipoRelatorio  : TTipoRelatorio ;

    procedure ValidaCamposCategorias;
    procedure ValidaCamposDataReferencia;
    procedure CopyAtividadeSelecionada(cdsFrom, cdsTo: TClientDataSet);
    procedure CopyAllAtividades(cdsFrom, cdsTo: TClientDataSet);
    procedure GeraRelatorio;
    function SearchRastreamento(FNOME: String): string ;
    procedure IncluiAltera(ANewReport : boolean);
    function GetSelecionados: Boolean;
    procedure LoadReports;
    procedure LoadConfiguracao;
    procedure ValidaCampos;
    procedure CriaCampos;
    procedure PreencheGrid;
    procedure DestroiCampos;
    function NameMonth(Mes:Integer; Abrev:Boolean):String;
    procedure AtualizaPeriodo;
    function  GetUltimaPesagem : TDate;
    procedure CompletaDiasEmLactacao;
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure SaveReport;
  public
    { Public declarations }
    class function Execute: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses Tc.DBRTL.AbstractDB, StrUtils, CDSSuppl, CLAg5Types, Data.SQLTimSt, Exceptions, UZoo_RelatorioRastreamentoFormDialog,
     GuidSuppl ;

var
  CellClicked : integer;
  FSQL_WHERE   : string;
  FParametros : TParams ;

{$R *.dfm}
  { TfrmCustomWizard }

procedure TZoo_RelatorioRastreamento.btbPanelSaveOkClick(Sender: TObject);
begin
  SaveReport;
  TCustomForm( SaveAsPanel.Parent ).ModalResult := mrOK ;
end;

procedure TZoo_RelatorioRastreamento.btnDeleteClick(Sender: TObject);
const
  DELETE_RELATORIO = 'DELETE FROM ZOO_RASTREAMENTO WHERE KZOO_RASTREAMENTO = :KZOO_RASTREAMENTO';
var
  p: TParams;
begin
  inherited;

  p := TParams.Create;
  with cdsRelatorios do
    if MessageDlg( 'Deseja realmente excluir "' + cdsRelatorios.FieldByName( 'NOME' ).AsString + '" ?',
                    mtWarning, [ mbYes, mbNo ]) = mrYes then
      begin
        p.CreateParam( ftString, 'KZOO_RASTREAMENTO', ptInput).asString := FieldByName('KZOO_RASTREAMENTO').asString;
        TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute( DELETE_RELATORIO, p );
        LoadReports;
      end;

  p.Free;
end;

procedure TZoo_RelatorioRastreamento.btnSalvarRelatorioClick(Sender: TObject);
begin
  if cdsRelatorios.IsEmpty then
    begin
      rbSaveExisting.Visible := False ;
      rbSaveAs.Checked       := True ;
      edtSaveAs.Text         := 'Rastremento 1'
    end
  else
    begin
      rbSaveExisting.Visible := True ;
      rbSaveExisting.Caption := cdsRelatorios.FieldByName( 'NOME' ).asString ;
      rbSaveExisting.Checked := True ;
      edtSaveAs.Text := 'Cópia ' + cdsRelatorios.FieldByName( 'NOME' ).asString ;
    end;

  pnRelatorios.Width := dblcRastreamento.Width ;
  with pnRelatorios.clientToScreen ( Point ( dblcRastreamento.Left, dblcRastreamento.Top ) ) do
    PopuperSaveAs.ShowModal( Point ( X, Y ) ) ;

    (*
  if PopuperSaveAs.ModalResult  = mrOK then
    begin
      dblcRastreamento.KeyValue := FKZOO_RASTREAMENTO ;
      LoadConfiguracao;
    end;
    *)
end;

procedure TZoo_RelatorioRastreamento.Button1Click(Sender: TObject);
begin
  CopyAllAtividades(cdsSelecionados, cdsAtividades);
end;

procedure TZoo_RelatorioRastreamento.Button2Click(Sender: TObject);
begin
  CopyAtividadeSelecionada(cdsSelecionados, cdsAtividades);
end;

procedure TZoo_RelatorioRastreamento.Button3Click(Sender: TObject);
begin
  CopyAllAtividades(cdsAtividades, cdsSelecionados);
end;

procedure TZoo_RelatorioRastreamento.Button4Click(Sender: TObject);
begin
  CopyAtividadeSelecionada(cdsAtividades, cdsSelecionados);
end;

procedure TZoo_RelatorioRastreamento.cbTipoDataRelativaChange(Sender: TObject);
begin
  inherited;
  AtualizaPeriodo;
end;

procedure TZoo_RelatorioRastreamento.AtualizaPeriodo;
begin
  if cbTipoDataRelativa.Itemindex = 0 then
    deDataInicial.date := IncDay( deDataFinal.Date, - seDiasDataRelativa.AsInteger )
  else
    if cbTipoDataRelativa.Itemindex = 1 then
      deDataInicial.date := IncWeek( deDataFinal.Date, - seDiasDataRelativa.AsInteger )
  else
    if cbTipoDataRelativa.Itemindex = 2 then
      deDataInicial.date := IncMonth( deDataFinal.Date, - seDiasDataRelativa.AsInteger );
end;

procedure TZoo_RelatorioRastreamento.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if DisplayText then
    if Sender.AsInteger = 0 then
      Text := '-'
    else
      Text := Sender.AsString;
end;

procedure TZoo_RelatorioRastreamento.CompletaDiasEmLactacao;
begin
  with cdsSelecionados do
    begin
      First;
      DisableControls;
      while not Eof do
        begin
          if not cdsRastreadores.Locate( 'TIPO;EVENTO',
                                         VarArrayOf([ FieldByName( 'TIPO' ).AsString,
                                                      FieldByName( 'NOME' ).AsString]),[] ) then
            begin
              cdsRastreadores.Append;
              cdsRastreadores.FieldByName('TIPO').AsString     := FieldByName( 'TIPO' ).AsString;
              cdsRastreadores.FieldByName('CODIGO').AsString   := FieldByName( 'CODIGO' ).AsString;
              cdsRastreadores.FieldByName('EVENTO').AsString   := FieldByName( 'NOME' ).AsString;
              cdsRastreadores.FieldByName('TOTAL').AsInteger   := 0;
              cdsRastreadores.FieldByName('1-29').AsInteger    := 0;
              cdsRastreadores.FieldByName('30-59').AsInteger   := 0;
              cdsRastreadores.FieldByName('60-89').AsInteger   := 0;
              cdsRastreadores.FieldByName('90-119').AsInteger  := 0;
              cdsRastreadores.FieldByName('120-149').AsInteger := 0;
              cdsRastreadores.FieldByName('150-179').AsInteger := 0;
              cdsRastreadores.FieldByName('180-209').AsInteger := 0;
              cdsRastreadores.FieldByName('210-239').AsInteger := 0;
              cdsRastreadores.FieldByName('240-269').AsInteger := 0;
              cdsRastreadores.FieldByName('270-299').AsInteger := 0;
              cdsRastreadores.FieldByName('300-329').AsInteger := 0;
              cdsRastreadores.FieldByName('>= 330').AsInteger  := 0;
            end;
          Next;
        end;
      First;
      EnableControls;
      cdsRastreadores.IndexFieldNames := 'TIPO;EVENTO';
    end;
end;

procedure TZoo_RelatorioRastreamento.CopyAllAtividades(cdsFrom,
  cdsTo: TClientDataSet);
begin
  if cdsFrom.isEmpty then
    Exit;

  with cdsFrom do
    begin
      First;
      DisableControls;
      while not cdsFrom.isEmpty do
        begin
          cdsTo.Append;
          cdsTo.FieldByName( 'ORD'    ).asString := cdsFrom.FieldByName( 'ORD'    ).asString;
          cdsTo.FieldByName( 'TIPO'   ).asString := cdsFrom.FieldByName( 'TIPO'   ).asString;
          cdsTo.FieldByName( 'CODIGO' ).asString := cdsFrom.FieldByName( 'CODIGO' ).asString;
          cdsTo.FieldByName( 'NOME'   ).asString := cdsFrom.FieldByName( 'NOME'   ).asString;
          cdsTo.Post;
          cdsFrom.Delete;
        end;

      First;
      EnableControls;
    end;

  TCDSSuppl.ApplyUpdates( cdsTo );
  if cdsTo = cdsSelecionados then
    dbgSelecionadas.Refresh;
end;

procedure TZoo_RelatorioRastreamento.CopyAtividadeSelecionada( cdsFrom, cdsTo :TClientDataSet );
begin
  if cdsFrom.isEmpty then
    Exit;

  cdsTo.Append;
  cdsTo.FieldByName( 'ORD'    ).asString := cdsFrom.FieldByName( 'ORD'    ).asString;
  cdsTo.FieldByName( 'TIPO'   ).asString := cdsFrom.FieldByName( 'TIPO'   ).asString;
  cdsTo.FieldByName( 'CODIGO' ).asString := cdsFrom.FieldByName( 'CODIGO' ).asString;
  cdsTo.FieldByName( 'NOME'   ).asString := cdsFrom.FieldByName( 'NOME'   ).asString;
  cdsFrom.Delete;
  TCDSSuppl.ApplyUpdates( cdsTo );
end;

constructor TZoo_RelatorioRastreamento.Create(AOwner: TComponent);
const
  SELECT_ATIVIDADES = 'SELECT 1 ORD, ''E'' TIPO, SYS$VALUE CODIGO, SYS$DESCRIPTION NOME ' +
                      'FROM SYS$TYPES ' +
                      'WHERE SYS$TYPE = ''TIPO_EVENTO_ZOO'' ' +
                      'UNION ALL ' +
                      'SELECT 2 ORD, ''P'' TIPO, SYS$VALUE CODIGO, SYS$DESCRIPTION NOME ' +
                      'FROM SYS$TYPES ' +
                      'WHERE SYS$TYPE = ''TIPO_PARTOABORTO'' ' +
                      'UNION ALL ' +
                      'SELECT 3 ORD, ''D'' TIPO, KZOO_DIAGNOSTICO CODIGO, NOME ' +
                      'FROM ZOO_DIAGNOSTICOS ' +
                      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA ' +
                      '  AND SYS$EVENTOID IS NULL '+
                      'ORDER BY 1 ';

  SELECT_SELECIONADOS = 'SELECT 0 ORD, '''' TIPO, KZOO_DIAGNOSTICO CODIGO, NOME ' +
                        'FROM ZOO_DIAGNOSTICOS WHERE KCAD_FAZENDA = :KCAD_FAZENDA AND 1=0';

var
  p: TParams;
begin
  inherited;

  dbgRelatorioRastreamento.ShowHighlighter := True ;

  p                  := TParams.Create;
  cdsResultado       := TClientDataSet.Create( Self );
  FSelecionados      := TStringList.Create;
  FKZOO_RASTREAMENTO := '' ;

  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsAtividades, SELECT_ATIVIDADES, p );
  dtsAtividades.DataSet := cdsAtividades;
  cdsAtividades.IndexFieldNames := 'ORD;NOME';

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsSelecionados, SELECT_SELECIONADOS, p );
  dtsSelecionados.DataSet := cdsSelecionados;

  if debugHook <> 0 then
    begin
       Memo1.Visible := True ;
       Memo1.Align   := alBottom ;
       dbgRelatorioRastreamento.Align := alClient ;
    end
  else
    dbgAtividades.Fields[0].Visible := False;

  LoadReports;

  FKZOO_RASTREAMENTO := cdsRelatorios.FieldByName( 'KZOO_RASTREAMENTO').AsString;
  dblcRastreamento.KeyValue := FKZOO_RASTREAMENTO ;

  p.Free;
end;

procedure TZoo_RelatorioRastreamento.CriaCampos;
var
  FieldBanco       : TField;
  FTITULO, FMesAno : string;
  TMesAno          : string;
  i, TotalPeriodo  : Integer;
  MES_INCOMPLETO   : Boolean;
  TData            : TDateTime;
begin
//  if cdsRastreadores.isEmpty then
//    raise Information.Create('Nenhum animal para exibir'); ;

  FTITULO := EmptyStr;

  FieldBanco := TStringField.Create( cdsResultado );
  with FieldBanco do
    begin
      FieldName    := 'TIPO';
      DisplayLabel := 'TIPO';
      Visible      := False;
      DataSet      := cdsResultado;
    end;

  FieldBanco := TStringField.Create( cdsResultado );
  with FieldBanco do
    begin
      FieldName    := 'CODIGO';
      DisplayLabel := 'CODIGO';
      Visible      := False;
      DataSet      := cdsResultado;
    end;

  FieldBanco := TStringField.Create( cdsResultado );
  with FieldBanco do
    begin
      FieldName    := 'EVENTO';
      DisplayLabel := 'Evento';
      DataSet      := cdsResultado;
    end;

  FieldBanco := TCurrencyField.Create( cdsResultado );
  with TCurrencyField( FieldBanco ) do
    begin
      FieldName     := 'TOTAL';
      DisplayLabel  := 'Total';
      currency      := False;
      Alignment     := taCenter;
      DataSet       := cdsResultado;
    end;

  FMesAno        := IntToStr( MonthOfTheYear( deDataFinal.Date ) ) + '-' + IntToStr( YearOf( deDataFinal.Date ) );
  MES_INCOMPLETO := ( DayOf( deDataFinal.Date ) < DaysInMonth( deDataFinal.Date ) );

  try
    TotalPeriodo := MonthsBetween( deDataInicial.Date, deDataFinal.Date );
    TData        := deDataInicial.Date;
    for i := 0 to TotalPeriodo do
      begin
        TMesAno         := IntToStr( MonthOfTheYear( TData ) ) + '-' + IntToStr( YearOf( TData ) );

        FieldBanco   := TCurrencyField.Create( cdsResultado );
        with TCurrencyField( FieldBanco ) do
          begin
            FieldName := 'MES_' + TMesAno;

            if ( TMesAno = FMesAno ) and MES_INCOMPLETO then
              DisplayLabel := TMesAno + '**'
            else
              DisplayLabel := TMesAno;

            OnGetText     := GetText ;
            currency      := False;
            Alignment     := taCenter;
            DataSet       := cdsResultado;
            TData         := IncMonth( TData, 1 );
          end;
      end;
  Except On E: Exception do
    begin
      DestroiCampos;
      raise Warning.Create(E.Message);
    end;
  end;

//  with cdsRastreadores do
//    begin
//      First;
//      DisableControls;
//      try
//        while not Eof do
//          begin
//            if FTITULO <> FieldByName('TITULO').asString then
//              begin
//                FTITULO := FieldByName('TITULO').asString;
//                FieldBanco := TCurrencyField.Create(cdsResultado);
//                with TCurrencyField(FieldBanco) do
//                  begin
//                    FieldName := 'MES_' + FieldByName('TITULO').asString;
//
//                    if (FieldByName('TITULO').AsString = FMesAno)and MES_INCOMPLETO then
//                      DisplayLabel := NameMonth(FieldByName('MES').AsInteger,True ) + '-' + FieldByName('ANO').asString + '**'
//                    else
//                      DisplayLabel := NameMonth(FieldByName('MES').AsInteger,True ) + '-' + FieldByName('ANO').asString;
//
//                    DisplayFormat := '00';
//                    currency      := False;
//                    Alignment     := taCenter;
//                    DataSet       := cdsResultado;
//                 end;
//              end;
//            Next;
//          end;
//      Except On E: Exception do
//        begin
//          DestroiCampos;
//          raise Warning.Create(E.Message);
//        end;
//      end;
//
//      First;
//      EnableControls;
//    end;

  cdsResultado.CreateDataSet;
  dtsRelatorioRastreamento.DataSet := cdsResultado;

  for i := 0 to dbgRelatorioRastreamento.Columns.Count - 1 do
    if dbgRelatorioRastreamento.Columns[ i ].FieldName = 'TOTAL' then
      dbgRelatorioRastreamento.Columns[ i ].Width := 40
    else
      dbgRelatorioRastreamento.Columns[ i ].Width := 80;

  PreencheGrid;
end;

procedure TZoo_RelatorioRastreamento.dbcbRelatoriosCloseUp(Sender: TObject);
begin
  LoadConfiguracao;
end;

procedure TZoo_RelatorioRastreamento.dbcbRelatoriosEnter(Sender: TObject);
begin
  if ( cdsRelatorios.ChangeCount > 0 )
   and ( MessageDlg ( 'Deseja salvar o reltório', mtConfirmation ) = mrYes ) then
    SaveReport;
end;

procedure TZoo_RelatorioRastreamento.dbcbRelatoriosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//
end;

procedure TZoo_RelatorioRastreamento.dbgRelatorioRastreamentoDblClick(Sender: TObject);
var
  ColunaClicada, SomaXColunas : Integer;
  Fevento, FColuna : string;
  vDataIni, vDataFim : TDateTime;
  DEL_1, DEL_2 : Integer;
  p : TParams;
  Where : string ;
begin
  ColunaClicada := - 1;
  SomaXColunas  := 0;

  while CellClicked > SomaXColunas do
    begin
      ColunaClicada := ColunaClicada + 1;
      SomaXColunas := SomaXColunas + dbgRelatorioRastreamento.Columns[ ColunaClicada ].Width;
    end;

  with dbgRelatorioRastreamento.Columns.Grid do
    if ( SelectedField.IsNull) or ( SelectedField.Value < 1 ) then Exit
    else   FColuna := SelectedField.FieldName;

  p := TParams.Create();
  p.Assign( FParametros );
  Where := FSQL_WHERE ;


  with dtsRelatorioRastreamento.DataSet do
    begin
      if FieldByName( 'TIPO' ).AsString = 'D' then
        Where := Where + #13#10 + '  AND AD.KZOO_DIAGNOSTICO = :EVENTO '
      else if FieldByName( 'TIPO' ).AsString = 'E' then
        Where := Where + #13#10 + '  AND EZ.TIPOEVENTO = :EVENTO '
      else if FieldByName( 'TIPO' ).AsString = 'P' then
        Where := Where + #13#10 + '  AND EZ.ABORTOPARTO = :EVENTO ' ;

      p.CreateParam(ftString, 'EVENTO', ptInput).AsString := FieldByName( 'CODIGO' ).AsString ;

      if FTipoRelatorio = trMensal then
        begin
          if FieldByName( 'TIPO' ).AsString = 'D' then
            Where := Where + #13#10 + '  AND AD.DATA BETWEEN :DATAINI AND :DATAFIM '
          else if FieldByName( 'TIPO' ).AsString = 'E' then
            Where := Where + #13#10 + '  AND EZ.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM '
          else if FieldByName( 'TIPO' ).AsString = 'P' then
            Where := Where + #13#10 + '  AND EZ.DATAABORTOPARTO BETWEEN :DATAINI AND :DATAFIM ' ;

          if ( FColuna = 'EVENTO' ) or ( FColuna = 'TOTAL' ) then
            begin
              vDataIni := deDataInicial.Date ;
              vDataFim := deDataFinal.Date ;

              p.CreateParam( ftTimeStamp, 'DATAINI', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay( vDataIni ));
              p.CreateParam( ftTimeStamp, 'DATAFIM', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay( vDataFim ));
            end
          else
            begin
              vDataIni := StartOfTheMonth( StrToDate( '10/' + Copy( FColuna, 5, Pos( '-', FColuna )-5 ) + '/' +
                                                      Copy( FColuna, Pos( '-', FColuna ) + 1, Length( FColuna )) ));

              if vDataIni < deDataInicial.Date then
                vDataIni := deDataInicial.Date;

              vDataFim := EndOfTheMonth( StrToDate( '20/' + Copy( FColuna, 5, Pos( '-', FColuna )-5 ) + '/' +
                                                   Copy( FColuna, Pos( '-', FColuna ) + 1, Length( FColuna )) ));

              if vDataFim > deDataFinal.Date then
                vDataFim := deDataFinal.Date;

              p.CreateParam( ftTimeStamp, 'DATAINI', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( vDataIni );
              p.CreateParam( ftTimeStamp, 'DATAFIM', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( vDataFim );
            end;
        end
      else // trDiasEmLactacao
        begin
          if ( FColuna <> 'Evento' ) and ( FColuna <> 'Total' ) then
            begin
              if FColuna = '>= 330' then
                begin
                  Where := Where + #13#10 + '  AND LA.DEL >= :DEL_2 ' ;
                  DEL_2 := StrToInt( Copy( FColuna, Pos( ' ', FColuna) + 1, Length( FColuna ) ) );
                end
              else
                begin
                  Where := Where + #13#10 + '  AND LA.DEL BETWEEN :DEL_1 AND :DEL_2 ';
                  DEL_1 := StrToInt( Copy( FColuna, 1, Pos( '-', FColuna ) - 1 ));
                  p.CreateParam( ftInteger, 'DEL_1', ptInput).AsInteger := DEL_1;
                  DEL_2 := StrToInt( Copy( FColuna, Pos( '-', FColuna) + 1, Length( FColuna ) ) );
                end;

              vDataIni := deDataInicial.Date ;
              vDataFim := deDataFinal.Date ;
              p.CreateParam( ftInteger, 'DEL_2', ptInput).AsInteger := DEL_2;
            end
          else
            begin
              vDataIni := deDataInicial.Date ;
              vDataFim := deDataFinal.Date ;
            end;

          if FieldByName( 'TIPO' ).AsString = 'D' then
            Where := Where + #13#10 + '  AND AD.DATA BETWEEN :DATAINI AND :DATAFIM '
          else if FieldByName( 'TIPO' ).AsString = 'E' then
            Where := Where + #13#10 + '  AND EZ.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM '
          else if FieldByName( 'TIPO' ).AsString = 'P' then
            Where := Where + #13#10 + '  AND EZ.DATAABORTOPARTO BETWEEN :DATAINI AND :DATAFIM ' ;

          p.CreateParam( ftTimeStamp, 'DATAINI', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay( vDataIni ));
          p.CreateParam( ftTimeStamp, 'DATAFIM', ptInput).AsSQLTimeStamp := DateTimeToSQLTimeStamp( EndOfTheDay( vDataFim ));
        end;

      TZoo_RelatorioRastreamentoFormDialog.Execute( FieldByName( 'TIPO' ).AsString, Where, p,
                                                    cbFiltroRepeteAnimal.Checked );
    end;

  p.Free;
  Where := EmptyStr;
end;

procedure TZoo_RelatorioRastreamento.dbgRelatorioRastreamentoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  CellClicked := x ;
end;

procedure TZoo_RelatorioRastreamento.dbgRelatorioRastreamentoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

procedure TZoo_RelatorioRastreamento.dblcRastreamentoCloseUp(Sender: TObject);
begin
  if    ( cdsRelatorios.FieldByName( 'KZOO_RASTREAMENTO' ).asString <> '' )
   and (    ( FKZOO_RASTREAMENTO = '' ) or ( dblcRastreamento.KeyValue <> FKZOO_RASTREAMENTO ) ) then
    begin
      FKZOO_RASTREAMENTO := dblcRastreamento.KeyValue ;
      LoadConfiguracao;
    end;
end;

procedure TZoo_RelatorioRastreamento.dblcRastreamentoEnter(Sender: TObject);
begin
  if ( cdsRelatorios.ChangeCount > 0 )
   and ( MessageDlg ( 'Deseja salvar o reltório', mtConfirmation ) = mrYes ) then
    SaveReport;
end;

procedure TZoo_RelatorioRastreamento.dblcRastreamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
   and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
      Key := 0 ;
      TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_RelatorioRastreamento.DestroiCampos;
begin
  if cdsResultado.Active then
     cdsResultado.Close;

  cdsResultado.FieldDefs.Clear;
  cdsResultado.Fields.Clear;

  cdsRastreadores.IndexDefs.Clear;
  cdsRastreadores.IndexFieldNames := '';

  FreeAndNil( FParametros );
  FreeAndNil( cdsRastreadores );
end;

destructor TZoo_RelatorioRastreamento.Destroy;
begin
  cdsAtividades.Free;
  cdsSelecionados.Free;
  cdsRastreadores.Free;
  cdsResultado.Free;
  cdsRelatorios.Free;

  if Assigned( FParametros ) then
    FParametros.Free;

  inherited;
end;

class function TZoo_RelatorioRastreamento.Execute: Boolean;
var
  ThisForm: TZoo_RelatorioRastreamento;
begin
  ThisForm := TZoo_RelatorioRastreamento.Create(nil);
  try
    Result := ThisForm.ShowModal = mrOK;
    if Result then
      { ThisForm.DoSomething } ;
  finally
    ThisForm.Free;
  end;

end;

procedure TZoo_RelatorioRastreamento.GeraRelatorio;
var
  i : Integer;
  ErrMsg : string;
  Parametro : string;
  SQL_RASTREAMENTO : string;
  SQL_DIAGNOSTICO : string;
  SQL_EVENTOS_ZOO : string;
  SQL_PARTOABORTO : string;
  SQL_DIAS_LACATACAO : string ;
  Fecha_D : Boolean;
  Fecha_E : Boolean;
  Fecha_P : Boolean;
  p : TParams;
begin
  FParametros := TParams.Create();
  dtsRelatorioRastreamento.DataSet := nil;

  if FTipoRelatorio = trMensal then
    begin
      if cbFiltroRepeteAnimal.Checked then
        begin
          SQL_EVENTOS_ZOO  := 'SELECT ';
          SQL_PARTOABORTO  := 'SELECT ';
          SQL_DIAGNOSTICO  := 'SELECT ';
          lbRepete.Caption := 'Sim'
        end
      else
        begin
          SQL_EVENTOS_ZOO  := 'SELECT DISTINCT ';
          SQL_PARTOABORTO  := 'SELECT DISTINCT ';
          SQL_DIAGNOSTICO  := 'SELECT DISTINCT ';
          lbRepete.Caption := 'Não';
        end;

      SQL_EVENTOS_ZOO := SQL_EVENTOS_ZOO +
                    #13#10 + '  ''E'' TIPO, ' +
                    #13#10 + '  EZ.TIPOEVENTO CODIGO, ' +
                    #13#10 + '  (     SELECT S.SYS$DESCRIPTION FROM SYS$TYPES S ' +
                    #13#10 + '         WHERE S.SYS$TYPE = ''TIPO_EVENTO_ZOO'' ' +
                    #13#10 + '           AND S.SYS$VALUE = EZ.TIPOEVENTO ' +
                    #13#10 + '   ) EVENTO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM EZ.DATAEVENTO) MES, ' +
                    #13#10 + '  EXTRACT(YEAR FROM EZ.DATAEVENTO) ANO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM EZ.DATAEVENTO) || ''-'' || EXTRACT(YEAR FROM EZ.DATAEVENTO) TITULO, ' +
                    #13#10 + '  AN.BRINCO, ' +
                    #13#10 + '  1 TOTAL ' +
                    #13#10 + 'FROM ZOO_EVENTOS_ZOOTECNICOS EZ ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS AN ON AN.KZOO_ANIMAL = EZ.KZOO_ANIMAL_FEMEA ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA (AF.KZOO_ANIMAL_FEMEA, COALESCE(EZ.DATATOQUE, EZ.DATAEVENTO) ) ST ON 1=1 ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA (AF.KZOO_ANIMAL_FEMEA, :DATAFIM) NL ON 1=1 ';

      SQL_PARTOABORTO := SQL_PARTOABORTO  +
                    #13#10 + '  ''P'' TIPO, ' +
                    #13#10 + '  EZ.ABORTOPARTO CODIGO, ' +
                    #13#10 + '  (  SELECT S.SYS$DESCRIPTION FROM SYS$TYPES S ' +
                    #13#10 + '      WHERE S.SYS$TYPE = ''TIPO_PARTOABORTO'' ' +
                    #13#10 + '        AND S.SYS$VALUE = EZ.ABORTOPARTO ' +
                    #13#10 + '   ) EVENTO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM EZ.DATAABORTOPARTO) MES, ' +
                    #13#10 + '  EXTRACT(YEAR FROM EZ.DATAABORTOPARTO) ANO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM EZ.DATAABORTOPARTO) || ''-'' || EXTRACT(YEAR FROM EZ.DATAABORTOPARTO) TITULO, ' +
                    #13#10 + '  AN.BRINCO, ' +
                    #13#10 + '  1 TOTAL ' +
                    #13#10 + 'FROM ZOO_EVENTOS_ZOOTECNICOS EZ ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS AN ON AN.KZOO_ANIMAL = EZ.KZOO_ANIMAL_FEMEA ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA (AF.KZOO_ANIMAL_FEMEA, EZ.DATAABORTOPARTO ) ST ON 1=1 ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA (AF.KZOO_ANIMAL_FEMEA, :DATAFIM) NL ON 1=1 ';

      SQL_DIAGNOSTICO := SQL_DIAGNOSTICO +
                    #13#10 + '  ''D'' TIPO, ' +
                    #13#10 + '  AD.KZOO_DIAGNOSTICO CODIGO, ' +
                    #13#10 + '  AD.NOME EVENTO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM AD.DATA) MES, ' +
                    #13#10 + '  EXTRACT(YEAR FROM AD.DATA) ANO, ' +
                    #13#10 + '  EXTRACT(MONTH FROM AD.DATA) || ''-'' || EXTRACT(YEAR FROM AD.DATA) TITULO, ' +
                    #13#10 + '  AN.BRINCO, ' +
                    #13#10 + '  1 TOTAL ' +
                    #13#10 + 'FROM ZOO_ANIMAL_DIAGNOSTICOS AD ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS AN ON AN.KZOO_ANIMAL = AD.KZOO_ANIMAL_FEMEA ' +
                    #13#10 + 'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA (AF.KZOO_ANIMAL_FEMEA, AD.DATA ) ST ON 1=1 ' +
                    #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA (AF.KZOO_ANIMAL_FEMEA, :DATAFIM) NL ON 1=1 ';

      lbTiporelatorio.Caption := 'Mensal';
      label2.Visible := True;
    end
  else // trDiasEmLactacao
    begin
      SQL_EVENTOS_ZOO := 'SELECT ' +
                    #13#10 + '  ''E'' TIPO, ' +
                    #13#10 + '  EZ.TIPOEVENTO CODIGO, ' +
                    #13#10 + '  (     SELECT S.SYS$DESCRIPTION FROM SYS$TYPES S ' +
                    #13#10 + '         WHERE S.SYS$TYPE = ''TIPO_EVENTO_ZOO'' ' +
                    #13#10 + '           AND S.SYS$VALUE = EZ.TIPOEVENTO ' +
                    #13#10 + '   ) "Evento", ' ;

      SQL_PARTOABORTO := 'SELECT ' +
                    #13#10 + '  ''P'' TIPO, ' +
                    #13#10 + '  EZ.ABORTOPARTO CODIGO, ' +
                    #13#10 + '  (  SELECT S.SYS$DESCRIPTION FROM SYS$TYPES S ' +
                    #13#10 + '      WHERE S.SYS$TYPE = ''TIPO_PARTOABORTO'' ' +
                    #13#10 + '        AND S.SYS$VALUE = EZ.ABORTOPARTO ' +
                    #13#10 + '   ) "Evento", ' ;

      SQL_DIAGNOSTICO := 'SELECT ' +
                    #13#10 + '  ''D'' TIPO, ' +
                    #13#10 + '  AD.KZOO_DIAGNOSTICO CODIGO, ' +
                    #13#10 + '  AD.NOME "Evento", ' ;

      SQL_DIAS_LACATACAO :=
        #13#10 + '  COUNT( 1 ) "Total", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN   1 AND  29 THEN AN.BRINCO END )    "1-29", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN  30 AND  59 THEN AN.BRINCO END )   "30-59", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN  60 AND  89 THEN AN.BRINCO END )   "60-89", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN  90 AND 119 THEN AN.BRINCO END )  "90-119", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 120 AND 149 THEN AN.BRINCO END ) "120-149", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 150 AND 179 THEN AN.BRINCO END ) "150-179", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 180 AND 209 THEN AN.BRINCO END ) "180-209", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 210 AND 239 THEN AN.BRINCO END ) "210-239", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 240 AND 269 THEN AN.BRINCO END ) "240-269", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 270 AND 299 THEN AN.BRINCO END ) "270-299", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL BETWEEN 300 AND 329 THEN AN.BRINCO END ) "300-329", ' +
        #13#10 + '  COUNT( CASE WHEN LA.DEL >= 330 THEN AN.BRINCO END ) ">= 330" ' +
        #13#10 + 'FROM ZOO_ANIMAIS AN ' +
        #13#10 + 'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
        #13#10 + 'LEFT JOIN ( SELECT L.KZOO_LACTACAO, ' +
        #13#10 + '              CAST(IIF ( ( ( L.DATA_SECAGEM IS NOT NULL ) OR ( L.DATA_SECAGEM <= :DATAFIM )), ' +
        #13#10 + '                           L.DATA_SECAGEM - L.DATALACTACAO, ' +
        #13#10 + '                           DATEDIFF( DAY, L.DATALACTACAO, :DATAFIM ) ' +
        #13#10 + '                   ) AS INT ) DEL ' +
        #13#10 + '             FROM ZOO_LACTACOES L ' +
        #13#10 + '           ) LA ON LA.KZOO_LACTACAO = AF.KULTIMA_LACTACAO ' ;

      SQL_EVENTOS_ZOO  := SQL_EVENTOS_ZOO  + SQL_DIAS_LACATACAO +
        #13#10 + 'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA ' +
        #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAEVENTO ) ST ON 1=1 ' +
        #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAEVENTO ) NL ON 1=1 ';

      SQL_PARTOABORTO  := SQL_PARTOABORTO  + SQL_DIAS_LACATACAO +
        #13#10 + 'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA ' +
        #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAABORTOPARTO ) ST ON 1=1 ' +
        #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAABORTOPARTO ) NL ON 1=1 ';

      SQL_DIAGNOSTICO := SQL_DIAGNOSTICO + SQL_DIAS_LACATACAO +
        #13#10 + 'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON AD.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
        #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, AD.DATA ) ST ON 1=1 ' +
        #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, AD.DATA ) NL ON 1=1 ';

      lbTiporelatorio.Caption := 'Dias de lactação';
      label2.Visible := False;
    end;

  FSQL_WHERE := #13#10 + 'WHERE AN.KCAD_FAZENDA = :KCAD_FAZENDA AND AN.STATUS <> :STATUS_DESCARTADO ';
  FParametros.CreateParam( ftString, 'KCAD_FAZENDA', ptInput).asString := LoggedUser.DomainID;
  FParametros.CreateParam( ftString, 'STATUS_DESCARTADO', ptInput).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

  // CATEGORIAS
  lbCategoria.Caption := '';

  if rbCategoriaNovilhas.Checked then
    begin
      if rbCategoriaVacas.Checked then
        FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND (  ( NL.NL < 1 ' +
                                   #13#10 + '           AND DATEADD( :DESMAME MONTH TO AF.NASCIMENTO ) <= :DATAFIM ' +
                                   #13#10 + '          ) '
      else
        begin
          FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND NL.NL < 1 ' +
                                     #13#10 + '  AND DATEADD( :DESMAME MONTH TO AF.NASCIMENTO ) <= :DATAFIM ';

          Label5.Caption := 'Categoria :';
          lbCategoria.Caption := 'Novilhas';
        end;

      FParametros.CreateParam( ftInteger, 'DESMAME', ptInput).AsInteger := _ST_STATUS_DESMAME_BEZERRO ;
    end;

  if rbCategoriaVacas.Checked then
    begin
      if rbCategoriaNovilhas.Checked then
        begin
          FSQL_WHERE := FSQL_WHERE + #13#10 + '        OR NL.NL ' + Copy( cbCategoriaCondicao.Text, 1, 2 ) + ' :NL ' +
                                     #13#10 + '      ) ';
          Label5.Caption := 'Novilhas /';
          lbCategoria.Caption := 'Lactação :';
        end
      else
        begin
          FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND NL.NL ' + Copy( cbCategoriaCondicao.Text, 1, 2 ) + ' :NL ';
          Label5.Caption := 'Lactação ';
        end;
      FParametros.CreateParam( ftInteger, 'NL', ptInput).AsInteger := seCategoriaValor.AsInteger;
      lbCategoria.Caption := lbCategoria.Caption + ' ' + Copy( cbCategoriaCondicao.Text, 1, 2 ) + ' ' + IntToStr( seCategoriaValor.AsInteger );
    end;

  // STATUS
  case FStatusAnimal of
    saTodos : lbStatus.Caption := 'Todas';
    saPrenhe :
      begin
        FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND ST.STATUS = ''PRENHE'' ';
        lbStatus.Caption := 'Prenhes';
      end  ;
    saCoberto :
      begin
        FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND ST.STATUS = ''COBERTA'' ';
        lbStatus.Caption := 'Cobertas';
      end ;
    saVazio :
      begin
        FSQL_WHERE := FSQL_WHERE + #13#10 + '  AND ST.STATUS = ''VAZIA'' ';
        lbStatus.Caption := 'Vazias';
      end ;
  end;

  p := TParams.Create;
  p.Assign( FParametros );

  // DATA REFERENCIA
  SQL_EVENTOS_ZOO := SQL_EVENTOS_ZOO + FSQL_WHERE + #13#10 + '  AND EZ.DATAEVENTO BETWEEN :DATAINI AND :DATAFIM ';
  SQL_PARTOABORTO := SQL_PARTOABORTO + FSQL_WHERE + #13#10 + '  AND EZ.DATAABORTOPARTO BETWEEN :DATAINI AND :DATAFIM ';
  SQL_DIAGNOSTICO := SQL_DIAGNOSTICO + FSQL_WHERE + #13#10 + '  AND AD.DATA BETWEEN :DATAINI AND :DATAFIM ';

  p.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay( deDataInicial.Date ));
  p.CreateParam( ftTimeStamp, 'DATAFIM', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( StartOfTheDay( deDataFinal.Date ));

  lbDataRelativa.Caption := DateTimeToStr( deDataInicial.Date ) + ' a ' + DateTimeToStr( deDataFinal.Date );

  // FILTROS
  if GetSelecionados then
    begin
      cdsSelecionados.First;
      cdsSelecionados.DisableControls;

      for i := 0 to cdsSelecionados.RecordCount - 1 do
        begin
          Parametro := 'FLTRO_' + IntToStr(i);

          if cdsSelecionados.FieldByName('TIPO').AsString = 'E' then
            begin
              if not Fecha_E  then
                begin
                  SQL_EVENTOS_ZOO  := SQL_EVENTOS_ZOO  + #13#10 + '  AND (   EZ.TIPOEVENTO = :' + Parametro;
                  Fecha_E := True;
                end
              else
                SQL_EVENTOS_ZOO  := SQL_EVENTOS_ZOO  + #13#10 + '       OR ( EZ.TIPOEVENTO = :' + Parametro + ' ) ';
            end
          else if cdsSelecionados.FieldByName('TIPO').AsString = 'P' then
            begin
              if not Fecha_P  then
                begin
                  SQL_PARTOABORTO  := SQL_PARTOABORTO  + #13#10 + '  AND (   EZ.ABORTOPARTO = :' + Parametro ;
                  Fecha_P := True
                end
              else
                SQL_PARTOABORTO  := SQL_PARTOABORTO  + #13#10 + '       OR ( EZ.ABORTOPARTO = :' + Parametro + ' ) ';
            end
          else if cdsSelecionados.FieldByName('TIPO').AsString = 'D' Then
            begin
              if not Fecha_D then
                begin
                  SQL_DIAGNOSTICO := SQL_DIAGNOSTICO + #13#10 + '  AND(     AD.KZOO_DIAGNOSTICO  = :' + Parametro ;
                  Fecha_D := True;
                end
              else
                SQL_DIAGNOSTICO := SQL_DIAGNOSTICO + #13#10 + '       OR ( AD.KZOO_DIAGNOSTICO  = :' + Parametro + ' ) ';
            end;

          p.CreateParam( ftString, Parametro, ptInput ).AsString := cdsSelecionados.FieldByName('CODIGO').AsString;
          cdsSelecionados.Next;
        end;

      cdsSelecionados.First;
      cdsSelecionados.EnableControls;
    end;

    if Fecha_E then
      begin
        SQL_EVENTOS_ZOO  := SQL_EVENTOS_ZOO    + #13#10 + '       ) ' ;

        if FTipoRelatorio = trDiasEmLactacao then
          SQL_EVENTOS_ZOO := SQL_EVENTOS_ZOO   + #13#10 + 'GROUP BY 1,2,3';

        SQL_RASTREAMENTO := SQL_EVENTOS_ZOO ;
      end;

    if Fecha_P then
      begin
        SQL_PARTOABORTO  := SQL_PARTOABORTO  + '       ) ' ;

        if FTipoRelatorio = trDiasEmLactacao then
          SQL_PARTOABORTO := SQL_PARTOABORTO + #13#10 + 'GROUP BY 1,2,3';

        if Fecha_E then
          SQL_RASTREAMENTO := SQL_RASTREAMENTO + #13#10 + 'UNION ALL' + #13#10 + SQL_PARTOABORTO
        else
          SQL_RASTREAMENTO := SQL_PARTOABORTO;
      end;

    if Fecha_D then
      begin
        SQL_DIAGNOSTICO := SQL_DIAGNOSTICO     + #13#10 + '       ) ' ;

        if FTipoRelatorio = trDiasEmLactacao  then
          SQL_DIAGNOSTICO := SQL_DIAGNOSTICO + #13#10 + 'GROUP BY 1,2,3';

        if Fecha_E or Fecha_P then
          SQL_RASTREAMENTO := SQL_RASTREAMENTO + #13#10 + 'UNION ALL ' + #13#10 + SQL_DIAGNOSTICO
        else
          SQL_RASTREAMENTO := SQL_DIAGNOSTICO;
      end;

  if FTipoRelatorio = trMensal then SQL_RASTREAMENTO := SQL_RASTREAMENTO + #13#10 + 'ORDER BY 5,4,1';

  Memo1.Text := SQL_RASTREAMENTO + #13#10 ;
  for i := 0 to p.Count-1 do
    Memo1.Text := Memo1.Text + #13#10 + p[i].Name + ' - ' + p[i].Text;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsRastreadores, SQL_RASTREAMENTO, p );

  if FTipoRelatorio = trMensal then
    begin
      CriaCampos;
      cdsRastreadores.Close;
    end
  else // trDiasEmLactacao
    begin
      dtsRelatorioRastreamento.DataSet := cdsRastreadores;
      cdsRastreadores.First;

      for i := 0 to cdsRastreadores.FieldCount - 1 do
        if ( cdsRastreadores.Fields[i] is TIntegerField ) then
          begin
            if cdsRastreadores.Fields[i].FieldName <> 'Total' then
              cdsRastreadores.Fields[i].OnGetText   := GetText;

            cdsRastreadores.Fields[i].Alignment     := taCenter;
          end;

      for i := 0 to dbgRelatorioRastreamento.Columns.Count - 1 do
        if dbgRelatorioRastreamento.Columns[ i ].FieldName = 'EVENTO' then
          dbgRelatorioRastreamento.Columns[ i ].Width := 60
        else
          dbgRelatorioRastreamento.Columns[ i ].Width := 40;

      cdsRastreadores.FieldByName('TIPO'  ).Visible := False ;
      cdsRastreadores.FieldByName('CODIGO').Visible := False ;
      CompletaDiasEmLactacao;
    end;

  p.Free;
end;

function TZoo_RelatorioRastreamento.GetSelecionados: Boolean;
var
  i : integer ;
begin
  with cdsSelecionados do
    begin
      Result := not isEmpty;

      if not Result then
        Exit;

      IndexDefs.Clear;
      IndexFieldNames := '';
      IndexFieldNames := 'ORD';
      FSelecionados.Clear;

      First;
      DisableControls;

      FSelecionados.Add( FieldByName( 'TIPO' ).asString + '-'+ FieldByName( 'NOME' ).asString );
      Next;

      for i := 0 to RecordCount - 2 do
        begin
          FSelecionados.Add( ','+ FieldByName( 'TIPO' ).asString + '-'+ FieldByName( 'NOME' ).asString );
          Next;
        end;

      First;
      EnableControls;
    end;
end;

function TZoo_RelatorioRastreamento.GetUltimaPesagem: TDate;
var
  cds : TClientDataSet;
  p : TParams;
begin
  p := TParams.Create();
  cds := nil;

  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, 'SELECT CAST( MAX( DATA ) AS DATE ) DATA ' +
                                                                      'FROM ZOO_PESAGEM_LEITE ' +
                                                                      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA' , p);

  Result := cds.FieldByName( 'DATA' ).AsDateTime;

  cds.Free;
  p.Free;
end;

procedure TZoo_RelatorioRastreamento.IncluiAltera( ANewReport : boolean );
const
  _SQL_INSERT = 'INSERT INTO ZOO_RASTREAMENTO ('
                      +#13#10'  KZOO_RASTREAMENTO'
                      +#13#10', KCAD_FAZENDA'
                      +#13#10', NOME'
                      +#13#10', TIPO_RELATORIO'
                      +#13#10', CATEGORIA_NOVILHAS'
                      +#13#10', CATEGORIA_VACAS';
  _SQL_INSERT_PARAMS = #13#10' ) VALUES ('
                      +#13#10'  :KZOO_RASTREAMENTO'
                      +#13#10', :KCAD_FAZENDA'
                      +#13#10', :NOME'
                      +#13#10', :TIPO_RELATORIO'
                      +#13#10', :CATEGORIA_NOVILHAS'
                      +#13#10', :CATEGORIA_VACAS' ;

  _SQL_UPDATE = 'UPDATE ZOO_RASTREAMENTO'
            +#13#10'SET TIPO_RELATORIO = :TIPO_RELATORIO'
            +#13#10', CATEGORIA_NOVILHAS = :CATEGORIA_NOVILHAS'
            +#13#10', CATEGORIA_VACAS = :CATEGORIA_VACAS' ;
var
  p: TParams;
  x: Integer;
  sqlStmt, sqlStmtInsetParams, ErrMsg: string;

  procedure AddToSQLStmt ( AFieldName : String ; AValue : Variant ; AFieldType : TFieldType ) ;
  begin
     p.CreateParam( AFieldType, AFieldName, ptInput ).Value := AValue ;
     if ANewReport then
       begin
        sqlStmt := sqlStmt + #13#10', ' + AFieldName ;
        sqlStmtInsetParams := sqlStmtInsetParams + #13#10', :' + AFieldName ;
       end
     else
        sqlStmt := sqlStmt + #13#10', ' + AFieldName + ' = :' + AFieldName ;
  end;

  procedure GetInitialSQLStmt ;
  begin
    if ANewReport then
      begin
        sqlStmt := _SQL_INSERT ;

        sqlStmtInsetParams     := _SQL_INSERT_PARAMS ;

        FKZOO_RASTREAMENTO := GuidStr20;
        p.CreateParam( ftString, 'KZOO_RASTREAMENTO', ptInput ).asString := FKZOO_RASTREAMENTO;
        p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString      := LoggedUser.DomainID;
        p.CreateParam( ftString, 'NOME', ptInput ).asString              := Trim( edtSaveAs.Text ) ;
      end
    else // update
      sqlStmt := _SQL_UPDATE ;

     // TIPO RELATORIO
    p.CreateParam( ftInteger, 'TIPO_RELATORIO', ptInput ).AsInteger := Ord ( FTipoRelatorio ) + 1 ;

    // CATEGORIAS
    p.CreateParam(ftString, 'CATEGORIA_NOVILHAS', ptInput).AsString := BoolToChar( rbCategoriaNovilhas.Checked );
    p.CreateParam(ftString, 'CATEGORIA_VACAS', ptInput).AsString    := BoolToChar( rbCategoriaVacas.Checked );
  end;
begin
  p := TParams.Create;
  p.Clear;

  GetInitialSQLStmt ;

  if rbCategoriaVacas.Checked then
    begin
      AddToSQLStmt ( 'CATEGORIA_CONDICAO', cbCategoriaCondicao.ItemIndex, ftInteger ) ;
      AddToSQLStmt ( 'CATEGORIA_LACTACAO', seCategoriaValor.AsInteger,    ftInteger );
    end;

  // DATA REFERENCIA
  AddToSQLStmt ( 'DATA_REFERENCIA', Ord ( FDataReferencia ) + 1, ftInteger ) ;
  AddToSQLStmt ( 'DATA_INICIAL',    deDataInicial.Date,          ftDate ) ;
  AddToSQLStmt ( 'DATA_FINAL',      deDataFinal.Date,            ftDate ) ;

  AddToSQLStmt ( 'RELATIVA_HOJE',   seDiasDataRelativa.AsInteger, ftInteger ) ;
  AddToSQLStmt ( 'RELATIVA_TIPO',   cbTipoDataRelativa.ItemIndex, ftInteger ) ;

  AddToSQLStmt ( 'STATUS',        Ord ( FStatusAnimal ) + 1, ftInteger ) ;

  AddToSQLStmt ( 'REPETE_ANIMAL', BoolToChar( cbFiltroRepeteAnimal.Checked ), ftString ) ;

  AddToSQLStmt ( 'FILTRO_SELECIONADO', ifThen ( GetSelecionados, FSelecionados.Text, EmptyStr ), ftString ) ;

  if ANewReport then
     sqlStmt := sqlStmt + sqlStmtInsetParams + ')'
  else
    begin
      sqlStmt := sqlStmt + ' WHERE KZOO_RASTREAMENTO = :KZOO_RASTREAMENTO';
      p.CreateParam(ftString, 'KZOO_RASTREAMENTO',  ptInput).asString := FKZOO_RASTREAMENTO;
    end;

  try
    try
      TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute(sqlStmt, p);
      MessageDlg('Relatório salvo com sucesso.' ) ;
    Except On E: Exception do
       begin
        ErrMsg := #13#10'-Stmt : ' + sqlStmt + #13#10'-Parametros : ' ;
        for x := 0 to p.Count - 1 do
            ErrMsg := ErrMsg + #13#10 + p[x].Name + ' - ' + p[x].Text;
        RaiseExceptionFmt( E, UnitName, ClassName, 'IncluiAltera', 'Erro ao salvar relatório de rastreamento. %s', [ ErrMsg ]  );
       end ;
    end;
  finally
    p.Free;
  end;

  LoadReports;

  dblcRastreamento.KeyValue := FKZOO_RASTREAMENTO ;
end;

procedure TZoo_RelatorioRastreamento.LoadConfiguracao;
var
  GSelecionados, Selecao: string;
  FSelecionado: TStringList;
  i: Integer;
begin
  FSelecionado := TStringList.Create;

  with cdsRelatorios do
    begin
      if isEmpty then raise Warning.Create('Relatório não encontrado');

      // TIPO RELATORIO
      rgTipoRelatorio.ItemIndex := FieldByName( 'TIPO_RELATORIO' ).AsInteger - 1 ;

      // CATEGORIAS
      rbCategoriaNovilhas.Checked   := FieldByName( 'CATEGORIA_NOVILHAS' ).AsBoolean;
      rbCategoriaVacas.Checked      := FieldByName( 'CATEGORIA_VACAS'    ).AsBoolean;
      cbCategoriaCondicao.ItemIndex := FieldByName( 'CATEGORIA_CONDICAO' ).AsInteger;
      seCategoriaValor.AsInteger    := FieldByName( 'CATEGORIA_LACTACAO' ).AsInteger;

      // DATA REFERENCIA
      FDataReferencia := TDataReferencia ( FieldByName('DATA_REFERENCIA').AsInteger - 1 ) ;
      case FDataReferencia of
        drPeriodo       : rbDataPeriodo.Checked       := True ;
        drRelativa      : rbDataRelativa.Checked      := True ;
        drUltimaPesagem : rbDataUltimaPesagem.Checked := True ;
      end;

      deDataInicial.Date           := FieldByName( 'DATA_INICIAL'  ).AsDateTime;
      deDataFinal.Date             := FieldByName( 'DATA_FINAL'    ).AsDateTime;
      seDiasDataRelativa.AsInteger := FieldByName( 'RELATIVA_HOJE' ).AsInteger;
      cbTipoDataRelativa.ItemIndex := FieldByName( 'RELATIVA_TIPO' ).AsInteger;

      // STATUS
      FStatusAnimal            := TStatusAnimal ( FieldByName( 'STATUS' ).AsInteger - 1 ) ;
      rgStatusAnimal.ItemIndex := Ord ( FStatusAnimal ) ;

//      ValidaCamposCategorias;
//      ValidaCamposDataReferencia;

      // FILTROS
      cbFiltroRepeteAnimal.Checked := FieldByName( 'REPETE_ANIMAL'      ).AsBoolean;
      GSelecionados                := FieldByName( 'FILTRO_SELECIONADO' ).asString;

      ExtractStrings( [','], [], pchar( GSelecionados ), FSelecionado);

      if not cdsSelecionados.isEmpty then CopyAllAtividades( cdsSelecionados, cdsAtividades );

      cdsAtividades.DisableControls;
      for i := 0 to FSelecionado.Count - 1 do
        begin
          cdsAtividades.Locate( 'TIPO;NOME', VarArrayOf([Copy(FSelecionado[i], 0, 1),
                                             Copy(FSelecionado[i], 3, Length(FSelecionado[i])) ]) , [] );
          CopyAtividadeSelecionada( cdsAtividades, cdsSelecionados );
        end;

      cdsAtividades.First;
      cdsAtividades.EnableControls;
    end;
end;

procedure TZoo_RelatorioRastreamento.LoadReports;
  procedure CarregaPadrao;
    begin

      FStatusAnimal  := saTodos ;
      FTipoRelatorio := trMensal ;

      rgTipoRelatorio.ItemIndex    := Ord ( FTipoRelatorio ) ;
      rbCategoriaVacas.Checked     := True;
      rbDataPeriodo.Checked        := True;
      deDataInicial.Date           := IncYear(Date, -1);
      deDataFinal.Date             := Date;
      rgStatusAnimal.ItemIndex     := Ord ( FStatusAnimal ) ;
      cbFiltroRepeteAnimal.Checked := True;

      if not cdsSelecionados.IsEmpty then
        CopyAllAtividades( cdsSelecionados, cdsAtividades );

      ValidaCamposCategorias;
      ValidaCamposDataReferencia;
    end;

const
  SELECT_RELATORIOS = 'SELECT KZOO_RASTREAMENTO, KCAD_FAZENDA, NOME, ' +
                      '  TIPO_RELATORIO, CATEGORIA_NOVILHAS,         ' +
                      '  CATEGORIA_VACAS, CATEGORIA_CONDICAO,        ' +
                      '  CATEGORIA_LACTACAO, DATA_REFERENCIA,        ' +
                      '  DATA_INICIAL, DATA_FINAL, RELATIVA_HOJE,    ' +
                      '  RELATIVA_TIPO, STATUS, REPETE_ANIMAL,       ' +
                      '  FILTRO_SELECIONADO                          ' +
                      'FROM ZOO_RASTREAMENTO                         ' +
                      'WHERE KCAD_FAZENDA = :KCAD_FAZENDA            ' +
                      'ORDER BY NOME ';
var
  p: TParams;
  Lista: TStrings;
begin
  p := TParams.Create;
  p.CreateParam(ftString, 'KCAD_FAZENDA', ptInput ).asString      := LoggedUser.DomainID;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsRelatorios, SELECT_RELATORIOS, p );
  dtsRelatorios.DataSet := cdsRelatorios;

  btnDelete.Enabled := not cdsRelatorios.IsEmpty;

  if cdsRelatorios.IsEmpty then
    begin
      CarregaPadrao;
      Exit;
    end;

  if ( FKZOO_RASTREAMENTO <> '' ) then
     cdsRelatorios.Locate ( 'KZOO_RASTREAMENTO', FKZOO_RASTREAMENTO,  [] ) ;

  LoadConfiguracao;
  p.Free;
end;

function TZoo_RelatorioRastreamento.NameMonth(Mes:Integer; Abrev:Boolean): String;
const
  NameL : array [1..12] of String = ( 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio',
                                      'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro',
                                      'Novembro', 'Dezembro');
begin
  if (Mes in [1..12]) then
     if Abrev then
        Result := Copy(NameL[Mes],1,3)
     else
     Result := NameL[Mes];
end;

procedure TZoo_RelatorioRastreamento.PreencheGrid;
var
  FTOTAL, i  : Integer;
  FNomeCampo : string;
begin
  cdsRastreadores.IndexDefs.Clear;
  cdsRastreadores.IndexFieldNames := '';
  cdsRastreadores.IndexFieldNames := 'ANO;MES';

  cdsSelecionados.First;
  cdsSelecionados.DisableControls;
  while not cdsSelecionados.Eof do
    begin
      with cdsRastreadores do
        begin
          FTOTAL   := 0;
          Filtered := False;
          Filter   :=   'CODIGO = ' + '''' + cdsSelecionados.FieldByName( 'CODIGO' ).asString + ''''
                      + ' AND TIPO = ' + '''' + cdsSelecionados.FieldByName( 'TIPO' ).asString + ''''
                      + ' AND EVENTO = ' + '''' + cdsSelecionados.FieldByName( 'NOME' ).asString + '''' ;
          Filtered := True;
          First;
          DisableControls;

          cdsResultado.Append;
          cdsResultado.FieldByName( 'CODIGO' ).asString := cdsSelecionados.FieldByName( 'CODIGO' ).asString;
          cdsResultado.FieldByName( 'TIPO' ).asString   := cdsSelecionados.FieldByName( 'TIPO'   ).asString;
          cdsResultado.FieldByName( 'EVENTO' ).asString := cdsSelecionados.FieldByName( 'NOME'   ).asString;

//          for i := 3 to cdsResultado.FieldCount - 1 do
//            cdsResultado.Fields[i].AsInteger := 0;

          while not Eof do
            begin
              FNomeCampo := FieldByName( 'TITULO' ).asString;
              cdsResultado.FieldByName( 'MES_' + FNomeCampo).AsInteger :=
                                                      cdsResultado.FieldByName( 'MES_' + FNomeCampo).AsInteger
                                                      + FieldByName( 'TOTAL' ).AsInteger;

              FTOTAL := FTOTAL + FieldByName( 'TOTAL' ).AsInteger;
              Next;
            end;
        end;

      cdsSelecionados.Next;
      cdsResultado.FieldByName('TOTAL').AsInteger := FTOTAL;
    end;

  cdsResultado.Post;
  cdsSelecionados.First;
  cdsSelecionados.EnableControls;
  cdsResultado.First;
  cdsResultado.EnableControls;

end;

procedure TZoo_RelatorioRastreamento.rbCategoriaVacasClick(Sender: TObject);
begin
  ValidaCamposCategorias;
end;

procedure TZoo_RelatorioRastreamento.rbDataReferenciaClick(Sender: TObject);
begin
  ValidaCamposDataReferencia;
end;

procedure TZoo_RelatorioRastreamento.rgTipoRelatorioClick(Sender: TObject);
begin
  FTipoRelatorio := TTipoRelatorio ( rgTipoRelatorio.ItemIndex ) ;
  ValidaCamposCategorias;
end;

procedure TZoo_RelatorioRastreamento.rgStatusAnimalClick(Sender: TObject);
begin
  FStatusAnimal := TStatusAnimal ( rgStatusAnimal.ItemIndex ) ;
end;

procedure TZoo_RelatorioRastreamento.SaveReport;
var
  ReportKey  :  string ;
begin
  if rbSaveExisting.checked then
    begin
      IncluiAltera( False );
      exit
    end;

  if Trim ( edtSaveAs.Text ) = EmptyStr then
    raise Warning.Create('Informe um nome válido');

  ReportKey := SearchRastreamento( edtSaveAs.Text ) ;
  if ReportKey = '' then
    begin
      IncluiAltera( True );
      exit ;
    end;

  if MessageDlg( 'Este nome de relatório já existe, deseja sobrescrever?',
                     mtWarning, [ mbYes, mbNo ]) <> mrYes then
     exit ;

  FKZOO_RASTREAMENTO := ReportKey  ;
  IncluiAltera( False );
end;

function TZoo_RelatorioRastreamento.SearchRastreamento(FNOME: String): string ;
const
  SELECT_FIND = 'SELECT KZOO_RASTREAMENTO FROM ZOO_RASTREAMENTO ' +
                'WHERE KCAD_FAZENDA = :KCAD_FAZENDA ' +
                'AND UPPER(NOME) = UPPER(:FNOME) ';
var
  cds: TClientDataSet;
  p: TParams;
begin

  p := TParams.Create;
  cds := nil;

  p.CreateParam(ftString, 'KCAD_FAZENDA', ptInput ).asString := LoggedUser.DomainID;
  p.CreateParam( ftString, 'FNOME', ptInput ).asString := Trim( FNOME );

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet(cds, SELECT_FIND, p);

  Result := cds.FieldByName ( 'KZOO_RASTREAMENTO' ).asString ;

  cds.Free;
  p.Free;
end;

procedure TZoo_RelatorioRastreamento.seDiasDataRelativaChange(Sender: TObject);
begin
  inherited;
  AtualizaPeriodo;
end;

procedure TZoo_RelatorioRastreamento.ValidaCampos;
begin
  if not (rbCategoriaNovilhas.Checked) and not (rbCategoriaVacas.Checked) then
    begin
      rbCategoriaNovilhas.SetFocus;
      raise Warning.Create('Deve ao menos selecionar uma categoria');
    end;

  if (rbCategoriaVacas.Checked) and (cbCategoriaCondicao.ItemIndex < 0) then
    begin
      cbCategoriaCondicao.SetFocus;
      raise Warning.Create('Deve escolher uma condição de lactação');
    end;

  if rbDataPeriodo.Checked then
    begin
      if (deDataInicial.Date = Null) or (deDataInicial.Date = 0) then
        begin
          deDataInicial.SetFocus;
          raise Warning.Create('Data inicial inválida');
        end;

      if (deDataFinal.Date = Null) or (deDataFinal.Date = 0) then
        begin
          deDataFinal.SetFocus;
          raise Warning.Create('Data final inválida');
        end;

      if deDataInicial.Date > deDataFinal.Date then
        begin
          deDataInicial.SetFocus;
          raise Warning.Create
            ('Data inicial não pode ser maior que data final');
        end;

      if deDataFinal.Date > Date then
        begin
          deDataFinal.SetFocus;
          raise Warning.Create('Data final não pode superior a data atual');
        end;
    end;

  if rbDataRelativa.Checked then
    begin
      if seDiasDataRelativa.Value < 1 then
        begin
          seDiasDataRelativa.SetFocus;
          raise Warning.Create('Valor relativo deve ser maior que zero');
        end;
      if cbTipoDataRelativa.ItemIndex < 0 then
        begin
          cbTipoDataRelativa.SetFocus;
          raise Warning.Create('Deve escolher o tipo de data relativa');
        end;
    end;

  if cdsSelecionados.IsEmpty then
    begin
      dbgAtividades.SetFocus;
      raise Warning.Create('Deve selecionar ao menos um filtro');
    end;
end;

procedure TZoo_RelatorioRastreamento.ValidaCamposCategorias;
begin
  rbCategoriaNovilhas.Enabled := FTipoRelatorio = trMensal ;
  rbCategoriaNovilhas.Checked := rbCategoriaNovilhas.Enabled ;

  if FTipoRelatorio = trDiasEmLactacao then
    rbCategoriaVacas.Checked := True;

  if not rbCategoriaVacas.Checked then
    begin
      cbCategoriaCondicao.ItemIndex := -1 ;
      seCategoriaValor.Value        := 1  ;
      cbCategoriaCondicao.Enabled   := False;
      seCategoriaValor.Enabled      := False;
    end
  else
    begin
      cbCategoriaCondicao.Enabled   := True;
      seCategoriaValor.Enabled      := True;

      if cbCategoriaCondicao.ItemIndex = -1 then cbCategoriaCondicao.ItemIndex := 1 ;
      if seCategoriaValor.Value < 1         then seCategoriaValor.Value        := 1;
    end;

  if (rbCategoriaNovilhas.Checked) and not (rbCategoriaVacas.Checked) then
    rbDataUltimaPesagem.Enabled := False
  else
    rbDataUltimaPesagem.Enabled := True;
end;

procedure TZoo_RelatorioRastreamento.ValidaCamposDataReferencia;
begin
  if rbDataPeriodo.Checked then
    begin
      FDataReferencia := drPeriodo ;
      deDataInicial.Enabled        := True;
      deDataFinal.Enabled          := True;

      seDiasDataRelativa.Value     := 1;
      seDiasDataRelativa.Enabled   := False;
      cbTipoDataRelativa.ItemIndex := -1;
      cbTipoDataRelativa.Enabled   := False;
    end
  else if rbDataRelativa.Checked then
    begin
      FDataReferencia := drRelativa ;
      deDataInicial.Enabled      := False;
      deDataFinal.Enabled        := False;

      if seDiasDataRelativa.Value < 1      then seDiasDataRelativa.value     := 1;
      if cbTipoDataRelativa.Itemindex = -1 then cbTipoDataRelativa.Itemindex := 2;

      seDiasDataRelativa.Enabled := True;
      cbTipoDataRelativa.Enabled := True;
      deDataFinal.Date           := Date;

      AtualizaPeriodo;
    end
  else if rbDataUltimaPesagem.Checked then
    begin
      FDataReferencia            := drUltimaPesagem ;
      deDataInicial.Enabled      := False;
      deDataFinal.Enabled        := False;

      if seDiasDataRelativa.Value < 1      then seDiasDataRelativa.value     := 1;
      if cbTipoDataRelativa.Itemindex = -1 then cbTipoDataRelativa.Itemindex := 2;

      seDiasDataRelativa.Enabled := True;
      cbTipoDataRelativa.Enabled := True;
      deDataFinal.date           := GetUltimaPesagem;

      AtualizaPeriodo;
    end;
end;

procedure TZoo_RelatorioRastreamento._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgRelatorioRastreamento, Caption );
  inherited;
end;

procedure TZoo_RelatorioRastreamento._actNextExecute(Sender: TObject);
begin
//  ValidaCampos;
  GeraRelatorio;
  inherited;
end;

procedure TZoo_RelatorioRastreamento._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := not cdsSelecionados.IsEmpty;
end;

procedure TZoo_RelatorioRastreamento._actPriorExecute(Sender: TObject);
begin
  if cdsResultado.Active then
     cdsResultado.EmptyDataSet;

  if cdsRastreadores.Active then
    cdsRastreadores.Close;

  cdsRastreadores.IndexDefs.Clear;
  cdsRastreadores.IndexFieldNames := '';
  cdsRastreadores.Filtered        := False;
  cdsRastreadores.Filter          := '';

  DestroiCampos;
  inherited;
end;

initialization

RegisterClass(TZoo_RelatorioRastreamento);

end.
