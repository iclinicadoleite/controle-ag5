unit UZoo_AnimaisGenealogiaClass;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.StdCtrls, VCL.ExtCtrls, Math,
  Tc.VCL.Application,
  Tc.VCL.FormIntf,
  Tc.VCL.Dialogs ;

type
  TIdentityGenere = ( igUnknow, igMale, igFemale ) ;

  TIdentity = class ;

  TIdentityClick = procedure ( AIdentity : TIdentity ; ALink : boolean ) of object ;

  TZoo_AnimaisGenealogiaFrame = class ( VCL.Forms.TScrollBox, ITcDataForm)
  private
    FCanvas: TCanvas;
    FIdentity: TIdentity;
    FSelectedIdentity: TIdentity;
    FDisableDraw: boolean;
    FOnIdentityClick: TIdentityClick;
    procedure SetIdentity(const Value: TIdentity);
    procedure SetDisableDraw(const Value: boolean);
    procedure SetOnIdentityClick(const Value: TIdentityClick);
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  published
  protected
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMKeyDown(var Message: TWMPaint); message WM_KEYDOWN;
    //ITcDataForm
    function GetBOF : boolean ; virtual ; abstract ;
    function GetEOF : boolean ; virtual ; abstract ;
    procedure InsertRecord ;    virtual ; abstract ;
    procedure EditRecord ;      virtual ;
    procedure DeleteRecord ;    virtual ; abstract ;
    procedure Save ;            virtual ; abstract ;
    procedure Cancel ;          virtual ; abstract ;
    procedure PrintData ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
  public
    constructor Create(AOwner: TComponent); override;
    property Identity : TIdentity  read FIdentity write SetIdentity;
    property GCanvas : TCanvas read FCanvas ;
    property disableDraw : boolean  read FdisableDraw write SetDisableDraw;
    property OnIdentityClick : TIdentityClick  read FOnIdentityClick write SetOnIdentityClick;
  end ;


  TIdentity = class(TPaintBox)
  private
    { Private declarations }
    fPai, fMae, fChild : TIdentity ;
    fMaxLevel, fLevel : integer ;
    FGenere: TIdentityGenere;
    FCaption : string ;
    FInfo1   : string ;
    FInfo2   : string ;
    FInfo3   : string ;
    FInfo4   : string ;
    FClickable : boolean ;
    FUID: string;
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure AddParents ;
    procedure SetGenere(const Value: TIdentityGenere);
    procedure SetCaption(const Value: string);
    procedure SetUID(const Value: string);
    procedure SetInfo1(const Value: string);
    procedure SetInfo2(const Value: string);
    procedure SetInfo3(const Value: string);
    procedure SetInfo4(const Value: string);
  protected
    FLink : boolean ;
    FHasData : boolean ;
    procedure doPaint(Sender: TObject);
    procedure  Click ; override ;
  public
    { Public declarations }
    procedure PaintToCanvas( AX,AY : integer ; ACanvas : TCanvas );
    property Pai : TIdentity   read fpai ;
    property Mae : TIdentity   read fmae ;
    property Child : TIdentity read fchild ;
    procedure DrawLines ( AX,AY : integer ; ACanvas : TCanvas ) ;
    procedure Reset ;
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Make ( AParent : TWinControl ; MaxLevel : integer ; AWidth : integer = 200 ) : TIdentity ;
    property Genere : TIdentityGenere  read FGenere write SetGenere;
    property UID : string   read FUID write SetUID;
    property Caption : string  read FCaption write SetCaption;
    property Info1   : string read FInfo1 write SetInfo1 ;
    property Info2   : string read FInfo2 write SetInfo2 ;
    property Info3   : string read FInfo3 write SetInfo3 ;
    property Info4   : string read FInfo4 write SetInfo4 ;
    property Level : integer  read FLevel ;
  end;

  TAnimalGenealogy = class
    public class procedure BuildIdentity ( AKZOO_ANIMAL : string ; Identity : TIdentity ) ;
  end;
   { TAnimalGenealogy }

implementation

uses Tc.DBRTL.AbstractDB, UZoo_EditLinhagemFrame, Tc.VCL.ControlPopuper, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
     ClAg5ClientZootecnicoCommonTypes ;

