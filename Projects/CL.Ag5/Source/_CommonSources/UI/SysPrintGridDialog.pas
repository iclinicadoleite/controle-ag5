unit SysPrintGridDialog;

{
bug list :

ok - CONFIGURACAO DA FOLHA - nao aparece nada no listbox
ok - COLUNAS A IMPRIMIR - nao exclui coluna incluida manualmente...
ok - comportamento padrao - o botao serve pra Imprimir ou Exportar - Botao pra salvar com o check desenhado esta desabilitado
err - nao fecha mais, mas nao aplica ainda - Clicar em aplicar a todos fecha a janela
err - nao aumenta o tamanho da linha em altura
ok - se cancelar nao salva, se fechar salva - Se clicar em cancela, nao cancela. Mantem as alteracoes feitas
- Atividade >> Sanidade - nao distingue de qual relatorio é.
  mistura os campos de BST com CC com CMT

}

interface

{.$I Tc.MP.inc}

uses
  QRPrev502Suppl, ShFolder,
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.Grids, VCL.DBGrids, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, Mask , VCL.Imaging.jpeg,
  JvExMask, JvSpin, QuickRpt, Math, QRCtrls, CheckLst, VCL.DBCtrls, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, SysFormDialog, VCL.ActnList, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, VCL.ImgList, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.VCL.Edits, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, Tc.VCL.Controls.GDIButton, Tc.RTL.Exceptions,
  System.Actions, System.ImageList, Tc.VCL.Application
  {, Wrappers } ;

