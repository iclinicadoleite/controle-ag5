unit UdtmCAD_Entidades;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASEDBListEdit, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Validates,
  Data.FMTBcd, Datasnap.Provider, SqlExpr, Datasnap.Win.MConnect ;

type
  TdtmCAD_Entidades = class(T_dtmBASEDBListEdit)
    cdsLstEntidades: TClientDataSet;
    cdsEntidade: TClientDataSet;
    dtsList: TDataSource;
    cdsEndereco: TClientDataSet;
    cdsLstEntidadesKCAD_ENTIDADE: TStringField;
    cdsLstEntidadesCODIGO: TStringField;
    cdsLstEntidadesAPELIDO: TStringField;
    cdsLstEntidadesNOME: TStringField;
    cdsEnderecoCobranca: TClientDataSet;
    cdsEnderecoEntrega: TClientDataSet;
    cdsEnderecoKGLB_ENDERECO: TStringField;
    cdsEnderecoENDERECO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCXPOSTAL: TStringField;
    cdsEnderecoCobrancaKGLB_ENDERECO: TStringField;
    cdsEnderecoCobrancaENDERECO: TStringField;
    cdsEnderecoCobrancaCOMPLEMENTO: TStringField;
    cdsEnderecoCobrancaBAIRRO: TStringField;
    cdsEnderecoCobrancaCEP: TStringField;
    cdsEnderecoCobrancaCIDADE: TStringField;
    cdsEnderecoCobrancaUF: TStringField;
    cdsEnderecoCobrancaCXPOSTAL: TStringField;
    cdsEnderecoEntregaKGLB_ENDERECO: TStringField;
    cdsEnderecoEntregaENDERECO: TStringField;
    cdsEnderecoEntregaCOMPLEMENTO: TStringField;
    cdsEnderecoEntregaBAIRRO: TStringField;
    cdsEnderecoEntregaCEP: TStringField;
    cdsEnderecoEntregaCIDADE: TStringField;
    cdsEnderecoEntregaUF: TStringField;
    cdsEnderecoEntregaCXPOSTAL: TStringField;
    cdsEnderecoTABLENAME: TStringField;
    cdsEnderecoTABLEKEY: TStringField;
    cdsEnderecoCobrancaTABLENAME: TStringField;
    cdsEnderecoCobrancaTABLEKEY: TStringField;
    cdsEnderecoEntregaTABLENAME: TStringField;
    cdsEnderecoEntregaTABLEKEY: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCobrancaNUMERO: TStringField;
    cdsEnderecoEntregaNUMERO: TStringField;
    cdsEntidadePESSOA: TStringField;
    cdsEntidadeCPF_CNPJ: TStringField;
    cdsOutrosEnderecos: TClientDataSet;
    cdsOutrosEnderecosKGLB_ENDERECO: TStringField;
    cdsOutrosEnderecosTABLENAME: TStringField;
    cdsOutrosEnderecosTABLEKEY: TStringField;
    cdsOutrosEnderecosENDERECO: TStringField;
    cdsOutrosEnderecosNUMERO: TStringField;
    cdsOutrosEnderecosCOMPLEMENTO: TStringField;
    cdsOutrosEnderecosBAIRRO: TStringField;
    cdsOutrosEnderecosCEP: TStringField;
    cdsOutrosEnderecosCIDADE: TStringField;
    cdsOutrosEnderecosUF: TStringField;
    cdsOutrosEnderecosCXPOSTAL: TStringField;
    cdsContatos: TClientDataSet;
    cdsContatosKCAD_CONTATO: TIntegerField;
    cdsContatosKCAD_ENTIDADE: TStringField;
    cdsContatosNOME: TStringField;
    cdsContatosDEPTO: TStringField;
    cdsContatosEMAIL: TStringField;
    cdsContatosCELULAR: TStringField;
    cdsContatosFONE1: TStringField;
    cdsContatosFONE2: TStringField;
    cdsContatosFAX: TStringField;
    cdsLstEntidadesCPF_CNPJ: TStringField;
    scRdmCadEntidades: TSharedConnection;
    cdsLstEntidadesATIVO: TStringField;
    sqlLstEntidades: TTcSQLDataSet;
    sqlLstEntidadesKCAD_ENTIDADE: TStringField;
    sqlLstEntidadesCODIGO: TStringField;
    sqlLstEntidadesATIVO: TStringField;
    sqlLstEntidadesAPELIDO: TStringField;
    sqlLstEntidadesNOME: TStringField;
    sqlLstEntidadesCPF_CNPJ: TStringField;
    sqlEntidade: TTcSQLDataSet;
    dtsSQLEdit: TDataSource;
    sqlEndereco: TTcSQLDataSet;
    sqlEnderecoKGLB_ENDERECO: TStringField;
    sqlEnderecoENDERECO: TStringField;
    sqlEnderecoNUMERO: TStringField;
    sqlEnderecoCOMPLEMENTO: TStringField;
    sqlEnderecoBAIRRO: TStringField;
    sqlEnderecoCEP: TStringField;
    sqlEnderecoCIDADE: TStringField;
    sqlEnderecoUF: TStringField;
    sqlEnderecoCXPOSTAL: TStringField;
    sqlEnderecoCobranca: TTcSQLDataSet;
    sqlEnderecoCobrancaKGLB_ENDERECO: TStringField;
    sqlEnderecoCobrancaENDERECO: TStringField;
    sqlEnderecoCobrancaNUMERO: TStringField;
    sqlEnderecoCobrancaCOMPLEMENTO: TStringField;
    sqlEnderecoCobrancaBAIRRO: TStringField;
    sqlEnderecoCobrancaCEP: TStringField;
    sqlEnderecoCobrancaCIDADE: TStringField;
    sqlEnderecoCobrancaUF: TStringField;
    sqlEnderecoCobrancaCXPOSTAL: TStringField;
    sqlEnderecoEntrega: TTcSQLDataSet;
    sqlEnderecoEntregaKGLB_ENDERECO: TStringField;
    sqlEnderecoEntregaENDERECO: TStringField;
    sqlEnderecoEntregaNUMERO: TStringField;
    sqlEnderecoEntregaCOMPLEMENTO: TStringField;
    sqlEnderecoEntregaBAIRRO: TStringField;
    sqlEnderecoEntregaCEP: TStringField;
    sqlEnderecoEntregaCIDADE: TStringField;
    sqlEnderecoEntregaUF: TStringField;
    sqlEnderecoEntregaCXPOSTAL: TStringField;
    sqlOutrosEnderecos: TTcSQLDataSet;
    sqlOutrosEnderecosKGLB_ENDERECO: TStringField;
    sqlOutrosEnderecosENDERECO: TStringField;
    sqlOutrosEnderecosNUMERO: TStringField;
    sqlOutrosEnderecosCOMPLEMENTO: TStringField;
    sqlOutrosEnderecosBAIRRO: TStringField;
    sqlOutrosEnderecosCEP: TStringField;
    sqlOutrosEnderecosCIDADE: TStringField;
    sqlOutrosEnderecosUF: TStringField;
    sqlOutrosEnderecosCXPOSTAL: TStringField;
    sqlContatos: TTcSQLDataSet;
    sqlContatosKCAD_CONTATO: TIntegerField;
    sqlContatosKCAD_ENTIDADE: TStringField;
    sqlContatosNOME: TStringField;
    sqlContatosDEPTO: TStringField;
    sqlContatosEMAIL: TStringField;
    sqlContatosCELULAR: TStringField;
    sqlContatosFONE1: TStringField;
    sqlContatosFONE2: TStringField;
    sqlContatosFAX: TStringField;
    dspLstEntidades: TDataSetProvider;
    dspEntidade: TDataSetProvider;
    sqlEntidadeKSYSLICENSE: TStringField;
    sqlEntidadeKCAD_FAZENDA: TStringField;
    sqlEntidadeCODIGO: TStringField;
    sqlEntidadeAPELIDO: TStringField;
    sqlEntidadeNOME: TStringField;
    sqlEntidadeATIVO: TStringField;
    sqlEntidadeKENDERECO: TStringField;
    sqlEntidadePESSOA: TStringField;
    sqlEntidadeCPF_CNPJ: TStringField;
    sqlEntidadeRG_IE: TStringField;
    sqlEntidadeURL: TStringField;
    sqlEntidadeEMAIL: TStringField;
    sqlEntidadeIS_CLIENTE: TStringField;
    sqlEntidadeIS_FORNECEDOR: TStringField;
    sqlEntidadeIS_FUNCIONARIO: TStringField;
    sqlEntidadeIS_TRANSPORTADORA: TStringField;
    sqlEntidadeOBS: TMemoField;
    sqlEntidadeFONE: TStringField;
    sqlEntidadeRAMAL: TStringField;
    sqlEntidadeFAX: TStringField;
    sqlEnderecoTABLENAME: TStringField;
    sqlEnderecoTABLEKEY: TStringField;
    sqlEnderecoCobrancaTABLENAME: TStringField;
    sqlEnderecoCobrancaTABLEKEY: TStringField;
    sqlEnderecoEntregaTABLENAME: TStringField;
    sqlEnderecoEntregaTABLEKEY: TStringField;
    sqlOutrosEnderecosTABLENAME: TStringField;
    sqlOutrosEnderecosTABLEKEY: TStringField;
    cdsEntidadeKSYSLICENSE: TStringField;
    cdsEntidadeKCAD_FAZENDA: TStringField;
    cdsEntidadeCODIGO: TStringField;
    cdsEntidadeAPELIDO: TStringField;
    cdsEntidadeNOME: TStringField;
    cdsEntidadeATIVO: TStringField;
    cdsEntidadeKENDERECO: TStringField;
    cdsEntidadeRG_IE: TStringField;
    cdsEntidadeURL: TStringField;
    cdsEntidadeEMAIL: TStringField;
    cdsEntidadeIS_CLIENTE: TStringField;
    cdsEntidadeIS_FORNECEDOR: TStringField;
    cdsEntidadeIS_FUNCIONARIO: TStringField;
    cdsEntidadeIS_TRANSPORTADORA: TStringField;
    cdsEntidadeOBS: TMemoField;
    cdsEntidadeFONE: TStringField;
    cdsEntidadeRAMAL: TStringField;
    cdsEntidadeFAX: TStringField;
    cdsEntidadesqlOutrosEnderecos: TDataSetField;
    cdsEntidadesqlEndereco: TDataSetField;
    sqlEntidadeKCAD_ENTIDADE: TStringField;
    cdsEntidadeKCAD_ENTIDADE: TStringField;
    sqlLstEntidadesSYSUI: TStringField;
    sqlLstEntidadesSYSDI: TSQLTimeStampField;
    sqlLstEntidadesSYSUU: TStringField;
    sqlLstEntidadesSYSDU: TSQLTimeStampField;
    cdsLstEntidadesSYSUI: TStringField;
    cdsLstEntidadesSYSDI: TSQLTimeStampField;
    cdsLstEntidadesSYSUU: TStringField;
    cdsLstEntidadesSYSDU: TSQLTimeStampField;
    procedure cdsLstEntidadesNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoCobrancaNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoEntregaNewRecord(DataSet: TDataSet);
    procedure cdsEnderecoBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoCobrancaBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoEntregaBeforeInsert(DataSet: TDataSet);
    procedure cdsOutrosEnderecosBeforeInsert(DataSet: TDataSet);
    procedure cdsOutrosEnderecosNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeBeforeInsert(DataSet: TDataSet);
    procedure cdsContatosBeforeInsert(DataSet: TDataSet);
    procedure cdsContatosNewRecord(DataSet: TDataSet);
    procedure cdsEntidadePESSOAChange(Sender: TField);
    procedure cdsEntidadeCPF_CNPJValidate(Sender: TField);
    procedure cdsLstEntidadesBeforeOpen(DataSet: TDataSet);
    procedure cdsLstEntidadesATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsEntidadeCalcFields(DataSet: TDataSet);
    procedure cdsEntidadeDDSFATValidate(Sender: TField);
  private
    { Private declarations }
    FShowInativos,
    FShowClientes,
    FShowFornecedores,
    FShowFuncionarios,
    FShowVendedores,
    FShowRepresentantes,
    FShowCompradores,
    FShowTransportadora : Boolean ;
    procedure SetParams ;
  public
    { Public declarations }
    procedure SetFilter ( ShowInativos, ShowClientes, ShowFornecedores,
       ShowFuncionarios, ShowVendedores,ShowRepresentantes, ShowCompradores, ShowTransportadora : Boolean );
    procedure OpenTables ; override ;
    procedure RefreshList ; override ;

    procedure InitDDSFat ;
    procedure SetValidateDDSFat ( Event : TFieldNotifyEvent  ) ;

    procedure SetCondPagto ( Key : integer ;Condicao : string ) ;
    procedure SetTransportadora(Key: integer; NomeTransportadora : string ) ;
    procedure SetRedespacho ( Key : integer ;NomeRedespacho : string ) ;
    procedure SetVendedor ( Key : integer ;NomeVendedor : string ) ;
    procedure ApplyUpdates ; override ;

  end;

