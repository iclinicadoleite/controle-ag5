unit UfrmZoo_GraficoLactacaoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   TeEngine, TeeFunci, Series, VCL.ExtCtrls, TeeProcs, Chart, DBChart,
  UdtmZoo_GraficoLactacaoAnimal, Data.DB, Tc.Data.DB.Helpers, VCL.StdCtrls, VCL.DBCtrls, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, CandleCh, Tc.VCL.FloatPanel, VCL.ImgList,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, StatChar, TeeSpline, CurvFitt, TeeHistogram, TeePVOFunction,
  VCL.ActnList, VclTee.TeeGDIPlus, System.ImageList, System.Actions,
  Tc.VCL.Form, Tc.VCL.Application ;

type
  TfrmZoo_GraficoLactacaoAnimal = class(TTcForm)
    dtsLactacao: TDataSource;
    Grafico: TDBChart;
    ProducaoLeite: TPointSeries;
    Panel2: TScrollBox;
    gbxProdutivo: TGroupBox;
    GroupBox2: TGroupBox;
    gbxCrescimento: TGroupBox;
    GroupBox4: TGroupBox;
    cbxProducao: TCheckBox;
    cbxGordura: TCheckBox;
    cbxProteina: TCheckBox;
    cbxUreia: TCheckBox;
    cbxCCS: TCheckBox;
    cbxTrocaLote: TCheckBox;
    cbxCiosMontaIA: TCheckBox;
    cbxBST: TCheckBox;
    cbxAltura: TCheckBox;
    cbxPeso: TCheckBox;
    cbxCondicaoCorporal: TCheckBox;
    cbxDiagnosticos: TCheckBox;
    dtsPesagens: TDataSource;
    GroupBox1: TGroupBox;
    rbPeriodoProdutivo: TRadioButton;
    rbCrescimento: TRadioButton;
    dblcLactacao: TDBLookupComboBox;
    BST: TVolumeSeries;
    Lote: TVolumeSeries;
    Reproducao: TVolumeSeries;
    Diagnosticos: TVolumeSeries;
    cbxGraphic305d: TCheckBox;
    lblPeriodo: TLabel;
    TcMPFloatingPanel1: TTcFloatingPanel;
    JvDBUltimGrid1: TJvDBUltimGrid;
    ImageLote: TImage;
    ApplIcons: TImageList;
    ImageAltura: TImage;
    ImagePeso: TImage;
    ImageReproducao: TImage;
    ImageDiagnostico: TImage;
    cbxGraficoAte1aLactacao: TCheckBox;
    Label1: TLabel;
    ImageBST: TImage;
    ImageCondicaoCorporal: TImage;
    CondicaoCorporal: TVolumeSeries;
    CurvaLactacao: TLineSeries;
    ImageProteina: TImage;
    ImageProducao: TImage;
    ImageCCS: TImage;
    ImageGordura: TImage;
    ImageUreia: TImage;
    TeeFunction1: TExpMovAveFunction;
    Gordura: TLineSeries;
    Proteina: TLineSeries;
    shpProducao: TShape;
    shpGordura: TShape;
    shpProteina: TShape;
    shpUreia: TShape;
    shpCCS: TShape;
    Ureia: TLineSeries;
    CCS: TLineSeries;
    Altura: TLineSeries;
    Peso: TLineSeries;
    shpAltura: TShape;
    shpPeso: TShape;
    procedure CheckClick(Sender: TObject);
    procedure dtsLactacaoDataChange(Sender: TObject; Field: TField);
    procedure GraficoAfterDraw(Sender: TObject);
    procedure GraficoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    dtmZoo_GraficoLactacaoAnimal : TdtmZoo_GraficoLactacaoAnimal ;
    FMasterSource: TDataSource;
    lGraphicFix30d : boolean ;
    procedure SetMasterSource(const Value: TDataSource);
    procedure InitForm ;
    procedure BuildGraphics ;
    procedure DesabilitaCampos(Flag : Integer);
    function GetHint ( ASerie : TGraphicData ; ARecno : integer ):  string ;
    procedure SeriesClick(Sender: TChartSeries; ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; x, y: Integer) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

uses UDBZootecnico,
     ClAg5ClientCommonTypes ;

{$R *.dfm}


