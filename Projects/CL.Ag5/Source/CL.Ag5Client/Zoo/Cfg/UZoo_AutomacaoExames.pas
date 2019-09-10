unit UZoo_AutomacaoExames;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   SysFormDialog, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.ActnList, VCL.Buttons, VCL.StdCtrls, VCL.Grids,
  VCL.DBGrids, VCL.ExtCtrls, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  JvExExtCtrls, JvImage, JvExtComponent, JvPanel, SysFormWizard, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, JvExControls, JvDBLookup,
  Tc.VCL.FormIntf,
  Tc.VCL.Application,
  UZoo_AutomacaoExamesDatamodule, Tc.VCL.Controls.GDIButton,
  System.Actions,
  Tc.RTL.Exceptions, Vcl.DBCtrls, Wrappers ;

type

  TZoo_AutomacaoExamesWizard = class(T_FormWizard, ITcQuerySaveChanges)
    _btnAdd: TTcGDIButton;
    _btnAddAll: TTcGDIButton;
    dtsIn_Inicia: TDataSource;
    dtsOut: TDataSource;
    cdsIn_Inicia: TClientDataSet;
    cdsOut: TClientDataSet;
    _actAdd_Inicia: TAction;
    _actAddAll_Incia: TAction;
    _actRemove_Inicia: TAction;
    _actRemoveAll_Inicia: TAction;
    _actOK: TAction;
    dtsIn_Termina: TDataSource;
    cdsIn_Termina: TClientDataSet;
    _btnRemove: TTcGDIButton;
    _btnRemoveAll: TTcGDIButton;
    Button1: TTcGDIButton;
    Button2: TTcGDIButton;
    Button3: TTcGDIButton;
    Button4: TTcGDIButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    _actAdd_Termina: TAction;
    _actAddAll_Termina: TAction;
    _actRemove_Termina: TAction;
    _actRemoveAll_Termina: TAction;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgIn_Inicia: TJvDBUltimGrid;
    dbgIn_Termina: TJvDBUltimGrid;
    dbgOut: TJvDBUltimGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    dblcListaExames: TDBLookupComboBox;
    dblcResultados: TDBLookupComboBox;
    Label1: TLabel;
    dtsListaExames: TDataSource;
    dtsResultados: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    procedure _actAdd_IniciaExecute(Sender: TObject);
    procedure _actRemove_IniciaExecute(Sender: TObject);
    procedure _actAddAll_InciaExecute(Sender: TObject);
    procedure _actRemoveAll_IniciaExecute(Sender: TObject);

    procedure _actAdd_TerminaExecute(Sender: TObject);
    procedure _actRemove_TerminaExecute(Sender: TObject);
    procedure _actAddAll_TerminaExecute(Sender: TObject);
    procedure _actRemoveAll_TerminaExecute(Sender: TObject);

    procedure dbgIn_IniciaDblClick(Sender: TObject);
    procedure dbgIn_TerminaDblClick(Sender: TObject);
    function dbgIn_IniciaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dtsListaExamesDataChange(Sender: TObject; Field: TField);
    procedure dtsResultadosDataChange(Sender: TObject; Field: TField);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    FSourceClientDataSet: TClientDataSet;
    Zoo_AutomacaoExamesDatamodule : TZoo_AutomacaoExamesDatamodule ;
    procedure InitInOutCDS ;
  protected
    { Protected declarations }
    Procedure Add_Inicia ( AApplyUpdates : boolean = True ) ; virtual ;
    Procedure Remove_Inicia ( AApplyUpdates : boolean = True ) ; virtual ;
    Procedure AddAll_Inicia ; virtual ;
    Procedure RemoveAll_Inicia ; virtual ;

    Procedure Add_Termina ( AApplyUpdates : boolean = True ) ; virtual ;
    Procedure Remove_Termina ( AApplyUpdates : boolean = True ) ; virtual ;
    Procedure AddAll_Termina ; virtual ;
    Procedure RemoveAll_Termina ; virtual ;


    Procedure DisableControls ;
    Procedure EnableControls ;
    Procedure InvertSelection(ACDS: TClientDataSet ; AInicia : String );
    function QuerySaveChanges : TQuerySaveCancelOption ;
  public
    { Public declarations }
    class function Execute ( AKDiagnostico : string ) : boolean ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses SysQuerySaveIgnoreCancel ;

{$R *.dfm}

{ TfrmServicosAddAlvos }



class function TZoo_AutomacaoExamesWizard.Execute ( AKDiagnostico : string ) : boolean ;
var
  _this : TZoo_AutomacaoExamesWizard ;
begin
  _this := TZoo_AutomacaoExamesWizard.Create ( nil )  ;
  With _this do
  try

      with TZoo_AutomacaoExamesDatamodule.Create ( _this ) do
        begin
          OpenTables ;
          FSourceClientDataSet := Zoo_AutomacaoExamesDatamodule.cdsProtocolos ;
