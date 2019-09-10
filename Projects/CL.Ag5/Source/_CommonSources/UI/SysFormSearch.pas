unit SysFormSearch;

interface

{.$I Tc.MP.inc}
{$D-}

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, VCL.ComCtrls, VCL.ToolWin,
  Data.DB, Tc.Data.DB.Helpers, VCL.Menus, VCL.Mask, VCL.DBCtrls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.FMTBcd, Datasnap.Provider,
  Data.SqlExpr, Tc.Data.SQLExpr,
  EditHintText, SysFormDialog,
  Tc.VCL.Dialogs, Tc.VCL.Application, Tc.DBRTL.AbstractDB,
  JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvExExtCtrls, JvImage, JvExtComponent, JvPanel, //SysNewFastRegisterIntf,
  JvDBGridSuppl, System.Actions, Tc.VCL.Controls.GDIButton,
  NewFastRegisterIntf,
  Wrappers  ;

type

  TEdit = class ( Wrappers.TEditHintText ) ;

  TSearchObject = class ( TObject )
  private
    FAbstractDB : ITcAbstractDB ;
    FTableName : String ;
    FKeyFields : TStringList ;
    FDisplayFields : TStringList ;
    FFields : TStringList ;
    FJoinTables : TStringList ;
    FWhere : TStringList ;
    FOrderBy : TStringList ;
    FCDSResult : TClientDataSet ;
    FSelected : boolean ;
    FTextToFind : string ;
    FDateMask: string;
    FDateTimeMask: string;
    FFloatMask: string;
    FTimeMask: string;
    FCaption: string;
    FUseOrOnWhere: boolean;
    FFormNewRegister: TForm; //Retirar *****-----
    FNewFastRegister: INewFastRegister;
    procedure SetDateMask(const Value: string);
    procedure SetDateTimeMask(const Value: string);
    procedure SetFloatMask(const Value: string);
    procedure SetTimeMask(const Value: string);
    procedure SetCaption(const Value: string);
    procedure SetUseOrOnWhere(const Value: boolean);
    procedure SetFormNewRegister(const Value: TForm);
    procedure SetNewFastRegister(const Value: INewFastRegister);
  protected
    procedure CustomFormatResult ( AFields : TFields ) ; virtual ;
  public
    params : TParams ;
    procedure FormatResult ( AFields : TFields ) ;
    property AbstractDB : ITcAbstractDB read FAbstractDB write FAbstractDB ;
    property TableName : string read FTableName write FTableName ;
    property KeyFields : TStringList read FKeyFields write FKeyFields ;
    property DisplayFields : TStringList read FDisplayFields write FDisplayFields ;
    property Fields : TStringList read FFields write FFields ;
    property JoinTables : TStringList read FJoinTables write FJoinTables ;
    property Where : TStringList read FWhere write FWhere ;
    property OrderBy : TStringList read FOrderBy write FOrderBy ;
    property Selected : boolean read FSelected write FSelected ;
    property Result : TClientDataSet read FCDSResult ;
    property TextToFind : string  read FTextToFind write FTextToFind ;
    property FloatMask : string  read FFloatMask write SetFloatMask;
    property DateMask : string  read FDateMask write SetDateMask;
    property DateTimeMask : string  read FDateTimeMask write SetDateTimeMask;
    property TimeMask : string  read FTimeMask write SetTimeMask;
    property Caption : string   read FCaption write SetCaption;
    property UseOrOnWhere : boolean  read FUseOrOnWhere write SetUseOrOnWhere;
    property FormNewRegister: TForm read FFormNewRegister write SetFormNewRegister; //*****----
    property NewFastRegister: INewFastRegister read FNewFastRegister write SetNewFastRegister;
    procedure CopyResultDataSet ( SourceDataSet : TClientDataSet ) ;
    function MakeSelect : string ;
    function Execute : boolean ; virtual ;
    function ExecuteByText ( Text : string ) : boolean ; virtual ;
    function ExecuteByKey ( Key : integer ) : boolean ; virtual ;
    constructor Create ; virtual ;
    destructor Destroy ; override ;
    class function LoggedUser : TLoggedUser ;
  end ;

  TJvDBUltimGrid = class ( JvDBGridSuppl .TJvDBUltimGrid )
    procedure Loaded ; override ;
  end;

  TfrmCustomSearch = class(T_FormDialog)
    dtsSearch: TDataSource;
    dbgSearch: TJvDBUltimGrid;
    cdsSearch: TClientDataSet;
    Image2: TImage;
    Label16: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    edtSearch: TEdit;
    btnNovo: TTcGDIButton;
    procedure dbgSearchDblClick(Sender: TObject);
    procedure search ;
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbgSearchDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure cdsSearchAfterClose(DataSet: TDataSet);
  private
