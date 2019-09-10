unit UZoo_AtividadesDiarioDaMastiteDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesDiarioDaMastiteDatamodule = class(T_dtmBASE)
    cdsTarefas: TClientDataSet;
    cdsTarefasDATAPROGRAMADA: TDateField;
    cdsTarefasRESPONSAVEL: TStringField;
    cdsTarefasBRINCOFEMEA_: TStringField;
    cdsTarefasTIPOTAREFA: TIntegerField;
    cdsTarefasDATA_MASTITE: TSQLTimeStampField;
    cdsTarefasCODIGO_MASTITE: TStringField;
    cdsTarefasQUARTO: TSmallintField;
    cdsTarefasDATAPREVISTA: TSQLTimeStampField;
    cdsTarefasNOME_MASTITE: TStringField;
    cdsTarefasTAREFA: TStringField;
    cdsTarefasBRINCOFEMEA: TStringField;
    cdsTarefasLOTE: TStringField;
    cdsTarefasDEL: TIntegerField;
    cdsTarefasNL: TIntegerField;
    cdsTarefasATRASADA: TStringField;
    cdsTarefasDPP: TLargeintField;
    cdsTarefasDIAS_SECAR: TLargeintField;
    cdsTarefasNOMEFEMEA: TStringField;
    cdsTarefasULTIMA_CULTURA: TStringField;
    cdsTarefasDATA_CULTURA: TSQLTimeStampField;
    cdsTarefasDATA_ULTIMO_DESCARTE: TSQLTimeStampField;
    cdsTarefasDESCARTELEITE: TIntegerField;
    dspTarefas: TDataSetProvider;
    sqlTarefas: TTcSQLDataSet;
    sqlTarefasDATAPROGRAMADA: TDateField;
    sqlTarefasRESPONSAVEL: TStringField;
    sqlTarefasBRINCOFEMEA_: TStringField;
    sqlTarefasTIPOTAREFA: TIntegerField;
    sqlTarefasDATA_MASTITE: TSQLTimeStampField;
    sqlTarefasCODIGO_MASTITE: TStringField;
    sqlTarefasQUARTO: TSmallintField;
    sqlTarefasDATAPREVISTA: TSQLTimeStampField;
    sqlTarefasNOME_MASTITE: TStringField;
    sqlTarefasTAREFA: TStringField;
    sqlTarefasBRINCOFEMEA: TStringField;
    sqlTarefasLOTE: TStringField;
    sqlTarefasDEL: TIntegerField;
    sqlTarefasNL: TIntegerField;
    sqlTarefasATRASADA: TStringField;
    sqlTarefasDPP: TLargeintField;
    sqlTarefasDIAS_SECAR: TLargeintField;
    sqlTarefasNOMEFEMEA: TStringField;
    sqlTarefasULTIMA_CULTURA: TStringField;
    sqlTarefasDATA_CULTURA: TSQLTimeStampField;
    sqlTarefasDATA_ULTIMO_DESCARTE: TSQLTimeStampField;
    sqlTarefasDESCARTELEITE: TIntegerField;
    sqlTarefasPENULTIMA_CCS: TIntegerField;
    sqlTarefasULTIMA_CCS: TIntegerField;
    cdsTarefasPENULTIMA_CCS: TIntegerField;
    cdsTarefasULTIMA_CCS: TIntegerField;
    cdsTarefasKZOO_ANIMAL_FEMEA: TStringField;
    sqlTarefasKZOO_ANIMAL_FEMEA: TStringField;
    procedure cdsTarefasBeforeOpen(DataSet: TDataSet);
    procedure cdsTarefasCODIGO_MASTITEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasQUARTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FAte: TDateTime;
    FKCAD_FUNCIONARIO: string;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    procedure SetKCAD_FUNCIONARIO(const Value: string);
    procedure RemoveDupDescarte ;
  public
    { Public declarations }
    ProxXDias : Boolean ;
    property Ate : TDateTime  read FAte write SetAte;
    property KCAD_FUNCIONARIO : string  read FKCAD_FUNCIONARIO write SetKCAD_FUNCIONARIO;
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, Data.SQLTimSt, DateUtils,
     StrUtils,
     CLAg5Types, ClAg5ClientCommonTypes, ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TdtmZoo_AtividadesSecagem }

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefasBeforeOpen(
  DataSet: TDataSet);
