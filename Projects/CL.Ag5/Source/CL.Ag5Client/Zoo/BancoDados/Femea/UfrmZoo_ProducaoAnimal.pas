unit UfrmZoo_ProducaoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvExExtCtrls, JvExtComponent, JvPanel,
  UdtmZoo_ProducaoAnimal, Data.DB, Tc.Data.DB.Helpers, VCL.StdCtrls, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, VCL.DBCtrls, Tc.VCL.FormIntf,
  Tc.VCL.Form,Tc.VCL.Application,
  JvExStdCtrls, JvCombobox, JvDBCombobox, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TfrmZoo_ProducaoAnimal = class(TTcForm, ITcDataForm)
    PanelLactacoes: TJvPanel;
    JvPanel12: TJvPanel;
    dbgLactacao: TJvDBUltimGrid;
    SplitterPanelLactacoesDetailA: TSplitter;
    PanelLactacoesDetail: TJvPanel;
    PanelTitlePesagens: TJvPanel;
    dbgProducao: TJvDBUltimGrid;
    SplitterPanelLactacoes_Detail: TSplitter;
    PanelLactacoesDetail_PesagensAnalises: TPanel;
    PanelTitleAnalises: TJvPanel;
    dbgAnalises: TJvDBUltimGrid;
    dtsLactacoes: TDataSource;
    dtsPesagens: TDataSource;
    dtsAnalises: TDataSource;
    deDtPesagens: TTcDBDateEdit;
    dbMemoPesagens: TDBMemo;
    deDtSecagem: TTcDBDateEdit;
    dbMemoObsSecagem: TDBMemo;
    cbCausaSecagem: TJvDBComboBox;
    dtsMotivoSecagem: TDataSource;
    PanelLactacoesDetailPesagens: TPanel;
    JvPanel1: TJvPanel;
    DBText3: TDBText;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Splitter1: TSplitter;
    procedure dbgAnalisesShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    function dbgLactacaoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    function dbgProducaoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue,
      StringForFalse: string): Boolean;
    procedure dbgLactacaoEnter(Sender: TObject);
    procedure dbgProducaoEnter(Sender: TObject);
    procedure dbgAnalisesEnter(Sender: TObject);
    procedure dbgLactacaoShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure cbCausaSecagemEnter(Sender: TObject);
    procedure cbCausaSecagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    dtmZoo_ProducaoAnimal: TdtmZoo_ProducaoAnimal;
    FMasterSource: TDataSource;
    FActiveGrid : TJvDBUltimGrid ;
    FDadosFemea: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    //ITcDataForm
    function GetBOF : boolean ;
    function GetEOF : boolean ;
    procedure InsertRecord ;
    procedure EditRecord ;
    procedure DeleteRecord ;
    procedure Save ;
    procedure Cancel ;
    procedure PrintData ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    procedure SetDadosFemea(const Value: TDataSource);
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
    function ConfirmaPesagem ( APeso :double ) : boolean;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
  end;

implementation

{$R *.dfm}

Uses SysPrintGridDialog ;


procedure TfrmZoo_ProducaoAnimal.Cancel;
begin
   dtmZoo_ProducaoAnimal.CancelUpdates ;
   self.dbgLactacao.EditorMode := False ;
   self.dbgLactacao.CloseControl ;
   self.dbgProducao.EditorMode := False ;
   self.dbgProducao.CloseControl ;
end;

procedure TfrmZoo_ProducaoAnimal.cbCausaSecagemEnter(Sender: TObject);
begin
   cbCausaSecagem.DroppedDown := True ;
end;

procedure TfrmZoo_ProducaoAnimal.cbCausaSecagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
end;

function TfrmZoo_ProducaoAnimal.ConfirmaPesagem(APeso: double): boolean;
begin
   Result := MessageDlg ( 'Confirma peso acima de %f Kg', [ APeso ], mtInformation, [ mbYes, mbNo ] ) = mrYes ;
end;

constructor TfrmZoo_ProducaoAnimal.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  dtmZoo_ProducaoAnimal := TdtmZoo_ProducaoAnimal.Create ( self ) ;

  dtsLactacoes.DataSet  := dtmZoo_ProducaoAnimal.cdsLactacoes ;
  dtsPesagens.DataSet   := dtmZoo_ProducaoAnimal.cdsPesagemLeite;
  dtsAnalises.DataSet   := dtmZoo_ProducaoAnimal.cdsAnalises ;

  dtmZoo_ProducaoAnimal.OnConfirmaPeso := ConfirmaPesagem ;

  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ControleLeiteiro.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Secagem.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.Subscribe( NeedRefresh ) ;

end;

procedure TfrmZoo_ProducaoAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
   dtmZoo_ProducaoAnimal.DeleteRecord ;
end;

destructor TfrmZoo_ProducaoAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ControleLeiteiro.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Secagem.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TfrmZoo_ProducaoAnimal.EditRecord;
begin
   dtmZoo_ProducaoAnimal.EditRecord ;
   if Assigned ( FActiveGrid ) then
     FActiveGrid.SetFocus ;
   self.dbgLactacao.EditorMode := True ;
   self.dbgProducao.EditorMode := True ;
end;