//          InitInOutCDS ;
          ModalResult := ShowModal ;
          Result  := ( ModalResult = mrOK ) ;
          MessageDlg ( Caption + ' processado com sucesso' ) ;
        end ;
  finally
     free ;
  end ;
end ;


procedure TZoo_AutomacaoExamesWizard._actAdd_IniciaExecute(Sender: TObject);
begin
  inherited;
  Add_Inicia ;
end;

procedure TZoo_AutomacaoExamesWizard._actRemove_IniciaExecute(Sender: TObject);
begin
  inherited;
  Remove_Inicia ;
end;

procedure TZoo_AutomacaoExamesWizard._actAddAll_InciaExecute(Sender: TObject);
begin
  inherited;
  AddAll_Inicia ;
end;

procedure TZoo_AutomacaoExamesWizard._actRemoveAll_IniciaExecute(Sender: TObject);
begin
  inherited;
  RemoveAll_Inicia ;
end;



procedure TZoo_AutomacaoExamesWizard._actAdd_TerminaExecute(Sender: TObject);
begin
  inherited;
  Add_Termina ;
end;

procedure TZoo_AutomacaoExamesWizard._actExecuteExecute(Sender: TObject);
begin
  inherited;
  Zoo_AutomacaoExamesDatamodule.GetProtocols;
end;

procedure TZoo_AutomacaoExamesWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled :=  ( Application.LicenseState <> lsReadOnly ) and ( Zoo_AutomacaoExamesDatamodule.cdsProtocolos.ChangeCount > 0 )
end;

procedure TZoo_AutomacaoExamesWizard._actRemove_TerminaExecute(Sender: TObject);
begin
  inherited;
  Remove_Termina ;
end;

procedure TZoo_AutomacaoExamesWizard._actAddAll_TerminaExecute(Sender: TObject);
begin
  inherited;
  AddAll_Termina ;
end;

procedure TZoo_AutomacaoExamesWizard._actRemoveAll_TerminaExecute(Sender: TObject);
begin
  inherited;
  RemoveAll_Termina ;
end;




procedure TZoo_AutomacaoExamesWizard.Add_Inicia( AApplyUpdates : boolean = True ) ;
begin
  DisableControls ;
  InvertSelection( cdsOut, 'T' );
  if AApplyUpdates then
    begin
     Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
     InitInOutCDS ;
    end;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.AddAll_Inicia;
begin
  DisableControls ;
  While not cdsOut.Eof do Add_Inicia ( false );
  Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
  InitInOutCDS ;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.Remove_Inicia( AApplyUpdates : boolean = True ) ;
begin
  DisableControls ;
  InvertSelection( cdsIn_Inicia, 'T' );
  if AApplyUpdates then
    begin
     Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
     InitInOutCDS ;
    end;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.RemoveAll_Inicia;
begin
  DisableControls ;
  While not cdsIn_Inicia.Eof do Remove_Inicia ( false ) ;
  Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
  InitInOutCDS ;
  EnableControls ;
end;



procedure TZoo_AutomacaoExamesWizard.Add_Termina( AApplyUpdates : boolean = True ) ;
begin
  DisableControls ;
  InvertSelection( cdsOut, 'F' );
  if AApplyUpdates then
    begin
     Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
     InitInOutCDS ;
    end;
  EnableControls ;
end;


constructor TZoo_AutomacaoExamesWizard.Create(AOwner: TComponent);
begin
  inherited;
  dtsResultados.Enabled := False ;
  Zoo_AutomacaoExamesDatamodule := TZoo_AutomacaoExamesDatamodule.Create( self ) ;
  FSourceClientDataSet          := Zoo_AutomacaoExamesDatamodule.cdsProtocolos ;
  Zoo_AutomacaoExamesDatamodule.OpenTables ;
  dtsListaExames.DataSet   := Zoo_AutomacaoExamesDatamodule.cdsListaExames ;
  dblcListaExames.KeyValue := Zoo_AutomacaoExamesDatamodule.cdsListaExamesKZOO_TAREFA.Value ;
  dtsResultados.Enabled := True ;
end;

procedure TZoo_AutomacaoExamesWizard.dtsResultadosDataChange(Sender: TObject; Field: TField);
begin
  if Assigned ( Field ) then
     exit ;

  if Zoo_AutomacaoExamesDatamodule.cdsLstResultadosKZOO_TAREFA_RESULTADO.asString = '' then
    exit ;

  dblcResultados.Visible :=
    Zoo_AutomacaoExamesDatamodule.cdsLstResultados.RecordCount > 1 ;
  DisableControls ;
  InitInOutCDS ;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.AddAll_Termina;
begin
  DisableControls ;
  While not cdsOut.Eof do Add_Termina ( false ) ;
  Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
  InitInOutCDS ;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.Remove_Termina( AApplyUpdates : boolean = True ) ;
begin
  DisableControls ;
  InvertSelection( cdsIn_Termina, 'F' );
  if AApplyUpdates then
    begin
     Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
     InitInOutCDS ;
    end;
  EnableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.RemoveAll_Termina;
