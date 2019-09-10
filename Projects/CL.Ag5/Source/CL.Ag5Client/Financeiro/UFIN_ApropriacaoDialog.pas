unit UFIN_ApropriacaoDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, Exceptions,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvExStdCtrls, JvCombobox, JvDBCombobox, VCL.DBCtrls,
  VCL.Mask, JvExMask, JvToolEdit, JvDBControls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, SearchsFinanceiro,
  Tc.VCL.Controls.GDIButton, System.Actions,
  SysFormSearch, Tc.VCL.FloatPanel, Tc.VCL.Application,
  System.ImageList, Vcl.ImgList
  , CLAg5SvcFinanceiroApropriacao
  , Wrappers ;

type

  TFIN_ApropriacaoDialog = class( T_FormDialog )
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    gbxPesquisa: TGroupBox;
    Código: TLabel;
    Classificação: TLabel;
    dbtCodigoConta: TDBText;
    dtbClassificacao: TDBText;
    gbTotalPorcentagem: TGroupBox;
    pnlCentroCustos: TTcCaptionedPanel;
    dbgCentroCustos: TJvDBUltimGrid;
    pnlInformacaoItem: TPanel;
    dbtCodigo: TDBText;
    dbtDescricao: TDBText;
    dbtUnidade: TDBText;
    dbtVlUnitario: TDBText;
    dbtQtde: TDBText;
    dbtTotal: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dtsItem: TDataSource;
    dtsApropriacao: TDataSource;
    edContacontabil: TJvDBComboEdit;
    dbtTotalPorcentagem: TDBText;
    Label8: TLabel;
    btnRemoveCentro: TTcGDIButton;
    btnAdicionaCentro: TTcGDIButton;
    cdsSearch: TClientDataSet;
    dtsSearch: TDataSource;
    actOK: TAction;
    actCancel: TAction;
    dbgSearch: TJvDBUltimGrid;
    PnlChkContaContabil: TPanel;
    ImgChkContaContabil: TImage;
    ImageList1: TImageList;
    procedure edContacontabilButtonClick(Sender: TObject);
    procedure dbgCentroCustosEditButtonClick(Sender: TObject);
    procedure dbgCentroCustosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCentroCustosShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure btnRemoveCentroClick(Sender: TObject);
    procedure btnAdicionaCentroClick(Sender: TObject);
    procedure edContacontabilKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCentroCustosExit(Sender: TObject);
    procedure dbgSearchExit(Sender: TObject);
    procedure dbgSearchKeyPress(Sender: TObject; var Key: Char);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgSearchDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edContacontabilChange(Sender: TObject);
    procedure dbgSearchDblClick(Sender: TObject);
  private
    { Private declarations }
    FCDS_Item: TClientDataSet;
    FCDSApropriacao: TClientDataSet;
    FAPRD : TTiposPlanoAPRD ;
    FPlanoFilter : TPlanoFilter ;
    FTableName : string ;
    FSearchObject : TSearchObject ;
    FIsEmpty : boolean ;
    FOKFocused : boolean ;
    FShowCentroCusto : boolean ;
    procedure SaveInfo ;
    procedure SearchPlanoConta ;
    function SearchPlanoContaNormal(TextToSearch: string) : boolean ;
    function SearchPlanoContaEstoque(TextToSearch: string) : boolean ;
    function SearchPlanoContaSemEstoque(TextToSearch: string) : boolean ;
    procedure SearchCentroCusto(TextToSearch: string);

    procedure FCDSApropriacaoBeforeInsert(DataSet: TDataSet);
    procedure FCDSApropriacaoNewRecord(DataSet: TDataSet);

    procedure DoSearchPlano ;
    procedure SearchInGrid ;
    procedure SetFieldsFromSearch ;
    procedure ImageChkComboEdit( AImage : TImage ; ANAme : string ; AKeyVar : string  ) ;
  public
    { Public declarations }
