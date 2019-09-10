unit UDomainListDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UClAg5ClientInitFarmDatamodule, ClAg5ClientCommonTypes ;

type

  TDomainFilter = ( dfAll, dfActive, dfLess15, dfReadOnly, dfExpired ) ;

  TDomainListDatamodule = class(TDataModule)
    cdsDomains: TClientDataSet;
    dspDomains: TDataSetProvider;
    sqlDomains: TTcSQLDataSet;
    sqlDomainsKSYSDOMAIN: TStringField;
    sqlDomainsDOMAIN_ALIAS: TStringField;
    sqlDomainsDOMAIN_CODE: TStringField;
    sqlDomainsDOMAIN_NAME: TStringField;
    cdsDomainsKSYSDOMAIN: TStringField;
    cdsDomainsDOMAIN_ALIAS: TStringField;
    cdsDomainsDOMAIN_CODE: TStringField;
    cdsDomainsDOMAIN_NAME: TStringField;
    sqlDomainsDBINITIALIZED: TStringField;
    cdsDomainsDBINITIALIZED: TStringField;
    cdsDomainsVALIDADE: TDateField;
    cdsDomainsISVALID: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsDomainsCalcFields(DataSet: TDataSet);
    procedure cdsDomainsISVALIDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsDomainsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FStatusCallBack: TStatusCallBack;
    FLogCallBack: TLogCallBack;
    FDomainFilter : TDomainFilter ;
    { Private declarations }
    function CheckInitFarm : boolean ;
    procedure DoStatus(AStatus: string);
    procedure DoLog(ALog: string);
    procedure SetLogCallBack(const Value: TLogCallBack);
    procedure SetStatusCallBack(const Value: TStatusCallBack);
    procedure SetDomainFilter(const Value: TDomainFilter);
  public
    { Public declarations }
    property LogCallBack: TLogCallBack read FLogCallBack write SetLogCallBack;
    property StatusCallBack: TStatusCallBack read FStatusCallBack write SetStatusCallBack;
    procedure Refresh( ADomainID : string );
    property DomainFilter : TDomainFilter  read FDomainFilter write SetDomainFilter;
  end;

implementation

{$R *.dfm}

uses Math, GuidSuppl, Tc.RTL.MD5, CLAg5.ComputerID, CLAG5.DatabaseIntf, CLAg5.AccessKeyGen, DateUtils ;

procedure TDomainListDatamodule.cdsDomainsCalcFields(DataSet: TDataSet);
var
 LInvalid : boolean ;
begin
  if not ( DataSet.State in [dsInternalCalc] ) then
    exit ;

  if not cdsDomainsIsVALID.IsNull then
    exit ;


  cdsDomainsIsVALID.asString := 'T' ;
  cdsDomainsValidade.AsDateTime := EncodeDate(2100,1,1) ;
  exit ;

  LInvalid := False ;
  with FactoryAccessKeyValidate do
    begin
      PublicKey  := ComputerID ;
//      PrivateKey := XcdsDomainsSYSLICENSE.asString ;
      try
        Validate ;
        LInvalid := cdsDomainsDOMAIN_CODE.asInteger <> Fazenda ;
      except
        LInvalid := True ;
      end;

      if ( LInvalid ) then
        begin
           cdsDomainsIsVALID.asString := 'F' ;
           if Validade > 0 then
              cdsDomainsValidade.AsDateTime := Validade
        end
      else
        begin
           cdsDomainsIsVALID.asString := 'T' ;
           if Validade > 0 then
              cdsDomainsValidade.AsDateTime := Validade
        end;

    end ;

end ;


procedure TDomainListDatamodule.cdsDomainsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 case FDomainFilter  of
  dfAll      : Accept := True ;
  dfActive   : Accept := cdsDomainsValidade.asDateTime  - 15 > Date ;
  dfLess15   : Accept := ( cdsDomainsValidade.asDateTime  > Date ) and ( cdsDomainsValidade.asDateTime  < Date + 15 ) ;
  dfReadOnly : Accept := InRange ( cdsDomainsValidade.asDateTime, Date - 31, Date -1  ) ;
  dfExpired  : Accept := cdsDomainsValidade.asDateTime < Date - 31 ;
 end;
end;

