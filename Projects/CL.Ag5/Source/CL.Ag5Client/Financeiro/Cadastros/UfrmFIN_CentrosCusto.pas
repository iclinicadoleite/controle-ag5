unit UfrmFIN_CentrosCusto;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin, SysFormEditaLista, Data.DB, Tc.Data.DB.Helpers, JvExControls,
  JvXPCore, JvXPBar, JvExComCtrls, VCL.Menus,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, VCL.ImgList,
  VirtualTrees, DTDBTreeView, DTClientTree, VCL.Mask, VCL.DBCtrls, JvExMask,
  JvExStdCtrls, JvCombobox, JvDBCombobox,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Tc.VCL.Controls.GDIButton, System.ImageList, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, JvTypes, JvToolEdit,
  uImageListProvider, Wrappers ;

type
   TfrmFIN_CentrosCusto  = class(T_FormEditaLista)
    _pnlSearch: TPanel;
    dbtreeCentroCusto: TDTClientTree;
    ScrollBox1: TScrollBox;
    Splitter1: TSplitter;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    Label4: TLabel;
    _lblPesquisas: TLabel;
    _edtSearch: TJvComboEdit;
    rbRaiz: TRadioButton;
    rbSubitem: TRadioButton;
    Label14: TLabel;
    cbStatus: TJvDBComboBox;
    Label3: TLabel;
    TcMPDBDateEdit1: TTcDBDateEdit;
    actPrintSelection: TAction;
    Apartirdaseleo1: TMenuItem;
    TcGDIButton1: TTcGDIButton;
    actPecuariaLeite: TAction;
    NewItemsImageList: TImageList;
    ImageList1: TImageList;
    ImageListProjectManIcons: TImageList;
    procedure _actNewExecute(Sender: TObject);
    procedure _edtSearchButtonClick(Sender: TObject);
    procedure _edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure actPrintSelectionExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure actPecuariaLeiteExecute(Sender: TObject);
    procedure actPecuariaLeiteUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure  Pesquisar ;
    { Protected declarations }
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses
  SearchsFinanceiro
  , UdtmFIN_CentrosCusto
  , ReportTypes
  , UFin_CentroCustosRelatorio
  , CDSSuppl
  , CL.Ag5.NSMsgs ;

{$R *.dfm}

procedure TfrmFIN_CentrosCusto.Pesquisar;
begin
  inherited ;

  with TdtmFIN_CentrosCusto( DatamoduleBase ), TSearchCentroCustoAnalitico.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsCentrosCusto.Locate( 'KFIN_CENTROCUSTO', Result.FieldByName( 'KFIN_CENTROCUSTO' ).Value, [] ) ;
             dbtreeCentroCusto.SetFocus;
          end ;
     finally
        free ;
     end ;
end;

procedure TfrmFIN_CentrosCusto._actNewExecute(Sender: TObject);
begin
//  inherited;
  with TdtmFIN_CentrosCusto ( DatamoduleBase ) do
    begin
      ApplyUpdates;

      AddChild(rbRaiz.Checked);

      dbDescricao.SetFocus;
      dbDescricao.Text := EmptyStr ;

      EditRecord;
      cdsCentrosCustoNOME.OnValidate := nil;
      cdsCentrosCustoNOME.AsString := '';
      cdsCentrosCustoNOME.OnValidate := cdsCentrosCustoNOMEValidate;
    end;
end;

procedure TfrmFIN_CentrosCusto._actSaveExecute(Sender: TObject);
begin
  if (assigned(Screen.ActiveControl)) then
    SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
  TCdsSuppl.PostIfNeed( dtsFicha.DataSet );
  inherited;
  TCLAg5NSMsgEVT_CentrosCusto.CreateAndDispatch( self ) ;
end;

procedure TfrmFIN_CentrosCusto._edtSearchButtonClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmFIN_CentrosCusto._edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Pesquisar;
end;

procedure TfrmFIN_CentrosCusto.actPecuariaLeiteExecute(Sender: TObject);
begin
  TdtmFIN_CentrosCusto ( DatamoduleBase ).SetPecuariaLeite ;

                                           (*
  with TdtmFIN_CentrosCusto ( DatamoduleBase ).cdsCentrosCusto do
    begin
       first ;
       while not eof do
         begin
           dbtreeCentroCusto.UpdateDataSet;
           dbtreeCentroCusto.UpdateText ;
           next ;
         end;
    end;
                                             *)
end;

procedure TfrmFIN_CentrosCusto.actPecuariaLeiteUpdate(Sender: TObject);
begin
  try
    actPecuariaLeite.Enabled := Assigned ( DatamoduleBase )
      and TdtmFIN_CentrosCusto( DatamoduleBase ).cdsCentrosCusto.Active
      and ( TdtmFIN_CentrosCusto( DatamoduleBase ).cdsCentrosCusto.State in [dsBrowse] )
      and ( TdtmFIN_CentrosCusto( DatamoduleBase ).cdsCentrosCustoANALITICO_SINTETICO.asString = 'A' )
  except
  end;
end;

procedure TfrmFIN_CentrosCusto.actPrintSelectionExecute(Sender: TObject);
var
  PReport : ReportTypes.TReportParamsCentroCustos ;
begin
  PReport := ReportTypes.TReportParamsCentroCustos.Create ;
  PReport.KSYS_DOMAIN := LoggedUser.DomainID ;
  PReport.CENTRO       := TdtmFIN_CentrosCusto( DatamoduleBase ).cdsCentrosCustoCLASSIFICACAO.AsString;
  PReport.ReportTitle  := 'Relação de Centro de Custos';
  TFin_CentroCustosReport.Execute( PReport );
  PReport.Free;
end;

constructor TfrmFIN_CentrosCusto.Create(AOwner: TComponent);
begin
  inherited;
  if DebugHook > 0 then
    _dbgLista.Visible := True
  else
    _dbgLista.Visible := False;

  TdtmFIN_CentrosCusto.Create ( self ) ;
  DatamoduleBase.OpenTables ;
  _edtSearch.ClipboardCommands := [caCopy,caCut, caPaste,caClear, caUndo]

end;

initialization
  RegisterClass ( TfrmFIN_CentrosCusto ) ;

end.
