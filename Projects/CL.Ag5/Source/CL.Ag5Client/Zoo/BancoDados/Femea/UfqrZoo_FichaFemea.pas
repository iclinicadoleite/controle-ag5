unit UfqrZoo_FichaFemea;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes,
  UZoo_AnimaisGenealogiaClass,
  QRGraphcon, UQuickReport,
  Math, Vcl.Imaging.pngimage, qrpctrls, System.Actions, Vcl.ActnList,
  Tc.VCL.Application,  Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportBOFemea ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TfqrZoo_FichaFemea = class(T_QuickReport)
    cdsDados: TClientDataSet;
    dspDados: TDataSetProvider;
    sqlDados: TTcSQLDataSet;
    sqlLactacoes: TTcSQLDataSet;
    cdsLactacoes: TClientDataSet;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRImageDomain: TQRImage;
    _qrsReportTitle: TQRSysData;
    QRImage2: TQRImage;
    qriGenealogy: TQRImage;
    QRShapeFooterSeparator: TQRShape;
    QRLabelFooterSeparator: TQRLabel;
    LogoClinica: TQRImage;
    qriGrafico: TQRImage;
    dtsFicha: TDataSource;
    sqlDadosKZOO_ANIMAL: TStringField;
    dtsSQLDados: TDataSource;
    cdsDadosKZOO_ANIMAL: TStringField;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlDEL1: TQRLabel;
    qrlNL1: TQRLabel;
    qrlParto1: TQRLabel;
    qrlAborto1: TQRLabel;
    qrlMP1: TQRLabel;
    qrlPT1: TQRLabel;
    qrlP305_1: TQRLabel;
    qrlDEL2: TQRLabel;
    qrlNL2: TQRLabel;
    qrlParto2: TQRLabel;
    qrlAborto2: TQRLabel;
    qrlMP2: TQRLabel;
    qrlPT2: TQRLabel;
    qrlP305_2: TQRLabel;
    qrlDEL3: TQRLabel;
    qrlNL3: TQRLabel;
    qrlParto3: TQRLabel;
    qrlAborto3: TQRLabel;
    qrlMP3: TQRLabel;
    qrlPT3: TQRLabel;
    qrlP305_3: TQRLabel;
    qrlDEL4: TQRLabel;
    qrlNL4: TQRLabel;
    qrlParto4: TQRLabel;
    qrlAborto4: TQRLabel;
    qrlMP4: TQRLabel;
    qrlPT4: TQRLabel;
    qrlP305_4: TQRLabel;
    qrlDEL5: TQRLabel;
    qrlNL5: TQRLabel;
    qrlParto5: TQRLabel;
    qrlAborto5: TQRLabel;
    qrlMP5: TQRLabel;
    qrlPT5: TQRLabel;
    qrlP305_5: TQRLabel;
    qrlDEL6: TQRLabel;
    qrlNL6: TQRLabel;
    qrlParto6: TQRLabel;
    qrlAborto6: TQRLabel;
    qrlMP6: TQRLabel;
    qrlPT6: TQRLabel;
    qrlP305_6: TQRLabel;
    QRLabel58: TQRLabel;
    sqlLactacoesNL: TIntegerField;
    sqlLactacoesDATAABORTOPARTO: TSQLTimeStampField;
    sqlLactacoesABORTOPARTO: TIntegerField;
    sqlLactacoesDEL: TIntegerField;
    sqlLactacoesPRODUCAO_MEDIA: TFloatField;
    sqlLactacoesPLT: TFloatField;
    sqlLactacoesPL305: TFloatField;
    dspLactacoes: TDataSetProvider;
    cdsLactacoesNL: TIntegerField;
    cdsLactacoesDATAABORTOPARTO: TSQLTimeStampField;
    cdsLactacoesABORTOPARTO: TIntegerField;
    cdsLactacoesDEL: TIntegerField;
    cdsLactacoesPRODUCAO_MEDIA: TFloatField;
    cdsLactacoesPLT: TFloatField;
    cdsLactacoesPL305: TFloatField;
    sqlDadosBRINCO: TStringField;
    sqlDadosREGISTRO: TStringField;
    sqlDadosNOMECOMPLETO: TStringField;
    sqlDadosNOMEESTABULO: TStringField;
    sqlDadosDOADOR_RECEPTOR: TIntegerField;
    sqlDadosNASCIMENTO: TSQLTimeStampField;
    cdsDadosBRINCO: TStringField;
    cdsDadosREGISTRO: TStringField;
    cdsDadosNOMECOMPLETO: TStringField;
    cdsDadosNOMEESTABULO: TStringField;
    cdsDadosDOADOR_RECEPTOR: TIntegerField;
    cdsDadosNASCIMENTO: TSQLTimeStampField;
    cdsDadosIDADE: TStringField;
    cdsTipoDoadorReceptor: TClientDataSet;
    cdsTipoDoadorReceptorTIPO: TStringField;
    cdsTipoDoadorReceptorVALOR: TStringField;
    cdsTipoDoadorReceptorDESCRICAO: TStringField;
    cdsTipoDoadorReceptorORDEM: TIntegerField;
    cdsDadosDESCR_DOADOR_RECEPTOR: TStringField;
    sqlDadosGRAUSANGUE: TStringField;
    sqlDadosCOMPOSICAORACA: TStringField;
    cdsDadosGRAUSANGUE: TStringField;
    cdsDadosCOMPOSICAORACA: TStringField;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    qrsLactacoes: TQRSubDetail;
    qrsGrafico: TQRSubDetail;
    qrsGenealogia: TQRSubDetail;
    qrsDiagnosticos: TQRSubDetail;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlDataDiagnostico1: TQRLabel;
    qrlDiagnostico1: TQRLabel;
    qrlDataDiagnostico2: TQRLabel;
    qrlDiagnostico2: TQRLabel;
    qrlDataDiagnostico3: TQRLabel;
    qrlDiagnostico3: TQRLabel;
    qrlDataDiagnostico4: TQRLabel;
    qrlDiagnostico4: TQRLabel;
    qrlDataDiagnostico5: TQRLabel;
    qrlDiagnostico5: TQRLabel;
    qrlDataDiagnostico6: TQRLabel;
    qrlDiagnostico6: TQRLabel;
    QRLabel31: TQRLabel;
    qrlDataDiagnostico7: TQRLabel;
    qrlDiagnostico7: TQRLabel;
    qrlDataDiagnostico8: TQRLabel;
    qrlDiagnostico8: TQRLabel;
    qrlDataDiagnostico9: TQRLabel;
    qrlDiagnostico9: TQRLabel;
    qrlDataDiagnostico10: TQRLabel;
    qrlDiagnostico10: TQRLabel;
    qrlDataDiagnostico11: TQRLabel;
    qrlDiagnostico11: TQRLabel;
    qrlDataDiagnostico12: TQRLabel;
    qrlDiagnostico12: TQRLabel;
    qrlProtocolos1: TQRLabel;
    qrlProtocolos2: TQRLabel;
    qrlProtocolos3: TQRLabel;
    qrlProtocolos4: TQRLabel;
    qrlProtocolos5: TQRLabel;
    qrlProtocolos6: TQRLabel;
    qrlProtocolos7: TQRLabel;
    qrlProtocolos8: TQRLabel;
    qrlProtocolos9: TQRLabel;
    qrlProtocolos10: TQRLabel;
    qrlProtocolos11: TQRLabel;
    qrlProtocolos12: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    qrlSecagem1: TQRLabel;
    qrlSecagem2: TQRLabel;
    qrlSecagem3: TQRLabel;
    qrlSecagem4: TQRLabel;
    qrlSecagem5: TQRLabel;
    qrlSecagem6: TQRLabel;
    cdsDiagnosticos: TClientDataSet;
    dspDiagnosticos: TDataSetProvider;
    sqlDiagnosticos: TTcSQLDataSet;
    sqlDiagnosticosDATA: TSQLTimeStampField;
    sqlDiagnosticosCODIGO: TStringField;
    cdsDiagnosticosDATA: TSQLTimeStampField;
    cdsDiagnosticosCODIGO: TStringField;
    sqlDiagnosticosPROTOCOLOS: TStringField;
    cdsDiagnosticosPROTOCOLOS: TStringField;
    QRLabel19: TQRLabel;
    sqlLactacoesDATA_SECAGEM: TSQLTimeStampField;
    cdsLactacoesDATA_SECAGEM: TSQLTimeStampField;
    QRSysData1: TQRSysData;
    sqlLactacoesINTERVALO_SECAGEM: TIntegerField;
    cdsLactacoesINTERVALO_SECAGEM: TIntegerField;
    cdsLactacoesPRODUCAO_MEDIA_DIARIA: TFloatField;
    procedure QRGraphicCanvas1BeforePrint(sender: TQRGraphicCanvas;
      grect: TRect);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure QRSysData1Print(sender: TObject; var Value: string);
    procedure cdsLactacoesABORTOPARTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsLactacoesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    tmp : TBitmap ;
    tmp2 : TBitmap ;
    FBitmap : TCanvas ;
    FGenealogyPanel : TZoo_AnimaisGenealogiaFrame ;
    procedure CreateGenealogy;
    procedure PrintIdentity( AIdentity : TIdentity ) ;
    procedure CreateGrafico ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure CheckLactacoes ;
    procedure InitLactacoes ;
    procedure InitDiagnosticos ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

