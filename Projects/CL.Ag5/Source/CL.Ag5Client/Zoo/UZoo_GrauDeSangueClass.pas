unit UZoo_GrauDeSangueClass;

interface

uses
  Tc.RTL.Math2, WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.StdCtrls, VCL.Mask, JvExMask, Tc.VCL.Edits, VCL.DBCtrls, VCL.ExtCtrls,
  CheckLst, VCL.Buttons, Tc.VCL.FloatPanel, JvToolEdit, JvDBControls,
  Tc.VCL.Dialogs  ;

type
  TMaiorGrauSanguePaiMae = ( gsPai, gsMae ) ;

  TZoo_GrauDeSangue = class
  private
    { Private declarations }
    FGrauSangueMae: string;
    FGrauSangue: string;
    FGrauSanguePai: string;
    FRacaMae: string;
    FRaca: string;
    FRacaPai: string;
    FListaRacas: string;
    FRacaCount : integer ;
    FMaiorGrau : TMaiorGrauSanguePaiMae ;
    procedure SetGrauSangue(const Value: string);
    procedure SetGrauSangueMae(const Value: string);
    procedure SetGrauSanguePai(const Value: string);
    procedure SetRaca(const Value: string);
    procedure SetRacaMae(const Value: string);
    procedure SetRacaPai(const Value: string);
    procedure SetListaRacas(const Value: string);
    function GetOrderedList( AList : string ) : string ;
    function IsSame : boolean ;
    procedure ReorderRaca;
  public
    { Public declarations }
    function PopupListaRacas ( AControl : TControl ) : boolean ;
    procedure GetGrausSangue ( AList : TStrings ) ;
    procedure Calculate ;
    property RacaPai : string  read FRacaPai write SetRacaPai;
    property RacaMae : string  read FRacaMae write SetRacaMae;
    property Raca    : string  read FRaca write SetRaca;
    property ListaRacas   : string   read FListaRacas write SetListaRacas;
    property GrauSanguePai : string  read FGrauSanguePai write SetGrauSanguePai;
    property GrauSangueMae : string  read FGrauSangueMae write SetGrauSangueMae;
    property GrauSangue    : string  read FGrauSangue write SetGrauSangue;
    constructor Create ;
    destructor Destroy ; override ;
  end;

  TCalculoGrauDeSangue = class
    class function Calculate(AFractionPai, AFractionMae: string; out AResult: string ; out MaiorGrau : TMaiorGrauSanguePaiMae ): boolean;
  end;

  TGSValidate = ( gsvGrauSangue, gsvRaca, gsvBoth ) ;

  TValidateGrauDeSangue = class
    class procedure Validate(AFractionPai, ARacaPai, AFractionMae, ARacaMae, AFraction, ARaca : string ; AValidate : TGSValidate ; AQueryUser : boolean ) ;
  end;

implementation

uses UZoo_ListaRacasFrame,
     Tc.VCL.ControlPopuper,
     Exceptions ;