{.$R *.dfm}

{ TScrollBox }

procedure TIdentity.MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 r : TRect ;
 p : TPoint ;
begin
   CopyRect ( r, ClientRect ) ;
   InflateRect ( r, -5, -5 ) ;
   FClickable := PtInRect( r, Point( X, Y ) ) and ( FUID <> '' ) ;
   FLink := ( Level > 0 ) and ( Y < Height div 5 + 5 ) ;
   if FClickable then
     begin
        if FLink then
          Cursor := crHandPoint
        else
          Cursor := crIBeam
     end
  else
     Cursor := crDefault ;
end;


constructor TZoo_AnimaisGenealogiaFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  StyleElements := [] ;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  Color := clWhite ;
  FCanvas.Brush.Color := clBtnFace;
 // self.OnKeyDown := DoKeyDown ;
end;


procedure TZoo_AnimaisGenealogiaFrame.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ShowMessage ( 'kd' ) ;
end;

procedure TZoo_AnimaisGenealogiaFrame.EditRecord;
var
   Zoo_EditLinhagemFrame : TZoo_EditLinhagemFrame ;
begin
   with TTcControlPopuper.create ( nil ) do
     try
       Zoo_EditLinhagemFrame := TZoo_EditLinhagemFrame.create ( nil );
       Zoo_EditLinhagemFrame.OpenTables ( FIdentity.UID ) ;
       EnterKeyAction := enterKeyDefault ; // enterKeyNothing ; // enterKeyGotoNextControl
       Control := Zoo_EditLinhagemFrame ;
       ShowModalFromControl( FIdentity );
       Zoo_EditLinhagemFrame.free ;
       TAnimalGenealogy.BuildIdentity( Identity.UID, Identity ) ;
     finally
       free ;
     end ;
end;
       (*
   with TTcControlPopuper.create ( nil ) do
     try
       EditLinhagem := TZoo_EditLinhagemFrame.create ( nil ) ;
       EditLinhagem.OpenTables( AKZOO_ANIMAL ) ;
       Control := EditLinhagem ;
       ShowModal ( Point ( AX, AY ) ) ;

//       Result := ( ModalResult = mrOK  ) ;
//       if Result then
//          FRaca := EditLinhagem.Raca ;
       EditLinhagem.free ;
     finally
       free ;
     end ;
         *)
procedure TZoo_AnimaisGenealogiaFrame.OtherOptions;
begin

end;

procedure TZoo_AnimaisGenealogiaFrame.PrintData;
begin

end;

function TZoo_AnimaisGenealogiaFrame.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daEdit, daPrint ] ;
//   if Application.LicenseState = lsReadOnly then
//      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TZoo_AnimaisGenealogiaFrame.QueryAllowedDataActions: TTcDataActions;
begin
   Result := [ daEdit, daPrint ] ;
end;

procedure TZoo_AnimaisGenealogiaFrame.SetDisableDraw(const Value: boolean);
begin
  FdisableDraw := Value;
end;

procedure TZoo_AnimaisGenealogiaFrame.SetIdentity(const Value: TIdentity);
begin
  FIdentity := Value;
  FSelectedIdentity := FIdentity ;
end;

procedure TZoo_AnimaisGenealogiaFrame.SetOnIdentityClick(const Value: TIdentityClick);
begin
  FOnIdentityClick := Value;
end;

procedure TZoo_AnimaisGenealogiaFrame.WMKeyDown(var Message: TWMPaint);
begin
//    inherited ;
//    showMessage ( 'WM_KEYDOWN' ) ;
end;

procedure TZoo_AnimaisGenealogiaFrame.WMPaint(var Message: TWMPaint);
begin
  if not FDisableDraw then
    begin
      inherited ;
      if Assigned ( FIdentity ) then
        FIdentity.DrawLines ( 0,0, FCanvas ) ;
    end ;
end;


procedure TIdentity.AddParents ;
var
  parentIdentity : TIdentity ;