uses CLAg5Types, UfrmZoo_GraficoLactacaoAnimal, Tc.DBRTL.AbstractDB;

{$R *.dfm}


Procedure SetCanvasZoomAndRotation(ACanvas: TCanvas; Zoom: Double;
  Angle: Double; CenterpointX, CenterpointY: Double);
var
  LXForm: tagXForm;
  rAngle: Double;
begin
  rAngle := DegToRad(Angle);
  SetGraphicsMode(ACanvas.Handle, GM_ADVANCED);
  SetMapMode(ACanvas.Handle, MM_ANISOTROPIC);
  LXForm.eM11 := Zoom * Cos(rAngle);
  LXForm.eM12 := Zoom * Sin(rAngle);
  LXForm.eM21 := Zoom * (-Sin(rAngle));
  LXForm.eM22 := Zoom * Cos(rAngle);
  LXForm.eDx := CenterpointX;
  LXForm.eDy := CenterpointY;
  SetWorldTransForm(ACanvas.Handle, LXForm);
end;

Procedure ResetCanvas(ACanvas: TCanvas);
begin
  SetCanvasZoomAndRotation(ACanvas, 1, 0, 0, 0);
end;

{ TfqrCustomReport }

procedure TfqrZoo_FichaFemea.PrintIdentity( AIdentity : TIdentity ) ;
begin

  if not Assigned ( FBitmap )  then
   begin
     tmp := TBitmap.Create ;
     tmp.PixelFormat  := pf24bit ;
     tmp.Width  := (*qriGenealogy.Width*) 713  * 3 ;
     tmp.Height := (*qriGenealogy.Height*)425  * 3 ;

     tmp2 := TBitmap.Create ;
     tmp2.PixelFormat  := pf24bit ;
     tmp2.Width  := (*qriGenealogy.Width*) 713  * 3 ;
     tmp2.Height := (*qriGenealogy.Height*)425  * 3 ;

     FBitmap := tmp.Canvas ;

     SetCanvasZoomAndRotation(FBitmap, 2.54, 0, 0, 0);
   end;

  AIdentity.PaintToCanvas( AIdentity.Left - 49, AIdentity.Top - 25, FBitmap ) ;
  if Assigned ( AIdentity.Pai ) then
    PrintIdentity( AIdentity.Pai ) ;
  if Assigned ( AIdentity.Mae ) then
    PrintIdentity( AIdentity.Mae ) ;

  if not Assigned ( AIdentity.Child )  then
   begin
       AIdentity.DrawLines ( -49,  - 25, FBitmap ) ;
       //SetCanvasZoomAndRotation(tmp2.Canvas, 1.2, 0, 0, 0);
       //tmp2.Canvas.draw ( 0,0, tmp ) ;
       qriGenealogy.Picture.Assign( tmp );
       tmp.Free ;
       tmp2.Free ;
   end;