function TfrmZoo_ProducaoAnimal.GetBOF: boolean;
begin
   Result :=  dtmZoo_ProducaoAnimal.cdsLactacoes.Bof ;
end;

function TfrmZoo_ProducaoAnimal.GetEOF: boolean;
begin
    Result := dtmZoo_ProducaoAnimal.cdsLactacoes.Eof ;
end;


procedure TfrmZoo_ProducaoAnimal.InsertRecord;
begin
  if self.FActiveGrid <> dbgProducao then
    exit ;

  dtmZoo_ProducaoAnimal.cdsPesagemLeite.append ;
  self.dbgProducao.SetFocus ;
  self.dbgProducao.EditorMode := True ;
end;

procedure TfrmZoo_ProducaoAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
   with dtmZoo_ProducaoAnimal do
     begin
      if   (( cdsLactacoes.State in [dsInsert,dsEdit] ) or (cdsLactacoes.ChangeCount > 0 ))
        or (( cdsPesagemLeite.State in [dsInsert,dsEdit] ) or (cdsPesagemLeite.ChangeCount > 0 ))  then
         exit ;

      ReOpenTables
     end;
end;

procedure TfrmZoo_ProducaoAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_ProducaoAnimal.dbgAnalisesEnter(Sender: TObject);
begin
   FActiveGrid :=  dbgAnalises ;
end;

procedure TfrmZoo_ProducaoAnimal.dbgAnalisesShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := False ;
end;

function TfrmZoo_ProducaoAnimal.dbgLactacaoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
  var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := ( Field = dtmZoo_ProducaoAnimal.cdsLactacoesAPLICADO_PROTOCOLO_SECAGEM) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TfrmZoo_ProducaoAnimal.dbgLactacaoEnter(Sender: TObject);
begin
   FActiveGrid := dbgLactacao ;
end;

procedure TfrmZoo_ProducaoAnimal.dbgLactacaoShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := ( not dtmZoo_ProducaoAnimal.cdsLactacoes.IsEmpty )
    and (   ( Field = dtmZoo_ProducaoAnimal.cdsLactacoesNL )
         or ( Field = dtmZoo_ProducaoAnimal.cdsLactacoesDATA_SECAGEM )
         or ( Field = dtmZoo_ProducaoAnimal.cdsLactacoesDESC_SECAGEM )
         or ( Field = dtmZoo_ProducaoAnimal.cdsLactacoesOBS_SECAGEM )
         )



end;

function TfrmZoo_ProducaoAnimal.dbgProducaoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
  var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  Result := Field = dtmZoo_ProducaoAnimal.cdsPesagemLeiteANIMAL_DOENTE ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TfrmZoo_ProducaoAnimal.dbgProducaoEnter(Sender: TObject);
begin
   FActiveGrid :=  dbgProducao ;
end;

procedure TfrmZoo_ProducaoAnimal.PrintData;
begin
  if FActiveGrid = self.dbgLactacao then
     SysPrintGridDialog.TPrintGridDialog.Execute( self.dbgLactacao, 'Lactações do animal' );
  if FActiveGrid = self.dbgProducao then
     SysPrintGridDialog.TPrintGridDialog.Execute( self.dbgProducao, 'Produção de leite do animal' );
  if FActiveGrid = self.dbgAnalises then
     SysPrintGridDialog.TPrintGridDialog.Execute( self.dbgAnalises, 'Análise de leite do animal' );
end;

function TfrmZoo_ProducaoAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [] ;

   if ( FActiveGrid = dbgLactacao ) and ( not dtmZoo_ProducaoAnimal.cdsLactacoes.IsEmpty )  then
     Result := [ daEdit ]
   else if ( FActiveGrid = dbgProducao ) and ( not dtmZoo_ProducaoAnimal.cdsPesagemLeite.IsEmpty )  then
     Result := [ daInsert,daEdit, daDelete ] ;

   if Assigned ( FActiveGrid ) then
      Result := Result + [ daPrint ] ;

   if ( dtmZoo_ProducaoAnimal.cdsLactacoes.State in [dsInsert,dsEdit] )
   or ( dtmZoo_ProducaoAnimal.cdsLactacoes.ChangeCount > 0 )
   or ( dtmZoo_ProducaoAnimal.cdsPesagemLeite.State in [dsInsert,dsEdit] )
   or ( dtmZoo_ProducaoAnimal.cdsPesagemLeite.ChangeCount > 0 ) then

     Result := Result + [daSave,daCancel] - [daEdit] ;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;

end;

function TfrmZoo_ProducaoAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TfrmZoo_ProducaoAnimal.Save;
begin
   dtmZoo_ProducaoAnimal.ApplyUpdates ;
   self.dbgLactacao.EditorMode := False ;
   self.dbgLactacao.CloseControl ;
   self.dbgProducao.EditorMode := False ;
   self.dbgProducao.CloseControl ;
   TCLAg5NSMsgEVT_ProducaoAnimal.CreateAndDispatch ( self ) ;
end;

procedure TfrmZoo_ProducaoAnimal.SetDadosFemea(const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TfrmZoo_ProducaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_ProducaoAnimal.MasterSource := MasterSource ;
  dtmZoo_ProducaoAnimal.DadosFemea   := FDadosFemea ;
  dtmZoo_ProducaoAnimal.OpenTables ;
end;

end.
