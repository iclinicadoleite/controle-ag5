unit UZoo_AutomacaoExamesDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, Dialogs ;

type
  TZoo_AutomacaoExamesDatamodule = class(T_dtmBASE)
    cdsProtocolos: TClientDataSet;
    dspProtocolos: TDataSetProvider;
    sqlProtocolos: TTcSQLDataSet;
    sqlProtocolosKZOO_RESULTADO_PROTOCOLO: TStringField;
    sqlProtocolosKZOO_TAREFA_RESULTADO: TStringField;
    sqlProtocolosKZOO_PROTOCOLO: TStringField;
    sqlProtocolosNOME: TStringField;
    sqlProtocolosATIVO: TStringField;
    sqlProtocolosINICIAR: TStringField;
    cdsProtocolosKZOO_RESULTADO_PROTOCOLO: TStringField;
    cdsProtocolosKZOO_TAREFA_RESULTADO: TStringField;
    cdsProtocolosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosNOME: TStringField;
    cdsProtocolosATIVO: TStringField;
    cdsProtocolosINICIAR: TStringField;
    cdsLstResultados: TClientDataSet;
    cdsLstResultadosNOME: TStringField;
    dspLstResultados: TDataSetProvider;
    sqlLstResultados: TTcSQLDataSet;
    sqlLstResultadosNOME: TStringField;
    dtsLstResultados: TDataSource;
    cdsListaExames: TClientDataSet;
    cdsListaExamesEXAME: TStringField;
    dtsListaExames: TDataSource;
    sqlLstResultadosKZOO_TAREFA_RESULTADO: TStringField;
    cdsLstResultadosKZOO_TAREFA_RESULTADO: TStringField;
    dspListaExames: TDataSetProvider;
    sqlListaExames: TTcSQLDataSet;
    sqlListaExamesKZOO_TAREFA: TStringField;
    sqlListaExamesEXAME: TStringField;
    cdsListaExamesKZOO_TAREFA: TStringField;
    procedure dspProtocolosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dtsListaExamesDataChange(Sender: TObject; Field: TField);
    procedure dtsLstResultadosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApplyUpdates ; override ;
    procedure OpenTables ; override ;
    procedure GetProtocols ;
  end;


implementation

uses Tc.DBRTL.AbstractDB, UDBZootecnico, Exceptions, CLAg5Types,
   Tc.VCL.Application,
   CDSSuppl ;

{$R *.dfm}

procedure TZoo_AutomacaoExamesDatamodule.ApplyUpdates;
begin
   TCDSSuppl.ApplyUpdates( cdsProtocolos ) ;
   GetProtocols ;
end;

procedure TZoo_AutomacaoExamesDatamodule.dspProtocolosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  msg : String ;
begin

  try
  if DeltaDS.FieldByName( 'KZOO_TAREFA_RESULTADO' ).OldValue = Null then
    begin
      msg := 'add' ;

      // ShowMessage( 'add' )
     sqlProtocolos.SQLConnection.ExecuteDirect(
       format ( 'INSERT INTO ZOO_RESULTADO_PROTOCOLOS ( KZOO_RESULTADO_PROTOCOLO, KZOO_TAREFA_RESULTADO, KZOO_PROTOCOLO, INICIAR ) VALUES ( Guid20(), %s, %s, %s )',
                [ QuotedStr( DeltaDS.FieldByName( 'KZOO_TAREFA_RESULTADO' ).asString ) ,
                  QuotedStr( DeltaDS.FieldByName( 'KZOO_PROTOCOLO' ).OldValue ),
                  QuotedStr( DeltaDS.FieldByName( 'INICIAR' ).asString )
                ]
              ) )
    end
  else
    begin
      msg := 'add' ;
     sqlProtocolos.SQLConnection.ExecuteDirect(
       format ( 'DELETE FROM ZOO_RESULTADO_PROTOCOLOS WHERE (KZOO_RESULTADO_PROTOCOLO = %s)',
                [ QuotedStr( DeltaDS.FieldByName( 'KZOO_RESULTADO_PROTOCOLO' ).OldValue ) ]
              )  ) ;
    end;
  Applied := True ;
  except On E : Exception do
     raiseException ( E, UnitName, ClassName, 'dspProtocolosBeforeUpdateRecord', msg );

  end;

end;

procedure TZoo_AutomacaoExamesDatamodule.dtsListaExamesDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned ( Field ) then
     exit ;

  cdsLstResultados.Close ;
  cdsProtocolos.Close;
  cdsLstResultados.Params.ParamByName( 'KZOO_TAREFA' ).asString := cdsListaExamesKZOO_TAREFA.asString ;
  TCDSSuppl.Open (  cdsLstResultados ) ;
end;

procedure TZoo_AutomacaoExamesDatamodule.dtsLstResultadosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned ( Field ) then
     exit ;

  if cdsLstResultadosKZOO_TAREFA_RESULTADO.asString = '' then
    exit ;

  GetProtocols ;
end;

procedure TZoo_AutomacaoExamesDatamodule.GetProtocols;
begin
  cdsProtocolos.DisableControls ;
  if cdsProtocolos.Active then
    begin
     TCDSSuppl.ApplyUpdates( cdsProtocolos ) ;
     cdsProtocolos.Close ;
    end ;
  cdsProtocolos.Params.ParamByName( 'KCAD_FAZENDA' ).AsString     := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ; // LoggedUser.DomainID ;
  cdsProtocolos.Params.ParamByName( 'KZOO_TAREFA_RESULTADO' ).AsString := cdsLstResultadosKZOO_TAREFA_RESULTADO.asString ;
  TCDSSuppl.Open ( cdsProtocolos )  ;
  cdsProtocolos.EnableControls ;
end;

procedure TZoo_AutomacaoExamesDatamodule.OpenTables;
begin
  dtsListaExames.OnDataChange := nil  ;
  cdsListaExames.Params.ParamByName( 'KCAD_FAZENDA' ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  cdsListaExames.Params.ParamByName( 'TIPO_EXAME' ).asInteger := -1 ; //_ST_TIPO_TAREFA_EXAME ;
  cdsListaExames.Open ;
  dtsListaExames.OnDataChange := dtsListaExamesDataChange  ;
end;


end.
