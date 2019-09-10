// Project      : TurboCode - Módulos Prime
// Sub-Project  : System Interface
// Module       : DBControl Form
// Funcionality : Expose commands for insert, update, delete
// License      : veja readme.txt


// License      : internal use


unit DBForm;

{.$D-}

interface

{.$I Tc.MP.inc}

uses
  WinApi.Windows,  System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls,
  VCL.Dialogs,
  VCL.ActnList, VCL.StdCtrls,
  Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvComponentBase, JvErrorIndicator,
  JvValidators, UdtmSYS_BASE, JvExStdCtrls, JvEdit,
  JvDBControls, Tc.VCL.Dialogs,
  Tc.VCL.Application,
  Tc.VCL.Form, Tc.VCL.FormIntf, System.Actions, Wrappers ;

type

  T_DBForm = class(TTcForm, ITcDataForm, ITcQuerySaveChanges )
    dtsFicha: TDataSource;
    _actNew: TAction ;
    _actEdit: TAction ;
    _actDelete: TAction ;
    _actSave: TAction ;
    _actCancel: TAction ;
    procedure _actNewExecute(Sender: TObject);
    procedure _actEditExecute(Sender: TObject);
    procedure _actDeleteExecute(Sender: TObject);
    procedure _actSaveExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actNewUpdate(Sender: TObject);
    procedure _actEditUpdate(Sender: TObject);
    procedure _actDeleteUpdate(Sender: TObject);
    procedure _actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
    FValidatorsEnabled : boolean ;
    FValidators : TJvValidators ;
    FErrorIndicator  : TJvErrorIndicator ;
    FFocusDBControl : TWinControl ;
    FValidatorCreated : Boolean ;
    FDataFormIntf: ITcDataForm;
    FRecordInserted: Boolean;
    procedure SetDataFormIntf(const Value: ITcDataForm);
  protected
    FAllowedDataActions : TTcDataActions ;
    InternalDataSource: TDataSource;
    FDataModuleBase : T_dtmBASE  ;
    procedure UpdateData(Sender: TObject);
    procedure StateChange(Sender: TObject);
    procedure GetDefultDataModuleBase ;
    function  GetDatamoduleBase : T_dtmBASE ; virtual ;
    procedure JvValidatorDefault(Sender: TObject; ValueToValidate: Variant; var Valid: Boolean);
    procedure CreateValidators( ForceReCreate : Boolean = False );
    procedure ReCreateValidators ;
    procedure ClearErrorIndicator;
    procedure SetFocusTo1stDBControl ;
    procedure InsertRecord ; virtual ;
    procedure EditRecord ; virtual ;
    procedure DeleteRecord ; virtual ;
    function Changed : boolean ; virtual ;
    procedure Save ; virtual ;
    procedure Cancel ; virtual ;
    procedure PrintData ; virtual ;
    procedure OtherOptions ; virtual ;
    procedure Help ; virtual ;
    procedure Validate ;
    procedure Pesquisar ; virtual ;
    procedure ActiveFicha ; virtual ;
    function DataSetActive : boolean ;
    function GetBOF : boolean ; virtual ;
    function GetEOF : boolean ; virtual ;
    function DataSetIsEmpty : boolean ; virtual ;
    function QuerySaveChanges : TQuerySaveCancelOption ;
    function QueryAllowedDataActions : TTcDataActions ; virtual ;
    function QueryActiveDataActions : TTcDataActions ; virtual ;
    procedure ShowSalvoSucesso ;
    procedure BeforeSave; virtual;
    procedure AfterSave; virtual;
    function RecordInserted: Boolean;
  public
    { Public declarations }
    procedure DisableValidators ;
    procedure EnableValidators ;
    property DataFormIntf : ITcDataForm  read FDataFormIntf write SetDataFormIntf;
    property DatamoduleBase : T_dtmBASE read GetDatamoduleBase write FDatamoduleBase ;
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses VCL.Forms, Math, MaskUtils, TypInfo, SysQuerySaveIgnoreCancel ;

