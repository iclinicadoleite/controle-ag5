unit UFin_MovimentacaoContasDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Datasnap.Provider, Data.SqlExpr, DateUtils, SqlTimSt, ReportTypes, SysReportTypes,
  Dialogs,
  Wrappers;


type
  TSpecificReportParams = ReportTypes.TReportParamsContasBancarias ; // substituir pela classe
                                                         // de parametros do relatorio

  TFIN_MovimentacaoContasDataModule = class(TDataModule)
    cdsMovimentacao: TClientDataSet;
    cdsMovimentacaoKFIN_CONTA: TStringField;
    cdsMovimentacaoNOMECONTA: TStringField;
    cdsMovimentacaoBANCO: TStringField;
    cdsMovimentacaoAGENCIA: TStringField;
    cdsMovimentacaoCONTA_CORRENTE: TStringField;
    cdsMovimentacaoPAGTO: TSQLTimeStampField;
    cdsMovimentacaoDT_COMPENSACAO: TSQLTimeStampField;
    cdsMovimentacaoHISTORICO: TStringField;
    cdsMovimentacaoDOCUMENTO: TStringField;
    cdsMovimentacaoCHEQUE: TStringField;
    cdsMovimentacaoCREDITO: TFloatField;
    cdsMovimentacaoDEBITO: TFloatField;
    cdsSaldoContas: TClientDataSet;
    cdsSaldoContasKFIN_CONTA: TStringField;
    cdsSaldoContasNOME: TStringField;
    cdsSaldoContasSALDOCC: TFloatField;
    cdsMovimentacaoSALDO: TFloatField;
    cdsMovimentacaoTIPOREG: TIntegerField;
    cdsMovimentacaoBANCO_: TStringField;
    cdsMovimentacaoAGENCIA_: TStringField;
    cdsMovimentacaoCONTA_CORRENTE_: TStringField;
    cdsMovimentacaoDT_COMPENSACAO_: TSQLTimeStampField;
    cdsMovimentacaoDB_KEY: TIntegerField;
    procedure cdsMovimentacaoCHEQUEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMovimentacaoCREDITODEBITOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMovimentacaoNOMECONTAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMovimentacaoEmptyGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMovimentacaoDATAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FSysDomain: String;
    FDataini: TDateTime;
    FDataFim: TDateTime;
    FContas: TStringList;
    //FContas: TContasBancarias;
    Where: TStringList;
    FSaldoTotal : double ;
    procedure SetDataIni (const AValue: TDateTime);
    procedure SetDataFim (const AValue: TDateTime);
    procedure SetSysDomain (const AValue: String);
    procedure GetSaldoContas;
    procedure PrepareMovimentacao;
    procedure FiltroPorContaBancaria;
    procedure AcertaSaldo;
  public
    { Public declarations }
    ContasBancarias: TContasBancarias;
    property SysDomain: String read FSysDomain write SetSysDomain;
    property Dataini: TDateTime read FDataIni write SetDataIni;
    property DataFim: TDateTime read FDataFim write SetDataFim;
    property SaldoTotal : double read FSaldoTotal ;
    procedure Execute;
  end;

const
      _TIPO_MOV_BANCARIA_CABECALHO    = 1;
      _TIPO_MOV_BANCARIA_ITENS        = 2;
      _TIPO_MOV_BANCARIA_TOTAL_ITENS  = 3;

      _ORDER_INDEX = 'KFIN_CONTA;TIPOREG;DT_COMPENSACAO_' ;
      _DEF_INDEX = 'KFIN_CONTA;TIPOREG;DT_COMPENSACAO_;DB_KEY' ;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Tc.DBRTL.AbstractDB, UDBfinanceiro ;


{ TFIN_MovimentacaoContasDataModule }



procedure TFIN_MovimentacaoContasDataModule.SetDataFim(const AValue: TDateTime);
begin
  FDataFim := AValue;
end;

procedure TFIN_MovimentacaoContasDataModule.SetDataIni(const AValue: TDateTime);
begin
  FDataIni := AValue;
end;

procedure TFIN_MovimentacaoContasDataModule.SetSysDomain(const AValue: String);
begin
  FSysDomain := AValue;
end;


procedure TFIN_MovimentacaoContasDataModule.AcertaSaldo;
var
  LastConta, NomeConta,
  Banco_, Agencia_, ContaCorrente_,
  Banco, Agencia, ContaCorrente: String;
  LSaldo, LDebitos, LCreditos : Double ;
  LRecno : integer ;