type
  TGrauSangue = class
    strict private
      const
         GS : array[0..13] of string =
           (    '1/1', '31/32',   '15/16',   '7/8',  '13/16',    '3/4',   '11/16',  '5/8',    '9/16',    '1/2',   '7/16',    '3/8',  '5/16',    '1/4' ) ;


         TGS : array[0..13,0..13] of string  =
          (
            (   '1/1',   '1/1',  '31/32',  '15/16',    '7/8',    '7/8',    '7/8',  '13/16',  '13/16',    '3/4',    '3/4',  '11/16',   '5/8',    '5/8' ) ,
            (   '1/1', '31/32',  '15/16',    '7/8',    '7/8',    '7/8',    '7/8',  '13/16',    '3/4',    '3/4',    '3/4',  '11/16',   '7/8',    '5/8' ) ,
            ( '31/32', '15/16',  '15/16',  '15/16',    '7/8',    '7/8',  '13/16',  '13/16',    '3/4',  '23/32',    '3/4',  '11/16',   '6/8',    '5/8' ) ,
            ( '15/16', '15/16',    '7/8',    '7/8',    '7/8',  '13/16',  '13/16',    '3/4',    '3/4',  '11/16',    '5/8',    '5/8',   '5/8',    '5/8' ) ,
            ( '15/16',   '7/8',    '7/8',    '7/8',    '7/8',  '13/16',    '3/4',    '3/4',  '11/16',  '11/16',    '5/8',    '5/8',   '5/8',    '4/8' ) ,
            (   '7/8',   '7/8',    '7/8',  '13/16',    '3/4',    '3/4',    '3/4',  '11/16',  '11/16',    '5/8',    '5/8',    '5/8',   '1/2',    '1/2' ) ,
            (   '7/8',   '7/8',    '3/4',    '3/4',    '3/4',    '3/4',  '11/16',  '11/16',    '5/8',    '5/8',    '5/8',    '1/2',   '1/2',    '1/2' ) ,
            ( '13/16',   '3/4',    '3/4',    '3/4',    '3/4',  '11/16',  '11/16',    '5/8',    '5/8',    '5/8',    '1/2',    '1/2',   '1/2',   '7/16' ) ,
            (   '3/4',   '3/4',    '3/4',    '3/4',  '11/16',    '5/8',    '5/8',    '5/8',   '9/16',    '1/2',    '1/2',    '1/2',  '7/16',    '3/8' ) ,
            (   '3/4',   '1/2',    '1/2',    '5/8',    '5/8',    '5/8',    '5/8',   '9/16',   '9/16',    '1/2',   '7/16',   '7/16',   '3/8',    '3/8' ) ,
            (   '3/4',   '1/2',  '11/16',    '5/8',    '5/8',    '5/8',   '9/16',    '1/2',    '1/2',    '1/2',   '7/16',    '3/8',   '3/8',  '11/32' ) ,
            (   '5/8', '11/16',  '11/16',    '5/8',    '5/8',    '5/8',   '9/16',    '1/2',    '1/2',   '7/16',    '3/8',    '3/8',   '3/8',   '5/16' ) ,
            (   '5/8',   '5/8',   ' 5/8',    '5/8',    '5/8',    '4/8',    '1/2',    '1/2',   '7/16',   '7/16',    '3/8',    '3/8',   '3/8',   '5/16' ) ,
            (   '5/8',   '5/8',    '5/8',    '5/8',    '1/2',    '1/2',    '1/2',   '7/16',   '7/16',    '3/8',   '5/16',    '1/4',   '1/4',    '1/4' )

         ) ;
       class function GetIndex ( F : string ) : integer ;
    public
       class function GetGS ( F1, F2 : string ) : string ;
       class procedure GetGrausSangue ( AList : TStrings ) ;
  end;

{ GrauSangue }

class procedure TGrauSangue.GetGrausSangue(AList: TStrings);
var
  G : integer ;
begin
  for G := Low(GS) to High(GS) do
    AList.Add ( GS[ g ] ) ;
end;

class function TGrauSangue.GetGS(F1, F2: string): string;
begin
    Result := TGS [ GetIndex( F1 ), GetIndex( F2 ) ] ;
end;

class function TGrauSangue.GetIndex(F: string): integer;
begin
  for Result := Low(GS) to High(GS) do
    if GS[Result] = F then
       exit  ;
  Result := 0 ;
end;

class function TCalculoGrauDeSangue.Calculate(AFractionPai, AFractionMae: string; out AResult: string ; out MaiorGrau : TMaiorGrauSanguePaiMae  ): boolean;
var
  GrauPai, GrauMae: extended;
  ReduceDecimal: extended;
begin
  { separate the integer and fractional parts of the input decimal number }
  { count numbers,N, to the right of the decimal point and set 10^N as denominator
    and fractional part converted to integer as numerator }

  AResult := TGrauSangue.GetGS(AFractionPai, AFractionMae) ;

  with TFraction.Create do
    try

      StringToDecimal(Trim(AFractionPai), GrauPai) ;

      StringToDecimal(Trim(AFractionMae), GrauMae) ;

      if GrauPai > GrauMae then
         MaiorGrau := gsPai
      else
         MaiorGrau := gsMae ;

      if (AFractionPai = '') or (AFractionMae = '') then
        begin
          result := False;
          exit;
        end;

      result := True;

    finally
      free;
    end;
end;