{$R *.dfm}


{ T_DBForm }

resourcestring

     _CAMPO_REQUERIDO = 'Campo %s requerido.' ;

procedure T_DBForm.CreateValidators(ForceReCreate: Boolean);
var
  Validator : TJvCustomValidator ;

  function GetDisplayLabel  ( AControl : TControl ; DefaultLabel : string ) : string ;
  begin
     Result := DefaultLabel ;
     if not Assigned ( AControl.Parent ) then
        exit ;
     for var x := 0 to AControl.Parent.ControlCount -1 do
        if    ( AControl.Parent.Controls[ x ] is TLabel )
          and ( TLabel( AControl.Parent.Controls[ x ] ).FocusControl = AControl ) then
            begin
              Result := TLabel( AControl.Parent.Controls[ x ] ).Caption ;
              Break ;
            end;

  end;

  procedure InitValidator  ( AControl : TControl ) ;
  var
    DS : TDataSource ;
    FieldName : string ;
    Field : TField ;
    ReadOnly : boolean ;
    Visible : boolean ;
  begin

    if not ( IsPublishedProp ( AControl, 'DataSource' )
          and IsPublishedProp ( AControl, 'DataField'  )  ) then
       exit ;

    DS := TDataSource( GetObjectProp ( AControl, 'DataSource' ) ) ;
    FieldName := GetStrProp ( AControl, 'DataField' ) ;
    ReadOnly := IsPublishedProp ( AControl, 'ReadOnly' ) and Boolean ( GetOrdProp ( AControl, 'ReadOnly' ) ) ;
    Visible := IsPublishedProp ( AControl, 'Visible' ) and Boolean ( GetOrdProp ( AControl, 'Visible' ) ) ;

    if   ( ReadOnly ) or (not Visible)
      or ( not (Assigned ( DS ) and Assigned ( DS.DataSet )) )
      or ( FieldName = '' ) then
       exit ;

    Field := DS.DataSet.FindField( FieldName ) ;

    if not ( Assigned ( Field ) and Field.Required and not ( Field.ReadOnly )) then
       exit ;

    Validator := TJvCustomValidator.Create ( self ) ;
    Validator.ControlToValidate := AControl ;
    Validator.OnValidate  := JvValidatorDefault ;

    Validator.ErrorMessage := format ( _CAMPO_REQUERIDO, [ GetDisplayLabel ( AControl,Field.DisplayLabel )  ] ) ;
    FValidators.Insert( Validator );
    FValidatorCreated := True ;
  end ;

begin

  if ( FValidatorCreated ) and not ForceReCreate then
     Exit ;

  with FValidators do
     while ( Count <> 0 ) do
            Remove( Items[ 0 ] );

  for var x := 0 to ComponentCount - 1 do
     if Components[ x ] is TControl then
        InitValidator ( TControl ( Components[ x ] ) ) ;

end;

procedure T_DBForm.GetDefultDataModuleBase;
begin
  for var ComponentIndex := 0 to self.ComponentCount -1 do
    begin
      if Components[ ComponentIndex ] is T_dtmBASE then
         begin
            FDataModuleBase := T_dtmBASE ( Components[ ComponentIndex ] ) ;
            exit ;
         end
    end ;
end;

function T_DBForm.GetDatamoduleBase: T_dtmBASE ;
begin
  if not Assigned ( FDatamoduleBase ) then
     begin
        GetDefultDataModuleBase ;

        if Assigned ( FDatamoduleBase  ) then
             dtsFicha.DataSet  := FDatamoduleBase.ClientDataSet ;

        InternalDataSource.DataSet := dtsFicha.DataSet ;

     end ;

  Result := FDatamoduleBase ;
end ;


Type
  TWrapperControl = class ( TControl ) ;

procedure T_DBForm.JvValidatorDefault(Sender: TObject;
  ValueToValidate: Variant; var Valid: Boolean);
var
  Control : TControl ;
  BOFAndEOF : Boolean ;
  Field : TField ;
  EdText : string ;
