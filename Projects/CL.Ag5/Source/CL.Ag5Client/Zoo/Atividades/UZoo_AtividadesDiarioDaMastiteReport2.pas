unit UZoo_AtividadesDiarioDaMastiteReport2;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UQuickReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes,  QRAbsDatas, UfqrSYS_BaseReport, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportDiarioMastite ; //SysReportTypes.TReportParams ; // substituir pela classe
                                                             // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TGroupExpression = reference to function : string ;

  TZoo_AtividadesDiarioDaMastiteReport = class(T_QuickReport)
    cdsTarefas: TClientDataSet;
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
    qrShapeDiasSecar: TQRShape;
    QRShape25: TQRShape;
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
    rbPageHeader: TQRWildBand;
    rbColumnHeader: TQRWildBand;
    rbDetail: TQRWildBand;
    rbDetailFooter: TQRWildBand;
    rbPageFooter: TQRWildBand;
    QRShape1: TQRShape;
    _qrsReportTitle: TQRSysData;
    QRImageDomain: TQRImage;
    QRImage2: TQRImage;
    LogoClinica: TQRImage;
    QRBand1: TQRBand;
    _qrsPageNumber: TQRSysData;
    cdsTarefasBRINCOFEMEA: TStringField;
    cdsTarefasBRINCOFEMEA_: TStringField;
    cdsTarefasNOMEFEMEA: TStringField;
    cdsTarefasLOTE: TStringField;
    cdsTarefasDEL: TIntegerField;
    cdsTarefasNL: TIntegerField;
    cdsTarefasDPP: TLargeintField;
    cdsTarefasDIAS_SECAR: TLargeintField;
    cdsTarefasDATA_MASTITE: TSQLTimeStampField;
    cdsTarefasCODIGO_MASTITE: TStringField;
    cdsTarefasNOME_MASTITE: TStringField;
    cdsTarefasQUARTO: TSmallintField;
    cdsTarefasDATAPROGRAMADA: TDateField;
    cdsTarefasDATAPREVISTA: TSQLTimeStampField;
    cdsTarefasTIPOTAREFA: TIntegerField;
    cdsTarefasTAREFA: TStringField;
    cdsTarefasATRASADA: TStringField;
    cdsTarefasULTIMA_CULTURA: TStringField;
    cdsTarefasDATA_CULTURA: TSQLTimeStampField;
    cdsTarefasPENULTIMA_CCS: TIntegerField;
    cdsTarefasULTIMA_CCS: TIntegerField;
    cdsTarefasDATA_ULTIMO_DESCARTE: TSQLTimeStampField;
    cdsTarefasDESCARTELEITE: TIntegerField;
    cdsTarefasRESPONSAVEL: TStringField;
    procedure qrQuartoADPrint(sender: TObject; var Value: string);
    procedure qrQuartoAEPrint(sender: TObject; var Value: string);
    procedure qrQuartoPDPrint(sender: TObject; var Value: string);
    procedure qrQuartoPEPrint(sender: TObject; var Value: string);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure _qrsReportTitlePrint(sender: TObject; var Value: string);
    procedure qrdbMastitePrint(sender: TObject; var Value: string);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrdbLotePrint(sender: TObject; var Value: string);
    procedure QRDBText8Print(sender: TObject; var Value: string);
    procedure rbColumnHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure _qrsPageNumberPrint(sender: TObject; var Value: string);
  private
    { Private declarations }
    FGroupIndex : integer ;
    GroupPages : array of integer ;
    PageNumberInGroup : array of array [0..1] of integer ;
    FLastBrinco : string ;
    FLastMastite : string;
    FShowFuncionario : boolean ;
    FNewPage : boolean ;
    FPrepared : boolean ;
  private
    GroupExpression : TGroupExpression;
    LLastExpression : string ;
    function CheckGroup : boolean ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  protected
    procedure  CheckNewPage ;
    procedure  PrintPageHeader ;
    procedure  PrintDetail ;
    procedure  PrintPageFooter;
    procedure  DoPrint ;
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
  R : integer ;
  H : integer ;
