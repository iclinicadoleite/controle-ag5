unit UFIN_AjustaSaldoWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, JvImage,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, VCL.ComCtrls, VCL.ToolWin, JvExExtCtrls,
  SysFormEditaLista, ReportTypes, JvExtComponent, JvPanel, VCL.ImgList,
  UFIN_AjustaSaldoDatamodule, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, VCL.DBCtrls, System.ImageList, System.Actions,
  Tc.VCL.Extended.Mask, Tc.VCL.Application, uImageListProvider, Wrappers ;

type
  TFIN_AjustaSaldoWizard = class(T_FormEditaLista)
    _pnlSearch: TPanel;
    cbCompensados: TCheckBox;
    dbDt_Compensacao: TTcDBDateEdit;
    DBMemo1: TDBMemo;
    procedure _actNewExecute(Sender: TObject);
    procedure cbCompensadosClick(Sender: TObject);
    procedure dbgAjusteSaldoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FIN_AjustaSaldoDatamodule : TFIN_AjustaSaldoDatamodule ;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

// conforme exemplo :
uses SearchsFinanceiro,
     UFIN_CadastroTarifaBancariaWizard,
     UFinQueryInclusaoReceitaDespesa, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
//     UApplResources,
//     UfrmFIN_ApagarBaixaTitulo,
//     UfrmFIN_AReceberBaixaTitulo,
     CLAg5SvcFinanceiroApropriacao ;

{$R *.dfm}

procedure TFIN_AjustaSaldoWizard.cbCompensadosClick(Sender: TObject);
begin
  inherited;
  TFIN_AjustaSaldoDatamodule( DatamoduleBase).SetFilter( cbCompensados.Checked );
end;

constructor TFIN_AjustaSaldoWizard.Create(AOwner: TComponent);
begin
  inherited;
  FIN_AjustaSaldoDatamodule := TFIN_AjustaSaldoDatamodule.Create( Self );
  FIN_AjustaSaldoDatamodule.OpenTables ;
  FIN_AjustaSaldoDatamodule.SetFilter( cbCompensados.Checked );
end;

procedure TFIN_AjustaSaldoWizard.dbgAjusteSaldoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := (    ( Field = FIN_AjustaSaldoDatamodule.cdsLstAjustaSaldoDT_COMPENSACAO  )
                 or ( Field = FIN_AjustaSaldoDatamodule.cdsLstAjustaSaldoOBS ) ) ;
end;

procedure TFIN_AjustaSaldoWizard._actDeleteExecute(Sender: TObject);
begin
   _actDelete.Enabled := False ;
end;

procedure TFIN_AjustaSaldoWizard._actNewExecute(Sender: TObject);
begin
//  inherited;
   case TFinQueryInclusaoReceitaDespesa.Execute of
      toaReceita : TFIN_CadastroTarifaBancariaWizard.Execute( toaReceita ) ;
      toaDespesa : TFIN_CadastroTarifaBancariaWizard.Execute( toaDespesa ) ;
   end;

  FIN_AjustaSaldoDatamodule.RefreshList;
end;

procedure TFIN_AjustaSaldoWizard._actNewUpdate(Sender: TObject);
begin
   _actNew.Enabled := False ;
end;

procedure TFIN_AjustaSaldoWizard._actSaveExecute(Sender: TObject);
begin
  if dbDt_Compensacao.Focused then
    _dbgLista.SetFocus;

  inherited;
end;

initialization
  RegisterClass ( TFIN_AjustaSaldoWizard ) ;

end.
