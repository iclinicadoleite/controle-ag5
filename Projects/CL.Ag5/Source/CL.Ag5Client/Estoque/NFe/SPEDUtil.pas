unit SPEDUtil;

interface

uses { CAPICOM_TLB, MSXML2_TLB, }
  System.SysUtils, VCL.Forms, System.Classes, StrUtils ;


type
  SpedUtils = class
  private
  protected
  public
    class procedure Wait( MSec : cardinal ) ;
    class function Modulo11(Valor: string): String;
    class function FormatDate(const AString: string): String;
    class function FormatDateTime(const AString: string): String;
    class function FormatTimeFromDateTime(const AString: string): String;
    class function FormatTime(const AString: string): String;
    class function StringToFloatDef(const AValue: String; const DefaultValue: Double): Double;
    class function StringToFloat(AValue : String ) : Double ;
//    class function FormatarChaveAcesso(AValue : String ): String;
    class function FormatarNumeroDocumentoFiscal(AValue : String ): String;
    class function FormatStrFloatDef( AValue: String;
        Mask : string = '#,0.00##' ;const DefaultValue: Double = 0.00 ; DisplayZero : boolean = True  ): string ;
    class function Digits ( s : string ) : string ;
    class function Mask_Inscricao( IE, UF : String ) : String;
    class function Mask_ChaveNFe( const AValue : String ): String;
    class function Mask_ChaveNFe4( const AValue : String ): String;
    class function Mask_ChaveEvento4( const AValue : String ): String;
    class function Mask_ChaveCTe( const AValue : String ): String;
    class function Mask_ChaveCTe4 ( const AValue : String ): String;
    class function Mask_CNPJ( const AValue : String ): String;
    class function Mask_CPF( const AValue : String ): String;
    class function Mask_CEP( const AValue : String ): String;
    class function Mask_FONE( const AValue : String ): String;
    class function Mask_NCM( const AValue : String ): String;
    class function Mask_CFOP( const AValue : String ): String;
    class function Mask_DocFiscal( const AValue : String ): String;
    class function Mask_SerieDoc( const AValue : String ): String;
    class function RemoveSpecialChars( const AValue : String ): String;

    class function UFFromKey ( const AValue : String ): String;
    class function AAMMFromKey ( const AValue : String ): String;
    class function CNPJFromKey ( const AValue : String ): String;
    class function MODELOFromKey ( const AValue : String ): String;
    class function TipoNFSeFromKey( const AValue: String): String;
    class function SERIEFromKey ( const AValue : String ): String;
    class function DocumentFromKey ( const AValue : String ): String;
    class function RPSFromKey ( const AValue : String ): String;
    class function SequenceFromKey ( const AValue : String ): String;
    class function NFSeFromKey ( const AValue : String ): String;
    class function DVFromKey ( const AValue : String ): String;
    class function TipoEventoFromKey ( const AValue : String ): String;
    class function SeqEventoFromKey ( const AValue : String ): String;
    class function KeyIsEvento ( const AValue : String ): boolean ;
    class function UFToCodigo ( const AValue : String ): String;
    class function CodigoToUF(const AValue: String): String;
    class function GetTempFolder : String;
//    class function GetNomeCidade ( ACodigoMunicipio : integer ): String;
//    class function GetNomeCidadeUF ( ACodigoMunicipio : integer ; out AUF : string  ): String;
    class function WrapText(const Line, BreakStr: string;
           const BreakChars: System.SysUtils.TSysCharSet; MaxCol: Integer): string; overload ;
    class function WrapText(const Line: string; MaxCol: Integer): string; overload ;
    class function StripEvento( const AValue: String ): String ;

  published

  end;

  TSyncThread  = class ( TThread )
    FThreadMethod : TThreadMethod ;
    FNotifyMethod : TNotifyEvent ;
  protected
    procedure Execute ; override ;
    procedure CheckError ( Sender : TObject ) ;
  public
    constructor  Create ( AMethod : TThreadMethod ; CreateSuspended : Boolean = False ) ; overload ;
    constructor  Create ( AMethod : TNotifyEvent ; CreateSuspended : Boolean = False ) ; overload ;
  end ;