begin
(*
  qrImageLogo2.Picture.Assign( QRImageDomain.Picture );
  qrImageLogo2.Left    := QRImageDomain.Left ;
  qrImageLogo2.Top     := QRImageDomain.Top ;
  qrImageLogo2.Width   := QRImageDomain.Width ;
  qrImageLogo2.Height  := QRImageDomain.Height ;

  qrImageLogo2.Anchors  := QRImageDomain.Anchors    ;
  qrImageLogo2.AutoSize := QRImageDomain.AutoSize   ;
  qrImageLogo2.Center   := QRImageDomain.Center     ;
*)
//  _qrsPageNumber.OnPrint :=  _qrsPageNumberTitlePrint ;
//  _qrsReportTitle2.Font.Assign( _qrsReportTitle.Font );

  inherited;
  R := QRImageDomain.Width ;
  H := QRImageDomain.Height ;

  QRImageDomain.Anchors := [akTop,akRight] ;
  QRImageDomain.AutoSize := True ;
  QRImageDomain.Picture.Assign ( Application.LoggedUser.DomainImage ) ;
  QRImageDomain.Left := QRImageDomain.Left + (R - QRImageDomain.Width ) ;
  QRImageDomain.AutoSize := False ;
  QRImageDomain.Height := H ;
  QRImageDomain.Center := True ;

  Parameters.ForceHeader := True ;

  with TSpecificReportParams ( Parameters ), cdsTarefas.Params do
     begin
      QuickRep.ReportTitle  := ReportTitle;



  //  cdsTarefas.Params.paramByName ( 'DESCARTE_LEITE'     ).AsInteger   := 5 ; //_ST_STATUS_TAREFA_DESCARTE_LEITE ;
  //  cdsTarefas.Params.paramByName ( 'DESCARTE_CARNE'     ).AsInteger   := 6 ; //_ST_STATUS_TAREFA_DESCARTE_CARNE ;


    LLastBrinco :=  ''  ;
    LLastDate   := 0 ;
    cdsTarefas.CloneCursor( SourceClientDataSet, False, False );

    if PorFuncionario then
       begin
        FShowFuncionario := True ;
        //QRGroup.Expression := 'DATAPROGRAMADA+RESPONSAVEL' ;
        cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;RESPONSAVEL;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO' ;
        GroupExpression := Function : string
          begin
            Result :=  cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsString
                     + cdsTarefas.FieldByName( 'RESPONSAVEL' ).AsString
          end;
       end
    else
      begin
        FShowFuncionario := False ;
        //QRGroup.Expression := 'DATAPROGRAMADA' ;
        cdsTarefas.IndexFieldNames := 'DATAPROGRAMADA;BRINCOFEMEA_;TIPOTAREFA;DATA_MASTITE;QUARTO' ;

        GroupExpression := Function : string
          begin
             Result :=  cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsString
          end ;
      end ;

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
  QuickRep.OnStartPage := QuickRepStartPage ;
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
begin
  inherited;
  Image1.Enabled := cdsTarefas.FieldByName( 'ATRASADA' ).asString = 'T' ;
  QRDBDataPrevista.Enabled := cdsTarefas.FieldByName( 'ATRASADA' ).asString = 'T' ;

  LSame := (not FNewPage)
       and (FLastBrinco = cdsTarefas.FieldByName('BRINCOFEMEA').asString) ;

  FNewPage := False ;

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


procedure TZoo_AtividadesDiarioDaMastiteReport._qrsPageNumberPrint(
  sender: TObject; var Value: string);
var
  LPageNumberIndex, LPageNumber  : integer ;
  LGroupIndex, LPagesInGroup : integer ;
