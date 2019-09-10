unit UZoo_ReproducaoPartosAbortosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,  JvExComCtrls, JvComCtrls,
  VCL.ExtCtrls, SysFormWizard, UZoo_ReproducaoPartosAbortosDatamodule, Data.DB, Tc.Data.DB.Helpers, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.Mask, JvExMask, JvToolEdit,
  JvDBControls, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvExControls,
  JvDBLookup, VCL.DBCtrls, JvDBCheckBox, JvExStdCtrls, JvEdit, JvDBSearchEdit,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits, UZoo_EntradaDadosBaseWizard,
  Tc.VCL.Application, DBClient,
  Tc.VCL.Controls.GDIButton, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers, Tc.VCL.ControlPopuper ;

type
  TZoo_ReproducaoPartosAbortosWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsPeriodo: TTabSheet;
    dtsPartosAbortos: TDataSource;
    TabSheet2: TTabSheet;
    dbgPartosAbortos: TJvDBUltimGrid;
    rbTodos: TRadioButton;
    rbPrenhezPeriodo: TRadioButton;
    rbPrevisaoParto: TRadioButton;
    deInicioPrenhez: TTcDateEdit;
    deFimPrenhez: TTcDateEdit;
    dePrevisaoParto: TTcDateEdit;
    lblA: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    lcOcorrencia: TDBLookupComboBox;
    Label6: TLabel;
    deData: TTcDBDateEdit;
    Label7: TLabel;
    edtBrinco: TJvComboEdit;
    deDataGrid: TTcDBDateEdit;
    BitBtn2: TTcGDIButton;
    dblcOcorrenciaGrid: TDBLookupComboBox;
    ControlPopuperProtocolos: TTcControlPopuper;
    dtsProtocolosParto: TDataSource;
    PanelSelectProtocolos: TPanel;
    PanelSelectProtocolosParto: TPanel;
    dbgProtocolosParto: TJvDBUltimGrid;
    Panel1: TPanel;
    lbProtocolosParto: TLabel;
    chkSelectAllProtocolosParto: TCheckBox;
    PanelSelectProtocolosCria: TPanel;
    dbgProtocolosCria: TJvDBUltimGrid;
    Panel3: TPanel;
    Label1: TLabel;
    chkSelectAllProtocolosCria: TCheckBox;
    edProtocolosGrid: TJvDBComboEdit;
    dtsProtocolosCria: TDataSource;
    Shape1: TShape;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    function dbgPartosAbortosCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _actExecuteExecute(Sender: TObject);
    procedure dbgPartosAbortosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deDataKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPrenhezKeyPress(Sender: TObject; var Key: Char);
    procedure lcOcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoEnter(Sender: TObject);
    procedure edtBrincoChange(Sender: TObject);
    procedure edtBrincoButtonClick(Sender: TObject);
    procedure dbgPartosAbortosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPartosAbortosKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblcOcorrenciaGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcOcorrenciaGridEnter(Sender: TObject);
    procedure dblcOcorrenciaGridExit(Sender: TObject);
    procedure dbgPartosAbortosEditButtonClick(Sender: TObject);
    function dbgProtocolosPartoCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgProtocolosPartoKeyPress(Sender: TObject; var Key: Char);
    procedure edProtocolosGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edProtocolosGridButtonClick(Sender: TObject);
    procedure dtsPartosAbortosDataChange(Sender: TObject; Field: TField);
    procedure ControlPopuperProtocolosClose(Sender: TObject);
    function dbgProtocolosCriaCheckIfBooleanField(Grid: TJvDBGrid;
      Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgProtocolosCriaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgProtocolosPartoCellClick(Column: TColumn);
    procedure dbgProtocolosCriaCellClick(Column: TColumn);
    procedure chkSelectAllProtocolosPartoClick(Sender: TObject);
    procedure chkSelectAllProtocolosCriaClick(Sender: TObject);
  private
    { Private declarations }
    FBrinco       : string ;
    Zoo_ReproducaoPartosAbortosDatamodule : TZoo_ReproducaoPartosAbortosDatamodule ;
    procedure UpdateEdtBrinco ;
    procedure AddBrinco ;
    procedure ValidateCamposFixo;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure AddByKey (
         AKey : string ;
         AKZOO_EVENTO_ZOOTECNICO : String ;
         ATipoEvento : Integer ;
         ADataEvento : TDateTime ;
         ANumeroLactacao : integer ) ;

    procedure ShowProtocolosCria;
    procedure SetStyleCheckBoxProtocolosParto;
    procedure SetStyleCheckBoxProtocolosCria;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
  end;


implementation

uses UfdlgZoo_PartosAbortosCrias, SearchsZootecnico, Exceptions, CLAg5Types, UMessagePrintDialog ;

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_ReproducaoPartosAbortosWizard.AddBrinco;
begin
   ValidateCamposFixo;

   try
    if ( Trim ( edtBrinco.Text ) <> '' ) and  Zoo_ReproducaoPartosAbortosDatamodule.AddBrinco( FBrinco {, deDataPadrao.Date } ) then
      begin
        UpdateEdtBrinco ;
        deData.SetFocus ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
        deData.SetFocus
    else
       raise Warning.Create('Animal não encontrado');
  except
     edtBrinco.setFocus ;
     edtBrinco.SelectAll ;
     raise ;
  end ;

end;

procedure TZoo_ReproducaoPartosAbortosWizard.AddByKey(
   AKey : string ;
   AKZOO_EVENTO_ZOOTECNICO : String ;
   ATipoEvento : Integer ;
   ADataEvento : TDateTime ;
   ANumeroLactacao : integer ) ;
begin
  if Zoo_ReproducaoPartosAbortosDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  ValidateCamposFixo;
  if Zoo_ReproducaoPartosAbortosDatamodule.AddByKey ( AKey, AKZOO_EVENTO_ZOOTECNICO, ATipoEvento, ADataEvento, ANumeroLactacao ) then
     deData.SetFocus
end;

procedure TZoo_ReproducaoPartosAbortosWizard.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Zoo_ReproducaoPartosAbortosDatamodule.RemoveEvento ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.cbxPrenhezKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if Key = #13 then
     begin
       Key := #0 ;
       deData.SetFocus ;
     end;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.chkSelectAllProtocolosCriaClick(
  Sender: TObject);
begin
  if chkSelectAllProtocolosCria.Checked then
   Zoo_ReproducaoPartosAbortosDatamodule.InvertAllSelection(True, TClientDataSet(dtsProtocolosCria.DataSet))
  else
   Zoo_ReproducaoPartosAbortosDatamodule.InvertAllSelection(False, TClientDataSet(dtsProtocolosCria.DataSet));
end;

procedure TZoo_ReproducaoPartosAbortosWizard.chkSelectAllProtocolosPartoClick(
  Sender: TObject);
begin
  if chkSelectAllProtocolosParto.Checked then
   Zoo_ReproducaoPartosAbortosDatamodule.InvertAllSelection(True, TClientDataSet(dtsProtocolosParto.DataSet))
  else
   Zoo_ReproducaoPartosAbortosDatamodule.InvertAllSelection(False, TClientDataSet(dtsProtocolosParto.DataSet));
end;

procedure TZoo_ReproducaoPartosAbortosWizard.ControlPopuperProtocolosClose(
  Sender: TObject);
begin

  if not dtsPartosAbortos.AutoEdit then
    exit ;
  Zoo_ReproducaoPartosAbortosDatamodule.UpdateDescrProtocolos ;
end;

constructor TZoo_ReproducaoPartosAbortosWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_ReproducaoPartosAbortosDatamodule := TZoo_ReproducaoPartosAbortosDatamodule.Create ( self ) ;
   dtsPartosAbortos.DataSet := Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos ;
   dtsProtocolosParto.DataSet := Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosParto;
   dtsProtocolosCria.DataSet  := Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosCria;

   //TParamMatriz.GetParam( _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;
   deInicioPrenhez.Date := Date - ( 9 * 30.5 ) ;
   deFimPrenhez.Date    := Date ;

   dePrevisaoParto.Date    := Date ;

   rbPrenhezPeriodo.Visible := DebugHook <> 0 ;
   rbTodos.Visible := DebugHook <> 0 ;
   lblA.Visible := DebugHook <> 0 ;
   deInicioPrenhez.Visible := DebugHook <> 0 ;
   deFimPrenhez.Visible := DebugHook <> 0 ;

   Zoo_ReproducaoPartosAbortosDatamodule.OnGetCria := TfdlgZoo_PartosAbortosCrias.Execute  ;

end;

procedure TZoo_ReproducaoPartosAbortosWizard.edProtocolosGridButtonClick(
  Sender: TObject);
var
 LPoint  : TPoint ;
 LTop, LLeft: Integer;
begin

  LLeft := (edProtocolosGrid.Left + edProtocolosGrid.Width) - (PanelSelectProtocolos.Width);
  LTop  := ( edProtocolosGrid.Top  + edProtocolosGrid.Height ) ;

  if (LTop + PanelSelectProtocolos.Height) > ClientHeight then
     LTop  := ( edProtocolosGrid.Top  - PanelSelectProtocolos.Height -1 ) ;


   LPoint := Point (
          LLeft
      ,   LTop
   ) ;
   LPoint := edProtocolosGrid.Parent.clientToScreen ( LPoint ) ;
   ControlPopuperProtocolos.Popup ( LPoint ) ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edProtocolosGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] )
   //and not ( TDBLookupComboBox ( Sender ).ListVisible )
  then
    begin
     Key := 0 ;
     edProtocolosGrid.Button.Click ;
    end ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edtBrincoButtonClick(
  Sender: TObject);