begin
  SetParams
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefasCODIGO_MASTITEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := StringReplace ( Sender.asString.Trim, 'Mastite', '', [rfIgnoreCase] ) ;
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefasQUARTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := '' ;
  Case Sender.AsInteger of
    1 :  Text := 'AD' ;
    2 :  Text := 'AE' ;
    3 :  Text := 'PD' ;
    4 :  Text := 'PE' ;
  end ;
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.RemoveDupDescarte;
var
  LLastBrinco  : string ;
  LLastDate    : TDateTime ;
  LSame        : boolean ;

begin
    LLastBrinco :=  ''  ;
    LLastDate   := 0 ;

    with cdsTarefas do
      begin
        while not eof do
           begin
             LSame :=  (LLastBrinco = FieldByName('BRINCOFEMEA').asString)
                   and (LLastDate   = FieldByName('DATAPROGRAMADA').asDateTime);

             LLastBrinco := FieldByName('BRINCOFEMEA').asString ;
             LLastDate   := FieldByName('DATAPROGRAMADA').asDateTime ;

             if   ( LSame )
              and ( FieldByName('TIPOTAREFA').asInteger  = _ST_STATUS_TAREFA_DESCARTE_LEITE) then
                begin
                  Delete ;
                  first ;
                  LLastBrinco :=  ''  ;
                  LLastDate   := 0 ;
                end
             else
              Next ;
          end;
      end;
    cdsTarefas.First ;
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsTarefas.Active then
     cdsTarefas.Close ;

  cdsTarefas.DisableControls ;
  TCDSSuppl.Open ( cdsTarefas ) ;
  RemoveDupDescarte;
  cdsTarefas.EnableControls ;
end;


procedure TZoo_AtividadesDiarioDaMastiteDatamodule.SetKCAD_FUNCIONARIO(
  const Value: string);
begin
  FKCAD_FUNCIONARIO := Value;
end;

procedure TZoo_AtividadesDiarioDaMastiteDatamodule.SetParams;
var
  LDiasGetacaoPrimipara, LDiasGetacaoMultipara : integer ;
  LDiasPrePartoSecarPrimipara, LDiasPrePartoSecarMultipara : integer ;
begin

  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     LDiasGetacaoPrimipara,       LDiasGetacaoMultipara ) ;
  TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, LDiasPrePartoSecarPrimipara, LDiasPrePartoSecarMultipara ) ;

  cdsTarefas.Params.ParamByName ( 'DESCONSIDERAR_PRENHEZ'  ).asString  := ifThen ( ParametrosFazenda( LoggedUser.DomainID ).ExibirPartoSemConfirmacao, 'T', 'F' )  ;
  cdsTarefas.Params.ParamByName ( 'PREV_SECAGEM_PRIMIPARA' ).asInteger := LDiasGetacaoPrimipara - LDiasPrePartoSecarPrimipara ;
  cdsTarefas.Params.ParamByName ( 'PREV_SECAGEM_MULTIPARA' ).asInteger := LDiasGetacaoMultipara - LDiasPrePartoSecarMultipara ;
  cdsTarefas.Params.ParamByName ( 'KCAD_FAZENDA'           ).asString  := LoggedUser.DomainID ;
  cdsTarefas.Params.ParamByName ( 'STATUS_DESCARTADO'      ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

  cdsTarefas.Params.paramByName ( 'DATAFIM'      ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;
  cdsTarefas.Params.paramByName ( 'PENDENTE'     ).AsInteger       := _ST_STATUS_TAREFA_PENDENTE ;
  cdsTarefas.Params.paramByName ( 'EXECUTADO'     ).AsInteger      := _ST_STATUS_TAREFA_EXECUTADA ;
  cdsTarefas.Params.paramByName ( 'TIPO_MASTITE'     ).AsInteger   := 3 ; //;
  cdsTarefas.Params.paramByName ( 'DESCARTE_LEITE'   ).AsInteger   := _ST_STATUS_TAREFA_DESCARTE_LEITE ;

  if KCAD_FUNCIONARIO = '' then
    begin
      cdsTarefas.Params.paramByName ( 'TODOS_FUNCIONARIOS'     ).AsString       := 'T' ;
      cdsTarefas.Params.paramByName ( 'KCAD_FUNCIONARIO'     ).AsString         := '' ;
//      cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO' ;
    end
  else
     begin
      cdsTarefas.Params.paramByName ( 'TODOS_FUNCIONARIOS'     ).AsString       := 'F' ;
      cdsTarefas.Params.paramByName ( 'KCAD_FUNCIONARIO'     ).AsString         := KCAD_FUNCIONARIO ;
//      cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;RESPONSAVEL;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO' ;
     end;

  cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO' ;



end;


end.