//    class procedure Execute(ADataModule: TDataModule; ACDS_Item, ACDS_Apropriacao: TClientDataSet;
//                            Tipo_APDR: TTipoAPDR);

    class procedure ExecuteTela(
          const ATableName : string
        ; const ACDS_Item
              , ACDS_Apropriacao: TClientDataSet
        ; const Tela: Integer
        ; const ATiposPlanoAPRD : TTiposPlanoAPRD
        ; const APlanoFilter : TPlanoFilter = pfAll
    ) ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

implementation

uses Tc.DBRTL.AbstractDB, GuidSuppl, ThreadSuppl, UDBFinanceiro,
     Tc.RTL.StringUtils,
     UFIN_ApropriacaoClass, JvDBGridSuppl ;

{$R *.dfm}

{ TfrmCustomDialog }

type
  SvcFinanceiroApropriacaoEditFactory = class( TInterfacedObject, ISvcFinanceiroApropriacaoEdit )
    procedure ExecuteTela(
          const ATableName : string
        ; const ACDS_Item
              , ACDS_Apropriacao: TClientDataSet
        ; const Tela: Integer
        ; const ATiposPlanoAPRD : TTiposPlanoAPRD
        ; const APlanoFilter : TPlanoFilter = pfAll
    ) ;
  end;

destructor TFIN_ApropriacaoDialog.Destroy;
begin
  JvDBGridSuppl.TGridStorager.Save( dbgSearch );
  inherited;
end;

procedure TFIN_ApropriacaoDialog.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel ;
end;

procedure TFIN_ApropriacaoDialog.actOKExecute(Sender: TObject);
begin
  SaveInfo ;
end;

procedure TFIN_ApropriacaoDialog.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := not FCDS_Item.FieldByName('KFIN_PLANOCONTA').IsNull ;

  if FOKFocused or not actOK.Enabled then
    exit ;

  if   FShowCentroCusto
    and  ( FCDSApropriacao.IsEmpty
           or ( FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat <= 0 )
           or ( FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat > 100 )
         ) then
     dbgCentroCustos.SetFocus
  else
     _btbSave.SetFocus ;

  FOKFocused := True ;
end;

procedure TFIN_ApropriacaoDialog.btnAdicionaCentroClick(Sender: TObject);
begin
  inherited;
  if not( FCDSApropriacao.State in [ dsInsert, dsEdit ] ) then
    FCDSApropriacao.Edit;

  FCDSApropriacao.Append;
  dbgCentroCustos.SetFocus;
  dbgCentroCustos.SelectedIndex := 0 ;
  dbgCentroCustos.EditorMode := True ;
  dbgCentroCustosEditButtonClick( dbgCentroCustos ) ;

end;

procedure TFIN_ApropriacaoDialog.btnRemoveCentroClick(Sender: TObject);
begin
  inherited;
  if FCDSApropriacao.Eof then
    Exit;

  FCDSApropriacao.Delete;
end;

constructor TFIN_ApropriacaoDialog.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TFIN_ApropriacaoDialog.edContacontabilButtonClick(Sender: TObject);
begin
  SearchPlanoConta ;
end;

procedure TFIN_ApropriacaoDialog.edContacontabilChange(Sender: TObject);
begin
//  if FCDS_Item.state in [dsInsert,dsEdit] then
    FCDS_Item.FieldByName('KFIN_PLANOCONTA').clear ;
    ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', '' ) ;
end;

procedure TFIN_ApropriacaoDialog.edContacontabilKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
    begin
       Key := #0 ;
       if FCDS_Item.FieldByName('KFIN_PLANOCONTA').isNull then
          TJvDBComboEdit( Sender ).DoClick
       else if FShowCentroCusto
         and  ( FCDSApropriacao.IsEmpty
                or ( FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat <= 0 )
                or ( FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat > 100 )
             ) then
           dbgCentroCustos.SetFocus
       else if _btbSave.Enabled then
          _btbSave.SetFocus ;
    end
end;

procedure TFIN_ApropriacaoDialog.FCDSApropriacaoBeforeInsert(DataSet: TDataSet);
begin
   FIsEmpty := DataSet.IsEmpty ;
end;

