unit ExportTreeViewToExcel;

interface

uses
  ShellAPI, StrUtils, SysUtils, DateUtils,
  TypInfo, System.RTTI,
  //UFlexCelImport,  UExcelAdapter,
  { XLSAdapter, }
  VCL.FlexCel.Core, FlexCel.XlsAdapter, Graphics,   VirtualTrees
 ;

type
  TValue = System.RTTI.TValue ;
  TFlxFormat = VCL.FlexCel.Core.TFlxFormat ;
  PFlxFormat = ^TFlxFormat ;
  TFlxFontStyles   = VCL.FlexCel.Core.TFlxFontStyles   ;
  TFlxFontStyleSet = VCL.FlexCel.Core.TFlxFontStyleSet ;
  TFlxPatternStyle = VCL.FlexCel.Core.TFlxPatternStyle ;
  TFlxBorderStyle  = VCL.FlexCel.Core.TFlxBorderStyle  ;
  THFlxAlignment   = VCL.FlexCel.Core.THFlxAlignment   ;
  TVFlxAlignment   = VCL.FlexCel.Core.TVFlxAlignment   ;
  TCollapseChildrenMode = VCL.FlexCel.Core.TCollapseChildrenMode;

  TIgnoredErrors   = VCL.FlexCel.Core .TIgnoredErrors   ;
//  CalculatedColumn

  TFormula = VCL.FlexCel.Core .TFormula ;

  IExcelExporter = interface ;

  TProcFor = reference to procedure(
       const AExcelExporter : IExcelExporter
    ;  const Index : integer
    ;  out   ABreak : boolean
  ) ;

  TProcDo = reference to procedure(
       const AExcelExporter : IExcelExporter
  ) ;

  TProcGetValue = reference to procedure(
       const AExcelExporter : IExcelExporter
  ) ;

  IExcelExporter = interface
  ['{704F44B3-DC6D-47F0-A12E-3B803FA4BB29}']
      procedure Export ;
//      function  GetCol : integer ; overload  ;
//      function  GetRow : integer ; overload  ;
      function  Formula( AFormula : string ) : TValue ;
      //IExcelExporter

      function  SetCol(const Value: integer ) : IExcelExporter ;
      function  SetRow(const Value: integer ) : IExcelExporter ;
//      function  Col(const Value : integer )      : IExcelExporter ; overload ;
//      function  Row(const Value: integer = -1 )  : IExcelExporter ; overload ;
      function  GetCol( {out} var ACol : integer )     : IExcelExporter ; overload ;
      function  GetRow( {out} var ARow : integer )     : IExcelExporter ; overload ;
      function  GetCellName(ARow, ACol: integer): string;
      function  GetColName(ACol: integer): string;
      function  MergeCells(
          {const} AFirstRow
              , AFirstCol
              , ALastRow
              , ALastCol: Int32
      ) : IExcelExporter ;
      function  SetValue ( const AValue : TValue ) : IExcelExporter ;
      function  NextCol : IExcelExporter  ;
      function  NextRow : IExcelExporter  ;
      function  PriorCol : IExcelExporter ;
      function  PriorRow : IExcelExporter ;
      function  &For( const AStart, AEnd : integer ; AProcFor : TProcFor ) : IExcelExporter ;
      function  &Do( AProcDo : TProcDo ) : IExcelExporter ;
      function  Format : PFlxFormat ;
      function  AutoFitCols : IExcelExporter ;
      function  SetRowOutlineLevel( ALevel : Integer) : IExcelExporter ; overload ;
      function  SetRowOutlineLevel( ARow1, ARow2, ALevel : Integer) : IExcelExporter ; overload ;
      function CollapseOutlineRows(const level: Integer; const collapseChildren: TCollapseChildrenMode) : IExcelExporter ;
      function SetColWidth( const AWidth : Integer ) : IExcelExporter ;