begin

  Control := TJvCustomValidator( Sender ).ControlToValidate ;

  with TDataSource( GetObjectProp ( Control, 'DataSource' ) ) do
    begin
       BOFAndEOF := (DataSet.BOF and DataSet.EOF) ;
       Field := TField ( DataSet.FieldByName ( GetStrProp ( Control, 'DataField' ) ) ) ;
    end ;

  if Control is TJvDBDateEdit then
     with TJvDBDateEdit ( Control ) do
        Valid := (BOFAndEOF) or ( Date <> 0 )
  else
    if Field.EditMask = '' then
          Valid := (BOFAndEOF) or ( TWrapperControl ( Control ).Text <> '' )
     else
          Valid := (BOFAndEOF)
                  or ( FormatMaskText( Field.EditMask, TWrapperControl ( Control ).Text) <>
                       FormatMaskText( Field.EditMask, '' ) )
end;

procedure T_DBForm.OtherOptions;
begin
// do nothing ...
end;

function T_DBForm.RecordInserted: Boolean;
begin
 Result := FRecordInserted;
end;

procedure T_DBForm.ReCreateValidators;
begin
     CreateValidators ( True ) ;
end;

procedure T_DBForm.SetDataFormIntf(const Value: ITcDataForm);
begin
  FDataFormIntf := Value;
end;

procedure T_DBForm.SetFocusTo1stDBControl;
var
   TopOfControl, LeftOfControl : integer ;
   TmpControl : TWinControl ;

   function CheckParent ( Control : TWinControl )  : boolean ;
   begin
     with Control do
       Result := Visible and Enabled  ;
     if Result and Assigned ( Control.Parent ) then
        Result := CheckParent ( Control.Parent ) ;
   end ;


   function TestReadOnly : boolean ;
     begin
       Result := IsPublishedProp ( TmpControl, 'ReadOnly' ) and Boolean ( GetOrdProp ( TmpControl, 'ReadOnly' ) ) ;
     end ;

   procedure TestRegion ;
     begin
       with TmpControl, Parent.ClientToScreen( BoundsRect.TopLeft ) do
        if ( Y + 5 < TopOfControl )
         or ( inRange ( Y, TopOfControl - 5, TopOfControl + 5 ) and
              ( X < LeftOfControl) ) then // c y < é ele direto
           begin
              TopOfControl  := Y ;
              LeftOfControl  := X ;
              FFocusDBControl :=  TmpControl ;
           end ;
     end ;

begin

  if Assigned ( FFocusDBControl ) then
     with FFocusDBControl do
       Try
          if ( Visible and Enabled and TabStop and CanFocus and CheckParent ( Parent ) ) then
             begin
                SetFocus ;
                exit ;
             end ;
       except
          FFocusDBControl := nil ;
       end ;

  TopOfControl := MAXINT ;
  LeftOfControl := MAXINT ;

  for var nCount := 0 to ComponentCount - 1 do
     if ( Components [ nCount ] is TWinControl ) then
        begin

           TmpControl := TWinControl ( Components [ nCount ] ) ;
           if ( IsPublishedProp ( TmpControl, 'DataSource' ) ) then
              with TmpControl do
                 if Assigned ( Parent ) and ( Visible and Enabled and TabStop and (not TestReadOnly) and CheckParent ( Parent ) ) then
                    TestRegion ;
        end ;

  if Assigned ( FFocusDBControl ) then
     FFocusDBControl.SetFocus ;

end;

procedure T_DBForm.ShowSalvoSucesso;
begin
   MessageDlg ( 'Salvo com sucesso.' ) ;
end;

procedure T_DBForm.InsertRecord;
begin
  Save ;
  DatamoduleBase.NewRecord ;
end;

procedure T_DBForm.EditRecord;
begin
  FRecordInserted := False;
  DatamoduleBase.EditRecord ;
end;

procedure T_DBForm.EnableValidators;
begin
  FValidatorsEnabled := True ;
