unit UZoo_RelatorioPersonalizado;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ComCtrls, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, VCL.Grids, VCL.DBGrids,
  Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr, SysFormWizard, VCL.ActnList, JvExExtCtrls, JvImage, JvExComCtrls,
  JvComCtrls, JvExtComponent, JvPanel, VirtualTrees,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, VCL.ImgList, VCL.DBCtrls,
  Tc.VCL.FloatPanel,
  ThreadSuppl, Math, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Edits.DBControls, Tc.VCL.Edits.Numbers, Tc.VCL.ControlPopuper,
  Tc.VCL.SysCore.MIB, Tc.VCL.SimpleSyntaxeMemo,
  UZoo_RelatorioPersonalizadoDatamodule, Tc.VCL.Dialogs,
  Tc.VCL.Controls.GDIButton, Vcl.WinXCtrls, JvDBGridSuppl,
  System.Actions, CL.Ag5.SelectDataFromPersonalizado, Data.DBXCommon, CDSSuppl,
  System.ImageList, Tc.VCL.Application, Wrappers ;

type
  TSysTypeList = record
     SysValueList  :String;
     SysDescriptionList: String;
  end;

  TReportDiscribeRecord = record
    IsGroup         : boolean ;
    Description     : string ;
    Hint            : string ;
    TableAlias      : string ;
    Column          : string ;
    ColumnDataType  : TVRptDataTypes ;
    ColumnType      : TVRptColumnType ;
    ListValues      : string ;
  end;

  PReportDiscribeRecord = ^TReportDiscribeRecord ;

  TJvDBUltimGrid =  class (  Wrappers.TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;

  TZoo_RelatorioPersonalizado = class(T_FormWizard)
    AddConditionButton: TTcGDIButton;
    DropConditionButton: TTcGDIButton;
    TabSheet1: TTabSheet;
    FiltrosPanel: TJvPanel;
    JvPanel6: TJvPanel;
    FiltrosPageControl: TPageControl;
    TabSheetCamposFiltro: TTabSheet;
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    CondicoesPageControl: TPageControl;
    TabSheetCamposCondicao: TTabSheet;
    TreeMenuPanel: TJvPanel;
    TreeViewCampos: TVirtualStringTree;
    dtsReportCfg: TDataSource;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ActionsImageList: TImageList;
    actMoveUp: TAction;
    actMoveDown: TAction;
    GridPanel: TJvPanel;
    dblcPersonalizado: TDBLookupComboBox;
    ClearConditionsButton: TTcGDIButton;
    Label1: TLabel;
    actAddCondition: TAction;
    actDropCondition: TAction;
    TabSheet2: TTabSheet;
    JvPanel3: TJvPanel;
    DBGridResultados: TJvDBUltimGrid;
    Bevel1: TBevel;
    _btnAddAll: TTcGDIButton;
    _btnRemoveAll: TTcGDIButton;
    dbgSelection: TJvDBUltimGrid;
    EditConditionPanel: TTcCaptionedPanel;
    Panel1: TPanel;
    SecondParamPanel: TPanel;
    FirstParamPanel: TPanel;
    OperatorsComboBox: TComboBox;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    actAddGroup: TAction;
    PopuperCondition: TTcControlPopuper;
    dtsResult: TDataSource;
    Label2: TLabel;
    Panel2: TPanel;
    Memo1: TTcSimpleSyntaxMemo;
    dtsListaPersonalizado: TDataSource;
    SaveAsPanel: TTcCaptionedPanel;
    btbPanelSaveOk: TTcGDIButton;
    btbPanelSaveCancel: TTcGDIButton;
    rbSaveAs: TRadioButton;
    edtSaveAs: TEdit;
    rbSaveExisting: TRadioButton;
    PopuperSaveAs: TTcControlPopuper;
    actSave: TAction;
    actDelete: TAction;
    cbxDescartados: TCheckBox;
    cbxUltimaLactacaoSecos: TCheckBox;
    btnListResult: TTcGDIButton;
    actRetornarDados: TAction;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    EdtPesquisa: TButtonedEdit;
    Label3: TLabel;
    procedure TreeViewCamposGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure TreeViewCamposKeyPress(Sender: TObject; var Key: Char);
    procedure PageControlChange(Sender: TObject);
    procedure DropConditionButtonClick(Sender: TObject);
    procedure actAddConditionExecute(Sender: TObject);
    procedure actDropConditionExecute(Sender: TObject);
    procedure actAddConditionUpdate(Sender: TObject);
    procedure _actNextExecute(Sender: TObject);
    function dbgSelectionCheckIfBooleanField(Grid: TJvDBGrid; Field: TField; var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgSelectionShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure FloatEditorOKButtonClick(Sender: TObject);
    procedure FloatEditorCancelButtonClick(Sender: TObject);
    procedure TreeViewCamposDblClick(Sender: TObject);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actAddGroupUpdate(Sender: TObject);
    procedure PopuperConditionShow(Sender: TObject);
    procedure OperatorsComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OperatorsComboBoxCloseUp(Sender: TObject);
    procedure ClearConditionsButtonClick(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure PopuperConditionClose(Sender: TObject);
    procedure actMoveUpExecute(Sender: TObject);
    procedure actMoveDownExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btbPanelSaveOkClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure dblcPersonalizadoCloseUp(Sender: TObject);
    procedure dblcPersonalizadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSaveUpdate(Sender: TObject);
    procedure dblcPersonalizadoEnter(Sender: TObject);
    procedure DBGridResultadosDblClick(Sender: TObject);
    procedure TreeViewCamposGetHint(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex;
      var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: string);
    procedure actRetornarDadosExecute(Sender: TObject);
    procedure _actCancelExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure ClearSearch ;
    procedure DoFilter ( AText : string ) ;
    procedure EdtPesquisaChange(Sender: TObject);
    procedure EdtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridResultadosAfterSort(Sender: TObject);
  private
    { Private declarations }
    Zoo_RelatorioPersonalizadoDatamodule : TZoo_RelatorioPersonalizadoDatamodule ;
    FActiveGroupNode : PVirtualNode;
    FInternalFormatSettings : TFormatSettings ;
    cdsResult : TClientDataSet ;

    FKeyCodeList : TKeyCodeList ;
    FReport : TTcMiBI ;

    FLastReport : string ;

    // Editor options
    FThisAllowedOperators : TVRptOperatorsSet ;
    FCompEditor1, FCompEditor2 : TWinControl ;
    FSecondParam : boolean ;
    FModalResult : integer  ;

    FAliasField : TStringList ;

    //
    procedure FReportGetWhere ( Sender: TObject;  UsedTableAlias : TStrings ; var AWhere : string ; AParams : TParams ) ;

    procedure CheckVisibleEditors ;

    procedure ShowFloatEditor ;
    procedure SetParamFromEditor( AEdior : TWinControl ; AParam : integer ) ;
    procedure SetEditorFromParam( AEdior : TWinControl ; AParam : integer ) ;
    procedure FilterView ;
    procedure AddCondition ( Data : PReportDiscribeRecord ) ;
    procedure DropCondition ;

    procedure InitTreeOptions ;
    procedure UpdatePanelFiltros ;
    procedure CheckChanged ;

    procedure AddGroupDadosGerais ;
    procedure AddGroupDadosCriacao;
    procedure AddGroupProducao ;
    procedure AddGroupProducaoAcumulada ;
    procedure AddGroupReproducao ;
    procedure AddGroupSanidade ;
    procedure AddGroupMastite ;
    procedure AddGroupProtocolos ;
    procedure AddGroupTarefas ;

    function AddGroup ( ACaption : string ; ANode : PVirtualNode = nil ; AHint : string = '' ) : PVirtualNode ;
    function AddField ( ACaption : string ; ATableAlias,  AColumn : string ; AColumnDataType : TVRptDataTypes ; ADescriptor : TVRptColumnType = ctField; AListValues: string = '' ) : PVirtualNode ;
    function AddFieldHint ( ACaption, AHint, ATableAlias,  AColumn : string ; AColumnDataType : TVRptDataTypes ; ADescriptor : TVRptColumnType = ctField; AListValues: string = '' ) : PVirtualNode ;
    procedure SetActiveGroupNode ( AActiveGroupNode : PVirtualNode ) ;
    procedure MoveUp;
    procedure MoveDown;

    procedure InitReportColumns ;

    procedure UpdateReportList ;
    procedure LoadReport ;


    function SaveReport : boolean ;
    procedure DeleteReport ;
    procedure ValidateSaveReport ;

    procedure ExecuteReport ;
    procedure SeTKeyCodeList(const Value: TKeyCodeList);

    procedure AddToKeyList ;

    function GetSysTypesList( ASysType: String; AOrderBy: Integer = 1; AWhere: String = '' ): TSysTypeList;

  public
    property KeyList :  TKeyCodeList  read FKeyCodeList write SeTKeyCodeList;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  end;


implementation

uses
    Tc.DBRTL.AbstractDB
  , System.Variants
  , Data.SQLTimSt
  , DateUtils
  , Exceptions
  , SysPrintGridDialog
  , UDBZootecnico
  , CLAg5Types
  , ClAg5ClientZootecnicoCommonTypes
  , StrUtils
  , Tc.RTL.StringUtils ;

{$R *.DFM}

procedure DoModal( const AKeyList : TKeyCodeList )  ;
begin
   with TZoo_RelatorioPersonalizado.Create( nil ) do
     try
        KeyList := AKeyList ;
        ShowModal ;
     finally
       free ;
     end;
end ;

procedure TZoo_RelatorioPersonalizado.InitReportColumns;

  procedure ADD_KAnimal;
  var
   Column : TTcMiBIColumn ;
  begin
    Column := TTcMiBIColumn.Create ;
    with Column do
      begin
    //    FID: String        ;             Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgID.asString        ;
        WHEREGROUP      :=        0 ;
        COLUMNORDER     :=        0 ;
        TABLEALIAS      :=        'FEMEAS'  ;
        COLUMN          :=        'KZOO_ANIMAL_FEMEA' ;
        COLUMNTYPE      :=        ctField ;
        COLUMNDATATYPE  :=        dtString ;
        COLUMNTITLE     :=        '' ;
        VISIBLE         :=        True  ;
        OperatorType    :=        opNone  ;
        OperatorNot     :=        False ;
        PARAM1          :=        '' ;
        PARAM2          :=        '' ;
      end ;
     FReport.AddColumn ( Column ) ;
  end;

  procedure ADD_Brinco_;
  var
   Column : TTcMiBIColumn ;
  begin
    Column := TTcMiBIColumn.Create ;
    with Column do
      begin
    //    FID: String        ;             Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgID.asString        ;
        WHEREGROUP      :=        0 ;
        COLUMNORDER     :=        0 ;
        TABLEALIAS      :=        'FEMEAS'  ;
        COLUMN          :=        '(IIF ( TRIM ( FEMEAS.BRINCO ) SIMILAR TO ''[0-9]+'', ''0'', SUBSTRING( TRIM(FEMEAS.BRINCO) FROM 1 FOR 1 ) ) || LPAD ( TRIM ( FEMEAS.BRINCO ), 15, ''0'' ))' ;
        COLUMNTYPE      :=        ctExpression ;
        COLUMNDATATYPE  :=        dtString ;
        COLUMNTITLE     :=        'BRINCO_' ;
        VISIBLE         :=        True  ;
        OperatorType    :=        opNone  ;
        OperatorNot     :=        False ;
        PARAM1          :=        '' ;
        PARAM2          :=        '' ;
      end ;
     FReport.AddColumn ( Column ) ;
  end;

  procedure CDSToColumn;
  var
   Column : TTcMiBIColumn ;
  begin
    Column := TTcMiBIColumn.Create ;
    with Column do
      begin
    //    FID: String        ;             Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgID.asString        ;
        WHEREGROUP      :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgWHEREGROUP.asInteger     ;
        COLUMNORDER     :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNORDER.asInteger    ;
        TABLEALIAS      :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgTABLEALIAS.asString      ;
        COLUMN          :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMN.asString          ;
        COLUMNTYPE      :=        TVRptColumnType ( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNTYPE.asInteger ) ;
        COLUMNDATATYPE  :=        TVRptDataTypes ( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNDATATYPE.asInteger ) ;
        COLUMNTITLE     :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNTITLE.asString     ;
        VISIBLE         :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgVISIBLE.asBoolean        ;
        OperatorType    :=        TVRptOperators ( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgOPERATOR.asInteger  )  ;
        OperatorNot     :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNOT.asBoolean            ;
        PARAM1          :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM1.asString          ;
        PARAM2          :=        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM2.asString          ;
      end ;
     FReport.AddColumn ( Column ) ;
  end;

begin
   FReport.ClearColumns ;

   ADD_KAnimal ;
   ADD_Brinco_  ;

   with Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg do
     try
      disableControls ;
      filtered := False ;
      first ;
      if RecordCount = 0 then
         raise Warning.Create('Nenhum campo selecionado');
      while not eof do
         begin
           CDSToColumn;
           next ;
         end;
     finally
      Filtered := True ;
      First ;
      enableControls ;
     end;

end;

procedure TZoo_RelatorioPersonalizado.InitTreeOptions;
var
 master : PVirtualNode ;
begin

 TreeViewCampos.NodeDataSize  := SizeOf ( TReportDiscribeRecord ) ;

 AddGroupDadosGerais ;
 AddGroupDadosCriacao;
 AddGroupProducao ;
 AddGroupProducaoAcumulada ;
 AddGroupReproducao ;
 AddGroupSanidade ;
 AddGroupMastite ;

// AddGroupProtocolos ;
// AddGroupTarefas ;

end ;

procedure TZoo_RelatorioPersonalizado.LoadReport;
begin
  FLastReport := Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
  Zoo_RelatorioPersonalizadoDatamodule.LoadReport ;
  FiltrosPageControl.ActivePage := TabSheetCamposFiltro ;
  CondicoesPageControl.ActivePage  := TabSheetCamposCondicao ;
  UpdatePanelFiltros ;
  Zoo_RelatorioPersonalizadoDatamodule.ReportAlias := Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString;
end;

function TZoo_RelatorioPersonalizado.dbgSelectionCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  StringForTrue  := 'T' ;
  StringForFalse := 'F' ;
  Result := ( Field = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgVISIBLE ) or ( Field = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNOT ) ;
end;

procedure TZoo_RelatorioPersonalizado.dbgSelectionShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := (Field = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgVISIBLE)
            or (Field = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNOT) ;
  if Field = Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgDSPCONDITION then
    begin
      dbgSelection.EditorMode := False ;
      ShowFloatEditor ;
    end;
end;


procedure TZoo_RelatorioPersonalizado.dblcPersonalizadoCloseUp(Sender: TObject);
begin
  with Zoo_RelatorioPersonalizadoDatamodule do
   if    ( cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString <> '' )
     and (    ( FLastReport = '' )
           or ( dblcPersonalizado.KeyValue <> FLastReport )
           or ( cdsReportCfg.IsEmpty )
         ) then
        self.LoadReport ;
end;

procedure TZoo_RelatorioPersonalizado.dblcPersonalizadoEnter(Sender: TObject);
begin
   CheckChanged;
end;

procedure TZoo_RelatorioPersonalizado.dblcPersonalizadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, 32..126 ] ) and not ( TDBLookupComboBox ( Sender ).ListVisible ) then
    begin
     Key := 0 ;
     TDBLookupComboBox ( Sender ).DropDown ;
    end ;
end;

procedure TZoo_RelatorioPersonalizado.OperatorsComboBoxCloseUp(Sender: TObject);
begin
  CheckVisibleEditors ;
end;

procedure TZoo_RelatorioPersonalizado.CheckVisibleEditors ;
begin
  FCompEditor1.Visible := ( OperatorsComboBox.Text <> StrOperators[ opNone ] )
                      and ( OperatorsComboBox.Text <> StrOperators[ opIsEmpty ] ) ;
  SecondParamPanel.Visible := OperatorsComboBox.Text = StrOperators[ opBetween ]

end;

procedure TZoo_RelatorioPersonalizado.OperatorsComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if ((( Key = VK_DOWN ) or ( Key = VK_UP )) and not ( ssAlt in Shift )) and not TComboBox ( Sender ).DroppedDown then
    TComboBox ( Sender ).DroppedDown := True

end;

procedure TZoo_RelatorioPersonalizado.PageControlChange(Sender: TObject);
begin
  inherited;
  with TPageControl ( Sender ) do
    begin

     if FiltrosPageControl.ActivePageIndex <> ActivePageIndex then
        FiltrosPageControl.ActivePageIndex := ActivePageIndex ;

     if CondicoesPageControl.ActivePageIndex  <> ActivePageIndex then
       CondicoesPageControl.ActivePageIndex  := ActivePageIndex ;

    end;

  UpdatePanelFiltros ;

end;


procedure TZoo_RelatorioPersonalizado.CheckChanged;
begin
   if   ( Zoo_RelatorioPersonalizadoDataModule.cdsReportCfg.ChangeCount > 0 )
    and (MessageDlg ( 'Deseja salvar o relatório', mtConfirmation ) = mrYes )
    and  not SaveReport then
      TreeViewCampos.SetFocus ;
end;

procedure TZoo_RelatorioPersonalizado.ClearConditionsButtonClick(Sender: TObject);
begin
  dblcPersonalizado.KeyValue := null;
  Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.EmptyDataSet ;
  Zoo_RelatorioPersonalizadoDatamodule.ReportAlias := '';
end;

procedure TZoo_RelatorioPersonalizado.SetParamFromEditor(AEdior: TWinControl; AParam: integer  );
var
   DataType : TVRptDataTypes ;
   AParamFiled : TStringField ;
begin

   if AParam = 1 then
      AParamFiled := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM1
   else
      AParamFiled := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM2 ;

   DataType := TVRptDataTypes( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNDATATYPE.AsInteger ) ;

   case DataType of
     dtDate    :
      begin
       if ( TTcDateEdit( AEdior ).Date > (Date - 36500) ) then
         AParamFiled.asSQLTimeStamp  := DateTimeToSQLTimeStamp ( TTcDateEdit( AEdior ).Date )
       else
         AParamFiled.Clear ;
      end;
     dtInteger : AParamFiled.asInteger  := TTcCalcEdit( AEdior ).AsInteger ;
     dtFloat   : AParamFiled.AsString   := FloatToStr ( TTcCalcEdit( AEdior ).Value, FInternalFormatSettings ) ;
   else
     AParamFiled.asString := TEdit( AEdior ).Text ;
   end;

end;

function TZoo_RelatorioPersonalizado.SaveReport : boolean ;
begin

   Result := False ;

   if Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizados.IsEmpty then
     begin
        rbSaveExisting.Visible := False ;
        rbSaveAs.Checked       := True ;
        edtSaveAs.Text         := 'Relatorio Personalizado 1'
     end
   else
     begin
        rbSaveExisting.Visible := True ;
        rbSaveExisting.Caption := Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosNOME.asString ;
        rbSaveExisting.Checked := True ;
        edtSaveAs.Text := 'Copia ' + Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosNOME.asString ;
     end;

   with FiltrosPanel.clientToScreen ( Point ( dblcPersonalizado.Left, dblcPersonalizado.Top ) ) do
         PopuperSaveAs.ShowModal ( Point ( X, Y ) ) ;

   if PopuperSaveAs.ModalResult  = mrOK then
     begin
        if rbSaveExisting.Checked then
           Zoo_RelatorioPersonalizadoDatamodule.SaveExisting
        else
           Zoo_RelatorioPersonalizadoDatamodule.SaveNew ( edtSaveAs.Text ) ;

        Result := True ;

        UpdateReportList;
     end;

end;

procedure TZoo_RelatorioPersonalizado.SetActiveGroupNode(AActiveGroupNode : PVirtualNode );
begin
   FActiveGroupNode := AActiveGroupNode  ;
end;

procedure TZoo_RelatorioPersonalizado.SetEditorFromParam(AEdior: TWinControl;
  AParam: integer);
var
   DataType : TVRptDataTypes ;
   AParamFiled : TStringField ;
begin

   if AParam = 1 then
      AParamFiled := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM1
   else
      AParamFiled := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgPARAM2 ;

   DataType := TVRptDataTypes( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNDATATYPE.AsInteger ) ;

   case DataType of
     dtDate    : if AParamFiled.asString <> '' then
                    TTcDateEdit( AEdior ).Date   := SQLTimeStampToDateTime ( AParamFiled.asSQLTimeStamp ) ;
     dtInteger : TTcCalcEdit( AEdior ).AsInteger := StrToIntDef ( AParamFiled.asString, 0 ) ;
     dtFloat   : TTcCalcEdit( AEdior ).Value     := StrToFloatDef ( AParamFiled.asString, 0, FInternalFormatSettings ) ;
     dtBoolean :
       begin
         if AParamFiled.asString = '' then
           TComboBox( AEdior ).ItemIndex     := 0
         else
           TComboBox( AEdior ).ItemIndex     := TComboBox( AEdior ).Items.IndexOf ( AParamFiled.asString )
       end
   else
     TEdit( AEdior ).Text := AParamFiled.asString ;
   end;

end;


procedure TZoo_RelatorioPersonalizado.SeTKeyCodeList(const Value: TKeyCodeList);
begin
  FKeyCodeList := Value;
end;

procedure TZoo_RelatorioPersonalizado.ShowFloatEditor ;
var
  CellRect : TRect ;
  IterateOperatos : TVRptOperators ;
  DataType : TVRptDataTypes ;
  ComboOperatorIndex : integer ;
  I: Integer;
  StrList, ListValues : string;
begin
   FCompEditor1 := nil ;
   FCompEditor2 := nil ;

   CellRect := self.dbgSelection.CellRect( 3, dbgSelection.Row ) ;

   if CellRect.Right - CellRect.Left < EditConditionPanel.Width then
      CellRect.Left := CellRect.Left + (CellRect.Right - CellRect.Left) - EditConditionPanel.Width ;

   ComboOperatorIndex := -1 ;
   OperatorsComboBox.clear ;
   OperatorsComboBox.items.Add( StrOperators[ opNone ] );
   DataType := TVRptDataTypes( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNDATATYPE.AsInteger ) ;
   ListValues := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgLISTVALUES.AsString;
   FThisAllowedOperators := AllowedOperators[ DataType ] ;

   for IterateOperatos := Low (TVRptOperators) to High (TVRptOperators) do
     if IterateOperatos in FThisAllowedOperators then
       begin
          if IterateOperatos = TVRptOperators ( Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgOPERATOR.AsInteger ) then
             ComboOperatorIndex := OperatorsComboBox.Items.Add ( StrOperators[IterateOperatos] )
          else
             OperatorsComboBox.Items.Add ( StrOperators[IterateOperatos] ) ;
       end;

   if OperatorsComboBox.Items.Count > 0 then
      OperatorsComboBox.ItemIndex := Max ( 0, ComboOperatorIndex ) ;

   FSecondParam := opBetween in FThisAllowedOperators ;

   case DataType of
     dtDate :
       begin
           FCompEditor1 := TTcDateEdit.Create ( nil ) ;
           if FSecondParam then
              FCompEditor2 := TTcDateEdit.Create ( nil ) ;
       end ;
     dtInteger :
      begin
          FCompEditor1 := TTcCalcEdit.Create ( nil ) ;
          TTcCalcEdit( FCompEditor1 ).ShowButton := False ;
          if FSecondParam then
            begin
             FCompEditor2 := TTcCalcEdit.Create ( nil ) ;
             TTcCalcEdit( FCompEditor2 ).ShowButton := False ;
            end;

      end ;
     dtFloat :
      begin
          FCompEditor1 := TTcCalcEdit.Create ( nil ) ;
          TTcCalcEdit( FCompEditor1 ).ShowButton := False ;
          if FSecondParam then
            begin
             FCompEditor2 := TTcCalcEdit.Create ( nil ) ;
             TTcCalcEdit( FCompEditor2 ).ShowButton := False ;
            end;

      end ;
     dtBoolean :
      begin
          FCompEditor1 :=  TComboBox.create ( nil ) ;
          With TComboBox ( FCompEditor1 ) do
            begin
              Style     := csOwnerDrawFixed ;
              Parent := FirstParamPanel ;
              Items.Add ( 'Sim' ) ;
              Items.Add ( 'Não' ) ;
              OnKeyDown := OperatorsComboBoxKeyDown ;
            end
      end;
      dtListValueString:
       begin
         if ListValues <> EmptyStr then
           begin

              FCompEditor1 :=  TComboBox.create ( nil ) ;
              With TComboBox ( FCompEditor1 ) do
               begin
                 Style     := csOwnerDrawFixed ;
                 Parent := FirstParamPanel ;
                 StrList := '';
                 for I := 1 to Length(ListValues) do
                  begin
                    if ListValues[I] = ';' then
                     begin
                       Items.Add(StrList);
                       StrList := '';
                     end
                    else
                    if I = Length(ListValues) then
                     begin
                       StrList := StrList + ListValues[I];
                       Items.Add(StrList);
                       StrList := '';
                     end
                    else
                       StrList := StrList + ListValues[I];
                 end;
                 OnKeyDown := OperatorsComboBoxKeyDown ;
               end;

           end
       end
   else
      begin

        FCompEditor1 := TEdit.Create ( nil ) ;
        if FSecondParam then
           FCompEditor2 := TEdit.Create ( nil ) ;

      end ;
   end;

   FCompEditor1.Parent := FirstParamPanel ;
   FCompEditor1.Top    := OperatorsComboBox.Top ;
   FCompEditor1.Left   := OperatorsComboBox.Left + OperatorsComboBox.Width + 5 ;
   SetEditorFromParam( FCompEditor1, 1 ) ;

   if FSecondParam then
     begin
       FCompEditor2.Parent := SecondParamPanel ;
       FCompEditor2.Top    := OperatorsComboBox.Top ;
       FCompEditor2.Left := OperatorsComboBox.Left + OperatorsComboBox.Width + 5 ;
       SetEditorFromParam( FCompEditor2, 2 ) ;
     end;

   CheckVisibleEditors ;

   with self.dbgSelection.clientToScreen ( Point ( CellRect.Left, CellRect.Top ) ) do
         self.PopuperCondition.Popup( Point ( X, Y ) ) ;

end;

procedure TZoo_RelatorioPersonalizado.UpdatePanelFiltros;
begin
  TreeMenuPanel.Parent  := FiltrosPageControl.ActivePage ;
  GridPanel.Parent      := CondicoesPageControl.ActivePage ;
  FilterView ;
end;

procedure TZoo_RelatorioPersonalizado.UpdateReportList;
begin
   dblcPersonalizado.KeyValue := Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizadosKZOO_PERSONALIZADO.asString ;
end;

procedure TZoo_RelatorioPersonalizado.ValidateSaveReport;
begin
   if rbSaveAs.Checked then
     begin
       if Trim ( edtSaveAs.Text ) = '' then
         raise Warning.Create('Informe um nome para o relatório');
       Zoo_RelatorioPersonalizadoDatamodule.CheckAlreadExists ( edtSaveAs.Text ) ;
     end;
end;

procedure TZoo_RelatorioPersonalizado.PopuperConditionClose(Sender: TObject);
var
   IterateOperatos : TVRptOperators ;
begin
   if FModalResult <> mrCancel then
     begin
       Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Edit ;

       if OperatorsComboBox.ItemIndex = 0 then
          Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgOPERATOR.AsInteger := Ord ( opNone )
       else
         for IterateOperatos := Low (TVRptOperators) to High (TVRptOperators) do
           if IterateOperatos in FThisAllowedOperators then
                if ( OperatorsComboBox.Text = StrOperators[IterateOperatos] ) then
                   Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgOPERATOR.AsInteger := Ord ( IterateOperatos ) ;

       SetParamFromEditor( FCompEditor1,  1 ) ;

       if FSecondParam then
         SetParamFromEditor( FCompEditor2, 2 ) ;

       Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Post ;

     end;

   FCompEditor1.free ;

   if FSecondParam then
      FCompEditor2.free ;
end;

procedure TZoo_RelatorioPersonalizado.PopuperConditionShow(Sender: TObject);
begin
  FModalResult := mrOK ;
  OperatorsComboBox.SetFocus ;
end;


procedure TZoo_RelatorioPersonalizado.DeleteReport;
begin
  with Zoo_RelatorioPersonalizadoDatamodule do
   begin
     if MessageDlg (  'Deseja excluir o relatório'#13#10 +
                    QuotedStr ( cdsRelatorioPersonalizadosNOME.asString ), mtConfirmation ) = mrYes then
       Delete ;
       UpdateReportList ;
       LoadReport ;
   end;
end;

destructor TZoo_RelatorioPersonalizado.Destroy;
begin
  TGridStorager.Save(DBGridResultados, Zoo_RelatorioPersonalizadoDatamodule.ReportAlias);
  FAliasField.Free ;
  FReport.free ;
  inherited;
end;

procedure TZoo_RelatorioPersonalizado.DropCondition;
begin
   if not Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.IsEmpty then
      Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.delete ;
end;

procedure TZoo_RelatorioPersonalizado.DropConditionButtonClick(Sender: TObject);
begin
   DropCondition;
end;


procedure TZoo_RelatorioPersonalizado.ClearSearch ;
var
 Node: PVirtualNode;
 Data: PReportDiscribeRecord;//PNodeData;
begin
    Node := TreeViewCampos.GetFirst;
    while node <> nil do
      begin
       Node.States := Node.States + [vsVisible]-[vsSelected];
       Node := TreeViewCampos.GetNext(Node);
    end;
    TreeViewCampos.invalidate;
end;

procedure TZoo_RelatorioPersonalizado.DoFilter ( AText : string ) ;
var
 Node: PVirtualNode;
 Data: PReportDiscribeRecord;//PNodeData;
begin
    Node := TreeViewCampos.GetFirst;
    while node <> nil do
      begin
       Data := TreeViewCampos.GetNodeData(Node);

       if Data.isGroup then
        begin
          node.States := node.States + [vsExpanded];
        end
       else
          if Pos( AText,UpperCase(Data.Description))=0 then
             Node.States := Node.States - [vsVisible];

        Node := TreeViewCampos.GetNext(Node);
    end;
    { //https://stackoverflow.com/questions/3009004/virtualstringtree-hide-nodes
    TreeViewCampos.RootNode.TotalHeight :=  TreeViewCampos.RootNode.TotalHeight + TreeViewCampos.BottomSpace;
    TreeViewCampos.UpdateScrollBars(True);}
    TreeViewCampos.invalidate;
end;


procedure TZoo_RelatorioPersonalizado.EdtPesquisaChange(Sender: TObject);
var
 Node: PVirtualNode;
 Data: PReportDiscribeRecord;//PNodeData;


begin
    ClearSearch ;
    if Trim ( EdtPesquisa.Text ) <> ''  then
     begin
      DoFilter( UPPERCASE(EdtPesquisa.Text) );
      {Node := TreeViewCampos.GetFirst;

      //Selecionar o primeiro da lista
      while node <> nil do
       begin
        Data := TreeViewCampos.GetNodeData(Node);

        if ( not Data.isGroup ) and ( node.States <> (node.States - [vsVisible]) ) then
         begin
           node.States := node.States + [vsSelected];
           Break;
         end;

        Node := TreeViewCampos.GetNext(Node);
       end;
       }
     end;
end;

procedure TZoo_RelatorioPersonalizado.EdtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key in [VK_DOWN, VK_RETURN] then
    if TreeViewCampos.CanFocus then
       TreeViewCampos.SetFocus;


end;

procedure TZoo_RelatorioPersonalizado.ExecuteReport;
var
   sqlStmt : string ;
   I : integer ;
   DisplayLabel : string ;
   T : TDBXTransaction ;
begin
   InitReportColumns ;
   sqlStmt := FReport.SQLStmt ;
   Memo1.Lines.Text := sqlStmt ;

   dtsResult.DataSet := nil ;
   DBGridResultados.Columns.Clear ;

   if Assigned (  cdsResult ) then
     FreeAndNil ( cdsResult ) ;

   T :=  TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ).BeginTransaction ;
   TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsResult, 'SELECT DISTINCT ' + sqlStmt, FReport.SQLParams ) ;
   TSQLConnection ( TTcAbstractDB.GetByAlias('ZOOTECNICO').Connection ).CommitFreeAndNil( T );
   //-- /* */
   for I := 0 to cdsResult.FieldCount - 1 do
     begin
       DisplayLabel := FAliasField.Values[ QuotedStr ( cdsResult.fields[ I ].FieldName ) ] ;
       if DisplayLabel <> '' then
          cdsResult.fields[ I ].DisplayLabel := AnsiDequotedStr( DisplayLabel, '''' ) ;
       if cdsResult.fields[ I ] is TFloatField then
          TFloatField ( cdsResult.fields[ I ] ).DisplayFormat := '#,0.00' ;

     end;

   cdsResult.FieldByName ( 'KZOO_ANIMAL_FEMEA' ).Visible := False ;
   cdsResult.FieldByName ( 'BRINCO_' ).Visible := False ;
   TCDSSuppl.SaveConfigFieldsCDS( cdsResult, Zoo_RelatorioPersonalizadoDatamodule.ReportAlias);
   Zoo_RelatorioPersonalizadoDatamodule.LoadIndexCDS(cdsResult);
   dtsResult.DataSet := cdsResult ;
   lblTotalLinhas.Caption := 'Total de linhas : ' + cdsResult.RecordCount.toString ;
end;

procedure TZoo_RelatorioPersonalizado.FilterView;
begin
  Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.DisableControls ;
  Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Filter := Format (  '%s = %d', [ Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgWHEREGROUP.FieldName, CondicoesPageControl.ActivePageIndex ] ) ;
  Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.EnableControls ;
  Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Filtered := True ;
end;

procedure TZoo_RelatorioPersonalizado.TreeViewCamposDblClick(Sender: TObject);
var
   Node : PVirtualNode ;
begin
   with TreeViewCampos.screentoclient( mouse.cursorpos ) do
     Node := TreeViewCampos.GetNodeAt( x, y ) ;
   if Assigned ( Node ) and ( node = TreeViewCampos.FocusedNode ) then
      AddCondition ( TreeViewCampos.GetNodeData ( Node ) ) ;
end;

procedure TZoo_RelatorioPersonalizado.TreeViewCamposGetHint(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: string);
var
  LData, LParentData : PReportDiscribeRecord ;
  LParentHint, LHint : string ;
begin

  LData := PReportDiscribeRecord ( TreeViewCampos.GetNodeData(Node) ) ;
  LParentData := nil ;
  LParentHint := '' ;
  if Assigned ( Node.Parent ) then
    begin
     LParentData := PReportDiscribeRecord ( TreeViewCampos.GetNodeData(Node.Parent) ) ;
     if Assigned ( LParentData ) then
       if ( LParentData^.Hint = '' ) then
          LParentHint := LParentData^.Description  + ' - '
        else
          LParentHint := LParentData^.Hint + ' - ' ;
    end;

  if ( LData^.Hint = '' ) then
    LHint := LData^.Description
  else
    LHint := LData^.Hint ;

  HintText := LParentHint + LHint ;
end;

procedure TZoo_RelatorioPersonalizado.TreeViewCamposGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PReportDiscribeRecord ;
begin
  Data := PReportDiscribeRecord ( TreeViewCampos.GetNodeData(Node) ) ;
  CellText := Data^.Description
end;


procedure TZoo_RelatorioPersonalizado.TreeViewCamposKeyPress(Sender: TObject;
  var Key: Char);
var
  Node : PVirtualNode ;
begin
   if Key = #13 then
     begin
       Node := TreeViewCampos.FocusedNode ;
       if Assigned ( Node )  then
          AddCondition ( TreeViewCampos.GetNodeData ( Node ) )  ;
     end;
end;

procedure TZoo_RelatorioPersonalizado._actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel ;     { TODO -oCaique -cMelhoria : se modal deve retornar lista vazia }
end;

procedure TZoo_RelatorioPersonalizado._actExecuteExecute(Sender: TObject);
var
  DBGName : string ;
  gSource : TJvDBUltimGrid ;
begin
  gSource := DBGridResultados ;
  DBGName := gSource.Name ;
  gSource.Name := 'PERS_' + FormatDateTime ( 'yymmddhhnnss', Now ) ;
  SysPrintGridDialog.TPrintGridDialog.Execute( gSource, ''{, 'Total de linhas : ' + dtsResult.DataSet.RecordCount.ToString} ) ;
  gSource.Name := DBGName ;
  DBGridResultados := gSource  ;
end;

procedure TZoo_RelatorioPersonalizado._actNextExecute(Sender: TObject);
begin
   ExecuteReport ;
   TGridStorager.Load(DBGridResultados, Zoo_RelatorioPersonalizadoDatamodule.ReportAlias);
   inherited;
    btnListResult.Visible :=  ( fsModal in self.FormState  )
                          and ( PageControl.ActivePage = TabSheet2 )  ;
end;

procedure TZoo_RelatorioPersonalizado._actPriorExecute(Sender: TObject);
begin
  TGridStorager.Save(DBGridResultados, Zoo_RelatorioPersonalizadoDatamodule.ReportAlias);
  inherited;
  btnListResult.Visible :=  ( fsModal in self.FormState  )
                        and ( PageControl.ActivePage = TabSheet2 )  ;
end;

const
  _MAX_OR_CONDITIONS = 5 ;

constructor TZoo_RelatorioPersonalizado.Create(AOwner: TComponent );
var
  IterateMaxOrConditions : integer ;
begin
  inherited;

  _actExecute.Caption := 'V&isualizar' ;
  _btbExecute.Caption := 'V&isualizar' ;

  Zoo_RelatorioPersonalizadoDatamodule := TZoo_RelatorioPersonalizadoDatamodule.Create ( self ) ;
  DBGridResultados.ShowHighlighter := True ;
  Zoo_RelatorioPersonalizadoDatamodule.OpenTables ;
  dtsReportCfg.DataSet := Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg ;

  FAliasField := TStringList.Create ;
  FLastReport := '' ;
  Zoo_RelatorioPersonalizadoDatamodule.ReportAlias := '';

  UpdateReportList ;

  dbgSelection.TitleButtons := False ;

  FReport := TTcMiBI.Create ;
  FReport.OnGetWhere := FReportGetWhere ;

  with FReport do
    begin
      AddTable ( 'FEMEAS',         TVRptTable.Create ( ttTable, 'VRPT_FEMEAS',              trPivot,    '',        '', '' ) ) ;
      AddTable ( 'DESCARTE',       TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_DESCARTES',     trLeftJoin, 'DESCARTE.KZOO_ANIMAL = FEMEAS.KZOO_ANIMAL_FEMEA',                        '', '' ) ) ;
      AddTable ( 'CRESCIMENTO',    TVRptTable.Create ( ttTable, 'VRPT_CRESCIMENTO',         trLeftJoin, 'CRESCIMENTO.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA', '', '' ) ) ;
      AddTable ( 'LACTACAO',       TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTACAO.KZOO_LACTACAO   = FEMEAS.KULTIMA_LACTACAO AND ( LACTACAO.DATA_SECAGEM IS NULL OR :SHOW_ULAS = ''T'' )', '', '' ) ) ;
      AddTable ( 'PROD_ACUMULADA', TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'PROD_ACUMULADA.KZOO_ANIMAL_FEMEA   = FEMEAS.KZOO_ANIMAL_FEMEA', '', '' ) ) ;
      AddTable ( 'SECAGEM',        TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'SECAGEM.KZOO_LACTACAO   = FEMEAS.KULTIMA_LACTACAO AND SECAGEM.DATA_SECAGEM IS NOT NULL', '', '' ) ) ;
      AddTable ( 'UP',             TVRptTable.Create ( ttTable, 'ZOO_PESAGEM_LEITE',        trLeftJoin, 'UP.KZOO_PESAGEM_LEITE = LACTACAO.KULTIMA_PESAGEMLEITE',                 '', 'LACTACAO' ) ) ;
      AddTable ( 'PA_UP',          TVRptTable.Create ( ttTable, 'ZOO_PESAGEM_LEITE',        trLeftJoin, 'PA_UP.KZOO_PESAGEM_LEITE = PROD_ACUMULADA.KULTIMA_PESAGEMLEITE',        '', 'PROD_ACUMULADA' ) ) ;
      AddTable ( 'ANALISE',        TVRptTable.Create ( ttTable, 'VRPT_ANALISE_LEITE',       trLeftJoin, 'ANALISE.KZOO_LACTACAO = LACTACAO.KZOO_LACTACAO',                        '', 'LACTACAO' ) ) ;
      AddTable ( 'ANALISE2',       TVRptTable.Create ( ttTable, 'VRPT_ANALISE_LEITE2',      trLeftJoin, 'ANALISE2.KZOO_LACTACAO = LACTACAO.KZOO_LACTACAO',                        '', 'LACTACAO' ) ) ;
      //AddTable ( 'ULTIMA_ANALISE', TVRptTable.Create ( ttTable, 'VRPT_ULTIMA_ANALISE',      trLeftJoin, 'ULTIMA_ANALISE.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA',           '', '' ) ) ;
      AddTable ( 'ULTIMA_ANALISE', TVRptTable.Create ( ttTable, 'ZOO_PESAGEM_LEITE_ANALISE', trLeftJoin, 'ULTIMA_ANALISE.KZOO_PESAGEM_LEITE = FEMEAS.KULTIMA_ANALISE',           '', '' ) ) ;

      AddTable ( 'LACTA1',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA1.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA1.NL = 1', '', '' ) ) ;
      AddTable ( 'LACTA2',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA2.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA2.NL = 2', '', '' ) ) ;
      AddTable ( 'LACTA3',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA3.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA3.NL = 3', '', '' ) ) ;
      AddTable ( 'LACTA4',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA4.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA4.NL = 4', '', '' ) ) ;
      AddTable ( 'LACTA5',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA5.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA5.NL = 5', '', '' ) ) ;
      AddTable ( 'LACTA6',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA6.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA6.NL = 6', '', '' ) ) ;
      AddTable ( 'LACTA7',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA7.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA7.NL = 7', '', '' ) ) ;
      AddTable ( 'LACTA8',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA8.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA8.NL = 8', '', '' ) ) ;
      AddTable ( 'LACTA9',         TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA9.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA9.NL = 9', '', '' ) ) ;
      AddTable ( 'LACTA10',        TVRptTable.Create ( ttTable, 'ZOO_LACTACOES',            trLeftJoin, 'LACTA10.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND LACTA10.NL = 10', '', '' ) ) ;
      AddTable ( 'EV_ULTIMAMONTA', TVRptTable.Create ( ttTable, 'ZOO_EVENTOS_ZOOTECNICOS',  trLeftJoin, 'EV_ULTIMAMONTA.KZOO_EVENTO_ZOOTECNICO = FEMEAS.KULTIMA_MONTA AND ( FEMEAS.KULTIMA_LACTACAO IS NULL OR FEMEAS.ULTIMA_MONTA > FEMEAS.ULTIMA_LACTACAO )', '', '' ) ) ;
      AddTable ( 'EV_ULTIMOCIO',   TVRptTable.Create ( ttTable, 'ZOO_EVENTOS_ZOOTECNICOS',  trLeftJoin, 'EV_ULTIMOCIO.KZOO_EVENTO_ZOOTECNICO = FEMEAS.KULTIMO_CIO AND ( FEMEAS.KULTIMA_LACTACAO IS NULL OR FEMEAS.ULTIMO_CIO > FEMEAS.ULTIMA_LACTACAO )',       '', '' ) ) ;
      AddTable ( 'EV_ULTIMOABORTO',TVRptTable.Create ( ttTable, 'ZOO_EVENTOS_ZOOTECNICOS',  trLeftJoin, Format('EV_ULTIMOABORTO.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND EV_ULTIMOABORTO.ABORTOPARTO IN (%d, %d) '
                                                                                                        +#13#10'AND EV_ULTIMOABORTO.DATAABORTOPARTO = (SELECT MAX(DATAABORTOPARTO) FROM ZOO_EVENTOS_ZOOTECNICOS WHERE KZOO_ANIMAL_FEMEA = EV_ULTIMOABORTO.KZOO_ANIMAL_FEMEA and ABORTOPARTO IN (%d, %d))',[_ST_TIPO_PARTOABORTO_ABORTO, _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO, _ST_TIPO_PARTOABORTO_ABORTO, _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO]),       '', '' ) ) ;

     { AddTable ( 'EV_ULTIMA_COLETA_MONTA',   TVRptTable.Create ( ttTable, Format('(SELECT EUC.DATAEVENTO "ULTIMA_COLETA", EUM.DATAEVENTO "ULTIMA_MONTA" '
                                                                            +#13#10'FROM ZOO_EVENTOS_ZOOTECNICOS EUM, ZOO_EVENTOS_ZOOTECNICOS EUC '
                                                                            +#13#10'WHERE EUM.KZOO_EVENTO_ZOOTECNICO = FEMEAS.KULTIMA_MONTA '
                                                                            +#13#10'  AND EUC.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND EUC.ABORTOPARTO IN (%d) '
                                                                            +#13#10'AND EUC.DATAABORTOPARTO = (SELECT MAX(DATAABORTOPARTO) FROM ZOO_EVENTOS_ZOOTECNICOS WHERE KZOO_ANIMAL_FEMEA = EUC.KZOO_ANIMAL_FEMEA and ABORTOPARTO IN (%d)))',[_ST_TIPO_PARTOABORTO_COLETA, _ST_TIPO_PARTOABORTO_COLETA]),              trCross,    '',        '', '' ) ) ;}

      AddTable ( 'EV_ULTIMACOLETA',TVRptTable.Create ( ttTable, 'ZOO_EVENTOS_ZOOTECNICOS',  trLeftJoin, Format('EV_ULTIMACOLETA.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND EV_ULTIMACOLETA.ABORTOPARTO IN (%d) '
                                                                                                        +#13#10'AND EV_ULTIMACOLETA.DATAABORTOPARTO = (SELECT MAX(DATAABORTOPARTO) FROM ZOO_EVENTOS_ZOOTECNICOS WHERE KZOO_ANIMAL_FEMEA = EV_ULTIMACOLETA.KZOO_ANIMAL_FEMEA and ABORTOPARTO IN (%d))',[_ST_TIPO_PARTOABORTO_COLETA, _ST_TIPO_PARTOABORTO_COLETA]),       '', '' ) ) ;
      AddTable ( 'UD_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_DIAGNOSTICOS',  trLeftJoin, 'UD_ANIMAL.KZOO_ANIMAL_DIAGNOSTICO = FEMEAS.KULTIMO_DIAGNOSTICO',        '', '' ) ) ;
      AddTable ( 'PD_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_DIAGNOSTICOS',  trLeftJoin, 'PD_ANIMAL.KZOO_ANIMAL_DIAGNOSTICO = FEMEAS.KPENULTIMO_DIAGNOSTICO',     '', '' ) ) ;
      AddTable ( 'DESC_UD',        TVRptTable.Create ( ttTable, 'ZOO_DIAGNOSTICOS',         trLeftJoin, 'DESC_UD.KZOO_DIAGNOSTICO = UD_ANIMAL.KZOO_DIAGNOSTICO',                 '', 'UD_ANIMAL' ) ) ;
      AddTable ( 'DESC_PD',        TVRptTable.Create ( ttTable, 'ZOO_DIAGNOSTICOS',         trLeftJoin, 'DESC_PD.KZOO_DIAGNOSTICO = PD_ANIMAL.KZOO_DIAGNOSTICO',                 '', 'PD_ANIMAL' ) ) ;

      AddTable ( 'UP_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_PROTOCOLOS',  trLeftJoin, 'UP_ANIMAL.KZOO_ANIMAL_PROTOCOLO = FEMEAS.KULTIMO_PROTOCOLO',    '', '' ) ) ;
      AddTable ( 'PP_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_PROTOCOLOS',  trLeftJoin, 'PP_ANIMAL.KZOO_ANIMAL_PROTOCOLO = FEMEAS.KPENULTIMO_PROTOCOLO', '', '' ) ) ;
      AddTable ( 'DESC_UP',        TVRptTable.Create ( ttTable, 'ZOO_PROTOCOLOS',         trLeftJoin, 'DESC_UP.KZOO_PROTOCOLO = UP_ANIMAL.KZOO_PROTOCOLO',                     '', 'UP_ANIMAL' ) ) ;
      AddTable ( 'DESC_PP',        TVRptTable.Create ( ttTable, 'ZOO_PROTOCOLOS',         trLeftJoin, 'DESC_PP.KZOO_PROTOCOLO = PP_ANIMAL.KZOO_PROTOCOLO',                     '', 'PP_ANIMAL' ) ) ;

      AddTable ( 'UT_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_TAREFAS',  trLeftJoin, 'UT_ANIMAL.KZOO_ANIMAL_TAREFA = FEMEAS.KULTIMA_TAREFA',     '', '' ) ) ;
      AddTable ( 'PT_ANIMAL',      TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_TAREFAS',  trLeftJoin, 'PT_ANIMAL.KZOO_ANIMAL_TAREFA = FEMEAS.KPENULTIMA_TAREFA',  '', '' ) ) ;
      AddTable ( 'DESC_UT',        TVRptTable.Create ( ttTable, 'ZOO_TAREFAS',         trLeftJoin, 'DESC_UT.KZOO_TAREFA = UT_ANIMAL.KZOO_TAREFA',              '', 'UT_ANIMAL' ) ) ;
      AddTable ( 'DESC_PT',        TVRptTable.Create ( ttTable, 'ZOO_TAREFAS',         trLeftJoin, 'DESC_PT.KZOO_TAREFA = PT_ANIMAL.KZOO_TAREFA',              '', 'PT_ANIMAL' ) ) ;

      AddTable ( 'MASTITE',        TVRptTable.Create ( ttTable, 'ZOO_ANIMAL_DIAGNOSTICOS',  trLeftJoin, 'MASTITE.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND MASTITE.EXCLUIDO = ''F'' AND (SELECT TD.TIPODIAGNOSTICO FROM ZOO_DIAGNOSTICOS TD WHERE TD.KZOO_DIAGNOSTICO = MASTITE.KZOO_DIAGNOSTICO) = 3',        '', '' ) ) ;
      AddTable ( 'PESOALTURA_REF', TVRptTable.Create ( ttTable, 'ZOO_PESOALTURA_REFERENCIA',  trLeftJoin, Format(' FEMEAS.IDADE >= PESOALTURA_REF.MIN_IDADE AND  FEMEAS.IDADE < PESOALTURA_REF.MAX_IDADE AND '
                                                         +#13#10'( ( PESOALTURA_REF.RACA_PRINCIPAL = ''%s'' AND ( SUBSTRING(FEMEAS.COMPOSICAORACA FROM 1 FOR 3) <> ''%s'' OR FEMEAS.COMPOSICAORACA IS NULL) ) OR ( PESOALTURA_REF.RACA_PRINCIPAL = ''%s'' AND SUBSTRING(FEMEAS.COMPOSICAORACA FROM 1 FOR 3) = ''%s'' ) ) ',['HPB','JER','JER','JER']),        '', '' ) ) ;

(*
SELECT
    T.KZOO_ANIMAL_TAREFA,
    T.DATASTATUS DATATAREFA,
    T.STATUS STATUSTAREFA,
    T.kzoo_animal,
    T.CODIGO || ' - ' || T.NOME TAREFA
FROM ZOO_ANIMAL_TAREFAS T
WHERE T.KZOO_ANIMAL = :KZOO_ANIMAL
  AND T.STATUS = :STATUS_EXECUTADA
ORDER BY T.DATASTATUS DESC
ROWS 1
*)
    end;

  self.InitTreeOptions ;

  for IterateMaxOrConditions := 1 to _MAX_OR_CONDITIONS do
   begin
     with TTabSheet.Create( self ) do
       begin
         PageControl :=  FiltrosPageControl ;
         Caption := format ( 'ou (%d)', [ IterateMaxOrConditions ] ) ;
       end;

     with TTabSheet.Create( self ) do
       begin
         PageControl :=  CondicoesPageControl ;
         Caption := format ( 'ou (%d)', [ IterateMaxOrConditions ] ) ;
       end;
   end;

  LoadReport ;


  if debugHook <> 0 then
    begin
       Memo1.Visible := True ;
       Memo1.Align := alBottom ;
       DBGridResultados.Align := alClient ;
    end;
  EditConditionPanel.Visible  := False ;

  FInternalFormatSettings.DateSeparator     := '.' ;
  FInternalFormatSettings.TimeSeparator     := ':' ;
  FInternalFormatSettings.ThousandSeparator := ',' ;
  FInternalFormatSettings.DecimalSeparator  := '.' ;
  FInternalFormatSettings.LongDateFormat    := 'DD.MM.YYYY' ;
  FInternalFormatSettings.TimeSeparator     := ':' ;

end;

procedure TZoo_RelatorioPersonalizado.DBGridResultadosAfterSort(
  Sender: TObject);
begin
  inherited;
  Zoo_RelatorioPersonalizadoDatamodule.SaveIndexCDS( TClientDataSet(DBGridResultados.DataSource.DataSet) );
end;

procedure TZoo_RelatorioPersonalizado.DBGridResultadosDblClick(Sender: TObject);
begin

  if ( DBGridResultados.ScreenToClient( Mouse.CursorPos ).Y <= DBGridResultados.TitleRowHeight ) then
    exit ;

  with dtsResult, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString );
end;

procedure TZoo_RelatorioPersonalizado.actAddConditionExecute(Sender: TObject);
var
  Node : PVirtualNode ;
begin
  Node := TreeViewCampos.FocusedNode ;
  if Assigned ( Node )  then
     AddCondition ( TreeViewCampos.GetNodeData ( Node ) )  ;
end;

procedure TZoo_RelatorioPersonalizado.actAddConditionUpdate(Sender: TObject);
var
  Data: PReportDiscribeRecord ;
  Node : PVirtualNode ;
begin
   Node := TreeViewCampos.FocusedNode ;
   actAddCondition.Enabled := Assigned ( Node )
      and  ( not PReportDiscribeRecord ( TreeViewCampos.GetNodeData(Node) ).IsGroup ) ;
end;

procedure TZoo_RelatorioPersonalizado.actAddGroupExecute(Sender: TObject);
begin
//***
end;

procedure TZoo_RelatorioPersonalizado.actAddGroupUpdate(Sender: TObject);
var
  Data: PReportDiscribeRecord ;
  Node : PVirtualNode ;
begin
   Node := TreeViewCampos.FocusedNode ;
   actAddGroup.Enabled := Assigned ( Node )
      and  ( PReportDiscribeRecord ( TreeViewCampos.GetNodeData(Node) ).isGroup ) ;
end;

procedure TZoo_RelatorioPersonalizado.actDeleteExecute(Sender: TObject);
begin
  DeleteReport ;
end;

procedure TZoo_RelatorioPersonalizado.actDeleteUpdate(Sender: TObject);
begin
  actDelete.Enabled := not Zoo_RelatorioPersonalizadoDatamodule.cdsRelatorioPersonalizados.isEmpty ;
end;

procedure TZoo_RelatorioPersonalizado.actDropConditionExecute(Sender: TObject);
begin
   self.DropCondition ;
end;

procedure TZoo_RelatorioPersonalizado.actMoveDownExecute(Sender: TObject);
begin
  MoveDown ;
end;

procedure TZoo_RelatorioPersonalizado.actMoveUpExecute(Sender: TObject);
begin
  MoveUp ;
end;

procedure TZoo_RelatorioPersonalizado.actRetornarDadosExecute(Sender: TObject);
begin
  AddToKeyList ;
  ModalResult := mrOk ;
end;

procedure TZoo_RelatorioPersonalizado.actSaveExecute(Sender: TObject);
begin
  SaveReport ;
end;

procedure TZoo_RelatorioPersonalizado.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := not Zoo_RelatorioPersonalizadoDataModule.cdsReportCfg.isEmpty ;
end;

procedure TZoo_RelatorioPersonalizado.AddCondition ( Data: PReportDiscribeRecord ) ;
begin
    if Data.isGroup then
       exit ;

    if not Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Locate ( 'WHEREGROUP;TABLEALIAS;COLUMN',
      VarArrayOf ( [ self.FiltrosPageControl.ActivePageIndex, Data.TableAlias, Data.Column ] ), [] ) then
      begin
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Append ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgWHEREGROUP.asInteger        :=  self.FiltrosPageControl.ActivePageIndex ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgTABLEALIAS.asString         :=  Data.TableAlias ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMN.asString         :=  Data.Column ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNTYPE.AsInteger        :=  Ord ( Data.ColumnType ) ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNDATATYPE.AsInteger    :=  Ord ( Data.ColumnDataType ) ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgOPERATOR.asInteger          :=  0  ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgCOLUMNTITLE.asString        :=  Data.Description ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgLISTVALUES.AsString         :=  Data.ListValues;
        if Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgWHEREGROUP.asInteger = 0 then
          Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgVISIBLE.asString          :=  'T'
        else
          Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgVISIBLE.asString          :=  'F' ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfgNOT.asString                :=  'F' ;
        Zoo_RelatorioPersonalizadoDatamodule.cdsReportCfg.Post ;
      end;

    ShowFloatEditor ;

end;

function TZoo_RelatorioPersonalizado.AddFieldHint( ACaption, AHint, ATableAlias: string; AColumn: string ; AColumnDataType : TVRptDataTypes ; ADescriptor : TVRptColumnType = ctField ; AListValues: string = '' ): PVirtualNode;
var
  Data: PReportDiscribeRecord;
  I: Integer;
  StrList: String;
begin
  if AColumn = '' then
     exit ;

  Result               := TreeViewCampos.AddChild( FActiveGroupNode ) ;
  Data                 := TreeViewCampos.GetNodeData( Result );    //fill record values
  Data.Description     := ACaption ;    //build child node
  Data.Hint            := AHint   ;
  Data.TableAlias      := ATableAlias  ;
  Data.Column          := AColumn  ;
  Data.ColumnDataType  := AColumnDataType  ;
  Data.ColumnType      := ADescriptor ;
  Data.ListValues      := AListValues;


  if Copy ( ACaption, 1, 31 ) <> ACaption then
     FAliasField.Add ( QuotedStr ( Copy ( ACaption, 1, 31 ) ) + '=' + QuotedStr ( ACaption ) ) ;

end;

function TZoo_RelatorioPersonalizado.AddField( ACaption, ATableAlias: string; AColumn: string ; AColumnDataType : TVRptDataTypes ; ADescriptor : TVRptColumnType = ctField ; AListValues: string = '' ): PVirtualNode;
begin
  Result := AddFieldHint( ACaption, '', ATableAlias, AColumn, AColumnDataType, ADescriptor, AListValues ) ;
end;

function TZoo_RelatorioPersonalizado.AddGroup(ACaption: string ; ANode : PVirtualNode = nil  ; AHint : string = ''  ): PVirtualNode;
var
  Data: PReportDiscribeRecord;
begin
  FActiveGroupNode := TreeViewCampos.AddChild( ANode ) ;
  Result           := FActiveGroupNode ;
  Data             := TreeViewCampos.GetNodeData( Result );    //fill record values
  Data.IsGroup     := True ;
  Data.Description := ACaption ;    //build child node
  Data.Hint        := AHint ;
  Result           := FActiveGroupNode ;
end;

procedure TZoo_RelatorioPersonalizado.AddGroupDadosGerais;
begin
  AddGroup ( 'Dados Gerais' ) ;
  AddField ( 'Brinco',              'FEMEAS', 'BRINCO',          dtString  ) ;
  AddField ( 'Nome',                'FEMEAS', 'NOMECOMPLETO',    dtString  ) ;
  AddField ( 'Nome Estabulo',       'FEMEAS', 'NOMEESTABULO',    dtString  ) ;
  //AddField ( 'Status',              'FEMEAS', 'CAST ( FEMEAS.STATUS AS VARCHAR ( 3 ) )', dtString, ctExpression  ) ;
  AddField ( 'Categoria'{'Status'},  'FEMEAS', 'CAST ( FEMEAS.STATUS AS VARCHAR ( 3 ) )', dtListValueString, ctExpression, GetSysTypesList('SIGLA_STATUS_FEMEA').SysDescriptionList  ) ;

  AddField ( 'Intenção de descarte', 'FEMEAS', 'IIF ( FEMEAS.INTENCAO_DESCARTE = ''T'', ''Sim'', ''Não'' )',  dtBoolean, ctExpression ) ;

  AddField ( 'Lote',                'FEMEAS', 'LOTE',            dtString  ) ;
  AddField ( 'Lote virtual 1',      'FEMEAS', 'VLOTE1',          dtString  ) ;
  AddField ( 'Lote virtual 2',      'FEMEAS', 'VLOTE2',          dtString  ) ;
  AddField ( 'Lote virtual 3',      'FEMEAS', 'VLOTE3',          dtString  ) ;
  AddField ( 'Retiro',              'FEMEAS', 'RETIRO',          dtString  ) ;
  AddField ( 'Data de Nascimento' , 'FEMEAS', 'NASCIMENTO',      dtDate    ) ;
// removido por augsto em 13/07/2016  AddField ( 'Idade em dias' , 'FEMEAS', '(CURRENT_DATE - CAST(NASCIMENTO AS DATE))', dtInteger, ctExpression ) ;
  AddField ( 'Origem' ,             'FEMEAS', 'LOCAL_ORIGEM',    dtString  ) ;
  AddField ( 'Data Origem' ,        'FEMEAS', 'DTORIGEM',        dtDate    ) ;
  AddField ( 'Preço de Compra' ,    'FEMEAS', 'PRECO_COMPRA',    dtFloat   ) ;
  AddField ( 'Registro',            'FEMEAS', 'REGISTRO',        dtString  ) ;
  AddField ( 'Data Descarte' ,      'DESCARTE', 'DATA',          dtDate    ) ;
  AddField ( 'Motivo Descarte' ,    'DESCARTE', '(SELECT CAST ( SYS$DESCRIPTION AS VARCHAR(50) ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''MOTIVO_DESCARTE'', DESCARTE.MOTIVO ))', dtString, ctExpression    ) ;
  AddField ( 'Nome Comprador' ,     'DESCARTE', 'NOMECOMPRADOR', dtString   ) ;
  AddField ( 'Preço Venda' ,        'DESCARTE', 'PRECOVENDA', dtFloat  ) ;
//  AddField ( 'Obs. Descarte' ,      'DESCARTE', 'SUBSTRING ( CAST(CAST(DESCARTE.OBS AS BLOB) AS VARCHAR( 1000 )) FROM 1 FOR 1000 )', dtString, ctExpression ) ;
  AddField ( 'Obs. Descarte' ,      'DESCARTE', 'CAST(SUBSTRING ( DESCARTE.OBS FROM 1 FOR 100 ) AS VARCHAR(100))', dtString, ctExpression ) ;

  AddField ( 'Transf. Embrião' ,    'FEMEAS', 'DOADOR_RECEPTOR', dtString  ) ;
//  AddField ( 'Raça' ,               'FEMEAS', 'RACA',            dtString  ) ;
  AddField ( 'Grau de Sangue' ,     'FEMEAS', 'GRAUSANGUE',      dtString  ) ;
  AddField ( 'Composição Raça' ,    'FEMEAS', 'COMPOSICAORACA',  dtString  ) ;
  AddField ( 'Nome do Pai' ,        'FEMEAS', 'NOMEPAI',         dtString  ) ;
  AddField ( 'Nome da Mãe' ,        'FEMEAS', 'NOMEMAE',         dtString  ) ;
  AddField ( 'Avó Paterna' ,        'FEMEAS', 'MAEPAI',          dtString  ) ;
  AddField ( 'Avó Materna' ,        'FEMEAS', 'MAEMAE',          dtString  ) ;
  AddField ( 'Avô Paterno' ,        'FEMEAS', 'PAIPAI',          dtString  ) ;
  AddField ( 'Avô Materno' ,        'FEMEAS', 'PAIMAE',          dtString  ) ;

  AddField ( 'Bisavô - Avô Paterno' , 'FEMEAS', 'BISM_PAIPAI',  dtString  ) ;
  AddField ( 'Bisavó - Avô Paterno' , 'FEMEAS', 'BISF_PAIPAI',  dtString  ) ;
  AddField ( 'Bisavô - Avó Paterna' , 'FEMEAS', 'BISM_MAEPAI',  dtString  ) ;
  AddField ( 'Bisavó - Avó Paterna' , 'FEMEAS', 'BISF_MAEPAI',  dtString  ) ;

  AddField ( 'Bisavô - Avô Materno' , 'FEMEAS', 'BISM_PAIMAE',  dtString  ) ;
  AddField ( 'Bisavó - Avô Materno' , 'FEMEAS', 'BISF_PAIMAE',  dtString  ) ;
  AddField ( 'Bisavô - Avó Materna' , 'FEMEAS', 'BISM_MAEMAE',  dtString  ) ;
  AddField ( 'Bisavó - Avó Materna' , 'FEMEAS', 'BISF_MAEMAE',  dtString  ) ;


  AddField ( 'Idade' ,              'FEMEAS', 'IDADE',           dtFloat   ) ;

end;

procedure TZoo_RelatorioPersonalizado.AddGroupDadosCriacao;
begin
  AddGroup ( 'Dados de Criação' ) ;
  AddField ( 'Peso ao nascer' ,           'CRESCIMENTO', 'PESO0',        dtInteger ) ;
  AddField ( 'Peso ao desmame' ,    'FEMEAS', '(SELECT IIF((PESO_POS.DATA IS NULL), PESO_ANT.PESO, IIF((PESO_ANT.DATA IS NULL), '
                                                                                                +#13#10'PESO_POS.PESO, IIF(((FEMEAS.DATADESMAME - PESO_ANT.DATA) <= (PESO_POS.DATA - FEMEAS.DATADESMAME)), '
                                                                                                                      +#13#10'PESO_ANT.PESO, PESO_POS.PESO ) ) )'
                                        +#13#10'FROM'
                                        +#13#10' (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = FEMEAS.KZOO_ANIMAL_FEMEA and CRE.DATA <= FEMEAS.DATADESMAME AND (FEMEAS.DATADESMAME - CRE.DATA <= 7)'
                                        +#13#10'  order by CRE.DATA desc rows 1 ) PESO_ANT'
                                        +#13#10'LEFT JOIN '
                                        +#13#10' (select CRE.DATA, CRE.PESO from ZOO_ANIMAL_CRESCIMENTO CRE where CRE.KZOO_ANIMAL = FEMEAS.KZOO_ANIMAL_FEMEA and CRE.DATA >= FEMEAS.DATADESMAME AND (CRE.DATA - FEMEAS.DATADESMAME <= 7)'
                                        +#13#10'  order by CRE.DATA rows 1) PESO_POS ON 1 = 1)',  dtInteger, ctExpression  ) ;
  AddField ( 'Peso 6 meses' ,             'CRESCIMENTO', 'PESO6',        dtInteger ) ;
  AddField ( 'Peso 12 meses' ,            'CRESCIMENTO', 'PESO12',       dtInteger ) ;
  AddField ( 'Peso 18 meses' ,            'CRESCIMENTO', 'PESO18',       dtInteger ) ;
  AddField ( 'Peso 24 meses' ,            'CRESCIMENTO', 'PESO24',       dtInteger ) ;
  AddField ( 'Data últ. Peso' ,           'CRESCIMENTO', 'DATAPESO',     dtDate ) ;
  AddField ( 'Peso' ,                     'CRESCIMENTO', 'PESO',  dtInteger ) ;
//  AddField ( 'Peso Padrão' ,              'CRESCIMENTO', '',             dtInteger ) ;
  AddField ( 'Ganho de Peso' ,            'CRESCIMENTO', 'GANHOPESO',    dtFloat ) ;
//  AddField ( 'Altura Padrão',             'CRESCIMENTO', '',             dtInteger ) ;
  AddField ( 'Altura ao nascer' ,         'CRESCIMENTO', 'ALTURA0',      dtInteger ) ;
  AddField ( 'Altura 6 meses',            'CRESCIMENTO', 'ALTURA6',      dtInteger ) ;
  AddField ( 'Altura 12 meses',           'CRESCIMENTO', 'ALTURA12',     dtInteger ) ;
  AddField ( 'Altura 18 meses',           'CRESCIMENTO', 'ALTURA18',     dtInteger ) ;
  AddField ( 'Altura 24 meses',           'CRESCIMENTO', 'ALTURA24',     dtInteger ) ;
  AddField ( 'Data últ. altura',          'CRESCIMENTO', 'DATAALTURA',   dtDate ) ;
  AddField ( 'Altura' ,                   'CRESCIMENTO', 'ALTURA',       dtInteger ) ;
  AddField ( 'Cond. Corp. ao nascer',     'CRESCIMENTO', 'CC0',          dtFloat   ) ;
  AddField ( 'Cond. Corp. 6 meses',       'CRESCIMENTO', 'CC6',          dtFloat   ) ;
  AddField ( 'Cond. Corp. 12 meses',      'CRESCIMENTO', 'CC12',         dtFloat   ) ;
  AddField ( 'Cond. Corp. 18 meses',      'CRESCIMENTO', 'CC18',         dtFloat   ) ;
  AddField ( 'Cond. Corp. 24 meses',      'CRESCIMENTO', 'CC24',         dtFloat   ) ;
  AddField ( 'Data Desmame' ,            'FEMEAS',      'DATADESMAME',  dtDate    ) ;
  AddField ( 'Data últ. cond. corporal',  'CRESCIMENTO', 'DATACC',       dtDate    ) ;
  AddField ( 'Últ. cond. corporal',       'CRESCIMENTO', 'CC',           dtFloat   ) ;
  AddField ( 'Peso referência' ,    'PESOALTURA_REF', 'CAST( CAST( CAST( PESOALTURA_REF.MIN_PESO AS INTEGER ) AS VARCHAR(12) ) || '' - '' || CAST( CAST( PESOALTURA_REF.MAX_PESO AS INTEGER ) AS VARCHAR(12) ) AS VARCHAR(30) )',  dtString, ctExpression  ) ;
  AddField ( 'Altura referência' ,  'PESOALTURA_REF', 'CAST( CAST( CAST( PESOALTURA_REF.MIN_ALTURA AS INTEGER ) AS VARCHAR(12) ) || '' - '' || CAST( CAST( PESOALTURA_REF.MAX_ALTURA AS INTEGER ) AS VARCHAR(12) ) AS VARCHAR(30) )',  dtString, ctExpression  ) ;
end;


procedure TZoo_RelatorioPersonalizado.AddGroupProducao;
var
  FDiasGetacaoPrimipara, FDiasGetacaoMultipara : integer ;
  FDiasSecagemPrimipara, FDiasSecagemMultipara : integer ;
begin

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, FDiasSecagemPrimipara, FDiasSecagemMultipara ) ;

  AddGroup ( 'Dados de Produção', nil, 'Apresenta os dados produtivos da última lactação no relatório' ) ;
  AddField ( 'Número da Lactação' ,                  'LACTACAO', 'NL',                dtInteger ) ;
  AddField ( 'Início da Lactação' ,                  'LACTACAO', 'DATALACTACAO',      dtDate ) ;
  AddField ( 'Dias em Lactação',                     'LACTACAO', 'DEL',               dtInteger ) ;

  (*
  AddField ( 'Dias em Lactação Parto Anterior' ,     'FEMEAS',
   '(SELECT L.DATA_SECAGEM - L.DATALACTACAO FROM ZOO_LACTACOES L'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATALACTACAO < FEMEAS.ULTIMA_LACTACAO'
  +' ORDER BY L.DATALACTACAO DESC'
  +' ROWS 1)', dtFloat, ctExpression ) ;
  *)

  AddField ( 'Pico de Produção (kg)' ,               'LACTACAO', 'PRODUCAO_PICO',     dtFloat ) ;
  AddField ( 'Pico de Produção (dias)' ,             'LACTACAO', 'DEL_PICO',          dtInteger ) ;
  AddField ( 'Produção Total' ,                      'LACTACAO', 'PLT',               dtFloat ) ;
  AddField ( 'Produção acumulada' ,                  'LACTACAO', '(SELECT SUM ( L.PLT ) FROM ZOO_LACTACOES L WHERE L.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA AND L.DATALACTACAO <= LACTACAO.DATALACTACAO)',               dtFloat, ctExpression ) ;
  AddField ( 'Produção Média' ,                      'LACTACAO', 'LACTACAO.PLT / IIF( LACTACAO.DATA_SECAGEM IS NULL, IIF( LACTACAO.DEL < 1, 1, LACTACAO.DEL ) + LACTACAO.INTERVALO_SECAGEM, IIF( LACTACAO.DEL < 1, 1, LACTACAO.DEL ) )', dtFloat, ctExpression ) ;
  AddField ( 'Produção 305 dias' ,                   'LACTACAO', 'PL305',             dtFloat ) ;
  AddField ( 'Produção 365 dias' ,                   'LACTACAO', 'PL365',             dtFloat ) ;
  AddField ( 'EQA' ,                                 'LACTACAO', 'EQA_LEITE',         dtFloat ) ;
//-- removido a pedido R.S.M. 05-12-2012
//--  AddField ( 'Equivalente Adulto' ,                  'LACTACAO', 'EQA_LEITE',         dtFloat ) ;
//--  AddField ( 'Desvio do Equivalente' ,               'LACTACAO', 'DESVIO_EQA_LEITE',  dtFloat ) ;

//  AddField ( 'Número de Pesagens' ,                  'LACTACAO', '(SELECT COUNT(*) FROM ZOO_PESAGEM_LEITE PL WHERE PL.KZOO_LACTACAO = LACTACAO.KZOO_LACTACAO)', dtInteger, ctExpression ) ;
//-- marsola/mauricio  AddField ( 'Produção Prevista' ,                   'LACTACAO', 'PRODUCAO_PREVISTA', dtFloat) ;

(*
  AddField ( 'Última aplicação BST', 'LACTACAO',
     '(SELECT BST.DATA FROM ZOO_ANIMAL_FEMEA_BST BST'
   + ' WHERE ( BST.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
   + ' AND ( BST.DATA >= LACTACAO.DATALACTACAO )'
   + ' AND ( LACTACAO.DATA_SECAGEM IS NULL OR BST.DATA <= LACTACAO.DATA_SECAGEM  )'
   + ' ORDER BY BST.DATA DESC ROWS 1)',
   dtDate, ctExpression ) ;
*)
  AddField ( 'Última aplicação BST na lactação', 'LACTACAO',
     '(SELECT BST.DATA FROM ZOO_ANIMAL_FEMEA_BST BST'
   + ' WHERE ( BST.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
   + ' AND ( BST.KZOO_LACTACAO = LACTACAO.KZOO_LACTACAO )'
   + ' AND ( BST.APLICADO = ''T'' )'
   + ' ORDER BY BST.DATA DESC ROWS 1)',
   dtDate, ctExpression ) ;

  AddField ( 'Data penúltima produção' ,             'UP',
        '(SELECT PA.DATA FROM ZOO_PESAGEM_LEITE PA'
      + ' WHERE PA.KZOO_LACTACAO = UP.KZOO_LACTACAO'
      + ' AND PA.DATA < UP.DATA AND PA.ANIMAL_DOENTE = ''F'''
      + ' ORDER BY PA.KZOO_LACTACAO, PA.DATA DESC'
      + ' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'Penúltima produção' ,                  'UP',       'ULTIMA_PESAGEM',    dtFloat ) ;
  AddField ( 'Ordenha 1' ,                           'UP',       'ORD1',    dtFloat  ) ;
  AddField ( 'Ordenha 2' ,                           'UP',       'ORD2',    dtFloat  ) ;
  AddField ( 'Ordenha 3' ,                           'UP',       'ORD3',    dtFloat  ) ;
  AddField ( 'Data última produção' ,                'UP',       'DATA',    dtDate   ) ;
  AddField ( 'Última Produção' ,                     'LACTACAO', 'PRODUCAO_UC',       dtFloat ) ;
  AddField ( 'Variação da Produção' ,                'UP',       'VARIACAO',          dtFloat ) ;
//  AddField ( 'Média de 10 Dias' ,                    'MP10',     'MEDIA10',           dtFloat ) ;

  AddField ( 'Média de 10 Dias' ,                    'LACTACAO',     '(SELECT AVG ( PL.TOTAL ) FROM ZOO_PESAGEM_LEITE PL WHERE PL.KZOO_LACTACAO = LACTACAO.KZOO_LACTACAO AND PL.DATA BETWEEN LACTACAO.ULTIMA_PESAGEMLEITE - 10 AND LACTACAO.ULTIMA_PESAGEMLEITE AND PL.ANIMAL_DOENTE = ''F'')', dtFloat, ctExpression ) ;


  AddField ( 'Data da Secagem' ,                     'SECAGEM', 'DATA_SECAGEM',      dtDate ) ;

  AddField ( 'Condição Corporal ao Secar' ,          'SECAGEM',
         '(SELECT CC FROM ZOO_LACTACOES L'
  +' LEFT JOIN ZOO_ANIMAL_FEMEA_CC CC ON CC.KZOO_ANIMAL_FEMEA_CC = L.KZOO_ANIMAL_FEMEA'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATA_SECAGEM IS NOT NULL AND ( CC.DATA >= L.DATA_SECAGEM - 21 or CC.DATA <= L.DATA_SECAGEM - 21)'
  +' ORDER BY L.DATA_SECAGEM DESC'
  +' ROWS 1)', dtFloat, ctExpression ) ;


  AddField ( 'Previsão de Secagem' ,                 'EV_ULTIMAMONTA',
   format (
    'CAST ( IIF ( EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO AND EV_ULTIMAMONTA.PRENHEZ = ''T'' AND EV_ULTIMAMONTA.ABORTOPARTO IS NULL,'
  + '( FEMEAS.ULTIMA_MONTA + IIF ( FEMEAS.NUMERO_LACTACAO > 0, %d, %d ) - IIF ( FEMEAS.NUMERO_LACTACAO > 0, %d, %d ) ),'
  + 'NULL ) AS DATE )',
  [ FDiasGetacaoMultipara, FDiasGetacaoPrimipara, FDiasSecagemPrimipara, FDiasSecagemMultipara ] ),
  dtDate, ctExpression ) ;

  AddField ( 'Observação' ,                'UP',      'CAST ( OBSERVACAO AS VARCHAR ( 80 ) )',    dtString, ctExpression ) ;
(* removido a pedido R.S.M. 05-12-2012
  AddField ( 'Equiv. Adulto 1a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 1 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 2a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 2 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 3a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 3 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 4a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 4 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 5a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 5 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 6a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 6 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 7a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 7 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 8a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 8 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 9a. Lactação' ,        'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 9 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Equiv. Adulto 10a. Lactação' ,       'FEMEAS', '(SELECT L.EQA_LEITE FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA) AND ( L.NL = 10 ) ROWS 1)', dtFloat, ctExpression ) ;
  AddField ( 'Maior Eqa' ,                           'FEMEAS', '(SELECT MAX (L.EQA_LEITE ) FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KZOO_ANIMAL_FEMEA))', dtFloat, ctExpression ) ;
  AddField ( 'Maior Eqa da Mãe' ,                    'FEMEAS', '(SELECT MAX (L.EQA_LEITE ) FROM ZOO_LACTACOES L WHERE (L.KZOO_ANIMAL_FEMEA  = FEMEAS.KMAE))', dtFloat, ctExpression ) ;
*)
// renomeado para gordura media, R.S.M. em 05/12/2012 :
//  AddField ( 'Total de Gordura' ,                    'LACTACAO', 'PGT / DEL', dtFloat, ctExpression ) ;
  AddField ( 'Total de Gordura' ,                    'LACTACAO', 'PGT', dtFloat, ctField ) ;
  AddField ( 'Gordura Média' ,                       'LACTACAO', 'LACTACAO.PGT / NULLIF ( LACTACAO.PLT, 0 ) * 100', dtFloat, ctExpression ) ;
//-jm 22.02.2016    AddField ( 'Gordura Média' ,                       'LACTACAO', 'LACTACAO.PGT / IIF( LACTACAO.DATA_SECAGEM IS NULL, IIF( LACTACAO.DEL < 1, 1, LACTACAO.DEL ) + LACTACAO.INTERVALO_SECAGEM, IIF( LACTACAO.DEL < 1, 1, LACTACAO.DEL ) )', dtFloat, ctExpression ) ;
//-jm 22.02.2016  AddField ( 'Gordura 305 dias' ,                    'LACTACAO', 'PG305', dtFloat ) ;
//-jm 22.02.2016  AddField ( 'Gordura 365 dias' ,                    'LACTACAO', 'PG365', dtFloat ) ;
// removido a pedido R.S.M.  05/12/2012
//  AddField ( 'Equiv. Adulto da Gordura' ,            'LACTACAO', 'EQA_GORDURA', dtFloat ) ;

// renomeado para gordura media, R.S.M. em 05/12/2012 :
//  AddField ( 'Total de Proteína' ,                   'LACTACAO', 'PPT / DEL', dtFloat ) ;
  AddField ( 'Total de Proteína' ,                   'LACTACAO', 'PPT', dtFloat, ctField ) ;
  AddField ( 'Proteína Média' ,                      'LACTACAO', 'LACTACAO.PPT / NULLIF( LACTACAO.PLT, 0 ) * 100', dtFloat, ctExpression ) ;
//-jm  AddField ( 'Proteína Média' ,                      'LACTACAO', 'LACTACAO.PPT / IIF( LACTACAO.DATA_SECAGEM IS NULL, IIF( LACTACAO.DEL < 1, 1, DEL ) + LACTACAO.INTERVALO_SECAGEM, IIF( LACTACAO.DEL < 1, 1, LACTACAO.DEL ) )', dtFloat, ctExpression ) ;
//-jm 22.02.2016  AddField ( 'Proteína 305 dias' ,                   'LACTACAO', 'PP305', dtFloat ) ;
//-jm 22.02.2016  AddField ( 'Proteína 365 dias' ,                   'LACTACAO', 'PP365', dtFloat ) ;
// removido a pedido R.S.M.  05/12/2012
//  AddField ( 'Equiv. Adulto da Proteína' ,           'LACTACAO', 'EQA_PROTEINA', dtFloat ) ;
 { AddField ( 'Data da análise' ,                     'ANALISE',  'DATA',           dtDate ) ;
  AddField ( '% de Gordura' ,                        'ANALISE',  'GORDURA',        dtFloat ) ;
  AddField ( '% de Proteína' ,                       'ANALISE',  'PROTEINA',       dtFloat ) ;
  AddField ( '% de Lactose' ,                        'ANALISE',  'LACTOSE',        dtFloat ) ;
  AddField ( '% de Sólidos Totais' ,                 'ANALISE',  'SOLIDOS_TOTAIS', dtFloat ) ;
  AddField ( 'Contagem de Células Somáticas' ,       'ANALISE',  'CCS',            dtInteger ) ;
  AddField ( 'Uréia' ,                               'ANALISE',  'UREIA',          dtFloat ) ;
  AddField ( 'ESD' ,                                 'ANALISE',  'ESD',            dtFloat ) ;
  }
  AddField ( 'Data da últ. análise' ,                'ULTIMA_ANALISE', 'DATA',     dtDate ) ;
  AddField ( 'Últ. CCS',                             'ULTIMA_ANALISE', 'CCS',      dtInteger ) ;
  AddField ( 'Últ. Gordura',                         'ULTIMA_ANALISE', 'GORDURA',  dtFloat   ) ;
  AddField ( 'Últ. Proteína',                        'ULTIMA_ANALISE', 'PROTEINA', dtFloat   ) ;
  AddField ( 'Últ. Lactose',                         'ULTIMA_ANALISE', 'LACTOSE',  dtFloat   ) ;
  AddField ( 'Últ. Sólidos Totais',                  'ULTIMA_ANALISE', 'SOLIDOS_TOTAIS',  dtFloat   ) ;
  AddField ( 'Últ. ESD',                             'ULTIMA_ANALISE', 'ESD',      dtFloat   ) ;
  AddField ( 'Últ. NU',                              'ULTIMA_ANALISE', 'UREIA',    dtFloat   ) ;
  AddField ( 'Obs. últ. análise' ,                   'ULTIMA_ANALISE', 'CAST(SUBSTRING ( ULTIMA_ANALISE.OBS FROM 1 FOR 100 ) AS VARCHAR(100))', dtString, ctExpression ) ;

(*  // removido por augsto em 13/07/2016

  AddField ( 'Último CMT na lactação', 'LACTACAO',
    '(SELECT'
  +#13#10' CMT.DATA'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= LACTACAO.DATALACTACAO)'
  +#13#10'   AND (LACTACAO.DATA_SECAGEM IS NULL OR CMT.DATA <= LACTACAO.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'Último CMT/AD na lactação', 'LACTACAO',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.AD )) AS VARCHAR(8)) "AD"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= LACTACAO.DATALACTACAO)'
  +#13#10'   AND (LACTACAO.DATA_SECAGEM IS NULL OR CMT.DATA <= LACTACAO.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Último CMT/AE na lactação', 'LACTACAO',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.AE )) AS VARCHAR(8)) "AE"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= LACTACAO.DATALACTACAO)'
  +#13#10'   AND (LACTACAO.DATA_SECAGEM IS NULL OR CMT.DATA <= LACTACAO.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Último CMT/PD na lactação', 'LACTACAO',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.PD )) AS VARCHAR(8)) "PD"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= LACTACAO.DATALACTACAO)'
  +#13#10'   AND (LACTACAO.DATA_SECAGEM IS NULL OR CMT.DATA <= LACTACAO.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Último CMT/PE na lactação', 'LACTACAO',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.PE )) AS VARCHAR(8)) "PE"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = LACTACAO.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= LACTACAO.DATALACTACAO)'
  +#13#10'   AND (LACTACAO.DATA_SECAGEM IS NULL OR CMT.DATA <= LACTACAO.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;
*)

//  AddField ( 'Persistência' ,                        'ANALISE',  '',               dtFloat ) ;
//  AddField ( 'Potencial' ,                           'ANALISE',  '',               dtFloat ) ;

end;

{9B6525BB-0708-47AA-9C84-D0AC37A38AC7}
procedure TZoo_RelatorioPersonalizado.AddGroupProducaoAcumulada;
var
  FDiasGetacaoPrimipara, FDiasGetacaoMultipara : integer ;
  FDiasSecagemPrimipara, FDiasSecagemMultipara : integer ;
  LActiveGroupNode : PVirtualNode ;
begin

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, FDiasSecagemPrimipara, FDiasSecagemMultipara ) ;

  LActiveGroupNode := FActiveGroupNode ;

  AddGroup ( 'Produção por NL', LActiveGroupNode, 'Apresenta os dados produtivos de cada lactação no mesmo relatório'  ) ;
  AddField ( 'nl-Número da Lactação' ,                  'PROD_ACUMULADA', 'NL',                dtInteger ) ;
  AddField ( 'nl-Início da Lactação' ,                  'PROD_ACUMULADA', 'DATALACTACAO',      dtDate ) ;
  AddField ( 'nl-Dias em Lactação',                     'PROD_ACUMULADA', 'DEL',               dtInteger ) ;
  AddField ( 'nl-Pico de Produção (kg)' ,               'PROD_ACUMULADA', 'PRODUCAO_PICO',     dtFloat ) ;
  AddField ( 'nl-Pico de Produção (dias)' ,             'PROD_ACUMULADA', 'DEL_PICO',          dtInteger ) ;
  AddField ( 'nl-Produção Total' ,                      'PROD_ACUMULADA', 'PLT',               dtFloat ) ;
  AddField ( 'nl-Total de Gordura' ,                    'PROD_ACUMULADA', 'PGT', dtFloat, ctField ) ;
  AddField ( 'nl-Total de Proteína' ,                   'PROD_ACUMULADA', 'PPT', dtFloat, ctField ) ;
  AddField ( 'nl-Produção acumulada' ,                  'PROD_ACUMULADA', '(SELECT SUM ( L.PLT ) FROM ZOO_LACTACOES L WHERE L.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA AND L.DATALACTACAO <= PROD_ACUMULADA.DATALACTACAO)',               dtFloat, ctExpression ) ;
  AddField ( 'nl-Produção Média' ,                      'PROD_ACUMULADA', 'PROD_ACUMULADA.PLT / IIF( PROD_ACUMULADA.DATA_SECAGEM IS NULL, IIF( PROD_ACUMULADA.DEL < 1, 1, PROD_ACUMULADA.DEL ) + PROD_ACUMULADA.INTERVALO_SECAGEM, IIF( PROD_ACUMULADA.DEL < 1, 1, PROD_ACUMULADA.DEL ) )', dtFloat, ctExpression ) ;
  AddField ( 'nl-Produção 305 dias' ,                   'PROD_ACUMULADA', 'PL305',             dtFloat ) ;
  AddField ( 'nl-Produção 365 dias' ,                   'PROD_ACUMULADA', 'PL365',             dtFloat ) ;
  AddField ( 'nl-EQA' ,                                 'PROD_ACUMULADA', 'EQA_LEITE',         dtFloat ) ;

  AddField ( 'nl-Última aplicação BST', 'PROD_ACUMULADA',
     '(SELECT BST.DATA FROM ZOO_ANIMAL_FEMEA_BST BST'
   + ' WHERE ( BST.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
   + ' AND ( BST.KZOO_LACTACAO = PROD_ACUMULADA.KZOO_LACTACAO )'
   + ' AND ( BST.APLICADO = ''T'' )'
   + ' ORDER BY BST.DATA DESC ROWS 1)',
   dtDate, ctExpression ) ;

  AddField ( 'nl-Data penúltima produção' ,             'PA_UP',
        '(SELECT PA.DATA FROM ZOO_PESAGEM_LEITE PA'
      + ' WHERE PA.KZOO_LACTACAO = PA_UP.KZOO_LACTACAO'
      + ' AND PA.DATA < PA_UP.DATA AND PA.ANIMAL_DOENTE = ''F'''
      + ' ORDER BY PA.KZOO_LACTACAO, PA.DATA DESC'
      + ' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'nl-Penúltima produção' ,                  'PA_UP',       'ULTIMA_PESAGEM',    dtFloat ) ;
  AddField ( 'nl-Ordenha 1' ,                           'PA_UP',       'ORD1',    dtFloat ) ;
  AddField ( 'nl-Ordenha 2' ,                           'PA_UP',       'ORD2',    dtFloat ) ;
  AddField ( 'nl-Ordenha 3' ,                           'PA_UP',       'ORD3',    dtFloat ) ;
  AddField ( 'nl-Data última produção' ,                'PA_UP',       'DATA',    dtDate ) ;
  AddField ( 'nl-Última Produção' ,                     'PROD_ACUMULADA', 'PRODUCAO_UC',       dtFloat ) ;
  AddField ( 'nl-Variação da Produção' ,                'PA_UP',       'VARIACAO',          dtFloat ) ;
  AddField ( 'nl-Média de 10 Dias' ,                    'PROD_ACUMULADA',     '(SELECT AVG ( PL.TOTAL ) FROM ZOO_PESAGEM_LEITE PL WHERE PL.KZOO_LACTACAO = PROD_ACUMULADA.KZOO_LACTACAO AND PL.DATA BETWEEN PROD_ACUMULADA.ULTIMA_PESAGEMLEITE - 10 AND PROD_ACUMULADA.ULTIMA_PESAGEMLEITE AND PL.ANIMAL_DOENTE = ''F'')', dtFloat, ctExpression ) ;
  AddField ( 'nl-Data da Secagem' ,                     'PROD_ACUMULADA', 'DATA_SECAGEM',      dtDate ) ;
  AddField ( 'nl-Gordura Média' ,                       'PROD_ACUMULADA', 'PROD_ACUMULADA.PGT / NULLIF ( PROD_ACUMULADA.PLT, 0 )', dtFloat, ctExpression ) ;
//  AddField ( 'nl-Gordura 305 dias' ,                    'PROD_ACUMULADA', 'PG305', dtFloat ) ;
//  AddField ( 'nl-Gordura 365 dias' ,                    'PROD_ACUMULADA', 'PG365', dtFloat ) ;
//  AddField ( 'nl-Proteína Média' ,                      'PROD_ACUMULADA', 'PROD_ACUMULADA.PPT / IIF( PROD_ACUMULADA.DATA_SECAGEM IS NULL, IIF( PROD_ACUMULADA.DEL < 1, 1, DEL ) + PROD_ACUMULADA.INTERVALO_SECAGEM, IIF( PROD_ACUMULADA.DEL < 1, 1, PROD_ACUMULADA.DEL ) )', dtFloat, ctExpression ) ;
  AddField ( 'nl-Proteína Média' ,                      'PROD_ACUMULADA', 'PROD_ACUMULADA.PPT / NULLIF ( PROD_ACUMULADA.PLT, 0 )', dtFloat, ctExpression ) ;
//  AddField ( 'nl-Proteína 305 dias' ,                   'PROD_ACUMULADA', 'PP305', dtFloat ) ;
//  AddField ( 'nl-Proteína 365 dias' ,                   'PROD_ACUMULADA', 'PP365', dtFloat ) ;

(*  // removido por augsto em 13/07/2016

  AddField ( 'nl-Último CMT na lactação', 'PROD_ACUMULADA',
    '(SELECT'
  +#13#10' CMT.DATA'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= PROD_ACUMULADA.DATALACTACAO)'
  +#13#10'   AND (PROD_ACUMULADA.DATA_SECAGEM IS NULL OR CMT.DATA <= PROD_ACUMULADA.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'nl-Último CMT/AD na lactação', 'PROD_ACUMULADA',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.AD )) AS VARCHAR(8)) "AD"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= PROD_ACUMULADA.DATALACTACAO)'
  +#13#10'   AND (PROD_ACUMULADA.DATA_SECAGEM IS NULL OR CMT.DATA <= PROD_ACUMULADA.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;


  AddField ( 'nl-Último CMT/AE na lactação', 'PROD_ACUMULADA',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.AE )) AS VARCHAR(8)) "AE"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= PROD_ACUMULADA.DATALACTACAO)'
  +#13#10'   AND (PROD_ACUMULADA.DATA_SECAGEM IS NULL OR CMT.DATA <= PROD_ACUMULADA.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'nl-Último CMT/PD na lactação', 'PROD_ACUMULADA',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.PD )) AS VARCHAR(8)) "PD"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= PROD_ACUMULADA.DATALACTACAO)'
  +#13#10'   AND (PROD_ACUMULADA.DATA_SECAGEM IS NULL OR CMT.DATA <= PROD_ACUMULADA.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'nl-Último CMT/PE na lactação', 'PROD_ACUMULADA',
         '(SELECT'
  +#13#10' CAST( (SELECT SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_CMT'', CMT.PE )) AS VARCHAR(8)) "PE"'
  +#13#10'FROM ZOO_ANIMAL_FEMEA_CMT CMT'
  +#13#10'WHERE ( CMT.KZOO_ANIMAL_FEMEA = PROD_ACUMULADA.KZOO_ANIMAL_FEMEA )'
  +#13#10'   AND (CMT.DATA >= PROD_ACUMULADA.DATALACTACAO)'
  +#13#10'   AND (PROD_ACUMULADA.DATA_SECAGEM IS NULL OR CMT.DATA <= PROD_ACUMULADA.DATA_SECAGEM)'
  +#13#10'ORDER BY CMT.DATA DESC'
  +#13#10'ROWS 1)', dtString, ctExpression ) ;
*)
  SetActiveGroupNode ( LActiveGroupNode ) ;
