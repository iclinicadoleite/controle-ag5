unit ExportDataSetToExcel;

interface

uses
  Printers, {NativeXml, NativeXmlObjectStorage, MailSuppl, QRPrntr,}
  ShellAPI, StrUtils, SysUtils, DateUtils,
  TypInfo,
  //UFlexCelImport,  UExcelAdapter,
  { XLSAdapter, }
  VCL.FlexCel.Core, FlexCel.XlsAdapter, DB, Graphics ;

type
  TExportDataSetToExcel = class(TObject)
    private
      procedure DoExportToExcel(ADataSet: TDataSet; AFileName : string ) ;
    public
      class procedure ExportToExcel(ADataSet: TDataSet; AFileName : string ) ;
  end;


implementation


{ TExportDataSetToExcel }

procedure TExportDataSetToExcel.DoExportToExcel(ADataSet: TDataSet;
  AFileName: string);
var
  Linha, Coluna : integer ;
//  PathToImage : string;
//  PicProps: IImageProperties;
  fmt: TFlxFormat;
  XFTitle, XFCell : integer;
  Landscape: boolean;
//  XLSAdpater1 : TXLSAdapter ;
//  XLS: TFlexCelImport ;
   XLS : TExcelFile ;
//  LColumnCount : integer ;

  procedure AddTitle( l, c : integer ; ATitleCaption: String ; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat ;  //Always initilize the record with an existing format.
    //fmt.Font.Name := 'Verdana' ;

    fmt.Font.Color           := clBlack ;
    fmt.FillPattern.Pattern  := TFlxPatternStyle.LightDown;
    fmt.FillPattern.FgColor  := clWhite;
    fmt.FillPattern.BgColor  := clWhite ;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack ;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack ;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack ;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack ;
  	XFTitle := Xls.AddFormat(fmt);

    XLS.SetCellValue( l,c, ATitleCaption ) ;
    XLS.SetCellFormat( l,c, XFTitle ) ;
    //sh.Cols  [c].Width := Width;
  end;

  procedure AddDate( l, c : integer ; AField : TField ; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
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

    if Assigned ( AField ) and ( not AField.IsNull ) then
       XLS.SetCellValue( l,c, AField.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;

  end;

  procedure AddTime( l, c : integer ; AField : TField ; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
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

    if Assigned ( AField ) and ( not AField.IsNull )  then
       XLS.SetCellValue( l,c, AField.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddDateTime( l, c : integer ; AField : TField ; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat ;  //Always initilize the record with an existing format.
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;

    fmt.Format := 'dd/mm/yyyy hh\:mm\:ss' ;
    if    Assigned ( AField )
      and ( not AField.IsNull )
      and ( AField.asDateTime = Trunc ( AField.asDateTime ) ) then
      fmt.Format := 'dd/mm/yyyy' ;


  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AField ) and ( not AField.IsNull ) then
       XLS.SetCellValue( l,c, AField.asDateTime ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddSingleText( l, c : integer ; AText : string ; Width : integer );
  begin
    // if Width <= 1 then
    //   Width := 15;

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

  procedure AddText( l, c : integer ; AField : TField; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
   // fmt.Font.Name            := AColumn.Font.Name ;
   // fmt.Font.Color           := AColumn.Font.Color;
    fmt.Borders.Left.Style   := TFlxBorderStyle.Thin;
    fmt.Borders.Left.Color   := clBlack;
    fmt.Borders.Top.Style    := TFlxBorderStyle.Thin;
    fmt.Borders.Top.Color    := clBlack;
    fmt.Borders.Bottom.Style := TFlxBorderStyle.Thin;
    fmt.Borders.Bottom.Color := clBlack;
    fmt.Borders.Right.Style  := TFlxBorderStyle.Thin;
    fmt.Borders.Right.Color  := clBlack;
  	XFCell := Xls.AddFormat(fmt);

    if Assigned ( AField ) then
       XLS.SetCellValue( l,c, AField.DisplayText ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;


  procedure AddLargeText( l, c : integer ; AField : TField  ; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
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
    if Assigned ( AField ) then
       XLS.SetCellValue( l, c, AField.AsString ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddInteger( l, c : integer ; AField : TField  ; const format : string; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
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
    if Assigned ( AField ) and ( not AField.IsNull ) then
       XLS.SetCellValue( l, c, AField.asInteger ) ;
    XLS.SetCellFormat( l,c, XFCell ) ;
  end;

  procedure AddFloat( l, c : integer ; AField : TField  ; const format : string; Width : integer );
  begin
    //if Width <= 1 then
    //   Width := 15;

    //Custom Format cells a2 and a3
    fmt := Xls.GetDefaultFormat;  //Always initilize the record with an existing format.
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
    if Assigned ( AField ) and ( not AField.IsNull ) then
      if Pos ( '%', Format ) = 0  then
       XLS.SetCellValue( l, c, AField.asFloat )
      else
       XLS.SetCellValue( l, c, AField.asFloat / 100 ) ;
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

  AddSingleText( 1, 1, '', 0 ) ;
  AddSingleText( 2, 1, 'Emissão : ' + FormatDateTime ('dd.mm.yyyy - hh:nn', Now ), 0  ) ;

  Linha := 4 ;
  Coluna := 1 ;

  for var x := 0 to ADataSet.FieldCount - 1 do
    if  ADataSet.Fields[ x ].Visible then
      begin
       AddTitle( Linha, Coluna, ADataSet.Fields[ x ].DisplayLabel, ADataSet.Fields[ x ].DisplayWidth  * 43 );
       Inc ( Coluna ) ;
      end ;

  Linha := 5 ;
  with ADataSet do
    begin
      first ;
      while not eof do
        begin
          Coluna := 1 ;
          for var x := 0 to ADataSet.FieldCount -1 do
            begin
              if ADataSet.Fields[ x ].Visible then
                begin
                 if not Assigned ( ADataSet.Fields[ x ]  )  then
                    AddText ( linha, coluna,  ADataSet.Fields[ x ], ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else if ADataSet.Fields[ x ] is TIntegerField then
                   AddInteger ( linha, coluna, ADataSet.Fields[ x ],
                    StrUtils.IfThen ( TIntegerField( ADataSet.Fields[ x ] ).DisplayFormat = '', '0', TIntegerField( ADataSet.Fields[ x ] ).DisplayFormat ), ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else if ADataSet.Fields[ x ] is TFloatField  then
                   AddFloat ( linha, coluna, ADataSet.Fields[ x ],
                    StrUtils.IfThen ( TFloatField( ADataSet.Fields[ x ] ).DisplayFormat = '', '#,0.00', TFloatField( ADataSet.Fields[ x ] ).DisplayFormat ), ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else if ADataSet.Fields[ x ] is TDateField  then
                    AddDate ( linha, coluna,  ADataSet.Fields[ x ], ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else if ADataSet.Fields[ x ] is TTimeField  then
                    AddTime ( linha, coluna,  ADataSet.Fields[ x ], ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else if ( ADataSet.Fields[ x ] is TDateTimeField  )
                     or  ( ADataSet.Fields[ x ] is TSQLTimeStampField ) then
                    AddDateTime ( linha, coluna,  ADataSet.Fields[ x ], ADataSet.Fields[ x ].DisplayWidth * 43  )
                 else
                   AddText ( linha, coluna, ADataSet.Fields[ x ], ADataSet.Fields[ x ].DisplayWidth * 43 ) ;
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

class procedure TExportDataSetToExcel.ExportToExcel(ADataSet: TDataSet; AFileName : string ) ;
var
  This: TExportDataSetToExcel;
begin
  This:= TExportDataSetToExcel.Create;
  This.DoExportToExcel(ADataSet, AFileName ) ;
  This.Free;
end;

end.