end;


function IdadeAnoMes(Intervalo: integer): String;
var
  Ano, Mes : Integer;
begin
  Ano := 0 ;
  Mes := 0 ;

  Ano := Trunc (Intervalo / 12);
  Mes := (Intervalo mod 12);

  Result := IntToStr(Ano) + '/' + IntToStr(Mes) ;
end;

procedure TfqrZoo_FichaFemea.cdsDadosCalcFields(DataSet: TDataSet);
begin
   if DataSet.State in [dsInternalCalc] then
      begin

         if cdsDadosNASCIMENTO.IsNull then
           cdsDadosIDADE.Clear
         else
           cdsDadosIDADE.AsString := IdadeAnoMes(MonthsBetween(Date,cdsDadosNASCIMENTO.AsDateTime));

      end;
end;

procedure TfqrZoo_FichaFemea.cdsLactacoesABORTOPARTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsInteger < 3 then
     Text := 'Sim'
  else
     Text := 'Não'
end;

procedure TfqrZoo_FichaFemea.cdsLactacoesCalcFields(DataSet: TDataSet);
var
  LIntervaloSecagem : integer ;
begin
  if DataSet.State in [dsInternalCalc] then
    try
      cdsLactacoes.OnCalcFields := nil  ;

      LIntervaloSecagem := cdsLactacoesDEL.asInteger ;

      if cdsLactacoesDATA_SECAGEM.isNull then
         Inc ( LIntervaloSecagem, cdsLactacoesINTERVALO_SECAGEM.asInteger ) ;
      if LIntervaloSecagem < 1 then
         LIntervaloSecagem := 1 ;

      cdsLactacoesPRODUCAO_MEDIA_DIARIA.asFloat := cdsLactacoesPLT.asFloat / LIntervaloSecagem  ;

    finally
      cdsLactacoes.OnCalcFields := cdsLactacoesCalcFields ;
    end ;
