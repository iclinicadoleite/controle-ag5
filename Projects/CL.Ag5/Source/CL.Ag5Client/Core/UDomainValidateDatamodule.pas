unit UDomainValidateDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  ClAg5ClientCommonTypes ;

type
  TDomainValidateDatamodule = class(TDataModule)
    cdsDomains: TClientDataSet;
    dspDomains: TDataSetProvider;
    sqlDomains: TTcSQLDataSet;
  private
    { Private declarations }
    FDomain : string ;
    FStatusCallBack: TStatusCallBack;
    FLogCallBack: TLogCallBack;
    procedure DoStatus(AStatus: string);
    procedure DoLog(ALog: string);
    procedure SetDomain(const Value: string);
    function SaveDomain ( ADomain : string ; AName : string ; ALicence : string ; AValidade : TDateTime ; AComputerID : string ) : string ;
    procedure SetLogCallBack(const Value: TLogCallBack);
    procedure SetStatusCallBack(const Value: TStatusCallBack);
  public
    { Public declarations }
    property Domain : string write SetDomain ;
    property LogCallBack: TLogCallBack read FLogCallBack write SetLogCallBack;
    property StatusCallBack: TStatusCallBack read FStatusCallBack write SetStatusCallBack;
    function Validate ( ADomain : string ; AName : string ; AKey : string  ; AComputerID : string ) : string ;
    procedure LoadFromFile ( AFileName : string ; AComputerID : string ) ;
  end;


implementation

{$R *.dfm}

{ TDomainValidateDatamodule }

uses Tc.RTL.Exceptions, Tc.RTL.StringUtils, GuidSuppl,
     Tc.RTL.MD5, Tc.DBRTL.AbstractDB,
     CLAg5.AccessKeyGen ;

procedure TDomainValidateDatamodule.DoLog(ALog: string);
begin
  if Assigned(FLogCallBack) then
    try
      FLogCallBack(ALog);
    except
    end;
end;

procedure TDomainValidateDatamodule.DoStatus(AStatus: string);
begin
  if Assigned(FStatusCallBack) then
    try
      FStatusCallBack(AStatus);
    except
    end;
end;