(*
class function TCalculoGrauDeSangue.Calculate(AFractionPai, AFractionMae: string; out AResult: string ; out MaiorGrau : TMaiorGrauSanguePaiMae  ): boolean;
var
  GrauPai, GrauMae: extended;
  ReduceDecimal: extended;
begin
  { separate the integer and fractional parts of the input decimal number }
  { count numbers,N, to the right of the decimal point and set 10^N as denominator
    and fractional part converted to integer as numerator }
  AResult := '';

  with TFraction.Create do
    try

      if StringToDecimal(Trim(AFractionPai), GrauPai) then
        begin

          if GrauPai > 1 then
            begin
              GrauPai := Trunc(GrauPai) / 100;
              AFractionPai := DecimalToFraction(GrauPai, 64, False);
            end
          else if GrauPai = 1 then
            AFractionPai := '1/1'
          else if GrauPai > 0 then
            AFractionPai := DecimalToFraction(GrauPai, 64, False)
          else
            AFractionMae := '';
        end;

      if StringToDecimal(Trim(AFractionMae), GrauMae) then
        begin
          if GrauMae > 1 then
            begin
              GrauMae := Trunc(GrauMae) / 100;
              AFractionMae := DecimalToFraction(GrauMae, 64, False);
            end
          else if GrauMae = 1 then
            AFractionMae := '1/1'
          else if GrauMae > 0 then
            AFractionMae := DecimalToFraction(GrauMae, 64, False)
          else
            AFractionMae := '';
        end;

      if GrauPai > GrauMae then
         MaiorGrau := gsPai
      else
         MaiorGrau := gsMae ;

      if (AFractionPai = '') or (AFractionMae = '') then
        begin
          result := False;
          exit;
        end;

      result := True;

      if (AFractionPai = '1/1') or (AFractionMae = '1/1') then
        AResult := DecimalToFraction((GrauPai + GrauMae) / 2, 64, False)
      else
        begin
          AResult := Multiply(AFractionPai, AFractionMae, 200);
          if GetDenominator(AResult) > 100 then
            begin
              StringToDecimal(AResult, ReduceDecimal);
              AResult := DecimalToFraction(ReduceDecimal, 64, False);
            end;
        end;

    finally
      free;
    end;
end;

*)


{ TZoo_GrauDeSangue }

procedure TZoo_GrauDeSangue.Calculate;
begin

  if IsSame then
    exit ;

  TCalculoGrauDeSangue.Calculate(FGrauSanguePai, FGrauSangueMae, FGrauSangue, FMaiorGrau ) ;

  ReorderRaca;

  if (FGrauSangue = '1') and (FRacaCount > 1) then
    FGrauSangue := '1/2';

end;

constructor TZoo_GrauDeSangue.Create;
begin
//
end;

destructor TZoo_GrauDeSangue.Destroy;
begin
  inherited;
end;

procedure TZoo_GrauDeSangue.ReorderRaca;
var
  TmpListRacas2: TStringList;
  Idx1: Integer;
  TmpListRacas1: TStringList;
begin
  TmpListRacas1 := TStringList.Create;
  TmpListRacas2 := TStringList.Create;
  if FMaiorGrau = gsPai then
    begin
      TmpListRacas1.CommaText := RacaPai;  // 1o pai
      TmpListRacas2.CommaText := RacaMae;
    end
  else
    begin
      TmpListRacas1.CommaText := RacaMae;  // 1o Mae
      TmpListRacas2.CommaText := RacaPai;
    end;

  while (TmpListRacas2.Count > 0) do
    begin
      Idx1 := TmpListRacas1.IndexOf(TmpListRacas2[0]);
      if (Idx1 = -1) then
        TmpListRacas1.Add(TmpListRacas2[0])
      else if Idx1 > 0 then
        TmpListRacas1.Move(Idx1, Idx1 - 1);
      TmpListRacas2.Delete(0);
    end;

  TmpListRacas2.Free;
  FRaca      := TmpListRacas1.CommaText;
  FRacaCount := TmpListRacas1.Count ;
  TmpListRacas1.Free;
end;

function TZoo_GrauDeSangue.IsSame : boolean ;
begin
  Result := (FGrauSanguePai = FGrauSangueMae)
        and (GetOrderedList(FRacaPai) = GetOrderedList(FRacaMae)) ;
  if Result then
  begin
    FRaca       := FRacaPai;
    FGrauSangue := FGrauSanguePai;
  end;
end;

procedure TZoo_GrauDeSangue.GetGrausSangue(AList: TStrings);
begin
  AList.BeginUpdate ;
  AList.Clear ;
  TGrauSangue.GetGrausSangue(AList) ;
  AList.EndUpdate ;
end;

function TZoo_GrauDeSangue.GetOrderedList(AList: string): string;
var
  LTmpList : TStringList ;
begin
  LTmpList := TStringList.Create ;
  LTmpList.CommaText := AList ;
  LTmpList.Sort ;
  Result := LTmpList.CommaText ;
  LTmpList.Free ;
end;

function TZoo_GrauDeSangue.PopupListaRacas ( AControl : TControl ) : boolean ;
var
   ListaRacas : TZoo_ListaRacasFrame ;