procedure TFIN_ApropriacaoDialog.FCDSApropriacaoNewRecord(DataSet: TDataSet);
var
  pkItem : String;
  i : integer;
begin
  pkItem := '';
  for i := 0 to FCDS_Item.Fields.Count-1 do
  begin
    if pfInKey in FCDS_Item.Fields[i].ProviderFlags then
    begin
      pkItem := FCDS_Item.Fields[i].AsString;
      break;
    end;
  end;


  FCDSApropriacao.FieldByName('KFIN_APROPRIACAO').AsString := GuidSuppl.GuidStr20;
  FCDSApropriacao.FieldByName('TABLENAME').AsString := FTableName ;
  FCDSApropriacao.FieldByName('TABLEKEY').AsString  := pkItem ;
  if FIsEmpty then
     FCDSApropriacao.FieldByName('PORCENTAGEM').asFloat := 100 ;

end;

procedure TFIN_ApropriacaoDialog.FormShow(Sender: TObject);
begin
  inherited;

  if ( FCDS_Item.FieldByName('KFIN_PLANOCONTA').IsNull ) then
//   and ( Trim ( edContaContabil.Text ) <> '' ) then
     TSyncThread.Create( SearchPlanoConta ) ;

end;

procedure TFIN_ApropriacaoDialog.ImageChkComboEdit(AImage: TImage; ANAme,
  AKeyVar: string);
begin
  Case AKeyVar.IsEmpty of True :
      begin
        AImage.Hint := AName + ' não associado ao cadastro.'
                      +#13#10'Efetue a pesquisa.'  ;
        ImageList1.GetBitmap( 2, AImage.Picture.Bitmap ) ;
      end;
  else
    AImage.Hint := AName + ' associado ao cadastro.'  ;
    ImageList1.GetBitmap( 0, AImage.Picture.Bitmap )
  end;
  AImage.Refresh ;
end;

//class procedure TFIN_ApropriacaoDialog.Execute(ADataModule: TDataModule;
//    ACDS_Item, ACDS_Apropriacao: TClientDataSet; Tipo_APDR: TTipoAPDR);
//begin
//  ExecuteTela(ADataModule, ACDS_Item, ACDS_Apropriacao, 1, Tipo_APDR );
//end;

class procedure TFIN_ApropriacaoDialog.ExecuteTela(
          const ATableName : string
        ; const ACDS_Item
              , ACDS_Apropriacao: TClientDataSet
        ; const Tela: Integer
        ; const ATiposPlanoAPRD : TTiposPlanoAPRD
        ; const APlanoFilter : TPlanoFilter = pfAll
    ) ;
var
  FIN_ApropriacaoDialog: TFIN_ApropriacaoDialog;
  ModalResult, PontoSalvamento: Integer;
  Results: Boolean;
  LCDS_ApropriacaoNewRecord,
  LCDS_ApropriacaoBeforeInsert,
  LBeforePost : TDataSetNotifyEvent ;

