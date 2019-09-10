unit Validates ;

interface

uses  Tc.VCL.Dialogs ;

type

  TValidates = class
    class function Modulo10( Valor: String ): String ;
    class function Modulo11( Valor: String ; Base: Integer = 9 ; Resto: Boolean = False ): String ;
    class function ValidaCNPJ( CNPJ: String ): Boolean ;
    class function ValidaCPF( CPF: String ): Boolean ;
    class function ValidaIE( IE, UF: String ): Boolean ;
    class function CalculaC3( Numero: String ): String ;
    class function ValidaCMC7( Entrada: String ): Boolean ;
    class function ValidaPIS(PIS : String): boolean;
    class function SoNumero( Entrada: String ): String ;
    class function ValidaEmail(const AEMail : String):Boolean;
  end;


implementation

uses
    WinApi.Windows
  , System.UITypes
  , System.SysUtils ;

{ TValidates }

class function TValidates.Modulo10( Valor: String ): String ;
{
   Rotina usada para cálculo de alguns digitos verificadores
   Pegam-se cada um dos dígitos contidos no parâmetro VALOR, da direita para
a esquerda e multiplica-se por 2121212...
   Soma-se cada um dos subprodutos. Caso algum dos subprodutos tenha mais de
um dígito deve-se somar cada um dos dígitos. (Exemplo: 7*2 = 14 >> 1+4 = 5)
   Divide-se a soma por 10.
   Faz-se a operaçào 10 -Resto da divisão e devolve-se o resultado dessa
operação como resultado da funçào Modulo10.
   Obs: Caso o resultado obtido seja maior que 9, deverá ser substituido por 0 (ZERO).
}
var
  Auxiliar: String;
  Contador, Peso: Integer;
  Digito: Integer;
begin
  Auxiliar := '';
  Peso := 2;
  For Contador := Length( Valor ) downto 1 do
    begin
      Auxiliar := InttoStr( StrToInt( Valor[Contador] ) *Peso ) + Auxiliar ;
      If Peso = 1 then
        Peso := 2
      else
        Peso := 1;
    end;
  Digito := 0;
  For Contador := 1 to Length( Auxiliar ) do
    Digito := Digito + StrToInt( Auxiliar[Contador] );
  Digito := 10 - (Digito mod 10);
  If Digito > 9 then
    Digito := 0;
  Result := IntToStr( Digito );
end;

class function TValidates.Modulo11( Valor: String ; Base: Integer = 9 ; Resto: Boolean = False ): String ;
{
   Rotina muito usada para calcular digitos verificadores
   Pegam-se cada um dos dígitos contidos no parâmetro VALOR, da direita para
a esquerda e multiplica-se pela seqüencia de pesos 2, 3, 4 ... até a BASE.
   Por exemplo: se a base for 9, os pesos serão 2,3,4,5,6,7,8,9,2,3,4,5...
Se a base for 7, os pesos serão 2,3,4,5,6,7,2,3,4...
   Somam-se cada um dos subprodutos.
   Divide-se a soma por 11.
   Faz-se a operação 11 -Resto da divisãoe devolve-se o resultado dessa
operação como resultado da função Modulo11. Caso o valor do parâmetro Resto
seja TRUE, o resultado da função Modulo11 será simplesmente o resto da divisão.
   Obs: Caso o resultado seja maior que 9, deverá se substituído por 0 (ZERO).
}
var
  Soma: Integer;
  Contador, Peso: Integer;
  Digito: Integer;
begin
  Soma := 0;
  Peso := 2;
  For Contador := Length( Valor ) downto 1 do
    begin
      Soma := Soma + ( StrToInt( Valor[Contador] ) * Peso );
      If Peso < Base then
        Peso := Peso + 1
      else
        Peso := 2;
    end;
  If Resto then
    Result := IntToStr( Soma mod 11 )
  else
    begin
      Digito := 11 - (Soma mod 11 );
      If Digito > 9 then
        Digito := 0;
      Result := IntToStr( Digito );
    end;
end;

class function TValidates.ValidaCNPJ( CNPJ: String ): Boolean ;
Var
  Aux, d: String;
  i: Integer;
