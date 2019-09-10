unit UZoo_CfgProtocolosForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage, VCL.DBCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExtComponent, JvPanel, AppEvnts,
  JvDBControls, DBCGrids, JvBaseEdits, VCL.ImgList,
  Tc.VCL.ControlPopuper, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, uImageListProvider, Tc.VCL.Application, Wrappers ;

type
  TZoo_CfgProtocolosForm = class(T_FormListaFicha)
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    JvDBComboBox2: TJvDBComboBox;
    dtsTiposProtocolo: TDataSource;
    dtsTarefas: TDataSource;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label2: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    edTarefa: TJvDBComboEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    JvDBCalcEdit2: TJvDBCalcEdit;
    JvDBCalcEdit3: TJvDBCalcEdit;
    BitBtn1: TTcGDIButton;
    BitBtn2: TTcGDIButton;
    Ativa: TDBCheckBox;
    CheckBox1: TCheckBox;
    JvDBComboEdit1: TJvDBComboEdit;
    Label4: TLabel;
    BitBtn3: TTcGDIButton;
    BitBtn4: TTcGDIButton;
    DBText1: TDBText;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    JvDBCalcEdit4: TJvDBCalcEdit;
    Label11: TLabel;
    TcMPControlPopuper1: TTcControlPopuper;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dblcTipoProtocoloCloseUp(Sender: TObject);
    procedure dblcTipoProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTarefaButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actOtherUpdate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TcMPControlPopuper1Close(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ShowNewFastRegister(Sender: TObject);
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
    procedure SearchTarefa ( TextToSearch : string ; AAppend : boolean = False );
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
    class procedure ExecuteNewFastRegister;
  end;

implementation

uses SearchsZootecnico, UZoo_CfgProtocolosDatamodule , Exceptions, UZoo_CfgTarefasForm2, UZoo_CfgExamesForm ;

{$R *.dfm}

procedure TZoo_CfgProtocolosForm.JvDBCalcEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '-' then
     Key := #0 ;
end;

procedure TZoo_CfgProtocolosForm.NeedRefresh(Sender: TCLAg5NSMsg);
var
  KZOO_PROTOCOLO : string ;
begin

  with TZoo_CfgProtocolosDatamodule( DatamoduleBase ) do
    begin
      if ( cdsProtocolo.State in [dsInsert,dsEdit] ) or (cdsProtocolo.ChangeCount > 0 ) then
         exit ;

      KZOO_PROTOCOLO := cdsLstProtocolosKZOO_PROTOCOLO.AsString ;
      ReOpenTables ;
      cdsLstProtocolos.Locate('KZOO_PROTOCOLO', KZOO_PROTOCOLO, []) ;
//      cdsProtocolo.RefreshRecord;
      cdsProtocolo.Refresh ;
    end;
end;

procedure TZoo_CfgProtocolosForm.Pesquisar;
begin
  inherited ;
  if CheckBox1.Checked then
    begin
      with TZoo_CfgProtocolosDatamodule( DatamoduleBase ), TSearchProtocolo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsLstProtocolos.Locate( 'KZOO_PROTOCOLO', Result.FieldByName( 'KZOO_PROTOCOLO' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TZoo_CfgProtocolosDatamodule( DatamoduleBase ), TSearchProtocoloAtivo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsLstProtocolos.Locate( 'KZOO_PROTOCOLO', Result.FieldByName( 'KZOO_PROTOCOLO' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
end;

procedure TZoo_CfgProtocolosForm.SearchTarefa(TextToSearch: string; AAppend : boolean = False );
begin


//   if ( Trim (TextToSearch) = '' ) then
//     exit ;

   with TSearchTarefaExamesAtivo.Create do
      try
         TextToFind := TextToSearch ;
         if Execute then
            TZoo_CfgProtocolosDatamodule ( DatamoduleBase ).InsereTarefa (
                 Result.FieldByName( 'KZOO_TAREFA' ).asString,
                 Result.FieldByName( 'CODIGO' ).asString,
                 Result.FieldByName( 'NOME' ).asString,
                 Result.FieldByName( 'TIPOTAREFA' ).asInteger = -1,
                 Result.FieldByName( 'DESCRICAO' ).asString,
                 AAppend ) ;
      finally
         free ;
      end ;

end;

procedure TZoo_CfgProtocolosForm.ShowNewFastRegister(Sender: TObject);
begin
  if ( DBLookupComboBox1.CanFocus ) and ( DBLookupComboBox1.Showing ) then
    DBLookupComboBox1.SetFocus
  else
  if ( DBEdit1.CanFocus ) and ( DBEdit1.Showing ) then
    DBEdit1.SetFocus;

end;

procedure TZoo_CfgProtocolosForm.TcMPControlPopuper1Close(Sender: TObject);
begin
  SendMessage( handle, WM_NEXTDLGCTL, 0, 0 );
//      SelectNext( ActiveControl as TWinControl, True, True );
end;

procedure TZoo_CfgProtocolosForm._actDeleteExecute(Sender: TObject);
begin
  if TZoo_CfgProtocolosDatamodule( DataModuleBase ).CheckProtocoloInUse then
    ShowMessage ( 'Protocolo já aplicado à animais da fazenda.'
    +#13#10'A exclusão do protocolo não removerá os dados da ficha do animal.' + #13#10 ) ;
  inherited;

end;

procedure TZoo_CfgProtocolosForm._actOtherUpdate(Sender: TObject);
begin
  inherited;
  _actOther.Enabled := False ;
end;

function TZoo_CfgProtocolosForm._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
  inherited;
  with TZoo_CfgProtocolosDatamodule( DataModuleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstProtocolosATIVO )  ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;


procedure TZoo_CfgProtocolosForm.BitBtn1Click(Sender: TObject);
begin
  SearchTarefa( '', True );
end;

procedure TZoo_CfgProtocolosForm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgProtocolosDatamodule( DatamoduleBase ).DeleteTarefa ;
end;

procedure TZoo_CfgProtocolosForm.BitBtn3Click(Sender: TObject);
begin
  TZoo_CfgTarefasForm.NovaTarefa;
end;

procedure TZoo_CfgProtocolosForm.BitBtn4Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgExamesForm.NovoExame ;
end;

procedure TZoo_CfgProtocolosForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsLstProtocolos.Filtered := not CheckBox1.Checked ;
end;

constructor TZoo_CfgProtocolosForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgProtocolosDatamodule.Create ( self ) ;
  dtsLista.DataSet := TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsLstProtocolos;
  dtsFicha.DataSet := TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsProtocolo;
  DataSource1.DataSet := TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsProtocolo;
  dtsTiposProtocolo.DataSet := TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsTiposProtocolo;
  dtsTarefas.DataSet  := TZoo_CfgProtocolosDatamodule( DatamoduleBase ).cdsTarefas;
  DatamoduleBase.OpenTables ;

  TCLAg5NSMsgEVT_CfgTarefas.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CfgExames.Subscribe( NeedRefresh ) ;

//  dblcTipoProtocolo.KeyValue := TZoo_CfgProtocolosDatamodule ( DatamoduleBase ).cdsTiposProtocoloKZOO_CFGTIPOPROTOCOLO.Value ;
end;

procedure TZoo_CfgProtocolosForm.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  JvDBComboEdit1.SetFocus;
end;

procedure TZoo_CfgProtocolosForm.DBEdit3Enter(Sender: TObject);
begin
  TcMPControlPopuper1.PopupFromControl( DBEdit3, 0, - DBEdit3.Height );
end;

procedure TZoo_CfgProtocolosForm.dblcTipoProtocoloCloseUp(Sender: TObject);
begin
  inherited;
  TZoo_CfgProtocolosDatamodule( DatamoduleBase ).ReOpenTables ;
end;

procedure TZoo_CfgProtocolosForm.dblcTipoProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_CfgProtocolosForm.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then
    begin
      Key := 0 ;
      TcMPControlPopuper1.Close ;
    end;
end;

destructor TZoo_CfgProtocolosForm.Destroy;
begin
 TCLAg5NSMsgEVT_CfgTarefas.UnSubscribe( NeedRefresh ) ;
 TCLAg5NSMsgEVT_CfgExames.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_CfgProtocolosForm.edTarefaButtonClick(Sender: TObject);
begin
  SearchTarefa ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class procedure TZoo_CfgProtocolosForm.ExecuteNewFastRegister;
var
  ThisForm: TZoo_CfgProtocolosForm;
begin
  try
    ThisForm := TZoo_CfgProtocolosForm.Create(nil);
    ThisForm.OnShow := ThisForm.ShowNewFastRegister;
    ThisForm._pageControl.Pages[0].TabVisible := False;
    ThisForm._pageControl.Pages[1].TabVisible := False;
    //ThisForm._pageControl.ActivePageIndex := 1;
    ThisForm._pageControl.ActivePage := ThisForm._tbsFicha;
    ThisForm._actLista.Enabled := False;
    ThisForm._actEdit.Enabled := False;
    ThisForm._actNew.Execute ;// _ActionListExecute(ThisForm._actNew, Handled);
    ThisForm.ShowModal;
  finally
    FreeAndNil( ThisForm );
  end;
end;

initialization
  RegisterClass ( TZoo_CfgProtocolosForm ) ;


end.