begin

   if self.fLevel + 1 > fMaxLevel then
      exit ;

   self.fPai := TIdentity.Create ( Self ) ;
   with  self.fPai  do
     begin
       fChild    := self ;
       fLevel    := self.fLevel + 1 ;
       fMaxLevel := self.fMaxLevel ;
       Parent    := fChild.Parent ;
       Genere    := igMale ;
       Top       := fChild.Top - Trunc ( height * Power ( 2, fMaxLevel - fLevel  - 1) )  ;
       Left      := ( (fChild.Left + fChild.Width) + Trunc( fChild.Width * 0.10) )  ; // * fLevel  ;
//       Left      := ( (fChild.Left + fChild.Width) + 20)  ; // * fLevel  ;
       Width     := ( fChild.Width ) ;
       Visible   := True  ;
//       FCaption  := intToStr ( fLevel  ) + ' Pai de ' + intToStr ( fLevel - 1 ) ;
       AddParents ;
     end ;

    self.fMae := TIdentity.Create ( Self ) ;
    with self.fMae do
      begin
       fChild      := self ;
       fLevel      := self.fLevel + 1 ;
       fMaxLevel   := self.fMaxLevel ;
       Genere      := igFemale ;
       Parent      := fChild.Parent ;
       Top         := fChild.Top + Trunc ( height * Power ( 2, fMaxLevel - fLevel  - 1) )  ;
       Left      := ( (fChild.Left + fChild.Width) + Trunc( fChild.Width * 0.10) )  ; // * fLevel  ;
//       Left      := ( (fChild.Left + fChild.Width) + 20)  ; // * fLevel  ;
       Width     := ( fChild.Width ) ;
       Visible     := True ;
    //         FCaption    := intToStr ( fLevel  ) + ' Mae de ' + intToStr ( fLevel - 1 ) ;
       AddParents ;
      end ;

end;

procedure TIdentity.Click;
begin
  inherited;

  if FClickable and Assigned ( TZoo_AnimaisGenealogiaFrame ( Parent ).FOnIdentityClick ) then
     TZoo_AnimaisGenealogiaFrame ( Parent ).FOnIdentityClick ( self, FLink ) ;

end;

constructor TIdentity.Create(AOwner: TComponent );
begin
  inherited Create ( AOwner ) ;
  OnMouseMove := MouseMove ;
  OnPaint := doPaint ;
  Left   := 30 ;
  Top    := 1 ;
  Width  := 200 ;
  Height := 62;
//  Shape  := stRoundRect ;

end;

procedure TIdentity.PaintToCanvas( AX,AY : integer ; ACanvas : TCanvas );
var
  r : TRect ;
begin
   if FGenere = igMale then
     ACanvas.Pen.Color := clBlue
   else if FGenere = igFemale then
     ACanvas.Pen.Color := clRed ;

  if ( UID = '' ) and ( FCaption = '' ) then //and ( TIdentity(Sender).FCaption = '' ) then
     ACanvas.Pen.Color := clSilver ;

   CopyRect ( r, ClientRect ) ;
   r.Left    := AX + r.Left + Trunc( ( r.Right - r.Left ) * 0.10 )  ;
   r.Right   := AX + r.Right ;
   r.Top     := AY + r.Top ;
   r.Bottom  := AY + r.Bottom - 2 ;
//   ACanvas.Pen.Width := 10 ;
   ACanvas.RoundRect( r, 10, 10 );

   if Assigned ( fChild ) then
     begin
       ACanvas.MoveTo( r.Left, AY + ((ClientRect.Bottom -  ClientRect.Top) div 2) );
       ACanvas.LineTo( AX + ClientRect.Left, AY + ((ClientRect.Bottom -  ClientRect.Top) div 2) );
     end;

   ACanvas.Font.Name := 'Verdana' ;
   ACanvas.Font.Size := 7 ;
   ACanvas.Font.Style := [fsBold] ;

   if ( UID <> '' ) and Assigned ( FChild ) then
     begin
       ACanvas.Font.Color := clBlue ;
       ACanvas.Font.Style := ACanvas.Font.Style + [ fsUnderline ] ;
     end;
   ACanvas.Brush.Style := bsClear ;

   ACanvas.TextRect( r, AX + 23, AY + 1, Caption  ) ;
   //ACanvas.TextOut( AX + 23, AY + 1,  FCaption  );

   ACanvas.Font.Style := [] ;
   ACanvas.Font.Color := clBlack ;
   ACanvas.TextRect( r, AX + 23, AY + (Height div 5 * 1 - 1), FInfo1 );
   ACanvas.TextRect( r, AX + 23, AY + (Height div 5 * 2 - 1), FInfo2 );
   ACanvas.TextRect( r, AX + 23, AY + (Height div 5 * 3 - 1), FInfo3 );
   ACanvas.TextRect( r, AX + 23, AY + (Height div 5 * 4 - 1), FInfo4 );