begin

  FSaldoTotal := 0 ;
  with cdsMovimentacao do
    begin
      IndexFieldNames := _ORDER_INDEX ;
      First;
      LSaldo    := 0.00 ;
      while not Eof do
        begin
          LRecno := cdsMovimentacao.Recno ;
          if cdsMovimentacaoTipoReg.asInteger = _TIPO_MOV_BANCARIA_CABECALHO then
            begin
              LDebitos  := 0.00 ;
              LCreditos := 0.00 ;
              LSaldo := cdsMovimentacaoSALDO.AsFloat ;
              Edit;
              cdsMovimentacaoBANCO_.asString          := cdsMovimentacaoBANCO.asString + '.' ;
              cdsMovimentacaoAGENCIA_.asString        := cdsMovimentacaoAGENCIA.asString + '.' ;
              cdsMovimentacaoCONTA_CORRENTE_.asString := cdsMovimentacaoCONTA_CORRENTE.asString + '.' ;
              cdsMovimentacaoDB_KEY.asInteger         := LRecno ;
              Post;
            end
          else
            begin
              LCreditos := LCreditos + cdsMovimentacaoCREDITO.AsFloat ;
              LDebitos  := LDebitos  + cdsMovimentacaoDEBITO.AsFloat ;
              LSaldo    := LSaldo    + (cdsMovimentacaoCREDITO.AsFloat - cdsMovimentacaoDEBITO.AsFloat);
              Edit;
              cdsMovimentacaoBANCO_.asString          := cdsMovimentacaoBANCO.asString + '.' ;
              cdsMovimentacaoAGENCIA_.asString        := cdsMovimentacaoAGENCIA.asString + '.' ;
              cdsMovimentacaoCONTA_CORRENTE_.asString := cdsMovimentacaoCONTA_CORRENTE.asString + '.' ;
              cdsMovimentacaoDB_KEY.asInteger         := LRecno ;
              cdsMovimentacaoSALDO.AsFloat            := LSaldo ;
              Post;
            end ;

          if cdsMovimentacaoTipoReg.asInteger = _TIPO_MOV_BANCARIA_TOTAL_ITENS then
            begin
              Edit;
              cdsMovimentacaoBANCO_.asString          := cdsMovimentacaoBANCO.asString + '.' ;
              cdsMovimentacaoAGENCIA_.asString        := cdsMovimentacaoAGENCIA.asString + '.' ;
              cdsMovimentacaoCONTA_CORRENTE_.asString := cdsMovimentacaoCONTA_CORRENTE.asString + '.';
              cdsMovimentacaoDB_KEY.asInteger         := LRecno ;
              cdsMovimentacaoCREDITO.AsFloat          := LCreditos ;
              cdsMovimentacaoDEBITO.AsFloat           := LDebitos  ;
              Post ;
              FSaldoTotal := FSaldoTotal + LSaldo ;
            end;

          Next;
        end;
      First;
    end;

end;

procedure TFIN_MovimentacaoContasDataModule.cdsMovimentacaoEmptyGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if DisplayText then
     if Sender.ASString = '-' then
      Text := ''
     else
      Text := Sender.ASString
end;

procedure TFIN_MovimentacaoContasDataModule.cdsMovimentacaoCHEQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if (cdsMovimentacaoTIPOREG.AsInteger in
       [
            _TIPO_MOV_BANCARIA_CABECALHO
          , _TIPO_MOV_BANCARIA_TOTAL_ITENS
       ]
    ) then
       Text := ''
    else if Sender.AsString = 'T' then
       Text := 'Sim'
    else
       Text := 'Não'
end;

procedure TFIN_MovimentacaoContasDataModule.cdsMovimentacaoCREDITODEBITOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if cdsMovimentacaoTIPOREG.AsInteger = _TIPO_MOV_BANCARIA_CABECALHO then
      Text := ''
    else if Sender.IsNull then
      Text := ' - '
    else
      Text := FormatFloat('#,0.00',Sender.AsFloat);// Sender.AsString;
end;

procedure TFIN_MovimentacaoContasDataModule.cdsMovimentacaoDATAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if DisplayText then
     if not ( cdsMovimentacaoTIPOREG.AsInteger in
         [
            _TIPO_MOV_BANCARIA_CABECALHO
          , _TIPO_MOV_BANCARIA_TOTAL_ITENS
         ]
     ) then
      Text := Sender.ASString
end;

procedure TFIN_MovimentacaoContasDataModule.cdsMovimentacaoNOMECONTAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    if ( cdsMovimentacaoTIPOREG.AsInteger
       = _TIPO_MOV_BANCARIA_TOTAL_ITENS
    )
    then
       Text := ''
    else
       Text := Sender.asString