end;

procedure T_DBForm.DeleteRecord;
begin
//  ActiveFicha ;
  if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) = mrYes then
     DatamoduleBase.DeleteRecord ;
end;


procedure T_DBForm.DisableValidators;
begin
  FValidatorsEnabled := False ;
end;

procedure T_DBForm.Save;
begin
  FRecordInserted := False;
  if not Changed then
     exit ;

  BeforeSave;
  //try

      //if ( not FValidators.Validate ) then
      //  abort ;
      if Assigned ( Screen.ActiveControl ) { and IsPublishedProp ( Screen.ActiveControl, 'DataSource' ) } then
        SendMessage( Screen.ActiveControl.Handle, CM_EXIT, 0, 0 ) ;
      DatamoduleBase.ApplyUpdates ;
      FErrorIndicator.ClearErrors ;
      //MessageDlg ( 'Salvo com sucesso.' ) ;
      FRecordInserted := True;
      AfterSave;
      ShowSalvoSucesso ;
     _actEdit.Update ;
     _actDelete.Update ;
     _actSave.Update ;
  //finally
  //end ;

end;

procedure T_DBForm.AfterSave;
begin
  {
   Adicionar nos formulários herdados caso seja necessário.
  }
end;

procedure T_DBForm.BeforeSave;
begin
  {
   Adicionar nos formulários herdados caso seja necessário.
  }
end;

procedure T_DBForm.Cancel;
begin
  DatamoduleBase.CancelUpdates ;
  FErrorIndicator.ClearErrors;
end;

function T_DBForm.Changed: boolean;
begin
 with TClientDataSet( dtsFicha.DataSet ) do
   Result := ( (State in [dsInsert,dsEdit]) or (ChangeCount > 0) ) ;
end;

procedure T_DBForm.ClearErrorIndicator;
begin
  FErrorIndicator.ClearErrors;
end;

procedure T_DBForm.Pesquisar;
begin
//
end;

procedure T_DBForm.PrintData;
begin
    self.Print ;
end;

function T_DBForm.QueryActiveDataActions: TTcDataActions;
begin

  Result := [] ;

  if DataSetActive and ( daInsert in FAllowedDataActions) then
     Result := Result + [ daInsert ] ;

  if not DataSetIsEmpty and (daEdit in FAllowedDataActions) then
     Result :=  Result + [ daEdit ] ;

  if ( not DataSetIsEmpty ) and ( daDelete in FAllowedDataActions) then
     Result := Result + [ daDelete ] ;

  if (daSave in  FAllowedDataActions) and
     DataSetActive and (( dtsFicha.DataSet.State in  [dsInsert,dsEdit] ) or ( TClientDataSet ( dtsFicha.DataSet ).ChangeCount > 0 )) then
     Result := Result + [ daSave, daCancel ] - [daInsert, daEdit, daDelete] ;

  if DataSetActive and ( daPrint in FAllowedDataActions) and not ( daSave in  Result )  then
     Result := Result + [daPrint] ;

  if Application.LicenseState = lsReadOnly then
     Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function T_DBForm.QueryAllowedDataActions: TTcDataActions;
begin
    Result := FAllowedDataActions ;
end;

function T_DBForm.QuerySaveChanges: TQuerySaveCancelOption;
begin
   Result := qscIgnore ;
   if Changed then
     begin
       Result := TQuerySaveIgnoreCancel.Execute ;
       if Result = qscSave then
          try
             Save ;
             Result := qscIgnore ;
          except
             raise ;
          end;
     end;
end;

procedure T_DBForm.ActiveFicha;
begin
//  if ( not dtsFicha.AutoEdit ) or ( not (dtsFicha.State in [dsEdit]) ) then
  if ( not dtsFicha.AutoEdit ) or ( Assigned ( dtsFicha.DataSet ) and not (dtsFicha.DataSet.State in [dsEdit]) ) then
     SetFocusTo1stDBControl ;
end;

procedure T_DBForm._actNewExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daInsert in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.InsertRecord ;
end;