//      property  Row : integer  read GetRow ; //write SetRow;
//      property  Col : integer  read GetCol ; //write SetCol;
      property  CellName[ARow, ACol : integer] : string  read GetCellName ;
      property  ColName[ACol : integer] : string  read GetColName ;
  end ;

  TExportTreeViewToExcel = class(TInterfacedObject, IExcelExporter)
    private
      XLS : TExcelFile ;
      FFmt : TFlxFormat;
      FRow,
      FCol : integer ;
      FMinRow : integer ;
      FMinCol : integer ;
      FMaxRow : integer ;
      FMaxCol : integer ;

      FVST: TVirtualStringTree ;
      FProcGetValue : TProcGetValue ;
      FFileName     : string ;

      function GetDefaultFormat : TFlxFormat;
      procedure Export ;

      function  SetCol(const Value: integer ) : IExcelExporter ;
      function  SetRow(const Value: integer ) : IExcelExporter ;

//      function  GetCol : integer ; overload  ;
//      function  GetRow : integer ; overload  ;

      //IExcelExporter
//      function  Col( const Value : integer )  : IExcelExporter ; overload ;
//      function  Row( const Value: integer  )  : IExcelExporter ; overload ;
      function  GetCol( {out} var ACol : integer )  : IExcelExporter ; overload ;
      function  GetRow( {out} var ARow : integer )  : IExcelExporter ; overload ;
      function  GetCellName(ARow, ACol: integer): string;
      function  GetColName(ACol: integer): string;
      function  Formula( AFormula : string ) : TValue ;
      function  MergeCells(
          {const} AFirstRow
              , AFirstCol
              , ALastRow
              , ALastCol: Int32
      ) : IExcelExporter ;
      function  SetValue ( const AValue : TValue ) : IExcelExporter ;
      function  NextCol  : IExcelExporter ;
      function  NextRow  : IExcelExporter ;
      function  PriorCol : IExcelExporter ;
      function  PriorRow : IExcelExporter ;
      function  Format : PFlxFormat ;
      function  SetRowOutlineLevel( ALevel : Integer) : IExcelExporter ; overload ;
      function  SetRowOutlineLevel( ARow1, ARow2, ALevel : Integer) : IExcelExporter ; overload ;
      function CollapseOutlineRows(const level: Integer; const collapseChildren: TCollapseChildrenMode) : IExcelExporter ;
      function  AutoFitCols : IExcelExporter ;
      function SetColWidth( const AWidth : Integer ) : IExcelExporter ;
      function  &For( const AStart, AEnd : integer ; AProcFor : TProcFor ) : IExcelExporter ;
      function  &Do( AProcDo : TProcDo ) : IExcelExporter ;
      constructor Create( const AVST: TVirtualStringTree ; const AProcGetValue : TProcGetValue ; const AFileName : string ) ;
    public
      class procedure ExportToExcel(const AVST: TVirtualStringTree ; const AProcGetValue : TProcGetValue ; const AFileName : string ) ;
  end;

implementation

uses WinAPI.Windows ;

procedure DebugMsg(const Msg: String);
begin
//    OutputDebugString(PChar(Msg))
end;
(*

procedure TDRECaixa.EnumerateAccounts;
var
  LData : PDRENodeData ;
begin
  var LCount := 0 ;
  var LNode := DespesaTotal.FirstChild ;
  while Assigned ( LNode )  do
    begin
      if FVST.IsVisible[ LNode ] then
        begin
          Inc ( LCount ) ;
          LData := PDRENodeData( LNode.GetData ) ;
          LData.Descricao := Format ( '6.%d - %s', [ LCount, LData.Descricao ] ) ;
        end;
        LNode := LNode.NextSibling
    end;

  if LCount = 0 then
    exit ;

  LData := PDRENodeData( DespesaTotal.GetData ) ;
  LData.Descricao := Format ( '%s (soma[6.1 à 6.%d] - 6.%d - 6.%d)', [ LData.Descricao, LCount - 2, LCount - 1, LCount ] ) ;
end;


*)