end;

procedure TfqrZoo_FichaFemea.CheckLactacoes;
begin

 cdsLactacoes.Open ;

 if cdsLactacoes.IsEmpty then
   begin
     qrsLactacoes.Enabled    := False ;
     qrsGrafico.Enabled      := False ;
     qrsDiagnosticos.Enabled := True ;
     cdsDiagnosticos.Open ;
   end
 else
   begin
     qrsLactacoes.Enabled    := True ;
     qrsGrafico.Enabled      := True ;
     qrsDiagnosticos.Enabled := False ;
   end;
end;

procedure TfqrZoo_FichaFemea.CreateGenealogy;
var
  R : TRect ;
  c : TCanvas ;
begin

  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( nil ) ;

  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3, 200 )  ;
  FGenealogyPanel.disableDraw := False ;

  TAnimalGenealogy.BuildIdentity (
    TSpecificReportParams ( Parameters ).KZOO_ANIMAL_FEMEA,
    FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;

  PrintIdentity( FGenealogyPanel.Identity ) ;

end;


procedure TfqrZoo_FichaFemea.CreateGrafico;
var
 G, G2 : TBitmap ;
begin
   with TfrmZoo_GraficoLactacaoAnimal.Create ( self  ) do
    begin
       Width := 800 * 2 ;
       Height:= 230 * 2 ;
       MasterSource := dtsFicha ;

       Grafico.BottomAxis.Axis.Color       := clBlack ;
       Grafico.BottomAxis.Ticks.Color       := clBlack ;
       Grafico.BottomAxis.LabelsFont.Color := clBlack ;
       Grafico.BottomAxis.LabelsFont.Size  := 12 ;
       Grafico.BottomAxis.Title.Font.Color := clBlack ;
       Grafico.BottomAxis.Title.Font.Size  := 12 ;

       Grafico.LeftAxis.Axis.Color       := clBlack ;
       Grafico.LeftAxis.Ticks.Color      := clBlack ;
       Grafico.LeftAxis.LabelsFont.Color := clBlack ;
       Grafico.LeftAxis.LabelsFont.Size  := 12 ;
       Grafico.LeftAxis.Title.Font.Color := clBlack ;
       Grafico.LeftAxis.Title.Font.Size  := 14 ;

       G := Grafico.TeeCreateBitmap ;
    end ;


    qriGrafico.Width  := Trunc(G.Width / 2) ;
    qriGrafico.Height := Trunc(G.Height /2) ;
    qriGrafico.Picture.Assign( G ) ;
    //showMessage ( format ( '%d x %d', [qriGrafico.Width, qriGrafico.Height] ) ) ;
 (*
    G2 := TBitmap.Create ;
    G2.Width := Trunc ( G.Width * 3 ) ;
    G2.Height:= Trunc ( G.Height * 3 ) ;
    SetCanvasZoomAndRotation(G2.Canvas, 2.54, 0, 0, 0);
    G2.Canvas.Draw( 0, 0, G )  ;
    qriGrafico.Picture.Assign( G2 ) ;
  *)


//    showMessage ( format ( '%d x %d', [qriGrafico.Width, qriGrafico.Height] ) ) ;
    G.Free ;
 //   G2.Free ;
end;

class function TfqrZoo_FichaFemea.GetDialogClass: IReportDialog;
begin
   Result := TSpecificReportDialog.Create ( nil ) ;
end;

class function TfqrZoo_FichaFemea.GetParametersClass: TReportParamsClass;
begin
   Result := TSpecificReportParams ;
end;

procedure TfqrZoo_FichaFemea.Initialize;
var
  R : integer ;
  H : integer ;
begin

  TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_TIPO_DOADOR_RECEPTOR, cdsTipoDoadorReceptor ) ;


  R := QRImageDomain.Width ;
  H := QRImageDomain.Height ;


  QRImageDomain.Anchors := [akTop,akRight] ;
  QRImageDomain.AutoSize := True ;
  QRImageDomain.Picture.Assign ( Application.LoggedUser.DomainImage ) ;
  QRImageDomain.Left := QRImageDomain.Left + (R - QRImageDomain.Width ) ;
  QRImageDomain.AutoSize := False ;
  QRImageDomain.Height := H ;
  QRImageDomain.Center := True ;