end;

procedure TFIN_MovimentacaoContasDataModule.Execute;
begin

  Where:= TStringList.Create;
  FContas:= TStringList.Create;

  cdsMovimentacao.Close;
  cdsMovimentacao.DisableControls;
  GetSaldoContas;
  PrepareMovimentacao;
  AcertaSaldo;

  cdsMovimentacao.EnableControls;
  where.Free;
  FContas.Free;

end;

procedure TFIN_MovimentacaoContasDataModule.FiltroPorContaBancaria;
var
  i : integer;
  StrIn : string ;
begin
   StrIn := '' ;
   for i := low( ContasBancarias ) to High( ContasBancarias ) do
      begin
        if ContasBancarias[ i ] <> EmptyStr then
          StrIn := StrIn + QuotedStr( ContasBancarias[ i ] ) + ',';
      end;

  if ( StrIn <> EmptyStr ) then
    begin
      StrIn := Copy( StrIn, 1, length( StrIn ) - 1 );
      Where.Add( Format( ' AND C.KFIN_CONTA IN ( %s ) ', [ StrIn ] ) ) ;
    end;
end;

procedure TFIN_MovimentacaoContasDataModule.GetSaldoContas;
const
  _SALDO_CONTAS = 'SELECT'
          + #13#10'CC.KFIN_CONTA,'
          + #13#10'CC.NOME,'
          + #13#10'COALESCE ( CC.SALDOINICIAL, 0.00 )'
          + #13#10'   + COALESCE ( ( SELECT SUM ( R.PAGO  ) FROM FIN_ARECEBER_PARCELAS  R'
          + #13#10'                   WHERE R.KFIN_CONTA = CC.KFIN_CONTA AND R.PAGTO IS NOT NULL '
          + #13#10'                     AND R.DT_COMPENSACAO < :DATAINI '
          + #13#10'                 ), 0.00 )'
          + #13#10'   - COALESCE ( ( SELECT SUM ( A.PAGO ) FROM FIN_APAGAR_PARCELAS A'
          + #13#10'                   WHERE A.KFIN_CONTA = CC.KFIN_CONTA AND A.PAGTO IS NOT NULL '
          + #13#10'                     AND A.DT_COMPENSACAO < :DATAINI '
          + #13#10'                 ), 0.00 ) SALDOCC'
          + #13#10'FROM FIN_CONTAS CC'
          + #13#10'WHERE CC.KSYS$DOMAIN = :KSYS$DOMAIN '
          + #13#10'ORDER BY KFIN_CONTA ';
var
  p   : TParams;
begin
  p := TParams.Create ;
  P.CreateParam( ftTimeStamp, 'DATAINI', ptInput ).AsSQLTimeStamp := DateTimeToSQLTimeStamp( DataIni ) ;
  p.CreateParam( ftString, 'KSYS$DOMAIN' , ptInput ).AsString     := SysDomain;
  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cdsSaldoContas, _SALDO_CONTAS, p );
  p.Free;
end;

procedure TFIN_MovimentacaoContasDataModule.PrepareMovimentacao;
const
  _SALDO_CONTAS =
                 'SELECT'
          +#13#10'   C.KFIN_CONTA'
          +#13#10' , %d TIPOREG'
          +#13#10' , (CAST(:DATAINI AS TIMESTAMP) -1) DT_COMPENSACAO_'