implementation

uses UDBResources, Exceptions, Data.SQLTimSt, MaskUtils ,
  UfrmSearchProgress;

{$R *.dfm}

resourcestring
  _CPF_JACADASTRADO  = 'CPF ''%s'' ja cadastrado' ;
  _CNPJ_JACADASTRADO = 'CNPJ ''%s'' ja cadastrado' ;

const
   _MASK_CPF = '999\.999\.999\-99' ;
   _MASK_CNPJ = '99\.999\.999\/9999\-99' ;

{ TdtmCAD_Entidades }

procedure TdtmCAD_Entidades.OpenTables;
begin
  inherited;
  if not cdsLstEntidades.IsEmpty then
     cdsEntidade.RefreshRecord ;
end;

procedure TdtmCAD_Entidades.cdsLstEntidadesNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmCAD_Entidades.cdsEntidadeNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
  cdsEntidadePESSOA.AsString            := 'F' ;
  cdsEntidadeATIVO.AsString             := 'T' ;
  cdsEntidadeIS_CLIENTE.AsString        := 'T' ;
  cdsEntidadeIS_FORNECEDOR.AsString     := 'F' ;
  cdsEntidadeIS_FUNCIONARIO.AsString    := 'F' ;
  cdsEntidadeIS_TRANSPORTADORA.AsString := 'F' ;
  cdsEntidadeKSYSLICENSE.Value          := LoggedUser.License ;
  cdsEntidadeKCAD_FAZENDA.Value         := LoggedUser.DomainID ;