//  Parameters.ForceHeader := True ;

  with TSpecificReportParams ( Parameters ) do
    begin
      cdsDados.Params.ParamByName( 'KZOO_ANIMAL' ).asString := KZOO_ANIMAL_FEMEA ;
      cdsLactacoes.Params.ParamByName( 'KZOO_ANIMAL' ).asString := KZOO_ANIMAL_FEMEA ;
      cdsDiagnosticos.Params.ParamByName( 'KZOO_ANIMAL' ).asString := KZOO_ANIMAL_FEMEA ;
    end ;

  cdsDados.Open ;

  CheckLactacoes ;
  InitLactacoes ;
  InitDiagnosticos ;
  CreateGenealogy;
   ;


  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;

procedure TfqrZoo_FichaFemea.InitLactacoes;
type
  TColInfo = TArray<TQRLabel> ;
  TRowInfo = TArray<TColInfo> ;
var
  i : integer ;
  X : TRowInfo ;
  LIntervaloSecagem : integer ;
begin

   if ( cdsLactacoes.isEmpty ) then
      exit ;

   X := TRowInfo.Create(
   TColInfo.Create ( qrlNL1, qrlParto1, qrlAborto1, qrlDEL1, qrlMP1, qrlPT1, qrlP305_1, qrlSecagem1 ),
   TColInfo.Create ( qrlNL2, qrlParto2, qrlAborto2, qrlDEL2, qrlMP2, qrlPT2, qrlP305_2, qrlSecagem2 ),
   TColInfo.Create ( qrlNL3, qrlParto3, qrlAborto3, qrlDEL3, qrlMP3, qrlPT3, qrlP305_3, qrlSecagem3 ),
   TColInfo.Create ( qrlNL4, qrlParto4, qrlAborto4, qrlDEL4, qrlMP4, qrlPT4, qrlP305_4, qrlSecagem4 ),
   TColInfo.Create ( qrlNL5, qrlParto5, qrlAborto5, qrlDEL5, qrlMP5, qrlPT5, qrlP305_5, qrlSecagem5 ),
   TColInfo.Create ( qrlNL6, qrlParto6, qrlAborto6, qrlDEL6, qrlMP6, qrlPT6, qrlP305_6, qrlSecagem6 )
  ) ;

  for I := Low( X ) to High( X ) do
    if cdsLactacoes.EOF then
      begin
        X[I][0].Caption := '' ;
        X[I][1].Caption := '' ;
        X[I][2].Caption := '' ;
        X[I][3].Caption := '' ;
        X[I][4].Caption := '' ;
        X[I][5].Caption := '' ;
        X[I][6].Caption := '' ;
        X[I][7].Caption := '' ;
      end
    else
      begin
        X[I][0].Caption :=  cdsLactacoesNL.asString              ;
        X[I][1].Caption :=  cdsLactacoesDATAABORTOPARTO.asString ;
        X[I][2].Caption :=  cdsLactacoesABORTOPARTO.DisplayText ;
        X[I][3].Caption :=  cdsLactacoesDEL.asString             ;
        X[I][4].Caption :=  cdsLactacoesPRODUCAO_MEDIA_DIARIA.DisplayText ;// cdsLactacoesPRODUCAO_MEDIA.DisplayText ;
        X[I][5].Caption :=  cdsLactacoesPLT.DisplayText   ;
        X[I][6].Caption :=  cdsLactacoesPL305.DisplayText ;
        X[I][7].Caption :=  cdsLactacoesDATA_SECAGEM.DisplayText ;
        cdsLactacoes.next ;
      end;

  CreateGrafico ;

