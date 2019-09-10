unit UCAD_TiposEstoqueWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvXPBar,
  JvExControls, JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator,
  JvComponentBase, JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, SysFormListaFicha, ReportTypes, JvExExtCtrls,
  JvImage, JvExtComponent, VCL.ImgList, JvPanel, VCL.DBCtrls, JvExStdCtrls, JvCombobox,
  JvDBCombobox, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, System.Actions, System.ImageList,
  Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TCAD_TiposEstoqueWizard = class(T_FormListaFicha)
    GroupBox1: TGroupBox;
    pnlTipo: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    JvDBComboBox1: TJvDBComboBox;
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
  private
    { Private declarations }
    FTipo : Integer;
  protected
    { Protected declarations }
    procedure Pesquisar ; override ;
  public
    { Public declarations }
    class procedure NovoTipo ( Tipo : Integer );
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SearchsEntidades, UDBFinanceiro, UCAD_TiposEstoqueDatamodule, CLAg5SvcEstoqueCadastroTipos ;

{$R *.dfm}

type
  SvcEstoqueCadastroTiposFactory = class( TInterfacedObject, ISvcEstoqueCadastroTipos )
    procedure NovoTipo( AGroup : Integer) ;
  end;


constructor TCAD_TiposEstoqueWizard.Create(AOwner: TComponent);
begin
  inherited;
  if DebugHook > 0 then
    pnlTipo.Visible := True;

  ToolButton1.Enabled           := False;
  _ToolButtonOther.Visible      := False;
  _ToolButtonPrint.Visible      := False;
  _ToolButtonHelp.Visible       := False;
  _ToolButtonSeparator0.Visible := False;
  _ToolButtonSeparator2.Visible := False;
  _ToolButtonSeparator3.Visible := False;
  Self.ClientHeight             := 300;
  Self.ClientWidth              := 430;
  _ToolBar.Align                := alClient;

  TCAD_TiposEstoqueDatamodule.Create ( self ) ;
//  DatamoduleBase.OpenTables ;
end;

class procedure TCAD_TiposEstoqueWizard.NovoTipo(Tipo: Integer);
begin
  with Create ( nil ) do
    try
      FTipo                   := Tipo ;
      JvDBComboBox1.ItemIndex := Tipo - 1 ;

      JvDBComboBox1.Enabled:= False;

      DBEdit1.MaxLength := 0;
      DBEdit1.CharCase := ecNormal;

      (*
      if Tipo = CLAg5SvcEstoqueCadastroTipos._GRUPO_CLIENTE then
        begin
          Caption := 'Grupos de clientes';
        end
      else*) if Tipo = CLAg5SvcEstoqueCadastroTipos._UNIDADE_MEDIDA then
        begin
          Caption := 'Unidades de medidas';
          DBEdit1.MaxLength := 4;
          //DBEdit1.CharCase := ecUpperCase;
        end
      else if Tipo = CLAg5SvcEstoqueCadastroTipos._TIPO_PRODUTO then
        begin
          Caption := 'Tipos de produtos';
        end;

      BorderStyle       := bsDialog ;
      _tbsLista.Visible := False;
      _tbsFicha.Visible := True;
      _actNew.Execute;

      TCAD_TiposEstoqueDatamodule( DatamoduleBase ).SetFilter( Tipo ) ;
      DatamoduleBase.OpenTables ;
      TCAD_TiposEstoqueDatamodule( DatamoduleBase ).cdsTiposCadastros.Insert ;

      ShowModal ;
    finally
      Free ;
    end;
end;

procedure TCAD_TiposEstoqueWizard.Pesquisar;
begin
  inherited ;
  with TCAD_TiposEstoqueDatamodule( DatamoduleBase ), TSearchTiposCadastrados.Create do
     try
        TextToFind := _edtSearch.Text ;
        SetFiltro( FTipo );
        if Execute then
          begin
             cdsLstTiposCadastros.Locate( 'KCAD_TIPOS', Result.FieldByName( 'KCAD_TIPOS' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
end;

procedure TCAD_TiposEstoqueWizard._actCancelExecute(Sender: TObject);
begin
  inherited;
  ToolButton1.Enabled := True;
end;

procedure TCAD_TiposEstoqueWizard._actNewExecute(Sender: TObject);
begin
  inherited;
  ToolButton1.Enabled := False;
end;

procedure TCAD_TiposEstoqueWizard._actSaveExecute(Sender: TObject);
begin
  inherited;
  ToolButton1.Enabled := True;
  ToolButton1.Click;
end;

{ SvcCadastroTiposFactory }

procedure SvcEstoqueCadastroTiposFactory.NovoTipo(AGroup: Integer);
begin
    TCAD_TiposEstoqueWizard.NovoTipo( AGroup ) ;
end;

initialization
  RegisterClass ( TCAD_TiposEstoqueWizard ) ;
  SvcEstoqueCadastroTipos := SvcEstoqueCadastroTiposFactory.Create ;
finalization
  SvcEstoqueCadastroTipos := nil ;
end.