begin
  if FPrepared then
    begin
      LPageNumberIndex := QuickRep.PageNumber - 1 ;
      LGroupIndex   := PageNumberInGroup[ LPageNumberIndex, 0] ;
      LPageNumber   := PageNumberInGroup[ LPageNumberIndex, 1] ;
      LPagesInGroup := GroupPages[ LGroupIndex ] ;
      Value := LPageNumber.ToString +  '/' + LPagesInGroup.ToString ;
    end;
end;


procedure TZoo_AtividadesDiarioDaMastiteReport._qrsReportTitlePrint(
  sender: TObject; var Value: string);
begin
  if cdsTarefas.isEmpty then
    Value :=  'Diário da Mastite'
  else
    Value :=  'Diário da Mastite - ' + FormatDateTime ( 'dd/mm/yyyy', cdsTarefas.FieldByName( 'DATAPROGRAMADA' ).AsDateTime  ) ;
end;

function TZoo_AtividadesDiarioDaMastiteReport.CheckGroup : boolean ;
var
  LExpression : string ;
begin
 LExpression := GroupExpression ;
 Result := LExpression <> LLastExpression ;

 if ( Result ) or ( FGroupIndex = -1 ) then
 begin
    LLastExpression := LExpression ;
    if not FPrepared then
    begin
       inc ( FGroupIndex ) ;
       SetLength ( GroupPages, FGroupIndex + 1 ) ;
       GroupPages[ FGroupIndex ] := 0 ;
    end;
 end;


end;

procedure  TZoo_AtividadesDiarioDaMastiteReport.CheckNewPage ;

  function NeededSpace : boolean ;
  var
    Sum : Extended ;
  begin
   Sum :=  QuickRep.AvailableSpace
           - rbDetailFooter.Size.Length
           - rbPageFooter.Size.Length
           - 10;

    Result := Sum < 0

  end ;

begin

 if QuickRep.PageNumber > 0 then
   if    (CheckGroup)
     or ( NeededSpace) then
     begin
      //ShowMessageFmt ( '%d %d %d', [QuickRep.CurrentY, QuickRep.AvailableSpace, Soma] ) ;
      PrintPageFooter ;
      QuickRep.newpage   ;
      PrintPageHeader ;
     end ;

end;

procedure  TZoo_AtividadesDiarioDaMastiteReport.PrintPageHeader ;
begin

   rbPageHeader.PrintNow := True ;
   rbColumnHeader.PrintNow := True ;

   if not FPrepared then
   begin
     GroupPages[ FGroupIndex ] := GroupPages[ FGroupIndex ] +  1;
     SetLength ( PageNumberInGroup,  QuickRep.PageNumber ) ;
     PageNumberInGroup[ QuickRep.PageNumber -1 ][ 0 ] := FGroupIndex ;
     PageNumberInGroup[ QuickRep.PageNumber -1 ][ 1 ] := GroupPages[ FGroupIndex ] ;
   end;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.PrintDetail  ;
begin
  rbDetail.PrintNow := True ;
end;

procedure  TZoo_AtividadesDiarioDaMastiteReport.PrintPageFooter;
begin
   rbDetailFooter.PrintNow := True ;

   with QuickRep do
      CurrentY  := round ( QuickRep.QRPrinter.PaperWidth//QRPrinter.PaperLength
          - Page.BottomMargin
          - rbPageFooter.Size.Length
           ) ;

   rbPageFooter.PrintNow := True ;

end;

procedure TZoo_AtividadesDiarioDaMastiteReport.DoPrint ;
begin
   QuickRep.OnStartPage := nil ;
   cdsTarefas.first ;

   FLastBrinco     := '' ;
   FLastMastite    := '' ;
   FGroupIndex     := -1 ;
   LLastExpression := '' ;
   CheckGroup ;

   PrintPageHeader   ;
   While not cdsTarefas.eof do
     begin
      PrintDetail  ;
      cdsTarefas.Next ;
      if not cdsTarefas.eof then
        CheckNewPage ;
     end ;
   PrintPageFooter   ;
end ;

procedure TZoo_AtividadesDiarioDaMastiteReport.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  DoPrint ;
end;


end.