procedure TDomainValidateDatamodule.LoadFromFile(AFileName: string ; AComputerID : string );
var
  L : TStringList ;
  IterateLines : integer ;
  Err : string ;
  CID : string ;

  procedure R ( s : string ) ;
  var
    R : TStringList ;
  begin
    R := TStringList.Create ;
    R.Delimiter := ',' ;
    R.QuoteChar := '''' ;
    R.DelimitedText := s ;
    try
      if R.Count <> 4 then
         raise Error.CreateFmt('Registro inválido (%d)', [IterateLines + 1 ] );

      if TStringSuppl.Digits ( R[ 0 ] ) <> CID then
         raise Error.CreateFmt('Serial inválido ''%s'' (%d)', [ R[ 0 ], IterateLines + 1 ] );

      try
        Validate ( TStringSuppl.Digits ( R[ 1 ] ), R [ 3 ], R[ 2 ], AComputerID ) ;
      except on E : Exception do
         raise Error.CreateFmt( '%s (%d)', [ E.Message, IterateLines + 1 ] );
      end;

    finally
      R.Free ;
    end;
  end;

begin
    Err := '' ;
    CID := TStringSuppl.Digits ( AComputerID ) ;
    L := TStringList.Create ;
    try
      L.LoadFromFile( AFileName );
      for IterateLines := 0 to L.Count -1 do
        if Trim ( L[IterateLines] ) <> '' then
          try
            R ( L[IterateLines] );
          except On E : Exception do
            Err := Err + #13#10 + E.Message +  ' ( ' + IntToStr ( IterateLines ) + ' )'
          end ;
    finally
      L.Free ;
    end ;

    if Err <> '' then
      raise Error.Create( Err );


end;

function TDomainValidateDatamodule.SaveDomain( ADomain : string ; AName : string ; ALicence : string ; AValidade : TDateTime ; AComputerID : string ) : string ;
var
  DBSession : ITcAbstractDB ;
  CDS : TClientDataSet ;
  LSysDomain, LSerial : string ;
  LDomainExists : boolean ;
  LLicenseExists : boolean ;
  KLicense : string ;
begin
  DoStatus ( 'Salvando licença ' + ADomain ) ;

  DBSession    := Tc.DBRTL.AbstractDB.TTcAbstractDB.GetByAlias( 'SESSION' ) ;

  LSerial    := GuidStrTo20 ( StrToMD5( AComputerID ) ) ;
  LSysDomain := GuidStrTo20 ( StrToMD5( 'CL-' + ADomain ) ) ;

  cds := nil ;
  DBSession.populateClientDataSet ( cds, Format ( '1 RESULT FROM SYS$DOMAINS WHERE KSYS$DOMAIN = %s', [ QuotedStr ( LSysDomain ) ] ) ) ;
  LDomainExists := not cds.IsEmpty ;
  FreeAndNil( cds ) ;

  if not LDomainExists then
    begin
      DBSession.ExecuteDirect (
        Format (  'INSERT INTO SYS$DOMAINS'
        +#13#10'        ( KSYS$DOMAIN, DOMAIN_APP, DOMAIN_CODEPREFIX, DOMAIN_CODE, DOMAIN_CODESUFFIX, DOMAIN_NAME, DOMAIN_ALIAS, SYNC_STATUS )'
        +#13#10' VALUES ( %s, %s, %s, %s, %s, %s, %s,  0)',
          [ QuotedStr ( LSysDomain ), QuotedStr ( 'CLAG5' ), QuotedStr( 'CL-' ), QuotedStr ( ADomain ), QuotedStr( '' ), QuotedStr ( AName ), QuotedStr ( AName ) ] ) ) ;
    end;

  cds := nil ;
  DBSession.populateClientDataSet ( cds,
    Format ( 'KSYS$DOMAIN_LICENSE RESULT FROM SYS$DOMAIN_LICENSE WHERE KSYS$DOMAIN = %s AND SYS$SERIAL = %s', [ QuotedStr ( LSysDomain ), QuotedStr ( LSerial ) ] ) ) ;
  LLicenseExists := not cds.IsEmpty ;
  KLicense := cds.fieldByName ( 'RESULT' ).asString ;
  FreeAndNil( cds ) ;

  if LLicenseExists then
      DBSession.ExecuteDirect (
        Format (  'UPDATE SYS$DOMAIN_LICENSE SET SYS$LICENSE = %s, SYS$VALIDADE = %d WHERE KSYS$DOMAIN_LICENSE = %s',
          [ QuotedStr ( ALicence ), Trunc( AValidade - EncodeDate(2013, 5, 1) ), QuotedStr ( KLicense ) ] ) )
  else
      DBSession.ExecuteDirect (
          Format (  'INSERT INTO SYS$DOMAIN_LICENSE ( KSYS$DOMAIN_LICENSE, KSYS$DOMAIN, SYS$SERIAL, SYS$LICENSE, SYS$VALIDADE )'
              +#13#10'VALUES ( Guid20(), %s, %s, %s, %d )',
                   [ QuotedStr ( LSysDomain ), QuotedStr ( LSerial ), QuotedStr ( ALicence ), Trunc( AValidade - EncodeDate(2013, 5, 1) ) ] ) ) ;

  Result := LSysDomain ;
end;

procedure TDomainValidateDatamodule.SetDomain(const Value: string);
begin
   FDomain := Value ;
end;

procedure TDomainValidateDatamodule.SetLogCallBack(const Value: TLogCallBack);
begin
  FLogCallBack := Value;
end;

procedure TDomainValidateDatamodule.SetStatusCallBack(
  const Value: TStatusCallBack);
begin
  FStatusCallBack := Value;
end;

function TDomainValidateDatamodule.Validate ( ADomain : string ; AName : string ; AKey : string ; AComputerID : string ) : string ;
var
  LValidade : TDateTime ;
begin

   with FactoryAccessKeyValidate do
     begin
           PublicKey  := AComputerID ;
           PrivateKey := AKey ;
           Validate ;
           LValidade := Validade ;
           if ( FDomain <> '' )
             and ( Fazenda <> StrToInt ( FDomain ) ) then
                raise Warning.Create('Chave de acesso não pertence a fazenda.');

     end ;

   Result := SaveDomain( ADomain, AName, AKey, LValidade, AComputerID ) ;

end;

end.