//  cdsEntidadeDDSFAT.asString            := 'FTTTTTF' ; // - dom, sab

//  cdsEntidadeDATACADASTRO.AsDateTime   := Now ;

end;

procedure TdtmCAD_Entidades.cdsEntidadeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsLstEntidades.IsEmpty ) and not ( cdsLstEntidades.State in [dsInsert,dsEdit] )  then
     cdsLstEntidades.Append ;
end;

procedure TdtmCAD_Entidades.cdsEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

  if cdsEntidadeKENDERECO.isNull then
     begin
         cdsEntidade.edit ;
         GetKey ( cdsEntidadeKENDERECO, 'KGLB_ENDERECO' ) ;
     end ;

end;

procedure TdtmCAD_Entidades.cdsEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEnderecoKGLB_ENDERECO.Value := cdsEntidadeKENDERECO.Value ;
  cdsEnderecoTABLENAME.asString      := 'CAD_ENTIDADES' ;
  cdsEnderecoTABLEKEY.Value      := cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Entidades.cdsEnderecoCobrancaBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;

  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

//  if cdsEntidadeKENDERECOCOBRANCA.isNull then
//     begin
//         cdsEntidade.edit ;
//         GetKey ( cdsEntidadeKENDERECOCOBRANCA, 'KGLB_ENDERECO' ) ;
//     end ;
end;