begin
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edtBrincoChange(Sender: TObject);
begin
  if edtBrinco.Text = Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBRINCOFEMEA.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edtBrincoEnter(Sender: TObject);
begin
  edtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edtBrincoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.Prior ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.Next ;
     UpdateEdtBrinco ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.State in [dsInsert,dsEdit] then
     Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.Post ;

  if ( Key = #13  ) then
    begin
      Key := #0 ;
      if ( Trim ( edtBrinco.Text ) = '' ) then
        exit ;

      if ( Trim ( edtBrinco.Text ) <> '' ) and ( edtBrinco.Text = Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBRINCOFEMEA.asString ) then
       begin
         deData.SetFocus ;
         exit ;
       end ;

      FBrinco := edtBrinco.Text ;
      AddBrinco ;
    end;
end;

class function TZoo_ReproducaoPartosAbortosWizard.Execute : boolean;
begin
  with Create ( nil ) do
    try
        Result := ShowModal = mrOK ;
        if Result then
          {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end ;


procedure TZoo_ReproducaoPartosAbortosWizard.lcOcorrenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if Key = #13 then
     begin
       Key := #0 ;
       edtBrinco.SetFocus ;
     end;
end;

function TZoo_ReproducaoPartosAbortosWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with {TSearchFemeaUltimaMonta} TSearchFemeaUltimaMontaPossivelPrenhez.Create do
       try
          FBrinco := '' ;
          TextToFind := TextToSearch ;
          lFound := Execute ;
          if lFound then
             begin
               FBrinco                := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               edtBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString,
                          Result.FieldByName( 'KZOO_EVENTO_ZOOTECNICO' ).asString,
                          Result.FieldByName( 'TIPOEVENTO' ).asInteger,
                          Result.FieldByName( 'DATAEVENTO' ).asDateTime,
                          Result.FieldByName( 'NUMERO_LACTACAO' ).asInteger  ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.SetStyleCheckBoxProtocolosCria;
begin
  chkSelectAllProtocolosCria.OnClick := nil;
  if Zoo_ReproducaoPartosAbortosDatamodule.IsAllSelected( TClientDataSet(dtsProtocolosCria.DataSet) ) then
    chkSelectAllProtocolosCria.State := cbChecked
  else
  if Zoo_ReproducaoPartosAbortosDatamodule.NothingSelected( TClientDataSet(dtsProtocolosCria.DataSet) ) then
    chkSelectAllProtocolosCria.State := cbUnchecked
  else
    chkSelectAllProtocolosCria.State := cbGrayed;
  chkSelectAllProtocolosCria.OnClick := chkSelectAllProtocolosCriaClick;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.SetStyleCheckBoxProtocolosParto;
begin
  chkSelectAllProtocolosParto.OnClick := nil;
  if Zoo_ReproducaoPartosAbortosDatamodule.IsAllSelected( TClientDataSet(dtsProtocolosParto.DataSet) ) then
    chkSelectAllProtocolosParto.State := cbChecked
  else
  if Zoo_ReproducaoPartosAbortosDatamodule.NothingSelected( TClientDataSet(dtsProtocolosParto.DataSet) ) then
    chkSelectAllProtocolosParto.State := cbUnchecked
  else
    chkSelectAllProtocolosParto.State := cbGrayed;
  chkSelectAllProtocolosParto.OnClick := chkSelectAllProtocolosPartoClick;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.ShowProtocolosCria;
begin
  with Zoo_ReproducaoPartosAbortosDatamodule do
   begin
    if cdsPartosAbortosINCLUIRCRIA.asString = 'T' then
      begin
        PanelSelectProtocolosCria.Visible := True;
        PanelSelectProtocolosCria.Width   := 251;
      end
    else
        PanelSelectProtocolosCria.Visible := False;
   end;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.UpdateEdtBrinco;
begin
  Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBRINCOFEMEA.asString ;
  edtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosBRINCOFEMEA.asString ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.ValidateCamposFixo;
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  ErrMsg := '' ;
(*
  if ( deDataPadrao.date = 0 ) {or ( deData.date < ( date - 30  ) )} then
     AddErr ( 'Data - em branco' ) ;
     //     AddErr ( 'Data - em branco / inferior a 30 dias' ) ;

  if ( deDataPadrao.date >  date ) then
     AddErr ( 'Data - superior a data atual' ) ;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos na entrada padrão'#13#10#13#10 + ErrMsg );
*)
end;

procedure TZoo_ReproducaoPartosAbortosWizard.deDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if Key = #13 then
     begin
       Key := #0 ;
       lcOcorrencia.SetFocus ;
     end;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dtsPartosAbortosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned( Zoo_ReproducaoPartosAbortosDatamodule ) then
    Exit;

  Zoo_ReproducaoPartosAbortosDatamodule.FilterProtocolosByEventoZootecnico ;
  SetStyleCheckBoxProtocolosParto;
  SetStyleCheckBoxProtocolosCria;
  ShowProtocolosCria;
end;

function TZoo_ReproducaoPartosAbortosWizard.dbgPartosAbortosCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field )
     and ( (Field.FieldName  = 'ABRIRLACTACAO'   )
        or ( Field.FieldName = 'INCLUIRCRIA'     )
        or ( Field.FieldName = 'SELECTED'        )
        or ( Field.FieldName = 'PROTOCOLO_PARTO' )  )  ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgPartosAbortosEditButtonClick(
  Sender: TObject);
begin
   with Zoo_ReproducaoPartosAbortosDatamodule, dbgPartosAbortos do
       if    ( SelectedField = cdsPartosAbortosNUMEROFILHOS )
        and  (  {( cdsPartosAbortosAbortoParto.AsInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
             or }( cdsPartosAbortosAbortoParto.asInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_PARTO   ) ) then
          TfdlgZoo_PartosAbortosCrias.Execute( Zoo_ReproducaoPartosAbortosDatamodule ) ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgPartosAbortosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then
     Key := 0 ;


//  cbxCria.Visible := Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosABORTOPARTO.asInteger = _ST_TIPO_PARTOABORTO_PARTO ;

end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgPartosAbortosKeyPress(
  Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;

begin
  if ( Key <> #13 ) then
    exit ;


   if (  Screen.ActiveControl = TJvDBUltimGrid ( Sender ) ) then
      Key := #0 ;

   with (TJvDBUltimGrid ( Sender )) do
       begin
          SkipDone := False ;
          while selectedindex < (fieldcount - 1) do
            begin
              selectedindex := selectedindex + 1 ;
              if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
               begin
                 SkipDone := True ;
                 Break ;
               end;
           end ;

          if not SkipDone then
             begin
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgPartosAbortosShowEditor(Sender: TObject; Field: TField;
   var AllowEdit: Boolean);
begin

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

  with Zoo_ReproducaoPartosAbortosDatamodule do
    if AllowEdit and (Field = cdsPartosAbortosDESC_PARTOABORTO) then
       AllowEdit := not cdsPartosAbortosFORCEABORTO.asBoolean ;

  with Zoo_ReproducaoPartosAbortosDatamodule do
    if AllowEdit and (Field = cdsPartosAbortosINCLUIRCRIA) then
       AllowEdit :=(  {( cdsPartosAbortosAbortoParto.AsInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
                   or }( cdsPartosAbortosAbortoParto.asInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_PARTO   ) ) ;

  with Zoo_ReproducaoPartosAbortosDatamodule do
    if AllowEdit and (Field = cdsPartosAbortosNUMEROFILHOS) then
       AllowEdit := (cdsLinhagem.RecordCount > 0) ;

//  if AllowEdit then
//    begin
//      if ( Field <> Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosSELECTED ) then
//        AllowEdit := Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortosSELECTED.asBoolean ;
//    end ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosCriaCellClick(
  Column: TColumn);
begin
  inherited;
  if not ( dtsProtocolosCria.DataSet.IsEmpty )
   and ( Column.FieldName =  'SELECTED' ) then
     Zoo_ReproducaoPartosAbortosDatamodule.InvertSelecao( TClientDataSet(dtsProtocolosCria.DataSet) ) ;

  SetStyleCheckBoxProtocolosCria;
end;

function TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosCriaCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosCriaSELECTED;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosCriaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     ControlPopuperProtocolos.ModalResult := mrOK ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosPartoCellClick(
  Column: TColumn);
begin
  if not ( dtsProtocolosParto.DataSet.IsEmpty )
   and ( Column.FieldName =  'SELECTED' ) then
     Zoo_ReproducaoPartosAbortosDatamodule.InvertSelecao( TClientDataSet(dtsProtocolosParto.DataSet) ) ;

  SetStyleCheckBoxProtocolosParto;
end;

function TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosPartoCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field = Zoo_ReproducaoPartosAbortosDatamodule.cdsProtocolosPartoSELECTED;
  StringForTrue  := '1' ;
  StringForFalse := '0' ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dbgProtocolosPartoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     ControlPopuperProtocolos.ModalResult := mrOK ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dblcOcorrenciaGridEnter(
  Sender: TObject);
begin
  dblcOcorrenciaGrid.DropDown ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dblcOcorrenciaGridExit(
  Sender: TObject);
begin
  dbgPartosAbortos.SetFocus ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard.dblcOcorrenciaGridKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
     TDBLookupComboBox ( Sender ).DropDown ;
end;

procedure TZoo_ReproducaoPartosAbortosWizard._actExecuteExecute(Sender: TObject);
var
  AMsg : string ;
const
  DlgCaption = '  Existem animais não secos ' ;
begin
//   TZoo_ProducaoControleLeiteiroDialogImprimir.Execute ( AMsg ) ;
  if Zoo_ReproducaoPartosAbortosDatamodule.processa ( AMsg ) then
    begin
       MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
       TCLAg5NSMsgEVT_PartosAbortos.CreateAndDispatch( self ) ; ;
//     _lblCaption.Caption := Caption ;
//     PageControl.ActivePage := tbsPeriodo ;
     inherited ;
    end
  else if AMsg <> '' then
     TMessagePrintDialog.Execute ( DlgCaption, AMsg )
end;

procedure TZoo_ReproducaoPartosAbortosWizard._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and ( Zoo_ReproducaoPartosAbortosDatamodule.cdsPartosAbortos.ChangeCount > 0 ) ;  //VTS
end;

procedure TZoo_ReproducaoPartosAbortosWizard._actNextExecute(Sender: TObject);
var
 FilterType : integer ;
 DataInicio, DataFim : TDateTime ;
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

  if rbPrevisaoParto.Checked then
    begin
     Caption := 'Partos / Abortos' + ' - previsão de parto até ' + FormatDateTime ( 'dd.mm.yyyy', dePrevisaoParto.Date ) ;
     Zoo_ReproducaoPartosAbortosDatamodule.SetFilter ( ftPrevisaoParto, 0, dePrevisaoParto.Date )
    end
  else if rbPrenhezPeriodo.Checked then
    begin
     Caption := 'Partos / Abortos' + ' - prenhez do período ' + FormatDateTime ( 'dd.mm.yyyy', deInicioPrenhez.Date ) + ' à '  + FormatDateTime ( 'dd.mm.yyyy', deFimPrenhez.Date );
     Zoo_ReproducaoPartosAbortosDatamodule.SetFilter ( ftPrenhez, deInicioPrenhez.Date, deFimPrenhez.Date )
    end
  else // if  rbTodos.Checked  then
    begin
     Caption := 'Partos / Abortos' + ' - todas as prenhez' ;
     Zoo_ReproducaoPartosAbortosDatamodule.SetFilter ( ftTodos, 0, 0 )
    end;

end;

procedure TZoo_ReproducaoPartosAbortosWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

  Caption := 'Partos / Abortos' ;

end;

initialization
  RegisterClass ( TZoo_ReproducaoPartosAbortosWizard ) ;

end.