//    function GetTextToSearch: string;
  private
    { Private declarations }
    FSearchObject : TSearchObject ;
    FGridName : string ;
   // FFormNewRegister: TForm;  //*****-----
    FNewFastRegister: INewFastRegister;
    procedure InitGrid ;
   // procedure SetFormNewRegister(const Value: TForm);
    procedure SetNewFastRegister(const Value: INewFastRegister);
  public
    { Public declarations }
//    property TextToSearch : string read GetTextToSearch ;
    class function ExecuteSearch ( SearchObject : TSearchObject ) : boolean ;
    Destructor Destroy ; override ;
    //property FormNewRegister: TForm read FFormNewRegister write SetFormNewRegister;
    property NewFastRegister: INewFastRegister read FNewFastRegister write SetNewFastRegister;
  end;


implementation

uses
     Tc.RTL.StringUtils,
     CDSSuppl,
     threadSuppl, DSIntf ;
     //, UfrmSearchProgress ;

{$R *.DFM}



procedure TfrmCustomSearch.btnNovoClick(Sender: TObject);
var
  LSearchObject : TSearchObject;
  LForm: TForm;
begin
  LSearchObject := Self.FSearchObject;
  if Assigned( Self.NewFastRegister ) then
   begin
     Self.Hide;
     NewFastRegister.ExecuteNewRegister;
     Self.cdsSearch.Close;
     Self.cdsSearch.Open;
     Self.FSearchObject.FormatResult( Self.cdsSearch.Fields );
     Self.Show;
   end;
end;


procedure TfrmCustomSearch.dbgSearchDblClick(Sender: TObject);
begin

   with  dbgSearch, ScreenToClient ( Mouse.CursorPos ) do
      with MouseCoord ( x, y ) do
         if y = 0 then
            exit ;

   if not (cdsSearch.BOF and cdsSearch.EOF) then
      modalResult := mrOk ;

end;


procedure TfrmCustomSearch.search;
begin
    //UfrmSearchProgress.TfrmSearchProgress.ShowProgress ;

    if cdsSearch.Active  then
      cdsSearch.Close ;
                                                  
    try

      //** KIQ need review
      with FSearchObject do
         begin