begin
  Aux := '';
  if Trim ( CNPJ ) <> '' then
    For i := 0 to Length( CNPJ ) do
      Case CNPJ[i] of
         '0'..'9': Aux := Aux + CNPJ[i];
      end;

  If (Length(Aux) = 0) then
    begin
      Result := (MessageDlg( 'Não foi digitado um CNPJ.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes) ;
      Exit;
    end;

  // Se valor for tudo 0, CNPJ inválido
  if (StrToInt64(Aux) <= 0) then
    begin
      Result := MessageDlg ( 'CNPJ Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
      Exit;
    end;

  d := Modulo11( Copy( Aux, 1, 12 ) );
  If ( d = Copy( Aux, 13, 1 ) ) then
    begin
      d := Modulo11( Copy( Aux, 1, 13 ) );
      If ( d = Copy( Aux, 14, 1 ) ) then
        Result := True
      else
        Result := MessageDlg( 'CNPJ Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
    end
  else
    Result := MessageDlg( 'CNPJ Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
end;

class function TValidates.ValidaCPF( CPF: String ): Boolean ;
Var
  Aux, d: String;
  i: Integer;
  sameDigits : boolean  ;
begin
  sameDigits := False  ;
  If Length( CPF ) = 0 then
    begin
      Result := MessageDlg( 'Você não digitou um CPF.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
      Exit;
    end;

  Aux := '';
  // Remove '.' e '-', deixando somente os números
  For i := 0 to Length( CPF ) do
    Case CPF[i] of
      '0'..'9': Aux := Aux + CPF[i];
    end;

  if Aux = '' then
     exit ( True ) ;

  // Verifica se a quantidade de digitos está correta
  if Length( Aux ) <> 11 then
    begin
      Result := MessageDlg ( 'CPF Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
      Exit;
    end;

  for i := 2 to Length ( Aux ) do
   begin
      sameDigits := Aux[ i ] = Aux [ i - 1 ] ;
      if not SameDigits then
         break ;
   end ;

  if SameDigits then
    begin
     Exit;
    end ;

  d := Modulo11( Copy( Aux, 1, 9 ), 10 );
  If ( d = Copy( Aux, 10, 1 ) ) then
    begin
      d := Modulo11( Copy( Aux, 1, 10 ), 11 );
      If ( d = Copy( Aux, 11, 1 ) ) then
        Result := True
      else
        Result := MessageDlg( 'CPF Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
    end
  else
    Result := MessageDlg( 'CPF Inválido.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
end;

class function TValidates.ValidaEMail(const AEmail: String): Boolean;
const
  CaraEsp: array[1..40] of char = ( '!','#','$','%','¨','&','*','(',')','+','=','§','¬','¢','¹','²',
           '³','£','´','`','ç','Ç',',',';',':','<','>','~','^','?','/',' ','|','[',']','{','}','º','ª','°');
var
  i,cont   : integer;
  EMail    : String;

begin
  EMail := AEmail;
  Result := True;
  cont := 0;

  if EMail <> '' then
    if ( Pos( '@', EMail ) <> 0 ) and ( Pos( '.', EMail ) <> 0 ) then    // existe @ .
      begin
        if ( Pos( '@', EMail ) = 1 ) or ( Pos( '@', EMail ) = Length( EMail ) ) or ( Pos( '.', EMail ) = 1 )
           or ( Pos( '.', EMail ) = Length( EMail ) ) or ( Pos( ' ', EMail ) <> 0 ) then
          Result := False
        else                                   // @ seguido de . e vice-versa
          if ( abs( Pos( '@', EMail ) - Pos( '.', EMail ) ) = 1 ) then
            Result := False
          else
            begin
              for i := 1 to 40 do            // se existe Caracter Especial
                if Pos( CaraEsp[i], EMail ) <> 0 then
                  Result := False;

              for i := 1 to length( EMail ) do
                begin                                 // se existe apenas 1 @
                  if EMail[i] = '@' then
                    cont := cont + 1;                    // . seguidos de .

                  if ( EMail[i] = '.' ) and ( EMail[ i + 1 ] = '.' ) then
                    Result := false;
                end;
                                     // . no f, 2ou+ @, . no i, - no i, _ no i
              if ( cont >= 2 ) or ( EMail[ length( EMail ) ] = '.' ) or ( EMail[1] = '.' ) or ( EMail[1]= '_' )
                 or ( EMail[1] = '-' )  then
                Result := false;
                                              // @ seguido de COM e vice-versa
//              if ( abs( Pos( '@', EMail ) - Pos( 'com', EMail ) ) = 1 ) then
//                Result := False;

              if ( abs( Pos( '@', EMail ) - Pos( '-', EMail ) ) = 1 ) then
                Result := False;
                                                // @ seguido de _ e vice-versa
              if ( abs( Pos( '@', EMail ) - Pos( '_', EMail ) ) = 1 ) then
                Result := False;
            end;
      end
    else
      Result := False;
end;

class function TValidates.CalculaC3(Numero: String): String;
Var
  i, resto, digito: Integer;
  d, d_aux: String;
begin
  digito  := 0;
  d_aux   := SoNumero(Numero);
  d       := copy( d_aux, 0, Length(d_aux));

  for i := 1 to length(d) do
    digito := digito + (StrToint(d[i]) *(Length(d)+2-i));

  digito  := digito *10;
  resto   := digito mod 11;
  digito  := resto;
  resto   := digito mod 10;
  Result  :=  IntToStr(resto);
end;

class function TValidates.ValidaCMC7(Entrada: String): Boolean;
Var
  campo1, campo2, campo3: String;
begin
  Entrada := SoNumero(Entrada);
  Campo1  := Copy( Entrada,  1,  7 );
  Campo2  := Copy( Entrada,  9, 10 );
  Campo3  := Copy( Entrada, 20, 10 );
  Result  := (Modulo10(campo1) = Copy(Entrada, 19, 1)) and
             (Modulo10(Campo2) = Copy(Entrada,  8, 1)) and
             (Modulo10(Campo3) = Copy(Entrada, 30, 1));
end;

class function TValidates.ValidaPIS(PIS : String): boolean;
Var
  i, wsoma, Wm11, Wdv, wdigito : Integer;
begin
  Result := false;
  PIS := SoNumero(PIS);
  if Trim(PIS) <> '' Then
    begin
      wdv := strtoint(copy(PIS, 11, 1));
      wsoma := 0;
      wm11 := 2;
      for i := 1 to 10 do
        begin
          wsoma := wsoma + (wm11 * strtoint(copy(PIS,11 - i, 1)));
          if wm11 < 9 then
            wm11 := wm11 + 1
          else
            wm11 := 2;
        end;
      wdigito := 11 - (wsoma MOD 11);
      if wdigito > 9 then
        wdigito := 0;
      if wdv = wdigito then
        Result := true;
    end;
end;

class function TValidates.SoNumero(Entrada: String): String;
Var
  i: Integer;
begin
  Result := '';
  If Length( Entrada ) = 0 then
    Exit;
  For i := 0 to Length( Entrada ) do
    Case Entrada[i] of
       '0'..'9': Result := Result + Entrada[i];
    end;
end;

type
  TConsisteInscricaoEstadual  = function (const Insc, UF: String): Integer; stdcall;
  TVersaoDLL                  = function : Integer; stdcall;

class function TValidates.ValidaIE(IE, UF: String): Boolean;
Var
  IRet: Integer;
  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
begin
  Result := True;
  If (IE = 'ISENTO') or (IE = '') then
    Exit;

  IE := SoNumero(IE);
  LibHandle := LoadLibrary( PChar('DllInscE32.Dll') );
  if LibHandle <= HINSTANCE_ERROR then
    Exit;
//    RaiseException ('Dll não carregada');

  @ConsisteInscricaoEstadual := GetProcAddress( LibHandle, 'ConsisteInscricaoEstadual' );
  if @ConsisteInscricaoEstadual = nil then
    Exit;
//    RaiseException('Não foi encontrada Dll');

  IRet := ConsisteInscricaoEstadual(IE,UF);
  Case IRet of
    0: Result := True;
    1: Result := MessageDlg( 'Inscrição inválida para ' + UF + '.'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
  else Result := MessageDlg( 'Parâmetros inválidos'#13'Deseja continuar assim mesmo ?', mtWarning, [mbYes, mbNo], 0 ) = mrYes ;
  end;
end;


end.
