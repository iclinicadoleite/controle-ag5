unit CLAg5.AccessKeyGen;

interface

uses System.SysUtils, DateUtils, StrUtils, MaskUtils, Tc.RTL.StringUtils ;

type
  TModuloAgenda = (maZootecnico, maFinanceiro, maRastreamento);

const
  StrModuloAgenda: array [TModuloAgenda] of string = ('Zootécnico', 'Financeiro', 'Rastreamento');

type
  TModuloAcesso = Record
    Modulo: TModuloAgenda;
    Master: boolean;
    Acesso: boolean;
  End;

  TModulosAcesso = array of TModuloAcesso;

  TAcesso = record
    Fazenda: integer;
    Validade: TDateTime;
    Modulos: TModulosAcesso
  end;

  IAccessKeyGenerate = interface
  ['{68D3781F-3DD7-47F1-8B27-2A0A6B735997}']
    procedure SetPublicKey(const Value: string);
    function GetPrivateKey : string;
    procedure SetValidade(const Value: TDateTime);
    procedure SetFazenda(const Value: Integer);
    procedure SetModulos(const Value: TModulosAcesso);
    procedure Generate ;
    property PublicKey  : string         write SetPublicKey;
    property PrivateKey : string         read  GetPrivateKey;
    property Fazenda    : Integer        write SetFazenda;
    property Validade   : TDateTime      write SetValidade;
    property Modulos    : TModulosAcesso write SetModulos;
  end;

  IAccessKeyValidate = interface
  ['{C0168D3B-067A-4C3E-AE59-ACDB141FB156}']
    procedure SetPublicKey(const Value: string);
    procedure SetPrivateKey(const Value: string);
    function GetFazenda: Integer;
    function GetValidade: TDateTime;
    function GetModulos: TModulosAcesso;
    function Validate: TAcesso;
    property PublicKey  : string         write SetPublicKey  ;
    property PrivateKey : string         write SetPrivateKey ;
    property Fazenda    : Integer        read GetFazenda    ;
    property Validade   : TDateTime      read GetValidade   ;
    property Modulos    : TModulosAcesso read GetModulos    ;
  end;

function FactoryAccessKeyGenerate : IAccessKeyGenerate ;
function FactoryAccessKeyValidate : IAccessKeyValidate ;

var
   GAcesso : TAcesso;

implementation

uses Tc.RTL.Exceptions ;

type

  TAccessKey = class ( TInterfacedObject, IAccessKeyGenerate, IAccessKeyValidate )
  private
    FDeltaDate: Integer;
    FIndex: Integer;
    FPublicKey: string;
    FPrivateKey: string;
    FID1, FID2: string;
    FAcesso: TAcesso;
    procedure CheckIDs;
    procedure SetPublicKey(const Value: string);
    procedure SetPrivateKey(const Value: string);
    procedure SetValidade(const Value: TDateTime);
    procedure SetFazenda(const Value: Integer);
    procedure SetModulos(const Value: TModulosAcesso);
    function GetFazenda: Integer;
    function GetValidade: TDateTime;
    function GetModulos: TModulosAcesso;
    function GetPrivateKey: string;
    function GetPublicKey: string;
    procedure Generate ;
    function Validate: TAcesso;
  public
    constructor Create;
  end;

function FactoryAccessKeyGenerate : IAccessKeyGenerate ;
begin
  Result := TAccessKey.Create ;
end;

function FactoryAccessKeyValidate : IAccessKeyValidate ;
begin
  Result := TAccessKey.Create ;
end;

procedure SetBit(var B: Byte; Bits: array of integer);
var
  x: integer;
begin
  for x := low(Bits) to High(Bits) do
    B := (B or ($1 shl Bits[x]));
end;

function TestBit(B: Byte; Bit: integer): boolean;
begin
  Result := (B and ($1 shl Bit)) > 0;
end;


procedure TAccessKey.CheckIDs;
var
  LIterateKey: Integer;
begin

  if FPublicKey = '' then
    raise Warning.Create('Chave de Pública inválida');

  LIterateKey := FIndex;
  repeat
    FID1 := Copy(FPublicKey, LIterateKey, 7);
    Inc(LIterateKey)
  until (FID1[1] <> '0');

  LIterateKey := Length(FPublicKey) - 5 - FIndex;
  repeat
    FID2 := Copy(FPublicKey, LIterateKey, 5);
    Dec(LIterateKey);
  until (FID2[1] <> '0');
