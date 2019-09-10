unit UdtmZoo_InformacoesAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TdtmZoo_InformacoesAnimal = class(T_dtmBASE)
    cdsResumoAnimal: TClientDataSet;
    cdsResumoAnimalKZOO_ANIMAL: TStringField;
    cdsResumoAnimalBRINCO: TStringField;
    cdsResumoAnimalNOMEESTABULO: TStringField;
    cdsResumoAnimalNOMECOMPLETO: TStringField;
    cdsResumoAnimalREGISTRO: TStringField;
    cdsResumoAnimalNASCIMENTO: TSQLTimeStampField;
    cdsResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField;
    cdsResumoAnimalULTIMA_MONTA: TSQLTimeStampField;
    cdsResumoAnimalULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    cdsResumoAnimalULTIMO_CIO: TSQLTimeStampField;
    cdsResumoAnimalNUMERO_LACTACAO: TIntegerField;
    cdsResumoAnimalDPP: TIntegerField;
    cdsResumoAnimalNUMERO_MONTA: TIntegerField;
    cdsResumoAnimalNUMERO_CIO: TIntegerField;
    cdsResumoAnimalsqlResumoAnimalProximaTarefa: TDataSetField;
    cdsResumoAnimalsqlResumoAnimalUltimaTarefa: TDataSetField;
    dspResumoAnimal: TDataSetProvider;
    sqlResumoAnimal: TTcSQLDataSet;
    sqlResumoAnimalKZOO_ANIMAL: TStringField;
    sqlResumoAnimalBRINCO: TStringField;
    sqlResumoAnimalNOMEESTABULO: TStringField;
    sqlResumoAnimalNOMECOMPLETO: TStringField;
    sqlResumoAnimalREGISTRO: TStringField;
    sqlResumoAnimalNASCIMENTO: TSQLTimeStampField;
    sqlResumoAnimalULTIMA_LACTACAO: TSQLTimeStampField;
    sqlResumoAnimalULTIMA_MONTA: TSQLTimeStampField;
    sqlResumoAnimalULTIMA_PESAGEMLEITE: TSQLTimeStampField;
    sqlResumoAnimalULTIMO_CIO: TSQLTimeStampField;
    sqlResumoAnimalNUMERO_LACTACAO: TIntegerField;
    sqlResumoAnimalNUMERO_MONTA: TIntegerField;
    sqlResumoAnimalNUMERO_CIO: TIntegerField;
    cdsResumoAnimalUltimaTarefa: TClientDataSet;
    cdsResumoAnimalUltimaTarefaKZOO_ANIMAL_TAREFA: TStringField;
    cdsResumoAnimalUltimaTarefaDATATAREFA: TSQLTimeStampField;
    cdsResumoAnimalUltimaTarefaSTATUSTAREFA: TIntegerField;
    cdsResumoAnimalUltimaTarefaTAREFA: TStringField;
    sqlResumoAnimalUltimaTarefa: TTcSQLDataSet;
    sqlResumoAnimalUltimaTarefaKZOO_ANIMAL_TAREFA: TStringField;
    sqlResumoAnimalUltimaTarefaDATATAREFA: TSQLTimeStampField;
    sqlResumoAnimalUltimaTarefaSTATUSTAREFA: TIntegerField;
    sqlResumoAnimalUltimaTarefaTAREFA: TStringField;
    sqlResumoAnimalProximaTarefa: TTcSQLDataSet;
    sqlResumoAnimalProximaTarefaKZOO_ANIMAL_TAREFA: TStringField;
    sqlResumoAnimalProximaTarefaDATATAREFA: TSQLTimeStampField;
    sqlResumoAnimalProximaTarefaSTATUSTAREFA: TIntegerField;
    sqlResumoAnimalProximaTarefaTAREFA: TStringField;
    cdsResumoAnimalProximaTarefa: TClientDataSet;
    cdsResumoAnimalProximaTarefaKZOO_ANIMAL_TAREFA: TStringField;
    cdsResumoAnimalProximaTarefaDATATAREFA: TSQLTimeStampField;
    cdsResumoAnimalProximaTarefaSTATUSTAREFA: TIntegerField;
    cdsResumoAnimalProximaTarefaTAREFA: TStringField;
    dtsSQLResumoAnimal: TDataSource;
    sqlResumoAnimalLOTE: TStringField;
    cdsResumoAnimalLOTE: TStringField;
    cdsTipoDoadorReceptor: TClientDataSet;
    cdsTipoDoadorReceptorTIPO: TStringField;
    cdsTipoDoadorReceptorVALOR: TStringField;
    cdsTipoDoadorReceptorDESCRICAO: TStringField;
    cdsTipoDoadorReceptorORDEM: TIntegerField;
    cdsDadosFemeaDESCR_DOADOR_RECEPTOR: TStringField;
    sqlResumoAnimalDOADOR_RECEPTOR: TIntegerField;
    cdsResumoAnimalDOADOR_RECEPTOR: TIntegerField;
    cdsTipoRacasAnimais: TClientDataSet;
    cdsTipoRacasAnimaisTIPO: TStringField;
    cdsTipoRacasAnimaisVALOR: TStringField;
    cdsTipoRacasAnimaisDESCRICAO: TStringField;
    cdsTipoRacasAnimaisORDEM: TIntegerField;
    cdsResumoAnimalSISBOV: TStringField;
    sqlResumoAnimalSISBOV: TStringField;
    cdsStatusAnimal: TClientDataSet;
    cdsStatusAnimalTIPO: TStringField;
    cdsStatusAnimalVALOR: TStringField;
    cdsStatusAnimalDESCRICAO: TStringField;
    cdsStatusAnimalORDEM: TIntegerField;
    cdsAnimalSTATUS: TIntegerField;
    sqlResumoAnimalSTATUS: TIntegerField;
    cdsResumoAnimalDESCR_STATUS: TStringField;
    sqlResumoAnimalPRENHEZ: TStringField;
    cdsResumoAnimalPRENHEZ: TStringField;
    cdsResumoAnimalDESC_PRENHEZ: TStringField;
    sqlResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField;
    sqlResumoAnimalKULTIMA_MONTA: TStringField;
    sqlResumoAnimalKULTIMO_PARTO: TStringField;
    cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO: TStringField;
    cdsResumoAnimalKULTIMA_MONTA: TStringField;
    cdsResumoAnimalKULTIMO_PARTO: TStringField;
    cdsResumoAnimalSTATUS_VACA: TStringField;
    sqlResumoAnimalINTENCAO_DESCARTE: TStringField;
    cdsResumoAnimalINTENCAO_DESCARTE: TStringField;
    cdsResumoAnimalIDADE: TStringField;
    sqlResumoAnimalSanidade: TTcSQLDataSet;
    sqlResumoAnimalSanidadeKZOO_ANIMAL: TStringField;
    sqlResumoAnimalSanidadeDATAEVENTO: TSQLTimeStampField;
    sqlResumoAnimalSanidadeTIPOEVENTO: TIntegerField;
    sqlResumoAnimalSanidadeCCS: TIntegerField;
    sqlResumoAnimalSanidadeUREIA: TFloatField;
    sqlResumoAnimalSanidadePRODUCAO_ACUMULADA: TFloatField;
    sqlResumoAnimalSanidadePL305: TFloatField;
    sqlResumoAnimalSanidadePRODUCAO_MEDIA: TFloatField;
    cdsResumoAnimalSanidade: TClientDataSet;
    cdsResumoAnimalSanidadeKZOO_ANIMAL: TStringField;
    cdsResumoAnimalSanidadeDATAEVENTO: TSQLTimeStampField;
    cdsResumoAnimalSanidadeTIPOEVENTO: TIntegerField;
    cdsResumoAnimalSanidadeDESC_EVENTO: TStringField;
    cdsResumoAnimalSanidadeCCS: TIntegerField;
    cdsResumoAnimalSanidadeUREIA: TFloatField;
    cdsResumoAnimalSanidadePRODUCAO_ACUMULADA: TFloatField;
    cdsResumoAnimalSanidadePL305: TFloatField;
    cdsResumoAnimalSanidadePRODUCAO_MEDIA: TFloatField;
    cdsTipoEvento: TClientDataSet;
    cdsTipoEventoTIPO: TStringField;
    cdsTipoEventoVALOR: TStringField;
    cdsTipoEventoDESCRICAO: TStringField;
    cdsTipoEventoORDEM: TIntegerField;
    cdsResumoAnimalsqlResumoAnimalSanidade: TDataSetField;
    sqlResumoAnimalABORTOPARTO: TIntegerField;
    cdsResumoAnimalABORTOPARTO: TIntegerField;
    sqlResumoAnimalSanidadeGORDURA: TFloatField;
    sqlResumoAnimalSanidadePROTEINA: TFloatField;
    cdsResumoAnimalSanidadeGORDURA: TFloatField;
    cdsResumoAnimalSanidadePROTEINA: TFloatField;
    sqlResumoAnimalDIAS_ULTEVENTO: TLargeintField;
    cdsResumoAnimalDIAS_ULTEVENTO: TLargeintField;
    sqlResumoAnimalRACA: TStringField;
    cdsResumoAnimalRACA: TStringField;
    sqlResumoAnimalSanidadeDT_DIAGNOSTICO: TSQLTimeStampField;
    sqlResumoAnimalSanidadeDSC_DIAGNOSTICO: TStringField;
    cdsResumoAnimalSanidadeDT_DIAGNOSTICO: TSQLTimeStampField;
    cdsResumoAnimalSanidadeDSC_DIAGNOSTICO: TStringField;
    cdsResumoAnimalSanidadeDT_ULTIMO_EVENTO: TDateTimeField;
    cdsResumoAnimalSanidadeDESC_ULTIMO_EVENTO: TStringField;
    sqlResumoAnimalTOTAL: TFloatField;
    cdsResumoAnimalTOTAL: TFloatField;
    sqlResumoAnimalSTATUS_REPRODUTIVO: TStringField;
    cdsResumoAnimalSTATUS_REPRODUTIVO: TStringField;
    procedure cdsResumoAnimalCalcFields(DataSet: TDataSet);
    procedure cdsResumoAnimalDefaultText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsResumoAnimalSanidadeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    function IdadeAnoMes ( Intervalo : integer ) : String;
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;

  end;