procedure TdtmCAD_Entidades.cdsEnderecoCobrancaNewRecord(
  DataSet: TDataSet);
begin
  inherited;
//  cdsEnderecoCobrancaKGLB_ENDERECO.Value := cdsEntidadeKENDERECOCOBRANCA.Value ;
//  cdsEnderecoCobrancaTABLENAME.asString      := 'CAD_ENTIDADES' ;
//  cdsEnderecoCobrancaTABLEKEY.Value      := cdsEntidadeKCAD_ENTIDADE.Value ; ;
end;


procedure TdtmCAD_Entidades.cdsEnderecoEntregaBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;

  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;

//  if cdsEntidadeKENDERECOENTREGA.isNull then
//    begin
//       cdsEntidade.Edit ;
//       GetKey ( cdsEntidadeKENDERECOENTREGA, 'KGLB_ENDERECO' ) ;
//    end ;

end;

procedure TdtmCAD_Entidades.cdsEnderecoEntregaNewRecord(DataSet: TDataSet);
begin
  inherited;
//  cdsEnderecoEntregaKGLB_ENDERECO.Value := cdsEntidadeKENDERECOENTREGA.Value ;
//  cdsEnderecoEntregaTABLENAME.asString      := 'CAD_ENTIDADES' ;
//  cdsEnderecoEntregaTABLEKEY.Value      :=  cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Entidades.cdsOutrosEnderecosNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsOutrosEnderecosKGLB_ENDERECO, 'KGLB_ENDERECO' ) ;
  cdsOutrosEnderecosTABLENAME.asString      := 'CAD_ENTIDADES' ;
  cdsOutrosEnderecosTABLEKEY.Value      :=  cdsEntidadeKCAD_ENTIDADE.Value ;
