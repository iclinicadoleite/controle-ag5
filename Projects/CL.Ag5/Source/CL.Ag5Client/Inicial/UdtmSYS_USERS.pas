unit UdtmSYS_USERS;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TdtmSYS_USERS = class(T_dtmBASEDBListEdit)
    cdsLstUsers: TClientDataSet;
    cdsUser: TClientDataSet;
    dtsList: TDataSource;
    cdsEntidade: TClientDataSet;
    cdsEndereco: TClientDataSet;
    cdsLstUsersAPELIDO: TStringField;
    cdsLstUsersNOME: TStringField;
    dspLstUsers: TDataSetProvider;
    dspUser: TDataSetProvider;
    sqlLstUsers: TTcSQLDataSet;
    sqlUser: TTcSQLDataSet;
    dtsSQLUsers: TDataSource;
    sqlEntidade: TTcSQLDataSet;
    dtsSQLEntidades: TDataSource;
    sqlEndereco: TTcSQLDataSet;
    sqlProfiles: TTcSQLDataSet;
    sqlProfilesKPROFILE: TIntegerField;
    sqlProfilesPROFILE: TStringField;
    dspProfiles: TDataSetProvider;
    sqlLstUsersKSYSUSER: TStringField;
    cdsLstUsersKSYSUSER: TStringField;
    sqlUserLOGIN: TStringField;
    sqlUserPASSWORD: TStringField;
    sqlUserUSERNAME: TStringField;
    sqlUserEMAIL: TStringField;
    sqlUserEXPIRESDATE: TStringField;
    sqlUserEXPIREDAYS: TSmallintField;
    sqlUserPRIVILEGED: TStringField;
    sqlUserTYPEREC: TStringField;
    sqlUserPROFILE: TIntegerField;
    sqlUserKEYCHECK: TStringField;
    sqlUserINACTIVED: TSmallintField;
    sqlUserBLOQUED: TStringField;
    sqlEntidadeKCAD_ENTIDADE: TStringField;
    sqlEntidadeCODIGO: TStringField;
    sqlEntidadeAPELIDO: TStringField;
    sqlEntidadeNOME: TStringField;
    sqlEntidadePESSOA: TStringField;
    sqlEntidadeCPF_CNPJ: TStringField;
    sqlEntidadeRG_IE: TStringField;
    sqlEntidadeURL: TStringField;
    sqlEntidadeEMAIL: TStringField;
    sqlEntidadeKENDERECO: TStringField;
    sqlEnderecoTABLENAME: TStringField;
    sqlEnderecoTABLEKEY: TStringField;
    sqlEnderecoKGLB_ENDERECO: TStringField;
    sqlEnderecoENDERECO: TStringField;
    sqlEnderecoNUMERO: TStringField;
    sqlEnderecoCOMPLEMENTO: TStringField;
    sqlEnderecoBAIRRO: TStringField;
    sqlEnderecoCEP: TStringField;
    sqlEnderecoCIDADE: TStringField;
    sqlEnderecoUF: TStringField;
    sqlEnderecoCXPOSTAL: TStringField;
    cdsUserKSYSUSER: TStringField;
    cdsUserLOGIN: TStringField;
    cdsUserPASSWORD: TStringField;
    cdsUserUSERNAME: TStringField;
    cdsUserEMAIL: TStringField;
    cdsUserEXPIRESDATE: TStringField;
    cdsUserEXPIREDAYS: TSmallintField;
    cdsUserPRIVILEGED: TStringField;
    cdsUserTYPEREC: TStringField;
    cdsUserPROFILE: TIntegerField;
    cdsUserKEYCHECK: TStringField;
    cdsUserINACTIVED: TSmallintField;
    cdsUserBLOQUED: TStringField;
    cdsUsersqlEntidade: TDataSetField;
    cdsEntidadeKCAD_ENTIDADE: TStringField;
    cdsEntidadeCODIGO: TStringField;
    cdsEntidadeAPELIDO: TStringField;
    cdsEntidadeNOME: TStringField;
    cdsEntidadePESSOA: TStringField;
    cdsEntidadeCPF_CNPJ: TStringField;
    cdsEntidadeRG_IE: TStringField;
    cdsEntidadeURL: TStringField;
    cdsEntidadeEMAIL: TStringField;
    cdsEntidadeKENDERECO: TStringField;
    cdsEntidadesqlEndereco: TDataSetField;
    cdsEnderecoTABLENAME: TStringField;
    cdsEnderecoTABLEKEY: TStringField;
    cdsEnderecoKGLB_ENDERECO: TStringField;
    cdsEnderecoENDERECO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCXPOSTAL: TStringField;
    sqlLstUsersLOGIN: TStringField;
    sqlLstUsersAPELIDO: TStringField;
    sqlLstUsersNOME: TStringField;
    cdsLstUsersLOGIN: TStringField;
    sqlUserKSYSUSER: TStringField;
    sqlEntidadeKCAD_FAZENDA: TStringField;
    cdsEntidadeKCAD_FAZENDA: TStringField;
    sqlFazendas: TTcSQLDataSet;
    sqlFazendasAPELIDO: TStringField;
    cdsUsersqlFazendas: TDataSetField;
    cdsFazendas: TClientDataSet;
    sqlEntidadeIS_FUNCIONARIO: TStringField;
    cdsEntidadeIS_FUNCIONARIO: TStringField;
    sqlEntidadeIS_CLIENTE: TStringField;
    cdsEntidadeIS_CLIENTE: TStringField;
    sqlLstUsersSYSUI: TStringField;
    sqlLstUsersSYSDI: TSQLTimeStampField;
    sqlLstUsersSYSUU: TStringField;
    sqlLstUsersSYSDU: TSQLTimeStampField;
    cdsLstUsersSYSUI: TStringField;
    cdsLstUsersSYSDI: TSQLTimeStampField;
    cdsLstUsersSYSUU: TStringField;
    cdsLstUsersSYSDU: TSQLTimeStampField;
    cdsWebGerencialZootecnico: TClientDataSet;
    cdsWebGerencialFinanceiro: TClientDataSet;
    cdsWebMonitoria: TClientDataSet;
    cdsWebIndicadores: TClientDataSet;
    cdsWebPortal: TClientDataSet;
    cdsWebCaixaFerramentas: TClientDataSet;
    sqlWebGerencialZootecnico: TTcSQLDataSet;
    sqlWebGerencialFinanceiro: TTcSQLDataSet;
    sqlWebMonitoria: TTcSQLDataSet;
    sqlWebIndicadores: TTcSQLDataSet;
    sqlWebPortal: TTcSQLDataSet;
    sqlWebCaixaFerramentas: TTcSQLDataSet;
    cdsUsersqlWebCaixaFerramentas: TDataSetField;
    cdsUsersqlWebPortal: TDataSetField;
    cdsUsersqlWebIndicadores: TDataSetField;
    cdsUsersqlWebMonitoria: TDataSetField;
    cdsUsersqlWebGerencialFinanceiro: TDataSetField;
    cdsUsersqlWebGerencialZootecnico: TDataSetField;
    cdsWebGerencialZootecnicoKSYSUSER_MODULE: TStringField;
    cdsWebGerencialZootecnicoKSYSUSER: TStringField;
    cdsWebGerencialZootecnicoKSYSDOMAIN: TStringField;
    cdsWebGerencialZootecnicoMODULE: TIntegerField;
    cdsWebGerencialZootecnicoMODULE_DOMAIN: TStringField;
    cdsWebGerencialZootecnicoMODULE_LOGIN: TStringField;
    cdsWebGerencialZootecnicoMODULE_PASSWORD: TStringField;
    cdsWebGerencialFinanceiroKSYSUSER_MODULE: TStringField;
    cdsWebGerencialFinanceiroKSYSUSER: TStringField;
    cdsWebGerencialFinanceiroKSYSDOMAIN: TStringField;
    cdsWebGerencialFinanceiroMODULE: TIntegerField;
    cdsWebGerencialFinanceiroMODULE_DOMAIN: TStringField;
    cdsWebGerencialFinanceiroMODULE_LOGIN: TStringField;
    cdsWebGerencialFinanceiroMODULE_PASSWORD: TStringField;
    cdsWebMonitoriaKSYSUSER_MODULE: TStringField;
    cdsWebMonitoriaKSYSUSER: TStringField;
    cdsWebMonitoriaKSYSDOMAIN: TStringField;
    cdsWebMonitoriaMODULE: TIntegerField;
    cdsWebMonitoriaMODULE_DOMAIN: TStringField;
    cdsWebMonitoriaMODULE_LOGIN: TStringField;
    cdsWebMonitoriaMODULE_PASSWORD: TStringField;
    cdsWebIndicadoresKSYSUSER_MODULE: TStringField;
    cdsWebIndicadoresKSYSUSER: TStringField;
    cdsWebIndicadoresKSYSDOMAIN: TStringField;
    cdsWebIndicadoresMODULE: TIntegerField;
    cdsWebIndicadoresMODULE_DOMAIN: TStringField;
    cdsWebIndicadoresMODULE_LOGIN: TStringField;
    cdsWebIndicadoresMODULE_PASSWORD: TStringField;
    cdsWebPortalKSYSUSER_MODULE: TStringField;
    cdsWebPortalKSYSUSER: TStringField;
    cdsWebPortalKSYSDOMAIN: TStringField;
    cdsWebPortalMODULE: TIntegerField;
    cdsWebPortalMODULE_DOMAIN: TStringField;
    cdsWebPortalMODULE_LOGIN: TStringField;
    cdsWebPortalMODULE_PASSWORD: TStringField;
    cdsWebCaixaFerramentasKSYSUSER_MODULE: TStringField;
    cdsWebCaixaFerramentasKSYSUSER: TStringField;
    cdsWebCaixaFerramentasKSYSDOMAIN: TStringField;
    cdsWebCaixaFerramentasMODULE: TIntegerField;
    cdsWebCaixaFerramentasMODULE_DOMAIN: TStringField;
    cdsWebCaixaFerramentasMODULE_LOGIN: TStringField;
    cdsWebCaixaFerramentasMODULE_PASSWORD: TStringField;
    sqlWebGerencialZootecnicoKSYSUSER_MODULE: TStringField;
    sqlWebGerencialZootecnicoKSYSUSER: TStringField;
    sqlWebGerencialZootecnicoKSYSDOMAIN: TStringField;
    sqlWebGerencialZootecnicoMODULE: TIntegerField;
    sqlWebGerencialZootecnicoMODULE_DOMAIN: TStringField;
    sqlWebGerencialZootecnicoMODULE_LOGIN: TStringField;
    sqlWebGerencialZootecnicoMODULE_PASSWORD: TStringField;
    sqlWebGerencialFinanceiroKSYSUSER_MODULE: TStringField;
    sqlWebGerencialFinanceiroKSYSUSER: TStringField;
    sqlWebGerencialFinanceiroKSYSDOMAIN: TStringField;
    sqlWebGerencialFinanceiroMODULE: TIntegerField;
    sqlWebGerencialFinanceiroMODULE_DOMAIN: TStringField;
    sqlWebGerencialFinanceiroMODULE_LOGIN: TStringField;
    sqlWebGerencialFinanceiroMODULE_PASSWORD: TStringField;
    sqlWebMonitoriaKSYSUSER_MODULE: TStringField;
    sqlWebMonitoriaKSYSUSER: TStringField;
    sqlWebMonitoriaKSYSDOMAIN: TStringField;
    sqlWebMonitoriaMODULE: TIntegerField;
    sqlWebMonitoriaMODULE_DOMAIN: TStringField;
    sqlWebMonitoriaMODULE_LOGIN: TStringField;
    sqlWebMonitoriaMODULE_PASSWORD: TStringField;
    sqlWebIndicadoresKSYSUSER_MODULE: TStringField;
    sqlWebIndicadoresKSYSUSER: TStringField;
    sqlWebIndicadoresKSYSDOMAIN: TStringField;
    sqlWebIndicadoresMODULE: TIntegerField;
    sqlWebIndicadoresMODULE_DOMAIN: TStringField;
    sqlWebIndicadoresMODULE_LOGIN: TStringField;
    sqlWebIndicadoresMODULE_PASSWORD: TStringField;
    sqlWebPortalKSYSUSER_MODULE: TStringField;
    sqlWebPortalKSYSUSER: TStringField;
    sqlWebPortalKSYSDOMAIN: TStringField;
    sqlWebPortalMODULE: TIntegerField;
    sqlWebPortalMODULE_DOMAIN: TStringField;
    sqlWebPortalMODULE_LOGIN: TStringField;
    sqlWebPortalMODULE_PASSWORD: TStringField;
    sqlWebCaixaFerramentasKSYSUSER_MODULE: TStringField;
    sqlWebCaixaFerramentasKSYSUSER: TStringField;
    sqlWebCaixaFerramentasKSYSDOMAIN: TStringField;
    sqlWebCaixaFerramentasMODULE: TIntegerField;
    sqlWebCaixaFerramentasMODULE_DOMAIN: TStringField;
    sqlWebCaixaFerramentasMODULE_LOGIN: TStringField;
    sqlWebCaixaFerramentasMODULE_PASSWORD: TStringField;
    procedure cdsLstUsersNewRecord(DataSet: TDataSet);
    procedure cdsUserNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoNewRecord(DataSet: TDataSet);
    procedure cdsUserBeforeDelete(DataSet: TDataSet);
    procedure cdsUserEMAILValidate(Sender: TField);
    procedure cdsEntidadeEMAILValidate(Sender: TField);
    procedure cdsUserLOGINValidate(Sender: TField);
    procedure sqlWebGerencialZootecnicoBeforeOpen(DataSet: TDataSet);
    procedure sqlWebGerencialFinanceiroBeforeOpen(DataSet: TDataSet);
    procedure sqlWebMonitoriaBeforeOpen(DataSet: TDataSet);
    procedure sqlWebIndicadoresBeforeOpen(DataSet: TDataSet);
    procedure sqlWebPortalBeforeOpen(DataSet: TDataSet);
    procedure sqlWebCaixaFerramentasBeforeOpen(DataSet: TDataSet);
    procedure cdsWebGerencialZootecnicoNewRecord(DataSet: TDataSet);
    procedure cdsWebGerencialFinanceiroNewRecord(DataSet: TDataSet);
    procedure cdsWebMonitoriaNewRecord(DataSet: TDataSet);
    procedure cdsWebIndicadoresNewRecord(DataSet: TDataSet);
    procedure cdsWebPortalNewRecord(DataSet: TDataSet);
    procedure cdsWebCaixaFerramentasNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Validates,
     ClAg5ClientCommonTypes,
     UDBEntidades, Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;


