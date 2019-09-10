unit UZoo_AtividadesDiarioDaMastiteReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes,  Wrappers, QRAbsDatas ;

type

  TSpecificReportParams = ReportTypes.TReportDiarioMastite ; //SysReportTypes.TReportParams ; // substituir pela classe
                                                             // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TZoo_AtividadesDiarioDaMastiteReport = class(TfqrSYS_BaseReport)
    cdsTarefas: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TTcSQLDataSet;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    Image1: TQRImage;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrdbBrinco: TQRDBText;
    qrdbNome: TQRDBText;
    qrdbLote: TQRDBText;
    qrdbDPP: TQRDBText;
    qrdbDPS: TQRDBText;
    qrdbDataMastite: TQRDBText;
    qrdbMastite: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText11: TQRDBText;
    QRShape22: TQRShape;
    qrQuartoAD: TQRDBText;
    qrQuartoAE: TQRDBText;
    qrQuartoPD: TQRDBText;
    qrQuartoPE: TQRDBText;
    QRShape23: TQRShape;
    QRGroup: TQRGroup;
    qrShapeDiasSecar: TQRShape;
    QRShape25: TQRShape;
    QRImage2: TQRImage;
    qrImageLogo2: TQRImage;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    qrShapeTeto: TQRShape;
    QRDBDataPrevista: TQRDBText;
    qrdbNL: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRImage1: TQRImage;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape24: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRGroupFooter: TQRBand;
    QRShape1: TQRShape;
    procedure qrQuartoADPrint(sender: TObject; var Value: string);
    procedure qrQuartoAEPrint(sender: TObject; var Value: string);
    procedure qrQuartoPDPrint(sender: TObject; var Value: string);
    procedure qrQuartoPEPrint(sender: TObject; var Value: string);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure _qrsReportTitlePrint(sender: TObject; var Value: string);
    procedure QRDBText11Print(sender: TObject; var Value: string);
    procedure qrdbMastitePrint(sender: TObject; var Value: string);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure _qrsPageNumberTitlePrint(sender: TObject; var Value: string);
    procedure qrdbLotePrint(sender: TObject; var Value: string);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure rbColumnHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure rbPageFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    nGroup : integer ;
    nGroupPage : integer ;
    GroupPages : array of integer ;
    PagesGroup : array of integer ;
    FLastBrinco : string ;
    FLastMastite : string;
    FShowFuncionario : boolean ;
    FNewPage : boolean ;
    FPrepared : boolean ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    ProxXDias : Boolean ;

    { Public declarations }
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico,
     StrUtils,
     CLAg5Types, ClAg5ClientCommonTypes, ClAg5ClientZootecnicoCommonTypes ;

{$R *.dfm}

{ TfqrCustomReport }


class function TZoo_AtividadesDiarioDaMastiteReport.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TZoo_AtividadesDiarioDaMastiteReport.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.Initialize;
var
  LDiasGetacaoPrimipara, LDiasGetacaoMultipara : integer ;
  LDiasPrePartoSecarPrimipara, LDiasPrePartoSecarMultipara : integer ;
  LLastBrinco : string ;
  LLastDate : TDateTime ;
  LSame : boolean ;
