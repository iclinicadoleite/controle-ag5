unit UZoo_AtividadesUltimasTarefasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Tc.DBRTL.AbstractDB,
  Datasnap.Provider;

type

  TEnd = procedure ( A : TClientDataSet ) of object ;

  TZoo_AtividadesUltimasTarefasDatamodule = class(T_dtmBASE)
    cdsEventosZootecnicos: TClientDataSet;
    dspEventosZootecnicos: TDataSetProvider;
    sqlEventosZootecnicos: TTcSQLDataSet;
    cdsDiagnosticoGestacao: TClientDataSet;
    dspDiagnosticoGestacao: TDataSetProvider;
    sqlDiagnosticoGestacao: TTcSQLDataSet;
    cdsSecagens: TClientDataSet;
    dspSecagens: TDataSetProvider;
    sqlSecagens: TTcSQLDataSet;
    cdsDiagnosticoSanitarios: TClientDataSet;
    dspDiagnosticoSanitarios: TDataSetProvider;
    sqlDiagnosticoSanitarios: TTcSQLDataSet;
    cdsPartos: TClientDataSet;
    dspPartos: TDataSetProvider;
    sqlPartos: TTcSQLDataSet;
    cdsCrescimento: TClientDataSet;
    dspCrescimento: TDataSetProvider;
    sqlCrescimento: TTcSQLDataSet;
    cdsDesmame: TClientDataSet;
    dspDesmame: TDataSetProvider;
    sqlDesmame: TTcSQLDataSet;
    cdsDescartes: TClientDataSet;
    dspDescartes: TDataSetProvider;
    sqlDescartes: TTcSQLDataSet;
    sqlEventosZootecnicosBRINCO: TStringField;
    sqlEventosZootecnicosBRINCO_: TStringField;
    sqlEventosZootecnicosEVENTO: TStringField;
    sqlEventosZootecnicosDATAEVENTO: TSQLTimeStampField;
    sqlEventosZootecnicosNOMEESTABULO: TStringField;
    cdsEventosZootecnicosBRINCO: TStringField;
    cdsEventosZootecnicosBRINCO_: TStringField;
    cdsEventosZootecnicosEVENTO: TStringField;
    cdsEventosZootecnicosDATAEVENTO: TSQLTimeStampField;
    cdsEventosZootecnicosNOMEESTABULO: TStringField;
    sqlDiagnosticoGestacaoKZOO_ANIMAL: TStringField;
    sqlDiagnosticoGestacaoBRINCO: TStringField;
    sqlDiagnosticoGestacaoBRINCO_: TStringField;
    sqlDiagnosticoGestacaoDATATOQUE: TSQLTimeStampField;
    sqlDiagnosticoGestacaoCONCATENATION: TStringField;
    sqlEventosZootecnicosKZOO_ANIMAL: TStringField;
    cdsEventosZootecnicosKZOO_ANIMAL: TStringField;
    sqlSecagensBRINCO: TStringField;
    sqlSecagensBRINCO_: TStringField;
    sqlSecagensDATA_SECAGEM: TSQLTimeStampField;
    sqlSecagensKZOO_ANIMAL: TStringField;
    cdsSecagensKZOO_ANIMAL: TStringField;
    cdsSecagensBRINCO: TStringField;
    cdsSecagensBRINCO_: TStringField;
    cdsSecagensDATA_SECAGEM: TSQLTimeStampField;
    sqlDiagnosticoSanitariosBRINCO: TStringField;
    sqlDiagnosticoSanitariosBRINCO_: TStringField;
    sqlDiagnosticoSanitariosDATA: TSQLTimeStampField;
    sqlDiagnosticoSanitariosDIAGNOSTICO: TStringField;
    cdsDiagnosticoSanitariosBRINCO: TStringField;
    cdsDiagnosticoSanitariosBRINCO_: TStringField;
    cdsDiagnosticoSanitariosDATA: TSQLTimeStampField;
    cdsDiagnosticoSanitariosDIAGNOSTICO: TStringField;
    sqlPartosKZOO_ANIMAL: TStringField;
    sqlPartosBRINCO: TStringField;
    sqlPartosBRINCO_: TStringField;
    sqlPartosDATAABORTOPARTO: TSQLTimeStampField;
    sqlPartosDIAGNOSTICO: TStringField;
    cdsPartosKZOO_ANIMAL: TStringField;
    cdsPartosBRINCO: TStringField;
    cdsPartosBRINCO_: TStringField;
    cdsPartosDATAABORTOPARTO: TSQLTimeStampField;
    cdsPartosDIAGNOSTICO: TStringField;
    sqlDesmameKZOO_ANIMAL: TStringField;
    sqlDesmameBRINCO: TStringField;
    sqlDesmameBRINCO_: TStringField;
    sqlDesmameDATADESMAME: TSQLTimeStampField;
    cdsDesmameKZOO_ANIMAL: TStringField;
    cdsDesmameBRINCO: TStringField;
    cdsDesmameBRINCO_: TStringField;
    cdsDesmameDATADESMAME: TSQLTimeStampField;
    sqlDescartesKZOO_ANIMAL: TStringField;
    sqlDescartesBRINCO: TStringField;
    sqlDescartesBRINCO_: TStringField;
    sqlDescartesDATA: TSQLTimeStampField;
    sqlDescartesOBS: TStringField;
    cdsDescartesKZOO_ANIMAL: TStringField;
    cdsDescartesBRINCO: TStringField;
    cdsDescartesBRINCO_: TStringField;
    cdsDescartesDATA: TSQLTimeStampField;
    cdsDescartesOBS: TStringField;
    cdsDiagnosticoGestacaoKZOO_ANIMAL: TStringField;
    cdsDiagnosticoGestacaoBRINCO: TStringField;
    cdsDiagnosticoGestacaoBRINCO_: TStringField;
    cdsDiagnosticoGestacaoDATATOQUE: TSQLTimeStampField;
    cdsDiagnosticoGestacaoCONCATENATION: TStringField;
    sqlDiagnosticoSanitariosKZOO_ANIMAL: TStringField;
    cdsDiagnosticoSanitariosKZOO_ANIMAL: TStringField;
    cdsCrescimentoKZOO_ANIMAL: TStringField;
    cdsCrescimentoBRINCO: TStringField;
    cdsCrescimentoBRINCO_: TStringField;
    cdsCrescimentoDATA: TSQLTimeStampField;
    cdsCrescimentoPESO: TIntegerField;
    cdsCrescimentoALTURA: TIntegerField;
    cdsResultados: TClientDataSet;
    dspResultados: TDataSetProvider;
    sqlResultados: TTcSQLDataSet;
    cdsExames: TClientDataSet;
    dspExames: TDataSetProvider;
    sqlExames: TTcSQLDataSet;
    cdsTarefas: TClientDataSet;
    dspTarefas: TDataSetProvider;
    sqlTarefas: TTcSQLDataSet;
    cdsBST: TClientDataSet;
    dspBST: TDataSetProvider;
    sqlBST: TTcSQLDataSet;
    sqlTarefasBRINCO: TStringField;
    sqlTarefasBRINCO_: TStringField;
    sqlTarefasDATASTATUS: TSQLTimeStampField;
    sqlTarefasTAREFA: TStringField;
    sqlTarefasSTATUS: TStringField;
    sqlTarefasKZOO_ANIMAL: TStringField;
    cdsTarefasKZOO_ANIMAL: TStringField;
    cdsTarefasBRINCO: TStringField;
    cdsTarefasBRINCO_: TStringField;
    cdsTarefasDATASTATUS: TSQLTimeStampField;
    cdsTarefasTAREFA: TStringField;
    cdsTarefasSTATUS: TStringField;
    sqlExamesKZOO_ANIMAL: TStringField;
    sqlExamesBRINCO: TStringField;
    sqlExamesBRINCO_: TStringField;
    sqlExamesDATASTATUS: TSQLTimeStampField;
    cdsExamesKZOO_ANIMAL: TStringField;
    cdsExamesBRINCO: TStringField;
    cdsExamesBRINCO_: TStringField;
    cdsExamesDATASTATUS: TSQLTimeStampField;
    sqlExamesEXAME: TStringField;
    cdsExamesEXAME: TStringField;
    sqlResultadosKZOO_ANIMAL: TStringField;
    sqlResultadosBRINCO: TStringField;
    sqlResultadosBRINCO_: TStringField;
    sqlResultadosDATASTATUS: TSQLTimeStampField;
    sqlResultadosEXAME: TStringField;
    sqlResultadosDATA_RESULTADO: TSQLTimeStampField;
    sqlResultadosRESULTADOS: TStringField;
    cdsResultadosKZOO_ANIMAL: TStringField;
    cdsResultadosBRINCO: TStringField;
    cdsResultadosBRINCO_: TStringField;
    cdsResultadosDATASTATUS: TSQLTimeStampField;
    cdsResultadosEXAME: TStringField;
    cdsResultadosDATA_RESULTADO: TSQLTimeStampField;
    cdsResultadosRESULTADOS: TStringField;
    cdsCC: TClientDataSet;
    dspCC: TDataSetProvider;
    sqlCC: TTcSQLDataSet;
    sqlBSTKZOO_ANIMAL: TStringField;
    sqlBSTBRINCO: TStringField;
    sqlBSTBRINCO_: TStringField;
    sqlBSTDATA: TSQLTimeStampField;
    sqlBSTAPLICADO: TStringField;
    cdsBSTKZOO_ANIMAL: TStringField;
    cdsBSTBRINCO: TStringField;
    cdsBSTBRINCO_: TStringField;
    cdsBSTDATA: TSQLTimeStampField;
    cdsBSTAPLICADO: TStringField;
    sqlCCKZOO_ANIMAL: TStringField;
    sqlCCBRINCO: TStringField;
    sqlCCBRINCO_: TStringField;
    sqlCCDATA: TSQLTimeStampField;
    sqlCCCC: TFloatField;
    cdsCCKZOO_ANIMAL: TStringField;
    cdsCCBRINCO: TStringField;
    cdsCCBRINCO_: TStringField;
    cdsCCDATA: TSQLTimeStampField;
    cdsCCCC: TFloatField;
    sqlExamesSTATUS: TStringField;
    cdsExamesSTATUS: TStringField;
    cdsControleLeiteiro: TClientDataSet;
    dspControleLeiteiro: TDataSetProvider;
    sqlControleLeiteiro: TTcSQLDataSet;
    SQLDataSet1: TTcSQLDataSet;
    SQLDataSet1KZOO_LOTEPESAGEM_LEITE: TStringField;
    SQLDataSet1DATA: TSQLTimeStampField;
    SQLDataSet1TOTAL: TFloatField;
    sqlControleLeiteiroLOTE: TStringField;
    sqlControleLeiteiroPESAGENS: TIntegerField;
    sqlControleLeiteiroTOTAL: TFloatField;
    sqlControleLeiteiroMEDIA: TFloatField;
    cdsControleLeiteiroLOTE: TStringField;
    cdsControleLeiteiroPESAGENS: TIntegerField;
    cdsControleLeiteiroTOTAL: TFloatField;
    cdsControleLeiteiroMEDIA: TFloatField;
    procedure cdsATarefasBeforeOpen(DataSet: TDataSet);
    procedure cdsBSTAPLICADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FSQLConnection : TSQLConnection ;
    FOnEnd: TEnd;
    procedure SetParams ( ADataSet : TClientDataSet ) ;
    procedure DoEnd ( A : TClientDataSet ) ;
    procedure SetOnEnd(const Value: TEnd);
    { Private declarations }
  public
    { Public declarations }
    FData : TDateTime ;
    ProxXDias : Boolean ;
    property OnEnd : TEnd  read FOnEnd write SetOnEnd;
    procedure OpenTables ; override ;
    procedure OpenThreads ;
    procedure ApplyUpdates ; override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, Data.SQLTimSt, DateUtils , CLAg5Types;