begin
  FIN_ApropriacaoDialog := TFIN_ApropriacaoDialog.Create(nil);

  with FIN_ApropriacaoDialog do
    begin
      FTableName := ATableName ;
      FAPRD      := ATiposPlanoAPRD ;

      // A pedido do vitor 25/09/2012 listar todos em qlqr tela até definicao na proxima reuniao
      //++kiq agelica pediu pra mostrar todas... 29/11/2013
      // setando o array = 0 assume todos os tipos.
      //SetLength( FTIPO_APDR, 0 );

      FPlanoFilter := APlanoFilter  ;

      if (tela = 2) then
      begin
        dbtCodigo.DataField          := '';
        dbtCodigo.DataSource         := nil;
        dbtDescricao.DataField       := '';
        dbtDescricao.DataSource      := nil;
        dbtUnidade.DataField         := '';
        dbtUnidade.DataSource        := nil;
        dbtVlUnitario.DataField      := '';
        dbtVlUnitario.DataSource     := nil;
        dbtQtde.DataField            := '';
        dbtQtde.DataSource           := nil;
        dbtTotal.DataField           := '';
        dbtTotal.DataSource          := nil;
        pnlInformacaoItem.Visible := false;
      end;

      FCDS_Item                      := ACDS_Item;
      FCDSApropriacao                := ACDS_Apropriacao;
      LCDS_ApropriacaoNewRecord      := FCDSApropriacao.OnNewRecord ;
      LCDS_ApropriacaoBeforeInsert   := FCDSApropriacao.BeforeInsert ;
      FCDSApropriacao.BeforeInsert   := FCDSApropriacaoBeforeInsert ;
      FCDSApropriacao.OnNewRecord    := FCDSApropriacaoNewRecord;
      dtsItem.DataSet                := FCDS_Item;
      dtsApropriacao.DataSet         := FCDSApropriacao;

      ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FCDS_Item.FieldByName('KFIN_PLANOCONTA').asString ) ;

      FShowCentroCusto :=
                        ( TApropriacao.ForceCC )
                    or (not FCDSApropriacao.IsEmpty)
                    or (      (not FCDS_Item.FieldByName('DESCR_PC_TIPO_APRD').IsNull )
                         and (    (FCDS_Item.FieldByName('DESCR_PC_TIPO_APRD').asString <> 'A')
                              and (FCDS_Item.FieldByName('DESCR_PC_TIPO_APRD').asString <> 'P'))
                       ) ;

      pnlCentroCustos.Visible := FShowCentroCusto;
//      dbgCentroCustos.Enabled   := FShowCentroCusto;
//      btnRemoveCentro.Enabled   := FShowCentroCusto;
//      btnAdicionaCentro.Enabled := FShowCentroCusto;

      try

        edContacontabil.OnChange := edContacontabilChange ;
        LBeforePost            := FCDS_Item.BeforePost ;
        FCDS_Item.BeforePost   := nil ;
        PontoSalvamento        := FCDS_Item.SavePoint;
        ModalResult            := FIN_ApropriacaoDialog.ShowModal;
        Results := (ModalResult = mrOK);
        edContacontabil.OnChange := nil ;
        if not Results then
          FCDS_Item.SavePoint := PontoSalvamento;
      finally
        FCDSApropriacao.BeforeInsert := LCDS_ApropriacaoBeforeInsert ;
        FCDSApropriacao.OnNewRecord := LCDS_ApropriacaoNewRecord ;
        FIN_ApropriacaoDialog.free;
        FCDS_Item.BeforePost := LBeforePost ;
      end;
    end;
end;

procedure TFIN_ApropriacaoDialog.dbgCentroCustosEditButtonClick(Sender: TObject);
begin
  inherited;
  with dbgCentroCustos, FCDSApropriacao do
    if (SelectedField = FieldByName('NOME')) or (SelectedField = FieldByName('CODIGO')) { or (SelectedField = FieldByName('CLASSIFICACAO')) } then
      SearchCentroCusto(InplaceEditor.Text);
end;

procedure TFIN_ApropriacaoDialog.dbgCentroCustosExit(Sender: TObject);
begin
  TCDSSuppl.PostIfNeed ( FCDSApropriacao ) ;
end;

