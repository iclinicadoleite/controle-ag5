unit UZoo_CfgCategoriasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_CfgCategoriasDatamodule = class(T_dtmBASE)
    cdsCategorias: TClientDataSet;
    dspCategorias: TDataSetProvider;
    sqlCategorias: TTcSQLDataSet;
    sqlCategoriasKZOO_CFGCATEGORIA: TStringField;
    sqlCategoriasKCAD_FAZENDA: TStringField;
    sqlCategoriasDESCRICAO: TStringField;
    sqlCategoriasSTATUS: TIntegerField;
    sqlCategoriasIDADE_INFERIOR: TIntegerField;
    sqlCategoriasIDADE_SUPERIOR: TIntegerField;
    sqlCategoriasDEL_INFERIOR: TIntegerField;
    sqlCategoriasDEL_SUPERIOR: TIntegerField;
    sqlCategoriasNL_INFERIOR: TIntegerField;
    sqlCategoriasATIVO: TStringField;
    sqlCategoriasINTERNAL: TStringField;
    cdsCategoriasKZOO_CFGCATEGORIA: TStringField;
    cdsCategoriasKCAD_FAZENDA: TStringField;
    cdsCategoriasDESCRICAO: TStringField;
    cdsCategoriasSTATUS: TIntegerField;
    cdsCategoriasIDADE_INFERIOR: TIntegerField;
    cdsCategoriasIDADE_SUPERIOR: TIntegerField;
    cdsCategoriasDEL_INFERIOR: TIntegerField;
    cdsCategoriasDEL_SUPERIOR: TIntegerField;
    cdsCategoriasNL_INFERIOR: TIntegerField;
    cdsCategoriasATIVO: TStringField;
    cdsCategoriasINTERNAL: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsCategoriasDESCR_STATUS: TStringField;
    sqlCategoriasVALOR: TFloatField;
    cdsCategoriasVALOR: TFloatField;
    sqlCategoriasNL_SUPERIOR: TIntegerField;
    cdsCategoriasNL_SUPERIOR: TIntegerField;
    procedure cdsCategoriasNewRecord(DataSet: TDataSet);
    procedure cdsCategoriasBeforeOpen(DataSet: TDataSet);
    procedure cdsCategoriasNL_INFERIORGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCategoriasBeforePost(DataSet: TDataSet);
    procedure dspCategoriasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsCategoriasNL_SUPERIORGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure SetParams ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
  end;

implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CLAg5Types;

{$R *.dfm}

procedure TZoo_CfgCategoriasDatamodule.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_SIGLA_CATEGORIA_FEMEA, cdsStatusAnimal );
  inherited;
  //
end;


procedure TZoo_CfgCategoriasDatamodule.cdsCategoriasBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ( cdsCategoriasDESCR_STATUS.IsNull) then
    raise Warning.Create('Status do animal deve ser preenchido' ) ;

  if (    ( cdsCategoriasSTATUS.AsInteger = _ST_SIGLA_CATEGORIA_FEMEA_VL )
       OR ( cdsCategoriasSTATUS.AsInteger = _ST_SIGLA_CATEGORIA_FEMEA_VS ))
  and ( cdsCategoriasNL_INFERIOR.asInteger < 1 ) then
     raise Warning.Create('NL inferior deve ser maior que zero' ) ;

  if (    ( cdsCategoriasSTATUS.AsInteger = _ST_SIGLA_CATEGORIA_FEMEA_VL )
       OR ( cdsCategoriasSTATUS.AsInteger = _ST_SIGLA_CATEGORIA_FEMEA_VS ))
  and ( cdsCategoriasNL_SUPERIOR.asInteger < 1 ) then
     raise Warning.Create('NL superior deve ser maior que zero' ) ;

  if ( cdsCategoriasIDADE_INFERIOR.AsInteger > cdsCategoriasIDADE_SUPERIOR.AsInteger ) then
     raise Warning.Create('Idade inferior não pode ser maior que a idade superior' ) ;
  if ( cdsCategoriasIDADE_INFERIOR.AsInteger = cdsCategoriasIDADE_SUPERIOR.AsInteger ) then
     raise Warning.Create('Idade inferior não pode ser igual a idade superior' ) ;