implementation

uses Tc.DBRTL.AbstractDB, Exceptions, CLAg5Types, DateUtils, CDSSuppl ;

{$R *.dfm}

{ TdtmZoo_InformacoesAnimal }

procedure TdtmZoo_InformacoesAnimal.cdsResumoAnimalDefaultText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
//  if Sender.IsNull then
//     text := 'n/d'
//  else
    text := Sender.AsString
end;

procedure TdtmZoo_InformacoesAnimal.cdsResumoAnimalSanidadeCalcFields(
  DataSet: TDataSet);
begin
if not (cdsResumoAnimalSanidadeDT_DIAGNOSTICO.IsNull and cdsResumoAnimalSanidadeDATAEVENTO.IsNull ) then
  if (cdsResumoAnimalSanidadeDT_DIAGNOSTICO.AsDateTime < cdsResumoAnimalSanidadeDATAEVENTO.AsDateTime ) then
    begin
      cdsResumoAnimalSanidadeDT_ULTIMO_EVENTO.AsDateTime := cdsResumoAnimalSanidadeDATAEVENTO.AsDateTime;
      cdsResumoAnimalSanidadeDESC_ULTIMO_EVENTO.AsString := cdsResumoAnimalSanidadeDESC_EVENTO.AsString;
    end
  else
    begin
      cdsResumoAnimalSanidadeDT_ULTIMO_EVENTO.AsDateTime := cdsResumoAnimalSanidadeDT_DIAGNOSTICO.AsDateTime;
      cdsResumoAnimalSanidadeDESC_ULTIMO_EVENTO.AsString := cdsResumoAnimalSanidadeDSC_DIAGNOSTICO.AsString;
    end;
  end;