{$R *.dfm}

{ TdtmZoo_AtividadesSecagem }

procedure TZoo_AtividadesUltimasTarefasDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.cdsATarefasBeforeOpen(DataSet: TDataSet);
begin
  SetParams ( TClientDataSet ( DataSet ) ) ;
end;


procedure TZoo_AtividadesUltimasTarefasDatamodule.cdsBSTAPLICADOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.asString = 'T' then
     text := 'Sim'
  else if Sender.asString = 'F' then
     text := 'Não'
  else
     text := Sender.asString ;
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.DoEnd( A : TClientDataSet ) ;
begin
   if Assigned ( FOnEnd ) then
    TThread.Synchronize (
      nil
    , procedure
      begin
         FOnEnd( A ) ;
      end
    ) ;
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.OpenThreads ;
begin

  if Assigned ( FSQLConnection ) then
     exit ;

  if not Assigned ( FSQLConnection ) then
   TThread.Synchronize( nil,
    procedure
    begin
      FSQLConnection := TSQLConnection ( {TTcAbstractDB.GetByAlias( 'FINANCEIRO' ).Connection} sqlEventosZootecnicos.SQLConnection ).CloneConnection ;
      FSQLConnection.Open ;
    end
   ) ;

  sqlEventosZootecnicos.SQLConnection    := FSQLConnection ;
  sqlDiagnosticoGestacao.SQLConnection   := FSQLConnection ;
  sqlPartos.SQLConnection                := FSQLConnection ;
  sqlSecagens.SQLConnection              := FSQLConnection ;
  sqlDiagnosticoSanitarios.SQLConnection := FSQLConnection ;
  sqlCrescimento.SQLConnection           := FSQLConnection ;
  sqlCC.SQLConnection                    := FSQLConnection ;
  sqlDesmame.SQLConnection               := FSQLConnection ;
  sqlDescartes.SQLConnection             := FSQLConnection ;
  sqlTarefas.SQLConnection               := FSQLConnection ;
  sqlExames.SQLConnection                := FSQLConnection ;
  sqlBST.SQLConnection                   := FSQLConnection ;

  SQLDataSet1.SQLConnection      := FSQLConnection ;
  sqlControleLeiteiro.SQLConnection      := FSQLConnection ;

 TThread.CreateAnonymousThread(
   procedure
   begin
     try cdsEventosZootecnicos.Open    except end ; DoEnd(cdsEventosZootecnicos   ) ;
     try cdsDiagnosticoGestacao.Open   except end ; DoEnd(cdsDiagnosticoGestacao  ) ;
     try cdsPartos.Open                except end ; DoEnd(cdsPartos               ) ;
     try cdsSecagens.Open              except end ; DoEnd(cdsSecagens             ) ;
     try cdsDiagnosticoSanitarios.Open except end ; DoEnd(cdsDiagnosticoSanitarios) ;
     try cdsCrescimento.Open           except end ; DoEnd(cdsCrescimento          ) ;
  //   try cdsCC.Open                    except end ; DoEnd(cdsCC                   ) ;
     try cdsDesmame.Open               except end ; DoEnd(cdsDesmame              ) ;
     try cdsDescartes.Open             except end ; DoEnd(cdsDescartes            ) ;
     try cdsTarefas.Open               except end ; DoEnd(cdsTarefas              ) ;
     try cdsExames.Open                except end ; DoEnd(cdsExames               ) ;
  //   try cdsResultados.Open            except end ; DoEnd(cdsResultados           ) ;
     try cdsBST.Open                   except end ; DoEnd(cdsBST                  ) ;

    try
      SQLDataSet1.Open ;
      FData := SQLDataSet1DATA.asDateTime ;
 //     if SQLDataSet1TOTAL.asFloat = 0 then
 //       cdsControleLeiteiro.ParamByName( 'TOTAL_GERAL' ).asFloat := 1
 //     else
 //       cdsControleLeiteiro.ParamByName( 'TOTAL_GERAL' ).asFloat := SQLDataSet1TOTAL.asFloat ;
      cdsControleLeiteiro.ParamByName( 'KZOO_LOTEPESAGEM_LEITE' ).asString := SQLDataSet1KZOO_LOTEPESAGEM_LEITE.asString ;
      SQLDataSet1.Close ;
      cdsControleLeiteiro.Open
    except
    end ;
    DoEnd(cdsControleLeiteiro ) ;
   end
 ).Start ;
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.SetOnEnd(const Value: TEnd);
begin
  FOnEnd := Value;
end;

procedure TZoo_AtividadesUltimasTarefasDatamodule.SetParams ( ADataSet : TClientDataSet ) ;
begin
  ADataSet.Params.ParamByName ( 'ROWS' ).asInteger   := 10 ;
end ;

end.