{ TExportTreeViewToExcel }

function TExportTreeViewToExcel.&For(const AStart, AEnd: integer; AProcFor: TProcFor): IExcelExporter;
begin
  DebugMsg( '&For' ) ;
  Result := self ;
  var LBreak := False ;
  for var I := AStart to AEnd do
    begin
      AProcFor ( self, I, LBreak ) ;
      if LBreak then
        Break ;
    end ;
end;

function TExportTreeViewToExcel.&Do(AProcDo: TProcDo): IExcelExporter;
begin
  DebugMsg( '&Do' ) ;
  Result := self ;
  AProcDo ( self ) ;
end;
(*
function TExportTreeViewToExcel.Col(const Value: integer): IExcelExporter;
begin
  Result := self ;
  DebugMsg( 'Col( ' + Value.ToString + ') : IExcelExporter' ) ;
  if Value > 0 then
    begin
     SetCol( Value ) ;
    end;
end;
*)
function TExportTreeViewToExcel.AutoFitCols: IExcelExporter;
begin
  for var x := FMinCol to FMaxCol do
     XLS.AutoFitCol( x, False, 1.10 ) ;
end;

function TExportTreeViewToExcel.CollapseOutlineRows(const level: Integer; const collapseChildren: TCollapseChildrenMode): IExcelExporter;
begin
   Result := Self ;
   XLS.CollapseOutlineRows( level, collapseChildren ) ;
end;

constructor TExportTreeViewToExcel.Create(const AVST: TVirtualStringTree; const AProcGetValue: TProcGetValue; const AFileName: string);
begin
   inherited Create ;

   FRow    := 1 ;
   FCol    := 1 ;
   FMinRow := 1048576 + 1 ;
   FMinCol :=   16384 + 1 ;
   FMaxRow := 0 ;
   FMaxCol := 0 ;

   FVST          :=  AVST ;
   FProcGetValue := AProcGetValue ;
   FFileName     := AFileName ;;
end;

procedure TExportTreeViewToExcel.Export ;
var
//  PathToImage : string;
//  PicProps: IImageProperties;

  XFTitle : integer;
  Landscape: boolean;
//  XLSAdpater1 : TXLSAdapter ;
//  XLS: TFlexCelImport ;
//  LColumnCount : integer ;

  procedure AddTitle( l, c : integer ; ATitleCaption: String );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    //fmt.Font.Name := 'Verdana' ;
    XFTitle := Xls.AddFormat(FFmt);

    XLS.SetCellValue( l,c, ATitleCaption ) ;
    XLS.SetCellFormat( l,c, XFTitle ) ;

    //sh.Cols  [c].Width := Width;
  end;


var
  LValue : TValue ;
begin
  Xls := TXlsFile.Create( 1 {GridWorkbook.PageCount}, True ) ;
	Landscape := false;  //In this example we will just hard-code it to landscape, in a real app, landscape might have any value.
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

  XLS.ShowGridLines := False ;

  XLS.OutLineSummaryRowsBelowDetail := False ;

  FFmt := GetDefaultFormat ;
  FProcGetValue( Self ) ;

  Xls.Save( FFileName ); //No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.
  XLS.free ;
//  XLSAdpater1.free ;

end;

class procedure TExportTreeViewToExcel.ExportToExcel(const AVST: TVirtualStringTree ; const AProcGetValue : TProcGetValue ; const AFileName : string ) ;
begin
  var  LThis: IExcelExporter := TExportTreeViewToExcel.Create( AVST, AProcGetValue, AFileName ) ;
  LThis.Export ;
end;

function TExportTreeViewToExcel.Format: PFlxFormat ;
begin
   Result := @FFmt ;
end;

