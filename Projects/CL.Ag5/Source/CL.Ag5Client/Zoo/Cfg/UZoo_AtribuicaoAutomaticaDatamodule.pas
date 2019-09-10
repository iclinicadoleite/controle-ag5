unit UZoo_AtribuicaoAutomaticaDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, Dialogs ;

type
  TZoo_AtribuicaoAutomaticaDatamodule = class(T_dtmBASE)
    cdsProtocolos: TClientDataSet;
    dspProtocolos: TDataSetProvider;
    sqlProtocolos: TTcSQLDataSet;
    sqlProtocolosKZOO_DIAGNOSTICO_PROTOCOLO: TStringField;
    sqlProtocolosKZOO_DIAGNOSTICO: TStringField;
    sqlProtocolosKZOO_PROTOCOLO: TStringField;
    sqlProtocolosNOME: TStringField;
    sqlProtocolosATIVO: TStringField;
    sqlProtocolosINICIAR: TStringField;
    cdsProtocolosKZOO_DIAGNOSTICO_PROTOCOLO: TStringField;
    cdsProtocolosKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosNOME: TStringField;
    cdsProtocolosATIVO: TStringField;
    cdsProtocolosINICIAR: TStringField;
    cdsTiposDiagnostico: TClientDataSet;
    cdsTiposDiagnosticoTIPO: TStringField;
    cdsTiposDiagnosticoVALOR: TStringField;
    cdsTiposDiagnosticoDESCRICAO: TStringField;
    cdsTiposDiagnosticoORDEM: TIntegerField;
    cdsTiposEvento: TClientDataSet;
    cdsTiposEventoTIPO: TStringField;
    cdsTiposEventoVALOR: TStringField;
    cdsTiposEventoDESCRICAO: TStringField;
    cdsTiposEventoORDEM: TIntegerField;
    cdsLstDiagnosticos: TClientDataSet;
    cdsLstDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    cdsLstDiagnosticosCODIGO: TStringField;
    cdsLstDiagnosticosNOME: TStringField;
    dspLstDiagnosticos: TDataSetProvider;
    sqlLstDiagnosticos: TTcSQLDataSet;
    sqlLstDiagnosticosKZOO_DIAGNOSTICO: TStringField;
    sqlLstDiagnosticosCODIGO: TStringField;
    sqlLstDiagnosticosNOME: TStringField;
    dtsLstDiagnosticos: TDataSource;
    cdsListaEventos: TClientDataSet;
    cdsListaEventosDESCRICAO: TStringField;
    dtsListaEventos: TDataSource;
    cdsListaEventosTIPODIAGNOSTICO: TIntegerField;
    cdsListaEventosTIPOEVENTO: TIntegerField;
    sqlLstDiagnosticosKCAD_FAZENDA: TStringField;
    cdsLstDiagnosticosKCAD_FAZENDA: TStringField;
    procedure dspProtocolosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dtsListaEventosDataChange(Sender: TObject; Field: TField);
    procedure dtsLstDiagnosticosDataChange(Sender: TObject; Field: TField);
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
  Tc.VCL.Application, CDSSuppl ;

{$R *.dfm}

procedure TZoo_AtribuicaoAutomaticaDatamodule.ApplyUpdates;
begin
   TCDSSuppl.ApplyUpdates( cdsProtocolos ) ;
   GetProtocols ;
end;

procedure TZoo_AtribuicaoAutomaticaDatamodule.dspProtocolosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  msg : String ;
begin

  try
  if DeltaDS.FieldByName( 'KZOO_DIAGNOSTICO' ).OldValue = Null then
    begin
      msg := 'add' ;

      // ShowMessage( 'add' )
     sqlProtocolos.SQLConnection.ExecuteDirect(
       format ( 'INSERT INTO ZOO_DIAGNOSTICO_PROTOCOLOS ( KZOO_DIAGNOSTICO_PROTOCOLO, KZOO_DIAGNOSTICO, KZOO_PROTOCOLO, INICIAR ) VALUES ( Guid20(), %s, %s, %s )',
                [ QuotedStr( DeltaDS.FieldByName( 'KZOO_DIAGNOSTICO' ).asString ) ,
                  QuotedStr( DeltaDS.FieldByName( 'KZOO_PROTOCOLO' ).OldValue ),
                  QuotedStr( DeltaDS.FieldByName( 'INICIAR' ).asString )
                ]
              ) )
    end
  else
    begin
      msg := 'add' ;
     sqlProtocolos.SQLConnection.ExecuteDirect(
       format ( 'DELETE FROM ZOO_DIAGNOSTICO_PROTOCOLOS WHERE (KZOO_DIAGNOSTICO_PROTOCOLO = %s)',
                [ QuotedStr( DeltaDS.FieldByName( 'KZOO_DIAGNOSTICO_PROTOCOLO' ).OldValue ) ]
              )  ) ;
    end;
  Applied := True ;
  except On E : Exception do
     raiseException ( E, UnitName, ClassName, 'dspProtocolosBeforeUpdateRecord', msg );

  end;