///          +#13#10' , COALESCE(NULLIF(COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,''''),''''), ''-'') BANCO_'
///          +#13#10' , COALESCE(C.AGENCIA,''-'') AGENCIA_'
///          +#13#10' , COALESCE(C.CONTA_CORRENTE,''-'') CONTA_CORRENTE_'
          +#13#10' , C.NOME NOMECONTA'
          +#13#10' , COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,'''') BANCO'
          +#13#10' , C.AGENCIA AGENCIA'
          +#13#10' , C.CONTA_CORRENTE CONTA_CORRENTE'
          +#13#10' , (CAST(:DATAINI AS TIMESTAMP) -1) PAGTO'
          +#13#10' , (CAST(:DATAINI AS TIMESTAMP) -1) DT_COMPENSACAO'
          +#13#10' , ''Saldo anterior'' HISTORICO'
          +#13#10' , ''-'' DOCUMENTO'
          +#13#10' , ''-'' CHEQUE'
          +#13#10' , CAST ( 0.00 AS DOUBLE PRECISION) CREDITO'
          +#13#10' , CAST ( 0.00 AS DOUBLE PRECISION) DEBITO'
          +#13#10' , COALESCE ( C.SALDOINICIAL, 0.00 )'
          +#13#10' + COALESCE ( ( SELECT SUM ( R.PAGO  ) FROM FIN_ARECEBER_PARCELAS  R'
          +#13#10'                 WHERE R.KFIN_CONTA = C.KFIN_CONTA AND R.PAGTO IS NOT NULL '
          +#13#10'                   AND R.DT_COMPENSACAO < :DATAINI '
          +#13#10'               ), 0.00 )'
          +#13#10' - COALESCE ( ( SELECT SUM ( A.PAGO ) FROM FIN_APAGAR_PARCELAS A'
          +#13#10'                 WHERE A.KFIN_CONTA = C.KFIN_CONTA AND A.PAGTO IS NOT NULL '
          +#13#10'                   AND A.DT_COMPENSACAO < :DATAINI '
          +#13#10'               ), 0.00 ) SALDO'
          +#13#10'FROM FIN_CONTAS C'
          +#13#10'LEFT JOIN FIN_BANCOS B USING ( KFIN_BANCO )'
          +#13#10'WHERE C.KSYS$DOMAIN = :KSYS$DOMAIN '
          +#13#10'  %s' ;


  _SQL_CREDITOS =
              'SELECT '
       +#13#10'   C.KFIN_CONTA'
       +#13#10' , %d TIPOREG'
       +#13#10' , P.DT_COMPENSACAO DT_COMPENSACAO_'
///       +#13#10' , COALESCE(NULLIF(COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,''''),''''), ''-'') BANCO_'
///       +#13#10' , COALESCE(C.AGENCIA,''-'') AGENCIA_'
///       +#13#10' , COALESCE(C.CONTA_CORRENTE,''-'') CONTA_CORRENTE_'
       +#13#10' , C.NOME NOMECONTA'
       +#13#10' , COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,'''') BANCO'
       +#13#10' , C.AGENCIA AGENCIA'
       +#13#10' , C.CONTA_CORRENTE CONTA_CORRENTE'
       +#13#10' , P.PAGTO'
       +#13#10' , P.DT_COMPENSACAO'
       +#13#10' , R.HISTORICO'
       +#13#10' , COALESCE(P.DOCUMENTO,''-'') DOCUMENTO'
       +#13#10' , P.CHEQUE'
       +#13#10' , P.PAGO CREDITO'
       +#13#10' , CAST( NULL AS DOUBLE PRECISION ) DEBITO'
       +#13#10' , CAST( NULL AS DOUBLE PRECISION) SALDO'
       +#13#10'FROM FIN_ARECEBER R'
       +#13#10'LEFT JOIN FIN_ARECEBER_PARCELAS P USING ( KFIN_ARECEBER )'
       +#13#10'LEFT JOIN FIN_CONTAS C USING ( KFIN_CONTA )'
       +#13#10'LEFT JOIN FIN_BANCOS B USING ( KFIN_BANCO )'
       +#13#10'WHERE R.KSYS$DOMAIN = :KSYS$DOMAIN'
       +#13#10'  AND R.ATIVO = ''T'''
       +#13#10'  AND P.PAGTO IS NOT NULL'
       +#13#10'  AND P.DT_COMPENSACAO BETWEEN :DATAINI AND :DATAFIM'
       +#13#10'  %s' ;

  _SQL_DEBITOS =
              'SELECT '
       +#13#10'   C.KFIN_CONTA'
       +#13#10' , %d TIPOREG'
       +#13#10' , P.DT_COMPENSACAO DT_COMPENSACAO_'