function TExportTreeViewToExcel.Formula(AFormula: string): TValue ;
begin
  DebugMsg( 'Formula( =' +AFormula + ')' ) ;
  var LFormula := TFormula.Create ( '=' +AFormula ) ;
  TValue.Make (
      @LFormula
    , TypeInfo(TFormula)
    , Result
  ) ;
end;

function TExportTreeViewToExcel.GetDefaultFormat : TFlxFormat ;
begin
    //Custom Format cells a2 and a3
    Result := XLS.GetDefaultFormat ;  //Always initilize the record with an existing format.
    //Result.Font.Name := 'Verdana' ;
    //XLS.GetDataValidation(1,1).
    Result.Font.Name            := 'Calibri' ;
    Result.Font.Color           := clBlack ;
    Result.Font.Size20          := 11 * 20 ;
(*
    Result.FillPattern.Pattern  := TFlxPatternStyle.LightDown;
    Result.FillPattern.FgColor  := clWhite;
    Result.FillPattern.BgColor  := clWhite ;
    Result.Borders.Left.Style   := TFlxBorderStyle.Thin;
    Result.Borders.Left.Color   := clBlack ;
    Result.Borders.Top.Style    := TFlxBorderStyle.Thin;
    Result.Borders.Top.Color    := clBlack ;
    Result.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    Result.Borders.Bottom.Color := clBlack ;
    Result.Borders.Right.Style  := TFlxBorderStyle.Thin;
    Result.Borders.Right.Color  := clBlack ;
 *)
end;

(*
function TExportTreeViewToExcel.GetRow: integer;
begin
   Result := FRow ;
  DebugMsg( 'getRow() : ' + Result.ToString  ) ;
end;
*)

function TExportTreeViewToExcel.GetRow(var ARow: integer): IExcelExporter;
begin
   Result := self ;
   ARow := FRow ;
  DebugMsg( 'getRow( out ' + ARow.ToString + ')' ) ;
end;

procedure teste( const P : Array of TValue ) ;
begin
  //
end;

function TExportTreeViewToExcel.MergeCells(
        {const} AFirstRow
              , AFirstCol
              , ALastRow
              , ALastCol: Int32
      ) : IExcelExporter ;
begin
  DebugMsg( 'Merge( '  + AFirstRow.ToString + ', ' +  AFirstCol.ToString + ', ' + ALastRow.ToString + ', ' + ALastCol.ToString + ')' ) ;
  Teste( [ '', 1, 2, 10.00, AFirstRow, AFirstCol, ALastRow, ALastCol ] ) ;
  Result := self ;
  XLS.MergeCells( AFirstRow, AFirstCol, ALastRow, ALastCol ) ;
end;
(*
function TExportTreeViewToExcel.Row(const Value: integer): IExcelExporter;
begin
  Result := self ;
  DebugMsg( 'Row( ' + Value.ToString + ') : IExcelExporter' ) ;
  if Value > 0 then
     SetRow( Value )
end;
*)
function GetExcelColumn( AValue : integer ) : string ;
begin
  Dec ( AValue ) ;
  var LQuotient := AValue div 26 ;
  if AValue div 26 = 0 then
    Result := char( 65 + (AValue mod 26) )
  else
    Result := GetExcelColumn(LQuotient) + char( 65 + (AValue mod 26) )
end ;

function TExportTreeViewToExcel.GetCellName(ARow, ACol: integer): string;
begin
  if ARow = 0  then
     ARow := FRow ;
  if ACol = 0  then
     ACol := FCol ;
  result :=  SysUtils.Format('%s%d', [ GetExcelColumn( ACol ), ARow  ] ) ;
end;

function  TExportTreeViewToExcel.GetColName(ACol: integer): string;
begin
  result :=  GetExcelColumn( ACol )
end ;
(*
function TExportTreeViewToExcel.GetCol: integer;
begin
  Result := FCol ;
  DebugMsg( 'getCol() : ' + Result.ToString  ) ;
end;
*)

