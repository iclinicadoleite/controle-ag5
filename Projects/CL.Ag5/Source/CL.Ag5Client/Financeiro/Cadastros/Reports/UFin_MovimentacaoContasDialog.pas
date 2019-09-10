unit UFin_MovimentacaoContasDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, ReportTypes,
  VCL.Mask, JvExMask, JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel,
  SysFormWizard, SysReportTypes, VCL.ComCtrls, Tc.VCL.Edits, JvImage,
  JvExComCtrls, JvComCtrls, Tc.VCL.Controls.GDIButton, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application,
  UFin_MovimentacaoContasDataModule, QuickRpt, QRCtrls, Tc.RTL.StringUtils,
  System.Generics.Collections, Wrappers, Tc.Data.SQLExpr ;

type

  TSpecificReportParams = ReportTypes.TReportParamsContasBancarias ;



  TFIN_MovimentacaoContasDialog = class(T_FormWizard, IReportDialog )
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel4: TPanel;
    cbSelectAll: TCheckBox;
    dtsContas: TDataSource;
    cdsLstContas: TClientDataSet;
    cdsLstContasKFIN_CONTA: TStringField;
    cdsLstContasKFIN_BANCO: TStringField;
    cdsLstContasSELECT: TIntegerField;
    cdsLstContasNOME: TStringField;
    cdsLstContasBANCO: TStringField;
    cdsLstContasAGENCIA: TStringField;
    cdsLstContasCONTA_CORRENTE: TStringField;
    dspLstContas: TDataSetProvider;
    sqlLstContas: TTcSQLDataSet;
    sqlLstContasKFIN_CONTA: TStringField;
    sqlLstContasKFIN_BANCO: TStringField;
    sqlLstContasNOME: TStringField;
    sqlLstContasBANCO: TStringField;
    sqlLstContasAGENCIA: TStringField;
    sqlLstContasCONTA_CORRENTE: TStringField;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edInicio: TTcDateEdit;
    edTermino: TTcDateEdit;
    TabSheet2: TTabSheet;
    DBGridMovimentacao: TJvDBUltimGrid;
    dtsMovimentacao: TDataSource;
    Panel1: TPanel;
    TotalContasLabel: TLabel;
    procedure JvDBUltimGrid4ShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure JvDBUltimGrid4KeyPress(Sender: TObject; var Key: Char);
    function JvDBUltimGrid4CheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    procedure cbSelectAllClick(Sender: TObject);
    procedure cdsLstContasBeforeOpen(DataSet: TDataSet);
    procedure cdsLstContasCalcFields(DataSet: TDataSet);
    procedure _actNextExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure DBGridMovimentacaoGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure DBGridMovimentacaoUserSort(Sender: TJvDBUltimGrid;
      var FieldsToSort: TSortFields; SortString: string; var SortOK: Boolean);
    procedure JvDBUltimGrid4CellClick(Column: TColumn);
  private
    { Private declarations }
    procedure showMessageAbort ;
    procedure InvertSelecao;
    procedure InvertAllancos( ASelectAll : Boolean );
  protected
    { Protected declarations }
    FContasBancarias : TContasBancarias;
    FIN_MovimentacaoContasDataModule: TFIN_MovimentacaoContasDataModule;
    RParams: TSpecificReportParams ;
    procedure GetParameters( var Parameters : TReportParams ) ;
    procedure SetParameters( var Parameters : TReportParams ) ;
  public
    { Public declarations }
    function Execute(Parameters : TReportParams ) : boolean ; reintroduce ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

  TFIN_MovimentacaoContasWizard = class ( TFIN_MovimentacaoContasDialog )
  private
    procedure _actExecuteExecute(Sender: TObject);
  public
    constructor Create ( AOwner : TComponent ) ; override ;
  end;
implementation

uses Exceptions, UFIN_MovimentacaoContasReport, threadsuppl ;

{$R *.dfm}

{ TfrmCustomDialog }


procedure TFIN_MovimentacaoContasDialog.cbSelectAllClick(Sender: TObject);
begin
  inherited;
  InvertAllancos( cbSelectAll.Checked );
end;

procedure TFIN_MovimentacaoContasDialog.cdsLstContasBeforeOpen(DataSet: TDataSet);
begin
  cdsLstContas.Params.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID;
end;

procedure TFIN_MovimentacaoContasDialog.cdsLstContasCalcFields(DataSet: TDataSet);
begin
  if ( DataSet.State in [dsInternalCalc] ) and ( cdsLstContasSELECT.IsNull )  then
    cdsLstContasSELECT.asInteger := 0 ;
end;

constructor TFIN_MovimentacaoContasDialog.Create(AOwner: TComponent);
begin
  inherited;
  FIN_MovimentacaoContasDataModule:= TFIN_MovimentacaoContasDataModule.Create( Self );
  dtsMovimentacao.DataSet := FIN_MovimentacaoContasDataModule.cdsMovimentacao;
  DBGridMovimentacao.ShowHighlighter := True ;
  RParams := TReportParamsContasBancarias.Create;
end;