{$R *.dfm}

{ TrdmdtmSYS_USERS }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmSYS_USERS.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('ENTIDADES').Connection ) ;
end;
{$ENDIF}


{ TdtmCustomListaFicha }

procedure TdtmSYS_USERS.OpenTables;
begin
  inherited;
  //
end;


procedure TdtmSYS_USERS.sqlWebGerencialZootecnicoBeforeOpen(DataSet: TDataSet);
begin
  sqlWebGerencialZootecnico.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; // 1
end;

procedure TdtmSYS_USERS.sqlWebGerencialFinanceiroBeforeOpen(DataSet: TDataSet);
begin
  sqlWebGerencialFinanceiro.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; // 2
end;

procedure TdtmSYS_USERS.sqlWebMonitoriaBeforeOpen(DataSet: TDataSet);
begin
  sqlWebMonitoria.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; // 3
end;


procedure TdtmSYS_USERS.sqlWebIndicadoresBeforeOpen(DataSet: TDataSet);
begin
  sqlWebIndicadores.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; // 4
end;

procedure TdtmSYS_USERS.sqlWebPortalBeforeOpen(DataSet: TDataSet);
begin
  sqlWebPortal.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; //5
end;

procedure TdtmSYS_USERS.sqlWebCaixaFerramentasBeforeOpen(DataSet: TDataSet);
begin
  sqlWebCaixaFerramentas.ParamByName( 'KSYS$DOMAIN' ).AsString := LoggedUser.DomainID ; //6