end;

procedure TdtmCAD_Entidades.cdsOutrosEnderecosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;
//     cdsEntidade.Edit ;
end;

procedure TdtmCAD_Entidades.ApplyUpdates;
begin

  if not ( cdsEntidade.bof and cdsEntidade.Eof ) then
    begin
      if not (cdsEntidadeIS_CLIENTE.asBoolean
          or cdsEntidadeIS_FORNECEDOR.asBoolean
          or cdsEntidadeIS_FUNCIONARIO.asBoolean
          or cdsEntidadeIS_TRANSPORTADORA.asBoolean ) then
          raise Warning.Create('é necessário escolher pelo menos um tipo de relacionamento');
    end;

  inherited;

end;

procedure TdtmCAD_Entidades.cdsContatosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ( cdsEntidade.IsEmpty )   then
     cdsEntidade.Append ;
end;

procedure TdtmCAD_Entidades.cdsContatosNewRecord(DataSet: TDataSet);
begin
  inherited;
  GetKey ( cdsContatosKCAD_CONTATO ) ;
end;

function RemoveCharMask(const s: string): string;
begin

   Result := s;
   Result := StringReplace(Result, '.', '', [rfReplaceAll]);
   Result := StringReplace(Result, '/', '', [rfReplaceAll]);
   Result := StringReplace(Result, '-', '', [rfReplaceAll]);
   Result := StringReplace(Result, ' ', '', [rfReplaceAll]);

end;


procedure TdtmCAD_Entidades.cdsEntidadePESSOAChange(Sender: TField);
var
  CPF_CNPJ : string ;