procedure T_DBForm._actEditExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daEdit in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.EditRecord ;
end;

procedure T_DBForm._actDeleteExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daDelete in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.DeleteRecord ;
end;

procedure T_DBForm._actSaveExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daSave in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.Save ;
end;

procedure T_DBForm._actCancelExecute(Sender: TObject);
begin
  if  Assigned ( FDataFormIntf )
  and ( daCancel in FDataFormIntf.QueryActiveDataActions ) then
    FDataFormIntf.Cancel ;
end;


procedure T_DBForm._actNewUpdate(Sender: TObject);
begin
  _actNew.Enabled := Assigned ( FDataFormIntf ) and ( daInsert in FDataFormIntf.QueryActiveDataActions ) ;
end;

procedure T_DBForm._actEditUpdate(Sender: TObject);
begin
   _actEdit.Enabled := Assigned ( FDataFormIntf ) and ( daEdit in FDataFormIntf.QueryActiveDataActions ) ;
end;

procedure T_DBForm._actDeleteUpdate(Sender: TObject);
begin
   _actDelete.Enabled := Assigned ( FDataFormIntf ) and ( daDelete in FDataFormIntf.QueryActiveDataActions ) ;
end;


procedure T_DBForm._actSaveUpdate(Sender: TObject);
var
   Enabled : boolean ;
begin
  try
      Enabled := Assigned ( FDataFormIntf ) and ( [ daSave, daCancel ] * FDataFormIntf.QueryActiveDataActions  = [ daSave, daCancel ] ) ;
  finally
     _actSave.Enabled   := Enabled ;
     _actCancel.Enabled := Enabled ;
  end ;
end;


function T_DBForm.DataSetActive: boolean;
begin
  Try
     Result := Assigned( FDatamoduleBase ) and  Assigned ( dtsFicha.DataSet ) and ( dtsFicha.DataSet.Active ) ;
  except
  end
end;

function T_DBForm.DataSetIsEmpty: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.IsEmpty ) ;
  except
  end

end;


function T_DBForm.GetBOF: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.BOF ) ;
  except
  end
end;

function T_DBForm.GetEOF: boolean;
begin
  Try
     Result := ( not DataSetActive ) or ( dtsFicha.DataSet.EOF ) ;
  except
  end
end;


procedure T_DBForm.Help ;
begin
// do nothing
end;

procedure T_DBForm.StateChange(Sender: TObject);
begin
  if TDataSource ( Sender ).State in [dsInsert,dsEdit] then
     ActiveFicha ;
end;

procedure T_DBForm.UpdateData(Sender: TObject);
begin
  inherited;
  if TDataSource( Sender ).DataSet is TClientDataSet and
     TClientDataSet ( TDataSource( Sender ).DataSet ).ConstraintsDisabled then
     exit ;
  Validate;
end;


procedure T_DBForm.Validate;
begin
  if not FValidatorsEnabled then
    exit ;

  CreateValidators ;
  if ( not FValidators.Validate ) then
     abort ;
end;

constructor T_DBForm.Create(AOwner: TComponent);
begin
  // errors
  FAllowedDataActions := [daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther] ;

  FDataFormIntf := Self ;

  FValidators := TJvValidators.Create ( self ) ;
  FValidatorsEnabled := True ;
  FErrorIndicator := TJvErrorIndicator.Create ( self ) ;
  FValidators.ErrorIndicator := FErrorIndicator ;
  FErrorIndicator.BlinkStyle := ebsAlwaysBlink ;

  // DataSource
  InternalDataSource := TDataSource.Create ( self ) ;
  InternalDataSource.OnUpdateData  := UpdateData ;
  InternalDataSource.OnStateChange := StateChange ;
  inherited Create( AOwner ) ;
//  if not InitInheritedComponent(Self, T_DBForm) then
//     raise EResNotFound.CreateFmt('Resource %s not found', [ClassName]);
end;

initialization
  RegisterClass ( T_DBForm )

end.