end;

procedure TZoo_CfgCategoriasDatamodule.cdsCategoriasNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
  cdsCategoriasKCAD_FAZENDA.asString := LoggedUser.DomainID ;
  cdsCategoriasIDADE_INFERIOR.asInteger := 0 ;
  cdsCategoriasIDADE_SUPERIOR.asInteger := 0 ;
  cdsCategoriasSTATUS.asInteger := 1 ;
  cdsCategoriasDEL_INFERIOR.asInteger := 0 ;
  cdsCategoriasDEL_SUPERIOR.asInteger := 0 ;
  cdsCategoriasNL_INFERIOR.asInteger := 0 ;
  cdsCategoriasNL_SUPERIOR.asInteger := 0 ;
  cdsCategoriasATIVO.AsString := 'T' ;
  cdsCategoriasINTERNAL.AsString := 'F' ;
end;


procedure TZoo_CfgCategoriasDatamodule.cdsCategoriasNL_INFERIORGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if ( DisplayText )
  and (( cdsCategoriasNL_INFERIOR.AsInteger = 0 ) or
     (     ( cdsCategoriasSTATUS.AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VL )
       and ( cdsCategoriasSTATUS.AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VS ) )) then
     Text := ''
  else
     Text := cdsCategoriasNL_INFERIOR.AsString ;
end;

procedure TZoo_CfgCategoriasDatamodule.cdsCategoriasNL_SUPERIORGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if ( DisplayText )
  and (( cdsCategoriasNL_SUPERIOR.AsInteger = 0 ) or
  (     ( cdsCategoriasSTATUS.AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VL )
    and ( cdsCategoriasSTATUS.AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VS )) ) then
     Text := ''
  else
     Text := cdsCategoriasNL_SUPERIOR.AsString ;
end;

procedure TZoo_CfgCategoriasDatamodule.dspCategoriasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  LValue : variant ;
begin

  if ( UpdateKind = ukInsert ) then
    begin
      if   ( DeltaDS.FieldByName ( 'STATUS' ).AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VL )
        and ( DeltaDS.FieldByName ( 'STATUS' ).AsInteger <> _ST_SIGLA_CATEGORIA_FEMEA_VS ) then
      begin
         DeltaDS.FieldByName ( 'NL_INFERIOR' ).NewValue := 0 ;
         DeltaDS.FieldByName ( 'NL_SUPERIOR' ).NewValue := 0 ;
      end;
    end

  else if ( UpdateKind = ukModify ) then
    begin
      if ( DeltaDS.FieldByName ( 'STATUS' ).NewValue = Unassigned ) then
          LValue := DeltaDS.FieldByName ( 'STATUS' ).OldValue
      else
          LValue := DeltaDS.FieldByName ( 'STATUS' ).NewValue ;

      if   ( LValue = NULL  )
        or (        ( LValue <> Unassigned )
            and not (   ( LValue = _ST_SIGLA_CATEGORIA_FEMEA_VL )
                     or ( LValue = _ST_SIGLA_CATEGORIA_FEMEA_VS  )
                 )
           ) then
      begin
         DeltaDS.FieldByName ( 'NL_INFERIOR' ).NewValue := 0 ;
         DeltaDS.FieldByName ( 'NL_SUPERIOR' ).NewValue := 0 ;
      end;
    end;
end;

procedure TZoo_CfgCategoriasDatamodule.cdsCategoriasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParams ;
end;

procedure TZoo_CfgCategoriasDatamodule.SetParams;
begin
  with cdsCategorias.Params do
    begin
       ParamByName ( 'KCAD_FAZENDA' ).asString := LoggedUser.DomainID ;
    end ;
end;

end.