end;

constructor TAccessKey.Create;
begin
  FDeltaDate := Trunc(EncodeDate(2013, 5, 1));
end;

function TAccessKey.GetFazenda: Integer;
begin
  Result := FAcesso.Fazenda;
end;

function TAccessKey.GetPrivateKey: string;
begin
  Result := FormatMaskText('99999\-99999\-99999\-99999\-99999\-99999;0', FPrivateKey);
end;

function TAccessKey.GetPublicKey: string;
begin
  Result := FPublicKey ;
end;

function TAccessKey.GetModulos: TModulosAcesso;
begin
  Result := FAcesso.Modulos;
end;

function TAccessKey.GetValidade: TDateTime;
begin
  Result := FAcesso.Validade;
  Result := EncodeDate( 2100,1,1 ) ;
end;

procedure TAccessKey.Generate ;
var
  IterateModulos: Integer;
  IdxStr, AReverseFazenda: string;
  LModulos, LMaster, LAcesso: byte;
  StrAcesso: string;
begin

  CheckIDs;

  LModulos := 0;
  LMaster  := 0;
  LAcesso  := 0;

  for IterateModulos := Low(FAcesso.Modulos) to High(FAcesso.Modulos) do
    begin

      SetBit(LModulos, [Ord(FAcesso.Modulos[IterateModulos].Modulo)]);
      if FAcesso.Modulos[IterateModulos].Master then
        SetBit(LMaster, [Ord(FAcesso.Modulos[IterateModulos].Modulo)]);

      if FAcesso.Modulos[IterateModulos].Acesso then
        SetBit(LAcesso, [Ord(FAcesso.Modulos[IterateModulos].Modulo)]);

    end;

  AReverseFazenda := ReverseString(Format('%.6d', [FAcesso.Fazenda]));
  IdxStr := ReverseString(Format('%.2d', [FIndex]));

  case FIndex mod 3 of
    0: StrAcesso := Format('%.3d%.3d%.3d', [LModulos, LMaster, LAcesso]);
    1: StrAcesso := Format('%.3d%.3d%.3d', [LMaster, LAcesso, LModulos]);
    2: StrAcesso := Format('%.3d%.3d%.3d', [LAcesso, LModulos, LMaster]);
  end;

  FPrivateKey := Format('%s%s%s%.7d%s%.5d%s%s%s%d', [IdxStr[1], // 1         (1)
    Copy(AReverseFazenda, 1, 3),                                // 2 - 4     (3)
    Copy(StrAcesso, 1, 3),                                      // 5 - 7     (3)
    StrToInt(FID1) - (999999 - FAcesso.Fazenda),                // 8 - 14    (7)=14
    Copy(StrAcesso, 4, 3),                                      // 15 - 17   (3)
    Trunc(StrToInt(FID2) - FAcesso.Validade),                   // 18 - 22   (5)
    Copy(StrAcesso, 7, 3),                                      // 23 - 25   (3)
    Copy(AReverseFazenda, 4, 3),                                // 26 - 28   (3)=14
    IdxStr[2],                                                  // 29        (1)=29
    LModulos * 1000000 * LMaster * 1000 * LAcesso mod 10]);     // 30

end;

procedure TAccessKey.SetFazenda(const Value: Integer);
begin
  FAcesso.Fazenda := Value;
end;

procedure TAccessKey.SetModulos(const Value: TModulosAcesso);
begin
  FAcesso.Modulos := Value;
end;

procedure TAccessKey.SetPrivateKey(const Value: string);
begin
  FPrivateKey := Tc.RTL.StringUtils.TStringSuppl.Digits(Value);

  if FPrivateKey = '' then
    Exit;

  FIndex := StrToInt(FPrivateKey[Length(FPrivateKey) - 1] + FPrivateKey[1]);

  if ( FIndex < 1 ) or ( FIndex > 31 ) then
    Raise Warning.Create ( 'Chave pública inválida ') ;

  Repeat
    FPrivateKey := DupeString(FPrivateKey, 2);
  Until Length(FPrivateKey) > 31 + 14;