begin
  DisableControls ;
  While not cdsIn_Termina.Eof do Remove_Termina ( false ) ;
  Zoo_AutomacaoExamesDatamodule.ApplyUpdates ;
  InitInOutCDS ;
  EnableControls ;
end;



function TZoo_AutomacaoExamesWizard.dbgIn_IniciaCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Assigned ( Field ) and ( Field.FieldName = 'ATIVO' ) ;

  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_AutomacaoExamesWizard.dbgIn_IniciaDblClick(Sender: TObject);
begin
  inherited;
  Remove_Inicia
end;


procedure TZoo_AutomacaoExamesWizard.dbgIn_TerminaDblClick(
  Sender: TObject);
begin
  inherited;
  Remove_Termina
end;

procedure TZoo_AutomacaoExamesWizard.DisableControls;
begin
 exit ;
  FSourceClientDataSet.DisableControls ;
  cdsIn_Inicia.DisableControls ;
  cdsIn_Termina.DisableControls ;
  cdsOut.DisableControls ;
end;

procedure TZoo_AutomacaoExamesWizard.dtsListaExamesDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned ( Field ) then
     exit ;

  if Zoo_AutomacaoExamesDatamodule.cdsListaExamesKZOO_TAREFA.asString = '' then
     exit ;

  dblcResultados.KeyValue := Zoo_AutomacaoExamesDatamodule.cdsLstResultadosKZOO_TAREFA_RESULTADO.Value ;

  Panel4.Enabled := not Zoo_AutomacaoExamesDatamodule.cdsLstResultados.isEmpty ;

end;

procedure TZoo_AutomacaoExamesWizard.EnableControls;
begin
exit ;
  FSourceClientDataSet.EnableControls ;
  cdsIn_Inicia.EnableControls ;
  cdsIn_Termina.EnableControls ;
  cdsOut.EnableControls ;
  dbgOut.Refresh ;
  dbgIn_Inicia.Refresh ;
  dbgIn_Termina.Refresh ;
end;

procedure TZoo_AutomacaoExamesWizard.InvertSelection(ACDS: TClientDataSet ; AInicia : String );
begin
   if ACDS.Bof and ACDS.Eof then
      Exit ;

    ACDS.Edit ;

    if ACDS.FieldByName( 'KZOO_TAREFA_RESULTADO' ).IsNull then
      begin
        ACDS.FieldByName( 'KZOO_TAREFA_RESULTADO' ).Value := Zoo_AutomacaoExamesDatamodule.cdsLstResultadosKZOO_TAREFA_RESULTADO.asString ;
        ACDS.FieldByName( 'INICIAR' ).Value := AInicia ;
      end
    else
      begin
        ACDS.FieldByName( 'KZOO_TAREFA_RESULTADO' ).Clear ;
        ACDS.FieldByName( 'INICIAR' ).Clear ;
      end ;

    ACDS.Post ;
end;


function TZoo_AutomacaoExamesWizard.QuerySaveChanges: TQuerySaveCancelOption;
begin

  if self._actExecute.Enabled then // alterado para salvar automatico
    begin
      self._actExecute.Execute ;
      Result := qscIgnore ;
    end
  else
    Result := qscIgnore ;

 (*
  if self._actExecute.Enabled then
    begin
     Result := qscCancel ;
     Case TQuerySaveIgnoreCancel.Execute( Caption ) of
       qscSave :
         begin
           self._actExecute.Execute ;
           Result := qscIgnore ;
         end;
       qscIgnore : Result := qscIgnore ;
     End ;
    end
  else
    Result := qscIgnore ;
    *)
end;

procedure TZoo_AutomacaoExamesWizard.InitInOutCDS ;
begin
  try
    FSourceClientDataSet.DisableControls ;
//    cdsIn_Inicia.Filtered := False ;
    cdsIn_Inicia.CloneCursor ( FSourceClientDataSet, False, False )  ;
    cdsIn_Inicia.Filter   := '( KZOO_TAREFA_RESULTADO IS NOT NULL ) AND ( INICIAR = ''T'' )' ;
    cdsIn_Inicia.Filtered := True ;

//    cdsIn_Termina.Filtered := False ;
    cdsIn_Termina.CloneCursor ( FSourceClientDataSet, False, False )  ;
    cdsIn_Termina.Filter   := '( KZOO_TAREFA_RESULTADO IS NOT NULL ) AND ( INICIAR = ''F'' )' ;
    cdsIn_Termina.Filtered := True ;

//    cdsOut.Filtered := False ;
    cdsOut.CloneCursor ( FSourceClientDataSet, False, False )  ;
    cdsOut.Filter   := 'KZOO_TAREFA_RESULTADO IS NULL' ;
    cdsOut.Filtered := True ;
    FSourceClientDataSet.EnableControls ;

  except On E : Exception do

     RaiseException ( E, UnitName, ClassName, 'InitInOutCDS' ) ;

  end;
end;



initialization
  RegisterClass ( TZoo_AutomacaoExamesWizard ) ;


end.