end;

procedure TfqrZoo_FichaFemea.InitDiagnosticos ;
type
  TColInfo = TArray<TQRLabel> ;
  TRowInfo = TArray<TColInfo> ;
var
  i : integer ;
  X : TRowInfo ;
begin

   if ( not cdsDiagnosticos.active ) then
      exit ;

   X := TRowInfo.Create(
   TColInfo.Create ( qrlDataDiagnostico1 , qrlDiagnostico1 , qrlProtocolos1 ),
   TColInfo.Create ( qrlDataDiagnostico2 , qrlDiagnostico2 , qrlProtocolos2 ),
   TColInfo.Create ( qrlDataDiagnostico3 , qrlDiagnostico3 , qrlProtocolos3 ),
   TColInfo.Create ( qrlDataDiagnostico4 , qrlDiagnostico4 , qrlProtocolos4 ),
   TColInfo.Create ( qrlDataDiagnostico5 , qrlDiagnostico5 , qrlProtocolos5 ),
   TColInfo.Create ( qrlDataDiagnostico6 , qrlDiagnostico6 , qrlProtocolos6 ),
   TColInfo.Create ( qrlDataDiagnostico7 , qrlDiagnostico7 , qrlProtocolos7 ),
   TColInfo.Create ( qrlDataDiagnostico8 , qrlDiagnostico8 , qrlProtocolos8 ),
   TColInfo.Create ( qrlDataDiagnostico9 , qrlDiagnostico9 , qrlProtocolos9 ),
   TColInfo.Create ( qrlDataDiagnostico10, qrlDiagnostico10, qrlProtocolos10 ),
   TColInfo.Create ( qrlDataDiagnostico11, qrlDiagnostico11, qrlProtocolos11 ),
   TColInfo.Create ( qrlDataDiagnostico12, qrlDiagnostico12, qrlProtocolos12 )
  ) ;

  for I := Low( X ) to High( X ) do
    if cdsDiagnosticos.EOF then
      begin
        X[I][0].Caption := '' ;
        X[I][1].Caption := '' ;
        X[I][2].Caption := '' ;
      end
    else
      begin
        X[I][0].Caption :=  cdsDiagnosticosDATA.asString   ;
        X[I][1].Caption :=  cdsDiagnosticosCODIGO.asString ;
        X[I][2].Caption :=  cdsDiagnosticosPROTOCOLOS.asString   ;
        cdsDiagnosticos.next ;
      end;
end;

procedure TfqrZoo_FichaFemea.QRGraphicCanvas1BeforePrint(
  sender: TQRGraphicCanvas; grect: TRect);
begin
  inherited;
//  PrintIdentity2( FGenealogyPanel.Identity ) ;
//  ( sender.GetCanvas )
end;

procedure TfqrZoo_FichaFemea.QRSysData1Print(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := 'Emitido em ' + Value ;
end;

end.