type
  TGridReport = class ;

  TProcedureTypeDetailBeforePrint = procedure (Sender: TQRCustomBand;  var PrintBand: Boolean) of object;

  TPrintGridDialog = class(T_FormDialog)
    PageControl : TJvPageControl ;
    TabSheetImprimir : TTabSheet ;
    TabSheetConfigurar : TTabSheet ;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    BitBtn1: TTcGDIButton;
    BitBtn2: TTcGDIButton;
    Label3: TLabel;
    edtTitle: TEdit;
    GroupBox1: TGroupBox;
    JvSpinEdit1: TJvSpinEdit;
    FieldsListBox: TCheckListBox;
    CheckBox2: TCheckBox;
    TopPanel: TPanel;
    LeftPanel: TPanel;
    actNewColumn: TAction;
    actDropColumn: TAction;
    ActionsImageList: TImageList;
    actColumnUp: TAction;
    actColumnDown: TAction;
    actNewComment: TAction;
    actDropComment: TAction;
    actCommentUp: TAction;
    actCommentDown: TAction;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox2: TGroupBox;
    PageSizeComboBox: TComboBox;
    RetratoRadioButton: TRadioButton;
    PaisagemRadioButton: TRadioButton;
    FontDlg: TFontDialog;
    ClientPanel: TPanel;
    Splitter2: TSplitter;
    gbTitle: TGroupBox;
    lblTitleCaption: TLabel;
    lblTitleAlignment: TLabel;
    lblTitleColor: TLabel;
    lblTitleFont: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edTitleCaption: TEdit;
    edTitleFont: TEdit;
    cbTitleAlignment: TComboBox;
    TitleColorsCombobox: TComboBox;
    ButtonTitleFont: TTcGDIButton;
    edDataFont: TEdit;
    cbDataAlignment: TComboBox;
    DataColorsCombobox: TComboBox;
    btnDataFont: TTcGDIButton;
    dbeTitleCaption: TDBEdit;
    DataColorsAltBackGround: TComboBox;
    DataColorsAltFont: TComboBox;
    JvSpinEdit2: TJvSpinEdit;
    JvSpinEdit3: TJvSpinEdit;
    BitBtn5: TTcGDIButton;
    GroupBoxComentarios: TGroupBox;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    CommentsListBox: TCheckListBox;
    Memo1: TMemo;
    PanelPreview: TPanel;
    Splitter1: TSplitter;
    PreviewDBGrid: TJvDBUltimGrid;
    ScrollBoxConfigurar: TScrollBox;
    ScrollBoxImprimir: TScrollBox;
    GroupBox4: TGroupBox;
    ExportViewCheckBox: TCheckBox;
    EmailExportTypeRadioButton: TRadioButton;
    CheckBox3: TCheckBox;
    Label11: TLabel;
    Label10: TLabel;
    GroupBoxImpressao: TGroupBox;
    Label12: TLabel;
    PrintPreviewCheckBox: TCheckBox;
    PrinterNamesComboBox: TComboBox;
    CopiesSpinEdit: TJvSpinEdit;
    Label2: TLabel;
    FileExportTypeRadioButton: TRadioButton;
    PanelExportTypes: TPanel;
    Label13: TLabel;
    PDFExportFormatRadioButton: TRadioButton;
    ExcelExportFormatRadioButton: TRadioButton;
    actPrintExport: TAction;
    WarningPrintLabel: TStaticText;
    RadioButtonPrint: TRadioButton;
    RadioButtonExport: TRadioButton;
    Label14: TLabel;
    lblOrientacaoImpressao: TLabel;
    actConfig: TAction;
    actCancel: TAction;
    SaveDialog: TSaveDialog;
    Button1: TTcGDIButton;
    procedure setGridSource ( AGridSource : TDBGrid ) ;
    procedure FormPaint(Sender: TObject);
    procedure FieldsListBoxClick(Sender: TObject);
    procedure FieldsListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FieldsListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PreviewDBGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure PreviewDBGridColumnResized(Grid: TJvDBGrid; ACol, NewWidth: Integer);
    procedure ColorComboboxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ColorComboboxClick(Sender: TObject);
    procedure ColorComboboxChange(Sender: TObject);
    procedure PropertyExit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CommentsListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CommentsListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FieldsListBoxClickCheck(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure actNewColumnExecute(Sender: TObject);
    procedure actDropColumnExecute(Sender: TObject);
    procedure actColumnUpExecute(Sender: TObject);
    procedure actColumnDownExecute(Sender: TObject);
    procedure actNewCommentExecute(Sender: TObject);
    procedure actDropCommentExecute(Sender: TObject);
    procedure actCommentUpExecute(Sender: TObject);
    procedure actCommentDownExecute(Sender: TObject);
    procedure actPrintExportUpdate(Sender: TObject);
    procedure actColumnUpUpdate(Sender: TObject);
    procedure actColumnDownUpdate(Sender: TObject);
    procedure actCommentUpUpdate(Sender: TObject);
    procedure actCommentDownUpdate(Sender: TObject);
    procedure actDropColumnUpdate(Sender: TObject);
    procedure ExcelExportFormatRadioButtonClick(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure actPrintExportExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    QuickRep: TQuickRep;
    rbColumnHeader: TQRBand;
    rbDetail: TQRBand;
    FGridReport : TGridReport ;
    FGridSource : TDBGrid ;
    InternalData : TClientDataSet ;
    FPageOverflow : boolean ;
    FOriginalTitle : string ;
    FDontSaveConfig : boolean ;
    FExportFileName : string ;
    function UUID ( AUseIntanceName : string = '' ) : string ;
    procedure MoveColumnsListBoxItem ( AFromPosition, AToPosition : integer ) ;
    procedure MoveCommentsListBoxItem ( AFromPosition, AToPosition : integer ) ;
    procedure CommuteControls ;
    procedure CreateControl( AColumn : TColumn ) ;
    procedure UpdateReportControls ;
    procedure UpdateWarningLabels ;
    procedure UpdateProperties ;
    function  GetCaptionFont(Font: TFont): string;
    procedure UpdateEditors ;
    property  GridSource : TDBGrid read FGridSource write setGridSource ;
    procedure AutoAdjust ( AColumns : TDBGridColumns ; AMaxWidth : integer );
    function  LoadGridReport : boolean ;
    function  SaveGridReport : boolean ;
    function  GetFileName : string ;
    procedure ExportToMail ;
    procedure ExportToPDF ;
    procedure ExportToExcel ;
    procedure DoExportToExcel( AFileName : string ) ;
    procedure DoPrint ;
    procedure DoExport ;
    procedure GetTextMemo (Sender: TField; var Text: String; DisplayText: Boolean) ;
  public
    { Public declarations }
    class procedure Execute ( AGridSource : TDBGrid ; ATitle : String = '' ; ALegend : string = '';
                                  AExibeTotalRegistro: Boolean = True; ADescription : string = '';
                                  ADetailBeforePrint : TProcedureTypeDetailBeforePrint = nil ) ;
    Constructor Create ( AOwner : TComponent ) ; override ;
    Destructor Destroy ; override ;
  published
    property QR : TQuickRep read QuickRep write QuickRep ;
  end;

  IPrintGridStorage = interface
  ['{5DC32D04-E385-43C0-81D4-CA2C4F2B9A7D}']
    procedure SaveGridReport  ( UID, Stream : string ) ;
    function  LoadGridReport  ( UID  : string ) : string ;
  end ;

  TGridReportPageLayout   = (grplPortrait, grplLandscape ) ;
  TGridReportPageSize     = (grpgA4, grpsLetter ) ;
  TGridReportExportFormat = (grefExcel, grefPDF ) ;
  TGridReportExportType   = (gretFile, gretEMail ) ;

  TGridReport = class
  private
    FTitle : string ;
    FColumns: TDBGridColumns;
    FPrinterName : string ;
    FPageLayout : TGridReportPageLayout ;
    FPageSize   : TGridReportPageSize ;
    FPrintPreview : boolean  ;
    FExportFormat : TGridReportExportFormat ;
    FExportType   : TGridReportExportType ;
    FPrintCopies : integer ;
    FExportView : boolean ;
    FExportFileName : string ;
    procedure SetColumns(const Value: TDBGridColumns);
  public
    Constructor Create ;
    Destructor Destroy ; override ;
  published
    property Title : string read FTitle write FTitle ;
    property PrinterName : string read FPrinterName write FPrinterName ;
    property PageLayout : TGridReportPageLayout read FPageLayout write FPageLayout ;
    property PageSize   : TGridReportPageSize   read FPageSize write FPageSize ;
    property Columns : TDBGridColumns  read FColumns write SetColumns;
    property PrintPreview : boolean read FPrintPreview write FPrintPreview ;
    property PrintCopies : integer read FPrintCopies write FPrintCopies ;
    property ExportView : boolean read FExportView write FExportView ;
    property ExportFileName : string read FExportFileName write FExportFileName ;
    property ExportFormat : TGridReportExportFormat read FExportFormat write FExportFormat ;
    property ExportType   : TGridReportExportType read FExportType write FExportType ;

  end;

  TPrintGridStorager = class
    class procedure SetStorage ( APrintGridStorage : IPrintGridStorage ) ;
  end;




implementation

uses Printers, NativeXml, NativeXmlObjectStorage, MailSuppl, QRPrntr,
  ShellAPI, StrUtils,
  TypInfo,
  //UFlexCelImport,  UExcelAdapter,
  { XLSAdapter, }
  VCL.FlexCel.Core, FlexCel.XlsAdapter ;
//  FlexCel.FlxFormats, FlexCel.UFlxMessages ;

{$R *.dfm}

function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := path
  else
    Result := '';
end;



function GetTmpFileName : string ;
begin
   Result :=  GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\' ;
   ForceDirectories ( Result ) ;
   Result := Result + 'Export' ;
end;

const
  clCream = TColor($A6CAF0);
  clMoneyGreen = TColor($C0DCC0);
  clSkyBlue = TColor($FFFBF0);
  ColorsInList = 46;

var
  ColorValues: array [0..ColorsInList - 1] of TColor = (
    clBlack, clMaroon, clGreen, clOlive, clNavy, clPurple, clTeal, clGray,
    clSilver, clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clWhite,
    clScrollBar, clBackground, clActiveCaption, clInactiveCaption,
    clMenu, clWindow, clWindowFrame, clMenuText, clWindowText, clCaptionText,
    clActiveBorder, clInactiveBorder, clAppWorkSpace, clHighlight,
    clHighlightText, clBtnFace, clBtnShadow, clGrayText, clBtnText,
    clInactiveCaptionText, clBtnHighlight, cl3DDkShadow, cl3DLight,
    clInfoText, clInfoBk, clCream, clMoneyGreen, clSkyBlue, 0, clNavy);

var
  PrintGridStorage : IPrintGridStorage ;

type
   TReportColumns = class
   public
     GridColumn    : TColumn ;
     QRLabel       : TQRLabel ;
     QRHeaderShape : TQRShape ;
     QRDBText      : TQRDBText ;
     QRDetailShape : TQRShape ;
     constructor Create ( AGridColumn : TColumn ; AQRLabel : TQRLabel ; AQRHeaderShape : TQRShape ; AQRDBText : TQRDBText ; AQRDetailShape : TQRShape ) ;
     destructor Destroy ; override ;
   end;


constructor TReportColumns.Create ( AGridColumn : TColumn ; AQRLabel : TQRLabel ; AQRHeaderShape : TQRShape ; AQRDBText : TQRDBText ; AQRDetailShape : TQRShape ) ;
begin
  GridColumn     := AGridColumn  ;
  QRLabel        := AQRLabel     ;
  QRHeaderShape  := AQRHeaderShape ;
  QRDBText       := AQRDBText   ;
  QRDetailShape  := AQRDetailShape ;
end;



procedure TPrintGridDialog.FieldsListBoxClick(Sender: TObject);
begin
  UpdateEditors;
end;


procedure TPrintGridDialog.FieldsListBoxClickCheck(Sender: TObject);
begin
   TReportColumns ( FieldsListBox.Items.Objects[ FieldsListBox.ItemIndex ] ).GridColumn.Visible := FieldsListBox.Checked[ FieldsListBox.ItemIndex ] ;
   UpdateReportControls;
   UpdateWarningLabels;
end;

procedure TPrintGridDialog.FieldsListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  StartPosition,
  DropPosition: Integer;
  DropPoint: TPoint;
begin
  with Source as TCheckListBox do
    begin
      StartPosition := FieldsListBox.ItemIndex;
      DropPoint.x := X;
      DropPoint.y := Y;
      DropPosition := FieldsListBox.ItemAtPos(DropPoint, True);
      if (DropPosition <> -1) then
        MoveColumnsListBoxItem(StartPosition, DropPosition);
    end;
end;

procedure TPrintGridDialog.FieldsListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (Source = FieldsListBox) then
    Accept := True
  else
    Accept := False;
end;

function CheckFieldColumnExists ( AColumns : TDBGridColumns ; AFieldName : string ) : boolean ;
begin
   Result := False ;
   for var x := 0 to AColumns.Count -1 do
     begin
        Result := AnsiSameText ( AColumns[x].FieldName, AFieldName ) ;
        if Result then
           Break
     end;

end;

procedure TPrintGridDialog.setGridSource ( AGridSource : TDBGrid ) ;
var
  ReportLoaded : boolean ;
  x : integer ;
begin


   if FGridSource = AGridSource then
       exit ;

   if assigned ( FGridReport ) then
      FreeAndNil ( FGridReport ) ;

   FGridReport := TGridReport.Create ;

   FGridSource := AGridSource ;

   PreviewDBGrid.DataSource  := FGridSource.DataSource ;

   ReportLoaded := self.LoadGridReport ;

   if ( ReportLoaded ) and ( Trim ( FGridReport.Title ) <> '' ) then
      edtTitle.Text := FGridReport.Title
   else
      edtTitle.Text := FOriginalTitle ;

   if ( ReportLoaded ) and ( FGridReport.Columns.Count > 0 ) then
     begin
         x := 0 ;
         // remove as colunas que nao existem no Dataset origem
         while x <= FGridReport.Columns.Count - 1  do
           if   ( FGridReport.Columns [ x ].FieldName <> '' )
             and not Assigned ( FGridSource.DataSource.DataSet.FindField( FGridReport.Columns [ x ].FieldName ) ) then
                 FGridReport.Columns.Delete( x )
             else
                 Inc ( x ) ;

     end;

   if ( ReportLoaded ) and ( FGridReport.Columns.Count > 0 ) then
     begin
         // adciona as colunas salvas no grid ...
         for var LColumn := 0 to FGridReport.Columns.Count -1 do
            with TColumn.Create( PreviewDBGrid.Columns ) do
               begin
                  Assign ( FGridReport.Columns [ LColumn ] ) ;
                  if Color = 0 then
                     Color := clWhite ;
            end ;

        // adiciona novas colunas ...
        for var LColumn := 0 to FGridSource.Columns.Count -1 do
           if    ( FGridSource.Columns [ LColumn ].FieldName <> '' )
             and ( not FGridSource.Columns [ LColumn ].Expanded )
             and not CheckFieldColumnExists( PreviewDBGrid.Columns, FGridSource.Columns [ LColumn ].FieldName ) then
               with TColumn.Create( PreviewDBGrid.Columns ) do
                 begin
                     Assign ( FGridSource.Columns [ LColumn ] ) ;
                     if Color = 0 then
                        Color := clWhite ;
                 end;

     end
   else
     for var LColumn := 0 to FGridSource.Columns.Count -1 do
        if ( FGridSource.Columns [ LColumn ].FieldName <> '' ) and ( not FGridSource.Columns [ LColumn ].Expanded ) then
            with TColumn.Create( PreviewDBGrid.Columns ) do
              begin
                  Assign ( FGridSource.Columns [ LColumn ] ) ;
                  if Color = 0 then
                     Color := clWhite ;
              end;

  PrinterNamesComboBox.ItemIndex := PrinterNamesComboBox.Items.IndexOf (  FGridReport.PrinterName ) ;

  if ( PrinterNamesComboBox.ItemIndex = -1 ) and ( PrinterNamesComboBox.Items.Count > 0 ) then
     PrinterNamesComboBox.ItemIndex := 0 ;

  PageSizeComboBox.ItemIndex := Ord ( FGridReport.PageSize ) ;

  if FGridReport.PageSize = grpgA4 then
     QuickRep.Page.PaperSize := QRPrntr.A4
  else
     QuickRep.Page.PaperSize := QRPrntr.Letter ;

  if FGridReport.PageLayout = grplPortrait then
    begin
     RetratoRadioButton.Checked := True ;
     lblOrientacaoImpressao.Caption := 'Retrato' ;
    end
  else
    begin
     PaisagemRadioButton.Checked := True ;
     lblOrientacaoImpressao.Caption := 'Paisagem' ;
    end;

  PrintPreviewCheckBox.Checked  := FGridReport.PrintPreview    ;
  CopiesSpinEdit.Value          := FGridReport.PrintCopies     ;
  ExportViewCheckbox.Checked    := FGridReport.ExportView      ;
  ExportViewCheckbox.Checked    := FGridReport.ExportView      ;

  FExportFileName   := FGridReport.ExportFileName  ;

  if FGridReport.ExportFormat = grefExcel then
     ExcelExportFormatRadioButton.Checked := True
  else
     PDFExportFormatRadioButton.Checked := True ;

  if FGridReport.ExportType = gretFile then
     FileExportTypeRadioButton.Checked := True
  else
    EmailExportTypeRadioButton.Checked := True ;

   FieldsListBox.Items.Clear ;

   with PreviewDBGrid.Columns do
     for var LColumn := 0 to Count - 1 do
       CreateControl ( Items[ LColumn ] ) ;

   if FieldsListBox.Count > 0 then
     FieldsListBox.ItemIndex := 0 ;

   dbeTitleCaption.DataField := '' ;
   dbeTitleCaption.DataSource := FGridSource.DataSource ;
   UpdateEditors ;

   UpdateReportControls ;
   UpdateWarningLabels;
   CommuteControls;

end ;


procedure TPrintGridDialog.ColorComboboxChange(Sender: TObject);
begin
  edTitleFont.Color := ColorValues[TitleColorsCombobox.ItemIndex];
  if (DataColorsCombobox.ItemIndex = DataColorsCombobox.Items.Count-1) then
    edDataFont.Color := ColorValues[DataColorsCombobox.ItemIndex+1]
  else
    edDataFont.Color := ColorValues[DataColorsCombobox.ItemIndex];
end;

procedure TPrintGridDialog.ColorComboboxClick(Sender: TObject);
var
  i: Integer;
begin
  with TCombobox(Sender) do
    if (ItemIndex = ColorsInList-2) then
    begin
      with TColorDialog.Create(Self) do
        try
          i := ColorsInList-1;
          if (Sender = TitleColorsCombobox) then
            Dec(i);

          Color := ColorValues[i];
          if Execute then
            ColorValues[i] := Color
        finally
          Free
        end
    end;
end;

procedure TPrintGridDialog.ColorComboboxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  ARect: TRect;
  Safer: TColor;
  i: Integer;
begin
  ARect := Rect;
  InflateRect(ARect, -2, -2);

  with (Control as TComboBox) do
  begin
    Canvas.FillRect(Rect);
    Safer := Canvas.Brush.Color;
    Canvas.Pen.Color := clWindowText;
    Canvas.Rectangle(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
    i := Index;
    if (Control = DataColorsCombobox) and
       (i = DataColorsCombobox.Items.Count-1) then
      Inc(i);
    Canvas.Brush.Color := ColorValues[i];
    try
      InflateRect(ARect, -1, -1);
      Canvas.FillRect(ARect);
    finally
      Canvas.Brush.Color := Safer;
    end;
  end;
end;

procedure TPrintGridDialog.CommentsListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  StartPosition,
  DropPosition: Integer;
  DropPoint: TPoint;
begin
  with Source as TCheckListBox do
    begin
      StartPosition := CommentsListBox.ItemIndex;
      DropPoint.x := X;
      DropPoint.y := Y;
      DropPosition := CommentsListBox.ItemAtPos(DropPoint, True);
      if (DropPosition <> -1) then
        MoveCommentsListBoxItem(StartPosition, DropPosition);
    end;
end;

procedure TPrintGridDialog.CommentsListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = CommentsListBox) then
    Accept := True
  else
    Accept := False;
end;

procedure TPrintGridDialog.CommuteControls;
begin
  if PageControl.ActivePage = TabSheetImprimir   then
    begin
      QuickRep.Parent :=  ScrollBoxImprimir ;
    end
  else if PageControl.ActivePage = TabSheetConfigurar then
    begin
     QuickRep.Parent :=  ScrollBoxConfigurar ;
    end;

  QuickRep.Top := 0 ;
  QuickRep.Left := 0 ;
end;

function TPrintGridDialog.SaveGridReport: boolean;
var
  Doc: TNativeXml;
  Writer: TsdXmlObjectWriter;
begin
  Result := False ;

  if not Assigned ( PrintGridStorage ) or ( FDontSaveConfig ) then
     exit ;

  FGridReport.PrinterName    := PrinterNamesComboBox.Text ;
  FGridReport.PageSize       := TGridReportPageSize ( PageSizeComboBox.ItemIndex ) ;
  FGridReport.PrintPreview   := PrintPreviewCheckBox.Checked ;
  FGridReport.PrintCopies    := CopiesSpinEdit.AsInteger     ;
  FGridReport.ExportView     := ExportViewCheckbox.Checked   ;
  FGridReport.ExportFileName := FExportFileName  ;

  if ExcelExportFormatRadioButton.Checked then
     FGridReport.ExportFormat := grefExcel
  else
     FGridReport.ExportFormat := grefPDF ;

  if FileExportTypeRadioButton.Checked then
    FGridReport.ExportType := gretFile
  else
    FGridReport.ExportType := gretEMail ;

  FGridReport.Columns.Assign( PreviewDBGrid.Columns );
  Doc := TNativeXml.CreateName(FGridReport.ClassName);
  // Create Object writer
    Writer := TsdXmlObjectWriter.Create;
    try
      // Write the image object as child of the XML document's root node
      Writer.WriteObject(Doc.Root, FGridReport, nil );
      PrintGridStorage.SaveGridReport( UUID, Doc.WriteToString );
    finally
      Writer.Free;
    end;
  Doc.Free ;


  Result := True ;

end;

procedure TPrintGridDialog.SelectFont(Sender: TObject);
var
  cntr: TEdit;
begin
  if Sender = ButtonTitleFont then
    cntr := edTitleFont
  else
    cntr := edDataFont;

  with FontDlg do
  begin
    Font.Assign(cntr.Font);
    if Execute then
    begin
      cntr.Font.Assign(Font);
      cntr.Text := GetCaptionFont(Font);
      UpdateProperties ;
    end;
  end;
end;

procedure TPrintGridDialog.CheckBox2Click(Sender: TObject);
begin
   GroupBoxComentarios.Visible := CheckBox2.Checked ;
end;

procedure TPrintGridDialog.DoExport;
begin
   QuickRep.PrinterSettings.Copies := 1 ;
   //QuickRep.Prepare ;

   if EmailExportTypeRadioButton.Checked then
     begin
      ExportToMail ;
      exit ;
     end ;

   if PDFExportFormatRadioButton.Checked then
     begin
      SaveDialog.Title      := 'Exportar para PDF'  ;
      SaveDialog.Filter     := 'Arquivos PDF|*.pdf' ;
      SaveDialog.DefaultExt := '.pdf' ;
     end
   else
     begin
      SaveDialog.Title      := 'Exportar para Excel' ;
      SaveDialog.Filter     := 'Arquivos Excel|*.xlsx' ;
      SaveDialog.DefaultExt := '.xlsx' ;
     end;

   if not SaveDialog.Execute then
      exit ;

   FExportFileName := SaveDialog.FileName ;

   if FileExists ( FExportFileName ) then
     if not DeleteFile( FExportFileName ) then
       Raise Fail.Create( 'Não foi possível exportar o arquivo. '
           +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
(*       Raise Fail.CreateFmt( 'Não é possível exportar para o arquivo: '
           +#13#10'%s'
           +#13#10'Verifique se possui permissão de escrita na pasta'
           +#13#10'ou se o arquivo não esta sendo utilizado por outro processo.', [ FExportFileName ] ) ;
*)
   if PDFExportFormatRadioButton.Checked then
      ExportToPDF
   else
      ExportToExcel
end;

procedure TPrintGridDialog.DoPrint;
begin
   QuickRep.PrinterSettings.PrinterIndex := PrinterNamesComboBox.ItemIndex ;
   QuickRep.PrinterSettings.Copies := CopiesSpinEdit.AsInteger ;
   if PrintPreviewCheckBox.Checked then
      QuickRep.Preview
   else
      QuickRep.Print ;
end;

procedure TPrintGridDialog.PropertyExit(Sender: TObject);
begin
   UpdateProperties ;
end;

procedure TPrintGridDialog.UpdateEditors;
  function GetColorID(cl: TColor): Integer;
  begin
    Result := -1;

    for var i := 0 to ColorsInList do
      if ColorValues[i] = cl then
      begin
        Result := i;
        break;
      end;
    if Result < 0 then
      Result := 0;
  end;

begin
  if FieldsListBox.ItemIndex > -1 then
    with TReportColumns(FieldsListBox.Items.Objects[FieldsListBox.ItemIndex]) do
    begin
      edTitleCaption.Text := GridColumn.Title.Caption ;

      cbTitleAlignment.ItemIndex := Ord(GridColumn.Title.Alignment);
      TitleColorsCombobox.ItemIndex   := GetColorID(GridColumn.Title.Color);

      if ( PreviewDBGrid.AlternateRowFontColor = clNone ) or ( PreviewDBGrid.AlternateRowFontColor = clDefault ) then
          DataColorsAltFont.ItemIndex         := GetColorID(clBlack)
      else
          DataColorsAltFont.ItemIndex         := GetColorID(PreviewDBGrid.AlternateRowFontColor);

      if ( PreviewDBGrid.AlternateRowColor = clNone ) or ( PreviewDBGrid.AlternateRowColor = clDefault ) then
          DataColorsAltBackGround.ItemIndex         := GetColorID(clWhite)
      else
          DataColorsAltBackGround.ItemIndex   := GetColorID(PreviewDBGrid.AlternateRowColor);

      edTitleFont.Font.Assign(GridColumn.Title.Font);
      edTitleFont.Text := GetCaptionFont(edTitleFont.Font);

      cbDataAlignment.ItemIndex := Ord(GridColumn.Alignment);
      DataColorsCombobox.ItemIndex  := GetColorID(GridColumn.Color);
      edDataFont.Font.Assign(GridColumn.Font);
      edDataFont.Text := GetCaptionFont(edDataFont.Font);

//      edWidth.Text := IntToStr(Width);

      ColorValues[ColorsInList-2] := GridColumn.Title.Color;
      ColorValues[ColorsInList-1] := GridColumn.Color;

      if Assigned ( GridColumn.Field ) then
        dbeTitleCaption.DataField := GridColumn.Field.FieldName
      else
        dbeTitleCaption.DataField := '' ;

//      TitleColorsComboboxChange(TitleColorsCombobox)
    end;
end;

procedure TPrintGridDialog.UpdateProperties;
var
  item: TReportColumns ;
  boolChecked: Boolean;
begin
  if FieldsListBox.ItemIndex = -1 then
    exit ;

  FGridReport.Title := edtTitle.Text ;

  FGridReport.PageSize := TGridReportPageSize ( PageSizeComboBox.ItemIndex ) ;

  if FGridReport.PageSize = grpgA4 then
     QuickRep.Page.PaperSize := QRPrntr.A4
  else
     QuickRep.Page.PaperSize := QRPrntr.Letter ;

  if RetratoRadioButton.Checked then
    begin
     FGridReport.PageLayout := grplPortrait ;
     lblOrientacaoImpressao.Caption := 'Retrato' ;
    end
  else
    begin
     FGridReport.PageLayout := grplLandscape ;
     lblOrientacaoImpressao.Caption := 'Paisagem' ;
    end;

  item := TReportColumns ( FieldsListBox.Items.Objects[FieldsListBox.ItemIndex]);

  boolChecked := FieldsListBox.Checked[FieldsListBox.ItemIndex];
  item.GridColumn.Title.Caption := edTitleCaption.Text;
  FieldsListBox.Items[FieldsListBox.ItemIndex] := item.GridColumn.Title.Caption ;

  item.GridColumn.Title.Alignment := TAlignment(cbTitleAlignment.ItemIndex);
  item.GridColumn.Title.Color     := ColorValues[TitleColorsCombobox.ItemIndex];
  item.GridColumn.Title.Font.Assign(edTitleFont.Font);

  item.GridColumn.Alignment := TAlignment(cbDataAlignment.ItemIndex);
  if (DataColorsCombobox.ItemIndex = DataColorsCombobox.Items.Count-1) then
     item.GridColumn.Color := ColorValues[DataColorsCombobox.ItemIndex+1]
  else
     item.GridColumn.Color := ColorValues[DataColorsCombobox.ItemIndex];
  item.GridColumn.Font.Assign(edDataFont.Font);

//  item.Width := StrToIntDef(edWidth.Text, 0);
  FieldsListBox.Checked[FieldsListBox.ItemIndex] := boolChecked;

  UpdateReportControls ;
  UpdateWarningLabels;
end;


procedure TPrintGridDialog.MoveColumnsListBoxItem(AFromPosition, AToPosition: integer);
begin
   FieldsListBox.Items.Move(AFromPosition, AToPosition);
   FieldsListBox.ItemIndex := AToPosition;
   TReportColumns ( FieldsListBox.Items.Objects[ AToPosition ] ).GridColumn.Index := AToPosition;
   UpdateReportControls ;
   UpdateWarningLabels;
end;


procedure TPrintGridDialog.MoveCommentsListBoxItem(AFromPosition,
  AToPosition: integer);
begin
   CommentsListBox.Items.Move(AFromPosition, AToPosition);
   CommentsListBox.ItemIndex := AToPosition;
end;

constructor TPrintGridDialog.Create(AOwner: TComponent);
begin
  inherited;
  cbTitleAlignment.Items.Add('Esquerda');
  cbTitleAlignment.Items.Add('Direita');
  cbTitleAlignment.Items.Add('Centro');

  cbDataAlignment.Items.Add('Esquerda');
  cbDataAlignment.Items.Add('Direita');
  cbDataAlignment.Items.Add('Centro');

  PageSizeComboBox.Items.Add('A4');
  PageSizeComboBox.Items.Add('Carta');

  PrinterNamesComboBox.Items.Assign( Printer.Printers ) ;

  TabSheetImprimir.TabVisible  := False ;
  TabSheetConfigurar.TabVisible := False ;
  PageControl.ActivePage := TabSheetImprimir ;
end;



procedure TPrintGridDialog.CreateControl ( AColumn : TColumn ) ;
var
 LeftPos : integer ;
 IterateColumns : integer ;
 QRLabel  : TQRLabel  ;
 QRHeaderShape, QRDetailShape : TQRShape ;
 QRDBText : TQRDBText  ;
begin

   QRHeaderShape := TQRShape.Create(self) ;
   with QRHeaderShape  do
     begin
       Parent    := rbColumnHeader;
       Top       := 0 ;
       AutoSize  := False;
       Shape     := qrsVertLine ;
       Pen.Color := rbColumnHeader.Frame.Color ; ;
       Width     := 3 ;
     end;

   QRLabel := TQRLabel.Create(self) ;
   with QRLabel  do
     begin
       Parent    := rbColumnHeader;
       Top       := 1 ;
       AutoSize  := False;
       WordWrap := True ;
       BringToFront ;
       Transparent := True ;
       Font.Style := [fsBold] ;
       Alignment   := taCenter ;
     end;

   // Detail

   QRDetailShape := TQRShape.Create(self) ;
   with QRDetailShape do
     begin
       Parent    := rbDetail;
       Top       := 0 ;
       AutoSize  := False;
       Shape     := qrsVertLine ;
       Pen.Color := rbDetail.Frame.Color ;
       Width     := 3 ;
     end;

   QRDBText := TQRDBText.Create(self) ;
   with QRDBText  do
     begin
       Top         := 1 ;
       Parent      := rbDetail;
       if Assigned ( AColumn.Field )  then
         begin
          DataSet     := AColumn.Field.DataSet ;
          DataField   := AColumn.FieldName;
          Alignment   := AColumn.Field.Alignment;
          if ( AColumn.Field is TMemoField ) and not Assigned ( AColumn.Field.OnGetText ) then
            begin
              AColumn.Field.OnGetText := GetTextMemo ;
            end;

         end
       else
         Alignment := taLeftJustify ;
       AutoSize    := False;
       WordWrap    := True ;
       BringToFront ;
     end;

   with FieldsListBox, Items do
     Checked [ AddObject ( AColumn.Title.Caption,
                          TReportColumns.Create ( AColumn , QRLabel,  QRHeaderShape , QRDBText, QRDetailShape ) )
             ] := AColumn .Visible ;

end;

procedure TPrintGridDialog.UpdateReportControls;
var
 ColumnLeftPos, ColumnWidth : integer ;
 ColumnVisible : boolean ;
 QRLabel  : TQRLabel  ;
 QRDBText : TQRDBText  ;

 procedure SetQRPostition ( AReportColumn : TReportColumns ) ;
 var
   IterateColumns : integer ;
 begin
   ColumnLeftPos := 0 ;
   IterateColumns := 0 ;

   while IterateColumns < AReportColumn.GridColumn.Index do
     begin
        if IterateColumns < AReportColumn.GridColumn.Index then
          begin
            if TDBGrid ( AReportColumn.GridColumn.Grid ).Columns[ IterateColumns ].Visible then
               ColumnLeftPos := ColumnLeftPos + TDBGrid ( AReportColumn.GridColumn.Grid ).Columns[ IterateColumns ].Width ;
            Inc ( IterateColumns ) ;
          end ;
     end;

   with TDBGrid ( AReportColumn.GridColumn.Grid ).Columns[ IterateColumns ] do
     begin

       // Header ....

       AReportColumn.QRHeaderShape.Left      := ColumnLeftPos + Width ;
       AReportColumn.QRHeaderShape.Height    := rbColumnHeader.Height  ;
       AReportColumn.QRHeaderShape.Visible   := Visible ;
       AReportColumn.QRHeaderShape.Enabled   := Visible ;

       AReportColumn.QRLabel.Visible         := Visible ;
       AReportColumn.QRLabel.Enabled         := Visible ;
       AReportColumn.QRLabel.Left            := ColumnLeftPos + 2 ;
       AReportColumn.QRLabel.Width           := Width - 4 ;
       AReportColumn.QRLabel.Height          := rbColumnHeader.Height - 3 ;
       AReportColumn.QRLabel.Color           := Title.Color ;


       //++KIQ - qrbug a regport label only change Caption/Font if it's visible
       if AReportColumn.QRLabel.Visible then
         begin
           FPageOverflow := (AReportColumn.QRLabel.Left + AReportColumn.QRLabel.Width > rbColumnHeader.Width) ;
           AReportColumn.QRLabel.Caption         := Title.Caption ;
           //AReportColumn.QRLabel.Font.Assign( Title.Font );
           AReportColumn.QRLabel.Font.Name  := 'Arial' ;
           AReportColumn.QRLabel.Font.Style := [fsBold] ;
           AReportColumn.QRLabel.Parent := rbColumnHeader ;
         end
       else
           AReportColumn.QRLabel.Parent := nil ;

       // Detail ...
       AReportColumn.QRDetailShape.Left      := ColumnLeftPos + Width ;
       AReportColumn.QRDetailShape.Height    := rbDetail.Height  ;
       AReportColumn.QRDetailShape.Visible   := Visible ;
       AReportColumn.QRDetailShape.Enabled   := Visible ;


       AReportColumn.QRDBText.Left      := ColumnLeftPos + 2;
       AReportColumn.QRDBText.Height    := rbDetail.Height - 5 ;
       AReportColumn.QRDBText.Width     := Width - 4 ;
       AReportColumn.QRDBText.Color     := Color ;
       AReportColumn.QRDBText.Alignment := Alignment;
       AReportColumn.QRDBText.Visible   := Visible ;
       AReportColumn.QRDBText.Enabled   := Visible ;

       if AReportColumn.QRDBText.Visible then
         begin
           if Assigned ( Field ) then
              AReportColumn.QRDBText.Caption  := Field.Text
           else
             AReportColumn.QRDBText.Caption  :=  '' ;
           AReportColumn.QRDBText.Font.Assign( Font );
           AReportColumn.QRDBText.Font.Name  := 'Arial' ;  //-- clinica
           AReportColumn.QRDBText.Parent := rbDetail ;
         end
       else
           AReportColumn.QRDBText.Parent := nil ;

       AReportColumn.QRHeaderShape.BringToFront ;
       AReportColumn.QRDetailShape.BringToFront ;
     end;
 end ;

var
  LXLColumn : integer ;
  LReportColumn : TReportColumns ;
begin

 //  QuickRep.Page.PaperSize

   LXLColumn := 0 ;
   QuickRep.ReportTitle := FGridReport.Title ;

   if FGridReport.PageLayout = grplPortrait then
       QuickRep.Page.Orientation := poPortrait
   else
       QuickRep.Page.Orientation := poLandscape ;

   with FieldsListBox, Items do
     for var IterateColumns := 0 to Count - 1 do
      begin
       LReportColumn := TReportColumns ( Objects[ IterateColumns ] ) ;
       if LReportColumn.QRLabel.Visible then
         begin
          Inc ( LXLColumn ) ;
          LReportColumn.QRLabel.XLColumn       := LXLColumn ;
          LReportColumn.QRHeaderShape.XLColumn := LXLColumn ;
          LReportColumn.QRDBText.XLColumn      := LXLColumn ;
          LReportColumn.QRDetailShape.XLColumn := LXLColumn ;
         end;
       SetQRPostition ( LReportColumn ) ;
      end;

end;


procedure TPrintGridDialog.UpdateWarningLabels;
begin
   WarningPrintLabel.Visible := FPageOverflow ;
end;

function TPrintGridDialog.UUID ( AUseIntanceName : string = '' ): string;
begin
   if AUseIntanceName = '' then
     begin
       if Assigned ( GetParentForm ( FGridSource {$IFDEF DELPHI2009_UP}, False {$ENDIF} ) ) then
          AUseIntanceName := GetParentForm ( FGridSource{$IFDEF DELPHI2009_UP}, False {$ENDIF} ).ClassName + '.' + FGridSource.Name
       else
          AUseIntanceName := FGridSource.Owner.ClassName + '.' + FGridSource.Name ;
     end ;

   Result := AnsiUpperCase ( AUseIntanceName ) ;
end;


procedure TPrintGridDialog.PreviewDBGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  MoveColumnsListBoxItem(FromIndex,ToIndex);
end;

procedure TPrintGridDialog.PreviewDBGridColumnResized(Grid: TJvDBGrid; ACol, NewWidth: Integer);
begin
  UpdateReportControls;
  UpdateWarningLabels;
end;

destructor TPrintGridDialog.Destroy;
var
  ev : ^TFieldGetTextEvent ;

  (*
  function IsGetText ( FEV : ^TFieldGetTextEvent ) : boolean ;
    begin
      Result := FEV = ev ;
    end ;
  *)
begin
  self.SaveGridReport ;

  for var x := 0 to FGridReport.Columns.Count - 1 do
    begin
       if  Assigned ( FGridReport.Columns[ x ].Field )
       and Assigned ( FGridReport.Columns[ x ].Field.OnGetText )
       and ( GetMethodProp(FGridReport.Columns[ x ].Field, 'OnGetText').Code = MethodAddress ( 'GetTextMemo' ) ) then
          FGridReport.Columns[ x ].Field.OnGetText := nil ;
    end;


  if Assigned ( FGridReport ) then
    FGridReport.Free ;

  inherited;
end;

procedure TPrintGridDialog.FormPaint(Sender: TObject);
begin
   self.Canvas.Brush.Style := bsSolid ;
   self.Canvas.Brush.Color := clSilver ;
   self.Canvas.FillRect( ClientRect );
end;


function TPrintGridDialog.GetCaptionFont(Font: TFont): string;
begin
    Result := Font.Name + ', ' + IntToStr(Font.Size);
end;


function TPrintGridDialog.GetFileName: string;
var
   aTempPath : array [ 0..MAX_PATH ] of char ;
   cFileName : string ;
begin
   GetTempPath ( MAX_PATH - 1, aTempPath ) ;

   cFileName := FGridReport.Title ;
   if cFileName = '' then
      cFileName := FOriginalTitle ;
   if cFileName = '' then
      cFileName := 'Relatório' ;

   cFileName := StringReplace( cFileName, '/', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '\', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, ':', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '*', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '?', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '"', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '<', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '>', '', [rfReplaceAll] ) ;
   cFileName := StringReplace( cFileName, '|', '', [rfReplaceAll] ) ;

   cFileName := format ( '%s%s', [ aTempPath, Trim ( cFileName ) ] ) ;
   Result := cFileName ;
end;

procedure TPrintGridDialog.GetTextMemo(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := Sender.AsString ;
end;

function TPrintGridDialog.LoadGridReport: boolean;
var
  Doc: TNativeXml;
  XMLColumns : TXmlNode ;
  Writer: TsdXmlObjectWriter;
  Reader: TsdXmlObjectReader;
  XMLStream : string ;
begin

  Result := False ;

  if not Assigned ( PrintGridStorage ) then
     exit ;

  XMLStream := PrintGridStorage.LoadGridReport( UUID ) ;
  if XMLStream = '' then
     exit ;

  Doc := TNativeXml.Create(Self);
  try
    // Read the XML from the memo
    Doc.ReadFromString( XMLStream );
    // Create Object reader
    Reader := TsdXmlObjectReader.Create;
    try
      Reader.ReadObject(  Doc.Root, FGridReport );
    finally
      Reader.Free;
    end;
    Result := True ;
  finally
    Doc.free
  end;
end;

procedure TPrintGridDialog.actCancelExecute(Sender: TObject);
begin
   actConfig.Visible := True ;
   if PageControl.ActivePage = TabSheetConfigurar then
     begin
       FDontSaveConfig := True ;
       PageControl.ActivePage := TabSheetImprimir ;
       exit ;
     end;

  modalResult := mrCancel ;
end;

procedure TPrintGridDialog.actColumnDownExecute(Sender: TObject);
begin
   MoveColumnsListBoxItem(FieldsListBox.ItemIndex, FieldsListBox.ItemIndex + 1 );
end;

procedure TPrintGridDialog.actColumnDownUpdate(Sender: TObject);
begin
  actColumnDown.Enabled := ( FieldsListBox.ItemIndex > -1 )  and ( FieldsListBox.ItemIndex < FieldsListBox.Count - 1 ) ;
end;

procedure TPrintGridDialog.actColumnUpExecute(Sender: TObject);
begin
   MoveColumnsListBoxItem(FieldsListBox.ItemIndex, FieldsListBox.ItemIndex - 1);
end;

procedure TPrintGridDialog.actColumnUpUpdate(Sender: TObject);
begin
  actColumnUp.Enabled := FieldsListBox.ItemIndex > 0 ;
end;

procedure TPrintGridDialog.actCommentDownExecute(Sender: TObject);
begin
  MoveCommentsListBoxItem (CommentsListBox.ItemIndex, CommentsListBox.ItemIndex + 1);
end;

procedure TPrintGridDialog.actCommentDownUpdate(Sender: TObject);
begin
  inherited;
  actColumnDown.Enabled := ( CommentsListBox.ItemIndex > -1 )  and ( CommentsListBox.ItemIndex < CommentsListBox.Count - 1 ) ;
end;

procedure TPrintGridDialog.actCommentUpExecute(Sender: TObject);
begin
  MoveCommentsListBoxItem (CommentsListBox.ItemIndex, CommentsListBox.ItemIndex - 1);
end;

procedure TPrintGridDialog.actCommentUpUpdate(Sender: TObject);
begin
  actColumnUp.Enabled := CommentsListBox.ItemIndex > 0 ;
end;

procedure TPrintGridDialog.actConfigExecute(Sender: TObject);
begin
  PageControl.ActivePage := TabSheetConfigurar ;
  actConfig.Visible := False ;
  CommuteControls ;

end;

procedure TPrintGridDialog.actDropColumnExecute(Sender: TObject);
var
  Idx : integer ;
begin
  Idx := FieldsListBox.ItemIndex ;
  TReportColumns ( FieldsListBox.Items.Objects[ Idx ] ).GridColumn.Free ;
  TReportColumns ( FieldsListBox.Items.Objects[ Idx ] ).Free ;
  FieldsListBox.Items.Delete( Idx );
  FieldsListBox.ItemIndex := Min ( Idx, FieldsListBox.Items.Count - 1 ) ;
  UpdateEditors ;
end;

procedure TPrintGridDialog.actDropColumnUpdate(Sender: TObject);
begin
  actDropColumn.Enabled := ( FieldsListBox.ItemIndex > 0 )
     and not Assigned ( TReportColumns ( FieldsListBox.Items.Objects[ FieldsListBox.ItemIndex ] ).GridColumn.Field ) ;
end;

procedure TPrintGridDialog.actDropCommentExecute(Sender: TObject);
begin
  if CommentsListBox.ItemIndex > -1 then
    CommentsListBox.Items.Delete( CommentsListBox.ItemIndex ) ;
end;

procedure TPrintGridDialog.actNewColumnExecute(Sender: TObject);
var
  ColumnTitle : string ;
  AColumn : TColumn ;
begin
  ColumnTitle := InputBox ( 'Nova coluna', 'Título', '' ) ;
  if ColumnTitle = '' then
     Exit ;
  AColumn := TColumn.Create( PreviewDBGrid.Columns ) ;
  AColumn.Title.Caption := ColumnTitle ;
  AColumn.Color := clWhite ;
  CreateControl ( AColumn ) ;
end;

procedure TPrintGridDialog.actNewCommentExecute(Sender: TObject);
begin
  CommentsListBox.Items.Add( FormatDateTime ( 'dd.mm.yyyy', Date ) ) ;
end;

procedure TPrintGridDialog.actPrintExportExecute(Sender: TObject);
begin
   actConfig.Visible := True ;
   if PageControl.ActivePage = TabSheetConfigurar then
     begin
       FDontSaveConfig := False ;
       PageControl.ActivePage := TabSheetImprimir ;
       CommuteControls ;
       exit ;
     end;

   PreviewDBGrid.DataSource.DataSet.DisableControls ;
   PreviewDBGrid.DataSource.DataSet.First ;
   QuickRep.DataSet := PreviewDBGrid.DataSource.DataSet ;
   if RadioButtonPrint.Checked then
      DoPrint
   else
      DoExport ;
   PreviewDBGrid.DataSource.DataSet.EnableControls ;
end;

procedure TPrintGridDialog.actPrintExportUpdate(Sender: TObject);
begin
//   actPrintExport.Enabled := ( PageControl.ActivePage = TabSheetImprimir ) ;

   if PageControl.ActivePage = TabSheetImprimir then
     begin
       if RadioButtonPrint.Checked then
         begin
          if PrintPreviewCheckBox.Checked then
            actPrintExport.Caption := 'V&isualizar'
          else
            actPrintExport.Caption := '&Imprimir'
         end
       else
          actPrintExport.Caption := '&Exportar' ;
     end
   else
          actPrintExport.Caption := '&Salvar' ;


end;

procedure TPrintGridDialog.AutoAdjust ( AColumns : TDBGridColumns ; AMaxWidth : integer );
var
  W : integer;
  WidthTotal, MinWidth, columnsCount : integer ;
  Acerto, P, PMin : double ;
begin

  with AColumns do
  try

    WidthTotal := 0;
    columnsCount := 0;
    MinWidth := 99999 ;
    With AColumns  do
      For var i := 0 to Count - 1 do
        if ( Items[i].Visible ) then
          begin
              WidthTotal := WidthTotal + Items[i].Width ;
              MinWidth := Min ( MinWidth, Items[i].Width ) ;
              inc ( columnsCount ) ;
          end ;

    PMin := MinWidth / WidthTotal ;
    Acerto := (PMin / (columnsCount)) ;
    PMin := PMin + Acerto ;

    With AColumns  do
      for var i := 0 to Count - 1 do
        if ( Items[i].Visible ) then
          begin
            P := ((Items[i].Width / WidthTotal) - Acerto) ;
            P := Max ( P, PMin ) ;
            W := Trunc ( AMaxWidth * P );
            Items[i].Width := W;
          end;
  except
  end;

end;


procedure WriteComponentToStream(ARoot: TComponent; AComponent: TComponent; AStream: TStream);
var
  wWriter: TWriter;
begin
  wWriter := TWriter.Create(AStream, 4096);
  try
    wWriter.Root := ARoot;
    wWriter.WriteSignature;
    wWriter.WriteComponent(AComponent);
    wWriter.WriteListEnd;
  finally
    wWriter.Free;
  end;
end;

(*
procedure SaveComponentToFile(Component: TComponent; const FileName: TFileName);
var
  FileStream : TFileStream;
  MemStream : TMemoryStream;
begin
  MemStream := nil;

  if not Assigned(Component) then
    raise Exception.Create('Component is not assigned');

  FileStream := TFileStream.Create(FileName,fmCreate);
  try
    MemStream := TMemoryStream.Create;
    MemStream.WriteComponent(Component);
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, FileStream);
  finally
    MemStream.Free;
    FileStream.Free;
  end;
end;
*)

procedure SaveComponentToFile( ARoot : TComponent ; AComponent: TComponent; const FileName: TFileName);
var
  FileStream : TFileStream;
  MemStream : TMemoryStream;
begin
  MemStream := nil;

  if not Assigned(AComponent) then
    raise Exception.Create('Component is not assigned');

  FileStream := TFileStream.Create(FileName,fmCreate);
  try
    MemStream := TMemoryStream.Create;
    WriteComponentToStream( ARoot, AComponent, MemStream ) ;
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, FileStream);
  finally
    MemStream.Free;
    FileStream.Free;
  end;
end;

procedure TPrintGridDialog.Button1Click(Sender: TObject);
begin
  SaveComponentToFile ( QuickRep, QuickRep, 'T:\QR1.TXT'  ) ;
end;

procedure TPrintGridDialog.ExcelExportFormatRadioButtonClick(Sender: TObject);
begin
   if ExcelExportFormatRadioButton.Checked then
     begin
        if FExportFileName <> '' then
           FExportFileName := ChangeFileExt ( FExportFileName, '.xlsx' ) ;
     end
   else
     begin
        if FExportFileName <> '' then
          FExportFileName := ChangeFileExt ( FExportFileName, '.pdf' )
     end
end;

class procedure TPrintGridDialog.Execute ( AGridSource : TDBGrid ; ATitle : String = '' ; ALegend : string = '';
                                                  AExibeTotalRegistro: Boolean = True; ADescription : string = '';
                                                  ADetailBeforePrint : TProcedureTypeDetailBeforePrint = nil ) ;
var
  c :  TComponent ;
  q :  TControl ;
  rbSummary : TQRBand ;
  _qrlLegenda : TQRLabel ;
  _qrlLegenda1 : TQRLabel ;
  _qrlQuantidadeRegistro : TQRLabel ;
  _qrlDescricao : TQRLabel ;
  total_registros: String;
begin

    With TPrintGridDialog.Create ( nil ) do
     try
        InternalData := TClientDataSet.Create ( nil ) ;

        c := TComponentClass ( GetClass ( 'TfqrSYS_BaseReport' ) ).Create ( nil )   ;

        QuickRep        := TQuickRep ( c.FindComponent( 'QuickRep'       ) ) ;
        QuickRep.parent := ScrollBoxImprimir ;

        QuickRep.Left := 0 ;
        QuickRep.Top  := 0 ;
        rbColumnHeader := TQRBand  ( c.FindComponent( 'rbColumnHeader' ) ) ;
        rbDetail       := TQRBand  ( c.FindComponent( 'rbDetail'       ) ) ;
        if not Assigned( rbDetail.BeforePrint ) then
          rbDetail.BeforePrint := ADetailBeforePrint;

        rbSummary      := TQRBand  ( c.FindComponent( 'rbSummary'       ) ) ;
        rbSummary.Enabled := True ;
        rbSummary.Height:= 20;
        if ADescription <> '' then
         begin
          _qrlDescricao := TQRLabel ( c.FindComponent( '_qrlDescricao'    ) ) ;
          if Assigned( _qrlDescricao ) then
           begin
             _qrlDescricao.Caption := ADescription;
             _qrlDescricao.AutoSize := False;
             _qrlDescricao.Width := 355;
             _qrlDescricao.Height:= 52;
           end;
         end;

        if ( ALegend <> '' ) then
         begin

          _qrlLegenda    := TQRLabel ( c.FindComponent( '_qrlLegenda'    ) ) ;
          _qrlLegenda1    := TQRLabel ( c.FindComponent( '_qrlLegenda1'    ) ) ;
          _qrlLegenda.AutoStretch := False ;
          _qrlLegenda1.AutoStretch := False ;
          _qrlLegenda.AutoSize:= False;
          _qrlLegenda1.AutoSize:= False;
          _qrlLegenda.Caption := ALegend ;
          _qrlLegenda1.Caption := ALegend ;
          _qrlLegenda.Height:= 45;
          _qrlLegenda1.Height:= 45;
          _qrlLegenda.Parent := rbSummary ;
          _qrlLegenda1.Parent := rbSummary ;
          _qrlLegenda.Width:= rbSummary.Width - 20;
          _qrlLegenda1.Width:= rbSummary.Width - 20;
          rbSummary.Height:= _qrlLegenda1.Height+20;
          _qrlLegenda.Top := 10 ;
          _qrlLegenda1.Top := 10 ;
          _qrlLegenda.Left:= 10;
          _qrlLegenda1.Left:= 10;

         end;

         {Total de registros}
         _qrlQuantidadeRegistro := TQRLabel ( c.FindComponent( 'qrQuantidadeRegistros' ) ) ;
         if Assigned( _qrlQuantidadeRegistro ) then
           begin
            _qrlQuantidadeRegistro.Caption:= '';
            if Assigned( AGridSource.DataSource.DataSet ) and AExibeTotalRegistro then
              begin
                if AGridSource.DataSource.DataSet.ClassType = TClientDataSet then
                  begin
                    total_registros:= IntToStr( TClientDataSet( AGridSource.DataSource.DataSet ).RecordCount );
                    _qrlQuantidadeRegistro.Caption:= Format( 'Total de registros : %s' , [total_registros] );
                    _qrlQuantidadeRegistro.Top:= rbSummary.Height - (_qrlQuantidadeRegistro.Height + 2);
                  end;
              end;
           end;




        FOriginalTitle := ATitle ;
        GridSource    := AGridSource ;
        showModal ;
      finally
        c.Free ;
        free ;
      end;
end;

procedure TPrintGridDialog.DoExportToExcel( AFileName : string ) ;
var
  Linha, Coluna : integer ;
  PathToImage : string;
  PicProps: IImageProperties;
  fmt: TFlxFormat;
  XFTitle, XFCell : integer;
  Landscape: boolean;
//  XLSAdpater1 : TXLSAdapter ;
//  XLS: TFlexCelImport ;
   XLS : TExcelFile ;
  LDBGrid      : TDBGrid ;
  LColumns     : TDBGridColumns ;
  LColumn      : TColumn ;
  LColumnCount : integer ;

  procedure AddTitle( l, c : integer ; AColumn : TColumn ; Width : integer );
  begin

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat ;  //Always initilize the record with an existing format.
    fmt.Font.Name := AColumn.Title.Font.Name ;

    fmt.Font.Color           := AColumn.Title.Font.Color ;
    fmt.FillPattern.Pattern  := TFlxPatternStyle.LightDown;
    fmt.FillPattern.FgColor  := AColumn.Title.Color;
    fmt.FillPattern.BgColor  := AColumn.Title.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack ;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack ;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack ;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack ;
  	XFTitle := Xls.AddFormat(fmt);

    XLS.SetCellValue( l,c, AColumn.Title.Caption ) ;
    XLS.SetCellFormat( l,c, XFTitle ) ;
    //sh.Cols  [c].Width := Width;
  end;

  procedure AddDate( l, c : integer ; AColumn : TColumn ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name             := AColumn.Font.Name ;
    fmt.Font.Color            := AColumn.Font.Color ;
    fmt.Borders.Left.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color    := clBlack ;
    fmt.Borders.Top.Style     := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color     := clBlack ;
    fmt.Borders.Bottom.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color  := clBlack ;
    fmt.Borders.Right.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color   := clBlack ;
    fmt.Format := 'dd/mm/yyyy' ;

  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AColumn.Field ) and ( not AColumn.Field.IsNull ) then
       XLS.SetCellValue( l,c, AColumn.Field.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;

  end;

  procedure AddTime( l, c : integer ; AColumn : TColumn ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin ;
    fmt.Borders.Left.Color   := clBlack  ;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin ;
    fmt.Borders.Top.Color    := clBlack  ;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin ;
    fmt.Borders.Bottom.Color := clBlack  ;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin ;
    fmt.Borders.Right.Color  := clBlack  ;
    fmt.Format := 'hh\:mm\:ss' ;

  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AColumn.Field ) and ( not AColumn.Field.IsNull )  then
       XLS.SetCellValue( l,c, AColumn.Field.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddDateTime( l, c : integer ; AColumn : TColumn ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat ;  //Always initilize the record with an existing format.
    fmt.Font.Name            := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;

    fmt.Format := 'dd/mm/yyyy hh\:mm\:ss' ;
    if    Assigned ( AColumn.Field )
      and ( not AColumn.Field.IsNull )
      and ( AColumn.Field.asDateTime = Trunc ( AColumn.Field.asDateTime ) ) then
      fmt.Format := 'dd/mm/yyyy' ;


  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AColumn.Field ) and ( not AColumn.Field.IsNull ) then
       XLS.SetCellValue( l,c, AColumn.Field.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddSingleText( l, c : integer ; AText : string ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    //fmt.Font.Name := AColumn.Font.Name ;
    //fmt.Font.Color := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
  	XFCell := Xls.AddFormat(fmt);

       XLS.SetCellValue( l,c, AText ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddText( l, c : integer ; AColumn : TColumn ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name            := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AColumn.Field ) then
       XLS.SetCellValue( l,c, AColumn.Field.DisplayText ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;


  procedure AddLargeText( l, c : integer ; AColumn : TColumn  ; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name            := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
    fmt.WrapText := True ;

  	XFCell := Xls.AddFormat(fmt);
    if Assigned ( AColumn.Field ) then
       XLS.SetCellValue( l, c, AColumn.Field.Text ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddInteger( l, c : integer ; AColumn : TColumn  ; const format : string; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name            := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
    fmt.Format := Format ;
//    fmt.HAlignment

  	XFCell := Xls.AddFormat(fmt);
    if Assigned ( AColumn.Field ) and ( not AColumn.Field.IsNull ) then
       XLS.SetCellValue( l, c, AColumn.Field.asInteger ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddFloat( l, c : integer ; AColumn : TColumn  ; const format : string; Width : integer );
  begin
    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
    fmt.Font.Name            := AColumn.Font.Name ;
    fmt.Font.Color           := AColumn.Font.Color ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
    fmt.Format := Format ;
//    fmt.HAlignment

  	XFCell := Xls.AddFormat(fmt);
    if Assigned ( AColumn.Field ) and ( not AColumn.Field.IsNull ) then
      if Pos ( '%', Format ) = 0  then
       XLS.SetCellValue( l, c, AColumn.Field.asFloat )
      else
       XLS.SetCellValue( l, c, AColumn.Field.asFloat / 100 ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

begin
//  XLSAdpater1 := TXLSAdapter.Create ( nil ) ;
//  XLSAdpater1.AllowOverwritingFiles := True ;
//  XLS := TFlexCelImport.Create ( nil ) ;
//  XLS.Adapter := XLSAdpater1 ;


	//Create a new file. We could also open an existing file with Xls.Open
//	Xls.NewFile(1);

  Xls := TXlsFile.Create( 1 {GridWorkbook.PageCount}, True ) ;

//  //Set some cell values.
//  Xls.CellValue[1,1] := 'Hello to everybody';


	//Get path for images from disk.
//  PathToImage := SearchPathStr(XLSAdapter1.BasePathToOpen, 'poweredbyflexcel.png'); //BasePathToOpen might be not empty if we are running from maindemo.

  //Add a new image on cell E5
//  PicProps.Col1:=6;PicProps.Row1:=2;PicProps.Col2:=7;picProps.Row2:=4;
//  PicProps.dx1:=0;PicProps.dy1:=0;
//  PicProps.dx2:=512; // a column has 1024 units, so 512 means half of the cell.
//  PicProps.dy2:=128;  //a row has 256 units, so 128 is half of the row.
//  PicProps.FileName:=''; //we don't really need to set a filename, since it is not used by Excel. But it must be initialized.

//  Xls.AddPicture(LoadImage(PathToImage),xli_Png ,PicProps);
//  //Merge cells
//	Xls.MergeCells(5,1,10,6);
	//Note how this one merges with the previous range, creating a final range (5,1,15,6)
//	Xls.MergeCells(10,6,15,6);

	//Make the page print in landscape or portrait mode
//	Landscape := false;  //In this example we will just hard-code it to landscape, in a real app, landscape might have any value.
  if (Landscape) then
  begin
    Xls.PrintOptions := Xls.PrintOptions - [ TPrintOptions.Orientation, TPrintOptions.NoPls ] ;
  end
	else
	begin
		//ALWAYS SET NOPLS TO 0 BEFORE CHANGING THE OTHER OPTIONS.
		Xls.PrintOptions := Xls.PrintOptions - [ TPrintOptions.NoPls ];
		Xls.PrintOptions := Xls.PrintOptions + [ TPrintOptions.Orientation ];
	end;

  xls.ScreenScaling := 100 ;
  xls.PrintScale    := 100 ;

  AddSingleText( 1, 1, FGridReport.FTitle, 0 ) ;
  AddSingleText( 2, 1, 'Emissão : ' + FormatDateTime ('dd.mm.yyyy - hh:nn', Now ), 0  ) ;

  Linha := 4 ;
  Coluna := 1 ;

  LDBGrid := PreviewDBGrid ;
  LColumns := LDBGrid.Columns ;
  LColumnCount := LColumns.Count ;
  for var x := 0 to LColumnCount - 1 do
    if PreviewDBGrid.Columns[ x ].Visible then
      begin
       LColumn := LColumns[ x ] ;
       AddTitle( Linha, Coluna, LColumn, LColumn.Width * 43 );
       Inc ( Coluna ) ;
      end ;

  Linha := 5 ;
  with PreviewDBGrid.DataSource.DataSet do
    begin
      first ;
      while not eof do
        begin
          Coluna := 1 ;
          for var x := 0 to LColumnCount -1 do
            begin
              LColumn := LColumns[ x ] ;
              if LColumn.Visible then
                begin
                 if not Assigned ( LColumn.Field  )  then
                    AddText ( linha, coluna,  LColumn, LColumn.Width * 43  )
                 else if LColumn.Field is TIntegerField then
                   AddInteger ( linha, coluna, LColumn,
                    StrUtils.IfThen ( TIntegerField( LColumn.Field ).DisplayFormat = '', '0', TIntegerField( LColumn.Field ).DisplayFormat ), LColumn.Width * 43  )
                 else if LColumn.Field is TFloatField  then
                   AddFloat ( linha, coluna, LColumn,
                    StrUtils.IfThen ( TFloatField( LColumn.Field ).DisplayFormat = '', '#,0.00', TFloatField( LColumn.Field ).DisplayFormat ), LColumn.Width * 43  )
                 else if LColumn.Field is TDateField  then
                    AddDate ( linha, coluna,  LColumn, LColumn.Width * 43  )
                 else if LColumn.Field is TTimeField  then
                    AddTime ( linha, coluna,  LColumn, LColumn.Width * 43  )
                 else if ( LColumn.Field is TDateTimeField  )
                     or  ( LColumn.Field is TSQLTimeStampField ) then
                    AddDateTime ( linha, coluna,  LColumn, LColumn.Width * 43  )
                 else
                   AddText ( linha, coluna, LColumn, LColumn.Width * 43 ) ;
                 Inc ( Coluna ) ;
                end ;
            end;
            next ;
            Inc ( Linha ) ;
        end ;
    end ;

  Xls.Save( AFileName ); //No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.

  XLS.free ;
//  XLSAdpater1.free ;

end;

procedure TPrintGridDialog.ExportToExcel;
var
  fileName : string ;
begin
  fileName := changeFileExt ( FExportFileName, '.xlsx' ) ;
  self.DoExportToExcel( fileName );
  if ExportViewCheckBox.Checked then
     ShellExecute(0,'open',PChar(fileName),'','',SW_SHOWNORMAL);
end;

procedure TPrintGridDialog.ExportToMail;
var
  cFileName : string ;
begin

  if ExcelExportFormatRadioButton.Checked then
    begin
      cFileName := GetFileName + '.xlsx' ;
      DoExportToExcel( cFileName ) ;
    end
  else
    begin
      cFileName := GetFileName + '.pdf' ;
      QuickRep.Prepare ;
      PrintToSynPDF ( QuickRep, cFileName, False ) ;
    end ;

  with TMailSuppl.GlobalMail do
     begin
      if Subject = '' then
         Subject := FGridReport.Title
      else
         Subject := Subject + ' - ' + FGridReport.Title ;

      Attachs.Add( cFileName ) ;
      Send ;
     end ;

end;


procedure TPrintGridDialog.ExportToPDF;
var
  cFileName : string ;
begin
  QuickRep.PrinterSettings.PrinterIndex := PrinterNamesComboBox.ItemIndex ;
  QuickRep.PrinterSettings.Copies := 1 ;

  cFileName := ChangeFileExt ( FExportFileName, '.pdf' ) ;
  QuickRep.Prepare ;
  PrintToSynPDF ( QuickRep, cFileName, False ) ;

  if ExportViewCheckBox.Checked then
     ShellExecute(0,'open',PChar(cFileName),'','',SW_SHOWNORMAL);

end;

class procedure TPrintGridStorager.SetStorage(APrintGridStorage: IPrintGridStorage) ;
begin
   PrintGridStorage :=  APrintGridStorage ;
end;



{ TGridReport }

constructor TGridReport.Create;
begin
   FPrintPreview := True ;
   FExportView   := True ;
   FPrintCopies  := 1 ;
   FColumns := TDBGridColumns.Create( nil, TColumn );
end;


procedure TGridReport.SetColumns(const Value: TDBGridColumns);
begin
  FColumns.Assign( Value );
end;

destructor TGridReport.Destroy;
begin
  FColumns.Free
end;

destructor TReportColumns.Destroy;
begin
  QRLabel.Free ;
  QRHeaderShape.Free ;
  QRDBText.Free ;
  QRDetailShape.Free ;
  inherited;
end;

initialization
  RegisterClass ( TPrintGridDialog )

end.