const
   _MASK_CPF       = '999\.999\.999\-99;0' ;
   _MASK_CNPJ      = '99\.999\.999\/9999\-99;0' ;
   _MASK_CHNFe     = '99\-99\/99\.99\.999.999\/9999\-99\-99\-999\-999\.999\.999\-999\.999\.999\-9;0' ;
   _MASK_CHNFe4    = '9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 ;0' ;
   _MASK_CHCCe4    = '9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999;0' ;
   _MASK_CHCTe     = '99\-99\/99\.99\.999.999\/9999\-99\-99\-999\-999\.999\.999\-999\.999\.999\-9;0' ;
   _MASK_CHCTe4    = '9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 ;0' ;
   _MASK_FONE      = '\(99\) 9999\-9999;0' ;
   _MASK_CEP       = '99999\-999;0' ;
   _MASK_CFOP      = '9\.9999;0' ;
   _MASK_NCM       = '9999\.99\.99;0' ;
   _MASK_DOCFISCAL = '999\.999\.999;0' ;
   _MASK_SERIEDOC  = '999' ;

implementation

uses WinApi.Windows,  ComObj, MaskUtils, DateUtils
     //, SPEDIBGE
     ;

{ SpedUtils. }

class function SpedUtils.StringToFloat(AValue: String): Double;
begin
  AValue := Trim( AValue ) ;

  if FormatSettings.DecimalSeparator <> '.' then
     AValue := StringReplace(AValue,'.',FormatSettings.DecimalSeparator,[rfReplaceAll]) ;

  if FormatSettings.DecimalSeparator <> ',' then
     AValue := StringReplace(AValue,',',FormatSettings.DecimalSeparator,[rfReplaceAll]) ;

  Result := StrToFloat(AValue)
end ;


class function SpedUtils.StringToFloatDef(const AValue: String;
  const DefaultValue: Double): Double;
begin
  try
     Result := StringToFloat( AValue ) ;
  except
     Result := DefaultValue ;
  end ;
end ;

class function SpedUtils.StripEvento(const AValue: String): String;
begin
  Result := AValue;
  if Length( Result ) = 52 then
    Result := Copy( Result, 7, 44 );
end;

class function SpedUtils.FormatDate(const AString: string): String;
var
  vTemp: TDateTime;
  FFormato : TFormatSettings;
begin
  try
    FFormato.DateSeparator   := '-';
    FFormato.ShortDateFormat := 'yyyy-mm-dd';
    vTemp := StrToDate(Copy ( AString, 1, 10 ), FFormato);
    Result := DateToStr(vTemp);
  except
    Result := '';
  end;
end;

class function SpedUtils.FormatDateTime(const AString: string): String;
begin
  try
    Result := FormatDate ( Copy ( AString, 1, 10 ) ) + ' ' + Copy ( AString, 12, 8 ) ;
  except
    Result := '';
  end;
end;

class function SpedUtils.FormatTimeFromDateTime(const AString: string): String;
begin
  try
    Result := Copy ( AString, 12, 8 ) ;
  except
    Result := '';
  end;
end;

class function SpedUtils.FormatTime(const AString: string): String;
begin
  try
    Result := Copy ( AString, 1, 8 ) ;
  except
    Result := '';
  end;
end;

class function SpedUtils.FormatarNumeroDocumentoFiscal(
  AValue: String): String;
begin
  AValue := Format ( '%9.9d', [ StrToInt ( SpedUtils.Digits ( AValue ) ) ] ) ;
  Result := copy(AValue,1,3) + '.' + copy(AValue,4,3)+ '.'+
            copy(AValue,7,3);
end;

class function SpedUtils.Modulo11(Valor: string): string;
var
  Soma: integer;
  Contador, Peso, Digito: integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
    if Peso < 9 then
      Peso := Peso + 1
    else
      Peso := 2;
  end;

  Digito := 11 - (Soma mod 11);
  if (Digito > 9) then
    Digito := 0;

  Result := IntToStr(Digito);
end;


class function SpedUtils.FormatStrFloatDef( AValue: String;
  Mask : string = '#,0.00##' ;const DefaultValue: Double = 0.00 ; DisplayZero : boolean = True  ): string ;
var
  Valor : double ;
