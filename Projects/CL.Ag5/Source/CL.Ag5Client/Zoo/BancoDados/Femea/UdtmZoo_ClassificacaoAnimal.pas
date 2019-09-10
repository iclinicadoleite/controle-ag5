unit UdtmZoo_ClassificacaoAnimal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, Datasnap.Provider, Data.SqlExpr, Tc.Data.SQLExpr, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, UdtmSYS_BASE;

type
  TdtmZoo_ClassificacaoAnimal = class(T_dtmBASE)
    cdsClassificacao: TClientDataSet;
    cdsClassificacaoKZOO_ANIMAL_CLASSIFICACAO: TStringField;
    cdsClassificacaoKZOO_ANIMAL: TStringField;
    cdsClassificacaoDATA: TSQLTimeStampField;
    sqlClassificacao: TTcSQLDataSet;
    sqlClassificacaoKZOO_ANIMAL_CLASSIFICACAO: TStringField;
    sqlClassificacaoKZOO_ANIMAL: TStringField;
    sqlClassificacaoDATA: TSQLTimeStampField;
    dspClassificacao: TDataSetProvider;
    sqlClassificacaoFL_ESTATURA: TStringField;
    sqlClassificacaoFL_NIVELAMENTOLINHASUPERIOR: TStringField;
    sqlClassificacaoFL_LARGURAPEITO: TStringField;
    sqlClassificacaoFL_PROFUNDIDADECORPORAL: TStringField;
    sqlClassificacaoFL_ANGULOSIDADE: TStringField;
    sqlClassificacaoFL_ESCORECORPORAL: TStringField;
    sqlClassificacaoFL_PONTUACAO: TStringField;
    sqlClassificacaoGP_ANGULOGARUPA: TStringField;
    sqlClassificacaoGP_LARGURAGARUPA: TStringField;
    sqlClassificacaoGP_FORCALOMBO: TStringField;
    sqlClassificacaoGP_PONTUACAO: TStringField;
    sqlClassificacaoPP_ANGULOCASCO: TStringField;
    sqlClassificacaoPP_PROFUNDIDADETALAO: TStringField;
    sqlClassificacaoPP_QTDEOSSEA: TStringField;
    sqlClassificacaoPP_POSTERIORVISTALATERAL: TStringField;
    sqlClassificacaoPP_POSTERIORVISTAPOSTERIOR: TStringField;
    sqlClassificacaoPP_PONTUACAO: TStringField;
    sqlClassificacaoSM_PROFUNDIDADEUBERE: TStringField;
    sqlClassificacaoSM_TEXTURAUBERE: TStringField;
    sqlClassificacaoSM_LIGAMENTOMEDIO: TStringField;
    sqlClassificacaoSM_INSERCAOUBEREANTERIOR: TStringField;
    sqlClassificacaoSM_COLOCACAOTETOSANTERIRORES: TStringField;
    sqlClassificacaoSM_ALTURAUBEREPOSTERIOR: TStringField;
    sqlClassificacaoSM_LARGURAUBEREPOSTERIOR: TStringField;
    sqlClassificacaoSM_COLOCACAOTETOSPOSTERIORES: TStringField;
    sqlClassificacaoSM_COMPRIMENTOTETOS: TStringField;
    sqlClassificacaoSM_PONTUACAO: TStringField;
    sqlClassificacaoAF_DEFEITOS: TMemoField;
    sqlClassificacaoAF_PONTUACAOFINAL: TSmallintField;
    sqlClassificacaoAF_ENQUADRAMENTOCLASSE: TStringField;
    sqlClassificacaoAF_OBS: TMemoField;
    cdsClassificacaoFL_ESTATURA: TStringField;
    cdsClassificacaoFL_NIVELAMENTOLINHASUPERIOR: TStringField;
    cdsClassificacaoFL_LARGURAPEITO: TStringField;
    cdsClassificacaoFL_PROFUNDIDADECORPORAL: TStringField;
    cdsClassificacaoFL_ANGULOSIDADE: TStringField;
    cdsClassificacaoFL_ESCORECORPORAL: TStringField;
    cdsClassificacaoFL_PONTUACAO: TStringField;
    cdsClassificacaoGP_ANGULOGARUPA: TStringField;
    cdsClassificacaoGP_LARGURAGARUPA: TStringField;
    cdsClassificacaoGP_FORCALOMBO: TStringField;
    cdsClassificacaoGP_PONTUACAO: TStringField;
    cdsClassificacaoPP_ANGULOCASCO: TStringField;
    cdsClassificacaoPP_PROFUNDIDADETALAO: TStringField;
    cdsClassificacaoPP_QTDEOSSEA: TStringField;
    cdsClassificacaoPP_POSTERIORVISTALATERAL: TStringField;
    cdsClassificacaoPP_POSTERIORVISTAPOSTERIOR: TStringField;
    cdsClassificacaoPP_PONTUACAO: TStringField;
    cdsClassificacaoSM_PROFUNDIDADEUBERE: TStringField;
    cdsClassificacaoSM_TEXTURAUBERE: TStringField;
    cdsClassificacaoSM_LIGAMENTOMEDIO: TStringField;
    cdsClassificacaoSM_INSERCAOUBEREANTERIOR: TStringField;
    cdsClassificacaoSM_COLOCACAOTETOSANTERIRORES: TStringField;
    cdsClassificacaoSM_ALTURAUBEREPOSTERIOR: TStringField;
    cdsClassificacaoSM_LARGURAUBEREPOSTERIOR: TStringField;
    cdsClassificacaoSM_COLOCACAOTETOSPOSTERIORES: TStringField;
    cdsClassificacaoSM_COMPRIMENTOTETOS: TStringField;
    cdsClassificacaoSM_PONTUACAO: TStringField;
    cdsClassificacaoAF_DEFEITOS: TMemoField;
    cdsClassificacaoAF_PONTUACAOFINAL: TSmallintField;
    cdsClassificacaoAF_ENQUADRAMENTOCLASSE: TStringField;
    cdsClassificacaoAF_OBS: TMemoField;
    procedure cdsClassificacaoNewRecord(DataSet: TDataSet);
    procedure OnValidate(Sender: TField);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    procedure OpenTables ; Override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses CDSSuppl, Exceptions, UDBZootecnico;

{$R *.dfm}

{ TdtmZoo_ClassificacaoAnimal }

procedure TdtmZoo_ClassificacaoAnimal.cdsClassificacaoNewRecord(
  DataSet: TDataSet);
begin
  GetKey ( cdsClassificacaoKZOO_ANIMAL_CLASSIFICACAO ) ;
  cdsClassificacaoKZOO_ANIMAL.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
end;

procedure TdtmZoo_ClassificacaoAnimal.OnValidate(Sender: TField);
begin
  if ( Sender.AsInteger < 1 ) or ( Sender.AsInteger > 9 )then
    raise Warning.Create( Sender.DisplayLabel + ' - valor inválido.'+ #13#10 + 'Deve ser entre 1 e 9.');
end;

procedure TdtmZoo_ClassificacaoAnimal.OpenTables;
begin
  inherited;
  TCDSSuppl.SetMasterSource(cdsClassificacao, 'KZOO_ANIMAL', FMasterSource, 'KZOO_ANIMAL' ) ;
  TCDSSuppl.Open (  cdsClassificacao ) ;
end;

procedure TdtmZoo_ClassificacaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.