end;


procedure TZoo_RelatorioPersonalizado.AddGroupReproducao;
var
  FDiasGetacaoPrimipara, FDiasGetacaoMultipara : integer ;
begin

   TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO, FDiasGetacaoPrimipara, FDiasGetacaoMultipara ) ;


  AddGroup ( 'Dados de Reprodução' ) ;
//  AddField ( 'Data do Parto' ,                       'FEMEAS', 'ULTIMO_PARTO', dtDate   ) ;
  AddField ( 'Data do Parto' ,                       'FEMEAS', 'ULTIMA_LACTACAO', dtDate   ) ;
  AddField ( 'Condição Corporal ao Parto' ,          'FEMEAS',
         '(SELECT CC.CC FROM ZOO_ANIMAL_FEMEA_CC CC'
  +' WHERE CC.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND ( CC.DATA >= FEMEAS.ULTIMA_LACTACAO - 21 AND CC.DATA <= FEMEAS.ULTIMA_LACTACAO  + 21)'
  +' ORDER BY CC.DATA DESC'
  +' ROWS 1)', dtFloat, ctExpression ) ;


 // AddField ( 'Dias em Gestação do Parto Anterior' ,     'FEMEAS',

  AddField ( 'Dias em Gestação do Parto Anterior' ,     'FEMEAS',
   '(SELECT E.DATAABORTOPARTO - E.DATAEVENTO FROM ZOO_LACTACOES L'
  +' LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS E ON E.KZOO_EVENTO_ZOOTECNICO = L.KZOO_EVENTO_ZOOTECNICO'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATALACTACAO < FEMEAS.ULTIMA_LACTACAO'
  +' ORDER BY L.DATALACTACAO DESC'
  +' ROWS 1)', dtInteger, ctExpression ) ;


  AddField ( 'Intervalo Entre Partos Atual' ,        'LACTACAO', 'IEP_MESES', dtInteger ) ;

  AddField ( 'Intervalo Entre Partos Projetado' ,    'EV_ULTIMAMONTA',
    Format (
     'CAST( CAST ( IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND EV_ULTIMAMONTA.DATAABORTOPARTO IS NULL,'
    +'( FEMEAS.ULTIMA_MONTA + IIF ( FEMEAS.NUMERO_LACTACAO > 0, %d, %d ) ) - FEMEAS.ULTIMA_LACTACAO,'
    +'CAST ( NULL AS INTEGER ) ) / 30.4 AS NUMERIC ( 5, 1 ) ) AS SYS$FLOAT )',
    [ FDiasGetacaoMultipara, FDiasGetacaoPrimipara ] ),
    dtFloat, ctExpression ) ;

  AddField ( 'Dias Pós Parto' ,                      'FEMEAS', 'DPP', dtInteger ) ;