end;

procedure TAccessKey.SetPublicKey(const Value: string);
begin
  FPublicKey := Tc.RTL.StringUtils.TStringSuppl.Digits(Value);

  if FPublicKey = '' then
    Exit;

  Repeat
    FPublicKey := DupeString(FPublicKey, 2);
  Until Length(FPublicKey) > 31 + 14;
end;

procedure TAccessKey.SetValidade(const Value: TDateTime);
var
  LValue : TDateTime ;
begin
  LValue := EncodeDate(2100,1,1) ; //Value ;
  FIndex := DayOf(LValue);
  FAcesso.Validade := LValue - FDeltaDate
end;

function TAccessKey.Validate: TAcesso;
var
  IterateModulos: TModuloAgenda;
  LModulos, LMaster, LAcesso: byte;
  StrAcesso: string;
  LModulosIndex: Integer;

begin

  FAcesso.Validade := 0 ;

  CheckIDs;

  if FPrivateKey = '' then
    raise Warning.Create('Chave de Acesso inválida (1)');

  FAcesso.Fazenda := StrToInt(ReverseString(Copy(FPrivateKey, 2, 3) + Copy(FPrivateKey, Length(FPrivateKey) - 4, 3)));

  if Copy(FPrivateKey, 8, 7) <> Format('%.7d', [StrToInt(FID1) - (999999 - FAcesso.Fazenda)]) then
    raise Warning.Create('Chave de Acesso inválida (2)');

  FAcesso.Validade := StrToInt(FID2) - StrToInt(Copy(FPrivateKey, 18, 5)) + FDeltaDate;

  if DayOf(FAcesso.Validade) <> FIndex then
    raise Warning.Create('Chave de Acesso inválida (3)');

  case FIndex mod 3 of
    0: StrAcesso := Copy(FPrivateKey, 5, 3) + Copy(FPrivateKey, 15, 3) + Copy(FPrivateKey, 23, 3);
       // LModulos, LMaster,  LAcesso
    1: StrAcesso := Copy(FPrivateKey, 23, 3) + Copy(FPrivateKey, 5, 3) + Copy(FPrivateKey, 15, 3);
       // LMaster,  LAcesso, LModulos
    2: StrAcesso := Copy(FPrivateKey, 15, 3) + Copy(FPrivateKey, 23, 3) + Copy(FPrivateKey, 5, 3);
       // LAcesso,  LModulos, LMaster
  end;

  LModulos := StrToInt(Copy(StrAcesso, 1, 3));
  LMaster  := StrToInt(Copy(StrAcesso, 4, 3));
  LAcesso  := StrToInt(Copy(StrAcesso, 7, 3));

  if (LModulos * 1000000 * LMaster * 1000 * LAcesso mod 10) <> StrToInt(FPrivateKey[Length(FPrivateKey)]) then
    raise Warning.Create('Chave de Acesso inválida (4)');

  LModulosIndex := -1 ;
  SetLength(FAcesso.Modulos, 0);
  for IterateModulos := Low(TModuloAgenda) to High(TModuloAgenda) do
    begin

      if TestBit(LModulos, Ord(IterateModulos)) then
        begin

          Inc(LModulosIndex);
          SetLength(FAcesso.Modulos, LModulosIndex + 1 );

          FAcesso.Modulos[LModulosIndex].Modulo := IterateModulos;
          FAcesso.Modulos[LModulosIndex].Master := TestBit(LMaster, Ord(IterateModulos));
          FAcesso.Modulos[LModulosIndex].Acesso := TestBit(LAcesso, Ord(IterateModulos));


        end;
    end;

  {FREE}
  LModulosIndex := -1 ;
  for IterateModulos := Low(TModuloAgenda) to High(TModuloAgenda) do
    begin
      Inc(LModulosIndex);
      SetLength(FAcesso.Modulos, LModulosIndex + 1 );

      FAcesso.Modulos[LModulosIndex].Modulo := IterateModulos;
      FAcesso.Modulos[LModulosIndex].Master := True ;
      FAcesso.Modulos[LModulosIndex].Acesso := True;
   end;

  Result := FAcesso ;
  GAcesso := FAcesso ;

end;

end.