procedure TfrmZoo_GraficoLactacaoAnimal.BuildGraphics;
var
   IterateSeries : integer ;
   nSeriePos : integer ;
   TitleAxisProducao : string ;

   procedure AddRemoveGraphicData ( AChecked : boolean ; AGraphicData : TGraphicData ) ;
   begin
    dtmZoo_GraficoLactacaoAnimal.AddRemGraphicDataSelected( AChecked, AGraphicData ) ;
    Grafico.Series[ Ord ( AGraphicData    ) ].Visible := AGraphicData in dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected  ;
   end;

begin

   lGraphicFix30d := cbxGraphic305d.Checked ;

  // perido produtivo ....
  if rbPeriodoProdutivo.Checked then
    begin
      self.Grafico.Title.Caption := 'Eventos do período produtivo' ;
      self.Grafico.Axes.Bottom.Title.Caption := 'Dias em Lactação' ;
      if cbxGraphic305d.Checked then
        begin
           dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType := gpProducao305d ;
           self.Grafico.Axes.Bottom.Automatic := False ;
           self.Grafico.Axes.Bottom.Minimum   := 0 ;
           self.Grafico.Axes.Bottom.Maximum   := 305 ;
        end
      else
        begin
          dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType := gpProducao ;
          self.Grafico.Axes.Bottom.Automatic := True ;
        end
    end
  else // periodo crescimento
    begin
      self.Grafico.Title.Caption := 'Eventos no período de crescimento' ;
      self.Grafico.Axes.Bottom.Title.Caption := 'Idade em Dias' ;

      self.Grafico.Axes.Bottom.Automatic := True ;

      if cbxGraficoAte1aLactacao.Checked then
       dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType := gpCresimento1L
      else
       dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType := gpCresimento ;
    end ;

  AddRemoveGraphicData ( cbxProducao.Checked,         gdProducao      ) ;
  AddRemoveGraphicData ( cbxGordura.Checked,          gdGordura       ) ;
  AddRemoveGraphicData ( cbxProteina.Checked,         gdProteina      ) ;
  AddRemoveGraphicData ( cbxUreia.Checked,            gdUreia         ) ;
  AddRemoveGraphicData ( cbxCCS.Checked,              gdCCS           ) ;
  AddRemoveGraphicData ( cbxBST.Checked,              gdBST           ) ;
  AddRemoveGraphicData ( cbxTrocaLote.Checked,        gdTrocaLote     ) ;
  AddRemoveGraphicData ( cbxAltura.Checked,           gdAltura        ) ;
  AddRemoveGraphicData ( cbxPeso.Checked,             gdPeso          ) ;
  AddRemoveGraphicData ( cbxCiosMontaIA.Checked,      gdCiosMontaIA   ) ;
  AddRemoveGraphicData ( cbxCondicaoCorporal.Checked, gdCondicaoCorporal ) ;
  AddRemoveGraphicData ( cbxDiagnosticos.Checked,     gdDiagnosticos  ) ;

  if ( dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
    begin
      Grafico.Series[ Ord (  gdProducao  ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsPesagensLactacao ;
      Grafico.Series[ Ord (  gdGordura   ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesLactacao ;
      Grafico.Series[ Ord (  gdProteina  ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesLactacao ;
      Grafico.Series[ Ord (  gdUreia     ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesLactacao ;
      Grafico.Series[ Ord (  gdCCS       ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesLactacao ;
    end
  else
    begin
      Grafico.Series[ Ord (  gdProducao  ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsPesagensPeriodo ;
      Grafico.Series[ Ord (  gdGordura   ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesPeriodo ;
      Grafico.Series[ Ord (  gdProteina  ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesPeriodo ;
      Grafico.Series[ Ord (  gdUreia     ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesPeriodo ;
      Grafico.Series[ Ord (  gdCCS       ) ].DataSource := self.dtmZoo_GraficoLactacaoAnimal.cdsAnalisesPeriodo ;
    end ;
  dtmZoo_GraficoLactacaoAnimal.OpenData ;

  nSeriePos := - 10 ;

  Grafico.Series[ Ord (  gdProducao   ) ].GetVertAxis.Maximum := ParametrosFazenda( LoggedUser.DomainID ).EscalaGraficoProducao ;

  if ([ gdProducao, gdUreia, gdGordura, gdProteina, gdCCS ] * dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected <> []) then
    begin
      TitleAxisProducao := '' ;

      if ( [ gdProducao, gdGordura, gdProteina, gdCCS ]  * dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected <> [] ) then
         TitleAxisProducao := 'Produção de Leite (kg/dia)' ;

      if gdUreia in dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected then
        if TitleAxisProducao = ''  then
           TitleAxisProducao := 'Uréia'
        else
           TitleAxisProducao := TitleAxisProducao + ' / Uréia' ;

        Grafico.Series[ Ord (  gdProducao   ) ].GetVertAxis.Title.Caption   := TitleAxisProducao ;
        Grafico.Series[ Ord (  gdProducao   ) ].GetVertAxis.Visible := True ;
    end
  else
        Grafico.Series[ Ord (  gdProducao   ) ].GetVertAxis.Visible := False ;

//  Grafico.Series[ Ord (  gdGordura   ) ].GetVertAxis.Visible := ( (dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected * [ gdGordura, gdProteina ]) <> [] ) ;
  if ( (dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected * [ gdGordura, gdProteina ]) <> [] ) then
   begin
    Grafico.Series[ Ord (  gdGordura   ) ].GetVertAxis.PositionPercent := nSeriePos ;
    Dec ( nSeriePos, 50 ) ;
   end ;

  if ( dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected * [ gdCCS ] <> [] ) then
   begin
    Grafico.Series[ Ord (  gdCCS  ) ].GetVertAxis.PositionPercent := nSeriePos ;
    Dec ( nSeriePos, 50 ) ;
   end ;

  if ( dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected * [ gdAltura ] <> [] ) then
   begin
    Grafico.Series[ Ord (  gdAltura  ) ].GetVertAxis.PositionPercent := nSeriePos ;
    Dec ( nSeriePos, 50 ) ;
   end ;

  if ( dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected * [ gdPeso ] <> [] ) then
   begin
    Grafico.Series[ Ord (  gdPeso  ) ].GetVertAxis.PositionPercent := nSeriePos ;
    Dec ( nSeriePos, 50 ) ;
   end ;

  for IterateSeries := 1 to Grafico.SeriesCount - 1 do // nao processa a curva
       if Grafico.Series[ IterateSeries ].Visible then
           Grafico.Series[IterateSeries].CheckDataSource ;

  Grafico.Series[ Ord ( gdCurvaLactacao ) ].Visible := rbPeriodoProdutivo.Checked and
   ([ gdProducao, gdGordura, gdProteina ] * dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected <> []) ;

(*
  if Grafico.Series[ Ord ( gdCurvaLactacao ) ].Visible then
    begin
        if ( dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
        Grafico.Series[ Ord ( gdCurvaLactacao     ) ].DataSource :=   dtmZoo_GraficoLactacaoAnimal.cdsPesagensLactacao
      else
        Grafico.Series[ Ord ( gdCurvaLactacao     ) ].DataSource :=   dtmZoo_GraficoLactacaoAnimal.cdsPesagensPeriodo ;

      Grafico.Series[ Ord ( gdCurvaLactacao ) ].CheckDataSource ;
   end ;
*)
  lblPeriodo.Caption := format ( 'de : %s a %s', [
       FormatDateTime( 'dd.mm.yyyy', dtmZoo_GraficoLactacaoAnimal.inicioPeriodo ),
       FormatDateTime( 'dd.mm.yyyy', dtmZoo_GraficoLactacaoAnimal.FimPeriodo ) ] ) ;

  Grafico.MarginRight := Abs ( nSeriePos ) - 10 ;

  Grafico.Visible :=  dtmZoo_GraficoLactacaoAnimal.GraphicDataSelected <> []

end;


procedure TfrmZoo_GraficoLactacaoAnimal.CheckClick(Sender: TObject);
begin
  if Sender is TRadioButton then
    begin
     if( ((sender as TRadioButton).Name = 'rbPeriodoProdutivo')
      or ((sender as TRadioButton).Name = 'rbCrescimento') ) then
       DesabilitaCampos(((sender as TRadioButton).Tag));
    end;

  BuildGraphics;
end;

constructor TfrmZoo_GraficoLactacaoAnimal.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  TcMPFloatingPanel1.Visible := debughook <> 0 ;

  lGraphicFix30d := True ;

  dtmZoo_GraficoLactacaoAnimal := TdtmZoo_GraficoLactacaoAnimal.Create ( self ) ;
  dtsPesagens.DataSet := dtmZoo_GraficoLactacaoAnimal.cdsPesagensLactacao ;
  dtsLactacao.DataSet := dtmZoo_GraficoLactacaoAnimal.cdsLactacoes ;
  InitForm ;
end;

procedure TfrmZoo_GraficoLactacaoAnimal.DesabilitaCampos(Flag: Integer);
var
 estado1,estado2 : Boolean;
begin
   if (Flag = 0) then
     begin
       estado1 := true;
       estado2 := false;
     end
   else
     begin
       estado1 := false;
       estado2 := true;
     end;

   cbxAltura.Checked    := false;
   cbxPeso.Checked      := false;
   cbxAltura.Enabled    := estado2;
   cbxPeso.Enabled      := estado2;

   cbxGordura.Checked   := false;
   cbxGordura.Enabled   := estado1;
   cbxProteina.Checked  := false;
   cbxProteina.Enabled  := estado1;
   cbxUreia.Checked     := false;
   cbxUreia.Enabled     := estado1;
   cbxCCS.Checked       := false;
   cbxCCS.Enabled       := estado1;
   cbxBST.Checked       := false;
   cbxBST.Enabled       := estado1;
end;

procedure TfrmZoo_GraficoLactacaoAnimal.dtsLactacaoDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned ( dtmZoo_GraficoLactacaoAnimal )  then
     exit ;
  dblcLactacao.KeyValue := self.dtmZoo_GraficoLactacaoAnimal.cdsLactacoesKZOO_LACTACAO.Value ;
  BuildGraphics ;
end;

function TfrmZoo_GraficoLactacaoAnimal.GetHint(ASerie: TGraphicData ; ARecno : integer ): string;
const
  _HINT =  '%s:'#13#10'%s (dia: %d)'#13#10'%s' ;
var
  cdsAnalise  : TClientDataSet ;
  cdsPesagens : TClientDataSet ;
begin
  ARecno := ARecno + 1 ;

  if ( dtmZoo_GraficoLactacaoAnimal.GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
    begin
       cdsAnalise := dtmZoo_GraficoLactacaoAnimal.cdsAnalisesLactacao ;
       cdsPesagens := dtmZoo_GraficoLactacaoAnimal.cdsPesagensLactacao ;
    end
  else
    begin
     cdsAnalise  := dtmZoo_GraficoLactacaoAnimal.cdsAnalisesPeriodo ;
     cdsPesagens := dtmZoo_GraficoLactacaoAnimal.cdsPesagensPeriodo ;
    end;

  with dtmZoo_GraficoLactacaoAnimal do
  case ASerie of
       gdProducao :
         begin
          cdsPesagens.Recno := ARecno ;
          Result  :=  Format ( _HINT,
                [ 'Produção', cdsPesagens.FieldByName ( 'DATA' ).asString, cdsPesagens.FieldByName ( 'DEL' ).asInteger, 'Total ' + cdsPesagens.FieldByName ( 'TOTAL' ).asString ] ) ;
         end ;
       gdGordura :
         begin
           cdsAnalise.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Gordura', cdsAnalise.FieldByName ( 'DATA' ).asString, cdsAnalise.FieldByName ( 'DEL' ).asInteger, cdsAnalise.FieldByName ( 'GORDURA' ).asString + '%' ] ) ;
         end;
       gdProteina               :
         begin
           cdsAnalise.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Proteína', cdsAnalise.FieldByName ( 'DATA' ).asString, cdsAnalise.FieldByName ( 'DEL' ).asInteger, cdsAnalise.FieldByName ( 'PROTEINA' ).asString + '%' ] ) ;
         end;
       gdUreia                  :
         begin
           cdsAnalise.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Uréia', cdsAnalise.FieldByName ( 'DATA' ).asString, cdsAnalise.FieldByName ( 'DEL' ).asInteger, cdsAnalise.FieldByName ( 'UREIA' ).asString + '%' ] ) ;
         end;
       gdCCS                    :
         begin
           cdsAnalise.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'CCS', cdsAnalise.FieldByName ( 'DATA' ).asString, cdsAnalise.FieldByName ( 'DEL' ).asInteger, cdsAnalise.FieldByName ( 'CCS' ).asString  ] ) ;
         end;
       gdBST                    :
         begin
           cdsBST.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'BST', cdsAnalise.FieldByName ( 'DATA' ).asString, cdsBST.FieldByName ( 'DEL' ).asInteger, '' ] ) ;
         end;
       gdTrocaLote              :
         begin
           cdsTrocaLote.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Troca de lote', cdsTrocaLoteDATA.asString, cdsTrocaLoteDEL.asInteger, cdsTrocaLoteANTERIOR.asString + ' ->'  + cdsTrocaLoteLOTE.asString ] ) ;
         end;
       gdAltura                 :
         begin
           cdsCrescimentoAltura.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Altura', cdsCrescimentoAlturaDATA.asString, cdsCrescimentoAlturaDEL.asInteger, cdsCrescimentoAlturaALTURA.asString + ' cm' ] ) ;
         end;
       gdPeso                   :
         begin
           cdsCrescimentoPeso.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Peso', cdsCrescimentoPesoDATA.asString, cdsCrescimentoPesoDEL.asInteger, cdsCrescimentoPesoPESO.asString + ' kg' ] ) ;
         end;
       gdCiosMontaIA            :
         begin
           cdsReprodutivo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Evento Reprodutivo', cdsReprodutivoDATA.asString, cdsReprodutivoDEL.asInteger, cdsReprodutivoEVENTO.asString ] ) ;
         end;
       gdCondicaoCorporal       :
         begin
           cdsSanidadeCondicaoCorporal.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Condição Corporal', cdsSanidadeCondicaoCorporalDATA.asString, cdsSanidadeCondicaoCorporalDEL.asInteger, cdsSanidadeCondicaoCorporalCC.asString ] ) ;
         end;
       gdDiagnosticos           :
         begin
           cdsSanidadeDiagnosticos.RecNo := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Diagnosticos', cdsSanidadeDiagnosticosDATA.asString, cdsSanidadeDiagnosticosDEL.asInteger, cdsSanidadeDiagnosticosDIAGNOSTICO.asString ] ) ;
         end;

  end;
end;

procedure TfrmZoo_GraficoLactacaoAnimal.GraficoAfterDraw(Sender: TObject);
Var
 x : integer ;
begin
With Grafico do
 Begin

   // icone para os eventos


     If BST.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to BST.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(BST.XValues[x]) - 8,
                       BST .CalcYPosValue( 1 ) - 8,
                       ImageBST.Picture.Bitmap  ) ;
     end;

     If LOTE.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to LOTE.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(LOTE.XValues[x]) - 8,
                       LOTE.CalcYPosValue( 1 ) - 8,
                       ImageLOTE.Picture.Bitmap  ) ;
     end;

   If SeriesCount > 0 Then
   begin
     If Reproducao.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Reproducao.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Reproducao.XValues[x]) - 8,
                       Reproducao.CalcYPosValue  ( 1 ) - 8,
                       //Reproducao.CalcYPos( 1 ) - 8,
                       ImageReproducao.Picture.Bitmap  ) ;
     end;

     If Diagnosticos.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Diagnosticos.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Diagnosticos.XValues[x]) - 8,
                       Diagnosticos.CalcYPosValue  ( 1 ) - 8,
                      // Diagnosticos.CalcYPos( 1 ) - 8,
                       ImageDiagnostico.Picture.Bitmap  ) ;
     end;

     If CondicaoCorporal.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to CondicaoCorporal.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(CondicaoCorporal.XValues[x]) - 8,
                       CondicaoCorporal.CalcYPosValue( 1 ) - 8,
                       ImageCondicaoCorporal.Picture.Bitmap  ) ;
     end;

     If ProducaoLeite.Visible and ProducaoLeite.Pointer.Visible then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to ProducaoLeite.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(ProducaoLeite.XValues[x]) - 8,
                       ProducaoLeite.CalcYPosValue( ProducaoLeite.YValues[x] ) - 8,
                       ImageProducao.Picture.Bitmap  ) ;
     end;


     If Gordura.Visible and Gordura.Pointer.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Gordura.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Gordura.XValues[x]) - 8,
                       Gordura.CalcYPosValue( Gordura.YValues[x] ) - 8,
                       ImageGordura.Picture.Bitmap  ) ;
     end;

     If Proteina.Visible and Proteina.Pointer.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Proteina.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Proteina.XValues[x]) - 8,
                       Proteina.CalcYPosValue( Proteina.YValues[x] ) - 8,
                       ImageProteina.Picture.Bitmap  ) ;
     end;

     If CCS.Visible  and CCS.Pointer.Visible  Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to CCS.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(CCS.XValues[x]) - 8,
                       CCS.CalcYPosValue( CCS.YValues[x] ) - 8,
                       ImageCCS.Picture.Bitmap  ) ;
     end;


     If Ureia.Visible  and Ureia.Pointer.Visible  Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Ureia.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Ureia.XValues[x]) - 8,
                       Ureia.CalcYPosValue( Ureia.YValues[x] ) - 8,
                       ImageUreia.Picture.Bitmap  ) ;
     end;

     If Altura.Visible and Altura.Pointer.Visible  Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Altura.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Altura.XValues[x]) - 8,
                       Altura.CalcYPosValue( Altura.YValues[x] ) - 8,
                       ImageAltura.Picture.Bitmap  ) ;
     end;

     If Peso.Visible and Peso.Pointer.Visible Then
     begin
       //Add some Shapes
       Canvas.Pen.Color := clBlue;
       Canvas.Pen.Width := 1;
       Canvas.Pen.Style := psDot;
       Canvas.Brush.Style := bsClear;
       for x := 0 to Peso.XValues.Count - 1 do
         Canvas.Draw ( BottomAxis.CalcXPosValue(Peso.XValues[x]) - 8,
                       Peso.CalcYPosValue( Peso.YValues[x] ) - 8,
                       ImagePeso.Picture.Bitmap  ) ;
     end;

   end;
 end;