end;

procedure TZoo_AtribuicaoAutomaticaDatamodule.dtsListaEventosDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned ( Field ) then
     exit ;

  cdsLstDiagnosticos.Close ;

  cdsLstDiagnosticos.Params.ParamByName( 'KCAD_FAZENDA' ).asString := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ;
  cdsLstDiagnosticos.Params.ParamByName( 'TD' ).Clear ;
  cdsLstDiagnosticos.Params.ParamByName( 'TE' ).Clear ;
  cdsLstDiagnosticos.Params.ParamByName( 'TD' ).Bound := False ;
  cdsLstDiagnosticos.Params.ParamByName( 'TE' ).Bound := False ;

  if not cdsListaEventosTIPODIAGNOSTICO.IsNull then
    begin
      cdsLstDiagnosticos.Params.ParamByName( 'TD' ).asString := 'D' ;
      cdsLstDiagnosticos.Params.ParamByName( 'TIPODIAGNOSTICO' ).asInteger := cdsListaEventosTIPODIAGNOSTICO.AsInteger ;
    end;

  if not cdsListaEventosTIPOEVENTO.IsNull then
    begin
     cdsLstDiagnosticos.Params.ParamByName( 'TE' ).asString := 'E' ;
     cdsLstDiagnosticos.Params.ParamByName( 'TIPOEVENTO' ).asInteger := cdsListaEventosTIPOEVENTO.AsInteger ;
    end;
  TCDSSuppl.Open (  cdsLstDiagnosticos ) ;
end;

procedure TZoo_AtribuicaoAutomaticaDatamodule.dtsLstDiagnosticosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned ( Field ) then
     exit ;

  if cdsLstDiagnosticosKZOO_DIAGNOSTICO.asString = '' then
    exit ;

  GetProtocols ;
end;

procedure TZoo_AtribuicaoAutomaticaDatamodule.GetProtocols;
begin
  cdsProtocolos.DisableControls ;
  if cdsProtocolos.Active then
    begin
     TCDSSuppl.ApplyUpdates( cdsProtocolos ) ;
     cdsProtocolos.Close ;
    end ;
  cdsProtocolos.Params.ParamByName( 'KCAD_FAZENDA' ).AsString     := Tc.VCL.Application.TTcApplication.Instance.LoggedUser.DomainID ; // LoggedUser.DomainID ;
  cdsProtocolos.Params.ParamByName( 'KZOO_DIAGNOSTICO' ).AsString := cdsLstDiagnosticosKZOO_DIAGNOSTICO.asString ;
  TCDSSuppl.Open ( cdsProtocolos )  ;
  cdsProtocolos.EnableControls ;
end;

procedure TZoo_AtribuicaoAutomaticaDatamodule.OpenTables;
begin
//  inherited;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_TIPO_DIAGNOSTICO, cdsTiposDiagnostico );
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes( _ST_AUTO_EVT,      cdsTiposEvento );

  dtsListaEventos.OnDataChange := nil  ;
  cdsListaEventos.CreateDataSet ;

  with cdsTiposDiagnostico do
    begin
       while not eof do
         begin
            if cdsTiposDiagnosticoVALOR.asInteger >= 0 then
              begin
                cdsListaEventos.Append ;
                cdsListaEventosDESCRICAO.AsString        := cdsTiposDiagnosticoDESCRICAO.AsString ;
                cdsListaEventosTIPODIAGNOSTICO.asInteger := cdsTiposDiagnosticoVALOR.AsInteger ;
                cdsListaEventos.Post ;
              end;
            next ;
         end;
    end;

  with cdsTiposEvento do
    begin
       while not eof do
         begin
            cdsListaEventos.Append ;
            cdsListaEventosDESCRICAO.AsString   := cdsTiposEventoDESCRICAO.AsString ;
            cdsListaEventosTIPOEVENTO.asInteger := cdsTiposEventoVALOR.AsInteger ;
            cdsListaEventos.Post ;
            next ;
         end;
    end;
  cdsListaEventos.First ;
  dtsListaEventos.OnDataChange := dtsListaEventosDataChange  ;
end;


end.