begin

  Valor := StringToFloatDef( Trim( AValue ), DefaultValue ) ;
  if ( Valor = 0.00 ) and ( not DisplayZero ) then
      Result := ''
  else
      Result := FormatFloat ( Mask, Valor ) ;

end ;

class function SpedUtils.Digits ( s : string ) : string ;
var
    y, x : integer ;
begin
    y := 1 ;

    SetLength ( Result, Length ( s ) ) ;
    for x := 1 to Length ( s ) do
        if ( s [x] in ['0'..'9'] ) then
            begin
               Result [ y ] := s [ x ] ;
              inc ( y ) ;
            end ;
     SetLength ( Result, y - 1 ) ;
end ;

class function SpedUtils.Mask_Inscricao( IE, UF : String ) : String;
Var
    Mask : String;
    DigtosIE : string ;
Begin

    DigtosIE := Digits ( IE ) ;

    if DigtosIE = '' then
       begin
          Result := Trim ( IE ) ;
          exit ;
       end ;

    if      UF = 'AC' Then Mask := '99\.999\.999\/999\-99'  //01.004.823/001-12
    else if UF = 'AL' Then Mask := '999999999'              //24XNNNNND
    else if UF = 'AP' Then Mask := '999999999'              //030123459
    else if UF = 'AM' Then Mask := '99\.999\.999\-9'        //99.999.999-9
    else if UF = 'BA' Then Mask := '999999\-99'             //123456-63
    else if UF = 'CE' Then Mask := '99999999\-9'            //06000001-5
    else if UF = 'DF' Then Mask := '99999999999\-99'        // 07NNNNNNNNN-DD
    else if UF = 'ES' Then Mask := '999999999'              //999999999
    else if UF = 'GO' Then Mask := '99\.999\.999\-9'        //10.987.654-7
    else if UF = 'MA' Then Mask := '999999999'              //999999999
    else if UF = 'MT' Then Mask := '9999999999\-9'          // NNNNNNNNNN-D
    else if UF = 'MS' Then Mask := '999999999'              //999999999
    else if UF = 'MG' Then Mask := '999\.999\.999\/9999'    //062.307.904/0081
    else if UF = 'PA' Then Mask := '99\-999999\-9'          //15-999999-5
    else if UF = 'PB' Then Mask := '99999999\-9'            //06000001-5
    else if UF = 'PR' Then Mask := '99999999\-99'           //0NNNNNNNN-DD
    else if UF = 'PE' Then Mask := '9999999\-99'              //0321418-40    '99\.9\.999\.9999999\-9'
    else if UF = 'PI' Then Mask := '999999999'              //012345679
    else if UF = 'RJ' Then Mask := '99\.999\.99\-9'         //99.999.99-9
    else if ( UF = 'RN' ) and ( Length ( DigtosIE ) = 10 ) Then Mask := '99\.9\.999\.999\-9' // 20.0.040.040-0
    else if UF = 'RN' Then Mask := '99\.999\.999\-9'        // ou 20.040.040-0
    else if UF = 'RS' Then Mask := '999\/9999999'           // 224/3658792
    else if ( UF = 'RO' ) and ( Length ( DigtosIE ) = 9 ) Then Mask := '999\.99999\-9'   // 101.62521-3
    else if UF = 'RO' Then Mask := '0000000099999\-9'          // ou 0000000062521-3
    else if UF = 'RR' Then Mask := '99999999\-9'            // 24006628-1
    else if UF = 'SC' Then Mask := '999\.999\.999'          // 251.040.852
    else if UF = 'SP' Then Mask := '999\.999\.999\.999'       // 110.042.490.114
//    else if UF = 'SP' Then Mask := 'P\-99999999\.9\/999'     //P-01100424.3/002
    else if UF = 'SE' Then Mask := '99999999\-9'           // 27123456-3
    else if UF = 'TO' Then Mask := '99999999999'          // 29010227836
    else Mask    := '00000000000000000' ;

    Result := FormatMaskText ( Mask + ';0' , DigtosIE ) ;
End;

class function SpedUtils.Mask_ChaveEvento4(const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CHCCe4, Digits ( AValue ) );
end;

class function SpedUtils.Mask_ChaveNFe( const AValue : String ): String;
begin
  Result := FormatMaskText( _MASK_CHNFe, Digits ( AValue ) );
