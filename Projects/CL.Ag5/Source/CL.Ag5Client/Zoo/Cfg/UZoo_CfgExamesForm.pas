unit UZoo_CfgExamesForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage, VCL.DBCtrls,
  JvBaseEdits, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvExtComponent, JvPanel, VCL.ImgList, Tc.VCL.Controls.GDIButton,
  System.Actions, System.ImageList,
  CL.Ag5.NSMsgs, uImageListProvider, Tc.VCL.Application, Wrappers ;

type
  TZoo_CfgExamesForm = class(T_FormListaFicha)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    JvDBComboBox2: TJvDBComboBox;
    lblEdFuncionario: TLabel;
    edFuncionario: TJvDBComboEdit;
    Panel1: TPanel;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsItens: TDataSource;
    CheckBox1: TCheckBox;
    BitBtn2: TTcGDIButton;
    Panel2: TPanel;
    JvDBUltimGrid2: TJvDBUltimGrid;
    dtsResultados: TDataSource;
    TcGDIButton1: TTcGDIButton;
    procedure JvDBCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBCalcEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure edFuncionarioButtonClick(Sender: TObject);
    function _dbgListaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _dbgListaShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _dbgListaKeyPress(Sender: TObject; var Key: Char);
    procedure NoAct(Sender: TObject);
    procedure dtsFichaStateChange(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure _actListaExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
    function JvDBUltimGrid2CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
  private
    { Private declarations }
    procedure SetFuncionario ( TextToSearch : string);
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
  public
    { Public declarations }
    class procedure NovoExame ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

// insira a unit ''dtm'' do form na clausula uses
// conforme exemplo :
uses SearchsZootecnico, UZoo_CfgExamesDatamodule ;

{$R *.dfm}

procedure TZoo_CfgExamesForm.BitBtn2Click(Sender: TObject);
begin
  TZoo_CfgExamesDatamodule(DatamoduleBase).RemoveItem ;
end;

procedure TZoo_CfgExamesForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  TZoo_CfgExamesDatamodule( DatamoduleBase ).cdsLstExames.Filtered := not CheckBox1.Checked ;
end;

constructor TZoo_CfgExamesForm.Create(AOwner: TComponent);
begin
  inherited;
  TZoo_CfgExamesDatamodule.Create ( self ) ;
  dtsItens.DataSet :=  TZoo_CfgExamesDatamodule(DatamoduleBase).cdsItens ;
  dtsResultados.DataSet :=  TZoo_CfgExamesDatamodule(DatamoduleBase).cdsResultados ;
  DatamoduleBase.OpenTables ;
  _dbgLista.ReadOnly := False ;
  dtsLista.AutoEdit := True ;
end;

procedure TZoo_CfgExamesForm.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if TZoo_CfgExamesDatamodule ( DataModuleBase ).cdsExame.State = dsBrowse then
    begin
      TZoo_CfgExamesDatamodule ( DataModuleBase ).cdsExameBeforeEdit ( nil ) ;
      if not TZoo_CfgExamesDatamodule ( DataModuleBase ).AllowChangeCodigo then
         Key := #0 ;
    end;

end;

procedure TZoo_CfgExamesForm.dtsFichaStateChange(Sender: TObject);
begin
  inherited;
  if TDataSet( Sender ).State in [dsEdit]  then
    try
      DBEdit1.Enabled :=  TZoo_CfgExamesDatamodule(DatamoduleBase).AllowChangeCodigo ;
  ///    DBEdit2.Enabled :=  TZoo_CfgExamesDatamodule(DatamoduleBase).AllowChangeCodigo ;
      if not DBEdit1.Enabled then
        begin
           DBEdit1.Undo ;
     ///    DBEdit2.Undo ;
        end;
    except

    end;
end;

procedure TZoo_CfgExamesForm.edFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SetFuncionario ( edFuncionario.text )  ;
end;

procedure TZoo_CfgExamesForm.JvDBCalcEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '-' then
     Key := #0 ;
end;

procedure TZoo_CfgExamesForm.JvDBCalcEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '-' then
     Key := #0 ;
end;

function TZoo_CfgExamesForm.JvDBUltimGrid2CheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin
 with TZoo_CfgExamesDatamodule ( DataModuleBase ) do
     Result := Assigned ( Field )
       and (   ( Field = cdsResultadosATIVO )
            or ( Field = cdsResultadosATIVO ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_CfgExamesForm.NoAct(Sender: TObject);
begin
  inherited;
_actOther.Enabled := False
end;

class procedure TZoo_CfgExamesForm.NovoExame;
begin
  with Create ( nil ) do
    try
       BorderStyle := bsDialog ;
       ShowModal ;
    finally
       Free ;
    end;
end;

procedure TZoo_CfgExamesForm.Pesquisar;
begin
  inherited ;
  if CheckBox1.Checked then
    begin
      with TZoo_CfgExamesDatamodule( DatamoduleBase ), TSearchExame.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsLstExames.Locate( 'KZOO_TAREFA', Result.FieldByName( 'KZOO_TAREFA' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end
  else
    begin
      with TZoo_CfgExamesDatamodule( DatamoduleBase ), TSearchExameAtivo.Create do
        try
          TextToFind := _edtSearch.Text ;
          if Execute then
            begin
               cdsLstExames.Locate( 'KZOO_TAREFA', Result.FieldByName( 'KZOO_TAREFA' ).Value, [] ) ;
               ActiveFicha ;
            end ;
        finally
          free ;
        end ;
    end;
end;

procedure TZoo_CfgExamesForm.SetFuncionario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               TZoo_CfgExamesDatamodule( DatamoduleBase ).SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
               edFuncionario.Font.Color := clNavy ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_CfgExamesForm.TcGDIButton1Click(Sender: TObject);
begin
  TZoo_CfgExamesDatamodule(DatamoduleBase).RemoveItem ;
end;

procedure TZoo_CfgExamesForm._actListaExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TZoo_CfgExamesForm._actSaveExecute(Sender: TObject);
begin
  inherited;
  TCLAg5NSMsgEVT_CfgExames.CreateAndDispatch( self );
end;

function TZoo_CfgExamesForm._dbgListaCheckIfBooleanField(Grid: TJvDBGrid;
  Field: TField; var StringForTrue, StringForFalse: string): Boolean;
begin

 with TZoo_CfgExamesDatamodule( DatamoduleBase ) do
     Result := Assigned ( Field )
       and (     ( Field = cdsLstExamesATIVO ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TZoo_CfgExamesForm._dbgListaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TZoo_CfgExamesDatamodule( DatamoduleBase ).cdsLstExames.Edit
end;

procedure TZoo_CfgExamesForm._dbgListaShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin

  AllowEdit := True ;
//     (Field = TZoo_CfgExamesDatamodule( DatamoduleBase ).cdsLstExamesDESCARTECARNE)
// or  (Field = TZoo_CfgExamesDatamodule( DatamoduleBase ).cdsLstExamesDESCARTELEITE)

end;

initialization
  RegisterClass ( TZoo_CfgExamesForm ) ;

end.