begin

  qrImageLogo2.Picture.Assign( QRImageDomain.Picture );
  qrImageLogo2.Left    := QRImageDomain.Left ;
  qrImageLogo2.Top     := QRImageDomain.Top ;
  qrImageLogo2.Width   := QRImageDomain.Width ;
  qrImageLogo2.Height  := QRImageDomain.Height ;

  qrImageLogo2.Anchors  := QRImageDomain.Anchors    ;
  qrImageLogo2.AutoSize := QRImageDomain.AutoSize   ;
  qrImageLogo2.Center   := QRImageDomain.Center     ;

  //_qrsPageNumber.OnPrint := _qrsPageNumberPrint ;
  _qrsPageNumberTitle.OnPrint := _qrsPageNumberTitlePrint ;

  _qrsReportTitle2.Font.Assign( _qrsReportTitle.Font );

  QRGroup.Height := 0 ;

  nGroup := 0 ;

  Parameters.ForceHeader := True ;
  with TSpecificReportParams ( Parameters ), cdsTarefas.Params do
     begin
      QuickRep.ReportTitle  := ReportTitle;

    TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO,     LDiasGetacaoPrimipara,       LDiasGetacaoMultipara ) ;
    TParamMatriz.GetParam( LoggedUser.DomainID, _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR, LDiasPrePartoSecarPrimipara, LDiasPrePartoSecarMultipara ) ;

    cdsTarefas.Params.ParamByName ( 'DESCONSIDERAR_PRENHEZ'  ).asString  := ifThen ( ParametrosFazenda( LoggedUser.DomainID ).ExibirPartoSemConfirmacao, 'T', 'F' )  ;
    cdsTarefas.Params.ParamByName ( 'PREV_SECAGEM_PRIMIPARA' ).asInteger := LDiasGetacaoPrimipara - LDiasPrePartoSecarPrimipara ;
    cdsTarefas.Params.ParamByName ( 'PREV_SECAGEM_MULTIPARA' ).asInteger := LDiasGetacaoMultipara - LDiasPrePartoSecarMultipara ;
    cdsTarefas.Params.ParamByName ( 'KCAD_FAZENDA'           ).asString  := LoggedUser.DomainID ;
    cdsTarefas.Params.ParamByName ( 'STATUS_DESCARTADO'      ).asInteger := _ST_STATUS_ANIMAL_DESCARTADO ;

    cdsTarefas.Params.paramByName ( 'DATAFIM'      ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( EndOfTheDay( EndDate ) ) ;
    cdsTarefas.Params.paramByName ( 'PENDENTE'     ).AsInteger       := _ST_STATUS_TAREFA_PENDENTE ;
    cdsTarefas.Params.paramByName ( 'EXECUTADO'     ).AsInteger      := _ST_STATUS_TAREFA_EXECUTADA ;
    cdsTarefas.Params.paramByName ( 'TIPO_MASTITE'     ).AsInteger   := 3 ; //;
    cdsTarefas.Params.paramByName ( 'DESCARTE_LEITE'   ).AsInteger   := _ST_STATUS_TAREFA_DESCARTE_LEITE ;

    if KCAD_FUNCIONARIO = '' then
      begin
        FShowFuncionario := False ;
        QRGroup.Expression := 'DATAPROGRAMADA' ;
        cdsTarefas.Params.paramByName ( 'TODOS_FUNCIONARIOS'     ).AsString       := 'T' ;
        cdsTarefas.Params.paramByName ( 'KCAD_FUNCIONARIO'     ).AsString         := '' ;
        cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO'
      end
    else
       begin
        FShowFuncionario := True ;
        QRGroup.Expression := 'DATAPROGRAMADA+RESPONSAVEL' ;
        cdsTarefas.Params.paramByName ( 'TODOS_FUNCIONARIOS'     ).AsString       := 'F' ;
        cdsTarefas.Params.paramByName ( 'KCAD_FUNCIONARIO'     ).AsString         := KCAD_FUNCIONARIO ;
        cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;RESPONSAVEL;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO'
       end;


  //  cdsTarefas.Params.paramByName ( 'DESCARTE_LEITE'     ).AsInteger   := 5 ; //_ST_STATUS_TAREFA_DESCARTE_LEITE ;
  //  cdsTarefas.Params.paramByName ( 'DESCARTE_CARNE'     ).AsInteger   := 6 ; //_ST_STATUS_TAREFA_DESCARTE_CARNE ;


    LLastBrinco :=  ''  ;
    LLastDate   := 0 ;
    cdsTarefas.Open ;
    with cdsTarefas do
      begin
        while not eof do
           begin
             LSame :=  (LLastBrinco = FieldByName('BRINCOFEMEA').asString)
                   and (LLastDate   = FieldByName('DATAPROGRAMADA').asDateTime);
             LLastBrinco := FieldByName('BRINCOFEMEA').asString ;
             LLastDate   := FieldByName('DATAPROGRAMADA').asDateTime;
             if  LSame
              and (FieldByName('TIPOTAREFA').asInteger = _ST_STATUS_TAREFA_DESCARTE_LEITE) then
               Delete
             else
               next ;
           end;
      end;
    cdsTarefas.First ;
  end ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;

  FPrepared := False ;
  QuickRep.Prepare ;
  FPrepared := True ;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.QRDBText11Print(sender: TObject;
  var Value: string);
var
  LTarefaEmAtrazo : boolean ;
  LDataDescarte : TDateTime ;
begin

  EXIT ;

  LDataDescarte := 0 ;
  LTarefaEmAtrazo := cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsDateTime < Date ;

  if (LTarefaEmAtrazo) and ( cdsTarefas.FieldByName( 'DESCARTELEITE' ).asInteger > 0 ) then
     LDataDescarte := Date + cdsTarefas.FieldByName( 'DESCARTELEITE' ).asInteger ;

  if cdsTarefas.FieldByName( 'DATA_ULTIMO_DESCARTE' ).asDateTime > LDataDescarte then
     LDataDescarte := cdsTarefas.FieldByName( 'DATA_ULTIMO_DESCARTE' ).asDateTime  ;

  if LDataDescarte = 0 then
     Value := '-'
  else
     Value := FormatDateTime ( 'dd/mm/yyyy', cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsDateTime ) ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrdbLotePrint(sender: TObject;
  var Value: string);
begin
  Value := Trim ( Value ) ;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrdbMastitePrint(sender: TObject;
  var Value: string);
var
  LValue : string ;
begin
  LValue := StringReplace ( Value.Trim, 'Mastite', '', [rfIgnoreCase] ) ;
  if LValue <> '' then
     Value := LValue ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.QRDBText8Print(sender: TObject;
  var Value: string);
begin
  inherited;
  if not FShowFuncionario then
    Value := '' ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.QRGroupAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not FPrepared then
    begin
       inc ( nGroup ) ;
       SetLength ( GroupPages, nGroup ) ;
    end;
  nGroupPage := 0 ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrQuartoADPrint(sender: TObject;
  var Value: string);
begin
  if Value = '1' then
     Value := 'X'
  else
     Value := '' ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrQuartoAEPrint(sender: TObject;
  var Value: string);
begin
  if Value = '2' then
     Value := 'X'
  else
     Value := '' ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrQuartoPDPrint(sender: TObject;
  var Value: string);
begin
  if Value = '3' then
     Value := 'X'
  else
     Value := '' ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.qrQuartoPEPrint(sender: TObject;
  var Value: string);
begin
  if Value = '4' then
     Value := 'X'
  else
     Value := '' ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  FLastBrinco  := '' ;
  FLastMastite := '' ;
  nGroup       := 0 ;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.rbColumnHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  FNewPage := True ;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport.rbDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
 LSame : boolean ;
 LPrintBand : boolean ;
begin
  inherited;
  Image1.Enabled := cdsTarefas.FieldByName( 'ATRASADA' ).asString = 'T' ;
  QRDBDataPrevista.Enabled := cdsTarefas.FieldByName( 'ATRASADA' ).asString = 'T' ;

  LSame := (not FNewPage)
       and (FLastBrinco = cdsTarefas.FieldByName('BRINCOFEMEA').asString) ;

  FNewPage := False ;

//  LPrintBand := (cdsTarefas.FieldByName('TIPOTAREFA').asInteger <> _ST_STATUS_TAREFA_DESCARTE_LEITE)
//            or not LSame ;

//  PrintBand := LPrintBand ;

  if not LSame then
     FLastMastite := '' ;

  qrdbBrinco.Enabled := not LSame ;
  qrdbNome.Enabled := not LSame ;
  qrdbLote.Enabled := not LSame ;
  qrdbNL.Enabled := not LSame ;
  qrdbDPP.Enabled := not LSame ;
  qrdbDPS.Enabled := not LSame ;

  QRShapeDiasSecar.Enabled := not LSame ;

  FLastBrinco := cdsTarefas.FieldByName('BRINCOFEMEA').asString ;

  LSame  := FLastMastite
          = formatDateTime ( 'yymmdd', cdsTarefas.FieldByName('DATA_MASTITE').asDateTime )
          + cdsTarefas.FieldByName('CODIGO_MASTITE').asString
          + cdsTarefas.FieldByName('QUARTO').asString ;

  qrdbDataMastite.Enabled := not LSame ;
  qrdbMastite.Enabled := not LSame ;

  qrQuartoAD.Enabled  := not LSame ;
  qrQuartoAE.Enabled  := not LSame ;
  qrQuartoPD.Enabled  := not LSame ;
  qrQuartoPE.Enabled  := not LSame ;
  qrShapeTeto.Enabled := not LSame ;

  FLastMastite := formatDateTime ( 'yymmdd', cdsTarefas.FieldByName('DATA_MASTITE').asDateTime )
                + cdsTarefas.FieldByName('CODIGO_MASTITE').asString
                + cdsTarefas.FieldByName('QUARTO').asString ;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.rbPageFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Inc ( nGroupPage ) ;
  if not FPrepared then
    begin
      GroupPages[ nGroup - 1 ] := nGroupPage ;
      SetLength ( PagesGroup,  QuickRep.PageNumber ) ;
      PagesGroup[ QuickRep.PageNumber -1 ] := nGroup ;
    end;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport._qrsPageNumberTitlePrint(
  sender: TObject; var Value: string);
var
  LTotalPages : integer ;
begin
  if FPrepared then
    begin
      LTotalPages := GroupPages[ PagesGroup[ QuickRep.PageNumber - 1 ] -1 ] ;
      Value := nGroupPage.ToString +  '/' + LTotalPages.ToString ;
    end;
end;

procedure TZoo_AtividadesDiarioDaMastiteReport._qrsReportTitlePrint(
  sender: TObject; var Value: string);
begin
  Value :=  'Diário de Ordenha - ' + FormatDateTime ( 'dd/mm/yyyy', cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsDateTime  ) ;
end;

end.