end;

class function SpedUtils.Mask_ChaveCTe( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CHCTe, Digits ( AValue ) );
end;

class function SpedUtils.Mask_CNPJ( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CNPJ , Digits ( AValue ) );
end;

class function SpedUtils.Mask_CPF( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CPF , Digits ( AValue ) );
end;

class function SpedUtils.Mask_CEP( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CEP , Digits ( AValue ) );
end;

class function SpedUtils.Mask_FONE( const AValue: String): String;
var
  cFone : string ;
begin
  cFone := Digits ( AValue ) ;
  if Length ( cFone ) > 10 then
    cFone := Copy ( cFone, Length ( cFone ) - 9, 10 ) ;
  Result := FormatMaskText( _MASK_FONE, Digits ( cFone ) );
end;


class function SpedUtils.Mask_NCM( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_NCM, Digits ( AValue ) );
end;

class function SpedUtils.Mask_CFOP( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CFOP, Digits ( AValue ) );
end;

class function SpedUtils.RemoveSpecialChars( const AValue: String): String;
//O uso de caracteres acentuados e símbolos especiais para o preenchimento
// dos campos alfanuméricos devem ser evitados. Os espaços informados no
// início e no final do campo alfanumérico também devem ser evitados;
const
  SpecialChars = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜØøº°' ;
  CommonChars  = 'aaeouaoaeioucuAAEOUAOAEIOUCUOOoo' ;
var
  x, nPos : Integer;