end;


procedure TdtmSYS_USERS.cdsWebGerencialZootecnicoNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebGerencialZootecnicoKSYSUSER_MODULE) ;
  cdsWebGerencialZootecnicoKSYSDOMAIN.AsString := LoggedUser.DomainID ; // 1
  cdsWebGerencialZootecnicoKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebGerencialZootecnicoMODULE.asInteger    := 1 ;
end;

procedure TdtmSYS_USERS.cdsWebGerencialFinanceiroNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebGerencialFinanceiroKSYSUSER_MODULE) ;
  cdsWebGerencialFinanceiroKSYSDOMAIN.AsString := LoggedUser.DomainID ; // 2
  cdsWebGerencialFinanceiroKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebGerencialFinanceiroMODULE.asInteger    := 2 ;
end;

procedure TdtmSYS_USERS.cdsWebMonitoriaNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebMonitoriaKSYSUSER_MODULE) ;
  cdsWebMonitoriaKSYSDOMAIN.AsString := LoggedUser.DomainID ; // 3
  cdsWebMonitoriaKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebMonitoriaMODULE.asInteger    := 3 ;
end;


procedure TdtmSYS_USERS.cdsWebIndicadoresNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebIndicadoresKSYSUSER_MODULE) ;
  cdsWebIndicadoresKSYSDOMAIN.AsString := LoggedUser.DomainID ; // 4
  cdsWebIndicadoresKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebIndicadoresMODULE.asInteger    := 4 ;