end;

procedure TIdentity.doPaint(Sender: TObject);
begin
  PaintToCanvas( 0, 0, Canvas );
end;
(*
procedure TIdentity.doPaint(Sender: TObject);
var
  r : TRect ;
begin
   if TIdentity(Sender).FGenere = igMale then
     Canvas.Pen.Color := clBlue
   else if TIdentity(Sender).FGenere = igFemale then
     Canvas.Pen.Color := clRed ;

  if ( TIdentity(Sender).UID = '' ) and ( TIdentity(Sender).FCaption = '' ) then //and ( TIdentity(Sender).FCaption = '' ) then
     Canvas.Pen.Color := clSilver ;

   CopyRect ( r, ClientRect ) ;
   r.Left := r.Left + 20 ;
   r.Bottom := r.Bottom - 2 ;
//   Canvas.Pen.Width := 10 ;
   Canvas.RoundRect( r, 10, 10 );

   if Assigned ( fChild ) then
      begin
       Canvas.MoveTo( r.Left, (ClientRect.Bottom -  ClientRect.Top) div 2 );
       Canvas.LineTo( ClientRect.Left, (ClientRect.Bottom -  ClientRect.Top) div 2 );
      end;

   Canvas.Font.Name := 'Verdana' ;
   Canvas.Font.Size := 7 ;
   Canvas.Font.Style := [fsBold] ;

   if ( TIdentity(Sender).UID <> '' ) and Assigned ( fChild ) then
     begin
      Canvas.Font.Color := clBlue ;
      Canvas.Font.Style := Canvas.Font.Style + [ fsUnderline ] ;
     end;
   Canvas.Brush.Style := bsClear ;
//      Canvas.TextOut( 2, 2, LowerCase (  FCaption ) );
    Canvas.TextOut( 23, 1,  FCaption  );

    Canvas.Font.Style := [] ;
    Canvas.Font.Color := clBlack ;
    Canvas.TextOut( 23, Height div 5 * 1 - 1, FInfo1 );
    Canvas.TextOut( 23, Height div 5 * 2 - 1, FInfo2 );
    Canvas.TextOut( 23, Height div 5 * 3 - 1, FInfo3 );
    Canvas.TextOut( 23, Height div 5 * 4 - 1, FInfo4 );
end;
*)
procedure TIdentity.DrawLines ( AX,AY : integer ; ACanvas : TCanvas ) ;
begin
  if Assigned ( FChild ) then
   begin
    ACanvas.Pen.Width:= 1 ;
    ACanvas.MoveTo( AX + Left, AY + Top + ( Height div 2 ) );
    if Genere = igMale then
      begin
         if ( FUID = '' ) and ( FCaption = '' ) then
            ACanvas.Pen.Color:= clSilver
         else
            ACanvas.Pen.Color:= clBlue ;

//         ACanvas.LineTo( FChild.Left +  FChild.Width -1, FChild.Top );
         ACanvas.LineTo( AX + FChild.Left +  FChild.Width -1, AY + FChild.Top + ( FChild.Height div 2 ) );
      end
    else
      begin
         if ( FUID = '' ) and ( FCaption = '' ) then
            ACanvas.Pen.Color:= clSilver
         else
            ACanvas.Pen.Color:= clRed ;
//         ACanvas.LineTo( FChild.Left + FChild.Width  - 1, FChild.Top + FChild.Height );
         ACanvas.LineTo( AX + FChild.Left + FChild.Width -1, AY + FChild.Top + ( FChild.Height div 2 ) );
      end;
   end ;
  if Assigned ( FPai ) then
     FPai.DrawLines( AX, AY, ACanvas ) ;
  if Assigned ( FMae ) then
     FMae.DrawLines( AX, AY, ACanvas ) ;
