unit UdtmCAD_Fazendas;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASEDBListEdit, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, DBClient ;

type
  TdtmCAD_Fazendas = class(T_dtmBASEDBListEdit)
    cdsLstFazendas: TClientDataSet;
    cdsFazenda: TClientDataSet;
    dtsList: TDataSource;
    cdsEntidade: TClientDataSet;
    cdsEndereco: TClientDataSet;
    dspLstFazendas: TDataSetProvider;
    dspFazenda: TDataSetProvider;
    sqlLstFazendas: TTcSQLDataSet;
    sqlFazenda: TTcSQLDataSet;
    dtsSQLFazenda: TDataSource;
    sqlEntidade: TTcSQLDataSet;
    dtsSQLEntidade: TDataSource;
    sqlEndereco: TTcSQLDataSet;
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
    sqlEntidadeKCAD_FAZENDA: TStringField;
    cdsEntidadeKCAD_FAZENDA: TStringField;
    sqlFazendaKCAD_FAZENDA: TStringField;
    cdsFazendaKCAD_FAZENDA: TStringField;
    cdsFazendasqlEntidade: TDataSetField;
    sqlLstFazendasKCAD_FAZENDA: TStringField;
    cdsLstFazendasKCAD_FAZENDA: TStringField;
    sqlLstFazendasNOME: TStringField;
    cdsLstFazendasNOME: TStringField;
    sqlUsuarios: TTcSQLDataSet;
    cdsFazendasqlUsuarios: TDataSetField;
    cdsUsuarios: TClientDataSet;
    sqlUsuariosLOGIN: TStringField;
    cdsUsuariosLOGIN: TStringField;
    sqlFazendaCODIGOCLINICA: TStringField;
    sqlFazendaNOMECONTATO: TStringField;
    sqlFazendaPROPRIETARIO: TStringField;
    sqlFazendaRACAANIMAIS: TIntegerField;
    sqlFazendaTELEFONE1: TStringField;
    sqlFazendaTELEFONE2: TStringField;
    sqlFazendaLOGO: TBlobField;
    cdsFazendaCODIGOCLINICA: TStringField;
    cdsFazendaNOMECONTATO: TStringField;
    cdsFazendaPROPRIETARIO: TStringField;
    cdsFazendaRACAANIMAIS: TIntegerField;
    cdsFazendaTELEFONE1: TStringField;
    cdsFazendaTELEFONE2: TStringField;
    cdsFazendaLOGO: TBlobField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsFazendaDESCR_RACA: TStringField;
    sqlFazendaEMAIL1: TStringField;
    sqlFazendaEMAIL2: TStringField;
    cdsFazendaEMAIL1: TStringField;
    cdsFazendaEMAIL2: TStringField;
    sqlLstFazendasPROPRIETARIO: TStringField;
    cdsLstFazendasPROPRIETARIO: TStringField;
    sqlEntidadeIS_CLIENTE: TStringField;
    cdsEntidadeIS_CLIENTE: TStringField;
    sqlLstFazendasSYSUU: TStringField;
    sqlLstFazendasSYSDU: TSQLTimeStampField;
    cdsLstFazendasSYSUU: TStringField;
    cdsLstFazendasSYSDU: TSQLTimeStampField;
    sqlLstFazendasCIDADE: TStringField;
    sqlLstFazendasUF: TStringField;
    sqlLstFazendasNOMECONTATO: TStringField;
    sqlLstFazendasRACAANIMAIS: TIntegerField;
    cdsLstFazendasCIDADE: TStringField;
    cdsLstFazendasUF: TStringField;
    cdsLstFazendasNOMECONTATO: TStringField;
    cdsLstFazendasRACAANIMAIS: TIntegerField;
    cdsLstFazendasDESCR_RACA: TStringField;
    sqlLstFazendasCODIGOCLINICA: TStringField;
    sqlUsuariosNOME: TStringField;
    cdsUsuariosNOME: TStringField;
    cdsLstFazendasCODIGOCLINICA: TStringField;
    cdsCooperativas: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    cdsFazendaCOOPERATIVA: TIntegerField;
    sqlFazendaCOOPERATIVA: TIntegerField;
    cdsFazendaDESCR_COOPERATIVA: TStringField;
    procedure cdsLstFazendasNewRecord(DataSet: TDataSet);
    procedure cdsFazendaNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoBeforeInsert(DataSet: TDataSet);
    procedure cdsEnderecoNewRecord(DataSet: TDataSet);
    procedure cdsEntidadeNOMEValidate(Sender: TField);
    procedure cdsLstFazendasBeforeOpen(DataSet: TDataSet);
    procedure cdsFazendaEMAIL1Validate(Sender: TField);
    procedure cdsFazendaEMAIL2Validate(Sender: TField);
    procedure cdsEntidadePESSOAChange(Sender: TField);
    procedure cdsEntidadeCPF_CNPJValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
    procedure LoadLogo ( AFileName : string ) ;
    procedure ClearLogo ;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Validates,
     JPeg, Tc.VCL.Graphics,
     Exceptions,
     Tc.RTL.NotificationService,
     CLAg5Types,
     MaskUtils,
     Tc.DBRTL.AbstractDB,
     Tc.VCL.Application
     , DataSnap.DSConnect
     
     , CL.Ag5.NSMsgs ;

