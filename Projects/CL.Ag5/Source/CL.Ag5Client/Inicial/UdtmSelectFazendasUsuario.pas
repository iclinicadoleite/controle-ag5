unit UdtmSelectFazendasUsuario;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, UDBEntidades ;

type
  TdtmSelectFazendasUsuario = class(T_dtmBASE)
    cdsFazendas: TClientDataSet;
    dspFazendas: TDataSetProvider;
    sqlFazendas: TTcSQLDataSet;
    sqlFazendasKCAD_FAZENDA: TStringField;
    sqlFazendasKSYSUSER: TStringField;
    sqlFazendasAPELIDO: TStringField;
    cdsFazendasKCAD_FAZENDA: TStringField;
    cdsFazendasKSYSUSER: TStringField;
    cdsFazendasAPELIDO: TStringField;
    procedure cdsFazendasNewRecord(DataSet: TDataSet);
    procedure dspFazendasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    procedure SetKeyUser(const Value: string );
    { Private declarations }
  public
    { Public declarations }
    property KeyUser : string  write SetKeyUser;
    constructor Create ( AOwner : TComponent ) ;override ;
  end;

implementation

uses Exceptions
     , Tc.DBRTL.AbstractDB
     , DataSnap.DSConnect
      ;

{$R *.dfm}
{ TrdmdtmSelectFazendasUsuario }

{$IFDEF _DSServer}
{$ELSE}

constructor TdtmSelectFazendasUsuario.Create(AOwner: TComponent);
var
  I : integer ;
  LSQLConnection : TSQLConnection ;
  LDSProviderConnection : TDSProviderConnection ;
begin
  inherited;
  LSQLConnection := TSQLConnection( TTcAbstractDB.GetByAlias('ENTIDADES').Connection ) ;
end;
{$ENDIF}



procedure TdtmSelectFazendasUsuario.cdsFazendasNewRecord(DataSet: TDataSet);
begin
  cdsFazendasKCAD_FAZENDA.Value := cdsFazendas.Params.ParamByName('KSYSUSER').Value ;
end;


procedure TdtmSelectFazendasUsuario.SetKeyUser(const Value: string);
begin
  cdsFazendas.Params.ParamByName('KSYSUSER').asString := Value ;
end;

procedure TdtmSelectFazendasUsuario.dspFazendasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin

  if DeltaDS.FieldByName( 'KSYSUSER' ).OldValue = Null then
     // ShowMessage( 'add' )
     sqlFazendas.SQLConnection.ExecuteDirect(
       format ( 'INSERT INTO CAD_USUARIOS_FAZENDA ( KSYS$USER, KCAD_FAZENDA ) VALUES ( %s, %s )',
                [ QuotedStr( DeltaDS.FieldByName( 'KSYSUSER' ).asString ) ,
                  QuotedStr( DeltaDS.FieldByName( 'KCAD_FAZENDA' ).OldValue )
                ]
              ) )
  else
     sqlFazendas.SQLConnection.ExecuteDirect(
       format ( 'DELETE FROM CAD_USUARIOS_FAZENDA WHERE (KSYS$USER = %s) AND (KCAD_FAZENDA =%s)',
                [ QuotedStr( DeltaDS.FieldByName( 'KSYSUSER' ).OldValue ),
                  QuotedStr( DeltaDS.FieldByName( 'KCAD_FAZENDA' ).OldValue )
                ]
              )  ) ;
  Applied := True ;

end;


end.