//  AddField ( 'Número de Cios' ,                      'FEMEAS', 'NUMERO_CIO', dtInteger ) ;
  AddField ( 'Número de Cios' ,                      'FEMEAS', '(SELECT COUNT(*) FROM ZOO_EVENTOS_ZOOTECNICOS EV1 WHERE EV1.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND ((FEMEAS.ULTIMA_LACTACAO IS NULL) OR (EV1.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO)))', dtInteger, ctExpression ) ;

  AddField ( 'Dias do Parto ao 1o. Cio' ,            'FEMEAS', 'DPPC', dtInteger ) ;

  AddField ( 'Data do Último Cio' ,                  'FEMEAS', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR FEMEAS.ULTIMO_EVENTO_ZOOTECNICO > FEMEAS.ULTIMA_LACTACAO, FEMEAS.ULTIMO_EVENTO_ZOOTECNICO, CAST ( NULL AS TIMESTAMP ))', dtDate, ctExpression ) ;
  AddField ( 'Dias do Último Cio' ,                  'FEMEAS', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR FEMEAS.ULTIMO_EVENTO_ZOOTECNICO > FEMEAS.ULTIMA_LACTACAO, CURRENT_DATE - CAST ( FEMEAS.ULTIMO_EVENTO_ZOOTECNICO AS DATE), CAST ( NULL AS INTEGER ))', dtInteger, ctExpression )  ;


 { AddField ( 'Previsão de Cio' ,                     'EV_ULTIMAMONTA',
               'IIF( ( FEMEAS.ULTIMO_CIO > FEMEAS.ULTIMA_MONTA ) OR ( EV_ULTIMAMONTA.PRENHEZ IS DISTINCT FROM ''T'' ) OR ( EV_ULTIMAMONTA.ABORTOPARTO IS NULL ),'
        +' CAST ( FEMEAS.ULTIMO_CIO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( FEMEAS.ULTIMO_CIO AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
        +' CAST ( NULL AS DATE ))', dtDate, ctExpression ) ;}

 { AddField ( 'Previsão de Cio' ,                     'EV_ULTIMAMONTA',
               'IIF( (( FEMEAS.ULTIMO_CIO > FEMEAS.ULTIMA_MONTA ) OR ( EV_ULTIMAMONTA.PRENHEZ IS DISTINCT FROM ''T'' ) OR ( EV_ULTIMAMONTA.ABORTOPARTO IS NULL )) '
               +'AND (FEMEAS.STATUS_REPRODUTIVO NOT IN (''Abortada'', ''Coletada'', ''Doadora Coletada'', ''Em crescimento'', ''Não inseminar'', ''PEV'', ''Prenhe'', ''Receptora abortada'', ''Receptora prenhe'')) ,'
        +' CAST ( FEMEAS.ULTIMO_CIO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( FEMEAS.ULTIMO_CIO AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
        +' CAST ( NULL AS DATE ))', dtDate, ctExpression ) ;}
        //EV_ULTIMACOLETA
  { AddField ( 'Previsão de Cio' ,                     'EV_ULTIMAMONTA',
              Format(
               'IIF( FEMEAS.STATUS_REPRODUTIVO NOT IN (%d, %d, %d, %d, %d, %d, %d, %d, %d)  ,'
                 +' IIF((EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMO_CIO OR FEMEAS.ULTIMO_CIO IS NULL) AND( EV_ULTIMAMONTA.DATAEVENTO > EV_ULTIMACOLETA.DATAEVENTO OR EV_ULTIMACOLETA.DATAEVENTO IS NULL ) ,'
                 +' CAST ( EV_ULTIMAMONTA.DATAEVENTO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( EV_ULTIMAMONTA.DATAEVENTO AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
                 +' IIF((EV_ULTIMACOLETA.DATAEVENTO > FEMEAS.ULTIMO_CIO OR FEMEAS.ULTIMO_CIO IS NULL),'
                    +' CAST ( EV_ULTIMACOLETA.DATAEVENTO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( EV_ULTIMACOLETA.DATAEVENTO AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
                    +' CAST ( FEMEAS.ULTIMO_CIO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( FEMEAS.ULTIMO_CIO AS DATE ))/21 AS INTEGER )-1),0)*21+21))),'
        +' CAST ( NULL AS DATE )'
        +')',
              [_ST_STATUS_REPRODUTIVO_ABORTADA, _ST_STATUS_REPRODUTIVO_COLETADA, _ST_STATUS_REPRODUTIVO_DOADORACOLETADA, _ST_STATUS_REPRODUTIVO_EMCRESCIMENTO, _ST_STATUS_REPRODUTIVO_RECEPTORAABORTADA,
               _ST_STATUS_REPRODUTIVO_NAOINSEMINAR, _ST_STATUS_REPRODUTIVO_PEV, _ST_STATUS_REPRODUTIVO_PRENHE, _ST_STATUS_REPRODUTIVO_RECEPTORAPRENHE]),
                dtDate, ctExpression ) ;}

  AddField ( 'Previsão de Cio' ,                     'EV_ULTIMACOLETA',
              Format(
               'IIF( FEMEAS.STATUS_REPRODUTIVO NOT IN (%d, %d, %d, %d, %d, %d, %d, %d, %d)  ,'
                 +' IIF((FEMEAS.ULTIMA_MONTA > FEMEAS.ULTIMO_CIO OR FEMEAS.ULTIMO_CIO IS NULL) AND( FEMEAS.ULTIMA_MONTA > EV_ULTIMACOLETA.DATAEVENTO OR EV_ULTIMACOLETA.DATAEVENTO IS NULL ) ,'
                 +' CAST ( FEMEAS.ULTIMA_MONTA AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( FEMEAS.ULTIMA_MONTA AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
                 +' IIF((EV_ULTIMACOLETA.DATAEVENTO > FEMEAS.ULTIMO_CIO OR FEMEAS.ULTIMO_CIO IS NULL),'
                    +' CAST ( EV_ULTIMACOLETA.DATAEVENTO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( EV_ULTIMACOLETA.DATAEVENTO AS DATE ))/21 AS INTEGER )-1),0)*21+21),'
                    +' CAST ( FEMEAS.ULTIMO_CIO AS DATE )+(MAXVALUE( (CAST(((CURRENT_DATE+21-1)-CAST ( FEMEAS.ULTIMO_CIO AS DATE ))/21 AS INTEGER )-1),0)*21+21))),'
        +' CAST ( NULL AS DATE )'
        +')',
              [_ST_STATUS_REPRODUTIVO_ABORTADA,
               _ST_STATUS_REPRODUTIVO_COLETADA,
               _ST_STATUS_REPRODUTIVO_DOADORA_COLETADA,
               _ST_STATUS_REPRODUTIVO_EMCRESCIMENTO,
               _ST_STATUS_REPRODUTIVO_RECEPTORA_ABORTADA,
               _ST_STATUS_REPRODUTIVO_NAO_INSEMINAR,
               _ST_STATUS_REPRODUTIVO_PEV,
               _ST_STATUS_REPRODUTIVO_PRENHE,
               _ST_STATUS_REPRODUTIVO_RECEPTORA_PRENHE
              ]),
                dtDate, ctExpression ) ;


 // AddField ( 'Previsão de Cio' ,                      'FEMEAS', 'PREVISAOCIO', dtDate ) ;
