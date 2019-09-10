unit UdtmZoo_GraficoLactacaoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, sqlTimSt ;

type


  TGraphicPeriodType = ( gpProducao, gpProducao305d, gpCresimento, gpCresimento1L ) ;

  TGraphicData = (
    gdCurvaLactacao,
    gdBST, gdTrocaLote, gdCiosMontaIA, gdDiagnosticos, gdCondicaoCorporal,  // eventos
    gdProducao, gdGordura, gdProteina, gdUreia, gdCCS, gdAltura, gdPeso     // pontos
     ) ;

  TGraphicDataSelected = set of TGraphicData ;

  TdtmZoo_GraficoLactacaoAnimal = class(T_dtmBASE)
    cdsLactacoes: TClientDataSet;
    dspLactacoes: TDataSetProvider;
    sqlLactacoes: TTcSQLDataSet;
    sqlPesagensLactacao: TTcSQLDataSet;
    cdsPesagensLactacao: TClientDataSet;
    sqlLactacoesNL: TIntegerField;
    sqlLactacoesINICIO: TSQLTimeStampField;
    sqlLactacoesKZOO_LACTACAO: TStringField;
    dtsLactacoes: TDataSource;
    cdsLactacoesKZOO_LACTACAO: TStringField;
    cdsLactacoesNL: TIntegerField;
    dspPesagensLactacao: TDataSetProvider;
    sqlPesagensLactacaoDEL: TIntegerField;
    sqlPesagensLactacaoDATA: TSQLTimeStampField;
    sqlPesagensLactacaoTOTAL: TFloatField;
    cdsPesagensLactacaoDEL: TIntegerField;
    cdsPesagensLactacaoDATA: TSQLTimeStampField;
    cdsPesagensLactacaoTOTAL: TFloatField;
    sqlPesagensLactacaoKZOO_LACTACAO: TStringField;
    cdsPesagensLactacaoKZOO_LACTACAO: TStringField;
    sqlLactacoesFIM: TSQLTimeStampField;
    cdsLactacoesINICIO: TSQLTimeStampField;
    cdsLactacoesFIM: TSQLTimeStampField;
    sqlLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    cdsLactacoesKZOO_ANIMAL_FEMEA: TStringField;
    cdsAnalisesLactacao: TClientDataSet;
    cdsCrescimentoPeso: TClientDataSet;
    cdsReprodutivo: TClientDataSet;
    cdsSanidadeDiagnosticos: TClientDataSet;
    cdsSanidadeCondicaoCorporal: TClientDataSet;
    dspCrescimentoPeso: TDataSetProvider;
    dspAnalisesLactacao: TDataSetProvider;
    dspReprodutivo: TDataSetProvider;
    dspSanidadeDiagnosticos: TDataSetProvider;
    dspSanidadeCondicaoCorporal: TDataSetProvider;
    sqlAnalisesLactacao: TTcSQLDataSet;
    sqlCrescimentoPeso: TTcSQLDataSet;
    sqlReprodutivo: TTcSQLDataSet;
    sqlSanidadeDiagnosticos: TTcSQLDataSet;
    sqlSanidadeCondicaoCorporal: TTcSQLDataSet;
    cdsCrescimentoAltura: TClientDataSet;
    dspCrescimentoAltura: TDataSetProvider;
    sqlCrescimentoAltura: TTcSQLDataSet;
    sqlBST: TTcSQLDataSet;
    dspBST: TDataSetProvider;
    cdsBST: TClientDataSet;
    cdsAnalisesLactacaoDATA: TSQLTimeStampField;
    cdsAnalisesLactacaoGORDURA: TFloatField;
    cdsAnalisesLactacaoPROTEINA: TFloatField;
    cdsAnalisesLactacaoUREIA: TFloatField;
    cdsAnalisesLactacaoCCS: TIntegerField;
    cdsBSTDATA: TSQLTimeStampField;
    cdsBSTBST: TIntegerField;
    sqlAnalisesLactacaoDATA: TSQLTimeStampField;
    sqlAnalisesLactacaoGORDURA: TFloatField;
    sqlAnalisesLactacaoPROTEINA: TFloatField;
    sqlAnalisesLactacaoUREIA: TFloatField;
    sqlAnalisesLactacaoCCS: TIntegerField;
    sqlBSTDATA: TSQLTimeStampField;
    sqlBSTBST: TIntegerField;
    sqlCrescimentoAlturaDATA: TSQLTimeStampField;
    sqlCrescimentoAlturaALTURA: TIntegerField;
    sqlCrescimentoPesoDATA: TSQLTimeStampField;
    sqlCrescimentoPesoPESO: TIntegerField;
    sqlReprodutivoDATA: TSQLTimeStampField;
    sqlReprodutivoREPRODUCAO: TIntegerField;
    sqlSanidadeDiagnosticosDATA: TSQLTimeStampField;
    sqlSanidadeDiagnosticosDIAGNOSTICO: TStringField;
    sqlSanidadeCondicaoCorporalDATA: TSQLTimeStampField;
    sqlSanidadeCondicaoCorporalCC: TFloatField;
    cdsCrescimentoAlturaDATA: TSQLTimeStampField;
    cdsCrescimentoAlturaALTURA: TIntegerField;
    cdsCrescimentoPesoDATA: TSQLTimeStampField;
    cdsCrescimentoPesoPESO: TIntegerField;
    cdsReprodutivoDATA: TSQLTimeStampField;
    cdsReprodutivoREPRODUCAO: TIntegerField;
    cdsSanidadeDiagnosticosDATA: TSQLTimeStampField;
    cdsSanidadeDiagnosticosDIAGNOSTICO: TStringField;
    cdsSanidadeCondicaoCorporalDATA: TSQLTimeStampField;
    cdsSanidadeCondicaoCorporalCC: TFloatField;
    cdsDadosAnimal: TClientDataSet;
    dspDadosAnimal: TDataSetProvider;
    sqlDadosAnimal: TTcSQLDataSet;
    dtsDadosAnimal: TDataSource;
    cdsTrocaLote: TClientDataSet;
    dspTrocaLote: TDataSetProvider;
    sqlTrocaLote: TTcSQLDataSet;
    sqlTrocaLoteDATA: TSQLTimeStampField;
    cdsTrocaLoteDATA: TSQLTimeStampField;
    sqlSanidadeDiagnosticosOCORRENCIA: TIntegerField;
    cdsSanidadeDiagnosticosOCORRENCIA: TIntegerField;
    sqlDadosAnimalKZOO_ANIMAL_FEMEA: TStringField;
    sqlDadosAnimalNASCIMENTO: TSQLTimeStampField;
    sqlDadosAnimalPRIMEIRA_LACTACAO: TSQLTimeStampField;
    cdsDadosAnimalKZOO_ANIMAL_FEMEA: TStringField;
    cdsDadosAnimalNASCIMENTO: TSQLTimeStampField;
    cdsDadosAnimalPRIMEIRA_LACTACAO: TSQLTimeStampField;
    cdsAnalisesLactacaoDEL: TIntegerField;
    cdsBSTDEL: TIntegerField;
    cdsTrocaLoteDEL: TIntegerField;
    cdsCrescimentoAlturaDEL: TIntegerField;
    cdsCrescimentoPesoDEL: TIntegerField;
    cdsReprodutivoDEL: TIntegerField;
    cdsSanidadeCondicaoCorporalDEL: TIntegerField;
    cdsSanidadeDiagnosticosDEL: TIntegerField;
    sqlDadosAnimalDATADESCARTE: TSQLTimeStampField;
    cdsDadosAnimalDATADESCARTE: TSQLTimeStampField;
    sqlPesagensPeriodo: TTcSQLDataSet;
    dspPesagensPeriodo: TDataSetProvider;
    cdsPesagensPeriodo: TClientDataSet;
    sqlPesagensPeriodoDATA: TSQLTimeStampField;
    sqlPesagensPeriodoTOTAL: TFloatField;
    cdsPesagensPeriodoDATA: TSQLTimeStampField;
    cdsPesagensPeriodoTOTAL: TFloatField;
    cdsPesagensPeriodoDEL: TIntegerField;
    cdsAnalisesPeriodo: TClientDataSet;
    cdsAnalisesPeriodoDEL: TIntegerField;
    cdsAnalisesPeriodoDATA: TSQLTimeStampField;
    cdsAnalisesPeriodoGORDURA: TFloatField;
    cdsAnalisesPeriodoPROTEINA: TFloatField;
    cdsAnalisesPeriodoUREIA: TFloatField;
    cdsAnalisesPeriodoCCS: TIntegerField;
    dspAnalisesPeriodo: TDataSetProvider;
    sqlAnalisesPeriodo: TTcSQLDataSet;
    sqlAnalisesPeriodoDATA: TSQLTimeStampField;
    sqlAnalisesPeriodoGORDURA: TFloatField;
    sqlAnalisesPeriodoPROTEINA: TFloatField;
    sqlAnalisesPeriodoUREIA: TFloatField;
    sqlAnalisesPeriodoCCS: TIntegerField;
    sqlTrocaLoteOCORRENCIA: TIntegerField;
    sqlTrocaLoteANTERIOR: TStringField;
    sqlTrocaLoteLOTE: TStringField;
    cdsTrocaLoteOCORRENCIA: TIntegerField;
    cdsTrocaLoteANTERIOR: TStringField;
    cdsTrocaLoteLOTE: TStringField;
    sqlReprodutivoEVENTO: TStringField;
    cdsReprodutivoEVENTO: TStringField;
    procedure cdsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    FLastKeyAnimal : string ;
    FLastGraphicDataSelected, FGraphicDataSelected: TGraphicDataSelected;
    FLastInicioPeriodo, FInicioPeriodo    : TDateTime ;
    FLastFimPeriodo,    FFimPeriodo       : TDateTime ;
    FGraphicPeriodType: TGraphicPeriodType;
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetGraphicDataSelected(const Value: TGraphicDataSelected);
    procedure SetGraphicPeriodType(const Value: TGraphicPeriodType);
  public
    { Public declarations }
    procedure OpenData ;
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property GraphicDataSelected : TGraphicDataSelected  read FGraphicDataSelected write SetGraphicDataSelected;
    property GraphicPeriodType   : TGraphicPeriodType  read FGraphicPeriodType write SetGraphicPeriodType;
    property InicioPeriodo    : TDateTime  read FInicioPeriodo ;
    property FimPeriodo       : TDateTime  read FFimPeriodo ;
    procedure AddRemGraphicDataSelected ( ASelected : boolean ; AGraphicData : TGraphicData ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

uses CDSSuppl, Exceptions, UDBZootecnico ;

{$R *.dfm}

{ TdtmZoo_GraficoLactacaoAnimal }

procedure TdtmZoo_GraficoLactacaoAnimal.AddRemGraphicDataSelected( ASelected : boolean ;
  AGraphicData: TGraphicData);
begin
  if ASelected then
    self.FGraphicDataSelected := self.FGraphicDataSelected + [ AGraphicData ]
  else
    self.FGraphicDataSelected := self.FGraphicDataSelected - [ AGraphicData ] ;
end;

procedure TdtmZoo_GraficoLactacaoAnimal.cdsCalcFields(
  DataSet: TDataSet);
begin
   if not ( DataSet.State = dsInternalCalc ) then
     exit ;

   DataSet.FieldByName('DEL').AsInteger := Trunc ( DataSet.FieldByName('DATA').AsDateTime - FInicioPeriodo ) ;

end;

constructor TdtmZoo_GraficoLactacaoAnimal.Create(AOwner: TComponent);
begin
  inherited;

  FGraphicPeriodType   := gpProducao ;

 // FGraphicDataSelected := [ gdProducao, gdGordura, gdProteina, gdUreia, gdCCS, gdBST, gdTrocaLote,
 //   gdAltura, gdPeso, gdCiosMontaIA,gdCondicaoCorporal, gdDiagnosticos ] ;

 FGraphicDataSelected := [ gdProducao ] ;

  FLastKeyAnimal           := ''  ;
  FLastGraphicDataSelected := [] ;
  FLastInicioPeriodo       := -1 ;
  FLastFimPeriodo          := -1 ;

end;

procedure TdtmZoo_GraficoLactacaoAnimal.OpenData;
var
  SQLInicioPeriodo,  SQLFimPeriodo : TSQLTimeStamp  ;
begin

   // por crescimento ...
   if   (self.FGraphicPeriodType in [gpCresimento,gpCresimento1L ]) then
     begin
      FInicioPeriodo := cdsDadosAnimalNASCIMENTO.AsDateTime ;

      if ( self.FGraphicPeriodType = gpCresimento1L ) then
        begin
          if cdsDadosAnimalPRIMEIRA_LACTACAO.isNull then
            begin
              if cdsDadosAnimalDATADESCARTE.IsNull then
                  FFimPeriodo    := Date
              else
                  FFimPeriodo    := cdsDadosAnimalDATADESCARTE.AsDateTime ;
            end
          else
              FFimPeriodo    :=  cdsDadosAnimalPRIMEIRA_LACTACAO.AsDateTime ;
        end
      else if cdsDadosAnimalDATADESCARTE.IsNull then // cdsDadosAnimalPRIMEIRA_LACTACAO.isNull then
         FFimPeriodo    := Date
      else
         FFimPeriodo    := cdsDadosAnimalDATADESCARTE.AsDateTime ;
     end
   else
     begin
       // por producao
       FInicioPeriodo := cdsLactacoesINICIO.AsDateTime ;

       if self.FGraphicPeriodType = gpProducao305d then
          FFimPeriodo := FInicioPeriodo + 305
       else if cdsLactacoesFIM.isNull then
         begin
           if cdsDadosAnimalDATADESCARTE.IsNull then
             FFimPeriodo := Date
           else
             FFimPeriodo := cdsDadosAnimalDATADESCARTE.asDateTime ;
         end
       else
          FFimPeriodo := cdsLactacoesFIM.asDateTime
     end ;

  // dados nao alterados ...
  if   ( cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString = FLastKeyAnimal )
   and ( FGraphicDataSelected * FLastGraphicDataSelected  = FLastGraphicDataSelected )
   and ( FLastInicioPeriodo   = FInicioPeriodo )
   and ( FLastFimPeriodo      = FFimPeriodo    ) then
      exit ;

  SQLInicioPeriodo  := DateTimeToSQLTimeStamp ( FInicioPeriodo ) ;
  SQLFimPeriodo     := DateTimeToSQLTimeStamp ( FFimPeriodo    ) ;

  // close all
  cdsPesagensLactacao.Close ;
  cdsAnalisesLactacao.Close ;
  cdsPesagensPeriodo.Close ;
  cdsAnalisesPeriodo.Close ;
  cdsBST.Close ;
  cdsTrocaLote.Close ;
  cdsCrescimentoPeso.Close ;
  cdsCrescimentoAltura.Close ;
  cdsReprodutivo.Close ;
  cdsSanidadeDiagnosticos.Close ;
  cdsSanidadeCondicaoCorporal.Close ;

  // set params ....
  cdsPesagensLactacao.Params.paramByName ( 'KZOO_LACTACAO' ).asString      := cdsLactacoesKZOO_LACTACAO.asString ;

  cdsPesagensPeriodo.Params.paramByName ( 'KZOO_ANIMAL' ).asString        := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsPesagensPeriodo.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp   := SQLInicioPeriodo   ;
  cdsPesagensPeriodo.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp      := SQLFimPeriodo   ;

  cdsAnalisesLactacao.Params.paramByName ( 'KZOO_LACTACAO' ).asString      := cdsLactacoesKZOO_LACTACAO.asString ;
  cdsAnalisesLactacao.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString  := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsAnalisesLactacao.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp   := SQLInicioPeriodo   ;
  cdsAnalisesLactacao.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp      := SQLFimPeriodo   ;

  cdsAnalisesPeriodo.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString  := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsAnalisesPeriodo.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp   := SQLInicioPeriodo   ;
  cdsAnalisesPeriodo.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp      := SQLFimPeriodo   ;


  cdsBST.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString       := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsBST.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp        := SQLInicioPeriodo   ;
  cdsBST.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp           := SQLFimPeriodo   ;

  cdsTrocaLote.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsTrocaLote.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp  := SQLInicioPeriodo   ;
  cdsTrocaLote.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp     := SQLFimPeriodo   ;

  cdsCrescimentoAltura.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsCrescimentoAltura.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp  := SQLInicioPeriodo   ;
  cdsCrescimentoAltura.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp     := SQLFimPeriodo      ;

  cdsCrescimentoPeso.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString   := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsCrescimentoPeso.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp    := SQLInicioPeriodo   ;
  cdsCrescimentoPeso.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp       := SQLFimPeriodo   ;

  cdsReprodutivo.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString       := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsReprodutivo.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp        := SQLInicioPeriodo   ;
  cdsReprodutivo.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp           := SQLFimPeriodo   ;

  cdsSanidadeDiagnosticos.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsSanidadeDiagnosticos.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp  := SQLInicioPeriodo  ;
  cdsSanidadeDiagnosticos.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp     := SQLFimPeriodo   ;

  cdsSanidadeCondicaoCorporal.Params.paramByName ( 'KZOO_ANIMAL_FEMEA' ).asString := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  cdsSanidadeCondicaoCorporal.Params.paramByName ( 'DATAINICIO' ).asSQLTimeStamp  := SQLInicioPeriodo  ;
  cdsSanidadeCondicaoCorporal.Params.paramByName ( 'DATAFIM' ).asSQLTimeStamp     := SQLFimPeriodo     ;

  // abre apenas as tabelas selecionadas para o grafico...
//  if ( gdProducao in FGraphicDataSelected ) then
  if ( [gdProducao, gdGordura, gdProteina] * FGraphicDataSelected ) <> [] then
    begin
      if ( FGraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
       TCDSSuppl.Open (  cdsPesagensLactacao )
     else
       TCDSSuppl.Open (  cdsPesagensPeriodo ) ;
    end;

  // abre apenas as tabelas selecionadas para o grafico...
  if ( [gdGordura, gdProteina, gdUreia, gdCCS] * FGraphicDataSelected ) <> [] then
    begin
      if ( FGraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
       TCDSSuppl.Open (  cdsAnalisesLactacao )
     else
       TCDSSuppl.Open (  cdsAnalisesPeriodo ) ;
    end;

  if ( gdBST in FGraphicDataSelected ) then
     TCDSSuppl.Open (  cdsBST ) ;

  if ( gdTrocaLote in FGraphicDataSelected ) then
     TCDSSuppl.Open (  cdsTrocaLote )  ;

  if (  gdAltura in  FGraphicDataSelected ) then
     TCDSSuppl.Open (  cdsCrescimentoAltura )   ;

  if ( gdPeso in FGraphicDataSelected ) then
    TCDSSuppl.Open (  cdsCrescimentoPeso ) ;

  if ( gdCiosMontaIA in FGraphicDataSelected ) then
    TCDSSuppl.Open (  cdsReprodutivo ) ;

  if ( gdDiagnosticos in  FGraphicDataSelected ) then
    TCDSSuppl.Open (  cdsSanidadeDiagnosticos ) ;

  if ( gdCondicaoCorporal in FGraphicDataSelected ) then
    TCDSSuppl.Open (  cdsSanidadeCondicaoCorporal )  ;

  // atualiza ultimos dados
  FLastKeyAnimal            := cdsDadosAnimalKZOO_ANIMAL_FEMEA.asString ;
  FLastGraphicDataSelected  := FGraphicDataSelected ;
  FLastInicioPeriodo        := FInicioPeriodo ;
  FLastFimPeriodo           := FFimPeriodo ;

end;

procedure TdtmZoo_GraficoLactacaoAnimal.OpenTables;
begin
   TCDSSuppl.SetMasterSource(cdsDadosAnimal, 'KZOO_ANIMAL_FEMEA', FMasterSource, 'KZOO_ANIMAL' ) ;
   TCDSSuppl.Open (  cdsDadosAnimal );
   TCDSSuppl.Open (  cdsLactacoes ) ;
end;

procedure TdtmZoo_GraficoLactacaoAnimal.SetGraphicDataSelected(
  const Value: TGraphicDataSelected);
begin
  FGraphicDataSelected := Value;
end;

procedure TdtmZoo_GraficoLactacaoAnimal.SetGraphicPeriodType(
  const Value: TGraphicPeriodType);
begin
  FGraphicPeriodType := Value;
end;

procedure TdtmZoo_GraficoLactacaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