procedure TDomainListDatamodule.cdsDomainsISVALIDGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := '' ;

  if Sender.isNull then
     exit ;

  if cdsDomainsValidade.asDateTime  - 15 > Date then
     Text := 'Ativa'
  else if ( cdsDomainsValidade.asDateTime  > Date ) and ( cdsDomainsValidade.asDateTime  < Date + 15 ) then
     Text := 'Expira < 15 dias'
  else if InRange ( cdsDomainsValidade.asDateTime, Date - 31, Date -1  ) then
     Text := 'Somente leitura'
  else if cdsDomainsValidade.asDateTime < Date - 31 then
     Text := 'Expirada' ;

  if not cdsDomainsDBINITIALIZED.asBoolean then
    Text := Text + ' (*)'

  (*
  if not Sender.isNull then
     begin
       if Sender.asBoolean then
         Text := 'Ativa'
       else if cdsDOMAINSValidade.IsNull then
         Text := 'Inválida'
       else
         Text := 'Expirada'
     end;
     *)
end;
(*
function TDomainListDatamodule.CheckInitFarm : boolean ;
begin
  Result := False ;
  cdsDomains.disableControls ;
  cdsDomains.First ;
  while not cdsDomains.eof do
    begin
     if not cdsDomainsDBINITIALIZED.asBoolean then
       begin
        with TClAg5ClientInitFarmDatamodule.Create ( nil ) do
          try
            try
               DoLog ( 'Inicializando fazenda CL-' + cdsDomainsDOMAIN_CODE.asString ) ;
               CreateFarmBase ( DatabaseCfgFactory.Profile, cdsDomainsDOMAIN_CODE.asString, cdsDomainsDOMAIN_NAME.asString ) ;
               Result := True ;
            finally
               free ;
            end;
          except On E : Exception do
            raise ; //kiq !!!
          end;
       end;
     cdsDomains.Next ;
    end;

  cdsDomains.enableControls ;
  cdsDomains.First ;
end;
*)

function TDomainListDatamodule.CheckInitFarm : boolean ;
begin
  Result := False ;
  cdsDomains.disableControls ;
  if not cdsDomainsDBINITIALIZED.asBoolean then
    begin
      with TClAg5ClientInitFarmDatamodule.Create ( nil ) do
        try
          try
            DoLog ( 'Inicializando fazenda CL-' + cdsDomainsDOMAIN_CODE.asString ) ;
            CreateFarmBase ( DatabaseCfgFactory.Profile, cdsDomainsDOMAIN_CODE.asString, cdsDomainsDOMAIN_NAME.asString ) ;
            Result := True ;
          finally
            free ;
          end;
        except On E : Exception do
          raise ; //kiq !!!
        end;
    end;
  cdsDomains.enableControls ;
end;

procedure TDomainListDatamodule.DataModuleCreate(Sender: TObject);
begin
//   cdsDomains.Params.ParamByName('SERIAL').asString := GuidStrTo20 ( StrToMD5( CLAg5.ComputerID.ComputerID ) ) ;
   cdsDomains.Open ;
end;

procedure TDomainListDatamodule.DoLog(ALog: string);
begin
  if Assigned(FLogCallBack) then
    try
      FLogCallBack(ALog);
    except
    end;
end;

procedure TDomainListDatamodule.DoStatus(AStatus: string);
begin
  if Assigned(FStatusCallBack) then
    try
      FStatusCallBack(AStatus);
    except
    end;
end;

procedure TDomainListDatamodule.Refresh( ADomainID : string );
var
  LKSYSDOMAIN : string ;
begin

  LKSYSDOMAIN := ADomainID ; //cdsDomainsKSYSDOMAIN.AsString ;

  sqlDomains.SQLConnection.Close ;
  cdsDomains.Close ;
  cdsDomains.Open ;
  cdsDomains.Locate( 'KSYS$DOMAIN', LKSYSDOMAIN, [] ) ;
  if CheckInitFarm then
    begin
      sqlDomains.SQLConnection.Close ;
      cdsDomains.Refresh ;
      cdsDomains.Locate( 'KSYS$DOMAIN', LKSYSDOMAIN, [] ) ;
    end;
end;

procedure TDomainListDatamodule.SetDomainFilter(const Value: TDomainFilter);
begin
  cdsDomains.Filtered := False ;
  FDomainFilter := Value;
  if FDomainFilter <> dfAll then
     cdsDomains.Filtered := True ;
end;

procedure TDomainListDatamodule.SetLogCallBack(const Value: TLogCallBack);
begin
  FLogCallBack := Value;
end;

procedure TDomainListDatamodule.SetStatusCallBack(const Value: TStatusCallBack);
begin
  FStatusCallBack := Value;
end;

end.