end;

procedure TdtmSYS_USERS.cdsWebPortalNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebPortalKSYSUSER_MODULE) ;
  cdsWebPortalKSYSDOMAIN.AsString := LoggedUser.DomainID ; //5
  cdsWebPortalKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebPortalMODULE.asInteger    := 5 ;
end;

procedure TdtmSYS_USERS.cdsWebCaixaFerramentasNewRecord(DataSet: TDataSet);
begin
  GetKey ( cdsWebCaixaFerramentasKSYSUSER_MODULE) ;
  cdsWebCaixaFerramentasKSYSDOMAIN.AsString := LoggedUser.DomainID ; //6
  cdsWebCaixaFerramentasKSYSUSER.AsString   := cdsUserKSYSUSER.asString ; //6
  cdsWebCaixaFerramentasMODULE.asInteger    := 6 ;
end;

procedure TdtmSYS_USERS.cdsLstUsersNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmSYS_USERS.cdsUserBeforeDelete(DataSet: TDataSet);
begin
  if ( UpperCase(cdsUserLOGIN.AsString) = 'ADMIN' ) then
  begin
    Raise Warning.Create ('Não é permitido excluir o usuário Admin');
  end;
end;

procedure TdtmSYS_USERS.cdsUserEMAILValidate(Sender: TField);
begin
  if Sender.AsString.Trim = '' then
     exit ;

  if not TValidates.ValidaEMail( Sender.AsString ) then
    raise Warning.Create('Email inválido - Ex: nome@dominio.com.br');
