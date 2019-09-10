unit UfrmFIN_FechamentoMensal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.ImgList,
  Tc.VCL.Controls.GDIButton, VCL.DBCtrls,
  System.ImageList, System.Actions,
  Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmFIN_FechamentoMensal = class(T_FormListaFicha)
    Label1: TLabel;
    TcGDIButton1: TTcGDIButton;
    TcGDIButton2: TTcGDIButton;
    dbgProdutos: TJvDBUltimGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Panel1: TPanel;
    dtsFechamentoProdutos: TDataSource;
    actEncerrar: TAction;
    actReabrirMes: TAction;
    Label2: TLabel;
    DBText2: TDBText;
    procedure actEncerrarExecute(Sender: TObject);
    procedure actEncerrarUpdate(Sender: TObject);
    procedure actReabrirMesExecute(Sender: TObject);
    procedure actReabrirMesUpdate(Sender: TObject);
    procedure _actPrintListaExecute(Sender: TObject);
    procedure dtsListaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses { Searchs, } SysPrintGridDialog, UdtmFIN_FechamentoMensal ;

{$R *.dfm}

procedure TfrmFIN_FechamentoMensal.actEncerrarExecute(Sender: TObject);
begin
  TdtmFIN_FechamentoMensal ( DatamoduleBase ).EncerrarMes ;
  ShowMessage ( 'Mês encerrado com sucesso!' ) ;
end;

procedure TfrmFIN_FechamentoMensal.actEncerrarUpdate(Sender: TObject);
begin
  TAction( Sender ).Enabled := Assigned ( DatamoduleBase )
          and TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensal.Active
          and not TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensal.IsEmpty
          and not TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensalENCERRADO.asBoolean
end;

procedure TfrmFIN_FechamentoMensal.actReabrirMesExecute(Sender: TObject);
begin
  TdtmFIN_FechamentoMensal ( DatamoduleBase ).ReabrirMes ;
  ShowMessage ( 'Mês reaberto com sucesso!' ) ;
end;

procedure TfrmFIN_FechamentoMensal.actReabrirMesUpdate(Sender: TObject);
begin
  TAction( Sender ).Enabled := Assigned ( DatamoduleBase )
          and TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensal.Active
          and not TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensal.IsEmpty
          and TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsFechamentoMensalENCERRADO.asBoolean
end;

constructor TfrmFIN_FechamentoMensal.Create(AOwner: TComponent);
begin
  inherited;

    TdtmFIN_FechamentoMensal.Create ( self ) ;

    DatamoduleBase.OpenTables ;


  DBLookupComboBox1.KeyValue := TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsLstFechamentoMensalKEST_ENCERRAMENTO_MES.AsString ;

  ToolButton1.Enabled     := False;
  _tbsLista.Enabled       := False;
  _pageControl.ActivePage := _tbsFicha;

end;

procedure TfrmFIN_FechamentoMensal.dtsListaDataChange(Sender: TObject;
  Field: TField);
begin
//  if not Assigned ( Field )  then
    dbgProdutos.Visible := Assigned ( DataModuleBase )
      and TdtmFIN_FechamentoMensal( DataModuleBase ).cdsLstFechamentoMensal.Active
      and TdtmFIN_FechamentoMensal( DataModuleBase ).cdsLstFechamentoMensalENCERRADO.asBoolean ;
end;

procedure TfrmFIN_FechamentoMensal.Pesquisar;
begin
  inherited ;

{
  with TdtmCAD_Entidades( DatamoduleBase ), TSearchEntidade.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsList.Locate( 'KCAD_ENTIDADE',
                     Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
}
end;

procedure TfrmFIN_FechamentoMensal._actPrintListaExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgProdutos, Format ( 'Encerramento mensal %s (%s)',
      [ TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsLstFechamentoMensalANO_MES.Text,
        TdtmFIN_FechamentoMensal ( DatamoduleBase ).cdsLstFechamentoMensalENCERRADO.Text ] ) ) ;

end;

initialization
  RegisterClass ( TfrmFIN_FechamentoMensal ) ;

end.