function TdtmZoo_InformacoesAnimal.IdadeAnoMes(Intervalo: integer): String;
var
  Ano, Mes : Integer;
begin
  Ano := 0 ;
  Mes := 0 ;

  Ano := Trunc (Intervalo / 12);
  Mes := (Intervalo mod 12);

  Result := IntToStr(Ano) + '/' + IntToStr(Mes) ;
end;

procedure TdtmZoo_InformacoesAnimal.cdsResumoAnimalCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State in [dsInternalCalc] then
      begin
         if cdsResumoAnimalULTIMA_LACTACAO.IsNull then
           cdsResumoAnimalDPP.clear
         else
           cdsResumoAnimalDPP.asInteger := Trunc ( Date ) - Trunc (cdsResumoAnimalULTIMA_LACTACAO.AsDateTime ) + 1 ;

         if cdsResumoAnimalNASCIMENTO.IsNull then
           cdsResumoAnimalIDADE.Clear
         else
           cdsResumoAnimalIDADE.AsString := IdadeAnoMes(MonthsBetween(Date,cdsResumoAnimalNASCIMENTO.AsDateTime));

         cdsResumoAnimalDESC_PRENHEZ.AsString := '';

         if ( cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO.AsString = EmptyStr) then
          cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia'
         else
           if ( cdsResumoAnimalKULTIMO_EVENTO_ZOOTECNICO.AsString = cdsResumoAnimalKULTIMA_MONTA.AsString ) then
              begin
                   if ( cdsResumoAnimalABORTOPARTO.IsNull ) then
                     begin
                         if cdsResumoAnimalPRENHEZ.AsString = 'T' then
                           begin
                             cdsResumoAnimalSTATUS_VACA.AsString  := 'Prenhe';
                             cdsResumoAnimalDESC_PRENHEZ.AsString := 'Sim';
                           end
                         else if cdsResumoAnimalPRENHEZ.AsString = 'F' then
                           begin
                             cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';
                             cdsResumoAnimalDESC_PRENHEZ.AsString := 'Não';
                           end
                         else
                            cdsResumoAnimalSTATUS_VACA.AsString := 'Coberta';
                     end
                   else
                      cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';
              end
           else
             cdsResumoAnimalSTATUS_VACA.AsString := 'Vazia';

      end;
end;

procedure TdtmZoo_InformacoesAnimal.OpenTables;
begin
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_STATUS_FEMEA,         cdsStatusAnimal       ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RACA_ANIMAIS,         cdsTipoRacasAnimais   ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_DOADOR_RECEPTOR, cdsTipoDoadorReceptor ) ;
  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_EVENTO_ZOO,      cdsTipoEvento         ) ;

  sqlResumoAnimalUltimaTarefa.ParamByName  ( 'STATUS_EXECUTADA'    ).AsInteger := _ST_STATUS_TAREFA_EXECUTADA ;
  sqlResumoAnimalProximaTarefa.ParamByName ( 'STATUS_PENDENTE'     ).AsInteger := _ST_STATUS_TAREFA_PENDENTE ;
  sqlResumoAnimalProximaTarefa.ParamByName ( 'STATUS_NAOEXECUTADA' ).AsInteger := _ST_STATUS_TAREFA_NAO_EXECUTADA ;

  TCDSSuppl.SetMasterSource(cdsResumoAnimal, 'KZOO_ANIMAL', FMasterSource, 'KZOO_ANIMAL' ) ;
  TCDSSuppl.Open ( cdsResumoAnimal ) ;

end;

procedure TdtmZoo_InformacoesAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