function TExportTreeViewToExcel.GetCol(var ACol: integer): IExcelExporter;
begin
   Result := self ;
   ACol := FCol ;
  DebugMsg( 'getCol( out ' + ACol.ToString + ')' ) ;
end;

function TExportTreeViewToExcel.SetCol(const Value: integer): IExcelExporter;
begin
  Result := self ;
  FCol := Value;
  DebugMsg( 'setCol(' + Value.ToString + ')' ) ;
end;

function TExportTreeViewToExcel.SetColWidth(const AWidth: Integer): IExcelExporter;
begin
  Result := self ;
  XLS.SetColWidth( FCol, AWidth );
end;

function TExportTreeViewToExcel.SetRow(const Value: integer): IExcelExporter;
begin
  Result := self ;
  FRow := Value;
  DebugMsg( 'setRow(' + Value.ToString + ')' ) ;
end;

function TExportTreeViewToExcel.SetRowOutlineLevel(ARow1, ARow2, ALevel: Integer): IExcelExporter;
begin
  result := self ;
  XLS.SetRowOutlineLevel( ARow1, ARow2, ALevel );
end;

function TExportTreeViewToExcel.SetRowOutlineLevel(ALevel: Integer): IExcelExporter;
begin
  result := self ;
  XLS.SetRowOutlineLevel( FRow, ALevel );
end;

function TExportTreeViewToExcel.SetValue(const AValue: TValue): IExcelExporter;
var
 XFCell : integer ;

  procedure AddDate(AValue : TValue );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    FFmt.Format := 'dd/mm/yyyy' ;

    XFCell := Xls.AddFormat(FFmt);