{$R *.dfm}


resourcestring
  _CPF_JACADASTRADO  = 'CPF ''%s'' ja cadastrado' ;
  _CNPJ_JACADASTRADO = 'CNPJ ''%s'' ja cadastrado' ;

const
   _MASK_CPF = '999\.999\.999\-99' ;
   _MASK_CNPJ = '99\.999\.999\/9999\-99' ;

{ TrdmdtmCAD_Fazendas }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmCAD_Fazendas.Create(AOwner: TComponent);
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

procedure TdtmCAD_Fazendas.OpenTables;
begin
  TTcAbstractDB.GetItem(0).GetSystemTypes ( _ST_RACA_ANIMAIS, cdsTipoRacasAnimais ) ;
  TTcAbstractDB.GetItem(0).GetSystemTypes ( _ST_COOPERATIVAS, cdsCooperativas ) ;
  inherited;

  if cdsEntidade.IsEmpty then
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CNPJ + ';1'
  else if cdsEntidadePESSOA.AsString = 'F' then
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CPF + ';1'
  else
    cdsEntidadeCPF_CNPJ.EditMask := _MASK_CNPJ + ';1';
end;

procedure TdtmCAD_Fazendas.cdsLstFazendasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsLstFazendas.Params.ParamByName('KCAD_FAZENDA').AsString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
end;

procedure TdtmCAD_Fazendas.cdsLstFazendasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;

procedure TdtmCAD_Fazendas.ClearLogo;
begin
  if not ( cdsFazenda.State in [ dsInsert, dsEdit ] ) then
     cdsFazenda.Edit ;

  cdsFazendaLOGO.Clear ;
  ApplyUpdates ;
  TCLAg5NSMsgSysDomainImageChanged.CreateAndDispatch ( self ) ;
end;

procedure GetLogo ( AImage : TGraphic ; AMaxWidth, AMaxHeight : integer ; AStream : TStream ) ;
var
  ratio : extended ;
  Width, Height : integer ;
  Bitmap : TBitmap ;
  JPEG : TJPEGImage ;
begin
  JPEG := nil ;
  Bitmap := TBitmap.Create ;
  try
    Bitmap.Assign( AImage ) ;


    if ( Bitmap.Width > AMaxWidth ) or ( Bitmap.Height > AMaxHeight ) then
      begin
        if ( Bitmap.Height / Bitmap.Width ) < ( AMaxHeight / AMaxWidth ) then
          Ratio := Bitmap.Width / AMaxWidth
        else
          Ratio := Bitmap.Height / AMaxHeight ;

        Tc.VCL.Graphics.TImageSuppl.Stretch( Bitmap, Bitmap, Trunc ( Bitmap.Width / Ratio ), Trunc ( Bitmap.Height / Ratio ) ) ;
      end ;

    JPEG := TJpegImage.Create ;
    JPEG.Assign( Bitmap );
    JPEG.CompressionQuality := 100 ;
    JPEG.Compress ;
    JPEG.SaveToStream( AStream ) ;
    AStream.Position := 0 ;
  finally
    Bitmap.free ;
    if Assigned ( JPEG ) then
       JPEG.free ;
  end;

end;


procedure TdtmCAD_Fazendas.LoadLogo ( AFileName : string ) ;
var
 Stream : TStream ;
 graphic : TGraphic ;
 FileName : string ;
begin
  Graphic := nil ;
  Stream := TFileStream.Create ( AFileName, fmOpenRead + fmShareDenyWrite ) ;
  try
    graphic := TGraphicSuppl.GetGraphic( Stream ) ;
    if not Assigned ( Graphic ) then
       raise Warning.Create('Tipo de imagem não suportado pelo sistema' );

    Stream.Free ;
    Stream := TMemoryStream.create ;
    GetLogo ( graphic, 95, 70, Stream ) ;

    if not ( cdsFazenda.State in [ dsInsert, dsEdit ] ) then
       cdsFazenda.Edit ;

    cdsFazendaLOGO.loadFromStream( Stream );
    ApplyUpdates ;
    TCLAg5NSMsgSysDomainImageChanged.CreateAndDispatch ( self ) ;
  finally
    if Assigned ( graphic ) then
      graphic.free ;
    Stream.Free ;
  end ;
end;