begin
  inherited;
  if Sender.AsString = 'F' then
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CPF + ';1'
  else
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CNPJ + ';1';

  CPF_CNPJ := RemoveCharMask ( cdsEntidadeCPF_CNPJ.asString ) ;


  cdsEntidade.DisableConstraints ;
  if Sender.AsString = 'F' then
   cdsEntidadeCPF_CNPJ.asString := FormatMaskText( _MASK_CPF+ ';0', CPF_CNPJ  )
  else
   cdsEntidadeCPF_CNPJ.asString := FormatMaskText(_MASK_CNPJ+ ';0', CPF_CNPJ  ) ;
  cdsEntidade.EnableConstraints ;
end;


procedure TdtmCAD_Entidades.cdsEntidadeCPF_CNPJValidate(Sender: TField);
begin
  inherited;

  if RemoveCharMask(Sender.AsString) = '' then
     exit ;

  if cdsEntidadePESSOA.asString = 'J' then
     begin
//       if not ValidCNPJ ( Sender.AsString ) then
//          Raise Warning.Create ( 'CNPJ Inválido' ) ;
     end
  else
     begin
//        if not TestaCPF ( Sender.AsString ) then
//           Raise Warning.Create ( 'CPF Inválido' ) ;
     end ;
{
  if cdsEntidadePESSOA.asString = 'F' then
     if DBResources.CheckExistsIn( 'CAD_ENTIDADES', 'CPF_CNPJ', Copy ( Sender.AsString, 1, 14 ), 'KCAD_ENTIDADE <> ' + cdsEntidadeKCAD_ENTIDADE.asString ) then
        Raise Warning.CreateFmt( _CPF_JACADASTRADO, [ Copy ( Sender.AsString, 1 ,14 ) ] )
  else
     if DBResources.CheckExistsIn( 'CAD_ENTIDADES', 'CPF_CNPJ', Sender.AsString, 'KCAD_ENTIDADE <> ' + cdsEntidadeKCAD_ENTIDADE.asString ) then
        Raise Warning.CreateFmt( _CNPJ_JACADASTRADO, [ Sender.AsString ] ) ;
}
end;

procedure TdtmCAD_Entidades.SetParams;
begin