//--DBAPP
//          if not Assigned ( FAbstractDB ) then
//             ApplResources.DBResources[0].populateClientDataSet(cdsSearch, MakeSelect, Params )
//          else
            FAbstractDB.populateClientDataSet(cdsSearch, MakeSelect, Params );
          FormatResult ( cdsSearch.Fields ) ;
         end ;


      if ( cdsSearch.Bof and cdsSearch.EOF ) then
         begin
             if Trim ( edtSearch.Text ) <> '' then
               messageDlg ( format ( 'Nenhum registro contendo ''%s'''#13#10'foi encontrado para esta pesquisa', [ edtSearch.Text] ), mtWarning, [mbOk], 0 )
             else
               messageDlg ( 'Nenhum registro para esta pesquisa', mtWarning, [mbOk], 0 ) ;
             edtSearch.selectAll ;
             edtSearch.setFocus ;
         end
      else
         begin
//            dbgSearch.TextHighligth := FSearchObject.TextToFind ;
            dbgSearch.setFocus ;
         end ;
    finally
       //UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
    end ;

end;
{
procedure TfrmCustomSearch.SetFormNewRegister(const Value: TForm);
begin
  FFormNewRegister := Value;
end;
 }
procedure TfrmCustomSearch.SetNewFastRegister(const Value: INewFastRegister);
begin
  FNewFastRegister := Value;
end;

procedure TfrmCustomSearch.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       begin
         self.FSearchObject.TextToFind := edtSearch.Text ;
         Key := #0 ;
         search ;
      end ;
end;

procedure TfrmCustomSearch.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
       modalResult := mrCancel ;
end;

procedure TfrmCustomSearch.dbgSearchKeyPress(Sender: TObject; var Key: Char);
begin
    if ( Key = #13 ) and not (cdsSearch.BOF and cdsSearch.EOF) then
       modalResult := mrOk ;
end;


destructor TfrmCustomSearch.Destroy;
begin
  JvDBGridSuppl.TGridStorager.Save( dbgSearch, FGridName );
  inherited;
end;

function GetTextToSearch ( Texto : string ) : string;
var
   s : string ;
   x : integer ;
begin

   s:= UpperCase ( Texto ) ;
   for x := 1 to Length ( s ) do
       case ord ( s[x] ) of
          32 : s[x] := '%' ;
          1..31, 128..255  : s[x] := '_' ;
       end ;
   result := QuotedStr ( '%' +  s + '%' ) ;

end;

class function TfrmCustomSearch.ExecuteSearch ( SearchObject : TSearchObject ) : boolean ;
var
  frmCustomSearch: TfrmCustomSearch;
begin
  frmCustomSearch := TfrmCustomSearch.Create ( nil ) ;

  {frmCustomSearch.FormNewRegister := nil;
  if Assigned( SearchObject.FormNewRegister ) then
   begin
     frmCustomSearch.FormNewRegister := SearchObject.FormNewRegister;
     frmCustomSearch.btnNovo.Visible := True;
   end;}
  if Assigned( SearchObject.NewFastRegister ) then
   begin
     frmCustomSearch.NewFastRegister := SearchObject.NewFastRegister;
     frmCustomSearch.btnNovo.Visible := True;
   end;

  if SearchObject.Caption <> '' then
     frmCustomSearch.Caption := SearchObject.Caption ;
  frmCustomSearch.FSearchObject := SearchObject ;
  frmCustomSearch.edtSearch.Text := SearchObject.FTextToFind ;
  frmCustomSearch.InitGrid ;
//  threadSuppl.TSyncThread.Create ( frmCustomSearch.search ) ;
  SearchObject.Selected := ( frmCustomSearch.showModal = mrOk ) ;
  if SearchObject.Selected then
     SearchObject.CopyResultDataSet ( frmCustomSearch.cdsSearch ) ;
  frmCustomSearch.free ;
  Result := SearchObject.Selected ;
end;

{ TSearchObject }


procedure TSearchObject.CopyResultDataSet ( SourceDataSet : TClientDataSet ) ;
begin
   TCDSSuppl.CopyDataSet( SourceDataSet, FCDSResult, False );
end;

constructor TSearchObject.Create;
begin
    inherited ;
    FAbstractDB := nil ;
    FUseOrOnWhere   := False ;
    params          := TParams.Create  ;
    FKeyFields      := TStringList.Create ;
    FDisplayFields  := TStringList.Create ;
    FFields         := TStringList.Create ;
    FJoinTables     := TStringList.Create ;
    FWhere          := TStringList.Create ;
    FOrderBy        := TStringList.Create ;
    FCDSResult      := nil ; //TClientDataSet.Create ( nil ) ;
    FDateMask       := 'dd.mm.yyyy';
    FDateTimeMask   := 'dd.mm.yy hh:nn';
    FFloatMask      := '0,0.00##';
    FTimeMask       := 'hh:nn:ss';
    FCaption        :=  '' ;
end;


destructor TSearchObject.Destroy;
begin
    params.Free ;
    FKeyFields.Free ;
    FDisplayFields.Free ;
    FJoinTables.Free ;
    FWhere.Free ;
    FOrderBy.Free ;
    FFields.Free ;
    if Assigned ( FCDSResult ) then
       FCDSResult.free ;
    inherited Destroy ;
end;

function TSearchObject.Execute : boolean ;
begin
   FSelected := False ;
   Result := TfrmCustomSearch.ExecuteSearch( Self );
end;

function TSearchObject.ExecuteByKey(Key: integer): boolean;
begin
   FSelected := False ;
   Result := TfrmCustomSearch.ExecuteSearch( Self );
end;

function TSearchObject.ExecuteByText(Text: string): boolean;
begin
   FSelected := False ;
   Result := TfrmCustomSearch.ExecuteSearch( Self );
end;

procedure TSearchObject.CustomFormatResult(AFields: TFields);
begin
//
end;

procedure TSearchObject.FormatResult(AFields: TFields);
var
  x : integer ;
  KeyNames : TStringList ;

  procedure DefaultFormat ( AField : TField ) ;
  begin
     AField.Visible := KeyNames.IndexOf( UpperCase ( AField.FieldName ) ) = -1 ;

     if AField is TFloatField then
        TFloatField ( AField ).DisplayFormat := FFloatMask
     else if AField is TDateTimeField then
        TDateTimeField ( AField ).DisplayFormat := FDateTimeMask
     else if AField is TDateField then
        TDateField ( AField ).DisplayFormat := FDateMask
     else if AField is TTimeField then
        TTimeField ( AField ).DisplayFormat := FDateMask
     else if AField is TTimeField then
        TTimeField ( AField ).DisplayFormat := FDateMask
     else if AField is  TFMTBCDField then
       begin
        if TFMTBCDField ( AField ).Size = 0 then
          TFMTBCDField ( AField ).DisplayFormat := '0,0'
        else
          TFMTBCDField ( AField ).DisplayFormat := '0,0.' + StringOfChar ( '0', TFMTBCDField ( AField ).Size ) ;
       end ;
  end;
  
begin
  KeyNames := TStringList.Create ;

  For x := 0 to FKeyFields.Count -1 do
     if Pos ( '.', FKeyFields[ x ]  ) > 0 then
        KeyNames.Add ( UpperCase ( Copy (  FKeyFields[ x ], Pos ( '.', FKeyFields[ x ] ) + 1, Length ( FKeyFields[ x ]  ) ) ) )
     else
        KeyNames.Add ( UpperCase( FKeyFields[ x ]  ) ) ;

  for x := 0 to AFields.Count - 1 do
     DefaultFormat ( AFields[ x ] ) ;

  try
     CustomFormatResult ( AFields ) ;
  finally
    KeyNames.Free ;
  end ;
end;

class function TSearchObject.LoggedUser: TLoggedUser;
begin
    Result := Tc.VCL.Application.TTcCustomApplication.Instance.LoggedUser ;
end;

function TSearchObject.MakeSelect : string ;
var
   SQLString : TStringList ;

   function MakeWHERE : string ;
   var
     x: integer ;
//     WhereParms : string ;
     LWord : string ;
     Separator : string ;
     LLikeFields : string ;
     LLikeList : string ;
   begin

       if ( self.TextToFind = '' ) and ( FWhere.Text = ''  ) and ( Params.Count = 0 ) then
          exit ;

       LLikeFields := '' ;
       Separator := '||''|''||' ;
       for x := 0 to FFields.Count -1 do
          begin
              if x = FFields.Count - 1 then
                 Separator := '' ;
              LLikeFields := format ( '%sCOALESCE ( %s, '''' )%s', [ LLikeFields, FFields[ x ], Separator ] ) ;
          end ;

       LLikeList := '' ;
       if LLikeFields <> '' then
         begin
           if FUseOrOnWhere then
             begin
               for LWord in self.TextToFind.Split( ['.', ',', #13, #10, ' ', '/', '|'] )  do
                   if LWord <> '' then
                      LLikeList := format (  '%s( ( %s ) collate pt_br LIKE %s )'#13#10'OR ', [ LLikeList, LLikeFields, GetTextToSearch ( LWord ) ] ) ;
               if LLikeList <> '' then
                  LLikeList := '(' + LLikeList.Remove( LLikeList.Length - 3 ) + ')' ;
             end
           else
             LLikeList := format (  '( ( %s ) collate pt_br LIKE %s ) ', [ LLikeFields, GetTextToSearch( self.TextToFind ) ] )
         end;

       Result := '' ;

       if (FWhere.Text <> '') and (LLikeList <> '') then
         Result := format (  'WHERE  ( %s ) AND %s', [ FWhere.Text, LLikeList ] )
       else if (FWhere.Text <> '') then
         Result := format (  'WHERE (%s)', [ FWhere.Text ] )
       else if (LLikeList <> '') then
         Result := format (  'WHERE %s', [ LLikeList ] ) ;

   end ;

   procedure AddJoins ;
   var
      joinLst : string ;
      x : integer ;
   begin
      joinLst := '' ;

      for x := 0 to FJoinTables.Count -1 do
         joinLst := format ( '%sLEFT JOIN %s'#13#10, [joinLst, FJoinTables [ x ] ] ) ;

      if joinLst <> '' then
         SQLString.Add (  joinLst ) ;

   end ;

var
  tmp : string ;
  IterateFields : integer ;
begin
   SQLString := TStringList.Create ;
   with SQLString do
      begin
         tmp := '' ;
//         Add ( FKeyFields.Text + ', ' ) ;
//         Add ( FKeyFields.CommaText + ', ' ) ;
//         Add ( FFields.CommaText  ) ;
         for IterateFields := 0 to FKeyFields.Count - 1 do
             tmp := tmp + FKeyFields[ IterateFields ] + ', ' ;

         for IterateFields := 0 to FFields.Count - 1 do
             tmp := tmp + FFields[ IterateFields ] + ', ' ;

         for IterateFields := 0 to FDisplayFields.Count - 1 do
             tmp := tmp + FDisplayFields[ IterateFields ] + ', ' ;

         System.Delete ( tmp, Length ( tmp ) - 1 , 2  ) ;
         Add ( tmp ) ;
         Add (  'FROM '   + FTableName  ) ;
         AddJoins ;
         Add (  MakeWHERE ) ;
         if FOrderBy.Count > 0 then
            Add ( 'ORDER BY ' + FOrderBy.CommaText ) ;
      end ;

   Result := SQLString.Text ;

end;


procedure TfrmCustomSearch.cdsSearchAfterClose(DataSet: TDataSet);
begin
   cdsSearch.IndexName := '' ;
end;

procedure TfrmCustomSearch.FormShow(Sender: TObject);
begin
  inherited;
  Repaint ;
  Application.ProcessMessages;
  threadSuppl.TSyncThread.Create ( search ) ;
end;

procedure TfrmCustomSearch.InitGrid;
var
 x : integer ;
begin
    FGridName := Name + '.' + FSearchObject.ClassName ;

  if not JvDBGridSuppl.TGridStorager.Load( dbgSearch, FGridName )  then
   with dbgSearch do
    begin
       Columns.RebuildColumns ;
       for x := 0 to Columns.Count -1 do
          begin
            if  Columns[ x ].FieldName <> '' then
              begin
                Columns[ x ].Visible := Columns[ x ].Field.Visible ;
                Columns[ x ].Title.Caption := Columns[ x ].Field.DisplayLabel ;
              end ;
          end;
       AutoSizeColumns := True ;
    end ;

end;

procedure TSearchObject.SetDateMask(const Value: string);
begin
  FDateMask := Value;
end;

procedure TSearchObject.SetDateTimeMask(const Value: string);
begin
  FDateTimeMask := Value;
end;

procedure TSearchObject.SetFloatMask(const Value: string);
begin
  FFloatMask := Value;
end;

procedure TSearchObject.SetFormNewRegister(const Value: TForm);
begin
  FFormNewRegister := Value;
end;

procedure TSearchObject.SetNewFastRegister(const Value: INewFastRegister);
begin
  FNewFastRegister := Value;
end;

procedure TSearchObject.SetTimeMask(const Value: string);
begin
  FTimeMask := Value;
end;

procedure TSearchObject.SetUseOrOnWhere(const Value: boolean);
begin
  FUseOrOnWhere := Value;
end;

procedure TSearchObject.SetCaption(const Value: string);
begin
  FCaption := Value;
end;


procedure DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState ; TextoDestaque : string );
var
  Icon: TImage;
  R: TRect;
  grid : TJvDBUltimGrid ; {++KIQ++}
  Texto : string ;
  posStrDestaque : integer ;
  LenStrDestaque : integer ;
  PosicaoDestaque : integer ;
  PalavraDestaque  : string ;


begin

  grid := TJvDBUltimGrid ( Sender ) ; {++KIQ++}

//  TDBGridSuppl.JvDrawColumnCell(grid, Rect, DataCol, Column, State );

  with grid, canvas do
     begin

          if ( TextoDestaque <> '' ) and Assigned ( Column.Field ) then {++KIQ++}
          begin
              //texto := Column.Field.asString ; // consegue o texto...
              texto := Column.Field.DisplayText ;

              Repeat
                posStrDestaque := Pos( ' ', TextoDestaque ) ;

                if ( posStrDestaque = 0 ) then
                   begin
                      PalavraDestaque := TextoDestaque ;
                      TextoDestaque := '' ;
                   end
                else
                   begin
                      PalavraDestaque := Copy ( TextoDestaque, 1, posStrDestaque - 1 ) ;
                      Delete ( TextoDestaque, 1, posStrDestaque ) ;
                   end ;

                posStrDestaque := Pos ( TStringSuppl.RemoveAccents( AnsiUpperCase ( PalavraDestaque ) ),
                                        TStringSuppl.RemoveAccents( AnsiUpperCase ( Texto ) ) ) ; // acha onde começa o texto destaque na string...
                if posStrDestaque <> 0 then
                   begin
                      PosicaoDestaque := Canvas.TextWidth( Copy ( Texto, 1, posStrDestaque - 1 ) ) ; // calcula qual a posicao do canvas para imprimir o destaque

                      // calcula posicão de centro / right...
                      if Column.Alignment = taCenter then
                         PosicaoDestaque := (Column.Width - Canvas.TextWidth(PalavraDestaque)) div 2 -2
                      else if Column.Alignment = taRightJustify then
                          PosicaoDestaque := (Column.Width -Canvas.TextWidth(Texto) +PosicaoDestaque -5);

                      PalavraDestaque := Copy ( Texto, posStrDestaque, Length ( PalavraDestaque ) ) ; // pega o texto do campo para respeitar maiusculas, minuscula e acentos ;
                      Font.Color := clRed ; // muda a cor da fonte
                      Font.Style := Font.Style + [fsUnderline] ;
                      Brush.Style := bsClear	;
                      //Brush.Color := clSilver ;
                      TextOut( Rect.Left + PosicaoDestaque + 2, Rect.Top + 2, PalavraDestaque ); // imprime so o texto destaque em cima do outro.
                   end
              Until ( TextoDestaque = '' ) ;

          end ;

     end ;

end;


procedure TfrmCustomSearch.dbgSearchDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  DrawColumnCell(Sender, Rect, DataCol, Column, State, edtSearch.Text );
end;

{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
  FDisableAutoLoad := True ;
  inherited ;
end;

end.