end;

procedure TdtmSYS_USERS.cdsUserLOGINValidate(Sender: TField);
begin
  if TUsuarioParams.VerificaLogin ( Sender.asString, cdsUserKSYSUSER.AsString ) then
    raise Warning.Create('Login sendo usado por outro usuário');
end;

procedure TdtmSYS_USERS.cdsUserNewRecord(DataSet: TDataSet);
begin
  self.CopyKeysFromMaster ;
  cdsUserLOGIN.asString        := '_' ;
  cdsUserPassword.asString     := '_' ;
  cdsUserEmail.asString        := 'e@d.c' ;
  cdsUserINACTIVED.AsInteger  := 0 ;
  cdsUserTYPEREC.asString     := 'U' ;
  cdsEntidade.Append ;

  cdsUserLOGIN.clear ;
  cdsUserPassword.clear ;
  cdsUserEmail.clear ;

end;


procedure TdtmSYS_USERS.cdsEntidadeNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEntidadeKCAD_ENTIDADE.Value := cdsUserKSYSUSER.Value ;
  cdsEntidadeKCAD_FAZENDA.Value  := LoggedUser.DomainID ;
  cdsEntidadePESSOA.asString := 'F' ;
  cdsEntidadeIS_FUNCIONARIO.asString := 'F' ;
  cdsEntidadeIS_CLIENTE.asString := 'F' ;