end;

class function TIdentity.Make( AParent : TWinControl ; MaxLevel: integer ; AWidth : integer = 200 ) : TIdentity ;
begin
     Result := TIdentity.Create ( Application ) ;
     with Result  do
       begin
        Parent  := AParent ;
        fChild  := nil ;
        fLevel  := 0 ;
        fMaxLevel := MaxLevel ;
        Caption := '0' ;
        Top :=  Trunc ( Height * Power ( 2, MaxLevel ) ) div 2  ; // ( Height * MaxLevel  ) div 2  ;
        Left := 30 ;
        Width :=  AWidth ;
        Visible := True  ;
        FUID     := '' ;
        FCaption := '' ;
        AddParents ;
       end
end;


procedure TIdentity.Reset;
begin
   FHasData := False ;

   FCaption := '' ;
   FUID     := '' ;
   FInfo1   := '' ;
   FInfo2   := '' ;
   FInfo3   := '' ;
   FInfo4   := '' ;

  if Assigned ( FPai ) then
     FPai.Reset ;
  if Assigned ( FMae ) then
     FMae.Reset ;
end;

procedure TIdentity.SetCaption(const Value: string);
begin
  FHasData := True ;
  FCaption := Value;
end;

procedure TIdentity.SetGenere(const Value: TIdentityGenere);
begin
  FHasData := True ;
  FGenere := Value;
end;

procedure TIdentity.SetInfo1(const Value: string);
begin
  FHasData := True ;
  FInfo1 := Value;
end;

procedure TIdentity.SetInfo2(const Value: string);
begin
  FHasData := True ;
  FInfo2 := Value;
end;

procedure TIdentity.SetInfo3(const Value: string);
begin
  FHasData := True ;
  FInfo3 := Value;
end;

procedure TIdentity.SetInfo4(const Value: string);
begin
  FHasData := True ;
  FInfo4 := Value;
end;

procedure TIdentity.SetUID(const Value: string);
begin
  FHasData := True ;
  FUID := Value;
end;


class procedure TAnimalGenealogy.BuildIdentity(AKZOO_ANIMAL: string;  Identity: TIdentity ) ;
var
  cdsAnimal, cds : TClientDataSet ;
  p : TParams ;

   function GetPai ( pI : TIdentity ) : boolean ;
   begin
    Result := False ;

    if not cds.Locate( 'KZOO_ANIMAL_CHILD;TIPOPARENTESCO;PARENTLEVEL', VarArrayOf ( [ pi.child.UID, 1, pi.Level ] ), [] ) then
      exit ;

    with cds do
     begin
       pi.UID     := fieldByName ( 'KZOO_ANIMAL_PARENT' ).AsString ;
       pi.Caption := Trim ( fieldByName ( 'BRINCO' ).AsString + ' ' + fieldByName ( 'NOMECOMPLETO' ).AsString ) ;
       pi.Info1   := Trim ( Format ( '%s %s Reg : %s', [ fieldByName ( 'GRAUSANGUE' ).asString, fieldByName ( 'COMPOSICAORACA' ).asString, fieldByName ( 'REGISTRO' ).asString ] ) ) ;
       pi.Info2   := Format ( 'PTA Leite: %f',    [ fieldByName ( 'DS_LEITE'    ).asFloat ] ) ;
       pi.Info3   := Format ( 'PTA Gordura: %f',  [ fieldByName ( 'DS_GORDURA'  ).asFloat ] ) ;
       pi.Info4   := Format ( 'PTA Proteína: %f', [ fieldByName ( 'DS_PROTEINA' ).asFloat ] ) ;
     end ;

     Result := True ;

   end ;

   function GetMae ( pI : TIdentity ) : boolean ;
   begin

    Result := false ;

    if not cds.Locate( 'KZOO_ANIMAL_CHILD;TIPOPARENTESCO;PARENTLEVEL', VarArrayOf ( [ pi.child.UID, 2, pi.Level ] ), [] ) then
      exit ;

    with cds do
     begin
       pi.UID     := fieldByName ( 'KZOO_ANIMAL_PARENT' ).AsString ;
       pi.Caption := Trim ( fieldByName ( 'BRINCO' ).AsString + ' ' + fieldByName ( 'NOMEESTABULO' ).AsString ) ;
       pi.Info1   := fieldByName ( 'NOMECOMPLETO' ).AsString  ;
       pi.Info2   := Format ( '◊ %s  Reg: %s',
             [ fieldByName ( 'NASCIMENTO' ).asString,
               fieldByName ( 'REGISTRO' ).asString ] ) ;
       pi.Info3   := Trim ( Format ( '%s %s',
             [ fieldByName ( 'GRAUSANGUE' ).asString,
               fieldByName ( 'COMPOSICAORACA' ).asString ] ) ) ;
       pi.Info4   := Format ( 'NL: %d    PLT %f', [ fieldByName ( 'NUMERO_LACTACAO' ).asInteger, fieldByName ( 'PLT' ).asFloat ] ) ;
     end ;

     Result := True ;
   end ;

   procedure GetPaiMae ( pI : TIdentity ) ;
   begin

      if Assigned ( pi.Pai ) and GetPai( pi.Pai ) then
        GetPaiMae ( pi.Pai ) ;
     if Assigned ( pi.Mae ) and GetMae ( pi.Mae ) then
        GetPaiMae ( pi.Mae ) ;
   end ;