//  AddField ( 'Número de Coberturas' ,                'FEMEAS', 'NUMERO_MONTA', dtInteger ) ;
  AddField ( 'Número de Coberturas' ,                'FEMEAS', '(SELECT COUNT(*) FROM ZOO_EVENTOS_ZOOTECNICOS EV1 WHERE EV1.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND EV1.TIPOEVENTO > 1 AND ((FEMEAS.ULTIMA_LACTACAO IS NULL) OR (EV1.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO)))', dtInteger, ctExpression ) ;
  AddField ( 'Dias do Parto à 1a. Cobertura' ,       'FEMEAS', '(SELECT EV1.DATAEVENTO FROM ZOO_EVENTOS_ZOOTECNICOS EV1 WHERE EV1.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND EV1.TIPOEVENTO > 1 AND EV1.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO ORDER BY EV1.DATAEVENTO ROWS 1) - FEMEAS.ULTIMA_LACTACAO', dtInteger, ctExpression ) ;

  //AddField ( 'Data da Última Cobertura' ,            'EV_ULTIMAMONTA', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO  > FEMEAS.ULTIMA_LACTACAO, EV_ULTIMAMONTA.DATAEVENTO, CAST ( NULL AS TIMESTAMP ) )', dtDate, ctExpression ) ;
  //AddField ( 'Dias da Última Cobertura' ,            'EV_ULTIMAMONTA', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO  > FEMEAS.ULTIMA_LACTACAO, CAST ( CURRENT_DATE - CAST ( DATAEVENTO AS DATE ) AS INTEGER ), CAST ( NULL AS INTEGER ) )', dtInteger, ctExpression ) ;
  AddField ( 'Data da Última Cobertura' ,            'EV_ULTIMAMONTA', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO  > FEMEAS.ULTIMA_LACTACAO, EV_ULTIMAMONTA.DATAEVENTO, CAST ( NULL AS TIMESTAMP ) )', dtDate, ctExpression ) ;
  AddField ( 'Dias da Última Cobertura' ,            'EV_ULTIMAMONTA', 'IIF ( FEMEAS.ULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO  > FEMEAS.ULTIMA_LACTACAO, CAST ( CURRENT_DATE - CAST ( EV_ULTIMAMONTA.DATAEVENTO AS DATE ) AS INTEGER ), CAST ( NULL AS INTEGER ) )', dtInteger, ctExpression ) ;
  AddField ( 'Idade do feto (dias)' ,                'EV_ULTIMAMONTA', Format('IIF ( (FEMEAS.ULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO  > FEMEAS.ULTIMA_LACTACAO) , '+
                                                                              #13#10'CAST ( COALESCE ( CAST ( EV_ULTIMAMONTA.DATAABORTOPARTO AS DATE ), CURRENT_DATE ) - CAST ( IIF(EV_ULTIMAMONTA.TIPOEVENTO =  %d, (EV_ULTIMAMONTA.DATAEVENTO-7), (EV_ULTIMAMONTA.DATAEVENTO)) AS DATE ) AS INTEGER ), CAST ( NULL AS INTEGER ) )',[_ST_TIPO_EVENTO_ZOO_IMPLANTE]), dtInteger, ctExpression ) ;
  AddField ( 'Tipo de Cobertura' ,                   'EV_ULTIMAMONTA', '(SELECT CAST ( SYS$DESCRIPTION AS VARCHAR(50) ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_EVENTO_ZOO'', EV_ULTIMAMONTA.TIPOEVENTO ))', dtListValueString, ctExpression ,'Inseminação;Monta;Embrião' {Passar os valores separados em ponto e vírgula}  ) ;
  AddField ( 'Resultado do evento reprodutivo' ,     'EV_ULTIMAMONTA', '(SELECT CAST ( SYS$DESCRIPTION AS VARCHAR(50) ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_PARTOABORTO'', EV_ULTIMAMONTA.ABORTOPARTO ))', dtListValueString, ctExpression ,'Aborto;Aborto/Lactação;Parto;Coleta de Embrião' {Passar os valores separados em ponto e vírgula}  ) ;

  AddField ( 'Último Cio > Última Cobertura' ,       'FEMEAS', 'IIF ( ULTIMO_CIO > ULTIMA_MONTA, ''Sim'', ''Não'' )', dtBoolean, ctExpression ) ;
  AddField ( 'Inseminador' ,                         'EV_ULTIMAMONTA', 'NOMEFUNCIONARIO', dtString ) ;
//  AddField ( 'Touro da Última Cobertura' ,           'EV_ULTIMAMONTA', '( SELECT AM.BRINCO || '' - '' || AM.NOMECOMPLETO FROM ZOO_ANIMAIS AM WHERE AM.KZOO_ANIMAL = EV_ULTIMAMONTA.KZOO_ANIMAL_MACHO )', dtString, ctExpression ) ;
  AddField ( 'Touro da Última Cobertura' ,           'EV_ULTIMAMONTA', '( SELECT AM.NOMECOMPLETO FROM ZOO_ANIMAIS AM WHERE AM.KZOO_ANIMAL = EV_ULTIMAMONTA.KZOO_ANIMAL_MACHO )', dtString, ctExpression ) ;
  AddField ( 'Prenhez' ,                             'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.PRENHEZ IS NULL OR EV_ULTIMAMONTA.DATAABORTOPARTO IS NOT NULL, NULL , IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'', ''Sim'', ''Não'' ) )',  dtBoolean, ctExpression ) ;
  AddField ( 'Número de toques'          ,           'EV_ULTIMAMONTA', 'QTDE_DIAGNOSTICO', dtInteger)  ;
  //AddField ( 'Último diagnóstico de gestação' ,      'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.PRENHEZ IS NULL OR EV_ULTIMAMONTA.DATAABORTOPARTO IS NOT NULL, NULL ,'
  //                                                    +#13#10' IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'', ''Prenhe ('' || CAST(EV_ULTIMAMONTA.QTDE_DIAGNOSTICO VARCHAR(3) ) ||'')'', ''Não Prenhe ('' || CAST(EV_ULTIMAMONTA.QTDE_DIAGNOSTICO VARCHAR(3) ) ||'')'' ) )',  dtBoolean, ctExpression ) ;
  AddField ( 'Gestação gemelar' , 'EV_ULTIMAMONTA', '(SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) ) FROM SYS$TYPES_GETDESCRIPTION( ''STATUS_GEMELAR'', EV_ULTIMAMONTA.GEMELAR ))', dtListValueString, ctExpression, GetSysTypesList('STATUS_GEMELAR',1).SysDescriptionList    ) ;
  AddField ( 'Sexo da Cria', 'EV_ULTIMAMONTA', '(SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) ) FROM SYS$TYPES_GETDESCRIPTION( ''SEXO_CRIA'', EV_ULTIMAMONTA.SEXO_CRIA ))', dtListValueString, ctExpression, GetSysTypesList('SEXO_CRIA',1).SysDescriptionList    ) ;
  AddField ( 'Data concepção' ,                      'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND ( FEMEAS.KULTIMA_LACTACAO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO ) AND ( FEMEAS.KULTIMO_CIO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMO_CIO ), '
                                                                     +#13#10' EV_ULTIMAMONTA.DATAEVENTO, CAST ( NULL AS TIMESTAMP )  )',  dtDate, ctExpression ) ;
  AddField ( 'DPP concepção' ,                       'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND ( FEMEAS.KULTIMA_LACTACAO IS NOT NULL AND EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO ) AND ( FEMEAS.KULTIMO_CIO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMO_CIO ), '
                                                                     +#13#10' CAST ( CAST ( EV_ULTIMAMONTA.DATAEVENTO AS DATE ) - CAST ( FEMEAS.ULTIMA_LACTACAO AS DATE ) AS INTEGER), CAST ( NULL AS INTEGER )  )',  dtInteger, ctExpression ) ;
{  AddField ( 'DPP concepção' ,                       'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND ( FEMEAS.KULTIMA_LACTACAO IS NOT NULL AND EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO ) AND ( FEMEAS.KULTIMO_CIO IS NULL OR EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMO_CIO ), '
                                                                     +#13#10' EV_ULTIMAMONTA.DATAEVENTO, CAST ( NULL AS TIMESTAMP )  )',  dtDate, ctExpression ) ;}
  AddField ( 'IATF' ,                                'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.IATF = ''T'', ''Sim'', ''Não'' )',  dtBoolean, ctExpression ) ;
  AddField ( 'Protocolo IATF' ,                      'EV_ULTIMAMONTA', '(SELECT P.CODIGO FROM ZOO_PROTOCOLOS P WHERE P.KZOO_PROTOCOLO = EV_ULTIMAMONTA.KZOO_PROTOCOLO_IATF)',  dtBoolean, ctExpression ) ;
//  AddField ( 'Reexaminar Prenhez' ,                  'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.REEXAMINAR = ''T'', ''Sim'', ''Não'' )',  dtBoolean, ctExpression ) ;
//  AddField ( 'Data do Toque' ,                       'EV_ULTIMAMONTA', 'DATATOQUE', dtDate ) ;
  AddField ( 'Última data do Toque' ,                       'EV_ULTIMAMONTA', 'DATATOQUE', dtDate ) ;
  AddField ( 'Dias em Gestação' ,                    'EV_ULTIMAMONTA',
             Format('IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'', COALESCE ( CAST ( EV_ULTIMAMONTA.DATAABORTOPARTO AS DATE ), CURRENT_DATE ) '
                                    +#13#10' - CAST ( DATEADD( - IIF( EV_ULTIMAMONTA.TIPOEVENTO = %d, 7, 0) DAY TO CAST( EV_ULTIMAMONTA.DATAEVENTO AS DATE)) AS DATE ), CAST ( NULL AS INTEGER ) )',[_ST_TIPO_EVENTO_ZOO_IMPLANTE]), dtInteger, ctExpression ) ;
  AddField ( 'Dias Vazios' ,                         'EV_ULTIMAMONTA', 'IIF ( EV_ULTIMAMONTA.DATAEVENTO > FEMEAS.ULTIMA_LACTACAO,'
                                                                        +'IIF ( EV_ULTIMAMONTA.PRENHEZ IS DISTINCT FROM ''T'' OR EV_ULTIMAMONTA.ABORTOPARTO = 1,'
                                                                              +'CURRENT_DATE,'
                                                                              +'CAST ( EV_ULTIMAMONTA.DATAEVENTO AS DATE )),'
                                                                              +'CURRENT_DATE ) - CAST( FEMEAS.ULTIMA_LACTACAO AS DATE)', dtInteger, ctExpression ) ;

  AddField ( 'Previsão de Parto' ,                   'EV_ULTIMAMONTA',
    Format (
     'IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND EV_ULTIMAMONTA.DATAABORTOPARTO IS NULL,'
    +'( FEMEAS.ULTIMA_MONTA + IIF ( FEMEAS.NUMERO_LACTACAO > 0, %d, %d ) ),'
    +'CAST ( NULL AS TIMESTAMP ) )',
    [ FDiasGetacaoMultipara, FDiasGetacaoPrimipara ] ),
    dtDate, ctExpression ) ;
  AddField ( 'Idade ao Parto' ,     'FEMEAS', 'IAP',             dtFloat ) ;

  AddField ( 'Previsão de Idade ao Parto' ,                   'EV_ULTIMAMONTA',
    Format (
     'IIF ( EV_ULTIMAMONTA.PRENHEZ = ''T'' AND EV_ULTIMAMONTA.DATAABORTOPARTO IS NULL,'
    +'( CAST ( CAST (  ( ( FEMEAS.ULTIMA_MONTA + IIF ( FEMEAS.NUMERO_LACTACAO > 0, %d, %d ) )'
                          +'- FEMEAS.NASCIMENTO )/ 30.4 '
             +' AS NUMERIC ( 5, 1 ) ) '
       +'AS SYS$FLOAT ) ),'
    +'CAST ( NULL AS SYS$FLOAT  ) )',
    [ FDiasGetacaoMultipara, FDiasGetacaoPrimipara ] ),
    dtDate, ctExpression ) ;

  AddField ( 'Data do aborto' ,     'EV_ULTIMOABORTO', 'EV_ULTIMOABORTO.DATAABORTOPARTO',  dtDate, ctExpression ) ;
  AddField ( 'Tipo aborto' ,        'EV_ULTIMOABORTO', '(SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 20 ) ) FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_PARTOABORTO'', EV_ULTIMOABORTO.ABORTOPARTO ))',  dtString, ctExpression ) ;
  AddField ( 'Data da coleta' ,     'EV_ULTIMACOLETA', 'EV_ULTIMACOLETA.DATAABORTOPARTO',  dtDate, ctExpression ) ;
  AddField ( 'Embriões Coletados' , 'EV_ULTIMACOLETA', 'EMBRIOESCOLETADOS',  dtInteger ) ;
  //AddField ( 'Status Reprodutivo' , 'FEMEAS', '(SELECT CAST ( SYS$DESCRIPTION AS VARCHAR(50) ) SYS$DESCRIPTION FROM ZOO_GET_STATUS_REPRODUTIVO( FEMEAS.KZOO_ANIMAL_FEMEA ))', dtListValueString, ctExpression, GetSysTypesList('STATUS_REPRODUTIVO',2).SysDescriptionList    ) ;
  //AddField ( 'Status Reprodutivo' , 'FEMEAS', 'STATUS_REPRODUTIVO', dtListValueString, ctExpression, GetSysTypesList('STATUS_REPRODUTIVO',2,' and SYS$DESCRIPTION <> ''Aberta'' ').SysDescriptionList    ) ;
  AddField ( 'Status Reprodutivo' , 'FEMEAS', '(SELECT CAST( SYS$DESCRIPTION AS VARCHAR ( 50 ) ) FROM SYS$TYPES_GETDESCRIPTION( ''STATUS_REPRODUTIVO'', FEMEAS.STATUS_REPRODUTIVO ))', dtListValueString, ctExpression, GetSysTypesList('STATUS_REPRODUTIVO',2,' and SYS$DESCRIPTION <> ''Aberta'' ').SysDescriptionList    ) ;
end;

procedure TZoo_RelatorioPersonalizado.AddGroupMastite ;
var
  LActiveGroupNode : PVirtualNode ;
begin
  LActiveGroupNode := FActiveGroupNode ;
  AddGroup ( 'Dados Mastite', LActiveGroupNode ) ;

  AddField ( 'Data da mastite',                      'MASTITE',  'DATA',   dtDate, ctField ) ;
  AddField ( 'Diagnóstico',                          'MASTITE',  'CODIGO', dtString, ctField ) ;
  AddField ( 'Quarto',                               'MASTITE',  '(SELECT CAST ( SYS$DESCRIPTION AS VARCHAR ( 2 ) ) SYS$DESCRIPTION FROM SYS$TYPES_GETDESCRIPTION( ''TIPO_SIGLAQUARTO'', MASTITE.QUARTO ))', dtString, ctExpression    ) ;


  AddField ( 'No. da lactação (mastite)',             'MASTITE',
   '(SELECT L.NL FROM ZOO_LACTACOES L'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATALACTACAO <= MASTITE.DATA'
  +' ORDER BY L.DATALACTACAO DESC'
  +' ROWS 1)', dtInteger, ctExpression ) ;

  AddField ( 'Data da lactação (mastite)',             'MASTITE',
   '(SELECT L.DATALACTACAO FROM ZOO_LACTACOES L'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATALACTACAO <= MASTITE.DATA'
  +' ORDER BY L.DATALACTACAO DESC'
  +' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'DPP (mastite)',             'MASTITE',
   '(SELECT MASTITE.DATA - L.DATALACTACAO FROM ZOO_LACTACOES L'
  +' WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
  +' AND L.DATALACTACAO <= MASTITE.DATA'
  +' ORDER BY L.DATALACTACAO DESC'
  +' ROWS 1)', dtInteger, ctExpression ) ;

  AddField ( 'No. de casos na lactação (mastite)',             'MASTITE',
          '(SELECT COUNT(*) FROM ZOO_ANIMAL_DIAGNOSTICOS D'
        + ' LEFT JOIN ZOO_DIAGNOSTICOS TD ON TD.KZOO_DIAGNOSTICO = D.KZOO_DIAGNOSTICO'
        + ' LEFT JOIN'
        + '   (SELECT L.DATALACTACAO, L.DATA_SECAGEM FROM ZOO_LACTACOES L'
        + '    WHERE L.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
        + '     AND L.DATALACTACAO <= MASTITE.DATA'
        + '     ORDER BY L.DATALACTACAO DESC'
        + '     ROWS 1) L ON 1=1'
        + ' WHERE D.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
        + ' AND TD.TIPODIAGNOSTICO = 3'
        + ' AND (    ( D.DATA >= L.DATALACTACAO AND L.DATA_SECAGEM IS NULL )'
        + '       OR ( D.DATA BETWEEN L.DATALACTACAO AND L.DATA_SECAGEM  )'
        + '     )'
        + ')', dtInteger, ctExpression ) ;

{
  AddField ( 'No. de casos na lactação',             'MASTITE',
          '(SELECT COUNT(*) FROM ZOO_ANIMAL_DIAGNOSTICOS D'
        + ' LEFT JOIN ZOO_DIAGNOSTICOS TD ON TD.KZOO_DIAGNOSTICO = D.KZOO_DIAGNOSTICO'
        + ' WHERE D.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
        + ' AND TD.TIPODIAGNOSTICO = 3'
        + ' AND (    ( FEMEAS.ULTIMA_LACTACAO IS NULL)'
        + '       OR ( D.DATA >= FEMEAS.ULTIMA_LACTACAO ) ) )', dtInteger, ctExpression ) ;
}

  AddField ( 'Penúltima CCS',                        'ANALISE2', 'CCS',   dtFloat, ctField ) ;
  AddField ( 'Ultima CCS',                           'ANALISE',  'CCS',   dtFloat, ctField ) ;
  AddField ( 'Data última CCS',                      'ANALISE',  'DATA',  dtDate, ctField ) ;

  AddField ( 'Último protocolo utilizado',           'MASTITE',
          '(SELECT P.CODIGO FROM ZOO_ANIMAL_PROTOCOLOS P'
        + ' WHERE P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO'
        + ' ORDER BY DATA DESC'
        + ' ROWS 1)', dtString, ctExpression ) ;


  AddField ( 'Data do último protocolo',             'MASTITE',
          '(SELECT P.DATA FROM ZOO_ANIMAL_PROTOCOLOS P'
        + ' WHERE P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO'
        + ' ORDER BY DATA DESC'
        + ' ROWS 1)', dtDate, ctExpression ) ;


  AddField ( 'Penúltima tarefa',                     'MASTITE',
          '(SELECT T.CODIGO FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F'' AND T.STATUS = 2 AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.KZOO_TAREFA IS NOT NULL AND T.EXAME = ''F'''
        + ' ORDER BY P.DATA DESC, T.DATASTATUS DESC'
        + ' ROWS 2 TO 2)', dtString, ctExpression ) ;

  AddField ( 'Última tarefa',                        'MASTITE',
          '(SELECT T.CODIGO FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F''  AND T.STATUS = 2 AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.KZOO_TAREFA IS NOT NULL AND T.EXAME = ''F'''
        + ' ORDER BY P.DATA DESC, T.DATASTATUS DESC'
        + ' ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Data última tarefa',                   'MASTITE',
          '(SELECT T.DATASTATUS FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F''  AND T.STATUS = 2 AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.KZOO_TAREFA IS NOT NULL AND T.EXAME = ''F'''
        + ' ORDER BY P.DATA DESC, T.DATASTATUS DESC'
        + ' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'Resultado último exame',               'MASTITE',
          '(SELECT R.NOME FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' LEFT JOIN ZOO_TAREFA_RESULTADOS R ON R.KZOO_TAREFA_RESULTADO = T.KZOO_TAREFA_RESULTADO1'
        + ' WHERE T.EXCLUIDO = ''F'' AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.EXAME = ''T'' AND T.DATA_RESULTADO IS NOT NULL'
        + ' ORDER BY P.DATA DESC, T.DATA_RESULTADO DESC'
        + ' ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Data último exame',                    'MASTITE',
          '(SELECT T.DATA_RESULTADO FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F'' AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.EXAME = ''T'' AND T.DATA_RESULTADO IS NOT NULL'
        + ' ORDER BY P.DATA DESC, T.DATA_RESULTADO DESC'
        + ' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'Início do último descarte do leite',   'MASTITE',
          '(SELECT T.DATAPREVISTA FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F'' AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.KZOO_TAREFA IS NULL AND T.CODIGO = ''DL'''
        + ' ORDER BY P.DATA DESC, T.DATAPREVISTA DESC'
        + ' ROWS 1)', dtDate, ctExpression ) ;

  AddField ( 'Final do último descarte do leite',    'MASTITE',
          '(SELECT T.DATAPREVISTA FROM ZOO_ANIMAL_TAREFAS T'
        + ' LEFT JOIN ZOO_ANIMAL_PROTOCOLOS P ON P.KZOO_ANIMAL_PROTOCOLO = T.KZOO_ANIMAL_PROTOCOLO'
        + ' WHERE T.EXCLUIDO = ''F'' AND P.KZOO_ANIMAL_DIAGNOSTICO = MASTITE.KZOO_ANIMAL_DIAGNOSTICO AND T.KZOO_TAREFA IS NULL AND T.CODIGO = ''DL'''
        + ' ORDER BY P.DATA DESC, T.DATAPREVISTA'
        + ' ROWS 1)', dtString, ctExpression ) ;

  AddField ( 'Reincidente ( animal )',               'MASTITE',
          '(SELECT IIF( COUNT(*) > 1, ''Sim'', ''Não'' ) FROM ZOO_ANIMAL_DIAGNOSTICOS D'
        + ' LEFT JOIN ZOO_DIAGNOSTICOS TD ON TD.KZOO_DIAGNOSTICO = D.KZOO_DIAGNOSTICO'
        + ' WHERE D.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA'
        + ' AND TD.TIPODIAGNOSTICO = 3)', dtInteger, ctExpression ) ;

  AddField ( 'Reincidente ( quarto )',               'MASTITE',
          '(SELECT REINCIDE_QUARTO FROM (SELECT D.QUARTO, IIF( COUNT(*) > 1, ''Sim'', ''Não'' ) REINCIDE_QUARTO FROM ZOO_ANIMAL_DIAGNOSTICOS D'
        + ' LEFT JOIN ZOO_DIAGNOSTICOS TD ON TD.KZOO_DIAGNOSTICO = D.KZOO_DIAGNOSTICO'
        + ' WHERE D.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND D.QUARTO = MASTITE.QUARTO'
        + ' AND TD.TIPODIAGNOSTICO = 3'
        + ' GROUP BY 1))', dtInteger, ctExpression ) ;


  SetActiveGroupNode ( LActiveGroupNode ) ;
end;

procedure TZoo_RelatorioPersonalizado.AddGroupSanidade;
const
 _SQL_DIAGNOSTICOS =
//         'SELECT D.KZOO_DIAGNOSTICO, DD.CODIGO ||'' - ''||  DD.NOME SANIDADE FROM DEF_DIAGNOSTICOS DD '
//  +#13#10'INNER JOIN  ZOO_DIAGNOSTICOS D ON D.KDEF_DIAGNOSTICO = DD.KDEF_DIAGNOSTICO'
//  +#13#10'WHERE DD.TIPOEVENTO IS NULL AND D.KCAD_FAZENDA = :KCAD_FAZENDA' ;

         'SELECT D.KZOO_DIAGNOSTICO, D.NOME SANIDADE FROM ZOO_DIAGNOSTICOS D '
  +#13#10'WHERE D.TIPOEVENTO IS NULL AND D.KCAD_FAZENDA = :KCAD_FAZENDA'
  +#13#10'  AND ATIVO = ''T'' OR ( ATIVO = ''F'' AND INTERNAL = ''F'' ) '
  +#13#10'ORDER BY D.CODIGO' ;

var
 cdsSanidade : TClientDataSet ;
 ParamsSanidade : TParams ;
 TableAlias : string ;
var
  LActiveGroupNode : PVirtualNode ;
begin

  AddGroup ( 'Dados Sanitários' ) ;

  AddField ( 'Data do Penúltimo Diagnóstico' ,       'PD_ANIMAL', 'DATA', dtDate ) ;
  AddField ( 'Penúltimo Diagnóstico' ,               'DESC_PD',   'COALESCE ( DESC_PD.NOME, PD_ANIMAL.NOME )', dtString, ctExpression ) ;
  AddField ( 'Obs. Penúltimo Diagnóstico' ,          'PD_ANIMAL', 'OBS', dtString ) ;
  //AddField ( '1o. Trata/to Penúlt. Diagnóstico' ,    'PD', '',     dtString ) ;
  //AddField ( '2o. Trata/to Penúlt. Diagnóstico' ,    'PD', '', dtString ) ;
  //AddField ( '3o. Trata/to Penúlt. Diagnóstico' ,    'PD', '', dtString ) ;
  AddField ( 'Data do Último Diagnóstico' ,          'UD_ANIMAL', 'DATA', dtDate ) ;
  AddField ( 'Último Diagnóstico' ,                  'DESC_UD',   'COALESCE ( DESC_UD.NOME, UD_ANIMAL.NOME )', dtString, ctExpression ) ;
  AddField ( 'Obs. Último Diagnóstico' ,             'UD_ANIMAL', 'OBS', dtString ) ;
  //AddField ( '1o. Trata/to Últ. Diagnóstico' ,       'UD', '', dtString ) ;
  //AddField ( '2o. Trata/to Últ. Diagnóstico' ,       'UD', '', dtString ) ;
  //AddField ( '3o. Trata/to Últ. Diagnóstico' ,       'UD', '', dtString ) ;
  AddField ( 'Data do Penúltimo Protocolo' ,       'PP_ANIMAL', 'DATA', dtDate ) ;
  AddField ( 'Penúltimo Protocolo' ,               'DESC_PP',   'COALESCE ( DESC_PP.CODIGO, PP_ANIMAL.CODIGO )', dtString, ctExpression ) ;
  AddField ( 'Data do Último Protocolo' ,          'UP_ANIMAL', 'DATA', dtDate ) ;
  AddField ( 'Último Protocolo' ,                  'DESC_UP',   'COALESCE ( DESC_UP.CODIGO, UP_ANIMAL.CODIGO )', dtString, ctExpression ) ;

  AddField ( 'Data do Penúltima Tarefa' ,       'PT_ANIMAL', 'DATASTATUS', dtDate ) ;
  AddField ( 'Penúltima Tarefa' ,               'DESC_PT',   'COALESCE ( DESC_PT.CODIGO, PT_ANIMAL.CODIGO )', dtString, ctExpression ) ;
  AddField ( 'Data do última Tarefa' ,          'UT_ANIMAL', 'DATASTATUS', dtDate ) ;
  AddField ( 'Última Tarefa' ,                  'DESC_UT',   'COALESCE ( DESC_UT.CODIGO, UT_ANIMAL.CODIGO )', dtString, ctExpression ) ;

  AddField ( 'Última aplicação BST', 'FEMEAS',
     '(SELECT BST.DATA FROM ZOO_ANIMAL_FEMEA_BST BST'
   + ' WHERE ( BST.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA )'
   + ' AND ( BST.APLICADO = ''T'' )'
   + ' ORDER BY BST.DATA DESC ROWS 1)',
   dtDate, ctExpression ) ;

  LActiveGroupNode := FActiveGroupNode ;
  AddGroup ( 'Diagnósticos', LActiveGroupNode ) ;

  cdsSanidade := nil ;
  ParamsSanidade := TParams.Create ;
  ParamsSanidade.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsSanidade, _SQL_DIAGNOSTICOS, ParamsSanidade ) ;
  with cdsSanidade do
    while not eof do
      begin
      (*
        TableAlias := DblQuotedStr ( 'SAN_' + FieldByName ( 'KZOO_DIAGNOSTICO' ).asString ) ;
        FReport.AddTable (TableAlias,
                  TVRptTable.Create ( ttTable,
                                      'VRPT_DIAGNOSTICOS',
                                      trLeftJoin,
                                      Format ( '%s.KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA', [ TableAlias ] ),
                                      '',
                                      '' )
                 ) ;
        AddField ( FieldByName ( 'SANIDADE' ).asString,
                   TableAlias,
                   Format ( 'IIF ( %s.KZOO_DIAGNOSTICO is Null, ''Não'', ''Sim'' )', [ TableAlias ] ),
                   dtBoolean,
                   ctExpression ) ;
        *)


        AddField ( FieldByName ( 'SANIDADE' ).asString,
                   'FEMEAS',
//                   Format ( 'IIF ( EXISTS (SELECT 1 FROM VRPT_DIAGNOSTICOS D WHERE KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND D.KZOO_DIAGNOSTICO = %s ROWS 1 ), ''Não'', ''Sim'' )', [ QuotedStr ( FieldByName ( 'KZOO_DIAGNOSTICO' ).asString ) ] ),
                   Format ( 'IIF ( EXISTS (SELECT 1 FROM ZOO_ANIMAL_DIAGNOSTICOS D WHERE KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND D.KZOO_DIAGNOSTICO = %s AND EXCLUIDO = ''F'' ROWS 1 ), ''Sim'', ''Não'' )', [ QuotedStr ( FieldByName ( 'KZOO_DIAGNOSTICO' ).asString ) ] ),
                   dtBoolean,
                   ctExpression ) ;

        next ;
      end;
  ParamsSanidade.Free ;
  FreeAndNil ( cdsSanidade ) ;
  SetActiveGroupNode ( LActiveGroupNode ) ;

end;

procedure TZoo_RelatorioPersonalizado.AddGroupProtocolos;
const
 _SQL_PROTOCOLOS =
//         'SELECT D.KZOO_PROTOCOLO, DD.CODIGO ||'' - ''||  DD.NOME SANIDADE FROM DEF_PROTOCOLOS DD '
//  +#13#10'INNER JOIN  ZOO_PROTOCOLOS D ON D.KDEF_PROTOCOLO = DD.KDEF_PROTOCOLO'
//  +#13#10'WHERE DD.TIPOEVENTO IS NULL AND D.KCAD_FAZENDA = :KCAD_FAZENDA' ;

         'SELECT D.KZOO_PROTOCOLO, D.CODIGO PROTOCOLO FROM ZOO_PROTOCOLOS D '
  +#13#10'WHERE D.KCAD_FAZENDA = :KCAD_FAZENDA'
  +#13#10'  AND ATIVO = ''T'' OR ( ATIVO = ''F'' AND INTERNAL = ''F'' ) ' ;

var
 cdsProtocolos : TClientDataSet ;
 ParamsSanidade : TParams ;
 TableAlias : string ;

begin
  AddGroup ( 'Protocolos' ) ;

  cdsProtocolos := nil ;
  ParamsSanidade := TParams.Create ;
  ParamsSanidade.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsProtocolos, _SQL_PROTOCOLOS, ParamsSanidade ) ;
  with cdsProtocolos do
    while not eof do
      begin

        AddField ( FieldByName ( 'PROTOCOLO' ).asString,
                   'FEMEAS',
//                   Format ( 'IIF ( EXISTS (SELECT 1 FROM VRPT_PROTOCOLOS P WHERE KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND P.KZOO_PROTOCOLO = %s ROWS 1 ), ''Não'', ''Sim'' )', [ QuotedStr ( FieldByName ( 'KZOO_PROTOCOLO' ).asString ) ] ),
                   Format ( 'IIF ( EXISTS (SELECT 1 FROM ZOO_ANIMAL_PROTOCOLOS P WHERE KZOO_ANIMAL_FEMEA = FEMEAS.KZOO_ANIMAL_FEMEA AND P.KZOO_PROTOCOLO = %s AND EXCLUIDO = ''F'' ROWS 1 ), ''Sim'', ''Não'' )', [ QuotedStr ( FieldByName ( 'KZOO_PROTOCOLO' ).asString ) ] ),
                   dtBoolean,
                   ctExpression ) ;

        next ;
      end;
  ParamsSanidade.Free ;
  FreeAndNil ( cdsProtocolos ) ;

end;

procedure TZoo_RelatorioPersonalizado.AddGroupTarefas;
const
 _SQL_TAREFAS =
//         'SELECT D.KZOO_DIAGNOSTICO, DD.CODIGO ||'' - ''||  DD.NOME SANIDADE FROM DEF_DIAGNOSTICOS DD '
//  +#13#10'INNER JOIN  ZOO_DIAGNOSTICOS D ON D.KDEF_DIAGNOSTICO = DD.KDEF_DIAGNOSTICO'
//  +#13#10'WHERE DD.TIPOEVENTO IS NULL AND D.KCAD_FAZENDA = :KCAD_FAZENDA' ;

         'SELECT D.KZOO_TAREFA, D.CODIGO TAREFA FROM ZOO_TAREFAS D '
  +#13#10'WHERE D.KCAD_FAZENDA = :KCAD_FAZENDA' ;

var
 cdsTarefas : TClientDataSet ;
 ParamsSanidade : TParams ;
 TableAlias : string ;

begin
  AddGroup ( 'Tarefas' ) ;

  cdsTarefas := nil ;
  ParamsSanidade := TParams.Create ;
  ParamsSanidade.CreateParam ( ftString, 'KCAD_FAZENDA', ptInput ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsTarefas, _SQL_TAREFAS, ParamsSanidade ) ;
  with cdsTarefas do
    while not eof do
      begin

        AddField ( FieldByName ( 'TAREFA' ).asString,
                   'FEMEAS',
//                   Format ( 'IIF ( EXISTS (SELECT 1 FROM VRPT_TAREFAS T WHERE KZOO_ANIMAL = FEMEAS.KZOO_ANIMAL AND T.KZOO_TAREFA = %s ROWS 1 ), ''Não'', ''Sim'' )', [ QuotedStr ( FieldByName ( 'KZOO_TAREFA' ).asString ) ] ),
                   Format ( 'IIF ( EXISTS (SELECT 1 FROM ZOO_ANIMAL_TAREFAS T WHERE T.KZOO_ANIMAL = FEMEAS.KZOO_ANIMAL_FEMEA AND T.KZOO_TAREFA = %s AND EXCLUIDO = ''F'' ROWS 1 ), ''Sim'', ''Não'' )', [ QuotedStr ( FieldByName ( 'KZOO_TAREFA' ).asString ) ] ),
                   dtBoolean,
                   ctExpression ) ;

        next ;
      end;
  ParamsSanidade.Free ;
  FreeAndNil ( cdsTarefas ) ;

end;

procedure TZoo_RelatorioPersonalizado.AddToKeyList;
var
  LDataSet : TDataSet ;
  LKeyField : TField ;
  LCodeField : TField ;
  LBM : TArray<Byte> ;
  LKeyCode : TKeyCode ;
begin
  LDataSet := dtsResult.DataSet ;
  LBM := LDataSet.GetBookmark ;
  LKeyField  := LDataSet.Fields[ 0 ] ;
  LCodeField := LDataSet.FieldByName( 'BRINCO' ) ;
  LDataSet.DisableControls ;
  LDataSet.First ;
  While not LDataSet.Eof do
     begin
        LKeyCode.Key := LKeyField.asString ;
        LKeyCode.Code := LCodeField.asString ;
        FKeyCodeList.Add( LKeyCode ) ;
        LDataSet.Next ;
     end;
  LDataSet.GotoBookmark( LBM ) ;
  LDataSet.EnableControls ;
end;

procedure TZoo_RelatorioPersonalizado.btbPanelSaveOkClick(Sender: TObject);
begin
  ValidateSaveReport ;
  PopuperSaveAs.ModalResult := mrOK ;
end;

procedure TZoo_RelatorioPersonalizado.FloatEditorOKButtonClick(Sender: TObject);
begin
  FModalResult := mrOK ;
  PopuperCondition.ModalResult := FModalResult ;
end;

procedure TZoo_RelatorioPersonalizado.FReportGetWhere(Sender: TObject;
  UsedTableAlias : TStrings ; var AWhere : string ; AParams : TParams ) ;
begin
  AWhere := 'FEMEAS.KCAD_FAZENDA  = ' + QuotedStr ( Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ) ;
  if not ( cbxDescartados.Checked ) then
    AWhere := AWhere + ' AND FEMEAS.STATUS <> ''DES'' ' ; // + IntToStr ( _ST_STATUS_ANIMAL_DESCARTADO )

  if UsedTableAlias.IndexOf( 'LACTACAO' ) <> -1 then
    AParams.CreateParam ( ftString, 'SHOW_ULAS', ptInput ).asString := IfThen ( cbxUltimaLactacaoSecos.Checked, 'T', 'F' )
end;

function TZoo_RelatorioPersonalizado.GetSysTypesList( ASysType: String; AOrderBy: Integer = 1; AWhere: String = '' ): TSysTypeList;
var
  cds: TClientDataSet;
  ListStatusReprodutivo: String;
  _SQL_SYS_TYPES: String;
begin
  _SQL_SYS_TYPES :=
     'SELECT SYS$VALUE, SYS$DESCRIPTION FROM SYS$TYPES WHERE SYS$TYPE =''%s'' %s ORDER BY %d';
  cds := nil ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds, Format(_SQL_SYS_TYPES,[ASysType, AWhere, AOrderBy]) ) ;
  with cds do
   begin
    First;
    while not eof do
     begin
       Result.SysValueList        := Result.SysValueList + cds.Fields[0].AsString+ ';';
       Result.SysDescriptionList  := Result.SysDescriptionList + cds.Fields[1].AsString+ ';';
       Next;
     end;
     Result.SysValueList       := Copy(Result.SysValueList      ,1, Length(Result.SysValueList      )-1 );
     Result.SysDescriptionList := Copy(Result.SysDescriptionList,1, Length(Result.SysDescriptionList)-1 );
   end;
  cds.Free;
end;

procedure TZoo_RelatorioPersonalizado.FloatEditorCancelButtonClick(Sender: TObject);
begin
  FModalResult := mrCancel ;
  PopuperCondition.ModalResult := FModalResult ;
end;


procedure TZoo_RelatorioPersonalizado.MoveUp;
begin
   Zoo_RelatorioPersonalizadoDatamodule.MoveUp ;
end;

procedure TZoo_RelatorioPersonalizado.MoveDown;
begin
   Zoo_RelatorioPersonalizadoDatamodule.MoveDown ;
end;

{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
  FDisableAutoLoad := ( Name = 'DBGridResultados' ) ;
  inherited;
end;

initialization
  RegisterClass ( TZoo_RelatorioPersonalizado ) ;
  SetPersonalizado( DoModal ) ;

end.