procedure TFIN_ApropriacaoDialog.dbgCentroCustosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with dbgCentroCustos, FCDSApropriacao do
    if (Key = #13) and Assigned(InplaceEditor) and (InplaceEditor.Visible) then
      if (SelectedField = FieldByName('CODIGO')) or (SelectedField = FieldByName('NOME')) {or (SelectedField = FieldByName('CLASSIFICACAO'))} then
        SearchCentroCusto(InplaceEditor.Text);
end;


procedure TFIN_ApropriacaoDialog.dbgCentroCustosShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  inherited;
  with TJvDBUltimGrid( Sender ), FCDSApropriacao do
    if  ( Field = FieldByName( 'PORCENTAGEM' ) ) then
      AllowEdit := ( not FieldByName( 'KFIN_CENTROCUSTO' ).IsNull );
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

procedure TFIN_ApropriacaoDialog.dbgSearchDblClick(Sender: TObject);
begin
   with  dbgSearch, ScreenToClient ( Mouse.CursorPos ) do
      with MouseCoord ( x, y ) do
         if y = 0 then
            exit ;

   if not (cdsSearch.BOF and cdsSearch.EOF) then
     begin
       SetFieldsFromSearch ;
       dbgSearch.Visible := False ;
     end;

end;

procedure TFIN_ApropriacaoDialog.dbgSearchDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawColumnCell(Sender, Rect, DataCol, Column, State, edContaContabil.Text );
end;

procedure TFIN_ApropriacaoDialog.dbgSearchExit(Sender: TObject);
begin
   //.SetFocus ;
   dbgSearch.Visible := False ;
end;

procedure TFIN_ApropriacaoDialog.dbgSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       SetFieldsFromSearch ;
       dbgSearch.Visible := False ;
     end
  else if Key = #27 then
     begin
       dbgSearch.Visible := False ;
     end ;

end;

procedure TFIN_ApropriacaoDialog.SearchCentroCusto(TextToSearch: string);
begin
  with FCDSApropriacao, TSearchCentroCustoAnalitico.Create do
    try
      TextToFind := TextToSearch;
      if Execute then
        begin

          if not(FCDSApropriacao.State in [dsInsert, dsEdit]) then
            FCDSApropriacao.Edit;

          //FieldByName('CLASSIFICACAO').asString    := Result.FieldByName('CLASSIFICACAO').asString;
          FieldByName('NOME').asString             := Result.FieldByName('NOME').asString;
          FieldByName('CODIGO').AsInteger          := Result.FieldByName('CODIGO').AsInteger;
          FieldByName('KFIN_CENTROCUSTO').asString := Result.FieldByName('KFIN_CENTROCUSTO').asString;
        end;
    finally
      free;
    end;
end;

procedure TFIN_ApropriacaoDialog.SearchInGrid;
var
  p : TPoint ;
begin

   p := edContacontabil.Parent.ClientToParent( Point ( edContacontabil.Left, edContacontabil.Top  ) ) ;

   dbgSearch.Left  := p.x ;
   dbgSearch.Top   := p.y + edContacontabil.Height ;

   dbgSearch.Visible := True ;

   dbgSearch.SetFocus ;
end;

function TFIN_ApropriacaoDialog.SearchPlanoContaNormal(TextToSearch: string) : boolean ;
begin
  FSearchObject := TSearchPlanoContasNotHideByUser.Create ;
  FSearchObject.TextToFind := TextToSearch;
  TSearchPlanoContasNotHideByUser(FSearchObject).APRD := FAPRD ;
  TSearchPlanoContasNotHideByUser(FSearchObject).AnaliticoSintetico := pasAnalitico ;
  TSyncThread.Create( DoSearchPlano );


end;

procedure TFIN_ApropriacaoDialog.DoSearchPlano ;
var
 i: integer ;
begin

    if cdsSearch.Active  then
      begin
        if cdsSearch.IndexName = '__Idx' then
          cdsSearch.DeleteIndex('__Idx') ;
        cdsSearch.Close ;
      end;


    try

       FSearchObject.AbstractDB.populateClientDataSet(cdsSearch, FSearchObject.MakeSelect, FSearchObject.Params );

       dbgSearch.AutoSizeColumns := False ;
       for i := 0 to dbgSearch.Columns.Count - 1 do
         begin
           if      dbgSearch.Columns[i].FieldName = 'CODIGO' then
                   dbgSearch.Columns[i].Width := Trunc ( dbgSearch.Width * 0.10 )
           else if dbgSearch.Columns[i].FieldName = 'NOME' then
                   dbgSearch.Columns[i].Width := Trunc ( dbgSearch.Width * 0.70 )
           else if dbgSearch.Columns[i].FieldName = 'CLASSIFICACAO' then
                   dbgSearch.Columns[i].Width := Trunc ( dbgSearch.Width * 0.10 )
           else if dbgSearch.Columns[i].FieldName = 'TIPO_APRD' then
                   dbgSearch.Columns[i].Width := Trunc ( dbgSearch.Width * 0.10 ) ;
         end;

       FSearchObject.FormatResult ( cdsSearch.Fields ) ;
       FSearchObject.Free ;

      if ( cdsSearch.Bof and cdsSearch.EOF ) then
         begin
             if Trim ( edContaContabil.Text ) <> '' then
               messageDlg ( format ( 'Nenhum registro contendo ''%s'''#13#10'foi encontrado para esta pesquisa', [ edContaContabil.Text] ), mtWarning, [mbOk], 0 )
             else
               messageDlg ( 'Nenhum registro para esta pesquisa', mtWarning, [mbOk], 0 ) ;
             edContaContabil.selectAll ;
             edContaContabil.setFocus ;
         end
//      else if cdsSearch.RecordCount = 1 then
//          SetFieldsFromSearch
      else
         TSyncThread.Create( SearchInGrid );
    finally

    end;

end ;

procedure TFIN_ApropriacaoDialog.SearchPlanoConta;
begin

  case FPlanoFilter of
    pfAll               : SearchPlanoContaNormal(edContaContabil.Text)  ;
    pfSomenteEstoque    : SearchPlanoContaEstoque(edContaContabil.Text) ;
    pfNaoPermiteEstoque : SearchPlanoContaSemEstoque(edContaContabil.Text)  ;
  end;
end;

function TFIN_ApropriacaoDialog.SearchPlanoContaEstoque(TextToSearch: string) : boolean ;
const
  SQL_CENTRO_CUSTOS = 'SELECT KFIN_CENTROCUSTO, CODIGO, NOME, CLASSIFICACAO FROM FIN_CENTROSCUSTO ' +
                      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN';
var
  AbreCentroCusto : Boolean ;
  p : TParams;
  cds : TClientDataSet;
  LTIPO_APRD : string ;
begin

  FSearchObject := TSearchPlanoContasEstoqueNotHideByUser.Create ;
  FSearchObject.TextToFind := TextToSearch;
  TSearchPlanoContasEstoqueNotHideByUser ( FSearchObject ).APRD := FAPRD ;
  TSyncThread.Create( DoSearchPlano );

end;

function TFIN_ApropriacaoDialog.SearchPlanoContaSemEstoque(TextToSearch: string) : boolean ;
const
  SQL_CENTRO_CUSTOS = 'SELECT KFIN_CENTROCUSTO, CODIGO, NOME, CLASSIFICACAO FROM FIN_CENTROSCUSTO ' +
                      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN';
var
  AbreCentroCusto : Boolean ;
  p : TParams;
  cds : TClientDataSet;
  LTIPO_APRD : string ;
begin

  FSearchObject := TSearchPlanoContasEstoqueNotHideByUser.Create ;
  FSearchObject.TextToFind := TextToSearch;
  TSearchPlanoContasSemEstoqueNotHideByUser( FSearchObject ).APRD := FAPRD ;
  TSyncThread.Create( DoSearchPlano );

end;

procedure TFIN_ApropriacaoDialog.SetFieldsFromSearch;
//const
//  SQL_CENTRO_CUSTOS = 'SELECT KFIN_CENTROCUSTO, CODIGO, NOME, CLASSIFICACAO FROM FIN_CENTROSCUSTO ' +
//                      'WHERE KSYS$DOMAIN = :KSYS$DOMAIN';
var
  p : TParams;
  cds : TClientDataSet;
  LTIPO_APRD : string ;
begin

  if not(FCDS_Item.State in [dsInsert, dsEdit]) then
    FCDS_Item.Edit;

  LTIPO_APRD := cdsSearch.FieldByName('TIPO_APRD').AsString ;
  FShowCentroCusto := SvcFinanceiroApropriacaoDefault.NeedCC ( cdsSearch.FieldByName('KFIN_PLANOCONTA').asString ) ;

  if  not FShowCentroCusto
     and not self.FCDSApropriacao.IsEmpty then
    begin
        //if  MessageDlg ( 'A conta selecionada não permite distribuição em ''Centro de Custo'''
        //         + #13#10'Deseja excluir os ''Centros de Custo'''
        //         , mtConfirmation  ) <> mrYes  then
        //Exit ;

        with dtsApropriacao.DataSet do
          begin
             First ;
             while not Eof do Delete ;
          end ;

     end ;

  FCDS_Item.FieldByName('DESCR_PC_CLASSIFICACAO').asString  := cdsSearch.FieldByName('CLASSIFICACAO').asString;
  FCDS_Item.FieldByName('DESCR_PC_CODIGO').AsInteger        := cdsSearch.FieldByName('CODIGO').AsInteger;
  FCDS_Item.FieldByName('DESCR_PC_TIPO_APRD').AsString      := cdsSearch.FieldByName('TIPO_APRD').AsString;
  FCDS_Item.FieldByName('DESCR_PC_NOME').asString           := cdsSearch.FieldByName('NOME').asString;
  FCDS_Item.FieldByName('KFIN_PLANOCONTA').asString         := cdsSearch.FieldByName('KFIN_PLANOCONTA').asString;

  ImageChkComboEdit(ImgChkContaContabil, 'Conta contábil', FCDS_Item.FieldByName('KFIN_PLANOCONTA').asString ) ;


  pnlCentroCustos.Visible := FShowCentroCusto ;
  //btnRemoveCentro.Enabled   := FShowCentroCusto ;
  //btnAdicionaCentro.Enabled := FShowCentroCusto ;
  //dbgCentroCustos.Enabled   := FShowCentroCusto ;

  if FShowCentroCusto then
      if dtsApropriacao.DataSet.IsEmpty then
         SvcFinanceiroApropriacaoDefault.AddCentroCustoPadrao( FCDSApropriacao ) ;
  FOKFocused := False ;
end;


procedure TFIN_ApropriacaoDialog.SaveInfo;
var
  FAPDR : string ;
begin
  TCdsSuppl.PostIfNeed( FCDSApropriacao );

  FAPDR := FCDS_Item.FieldByName('DESCR_PC_TIPO_APRD').AsString ;

  if ( TApropriacao.ForceCC )
  or ( (FAPDR <> '') and ( not ( FAPDR[ 1 ] in [ 'A', 'P' ] ) ) ) then
    begin
// teste deve ser feito fora deste if
//      if ( not FCDSApropriacao.IsEmpty ) and ( dbtTotalPorcentagem.Caption <> '100' ) then
//        raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

      if FCDSApropriacao.IsEmpty then
        raise Warning.Create('Deve indicar pelo menos 1 centro de custo.');
    end;

  if ( not FCDSApropriacao.IsEmpty ) and ( dbtTotalPorcentagem.Caption <> '100' ) then
    raise Warning.Create('É necessário que a somatória do percentual dos centro de custos seja 100%');

  with FCDSApropriacao do
    try
      disableControls ;
      first ;
      while not eof do
        begin
          if FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat <= 0 then
            raise Warning.Create('Não é permitido porcentagem igual ou inferior a 0.');
          if FCDSApropriacao.FieldByName('PORCENTAGEM').AsFloat > 100 then
            raise Warning.Create('Não é permitido porcentagem superior a 100.');
          next ;
        end;
    finally
      enableControls ;
    end;


  ModalResult := mrOk;
end;

{ SvcFinanceiroApropriacaoFactory }

procedure SvcFinanceiroApropriacaoEditFactory.ExecuteTela(
          const ATableName : string
        ; const ACDS_Item
              , ACDS_Apropriacao: TClientDataSet
        ; const Tela: Integer
        ; const ATiposPlanoAPRD : TTiposPlanoAPRD
        ; const APlanoFilter : TPlanoFilter = pfAll
    ) ;
begin
   TFIN_ApropriacaoDialog.ExecuteTela(ATableName,
      ACDS_Item, ACDS_Apropriacao, Tela,
      ATiposPlanoAPRD, APlanoFilter );
end;

initialization
   SvcFinanceiroApropriacaoEdit := SvcFinanceiroApropriacaoEditFactory.Create ;
finalization
   SvcFinanceiroApropriacaoEdit := nil ;
end.