//   cdsLstEntidades.Params.ParamByName( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;


   cdsLstEntidades.Params.ParamByName( 'DSP_INATIVO'         ).asString := BoolToChar ( FShowInativos        ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_CLIENTE'         ).asString := BoolToChar ( FShowClientes        ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_FORNECEDOR'      ).asString := BoolToChar ( FShowFornecedores    ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_FUNCIONARIO'     ).asString := BoolToChar ( FShowFuncionarios    ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_VENDEDOR'        ).asString := BoolToChar ( FShowVendedores      ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_REPRESENTANTE'   ).asString := BoolToChar ( FShowRepresentantes  ) ;
//   cdsLstEntidades.Params.ParamByName( 'DSP_COMPRADOR'       ).asString := BoolToChar ( FShowCompradores     ) ;
   cdsLstEntidades.Params.ParamByName( 'DSP_TRANSPORTADORA'  ).asString := BoolToChar ( FShowTransportadora  ) ;

end;

procedure TdtmCAD_Entidades.cdsLstEntidadesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams;
end;

procedure TdtmCAD_Entidades.SetFilter(ShowInativos, ShowClientes,
  ShowFornecedores, ShowFuncionarios, ShowVendedores, ShowRepresentantes,
  ShowCompradores, ShowTransportadora: Boolean);
begin
    FShowInativos         := ShowInativos        ;
    FShowClientes         := ShowClientes        ;
    FShowFornecedores     := ShowFornecedores    ;
    FShowFuncionarios     := ShowFuncionarios    ;
    FShowVendedores       := ShowVendedores      ;
    FShowRepresentantes   := ShowRepresentantes  ;
    FShowCompradores      := ShowCompradores  ;
    FShowTransportadora   := ShowTransportadora  ;
    SetParams ;
    self.RefreshList ;
//    ThreadSuppl.TSyncThread.Create ( self.RefreshList ) ;
end;

procedure TdtmCAD_Entidades.cdsLstEntidadesATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
//  Text := BooleanFieldToText ( Sender ) ;
end;

procedure TdtmCAD_Entidades.RefreshList;
begin
  inherited;
  UfrmSearchProgress.TfrmSearchProgress.HideProgress ;
end;

procedure TdtmCAD_Entidades.SetCondPagto(Key: integer; Condicao: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEnt-idadeDESCRCONDPAGTO.asString := Condicao ;
//   cdsEntidadeKFIN_CONDPAGTO.Value := Key ;
end;


procedure TdtmCAD_Entidades.SetTransportadora(Key: integer;
  NomeTransportadora : string ) ;
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMETRANSPORTADORA.asString := NomeTransportadora ;
//   cdsEntidadeKCAD_TRANSPORTADORA.Value := Key ;
end;

procedure TdtmCAD_Entidades.SetRedespacho(Key: integer;
  NomeRedespacho: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMEREDESPACHO.asString := NomeRedespacho ;
//   cdsEntidadeKCAD_REDESPACHO.Value := Key ;
end;

procedure TdtmCAD_Entidades.SetVendedor(Key: integer;
  NomeVendedor: string);
begin
   if not ( cdsEntidade.State in [dsInsert,dsEdit] ) then
      cdsEntidade.Edit ;

//   cdsEntidadeNOMEVENDEDOR.asString := NomeVendedor ;
//   cdsEntidadeKCAD_VENDEDOR.Value := Key ;
end;

procedure TdtmCAD_Entidades.cdsEntidadeCalcFields(DataSet: TDataSet);
begin
  inherited;

  if cdsEntidade.state = dsInternalCalc then
     begin
//        InitDDSFat ;
     end ;

end;

procedure TdtmCAD_Entidades.cdsEntidadeDDSFATValidate(Sender: TField);
begin
  inherited;
  {
  cdsEntidadeDDSFAT.asString :=
         cdsEntidadeFATDOM.asString
       + cdsEntidadeFATSEG.asString
       + cdsEntidadeFATTER.asString
       + cdsEntidadeFATQUA.asString
       + cdsEntidadeFATQUI.asString
       + cdsEntidadeFATSEX.asString
       + cdsEntidadeFATSAB.asString ;
  }
end;

procedure TdtmCAD_Entidades.InitDDSFat;
begin
    {
      SetValidateDDSFat ( nil ) ;

      cdsEntidadeFATDOM.asString := cdsEntidadeDDSFAT.asString [ 1 ] ;
      cdsEntidadeFATSEG.asString := cdsEntidadeDDSFAT.asString [ 2 ] ;
      cdsEntidadeFATTER.asString := cdsEntidadeDDSFAT.asString [ 3 ] ;
      cdsEntidadeFATQUA.asString := cdsEntidadeDDSFAT.asString [ 4 ] ;
      cdsEntidadeFATQUI.asString := cdsEntidadeDDSFAT.asString [ 5 ] ;
      cdsEntidadeFATSEX.asString := cdsEntidadeDDSFAT.asString [ 6 ] ;
      cdsEntidadeFATSAB.asString := cdsEntidadeDDSFAT.asString [ 7 ] ;

      SetValidateDDSFat ( cdsEntidadeDDSFATValidate ) ;
   }
end;

procedure TdtmCAD_Entidades.SetValidateDDSFat(Event: TFieldNotifyEvent ) ;
begin
     { cdsEntidadeFATDOM.OnValidate := Event ;
      cdsEntidadeFATSEG.OnValidate := Event ;
      cdsEntidadeFATTER.OnValidate := Event ;
      cdsEntidadeFATQUA.OnValidate := Event ;
      cdsEntidadeFATQUI.OnValidate := Event ;
      cdsEntidadeFATSEX.OnValidate := Event ;
      cdsEntidadeFATSAB.OnValidate := Event ;
     }
end;

end.

