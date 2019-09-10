unit UZoo_ImportarSISBOVDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, SMIBase, SMI2Cell, SMI2XLS ;

type
  TZoo_ImportarSISBOVDatamodule = class(T_dtmBASE)
    cdsFazenda: TClientDataSet;
    dspFazenda: TDataSetProvider;
    sqlFazenda: TTcSQLDataSet;
    cdsSISBOV: TClientDataSet;
    sqlFazendaCERTIFICADORA: TStringField;
    sqlFazendaNOME: TStringField;
    sqlFazendaKCAD_FAZENDA: TStringField;
    cdsFazendaKCAD_FAZENDA: TStringField;
    cdsFazendaCERTIFICADORA: TStringField;
    cdsFazendaNOME: TStringField;
    cdsCertificadoras: TClientDataSet;
    cdsCertificadorasTIPO: TStringField;
    cdsCertificadorasVALOR: TStringField;
    cdsCertificadorasDESCRICAO: TStringField;
    cdsCertificadorasORDEM: TIntegerField;
    cdsFazendaNOMECERTIFICADORA: TStringField;
    cdsSISBOVCODFAZENDA: TStringField;
    cdsSISBOVCODCERTFICADORA: TStringField;
    cdsSISBOVBRINCOAGENDA: TStringField;
    cdsSISBOVNUMERO_SISBOV: TStringField;
    SMImportFromXLS1: TSMImportFromXLS;
    cdsSISBOVEXISTS: TStringField;
    cdsSISBOVKZOO_ANIMAL: TStringField;
    procedure cdsFazendaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure GetKeyFromBrinco ;
    procedure UpdateRegistro ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure OpenXLS ( AXLS : string ) ;
    procedure ExecuteImport ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBEntidades, UDBZootecnico, Exceptions, CLAg5Types,
  Tc.VCL.Application ;

{$R *.dfm}

procedure TZoo_ImportarSISBOVDatamodule.ExecuteImport;
begin
   self.ApplyUpdates ;
   cdsSISBOV.DisableControls ;
   with cdsSISBOV do
     begin
       First ;
       while not eof do
         begin
            if cdsSISBOVEXISTS.asString = 'T' then
               UpdateRegistro ;
            next ;
         end;
       First ;
     end ;
   cdsSISBOV.EnableControls ;
end;

procedure TZoo_ImportarSISBOVDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_CERTIFICADORAS, cdsCertificadoras );
  inherited ;
end;

procedure TZoo_ImportarSISBOVDatamodule.GetKeyFromBrinco ;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin
 try
   if(length(cdsSISBOVBRINCOAGENDA.asString) > 15) then
   begin
     cdsSISBOV.Edit ;
     cdsSISBOVEXISTS.asString := 'F';
   end
   else
     begin
     sql :='A.KZOO_ANIMAL'
       +#13#10'FROM ZOO_ANIMAIS A'
       +#13#10'WHERE ( A.KCAD_FAZENDA = :KCAD_FAZENDA ) AND ( A.BRINCO = :BRINCO )' ;

     p := TParams.Create ;
     p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).asString :=  Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
     p.CreateParam( ftString, 'BRINCO',       ptInput).asString := cdsSISBOVBRINCOAGENDA.asString ;

     cds := nil ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cds,  sql, p );
     cdsSISBOV.Edit ;
     cdsSISBOVKZOO_ANIMAL.asString := cds.FieldByName( 'KZOO_ANIMAL' ).asString ;
     if Trim ( cdsSISBOVKZOO_ANIMAL.asString ) = '' then
        cdsSISBOVEXISTS.asString := 'F'
     else
        cdsSISBOVEXISTS.asString := 'T' ;
   end;

   cdsSISBOV.Post ;
 finally
   cds.free ;
   p.free ;
 end;
end;


procedure TZoo_ImportarSISBOVDatamodule.OpenXLS(AXLS: string);
begin

   TCDSSuppl.CreateDataSet( cdsSISBOV ) ;
   SMImportFromXLS1.SourceFileName := AXLS ;
   SMImportFromXLS1.Execute ;

   cdsSISBOV.DisableControls ;
   with cdsSISBOV do
     begin
        first ;
        while not eof do
           begin
             GetKeyFromBrinco ;
             next ;
           end;
        first ;
     end;
   cdsSISBOV.EnableControls ;
end;

procedure TZoo_ImportarSISBOVDatamodule.UpdateRegistro;
var
  p : TParams ;
  sql : string ;
  cds : TClientDataSet ;
begin

  sql :='UPDATE ZOO_ANIMAIS SET SISBOV = :SISBOV'
     +#13#10'WHERE ( KZOO_ANIMAL = :KZOO_ANIMAL )' ;

   try
     p := TParams.Create ;
     p.CreateParam( ftString, 'SISBOV', ptInput ).asString := cdsSISBOVNUMERO_SISBOV.asString ;
     p.CreateParam( ftString, 'KZOO_ANIMAL', ptInput ).asString := cdsSISBOVKZOO_ANIMAL.asString ;
     TTcAbstractDB.GetByAlias('ZOOTECNICO').Execute( sql, p );
   finally
     p.Free ;
   end;
end;

procedure TZoo_ImportarSISBOVDatamodule.cdsFazendaBeforeOpen(DataSet: TDataSet);
begin
  cdsFazenda.Params.ParamByName('KCAD_FAZENDA').AsString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
end;

end.
