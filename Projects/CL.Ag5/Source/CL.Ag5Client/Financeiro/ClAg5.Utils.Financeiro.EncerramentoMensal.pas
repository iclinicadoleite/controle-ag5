unit ClAg5.Utils.Financeiro.EncerramentoMensal;

interface

uses   DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers
     , Tc.RTL.SmartPointer
     , Tc.DBRTL.AbstractDB ;

type
  TEncerramentoMensal = class ;
  IEncerramentoMensal = ISmartPointer<TEncerramentoMensal> ;
  TEncerramentoMensal = class
  private
    FIDB : ITcAbstractDB ;
    FTMPCDS : TClientDataSet ;
    FMaxAnoMesEncerramento: string ;
    procedure DoCreateEncerramentoIfNeed;
    function CheckNeedCreateEncerramento ( out AStartDate, AEndDate : TDateTime ) : boolean;
    procedure DoAbrirMesesEncerrados ;
    procedure DoEncerrarMeses;
  public
    constructor Create ( AIDB : ITcAbstractDB  ) ;
    destructor Destroy ; override ;
    class function New( AIDB : ITcAbstractDB  ) : IEncerramentoMensal ;
  end;

implementation

uses System.SysUtils
   , Data.DB, Tc.Data.DB.Helpers
   , Tc.VCL.Application ;

procedure TEncerramentoMensal.DoAbrirMesesEncerrados ;
const
  _SELECT_REABRIR_MESES =
      'SELECT'
  + #13#10'  ''EXECUTE PROCEDURE EST_REABRIR_MES(''''''|| KEST_ENCERRAMENTO_MES ||'''''')'' SQLSTMT'
  + #13#10' , ANO_MES' + #13#10'FROM EST_ENCERRAMENTO_MES'
  + #13#10'WHERE ENCERRADO = ''T'''
  + #13#10'ORDER BY ANO_MES DESC' ;
begin
  FTMPCDS := nil;
  FIDB.populateClientDataSet(FTMPCDS, _SELECT_REABRIR_MESES);
  with FTMPCDS do
  begin
    while not EOF do
    begin
      if (FieldByName('SQLSTMT').asString.Trim <> '') then
      begin
        if (FMaxAnoMesEncerramento = '') or (FieldByName('ANO_MES').asString > FMaxAnoMesEncerramento) then
          FMaxAnoMesEncerramento := FieldByName('ANO_MES').asString;
        FIDB.ExecuteDirect(FieldByName('SQLSTMT').asString);
      end;
      Next;
    end;
  end;
  FreeAndNil(FTMPCDS);
end;

constructor TEncerramentoMensal.Create ( AIDB : ITcAbstractDB  ) ;
begin
   FIDB := AIDB  ;
   FMaxAnoMesEncerramento := '';
   DoAbrirMesesEncerrados ;
end ;

destructor TEncerramentoMensal.Destroy ;
begin
  DoCreateEncerramentoIfNeed;
  DoEncerrarMeses;

   inherited ;

end ;

procedure TEncerramentoMensal.DoEncerrarMeses;
const
  _SELECT_ENCERRAR_MES =
             'SELECT'
      +#13#10' ''EXECUTE PROCEDURE EST_ENCERRAR_MES(''''''|| KEST_ENCERRAMENTO_MES ||'''''')'' SQLSTMT'
      +#13#10'FROM EST_ENCERRAMENTO_MES'
      +#13#10'WHERE ANO_MES <= :ANO_MES'
      +#13#10'ORDER BY ANO_MES' ;
var
  p : TParams ;
begin

   if ( FMaxAnoMesEncerramento <> '' )  then
     begin
      p := TParams.Create() ;
      p.CreateParam ( ftString, 'ANO_MES', ptInput ).asString := FMaxAnoMesEncerramento ;
      FIDB.populateClientDataSet( FTMPCDS, _SELECT_ENCERRAR_MES, p ) ;
      p.free ;
     end;

  if Assigned(FTMPCDS) then
    with FTMPCDS do
    begin
      while not EOF do
      begin
        if (FieldByName('SQLSTMT').asString.Trim <> '') then
          FIDB.ExecuteDirect(FieldByName('SQLSTMT').asString);
        Next;
      end;
      Free;
    end;
end;

class function TEncerramentoMensal.New(
  AIDB: ITcAbstractDB): IEncerramentoMensal;
begin
   Result := TSmartPointer<TEncerramentoMensal>( Create( AIDB ) ) ;
end;

procedure TEncerramentoMensal.DoCreateEncerramentoIfNeed;
var
  LStartDate: TDateTime;
  LEndDate: TDateTime;
  ISQL: ISQLSuppl;
begin
  if CheckNeedCreateEncerramento(LStartDate, LEndDate) then
  begin
    while LStartDate <= LEndDate do
    begin
      ISQL := FIDB.ISQL('EXECUTE PROCEDURE EST_CHECK_ENCERRAMENTO_MES ( :KDOMAIN, :DATA )');
      ISQL.SQLParam('KDOMAIN').asDateTime := LoggedUser.DomainID;
      ISQL.SQLParam('DATA').asDateTime := LStartDate;
      ISQL.SQLExec;
      IncMonth(LStartDate, 1);
    end;
  end;
end;


function TEncerramentoMensal.CheckNeedCreateEncerramento( out AStartDate, AEndDate : TDateTime ) : boolean;
var
  LAnoMesMovimento : string ;
  LAnoMesFechamento : string ;
begin

   LAnoMesMovimento := FIDB
      .ISQL('SELECT MIN(ANO_MES) FROM EST_MOVIMENTO')
      .GetDS.Fields[0].asString ;

   LAnoMesFechamento := FIDB
      .ISQL('SELECT MIN(ANO_MES) FROM EST_ENCERRAMENTO_MES')
      .GetDS.Fields[0].asString ;

   Result :=
       (LAnoMesMovimento <> '')
   and (   (LAnoMesFechamento = '')
        or (LAnoMesMovimento < LAnoMesFechamento)
       ) ;

   if Result then
     begin
       if ( LAnoMesFechamento = '' ) then
         LAnoMesFechamento := FIDB
           .ISQL('SELECT MAX(ANO_MES) FROM EST_MOVIMENTO')
           .GetDS.Fields[0].asString ;

       AStartDate := EncodeDate(
           LAnoMesFechamento.Substring( 0, 4  ).ToInteger
         , LAnoMesFechamento.Substring( 4, 2  ).ToInteger
         , 1
       ) ;

       AEndDate := EncodeDate(
           LAnoMesMovimento.Substring( 0, 4  ).ToInteger
         , LAnoMesMovimento.Substring( 4, 2  ).ToInteger
         , 1
       ) ;
     end;

end;

end.