begin

  Identity.Reset ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := AKZOO_ANIMAL ;

  cdsAnimal := nil ;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsAnimal,
         'A.KZOO_ANIMAL, A.NOMEESTABULO,A.BRINCO,A.NOMECOMPLETO,A.REGISTRO,A.GRAUSANGUE, A.COMPOSICAORACA,'
     // -- DADOS ESPECIFICOS MACHO
         +#13#10' DEM.KZOO_ANIMAL_MACHO, DEM.DS_LEITE, DEM.DS_GORDURA, DEM.DS_PROTEINA,'
     // -- DADOS ESPECIFICOS FEMEA
         +#13#10' DEF.NASCIMENTO, DEF.NUMERO_LACTACAO, L.PLT'
         +#13#10' FROM ZOO_ANIMAIS A'
         +#13#10' LEFT JOIN ZOO_ANIMAIS_MACHO   DEM ON ( DEM.KZOO_ANIMAL_MACHO = A.KZOO_ANIMAL )'
         +#13#10' LEFT JOIN ZOO_ANIMAIS_FEMEA   DEF ON ( DEF.KZOO_ANIMAL_FEMEA = A.KZOO_ANIMAL )'
         +#13#10' LEFT JOIN ZOO_LACTACOES       L   ON ( L.KZOO_LACTACAO       = DEF.KULTIMA_LACTACAO )'
         +#13#10'WHERE ( A.KZOO_ANIMAL = :KZOO_ANIMAL )'
      , p );

  cds := nil ;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,
                'G.KZOO_ANIMAL_CHILD, G.TIPOPARENTESCO, G.PARENTLEVEL, G.KZOO_ANIMAL_PARENT,'
     // -- PAI                                                                                         -- MAE
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.BRINCO,  LP.BRINCO ),                   COALESCE ( DF.BRINCO,  LM.BRINCO )                  ) BRINCO,'
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.NOMEESTABULO, G.NOMEANIMAL_PARENTE ),   COALESCE ( DF.NOMEESTABULO, G.NOMEANIMAL_PARENTE )  ) NOMEESTABULO,'
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.NOMECOMPLETO, G.NOMEANIMAL_PARENTE ),   COALESCE ( DF.NOMECOMPLETO, G.NOMEANIMAL_PARENTE )  ) NOMECOMPLETO,'
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.REGISTRO, LP.REGISTROPAI ),             COALESCE ( DF.REGISTRO, LM.REGISTROMAE )            ) REGISTRO,'
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.GRAUSANGUE, LP.GRAUSANGUEPAI ),         COALESCE ( DF.GRAUSANGUE, LM.GRAUSANGUEMAE )        ) GRAUSANGUE,'
         +#13#10' IIF ( G.TIPOPARENTESCO = 1,  COALESCE ( DM.COMPOSICAORACA, LP.COMPOSICAORACAPAI ), COALESCE ( DF.COMPOSICAORACA, LM.COMPOSICAORACAMAE )) COMPOSICAORACA,'
     // -- DADOS ESPECIFICOS MACHO
         +#13#10' DEM.KZOO_ANIMAL_MACHO, DEM.DS_LEITE, DEM.DS_GORDURA, DEM.DS_PROTEINA,'
     // -- DADOS ESPECIFICOS FEMEA
         +#13#10' DEF.NASCIMENTO, DEF.NUMERO_LACTACAO, L.PLT'
     // -- LINHAGEM...
         +#13#10' from ZOO_GENEALOGIA_ANIMAL ( :KZOO_ANIMAL ) G'
         +#13#10' LEFT JOIN ZOO_ANIMAL_LINHAGEM LP  ON ( G.TIPOPARENTESCO = 1 AND LP.KZOO_ANIMAL           = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_ANIMAIS         DM  ON ( G.TIPOPARENTESCO = 1 AND DM.KZOO_ANIMAL           = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_ANIMAIS_MACHO   DEM ON ( G.TIPOPARENTESCO = 1 AND DEM.KZOO_ANIMAL_MACHO    = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_ANIMAL_LINHAGEM LM  ON ( G.TIPOPARENTESCO = 2 AND LM.KZOO_ANIMAL           = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_ANIMAIS         DF  ON ( G.TIPOPARENTESCO = 2 AND DF.KZOO_ANIMAL           = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_ANIMAIS_FEMEA   DEF ON ( G.TIPOPARENTESCO = 2 AND DEF.KZOO_ANIMAL_FEMEA    = G.KZOO_ANIMAL_PARENT )'
         +#13#10' LEFT JOIN ZOO_LACTACOES       L   ON ( G.TIPOPARENTESCO = 2 AND L.KZOO_LACTACAO          = DEF.KULTIMA_LACTACAO )'
      , p );

 // dados do animal
 with Identity, cdsAnimal do
   if not fieldByName ( 'KZOO_ANIMAL_MACHO' ).IsNull then
     begin
       UID     := fieldByName ( 'KZOO_ANIMAL' ).AsString ;
       Caption := Trim ( fieldByName ( 'BRINCO' ).AsString + ' ' + fieldByName ( 'NOMECOMPLETO' ).AsString ) ;
       Info1   := Trim ( Format ( '%s %s Reg : %s', [ fieldByName ( 'GRAUSANGUE' ).asString, fieldByName ( 'COMPOSICAORACA' ).asString, fieldByName ( 'REGISTRO' ).asString ] ) ) ;
       Info2   := Format ( 'PTA Leite: %f',    [ fieldByName ( 'DS_LEITE'    ).asFloat ] ) ;
       Info3   := Format ( 'PTA Gordura: %f',  [ fieldByName ( 'DS_GORDURA'  ).asFloat ] ) ;
       Info4   := Format ( 'PTA Proteína: %f', [ fieldByName ( 'DS_PROTEINA' ).asFloat ] ) ;
     end
   else
     begin
       UID     := fieldByName ( 'KZOO_ANIMAL' ).AsString ;
       Caption := Trim ( fieldByName ( 'BRINCO' ).AsString + ' ' + fieldByName ( 'NOMEESTABULO' ).AsString ) ;
       Info1   := fieldByName ( 'NOMECOMPLETO' ).AsString  ;
       Info2   := Format ( '◊ %s  Reg: %s',
             [ fieldByName ( 'NASCIMENTO' ).asString,
               fieldByName ( 'REGISTRO' ).asString ] ) ;
       Info3   := Trim ( Format ( '%s %s',
             [ fieldByName ( 'GRAUSANGUE' ).asString,
               fieldByName ( 'COMPOSICAORACA' ).asString ] ) ) ;
       Info4   := Format ( 'NL: %d    PLT %f', [ fieldByName ( 'NUMERO_LACTACAO' ).asInteger, fieldByName ( 'PLT' ).asFloat ] ) ;
     end;

 try

   if cds.IsEmpty then
     exit ;

   GetPaiMae ( Identity ) ;

  finally
     cdsAnimal.free ;
     cds.Free ;
     p.free ;
  end ;

end;


end.