begin
  Result := Trim ( AValue ) ;

  // translate xml chars
  Result := StringReplace(Result,#13#10,'&lt;BR&gt;',[rfReplaceAll]);
  Result := StringReplace(Result,#13,'&lt;BR&gt;',[rfReplaceAll]);
  Result := StringReplace(Result,#10,'&lt;BR&gt;',[rfReplaceAll]);

  Result := StringReplace(Result,'>','&gt;',[rfReplaceAll]);
  Result := StringReplace(Result,'<','&lt;',[rfReplaceAll]);
  Result := StringReplace(Result,'&','&amp;',[rfReplaceAll]);
  Result := StringReplace(Result,'"','&quot;',[rfReplaceAll]);
  Result := StringReplace(Result,'''','&#39;',[rfReplaceAll]);

  // remove accents char
  for x := 1 to Length( Result ) do
    begin
      nPos := Pos( Result[x],SpecialChars) ;
      if ( nPos > 0 ) then
        Result[ x ] := CommonChars[ nPos ] ;

      // remove special chars
      if not ( Result[ x ] in [#32..#126] ) then // idea from Dell
        Result[ x ] := '?' ;

   end ;
  
  // remove double spaces
  While Pos ( '  ', Result ) > 0 do
     Result := StringReplace(Result,'  ',' ',[rfReplaceAll]);

end;

{ TSyncThread }

constructor TSyncThread.Create(AMethod: TThreadMethod;
  CreateSuspended: Boolean);
begin
    inherited Create ( CreateSuspended ) ;
    self.OnTerminate := CheckError ;
    FThreadMethod := AMethod ;
end;

procedure TSyncThread.CheckError(Sender: TObject);
begin
   if Assigned ( self.FatalException ) then
      Raise self.FatalException ;
end;

constructor TSyncThread.Create(AMethod: TNotifyEvent;
  CreateSuspended: Boolean);
begin
    inherited Create ( CreateSuspended ) ;
    self.OnTerminate := CheckError ;
    FNotifyMethod := AMethod ;
end;

procedure TSyncThread.Execute;
begin
  inherited;

  if Assigned ( FThreadMethod ) then
     self.Synchronize( FThreadMethod ) ;

end;

class function SpedUtils.UFFromKey( const AValue: String): String;
begin
  Result := Digits ( copy ( StripEvento( AValue ), 1, 2 ) ) ;
end;

class function SpedUtils.AAMMFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 3, 4 ) ) ;
end;

class function SpedUtils.CNPJFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 7, 14 ) ) ;
end;

class function SpedUtils.MODELOFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 21, 2 ) ) ;
end;

class function SpedUtils.KeyIsEvento ( const AValue : String ): boolean ;
begin
  Result := Length( AValue ) = 52 ;
end ;

class function SpedUtils.TipoEventoFromKey(const AValue: String): String;
begin
  if KeyIsEvento ( AValue ) then
    Result := Digits ( copy ( AValue, 1, 6 ) )
  else
    raise Exception.Create('SpedUtils.TipoEventoFromKey : AValue não é um tipo de evento válido.');
end;

class function SpedUtils.TipoNFSeFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 22, 2 ) ) ;
end;


class function SpedUtils.SERIEFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 23, 3 ) ) ;
end;

class function SpedUtils.DocumentFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 26, 9 ) ) ;
end;

class function SpedUtils.RPSFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( AValue, 26, 9 ) ) ;
    While ( Result <> '' ) and ( Result[1] = '0' ) do
      Result := Copy ( Result, 2, Length ( Result ) - 1 ) ;
end;

class function SpedUtils.SeqEventoFromKey(const AValue: String): String;
begin
  if KeyIsEvento ( AValue ) then
    Result := Digits ( copy ( AValue, 51, 2 ) )
  else
    raise Exception.Create('SpedUtils.SeqEventoFromKey : AValue não é um tipo de evento válido.');
end;

class function SpedUtils.SequenceFromKey( const AValue: String): String;
begin
//    Result := Digits ( copy ( AValue, 35, 9 ) ) ;
    // discard first digit
    Result := Digits ( copy ( StripEvento( AValue ), 36, 8 ) ) ;
end;

class function SpedUtils.DVFromKey( const AValue: String): String;
begin
    Result := Digits ( copy ( StripEvento( AValue ), 44, 1 ) ) ;
end;

class function SpedUtils.UFToCodigo( const AValue: String): String;
const
   SiglasUF  = ';AC;AL;AP;AM;BA;CE;DF;ES;GO;MA;MT;MS;MG;PA;PB;PR;PE;PI;RJ;RN;RS;RO;RR;SC;SP;SE;TO;' ;
   CodigosUF = ';12;27;16;13;29;23;53;32;52;21;51;50;31;15;25;41;26;22;33;24;43;11;14;42;35;28;17;' ;
var
  p : integer ;
begin
 p := Pos ( ';' + AValue + ';',  SiglasUF ) ;
 if P > 0 then
    Result := Copy ( CodigosUF, p + 1, 2 ) ;
end;

class function SpedUtils.CodigoToUF(const AValue: String): String;
const
   SiglasUF  = ';AC;AL;AP;AM;BA;CE;DF;ES;GO;MA;MT;MS;MG;PA;PB;PR;PE;PI;RJ;RN;RS;RO;RR;SC;SP;SE;TO;' ;
   CodigosUF = ';12;27;16;13;29;23;53;32;52;21;51;50;31;15;25;41;26;22;33;24;43;11;14;42;35;28;17;' ;
var
  p : integer ;
begin
 p := Pos ( ';' + AValue + ';',  CodigosUF ) ;
 if P > 0 then
    Result := Copy ( SiglasUF, p +1, 2 ) ;
end;



class function SpedUtils.GetTempFolder: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, tempFolder);
  result := StrPas(tempFolder);
end;

class function SpedUtils.Mask_ChaveNFe4( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CHNFe4, Digits ( AValue ) );
end;

class function SpedUtils.Mask_ChaveCTe4( const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_CHCTe4, Digits ( AValue ) );
end;

class procedure SpedUtils.Wait(MSec : cardinal );
var
  EndTick : DWord ;
begin
  EndTick := GetTickCount() + MSec ;
  While (GetTickCount() < EndTick ) do
     Application.ProcessMessages ;
end;

class function SpedUtils.WrapText(const Line: string; MaxCol: Integer): string;
begin
   Result := WrapText(Line, sLineBreak, [' ', '-', #9, '.'], MaxCol); { do not localize }
end;

class function SpedUtils.WrapText(const Line, BreakStr: string;
  const BreakChars: System.SysUtils.TSysCharSet; MaxCol: Integer): string;
const
  QuoteChars = []; //  QuoteChars = ['''', '"'];
var
  Col, Pos: Integer;
  LinePos, LineLen: Integer;
  BreakLen, BreakPos: Integer;
  QuoteChar, CurChar: Char;
  ExistingBreak: Boolean;
  L: Integer;
begin
  Col := 1;
  Pos := 1;
  LinePos := 1;
  BreakPos := 0;
  QuoteChar := #0;
  ExistingBreak := False;
  LineLen := Length(Line);
  BreakLen := Length(BreakStr);
  Result := '';
  while Pos <= LineLen do
  begin
    CurChar := Line[Pos];
    if CurChar in LeadBytes then
    begin
      L := CharLength(Line, Pos) - 1;
      Inc(Pos, L);
      Inc(Col, L);
    end
    else
    begin
      if CurChar in QuoteChars then
        if QuoteChar = #0 then
          QuoteChar := CurChar
        else if CurChar = QuoteChar then
          QuoteChar := #0;
      if QuoteChar = #0 then
      begin
        if CurChar = BreakStr[1] then
        begin
          ExistingBreak := StrLComp(PChar(BreakStr), PChar(@Line[Pos]), BreakLen) = 0;
          if ExistingBreak then
          begin
            Inc(Pos, BreakLen-1);
            BreakPos := Pos;
          end;
        end;

        if not ExistingBreak then
          if CurChar in BreakChars then
            BreakPos := Pos;
      end;
    end;

    Inc(Pos);
    Inc(Col);

    if not (QuoteChar in QuoteChars) and (ExistingBreak or
      ((Col > MaxCol) and (BreakPos > LinePos))) then
    begin
      Col := 1;
      Result := Result + Copy(Line, LinePos, BreakPos - LinePos + 1);
      if not (CurChar in QuoteChars) then
      begin
        while Pos <= LineLen do
        begin
          if Line[Pos] in BreakChars then
          begin
            Inc(Pos);
            ExistingBreak := False;
          end
          else
          begin
            ExistingBreak := StrLComp(Pointer(@Line[Pos]), sLineBreak, Length(sLineBreak)) = 0;
            if ExistingBreak then
              Inc(Pos, Length(sLineBreak))
            else
              Break;
          end;
        end;
      end;
      if (Pos <= LineLen) and not ExistingBreak then
        Result := Result + BreakStr;

      Inc(BreakPos);
      LinePos := BreakPos;
      Pos := LinePos;
      ExistingBreak := False;
    end;
  end;
  Result := Result + Copy(Line, LinePos, MaxInt);
end;

class function SpedUtils.Mask_DocFiscal(const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_DOCFISCAL , Format ( '%9.9d', [ StrToIntDef ( SpedUtils.Digits ( AValue ), 0 ) ] ) );
end;

class function SpedUtils.Mask_SerieDoc(const AValue: String): String;
begin
  Result := FormatMaskText( _MASK_SERIEDOC, Format ( '%3.3d', [ StrToIntDef ( SpedUtils.Digits ( AValue ), 0 ) ] ) );
end;

class function SpedUtils.NFSeFromKey(const AValue: String): String;
begin
    Result := Digits ( copy ( AValue, 36, 8 ) ) ;
    While ( Result <> '' ) and ( Result[1] = '0' ) do
      Result := Copy ( Result, 2, Length ( Result ) - 1 ) ;
end;
(*
class function SpedUtils.GetNomeCidade ( ACodigoMunicipio : integer ): String;
var
  ATmpCodigo : string ;
begin
   ATmpCodigo := IntToStr ( ACodigoMunicipio ) ;
   ATmpCodigo := copy ( ATmpCodigo, 1, 7 ) ; // remove codigo distrito

   if Length ( ATmpCodigo ) <> 7 then
      Raise Exception.CreateFmt ( 'Código %d não é um código de município válido.', [  ACodigoMunicipio ] ) ;

   Result := SPEDIBGE.IBGE_NomeMunicipio ( StrToInt ( ATmpCodigo ) ) ;

   if Result = '' then
      Raise Exception.CreateFmt ( 'Código %d não é um código de município válido.', [  ACodigoMunicipio ] ) ;

end;

class function SpedUtils.GetNomeCidadeUF(ACodigoMunicipio: integer;
  out AUF: string): String;
begin
  Result := GetNomeCidade ( ACodigoMunicipio ) ;
  AUF := CodigoToUF ( Copy ( IntToStr ( ACodigoMunicipio ), 1, 2 ) ) ;
end;
*)
end.