begin
   with TTcControlPopuper.create ( nil ) do
     try
       ListaRacas := TZoo_ListaRacasFrame.create ( nil );
       ListaRacas.ListRacas := FListaRacas ;
       ListaRacas.Raca      := FRaca ;
       Control := ListaRacas ;
       if ListaRacas.Height + ( AControl.Parent ).ClientToScreen ( Point ( AControl.Left, AControl.Top ) ).Y + AControl.Height > Screen.Height then
          ShowModalFromControl( AControl, 0, -( ListaRacas.Height + AControl.Height ) )
       else
          ShowModalFromControl( AControl ) ;

       Result := ( ModalResult = mrOK  ) ;
       if Result then
          FRaca := ListaRacas.Raca ;
       ListaRacas.free ;
     finally
       free ;
     end ;
end;

procedure TZoo_GrauDeSangue.SetGrauSangue(const Value: string);
var
  gs : string ;
  posSpace : integer ;
begin
  gs := Trim ( Value ) ;
  posSpace := Pos ( ' ', gs ) ;
  if posSpace > 0 then
    gs := Copy ( gs, 1, posSpace -1 ) ;
  FGrauSangue := gs ;
end;

procedure TZoo_GrauDeSangue.SetGrauSangueMae(const Value: string);
var
  gs : string ;
  posSpace : integer ;
begin
  gs := Trim ( Value ) ;
  posSpace := Pos ( ' ', gs ) ;
  if posSpace > 0 then
    gs := Copy ( gs, 1, posSpace -1 ) ;
  FGrauSangueMae := gs ;
end;

procedure TZoo_GrauDeSangue.SetGrauSanguePai(const Value: string);
var
  gs : string ;
  posSpace : integer ;
begin
  gs := Trim ( Value ) ;
  posSpace := Pos ( ' ', gs ) ;
  if posSpace > 0 then
    gs := Copy ( gs, 1, posSpace -1 ) ;
  FGrauSanguePai := gs ;
end;

procedure TZoo_GrauDeSangue.SetListaRacas(const Value: string);
begin
  FListaRacas := Value;
end;

procedure TZoo_GrauDeSangue.SetRaca(const Value: string);
begin
  FRaca := Value;
end;

procedure TZoo_GrauDeSangue.SetRacaMae(const Value: string);
begin
  FRacaMae := Value;
end;

procedure TZoo_GrauDeSangue.SetRacaPai(const Value: string);
begin
  FRacaPai := Value;
end;

{ TValidateGrauDeSangue }

class procedure TValidateGrauDeSangue.Validate(AFractionPai, ARacaPai,
  AFractionMae, ARacaMae, AFraction, ARaca: string ; AValidate : TGSValidate ; AQueryUser : boolean ) ;
var
 GS : TZoo_GrauDeSangue ;
 ErrMsg : string ;
begin

 if Pos ( ' ', AFraction ) > 0 then
    AFraction := Copy ( AFraction, 1, Pos ( ' ', AFraction ) - 1 ) ;

 GS := TZoo_GrauDeSangue.Create ;
 GS.GrauSanguePai  := AFractionPai.Trim ;
 GS.RacaPai        := ARacaPai.Trim ;
 GS.GrauSangueMae  := AFractionMae.Trim ;
 GS.RacaMae        := ARacaMae.Trim ;
 GS.Calculate ;

 ErrMsg := '' ;
 if ( AValidate in [ gsvGrauSangue, gsvBoth ] ) and  ( AFraction <> GS.GrauSangue ) then
    ErrMsg := Format ( '%sGrau de sangue %s difere do calculado %s'#13#10, [ ErrMsg, AFraction, GS.GrauSangue ] )  ;

 if ( AValidate in [ gsvRaca, gsvBoth ] ) and  ( ARaca <> GS.Raca ) then
    ErrMsg := Format ( '%sComposição da raça %s difere do calculado %s'#13#10, [ ErrMsg, ARaca, GS.Raca ] )  ;

 GS.Free ;

 if ErrMsg = '' then
    Exit ;

 //Tc.VCL.Dialogs.MessageDlg( ErrMsg + #13#10, mtInformation  ) ;

 if AQueryUser then
    begin
       if Tc.VCL.Dialogs.MessageDlg( ErrMsg + #13#10'Continuar ?', mtConfirmation, [mbYes, mbNo], 0 ) <> mrYes then
          Abort ;  //RaiseException('cancelado') ;
    end
 else
    raise Warning.Create( ErrMsg );

end;

end.