end;

procedure TdtmSYS_USERS.cdsEntidadeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cdsUser.Bof and cdsUser.EOF then
     cdsUser.Append ;

end;

procedure TdtmSYS_USERS.cdsEntidadeEMAILValidate(Sender: TField);
begin
  if Sender.AsString.Trim = '' then
     exit ;
  if not TValidates.ValidaEMail( Sender.AsString ) then
    raise Warning.Create('Email inválido - Ex: nome@dominio.com.br');
end;

procedure TdtmSYS_USERS.ApplyUpdates;
var
  ErrMsg : string ;
  AddNome, AddNomeCompleto : boolean ;
begin

   TCDSSuppl.PostIfNeed ( cdsUser ) ;

   if  ( not ( cdsUser.bof and cdsUser.eof ) ) then
     begin
       ErrMsg := '';

       if ( not cdsEntidade.IsEmpty {cdsEntidadeIS_FUNCIONARIO.AsBoolean} ) and ( cdsEntidadeAPELIDO.asString.Trim = '' ) then
          ErrMsg  := ErrMsg + #13#10 + 'Nome' ;
       if ( not cdsEntidade.IsEmpty {cdsEntidadeIS_FUNCIONARIO.AsBoolean} ) and ( cdsEntidadeNOME.asString.Trim = '' ) then
          ErrMsg := ErrMsg + #13#10 + 'Nome completo' ;

       if ( ErrMsg <> '' ) then
         if cdsEntidadeIS_FUNCIONARIO.AsBoolean then
           Raise Warning.Create ( 'Campos requeridos para funcionários não preenchidos' + #13#10 + ErrMsg )
         else
           Raise Warning.Create ( 'Campos requeridos não preenchidos' + #13#10 + ErrMsg ) ;

     end ;

  inherited;
end;

procedure TdtmSYS_USERS.cdsEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;

  if ( cdsEntidade.Bof and cdsEntidade.EOF ) and not ( cdsEntidade.State in [dsInsert,dsEdit] )  then
     cdsEntidade.Append ;

  if cdsEntidadeKENDERECO.isNull then
     begin
         cdsEntidade.edit ;
         GetKey ( cdsEntidadeKENDERECO, 'KGLB_ENDERECO' ) ;
     end ;
end;

procedure TdtmSYS_USERS.cdsEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEnderecoKGLB_ENDERECO.Value := cdsEntidadeKENDERECO.Value ;
  cdsEnderecoTABLENAME.asString  := 'CAD_ENTIDADES' ;
  cdsEnderecoTABLEKEY.Value      := cdsEntidadeKENDERECO.Value ;
end;

end.