procedure TdtmCAD_Fazendas.cdsFazendaNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.CopyKeysFromMaster ;
//  cdsEntidade.Append ;
end;


procedure TdtmCAD_Fazendas.cdsEntidadeNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEntidadeKCAD_ENTIDADE.Value := cdsFazendaKCAD_FAZENDA.Value ;
  cdsEntidadeKCAD_FAZENDA.Value  := cdsFazendaKCAD_FAZENDA.Value ; //LoggedUser.DomainID ;
  cdsEntidadePESSOA.asString := 'J' ;
  cdsEntidadeIS_CLIENTE.asString := 'F' ;
end;

procedure TdtmCAD_Fazendas.cdsEntidadeNOMEValidate(Sender: TField);
begin
  inherited;
  cdsEntidadeAPELIDO.asString := cdsEntidadeNOME.asString ;
end;

function RemoveCharMask(const s: string): string;
begin

   Result := s;
   Result := StringReplace(Result, '.', '', [rfReplaceAll]);
   Result := StringReplace(Result, '/', '', [rfReplaceAll]);
   Result := StringReplace(Result, '-', '', [rfReplaceAll]);
   Result := StringReplace(Result, ' ', '', [rfReplaceAll]);

end;

procedure TdtmCAD_Fazendas.cdsEntidadePESSOAChange(Sender: TField);
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
end ;

procedure TdtmCAD_Fazendas.cdsEntidadeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
//  if ( cdsFazenda.Bof and cdsFazenda.EOF ) and cdsFazenda.State  then
  if ( cdsFazenda.IsEmpty ) then
     cdsFazenda.Append ;
end;


procedure TdtmCAD_Fazendas.cdsEntidadeCPF_CNPJValidate(Sender: TField);
begin
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

(*
  if cdsEntidadePESSOA.asString = 'F' then
   begin
     if TSQLSuppl.CheckExistsIn( 'CAD_ENTIDADES',
                                 'CPF_CNPJ;IS_FORNECEDOR', VarArrayOf ( [ Copy ( Sender.AsString, 1, 14 ), 'T' ] ),
                                 Format ( 'KCAD_ENTIDADE <> %s AND SYS$DELETED = ''F'' ', [ QuotedStr ( cdsEntidadeKCAD_ENTIDADE.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'ENTIDADES' ].Connection ) ) then
        Raise Warning.CreateFmt( _CPF_JACADASTRADO, [ Copy ( Sender.AsString, 1 ,14 ) ] )
   end
  else
    begin
     if TSQLSuppl.CheckExistsIn( 'CAD_ENTIDADES',
                                 'CPF_CNPJ;IS_FORNECEDOR', VarArrayOf ( [ Sender.AsString, 'T' ] ),
                                 Format ( 'KCAD_ENTIDADE <> %s  AND SYS$DELETED = ''F''', [ QuotedStr ( cdsEntidadeKCAD_ENTIDADE.asString ) ] ),
                                 TSQLConnection ( DBResources[ 'ENTIDADES' ].Connection ) ) then
        Raise Warning.CreateFmt( _CNPJ_JACADASTRADO, [ Sender.AsString ] ) ;

    end;
*)
end;

procedure TdtmCAD_Fazendas.ApplyUpdates;
begin
//  if ( not ( cdsFazenda.bof and cdsFazenda.eof ) ) then
  if ( not ( cdsFazenda.IsEmpty ) ) then
   begin
      if Trim ( cdsEntidadeNOME.asString ) = '' then
         raise Warning.Create('Nome da fazenda deve ser preenchido') ;
   end;
  inherited;

  LoggedUser.DomainName := cdsEntidadeNOME.asString ;
  TCLAg5NSMsgSysDomainChanged.CreateAndDispatch( self ) ;
end;

procedure TdtmCAD_Fazendas.cdsEnderecoBeforeInsert(DataSet: TDataSet);
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

procedure TdtmCAD_Fazendas.cdsEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsEnderecoKGLB_ENDERECO.Value := cdsEntidadeKENDERECO.Value ;
  cdsEnderecoTABLENAME.asString  := 'CAD_ENTIDADES' ;
  cdsEnderecoTABLEKEY.Value      := cdsEntidadeKENDERECO.Value ;
end;

procedure TdtmCAD_Fazendas.cdsFazendaEMAIL1Validate(Sender: TField);
begin
  if not TValidates.ValidaEMail( Sender.AsString ) then
    raise Warning.Create('Email inválido - Ex: nome@dominio.com.br');
end;

procedure TdtmCAD_Fazendas.cdsFazendaEMAIL2Validate(Sender: TField);
begin
  if not TValidates.ValidaEMail( Sender.AsString ) then
    raise Warning.Create('Email inválido - Ex: nome@dominio.com.br');
end;


end.
