unit ClAg5.Utils.Excel.Viewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AdvSprd, AdvPars,
  UAdvGridExcelImport, UAdvGridExcelExport, Vcl.ImgList, Vcl.ComCtrls,
  System.ImageList;

  (*
  AdvGrid,
  AdvSprd, tmsAdvGridExcel, AdvGridWorkbook, MiscMathLib, AdvPars, ESBMathsLib,
  UAdvGridExcelImport,
  UAdvGridExcelExport,
  ;
  *)
type
  TFrame1 = class(TFrame)
    GridWorkbook: TPageControl;
    ImageList1: TImageList;
    AdvGridExcelExport1: TAdvGridExcelExport;
    AdvGridExcelImport1: TAdvGridExcelImport;
    GridBinder1: TGridBinder;
  private
    { Private declarations }
    FGrid:TAdvSpreadGrid ;
    procedure CreateSheet ( ASheetName : string ) ;
  public
    { Public declarations }
    procedure LoadXLS ( AFileName : string ) ;
    procedure SaveXLS ( AFileName : string ) ;
  end;

implementation

{$R *.dfm}

uses
  VCL.FlexCel.Core,
  FlexCel.XlsAdapter ;

{ TFrame1 }

procedure TFrame1.CreateSheet(ASheetName: string);
var
  s : TTabSheet ;
begin
   FGrid := TAdvSpreadGrid.Create( self ) ;
   FGrid.Binder := GridBinder1 ;
   FGrid.AutoRecalc  := False ;
   FGrid.ShowFormula := True ;
  // GridWorkbook
   s := TTabSheet.Create( GridWorkbook );
   s.PageControl := GridWorkbook ;
   s.Caption := ASheetName ;
   FGrid.Parent := s ;
   FGrid.Align  := alClient ;
   FGrid.Width  := s.ClientWidth ;
   AdvGridExcelImport1.AdvStringGrid := FGrid ;

end;

procedure TFrame1.LoadXLS(AFileName: string);
var
  Xls: TExcelFile;
  LSheetName : string ;
begin

  Xls := TXlsFile.Create;

  try
    Xls.Open(AFileName);

    for var s := 1 to Xls.SheetCount do
      begin
        xls.ActiveSheet := s ;
        LSheetName := xls.GetSheetName( s ) ;
        CreateSheet ( LSheetName ) ;
        AdvGridExcelImport1.Import(Xls);
        with GridBinder1.Grids.Add do
           begin
             Grid := FGrid ;
             Name := LSheetName  ;
           end ;
      end;
TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).AutoHeaders := True ;
TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).AutoSizeColumns( False );

TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).Cells[1,1] := 'A' ;
TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).CellProperties[0,1].BrushColor := clRed ;
TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).CellProperties[0,1].BrushStyle := bsSolid ;
//TAdvSpreadGrid (GridBinder1.Grids.Items[0].Grid ).CellProperties[0,0].BrushColor := clRed ;
exit ;
 finally
    FreeAndNil(Xls);
  end;
end;

procedure TFrame1.SaveXLS(AFileName: string);
var
  Xls: TExcelFile;
begin
//TAdvSpreadGrid ( GridWorkbook.Pages[s].Controls[0] ).Recalc

  Xls := TXlsFile.Create( GridWorkbook.PageCount, True ) ;
  try

    for var s := 0 to GridWorkbook.PageCount - 1 do
      begin
       AdvGridExcelExport1.AdvStringGrid := TAdvSpreadGrid ( GridWorkbook.Pages[s].Controls[0] ) ;
       xls.ActiveSheet := s + 1 ;
       xls.SheetName := GridWorkbook.Pages[s].Caption ;
       AdvGridExcelExport1.Export( XLS, UAdvGridExcelExport.TInsertInSheet.Clear ) ;
      end;

    for var s := 0 to GridWorkbook.PageCount - 1 do
      begin
       AdvGridExcelExport1.AdvStringGrid := TAdvSpreadGrid ( GridWorkbook.Pages[s].Controls[0] ) ;
       xls.ActiveSheet := s + 1 ;
       AdvGridExcelExport1.Export( XLS, UAdvGridExcelExport.TInsertInSheet.OverwriteCells ) ;
      end;
    Xls.Save ( AFileName ) ;

  finally
    FreeAndNil(Xls);
  end;
end;

end.
