unit UFIN_TransferenciaValoresForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, Vcl.ImgList, System.Actions, JvDBControls,
  Tc.VCL.Edits, Tc.VCL.Edits.DBControls, Vcl.DBCtrls,
  Tc.VCL.Edits.Numbers, System.ImageList, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TfrmFIN_TransferenciaValores = class(T_FormListaFicha)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    TcDBCalcEdit1: TTcDBCalcEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    TcDBDateEdit1: TTcDBDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    edConta: TJvDBComboEdit;
    JvDBComboEdit1: TJvDBComboEdit;
    procedure edContaButtonClick(Sender: TObject);
    procedure JvDBComboEdit1ButtonClick(Sender: TObject);
    procedure _actNewExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SearchContaOrigem ( TextToSearch : string);
    procedure SearchContaDestino ( TextToSearch : string);
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses { Searchs , UdtmCAD_Entidades, }  UFIN_TransferenciaValoresDatamodule,
  SearchsFinanceiro;

{$R *.dfm}

constructor TfrmFIN_TransferenciaValores.Create(AOwner: TComponent);
begin
  inherited;

  TdtmFIN_TransferenciaValores.Create ( self ) ;

  DatamoduleBase.OpenTables ;
end;

procedure TfrmFIN_TransferenciaValores.edContaButtonClick(Sender: TObject);
begin
  inherited;
  SearchContaOrigem( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmFIN_TransferenciaValores.JvDBComboEdit1ButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchContaDestino( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TfrmFIN_TransferenciaValores.Pesquisar;
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

procedure TfrmFIN_TransferenciaValores.SearchContaOrigem(TextToSearch: string);
var
  FKConta : string ;
  FConta  : string ;
begin
  with TdtmFIN_TransferenciaValores( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        begin
          FKConta := Result.FieldByName( 'KFIN_CONTA' ).asString ;
          FConta  := Result.FieldByName( 'NOME' ).asString ;

          SetContaOrigem( FKConta, FConta );
        end;
    finally
      free ;
    end ;
end ;



procedure TfrmFIN_TransferenciaValores._actNewExecute(Sender: TObject);
begin
  try
   inherited;
  except
   // Volts é fda.
   inherited;
  end;
end;

procedure TfrmFIN_TransferenciaValores.SearchContaDestino(TextToSearch: string);
var
  FKConta : string ;
  FConta  : string ;
begin
  with TdtmFIN_TransferenciaValores( DatamoduleBase ), TSearchContaAtiva.Create do
    try
      TextToFind := TextToSearch ;
      if Execute then
        begin
          FKConta := Result.FieldByName( 'KFIN_CONTA' ).asString ;
          FConta  := Result.FieldByName( 'NOME' ).asString ;

          SetContaDestino( FKConta, FConta ) ;
        end;
    finally
      free ;
    end ;
end ;

initialization
     RegisterClass ( TfrmFIN_TransferenciaValores ) ;
end.