procedure TFIN_MovimentacaoContasDialog.DBGridMovimentacaoGetCellProps(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  with FIN_MovimentacaoContasDataModule do
    if (cdsMovimentacaoTIPOREG.AsInteger in
       [
            _TIPO_MOV_BANCARIA_CABECALHO
          , _TIPO_MOV_BANCARIA_TOTAL_ITENS
       ]
    ) then
      begin
        AFont.Style:= [fsBold];
        if Field = cdsMovimentacaoDEBITO then
          AFont.Color:= clRed
        else if Field = cdsMovimentacaoCREDITO then
          AFont.Color:= clGreen
        else if Field = cdsMovimentacaoSALDO then
          if ( cdsMovimentacaoSALDO.AsFloat >= 0 ) then
            AFont.Color:= clGreen
          else
            AFont.Color:= clRed;
      end
//  else
//    begin
//      AFont.Style:= [];
//      AFont.Color:= clBlack;
//    end;


end;

procedure TFIN_MovimentacaoContasDialog.DBGridMovimentacaoUserSort(
  Sender: TJvDBUltimGrid; var FieldsToSort: TSortFields; SortString: string;
  var SortOK: Boolean);
var
 LFieldName : string ;
 cAscFields : string ;
 cDescField : string ;
 x: integer ;
 CDS : TClientDataSet ;
begin
  CDS := FIN_MovimentacaoContasDataModule.cdsMovimentacao;

  if Assigned ( CDS.MasterSource ) then
    begin
     exit ;
    end;

  cAscFields := '' ;
  cDescField := '' ;

  for x := Low ( FieldsToSort ) to High( FieldsToSort ) do
    begin
        LFieldName := FieldsToSort[x].Name + '_' ;
        if not Assigned ( CDS.FindField( LFieldName ) ) then
           LFieldName := FieldsToSort[x].Name ;

        if   SameText ( LFieldName, 'PAGTO' )
          or SameText ( LFieldName, 'HISTORICO' )
          or SameText ( LFieldName, 'DT_COMPENSACAO_' )
          or SameText ( LFieldName, 'DOCUMENTO' )
          or SameText ( LFieldName, 'CHEQUE' )
          or SameText ( LFieldName, 'CREDITO' )
          or SameText ( LFieldName, 'DEBITO' )
          or SameText ( LFieldName, 'SALDO' ) then
          begin
            threadsuppl.TSyncThread.Create( showMessageAbort );
            Exit;
          end;

        cAscFields := cAscFields + ';' + LFieldName ;
        if not ( FieldsToSort[x].Order ) then // acendente
           cDescField := cDescField + ';' + LFieldName ;
    end;

  if cAscFields = '' then
    cAscFields := _DEF_INDEX
  else
    cAscFields := cAscFields+';'+_DEF_INDEX ;

  Delete ( cAscFields, 1, 1  ) ;
  Delete ( cDescField, 1, 1  ) ;

  with CDS do
     begin
        if IndexName = '__Idx' then
           DeleteIndex('__Idx') ;
        try
          AddIndex( '__Idx', cAscFields, [ixNonMaintained],cDescField ) ;
          IndexName := '__Idx' ;
          SortOK := True ;
        except
          MessageDlg ( 'Não é possível ordenar por este campo' ) ;
        end;
     end ;


end;

function TFIN_MovimentacaoContasDialog.Execute(Parameters: TReportParams) : boolean ;
begin
  cdsLstContas.Open;
  _btbExecute.Caption := 'V&isualizar';
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TFIN_MovimentacaoContasDialog.GetParameters(
  var Parameters: TReportParams);
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;
      edInicio.Date       := StartDate ;
      edTermino.Date      := EndDate ;
      cbSelectAll.Checked := True;
    end ;
end;

procedure TFIN_MovimentacaoContasDialog.InvertAllancos(ASelectAll: Boolean);
var
  checked : integer ;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  with cdsLstContas do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsLstContas.Edit ;
           cdsLstContasSELECT.asInteger := checked ;
           cdsLstContas.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;
end;

procedure TFIN_MovimentacaoContasDialog.InvertSelecao;
begin
  cdsLstContas.Edit ;
  if cdsLstContas.FieldByName('SELECT').asInteger = 0 then
    cdsLstContasSELECT.asInteger := 1
  else
    cdsLstContasSELECT.asInteger := 0 ;

  cdsLstContas.Post ;
end;


//  if not ( cdsLstContas.IsEmpty )
//   and ( Column.Field =  cdsLstContasSELECT ) then
//     InvertSelecao ;

procedure TFIN_MovimentacaoContasDialog.JvDBUltimGrid4CellClick(
  Column: TColumn);
begin
  inherited;
  if not ( cdsLstContas.IsEmpty )
   and ( Column.Field =  cdsLstContasSELECT ) then
     InvertSelecao ;
end;

function TFIN_MovimentacaoContasDialog.JvDBUltimGrid4CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
  var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := ( Field = cdsLstContasSELECT  ) ;

  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TFIN_MovimentacaoContasDialog.JvDBUltimGrid4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #32 then
    InvertSelecao ;
end;

procedure TFIN_MovimentacaoContasDialog.JvDBUltimGrid4ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TFIN_MovimentacaoContasDialog.SetParameters( var Parameters: TReportParams ) ;
var
  LSize : Integer;
begin

  LSize := 0 ;
 // SetLength( FContasBancarias, 0 );
  SetLength( FIN_MovimentacaoContasDataModule.ContasBancarias, 0 );

  with cdsLstContas do
    begin
      First;
      DisableControls;
      while not Eof do
        begin
          if cdsLstContasSELECT.AsInteger = 1 then
            begin
            {  LSize := LSize + 1 ;
              SetLength ( FContasBancarias, LSize ) ;
              FContasBancarias[ LSize - 1 ] := cdsLstContasKFIN_CONTA.AsString ;}
               LSize := LSize + 1 ;
              SetLength ( FIN_MovimentacaoContasDataModule.ContasBancarias, LSize ) ;
              FIN_MovimentacaoContasDataModule.ContasBancarias[ LSize - 1 ] := cdsLstContasKFIN_CONTA.AsString ;

            end;
          Next;
        end;

      First;
      EnableControls;
    end;

  if LSize = 0 then
    raise Warning.Create('Deve ao menos selecionar uma conta bancária.');

  //with TSpecificReportParams ( Parameters ) do
  //  begin
      // Param := FormControl ;

      FIN_MovimentacaoContasDataModule.DataIni := edInicio.Date;
      FIN_MovimentacaoContasDataModule.DataFim := edTermino.Date;
      FIN_MovimentacaoContasDataModule.SysDomain := LoggedUser.DomainID;
      {StartDate := edInicio.Date ;
      EndDate   := edTermino.Date  ;
      FContas   := FContasBancarias;}
  //  end ;
end;

procedure TFIN_MovimentacaoContasDialog.showMessageAbort;
begin
  MessageDlg ( 'Não é possível ordenar por este campo' ) ;
end;

procedure TFIN_MovimentacaoContasDialog._actExecuteExecute(Sender: TObject);
var
  filtro: String;

  procedure FiltrarCDS(filtrar: Boolean);
  begin
    with FIN_MovimentacaoContasDataModule.cdsMovimentacao do
    begin
      if filtrar then
        DisableControls
      else
        EnableControls;

      Filtered:= False;
      filtro:= Format( 'TIPOREG = %d ' , [ _TIPO_MOV_BANCARIA_ITENS ] );
      Filter:= filtro;
      Filtered:= filtrar;
    end;
  end;
begin
  inherited;
  RParams.FDataModule:= FIN_MovimentacaoContasDataModule;
  RParams.ReportTitle:= Self.Caption;
  RParams.StartDate:= edInicio.Date;
  RParams.EndDate:= edTermino.Date;

  FiltrarCDS(True);
  TFIN_MovimentacaoContasReport.Execute(RParams);
  FiltrarCDS(False);

end;

procedure TFIN_MovimentacaoContasDialog._actNextExecute(Sender: TObject);
var
  p : TReportParams ;
begin
  inherited;
  p := TSpecificReportParams.Create ;
  SetParameters ( p ) ;
  FIN_MovimentacaoContasDataModule.Execute;
  TotalContasLabel.Caption := FormatFloat(  '#,0.00', FIN_MovimentacaoContasDataModule.SaldoTotal ) ;

  if FIN_MovimentacaoContasDataModule.SaldoTotal > 0 then
     TotalContasLabel.Font.Color := clGreen
  else if FIN_MovimentacaoContasDataModule.SaldoTotal < 0 then
     TotalContasLabel.Font.Color := clMaroon
  else
     TotalContasLabel.Font.Color := clBlack ;

  p.Free ;
end;

procedure TFIN_MovimentacaoContasDialog._actNextUpdate(Sender: TObject);
begin
  _actNext.Enabled := (edInicio.Date > 0)
    and (edTermino.Date >= edInicio.Date)
  { TODO : Adicionar checagem de data < que hoje }
//    and (edTermino.Date <= Date);
end;

procedure TFIN_MovimentacaoContasWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;




  //p := TSpecificReportParams.Create ;
  {TSpecificReportParams( p ).KSYS_DOMAIN := LoggedUser.DomainID ;}
  //SetParameters ( p ) ;
  //-----


  //----

  //p.Free ;

end;

{ TFIN_MovimentacaoContasWizard }

constructor TFIN_MovimentacaoContasWizard.Create(AOwner: TComponent);
begin
  inherited;

  Name := 'FIN_MovimentacaoContasWizard' ;
  cdsLstContas.Open;
  _btbExecute.Caption := 'V&isualizar';
  //_btbExecute.OnClick := _actExecuteExecute ;
  edTermino.Date      := Date ;
  edInicio.Date       := Date - 7 ;
  cbSelectAll.Checked := True;


//  GetParameters ( Parameters ) ;
//  Result := ShowModal = mrOK ;
//  if Result then
//     SetParameters ( Parameters ) ;

end;

initialization
   RegisterClass ( TFIN_MovimentacaoContasWizard ) ;

end.

