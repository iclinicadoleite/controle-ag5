unit UdtmSelectUsuariosFazenda;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, UDBEntidades ;

type
  TdtmSelectUsuariosFazenda = class(T_dtmBASE)
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    sqlUsuarios: TTcSQLDataSet;
    sqlUsuariosKCAD_FAZENDA: TStringField;
    sqlUsuariosKSYSUSER: TStringField;
    sqlUsuariosLOGIN: TStringField;
    cdsUsuariosKCAD_FAZENDA: TStringField;
    cdsUsuariosKSYSUSER: TStringField;
    cdsUsuariosLOGIN: TStringField;
    sqlUsuariosNOME: TStringField;
    cdsUsuariosNOME: TStringField;
    procedure cdsUsuariosNewRecord(DataSet: TDataSet);
    procedure dspUsuariosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    procedure SetKeyFazenda(const Value: string );
    { Private declarations }
  public
    { Public declarations }
    property KeyFazenda : string  write SetKeyFazenda;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}




{ TrdmdtmSelectUsuariosFazenda }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmSelectUsuariosFazenda.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('ENTIDADES').Connection ) ;
end;
{$ENDIF}


procedure TdtmSelectUsuariosFazenda.cdsUsuariosNewRecord(DataSet: TDataSet);
begin
  cdsUsuariosKCAD_FAZENDA.Value := cdsUsuarios.Params.ParamByName('KCAD_FAZENDA').Value ;
end;


procedure TdtmSelectUsuariosFazenda.SetKeyFazenda(const Value: string);
begin
  cdsUsuarios.Params.ParamByName('KCAD_FAZENDA').asString := Value ;
end;

procedure TdtmSelectUsuariosFazenda.dspUsuariosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin

  if DeltaDS.FieldByName( 'KCAD_FAZENDA' ).OldValue = Null then
     // ShowMessage( 'add' )
     sqlUsuarios.SQLConnection.ExecuteDirect(
       format ( 'INSERT INTO CAD_USUARIOS_FAZENDA ( KSYS$USER, KCAD_FAZENDA ) VALUES ( %s, %s )',
                [ QuotedStr( DeltaDS.FieldByName( 'KSYSUSER' ).OldValue ) ,
                  QuotedStr( DeltaDS.FieldByName( 'KCAD_FAZENDA' ).asString )
                ]
              ) )
  else
     sqlUsuarios.SQLConnection.ExecuteDirect(
       format ( 'DELETE FROM CAD_USUARIOS_FAZENDA WHERE (KSYS$USER = %s) AND (KCAD_FAZENDA =%s)',
                [ QuotedStr( DeltaDS.FieldByName( 'KSYSUSER' ).OldValue ),
                  QuotedStr( DeltaDS.FieldByName( 'KCAD_FAZENDA' ).OldValue )
                ]
              )  ) ;
  Applied := True ;

end;


end.