//    if Assigned ( AValue ) and ( not AValue.IsNull ) then
       XLS.SetCellValue( FRow, FCol,AValue.AsType<TDateTime> ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;

  end;

  procedure AddTime(AValue : TValue );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    FFmt.Format := 'hh\:mm\:ss' ;

  	XFCell := Xls.AddFormat(FFmt);

//    if Assigned ( AValue ) and ( not AValue.IsNull )  then
       XLS.SetCellValue( FRow, FCol,AValue.AsType<TDateTime> ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
  end;

  procedure AddDateTime(AValue : TValue );
  begin
    FFmt.Format := 'dd/mm/yyyy hh\:mm\:ss' ;
    if    //Assigned ( AValue )
      //and ( not AValue.IsNull )
      {and} ( AValue.AsType<TDateTime> = Trunc ( AValue.AsType<TDateTime> ) ) then
      FFmt.Format := 'dd/mm/yyyy' ;


  	XFCell := Xls.AddFormat(FFmt);

//    if Assigned ( AValue ) and ( not AValue.IsNull ) then
       XLS.SetCellValue( FRow, FCol,AValue.AsType<TDateTime> ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
//    DebugMsg( 'SetValue( ' + AValue.asString + ')' ) ;
  end;

  procedure AddSingleText(AText : string );
  begin
    // if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    //fmt.Font.Name := AColumn.Font.Name ;
    //fmt.Font.Color := AColumn.Font.Color ;
    XFCell := Xls.AddFormat(FFmt);

    XLS.SetCellValue( FRow, FCol,AText ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AText + ')' ) ;
  end;

  procedure AddText(AValue : TValue );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3


    XFCell := Xls.AddFormat(FFmt);

//    if Assigned ( AValue ) then
       XLS.SetCellValue( FRow, FCol, AValue.AsString ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AValue.asString + ')' ) ;
  end;


  procedure AddLargeText(AValue : TValue );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    FFmt.WrapText := True ;

  	XFCell := Xls.AddFormat(FFmt);
//    if Assigned ( AValue ) then
       XLS.SetCellValue( FRow, FCol,AValue.AsString ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AValue.asString + ')' ) ;
  end;

  procedure AddInteger(AValue : TValue  ; const format : string );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    if FFmt.Format = '' then
      FFmt.Format := '#,0;[Red]-#,0' ;
//    FFmt.HAlignment

  	XFCell := Xls.AddFormat(FFmt);
//    if Assigned ( AValue ) and ( not AValue.IsNull ) then
       XLS.SetCellValue( FRow, FCol,AValue.asInteger ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AValue.AsInteger.ToString + ')' ) ;
  end;

  procedure AddFloat(AValue : TValue  ; const format : string );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    if FFmt.Format = '' then
      FFmt.Format := '#,0.00;[Red]-#,0.00' ;
//    FFmt.HAlignment
  	XFCell := Xls.AddFormat(FFmt);
//    if Assigned ( AValue ) and ( not AValue.IsNull ) then
      if Pos ( '%', Format ) = 0  then
       XLS.SetCellValue( FRow, FCol, AValue.AsExtended )
      else
       XLS.SetCellValue( FRow, FCol, AValue.AsExtended / 100 ) ;
     XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AValue.AsExtended.ToString + ')' ) ;
  end;

  procedure AddFormula(AValue : TFormula );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3

    XFCell := Xls.AddFormat(FFmt);
    XLS.SetCellValue( FRow, FCol, AValue ) ;
    XLS.SetCellFormat( FRow, FCol,XFCell ) ;
    DebugMsg( 'SetValue( ' + AValue.Text + ')' ) ;
  end;

//       TConditionalFormat
//  XLS.AddConditionalFormat( T   );
//  XLS.SetConditionalFormat();


begin

  if FRow < FMinRow then
    FMinRow := FRow ;

  if FCol < FMinCol then
    FMinCol := FCol ;

  if FRow > FMaxRow then
    FMaxRow := FRow ;

  if FCol > FMaxCol then
    FMaxCol := FCol ;

  Result := Self ;

  if  AValue.IsType<Integer> then
    AddInteger ( AValue.AsType<Integer>, '0'  )
  else if  AValue.IsType<double>  then
    AddFloat ( AValue.AsType<double>, '#,0.00'  )
  else if  AValue.IsType<TDate>  then
     AddDate ( AValue.AsType<TDate>  )
  else if  AValue.IsType<TTime>  then
     AddTime ( AValue.AsType<TTime>  )
  else if (  AValue.IsType<TDateTime>  )
      {or  (  AValue.IsType<TSQLTimeStampField )} then
     AddDateTime ( AValue.AsType<TDateTime>  )
  else if (  AValue.IsType<TFormula>  )
      {or  (  AValue.IsType<TSQLTimeStampField )} then
     AddFormula ( AValue.AsType<TFormula>  )
  else
    AddText ( AValue.asString ) ;

end;


function  TExportTreeViewToExcel.NextCol : IExcelExporter ;
begin
  Result := self ;
  Inc ( FCol ) ;
  DebugMsg( 'NextCol : ' + (FCol - 1).ToString +  ': ' + FCol.ToString  ) ;
end;

function  TExportTreeViewToExcel.NextRow : IExcelExporter ;
begin
  Result := self ;
  Inc ( FRow ) ;
  DebugMsg( 'NextRow : ' + (FRow - 1).ToString +  ': ' + FRow.ToString  ) ;
end;

function  TExportTreeViewToExcel.PriorCol : IExcelExporter ;
begin
  Result := self ;
  if FCol > 1 then
    Dec ( FCol ) ;
  DebugMsg( 'PriorCol : ' + (FCol + 1).ToString +  ': ' + FCol.ToString  ) ;
end;

function  TExportTreeViewToExcel.PriorRow : IExcelExporter ;
begin
  Result := self ;
  if FRow > 1 then
    Dec ( FRow ) ;
  DebugMsg( 'PriorRow : ' + (FRow + 1).ToString +  ': ' + FRow.ToString  ) ;
end;

end.