end;



procedure TfrmZoo_GraficoLactacaoAnimal.GraficoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  SeriesIndex, IterateSeries : integer ;
  HintMsg : string ;
begin
  SeriesIndex  := -1 ;

  HintMsg := '' ;

  for IterateSeries := 1 to Grafico.SeriesCount - 1 do // nao processa a curva
       if Grafico.Series[ IterateSeries ].Visible then
         begin
           SeriesIndex := Grafico.Series[ IterateSeries ].Clicked(X, Y) ;
           if SeriesIndex <> -1 then
              HintMsg := HintMsg + #13#10 + GetHint ( TGraphicData ( IterateSeries ), SeriesIndex ) ;
         end;

  Grafico.ShowHint := HintMsg <> '' ;
  Grafico.Hint     := HintMsg ;

//    query1.RecNo := SeriesIndex; { this may need to be SeriesIndex + 1 }

end;

procedure TfrmZoo_GraficoLactacaoAnimal.InitForm;
var
  IterateSeries : integer ;
begin

  with dtmZoo_GraficoLactacaoAnimal do
    begin

      cbxProducao.Checked         :=  gdProducao           in GraphicDataSelected ;
      cbxGordura.Checked          :=  gdGordura            in GraphicDataSelected ;
      cbxProteina.Checked         :=  gdProteina           in GraphicDataSelected ;
      cbxUreia.Checked            :=  gdUreia              in GraphicDataSelected ;
      cbxCCS.Checked              :=  gdCCS                in GraphicDataSelected ;
      cbxBST.Checked              :=  gdBST                in GraphicDataSelected ;
      cbxTrocaLote.Checked        :=  gdTrocaLote          in GraphicDataSelected ;
      cbxAltura.Checked           :=  gdAltura             in GraphicDataSelected ;
      cbxPeso.Checked             :=  gdPeso               in GraphicDataSelected ;
      cbxCiosMontaIA.Checked      :=  gdCiosMontaIA        in GraphicDataSelected ;
      cbxCondicaoCorporal.Checked :=  gdCondicaoCorporal   in GraphicDataSelected ;
      cbxDiagnosticos.Checked     :=  gdDiagnosticos       in GraphicDataSelected ;

      cbxProducao.OnClick         :=  CheckClick ;
      cbxGordura.OnClick          :=  CheckClick ;
      cbxProteina.OnClick         :=  CheckClick ;
      cbxUreia.OnClick            :=  CheckClick ;
      cbxCCS.OnClick              :=  CheckClick ;
      cbxBST.OnClick              :=  CheckClick ;
      cbxTrocaLote.OnClick        :=  CheckClick ;
      cbxAltura.OnClick           :=  CheckClick ;
      cbxPeso.OnClick             :=  CheckClick ;
      cbxCiosMontaIA.OnClick      :=  CheckClick ;
      cbxCondicaoCorporal.OnClick :=  CheckClick ;
      cbxDiagnosticos.OnClick     :=  CheckClick ;

     Gordura.ClickableLine       := True ;
     Proteina.ClickableLine      := True ;
     Ureia.ClickableLine         := True ;
     CCS.ClickableLine           := True ;
     Altura.ClickableLine        := True ;
     Peso.ClickableLine          := True ;
     CurvaLactacao.ClickableLine := True ;

     for IterateSeries := 0 to Grafico.SeriesCount - 1 do
        Grafico.Series[ IterateSeries ].OnClick := self.SeriesClick ;

     shpGordura.Pen.Color  := Gordura.Color ;
     shpProteina.Pen.Color := Proteina.Color ;
     shpUreia.Pen.Color    := Ureia.Color ;
     shpCCS.Pen.Color      := CCS.Color ;
     shpAltura.Pen.Color   := Altura.Color ;
     shpPeso.Pen.Color     := Peso.Color ;

    //Produção
    //Gráfico de linha que exibe o total de leite do dia de uma ou mais lactações selecionadas,
    //para eixo X as datas e eixo Y o valor da pesagem total – traça a curva de lactação do animal

      Grafico.Series[ Ord ( gdProducao         ) ].YValues.ValueSource := 'TOTAL';
      Grafico.Series[ Ord ( gdProducao         ) ].XValues.ValueSource := 'DEL';
      if ( GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
         Grafico.Series[ Ord ( gdProducao         ) ].DataSource :=   cdsPesagensLactacao
      else
         Grafico.Series[ Ord ( gdProducao         ) ].DataSource :=   cdsPesagensPeriodo ;

    //Gordura
    //Gráfico com pontos que exibe o valor da análise de gordura das pesagens de leite da última lactação,
    //para eixo X as datas e eixo Y o valor das análises. - traça a curva de produção do animal


      Grafico.Series[ Ord ( gdGordura          ) ].YValues.ValueSource := 'GORDURA' ;
      Grafico.Series[ Ord ( gdGordura          ) ].XValues.ValueSource := 'DEL';

    //Proteína
    //Gráfico com pontos que exibe o valor da análise de proteína das pesagens de leite da última lacta
    //ção, para eixo X as datas e eixo Y o valor das análises. - traça a curva de produção do animal

      Grafico.Series[ Ord ( gdProteina         ) ].YValues.ValueSource := 'PROTEINA';
      Grafico.Series[ Ord ( gdProteina         ) ].XValues.ValueSource := 'DEL';

    //Uréia
    // Gráfico com pontos que exibe o valor da análise de uréia das pesagens de leite da última lactação,
    // para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdUreia            ) ].YValues.ValueSource := 'UREIA';
      Grafico.Series[ Ord ( gdUreia            ) ].XValues.ValueSource := 'DEL';

    //CCS
    // Gráfico com pontos que exibe o valor da análise de CCS das pesagens de leite da última lactação ,
    //  para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdCCS              ) ].YValues.ValueSource := 'CCS';
      Grafico.Series[ Ord ( gdCCS              ) ].XValues.ValueSource := 'DEL';

      if ( GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
       begin
        Grafico.Series[ Ord ( gdGordura          ) ].DataSource :=   cdsAnalisesLactacao ;
        Grafico.Series[ Ord ( gdProteina         ) ].DataSource :=   cdsAnalisesLactacao ;
        Grafico.Series[ Ord ( gdUreia            ) ].DataSource :=   cdsAnalisesLactacao ;
        Grafico.Series[ Ord ( gdCCS              ) ].DataSource :=   cdsAnalisesLactacao ;
       end
     else
       begin
        Grafico.Series[ Ord ( gdGordura          ) ].DataSource :=   cdsAnalisesPeriodo ;
        Grafico.Series[ Ord ( gdProteina         ) ].DataSource :=   cdsAnalisesPeriodo ;
        Grafico.Series[ Ord ( gdUreia            ) ].DataSource :=   cdsAnalisesPeriodo ;
        Grafico.Series[ Ord ( gdCCS              ) ].DataSource :=   cdsAnalisesPeriodo ;
       end;


    //BST
    //  Gráfico de linha que exibe a aplicação de BST para o animal, para eixo X as datas de aplicação, com uma
    // reta vertical marcando essa aplicação.

     Grafico.Series[ Ord ( gdBST              ) ].YValues.ValueSource := 'BST';
     Grafico.Series[ Ord ( gdBST              ) ].XValues.ValueSource := 'DEL';
     Grafico.Series[ Ord ( gdBST              ) ].DataSource :=   cdsBST ;

    // Troca de Lote
    // Gráfico de linha que exibe a troca de lote do animal, para eixo X as datas de troca,
    // com uma reta vertical marcando essa alteração.

      Grafico.Series[ Ord ( gdTrocaLote        ) ].YValues.ValueSource := 'OCORRENCIA';
      Grafico.Series[ Ord ( gdTrocaLote        ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdTrocaLote        ) ].DataSource :=  cdsTrocaLote ;


    // Crescimento - Altura
    // Gráfico de linha que exibe a altura durante a vida do animal, para eixo X as datas de medição
    // e eixo Y o valor da altura.

      Grafico.Series[ Ord ( gdAltura           ) ].YValues.ValueSource := 'ALTURA';
      Grafico.Series[ Ord ( gdAltura           ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdAltura           ) ].DataSource :=  cdsCrescimentoAltura ;

  	// Peso
    // Gráfico de linha que exibe o peso durante a vida do animal, para eixo X as datas de medição
    // e eixo Y o valor do peso.

      Grafico.Series[ Ord ( gdPeso             ) ].YValues.ValueSource := 'PESO';
      Grafico.Series[ Ord ( gdPeso             ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdPeso             ) ].DataSource :=  cdsCrescimentoPeso ;

    // Eventos Reprodutivos
    //  Traça uma linha vertical paralela ao eixo Yna data que houve um evento reprodutivo (cio, monta. IA)

      Grafico.Series[ Ord ( gdCiosMontaIA      ) ].YValues.ValueSource := 'REPRODUCAO';
      Grafico.Series[ Ord ( gdCiosMontaIA      ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdCiosMontaIA      ) ].DataSource :=   cdsReprodutivo ;


     // Sanidade

     // Condição Corporal
     // Gráfico de pontos que exibe a condição corporal durante a vida do animal, para eixo X as
     // datas de medição e eixo Y o valor da condição corporal.

      Grafico.Series[ Ord ( gdCondicaoCorporal ) ].YValues.ValueSource := 'CC';
      Grafico.Series[ Ord ( gdCondicaoCorporal ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdCondicaoCorporal ) ].DataSource :=   cdsSanidadeCondicaoCorporal ;

    // Diagnósticos
    // Traça uma linha vertical paralela ao eixo Y na data que houve um dianóstico. Este aparece no eixo x (ex: mastite clinica)

      Grafico.Series[ Ord ( gdDiagnosticos     ) ].YValues.ValueSource := 'OCORRENCIA';
      Grafico.Series[ Ord ( gdDiagnosticos     ) ].XValues.ValueSource := 'DEL';
      Grafico.Series[ Ord ( gdDiagnosticos     ) ].DataSource :=   cdsSanidadeDiagnosticos ;

    // Curva de Lactacao ...
    // - exibe quando Produção, Gordura ou Proteina esta selecionado

      Grafico.Series[ Ord ( gdCurvaLactacao     ) ].YValues.ValueSource := 'TOTAL';
      Grafico.Series[ Ord ( gdCurvaLactacao     ) ].XValues.ValueSource := 'DEL';

//      if ( GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
//        Grafico.Series[ Ord ( gdCurvaLactacao     ) ].DataSource :=   cdsPesagensLactacao
//      else
//        Grafico.Series[ Ord ( gdCurvaLactacao     ) ].DataSource :=   cdsPesagensPeriodo ;

//      Grafico.Series[ Grafico.SeriesCount -1 ].YValues.ValueSource := 'TOTAL';
//      Grafico.Series[ Grafico.SeriesCount -1  ].XValues.ValueSource := 'DEL';
//      if ( GraphicPeriodType in [ gpProducao, gpProducao305d ] ) then
//        Grafico.Series[ Grafico.SeriesCount -1  ].DataSource :=   cdsPesagensLactacao
//      else
//        Grafico.Series[ Grafico.SeriesCount -1  ].DataSource :=   cdsPesagensPeriodo

    end ;

  Grafico.Legend.Visible := False ;

  DesabilitaCampos(0);
  self.BuildGraphics ;

end;

procedure TfrmZoo_GraficoLactacaoAnimal.SeriesClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; x, y: Integer);
begin
 // showMessage ( 'sc ' + Sender.Name + ' ' + IntToStr ( ValueIndex ) )
  if Sender = Gordura       then
    Gordura.Pointer.Visible := not Gordura.Pointer.Visible ;
  if Sender = Proteina      then
    Proteina.Pointer.Visible := not Proteina.Pointer.Visible ;
  if Sender = Ureia then
    Ureia.Pointer.Visible := not Ureia.Pointer.Visible ;
  if Sender = CCS then
    CCS.Pointer.Visible := not CCS.Pointer.Visible ;
  if Sender = Altura then
    Altura.Pointer.Visible := not Altura.Pointer.Visible ;
  if Sender = Peso then
    Peso.Pointer.Visible := not Peso.Pointer.Visible ;
  if Sender = CurvaLactacao then
    ProducaoLeite.Pointer.Visible := not ProducaoLeite.Pointer.Visible ;


end;

procedure TfrmZoo_GraficoLactacaoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_GraficoLactacaoAnimal.MasterSource := FMasterSource ;
  dtmZoo_GraficoLactacaoAnimal.OpenTables ;
end;

end.
