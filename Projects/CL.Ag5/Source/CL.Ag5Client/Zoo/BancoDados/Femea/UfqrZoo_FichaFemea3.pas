unit UfqrZoo_FichaFemea3;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, QRCtrls, QuickRpt, VCL.ExtCtrls, UCustomQuickReport,
  jpeg, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr, Data.SQLTimSt, Datasnap.Provider, QRPDF995Suppl,
  MailSuppl, DateSuppl, DateUtils,
  SysWizardReportDialog,
  SysReportTypes, ReportTypes,  Wrappers,
  UZoo_AnimaisGenealogiaClass,
  QRGraphcon, UQuickReport ;

type

  TSpecificReportParams = SysReportTypes.TReportParams ; // substituir pela classe
                                                      // de parametros do relatorio

  TSpecificReportDialog = T_WizardReportDialog ;  // substituir pela classe de
                                                  // dialogo do relatorio

  TfqrZoo_FichaFemea = class(T_QuickReport)
    cdsMaster: TClientDataSet;
    dspMaster: TDataSetProvider;
    sqlMaster: TTcSQLDataSet;
    sqlDetalhes: TTcSQLDataSet;
    dtsSQLMaster: TDataSource;
    cdsDetalhes: TClientDataSet;
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
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape5: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape6: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape7: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape8: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape9: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape10: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape11: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape12: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape13: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape14: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape15: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape16: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRImageDomain: TQRImage;
    _qrsReportTitle: TQRSysData;
    QRImage2: TQRImage;
    gc: TQRImage;
    QRGraphicCanvas1: TQRGraphicCanvas;
    QRShape45: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGraphicCanvas1BeforePrint(sender: TQRGraphicCanvas;
      grect: TRect);
  private
    { Private declarations }
    FGenealogyPanel : TZoo_AnimaisGenealogiaFrame ;
    procedure CreateGenealogy;
    procedure PrintIdentity( AIdentity : TIdentity ) ;
    procedure PrintIdentity2( AIdentity : TIdentity ) ;
  protected
    { Protected declarations }
    class Function  GetDialogClass : IReportDialog ; override ;
    class Function  GetParametersClass : TReportParamsClass ; override ;
    procedure Initialize  ; override ;
  public
    { Public declarations }
  end;


implementation

//uses UDBResources;

{$R *.dfm}

{ TfqrCustomReport }

procedure TfqrZoo_FichaFemea.PrintIdentity( AIdentity : TIdentity ) ;
begin
  AIdentity.PaintToCanvas( AIdentity.Left, AIdentity.Top, gc.Canvas );
  if Assigned ( AIdentity.Pai ) then
    PrintIdentity( AIdentity.Pai ) ;
  if Assigned ( AIdentity.Mae ) then
    PrintIdentity( AIdentity.Mae ) ;
end;

procedure TfqrZoo_FichaFemea.PrintIdentity2( AIdentity : TIdentity ) ;
begin
  AIdentity.PaintToCanvas( AIdentity.Left - 10, AIdentity.Top + 345, QRGraphicCanvas1.GetCanvas );
  if Assigned ( AIdentity.Pai ) then
    PrintIdentity2( AIdentity.Pai ) ;
  if Assigned ( AIdentity.Mae ) then
    PrintIdentity2( AIdentity.Mae ) ;

  if not Assigned ( AIdentity.Child )  then
      AIdentity.DrawLines ( -10, 345, QRGraphicCanvas1.GetCanvas ) ;
end;

procedure TfqrZoo_FichaFemea.CreateGenealogy;
var
  R : TRect ;
  c : TCanvas ;
begin

  FGenealogyPanel := TZoo_AnimaisGenealogiaFrame.Create( nil ) ;
  FGenealogyPanel.Identity := TIdentity.make( FGenealogyPanel, 3, 170 )  ;
  FGenealogyPanel.disableDraw := False ;

//  with TZoo_BancoDadosFemeaDatamodule( DatamoduleBase ) do
     TAnimalGenealogy.BuildIdentity (
          '', //cdsDadosFemeaKZOO_ANIMAL_FEMEA.AsString,
          FGenealogyPanel.Identity ) ;

  FGenealogyPanel.Repaint ;

  PrintIdentity( FGenealogyPanel.Identity ) ;

//  R := Rect ( 0,0, FGenealogyPanel.Identity.Width, FGenealogyPanel.Identity.Height ) ;
//  c := gc.Canvas ;
//  if Assigned ( c )  then
//     c.CopyRect( R,
//                 FGenealogyPanel.Identity.Canvas,
//                 R ) ;

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

  with TSpecificReportParams ( Parameters ), cdsMaster.Params do
     begin
       //ParamByName( 'DATAINICIO' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( StartOfTheDay( DataInicio ) ) ;
       //ParamByName( 'DATAFIM' ).asSQLTimeStamp := DateTimeToSQLTimeStamp ( EndOfTheDay( DataFim ) ) ;
     end ;

  //cdsMaster.Open ;

  with TMailSuppl.GlobalMail do
     begin
       Clear ;
       //ToList.Add ( cdsMasterEmail.asString ) ;
       Message := 'Segue em Anexo ... ' ;
     end ;


end;

procedure TfqrZoo_FichaFemea.QRGraphicCanvas1BeforePrint(
  sender: TQRGraphicCanvas; grect: TRect);
begin
  inherited;
  PrintIdentity2( FGenealogyPanel.Identity ) ;
//  ( sender.GetCanvas )
end;

procedure TfqrZoo_FichaFemea.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  CreateGenealogy;
end;

end.
