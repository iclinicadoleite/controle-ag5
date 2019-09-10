unit UfrmFIN_FluxoCaixaDetalhe;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls, UdtmFIN_FluxoCaixaDetalhe, FIN_FluxoCaixaTypes,
  Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, VCL.Mask,
  VCL.DBCtrls, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TfrmFIN_FluxoCaixaDetalhe = class(TForm)
    _pnlTitle: TPanel;
    _lblCaption: TLabel;
    _ImgLogoForm: TImage;
    _ImgLogoSys: TImage;
    _pnlDetail: TPanel;
    _pnlFooter: TPanel;
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsDetalheFluxo: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure _btbCancelClick(Sender: TObject);
  private
    { Private declarations }
    FTipo : TTipoFinFluxoDetalhe ;
    FData : TDateTime ;
    dtmFIN_FluxoCaixaDetalhe: TdtmFIN_FluxoCaixaDetalhe;
    procedure InitDataModule ;
    procedure Init ;
  public
    { Public declarations }
    class procedure Execute ( Tipo : TTipoFinFluxoDetalhe ; Data : TDateTime ) ;
  end;

implementation

{$R *.dfm}
uses DateSuppl ;

{ TfrmFIN_FluxoCaixaDetalhe }

class procedure TfrmFIN_FluxoCaixaDetalhe.Execute( Tipo : TTipoFinFluxoDetalhe ; Data : TDateTime ) ;
var
  frmFIN_FluxoCaixaDetalhe: TfrmFIN_FluxoCaixaDetalhe;
begin
  frmFIN_FluxoCaixaDetalhe := TfrmFIN_FluxoCaixaDetalhe.Create ( nil ) ;
  frmFIN_FluxoCaixaDetalhe.FTipo := Tipo ;
  frmFIN_FluxoCaixaDetalhe.FData := Data ;
  frmFIN_FluxoCaixaDetalhe.Init;
  frmFIN_FluxoCaixaDetalhe.free ;
end;

procedure TfrmFIN_FluxoCaixaDetalhe.Init;
begin

  if FTipo = ffdAPAGAR_PREVISTO then
     Caption := 'Detalhe do Fluxo' + ' A Pagar - Previsto - ' + TDateSuppl.GetStringPeriodo( FData )

  else if FTipo = ffdAPAGAR_EFETIVO then
     Caption := 'Detalhe do Fluxo' + ' A Pagar - Efetivo - ' + TDateSuppl.GetStringPeriodo( FData )

  else if FTipo = ffdAPAGAR_QUITADO then
     Caption := 'Detalhe do Fluxo' + ' A Pagar - Quitado - ' + TDateSuppl.GetStringPeriodo( FData )

  else if FTipo = ffdARECEBER_PREVISTO then
     Caption := 'Detalhe do Fluxo' + ' A Receber - Previsto - ' + TDateSuppl.GetStringPeriodo( FData )

  else if FTipo = ffdARECEBER_FATURADO then
     Caption := 'Detalhe do Fluxo' + ' A Receber - Faturado - ' + TDateSuppl.GetStringPeriodo( FData )

  else if FTipo = ffdARECEBER_RECEBIDA then
     Caption := 'Detalhe do Fluxo' + ' A Receber - Recebido - ' + TDateSuppl.GetStringPeriodo( FData ) ;

  InitDataModule;
  showModal ;

end;

procedure TfrmFIN_FluxoCaixaDetalhe.InitDataModule;
begin
  dtmFIN_FluxoCaixaDetalhe := TdtmFIN_FluxoCaixaDetalhe.Create ( nil ) ;
  dtsDetalheFluxo.DataSet :=  dtmFIN_FluxoCaixaDetalhe.OpenTables ( FTipo, FData ) ;
end;

procedure TfrmFIN_FluxoCaixaDetalhe._btbCancelClick(Sender: TObject);
begin
//  TfqrSYS_PrintGrid.MakeReport( JvDBUltimGrid1, _lblCaption.Caption );
end;

end.