///       +#13#10' , COALESCE(NULLIF(COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,''''),''''), ''-'') BANCO_'
///       +#13#10' , COALESCE(C.AGENCIA, ''-'') AGENCIA_'
///       +#13#10' , COALESCE(C.CONTA_CORRENTE,''-'') CONTA_CORRENTE_'
       +#13#10' , C.NOME NOMECONTA'
       +#13#10' , COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,'''') BANCO'
       +#13#10' , C.AGENCIA AGENCIA'
       +#13#10' , C.CONTA_CORRENTE CONTA_CORRENTE'
       +#13#10' , P.PAGTO'
       +#13#10' , P.DT_COMPENSACAO'
       +#13#10' , A.HISTORICO'
       +#13#10' , COALESCE(P.DOCUMENTO,''-'') DOCUMENTO'
       +#13#10' , P.CHEQUE'
       +#13#10' , CAST( NULL AS DOUBLE PRECISION ) CREDITO'
       +#13#10' , P.PAGO DEBITO'
       +#13#10' , CAST( NULL AS DOUBLE PRECISION) SALDO'
       +#13#10'FROM  FIN_APAGAR A'
       +#13#10'LEFT JOIN  FIN_APAGAR_PARCELAS P USING ( KFIN_APAGAR )'
       +#13#10'LEFT JOIN FIN_CONTAS C USING ( KFIN_CONTA )'
       +#13#10'LEFT JOIN FIN_BANCOS B USING ( KFIN_BANCO )'
       +#13#10'WHERE A.KSYS$DOMAIN = :KSYS$DOMAIN'
       +#13#10'  AND A.ATIVO = ''T'''
       +#13#10'  AND P.PAGTO IS NOT NULL'
       +#13#10'  AND P.DT_COMPENSACAO BETWEEN :DATAINI AND :DATAFIM'
       +#13#10'  %s' ;

  _FOOTER_CONTAS =
                 'SELECT'
          +#13#10'   C.KFIN_CONTA'
          +#13#10' , %d TIPOREG'
          +#13#10' , (CAST(:DATAFIM AS TIMESTAMP) +1) DT_COMPENSACAO_'
///          +#13#10' , COALESCE(NULLIF(COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,''''),''''), ''-'') BANCO_'
///          +#13#10' , COALESCE(C.AGENCIA,''-'') AGENCIA_'
///          +#13#10' , COALESCE(C.CONTA_CORRENTE,''-'') CONTA_CORRENTE_'
          +#13#10' , C.NOME NOMECONTA'
          +#13#10' , COALESCE(B.CODIGO,'''') || COALESCE('' - '' || B.NOME,'''') BANCO'
          +#13#10' , C.AGENCIA AGENCIA'
          +#13#10' , C.CONTA_CORRENTE CONTA_CORRENTE'
          +#13#10' , (CAST(:DATAFIM AS TIMESTAMP) +1) PAGTO'
          +#13#10' , (CAST(:DATAFIM AS TIMESTAMP) +1) DT_COMPENSACAO'
          +#13#10' , ''Total '' || C.NOME HISTORICO'
          +#13#10' , ''-'' DOCUMENTO'
          +#13#10' , ''-'' CHEQUE'
          +#13#10' , CAST ( NULL AS DOUBLE PRECISION ) CREDITO'
          +#13#10' , CAST ( NULL AS DOUBLE PRECISION ) DEBITO'
          +#13#10' , CAST ( NULL AS DOUBLE PRECISION ) SALDO'
          +#13#10'FROM FIN_CONTAS C'
          +#13#10'LEFT JOIN FIN_BANCOS B USING ( KFIN_BANCO )'
          +#13#10'WHERE C.KSYS$DOMAIN = :KSYS$DOMAIN'
          +#13#10'  %s' ;

  _UNION =   '%s'
      +#13#10'UNION ALL'#13#10
      +      '%s'
      +#13#10'UNION ALL'#13#10
      +      '%s'
      +#13#10'UNION ALL'#13#10
      +      '%s'
      +#13#10'ORDER BY 1, 2, 3, 4' ;

var
  P : TParams ;
  LSQLStmt : string ;
  LWhereText : string ;
begin
  cdsSaldoContas.IndexName := '' ;

  FiltroPorContaBancaria;

  LWhereText := Where.Text ;

  LSQLStmt := Format(
       _UNION
     , [
          Format( _SALDO_CONTAS, [_TIPO_MOV_BANCARIA_CABECALHO,   LWhereText ])
        , Format( _SQL_CREDITOS, [_TIPO_MOV_BANCARIA_ITENS,       LWhereText ])
        , Format( _SQL_DEBITOS,  [_TIPO_MOV_BANCARIA_ITENS,       LWhereText ])
        , Format( _FOOTER_CONTAS,[_TIPO_MOV_BANCARIA_TOTAL_ITENS, LWhereText ])
      ]
  ) ;

  P := TParams.Create ;
  p.createParam ( ftString,   'KSYS$DOMAIN', ptInput ).asString  := SysDomain;
  p.createParam ( ftDateTime, 'DATAINI',     ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( Dataini ) ) ;
  p.createParam ( ftDateTime, 'DATAFIM',     ptInput ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( DataFim ) ) ;

  TTcAbstractDB.GetByAlias('FINANCEIRO').populateClientDataSet( cdsMovimentacao, LSQLStmt, p );

  p.Free;

end;

end.



