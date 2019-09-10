unit UZoo_BancoDadosTanquesForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ExtCtrls,
  VCL.Grids, VCL.DBGrids, JvXPBar, JvExControls,
  JvXPCore, JvXPContainer, VCL.Menus, Data.DB, Tc.Data.DB.Helpers, JvErrorIndicator, JvComponentBase,
  JvValidators, VCL.ComCtrls, VCL.ToolWin, VCL.Mask, JvExMask, JvToolEdit,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  SysFormListaFicha, ReportTypes, JvExExtCtrls, JvImage,
  JvExtComponent, JvPanel, Vcl.ImgList, System.Actions, Vcl.DBCtrls, JvComCtrls,
  JvExComCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit, VclTee.TeeGDIPlus,
  VCLTee.Series, VCLTee.TeEngine, VCLTee.StatChar,
  Tc.VCL.FloatPanel, VCLTee.Chart,
  VCLTee.DBChart, VCLTee.CandleCh, VCLTee.TeeTools, VCLTee.TeeProcs,
  System.ImageList, Tc.VCL.Edits.Numbers, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  JvSpin, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  UZoo_BancoDadosTanquesDatamodule, Tc.VCL.Controls.GDIButton,
  Tc.VCL.Extended.Mask, uImageListProvider, Tc.VCL.Application, Wrappers  ;

type
  TZoo_BancoDadosTanquesForm = class(T_FormListaFicha)
    dtsAnalises: TDataSource;
    _pnldbgLista2: TPanel;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel9: TPanel;
    rbShowBrinco: TRadioButton;
    rbShowNomeEstabulo: TRadioButton;
    rbShowNomeCompleto: TRadioButton;
    edtQuickSearch: TJvDBSearchEdit;
    cbxExibirDescartados2: TCheckBox;
    PageControl: TJvPageControl;
    Splitter1: TSplitter;
    tbsDados: TTabSheet;
    tbsGrafico: TTabSheet;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dbgAnalises: TJvDBUltimGrid;
    GridBandTool1: TGridBandTool;
    Grafico: TDBChart;
    TcMPFloatingPanel1: TTcFloatingPanel;
    JvDBUltimGrid2: TJvDBUltimGrid;
    Lactose: TLineSeries;
    TeeFunction1: TExpMovAveFunction;
    Solidos: TLineSeries;
    ESD: TLineSeries;
    Ureia: TLineSeries;
    CCS: TLineSeries;
    CBT: TLineSeries;
    Panel2: TScrollBox;
    gbxItensGrafico: TGroupBox;
    ImageProteina: TImage;
    ImageProducao: TImage;
    ImageCCS: TImage;
    ImageGordura: TImage;
    ImageUreia: TImage;
    shpProducao: TShape;
    shpGordura: TShape;
    shpProteina: TShape;
    shpUreia: TShape;
    shpCCS: TShape;
    cbxLactose: TCheckBox;
    cbxGordura: TCheckBox;
    cbxProteina: TCheckBox;
    cbxUreia: TCheckBox;
    cbxCCS: TCheckBox;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    edData: TTcDBDateEdit;
    edProteina: TTcDBCalcEdit;
    edGordura: TTcDBCalcEdit;
    edLactose: TTcDBCalcEdit;
    edSolidos: TTcDBCalcEdit;
    edESD: TTcDBCalcEdit;
    edCCS: TTcDBCalcEdit;
    edUreia: TTcDBCalcEdit;
    ImageESD: TImage;
    ImageSolidos: TImage;
    cbxST: TCheckBox;
    cbxESD: TCheckBox;
    shpST: TShape;
    shpESD: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label5: TLabel;
    edNumAnalises: TJvSpinEdit;
    Gordura: TLineSeries;
    TeeFunction2: TExpMovAveFunction;
    Proteina: TLineSeries;
    TeeFunction3: TExpMovAveFunction;
    dtsAnalisesPeriodo: TDataSource;
    TeeGDIPlus1: TTeeGDIPlus;
    edCBT: TTcDBCalcEdit;
    ImageCBT: TImage;
    cbxCBT: TCheckBox;
    shpCBT: TShape;
    GroupBox1: TGroupBox;
    BitBtn2: TTcGDIButton;
    TcGDIButton1: TTcGDIButton;
    ChartTool1: TGridBandTool;
    ChartTool2: TGridBandTool;
    ChartTool3: TGridBandTool;
    procedure dtsFichaDataChange(Sender: TObject; Field: TField);
    procedure PageControlChange(Sender: TObject);
    procedure GraficoAfterDraw(Sender: TObject);
    procedure GraficoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edNumAnalisesChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CheckClick(Sender: TObject);
    procedure BuildGraphics ;
    procedure InitForm ;
    function GetHint ( ASerie : TGraphicData ; ARecno : integer ):  string ;
  protected
    { Protected declarations }
    procedure  Pesquisar ; override ;
    procedure SeriesClick(Sender: TChartSeries; ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; x, y: Integer) ;

  public
    { Public declarations }
    Constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation


{$R *.dfm}

procedure TZoo_BancoDadosTanquesForm.BitBtn2Click(Sender: TObject);
begin
  TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).RemoveAnalise ;
end;

procedure TZoo_BancoDadosTanquesForm.BuildGraphics ;
var
   IterateSeries : integer ;
   nSeriePos : integer ;
   LVerticalAxisTitle : string ;

   procedure SetRows ( ARows : integer ) ;
   begin
     TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).Rows := ARows ;
   end;

   procedure AddRemoveGraphicData ( AChecked : boolean ; AGraphicData : TGraphicData ) ;
   begin
    TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).AddRemGraphicDataSelected( AChecked, AGraphicData ) ;
    Grafico.Series[ Ord ( AGraphicData    ) ].Visible := AGraphicData in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected  ;
   end;


begin

   self.Grafico.Title.Caption := 'Análises do tanque' ;
   self.Grafico.Axes.Bottom.Title.Caption := 'Dia da análise' ;
   self.Grafico.Axes.Bottom.ExactDateTime := True ;
//   self.Grafico.AutoRefresh := False ;

   //self.Grafico.Axes.Bottom.Automatic := False ;
   //self.Grafico.Axes.Bottom.Minimum   := 0 ;
   //self.Grafico.Axes.Bottom.Maximum   := 305 ;
   //else
   //self.Grafico.Axes.Bottom.Automatic := True ;

  SetRows ( edNumAnalises.AsInteger ) ;
  AddRemoveGraphicData ( cbxLactose.Checked,  gdLactose  ) ;
  AddRemoveGraphicData ( cbxGordura.Checked,  gdGordura  ) ;
  AddRemoveGraphicData ( cbxProteina.Checked, gdProteina ) ;

  AddRemoveGraphicData ( cbxCCS.Checked,      gdCCS      ) ;
  AddRemoveGraphicData ( cbxCBT.Checked,      gdCBT      ) ;

  AddRemoveGraphicData ( cbxUreia.Checked,    gdUreia    ) ;

  AddRemoveGraphicData ( cbxST.Checked,       gdST       ) ;
  AddRemoveGraphicData ( cbxESD.Checked,      gdESD      ) ;

  Grafico.Series[ Ord (  gdLactose   ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;
  Grafico.Series[ Ord (  gdGordura   ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;
  Grafico.Series[ Ord (  gdProteina  ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;

  Grafico.Series[ Ord (  gdCCS       ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;
  Grafico.Series[ Ord (  gdCBT       ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;

  Grafico.Series[ Ord (  gdUreia     ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;

  Grafico.Series[ Ord (  gdST        ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;
  Grafico.Series[ Ord (  gdESD       ) ].DataSource := TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).cdsAnalisesPeriodo ;

  TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).OpenData ;

  nSeriePos := - 10 ;

//  Grafico.Series[ Ord (  gdLactose ) ].GetVertAxis.Maximum := ParametrosFazenda( LoggedUser.DomainID ).EscalaGraficoProducao ;

  if ( [ gdLactose, gdGordura, gdProteina ] * TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected <> []) then
    begin
      LVerticalAxisTitle := '' ;

      if ( gdLactose in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected  ) then
         LVerticalAxisTitle := 'Lactose' ;

      if gdGordura in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected then
        if LVerticalAxisTitle = ''  then
           LVerticalAxisTitle := 'Gordura'
        else
           LVerticalAxisTitle := LVerticalAxisTitle + ' / Gordura' ;

      if gdProteina in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected then
        if LVerticalAxisTitle = ''  then
           LVerticalAxisTitle := 'Proteína'
        else
           LVerticalAxisTitle := LVerticalAxisTitle + ' / Proteína' ;

        Grafico.Series[ Ord (  gdLactose   ) ].GetVertAxis.Title.Caption   := LVerticalAxisTitle ;
        Grafico.Series[ Ord (  gdLactose   ) ].GetVertAxis.Visible := True ;

    end
  else
        Grafico.Series[ Ord (  gdLactose   ) ].GetVertAxis.Visible := False ;

//  Grafico.Series[ Ord (  gdGordura   ) ].GetVertAxis.Visible := ( (TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected * [ gdGordura, gdProteina ]) <> [] ) ;
  if ( (TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected * [ gdCCS, gdCBT ]) <> [] ) then
   begin
      LVerticalAxisTitle :=  '' ;

      Grafico.Series[ Ord (  gdCCS   ) ].GetVertAxis.PositionPercent := nSeriePos ;

      if ( gdCCS in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected  ) then
         LVerticalAxisTitle := 'CCS' ;

      if gdCBT in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected then
        if LVerticalAxisTitle = ''  then
           LVerticalAxisTitle := 'CBT'
        else
           LVerticalAxisTitle := LVerticalAxisTitle + ' / CBT' ;

      Grafico.Series[ Ord (  gdCCS   ) ].GetVertAxis.Title.Caption   := LVerticalAxisTitle ;
      Grafico.Series[ Ord (  gdCCS   ) ].GetVertAxis.Visible := True ;
      Grafico.Series[ Ord (  gdCBT   ) ].GetVertAxis.Visible := True ;

    Dec ( nSeriePos, 50 ) ;
   end ;

  if ( TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected * [ gdUreia ] <> [] ) then
   begin
    Grafico.Series[ Ord (  gdUreia  ) ].GetVertAxis.PositionPercent := nSeriePos ;
    Dec ( nSeriePos, 50 ) ;
   end ;

  if ( TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected * [ gdST, gdESD ] <> [] ) then
   begin

      LVerticalAxisTitle :=  '' ;

      Grafico.Series[ Ord (  gdST   ) ].GetVertAxis.PositionPercent := nSeriePos ;

      if ( gdST in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected  ) then
         LVerticalAxisTitle := 'Sólidos totais' ;

      if gdESD in TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected then
        if LVerticalAxisTitle = ''  then
           LVerticalAxisTitle := 'ESD'
        else
           LVerticalAxisTitle := LVerticalAxisTitle + ' / ESD' ;

      Grafico.Series[ Ord (  gdST   ) ].GetVertAxis.Title.Caption   := LVerticalAxisTitle ;
      Grafico.Series[ Ord (  gdST   ) ].GetVertAxis.Visible := True ;

      Dec ( nSeriePos, 50 ) ;
   end ;


  for IterateSeries := 0 to Grafico.SeriesCount - 1 do
       if Grafico.Series[ IterateSeries ].Visible then
           Grafico.Series[IterateSeries].CheckDataSource ;


//  lblPeriodo.Caption := format ( 'de : %s a %s', [
//       FormatDateTime( 'dd.mm.yyyy', TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).inicioPeriodo ),
//       FormatDateTime( 'dd.mm.yyyy', TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).FimPeriodo ) ] ) ;

  Grafico.MarginRight := Abs ( nSeriePos ) - 10 ;

  Grafico.Visible :=  TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).GraphicDataSelected <> []

end;

procedure TZoo_BancoDadosTanquesForm.CheckClick(Sender: TObject);
begin
   BuildGraphics;
end;

constructor TZoo_BancoDadosTanquesForm.Create(AOwner: TComponent);
begin
  inherited;

  TcMPFloatingPanel1.Visible := debughook <> 0 ;

  PageControl.ActivePage := tbsDados ;
  ActiveFicha ;

  TZoo_BancoDadosTanquesDatamodule.Create ( self ) ;

  dtsAnalises.DataSet := TZoo_BancoDadosTanquesDatamodule( DatamoduleBase ).cdsAnalises ;
  DatamoduleBase.OpenTables ;
  InitForm ;

end;

procedure TZoo_BancoDadosTanquesForm.dtsFichaDataChange(Sender: TObject;
  Field: TField);
begin
  if PageControl.ActivePage = tbsGrafico then
    BuildGraphics ;
end;

procedure TZoo_BancoDadosTanquesForm.edNumAnalisesChange(Sender: TObject);
begin
  if PageControl.ActivePage = tbsGrafico then
    BuildGraphics ;
end;

procedure TZoo_BancoDadosTanquesForm.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = tbsGrafico then
    BuildGraphics ;
end;

procedure TZoo_BancoDadosTanquesForm.Pesquisar;
begin
  inherited ;

{
  with TdtmCAD_Entidades( DatamoduleBase ), TSearchEntidade.Create do
     try
        TextToFind := _edtSearch.Text ;
        if Execute then
          begin
             cdsList.Locate( 'KCAD_ENTIDADE',
                     Result.FieldByName( 'KCAD_ENTIDADE' ).Value, [] ) ;
             ActiveFicha ;
          end ;
     finally
        free ;
     end ;
}
end;

procedure TZoo_BancoDadosTanquesForm.SeriesClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; x, y: Integer);
begin

 // showMessage ( 'sc ' + Sender.Name + ' ' + IntToStr ( ValueIndex ) )
  if Sender = Lactose       then
    Lactose.Pointer.Visible := not Lactose.Pointer.Visible ;
  if Sender = Gordura       then
    Gordura.Pointer.Visible := not Gordura.Pointer.Visible ;
  if Sender = Proteina      then
    Proteina.Pointer.Visible := not Proteina.Pointer.Visible ;

  if Sender = CCS then
    CCS.Pointer.Visible := not CCS.Pointer.Visible ;
  if Sender = CBT then
    CBT.Pointer.Visible := not CBT.Pointer.Visible ;


  if Sender = Ureia then
    Ureia.Pointer.Visible := not Ureia.Pointer.Visible ;

  if Sender = Solidos then
    Solidos.Pointer.Visible := not Solidos.Pointer.Visible ;
  if Sender = ESD then
    ESD.Pointer.Visible := not ESD.Pointer.Visible ;

end;

procedure TZoo_BancoDadosTanquesForm.TcGDIButton1Click(Sender: TObject);
begin
  inherited;
  TZoo_BancoDadosTanquesDatamodule ( DatamoduleBase ).AddAnalise ;
  dbgAnalises.SetFocus ;
end;

procedure TZoo_BancoDadosTanquesForm.InitForm;
var
  IterateSeries : integer ;
begin

  with TZoo_BancoDadosTanquesDatamodule( DatamoduleBase ) do
    begin

      edNumAnalises.AsInteger := Rows ;
      cbxLactose.Checked          :=  gdLactose   in GraphicDataSelected ;
      cbxGordura.Checked          :=  gdGordura   in GraphicDataSelected ;
      cbxProteina.Checked         :=  gdProteina  in GraphicDataSelected ;
      cbxUreia.Checked            :=  gdUreia     in GraphicDataSelected ;
      cbxCCS.Checked              :=  gdCCS       in GraphicDataSelected ;
      cbxCBT.Checked              :=  gdCBT       in GraphicDataSelected ;
      cbxST.Checked               :=  gdST        in GraphicDataSelected ;
      cbxESD.Checked              :=  gdESD       in GraphicDataSelected ;

      cbxLactose.OnClick          :=  CheckClick ;
      cbxGordura.OnClick          :=  CheckClick ;
      cbxProteina.OnClick         :=  CheckClick ;
      cbxCCS.OnClick              :=  CheckClick ;
      cbxCBT.OnClick              :=  CheckClick ;
      cbxUreia.OnClick            :=  CheckClick ;
      cbxST.OnClick               :=  CheckClick ;
      cbxESD.OnClick              :=  CheckClick ;


      Lactose.ClickableLine       := True ;
      Gordura.ClickableLine       := True ;
      Proteina.ClickableLine      := True ;
      CCS.ClickableLine           := True ;
      CBT.ClickableLine           := True ;
      Ureia.ClickableLine         := True ;
      Solidos.ClickableLine       := True ;
      ESD.ClickableLine           := True ;

      for IterateSeries := 0 to Grafico.SeriesCount - 1 do
        begin
         TLineSeries( Grafico.Series[ IterateSeries ] ).TreatNulls := tnSkip ; // tnIgnore ;
         Grafico.Series[ IterateSeries ].OnClick := self.SeriesClick ;
        end;

      shpGordura.Pen.Color  := Gordura.Color ;
      shpProteina.Pen.Color := Proteina.Color ;
      shpUreia.Pen.Color    := Ureia.Color ;

      shpCCS.Pen.Color      := CCS.Color ;
      shpCBT.Pen.Color      := CBT.Color ;

      shpUreia.Pen.Color    := Ureia.Color ;

      shpST.Pen.Color       := Solidos.Color ;
      shpESD.Pen.Color      := ESD.Color ;


      //Produção
      //Gráfico de linha que exibe o total de leite do dia de uma ou mais lactações selecionadas,
      //para eixo X as datas e eixo Y o valor da pesagem total – traça a curva de lactação do animal

      Grafico.Series[ Ord ( gdLactose         ) ].YValues.ValueSource := 'LACTOSE';
      Grafico.Series[ Ord ( gdLactose         ) ].XValues.ValueSource := 'DATA';

      Grafico.Series[ Ord ( gdLactose         ) ].DataSource :=   cdsAnalisesPeriodo ;

      //Gordura
      //Gráfico com pontos que exibe o valor das análises de gordura do tanque no perído selecionado,
      //para eixo X as datas e eixo Y o valor das análises. - traça a curva de produção do animal


      Grafico.Series[ Ord ( gdGordura          ) ].YValues.ValueSource := 'GORDURA' ;
      Grafico.Series[ Ord ( gdGordura          ) ].XValues.ValueSource := 'DATA';

      //Proteína
      //Gráfico com pontos que exibe o valor das análises de proteína das pesagens de leite da última lacta
      //ção, para eixo X as datas e eixo Y o valor das análises. - traça a curva de produção do animal

      Grafico.Series[ Ord ( gdProteina         ) ].YValues.ValueSource := 'PROTEINA';
      Grafico.Series[ Ord ( gdProteina         ) ].XValues.ValueSource := 'DATA';

      //Ureia
      // Gráfico com pontos que exibe o valor das análises de Ureia do tanque no perído selecionado,
      // para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdUreia            ) ].YValues.ValueSource := 'UREIA';
      Grafico.Series[ Ord ( gdUreia            ) ].XValues.ValueSource := 'DATA';

      //CCS
      // Gráfico com pontos que exibe o valor das análises de CCS do tanque no perído selecionado ,
      //  para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdCCS              ) ].YValues.ValueSource := 'CCS';
      Grafico.Series[ Ord ( gdCCS              ) ].XValues.ValueSource := 'DATA';

      //CBT
      // Gráfico com pontos que exibe o valor das análises de CBT do tanque no perído selecionado ,
      //  para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdCBT              ) ].YValues.ValueSource := 'CBT';
      Grafico.Series[ Ord ( gdCBT              ) ].XValues.ValueSource := 'DATA';

      //ST
      // Gráfico com pontos que exibe o valor das análises de ST do tanque no perído selecionado ,
      //  para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdST       ) ].YValues.ValueSource := 'ST';
      Grafico.Series[ Ord ( gdST       ) ].XValues.ValueSource := 'DATA';

      //ESD
      // Gráfico com pontos que exibe o valor das análises de ESD do tanque no perído selecionado ,
      //  para eixo X as datas e eixo Y o valor das análises.

      Grafico.Series[ Ord ( gdESD      ) ].YValues.ValueSource := 'ESD';
      Grafico.Series[ Ord ( gdESD      ) ].XValues.ValueSource := 'DATA';

      Grafico.Series[ Ord ( gdLactose  ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdGordura  ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdProteina ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdUreia    ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdCCS      ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdCBT      ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdST       ) ].DataSource :=   cdsAnalisesPeriodo ;
      Grafico.Series[ Ord ( gdESD      ) ].DataSource :=   cdsAnalisesPeriodo ;

    end ;

  Grafico.Legend.Visible := False ;

end;

function TZoo_BancoDadosTanquesForm.GetHint(ASerie: TGraphicData;
  ARecno: integer): string;
const
  _HINT =  '%s: %s - %s'#13#10 ;
var
  cdsAnalisePeriodo  : TClientDataSet ;
begin
  //ARecno := ARecno + 1 ;

  cdsAnalisePeriodo  := TZoo_BancoDadosTanquesDatamodule( DatamoduleBase ).cdsAnalisesPeriodo ;

  ARecno := cdsAnalisePeriodo.RecordCount - ARecno ;

  with TZoo_BancoDadosTanquesDatamodule( DatamoduleBase ) do
  case ASerie of
       gdLactose :
         begin
          cdsAnalisePeriodo.Recno := ARecno ;
          Result  :=  Format ( _HINT,
                [ 'Lactose', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'LACTOSE' ).asString + '%' ] ) ;
         end ;
       gdGordura :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Gordura', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'GORDURA' ).asString + '%' ] ) ;
         end;
       gdProteina               :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Proteína', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'PROTEINA' ).asString + '%' ] ) ;
         end;
       gdCCS                    :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'CCS', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'CCS' ).asString  ] ) ;
         end;
       gdCBT                    :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'CBT', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'CBT' ).asString  ] ) ;
         end;
       gdUreia                  :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Ureia', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'UREIA' ).asString + '%' ] ) ;
         end;
       gdST                  :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'Sólidos totais', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'ST' ).asString + '%' ] ) ;
         end;
       gdESD                  :
         begin
           cdsAnalisePeriodo.Recno := ARecno ;
           Result  :=  Format ( _HINT,
                [ 'ESD', cdsAnalisePeriodo.FieldByName ( 'DATA' ).asString, cdsAnalisePeriodo.FieldByName ( 'ESD' ).asString + '%' ] ) ;
         end;
  end;
end;

procedure TZoo_BancoDadosTanquesForm.GraficoAfterDraw(Sender: TObject);
Var
 x : integer ;
begin
  With Grafico do
   Begin



     If SeriesCount > 0 Then
     begin


       If Lactose.Visible and Lactose.Pointer.Visible then
       begin
         //Add some Shapes
         Canvas.Pen.Color := clBlue;
         Canvas.Pen.Width := 1;
         Canvas.Pen.Style := psDot;
         Canvas.Brush.Style := bsClear;
         for x := 0 to Lactose.XValues.Count - 1 do
           if Lactose.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(Lactose.XValues[x]) - 8,
                         Lactose.CalcYPosValue( Lactose.YValues[x] ) - 8,
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
           if Gordura.YValues[x] > 0 then
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
           if Proteina.YValues[x] > 0 then
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
           if CCS.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(CCS.XValues[x]) - 8,
                         CCS.CalcYPosValue( CCS.YValues[x] ) - 8,
                         ImageCCS.Picture.Bitmap  ) ;
       end;

       If CBT.Visible  and CBT.Pointer.Visible  Then
       begin
         //Add some Shapes
         Canvas.Pen.Color := clBlue;
         Canvas.Pen.Width := 1;
         Canvas.Pen.Style := psDot;
         Canvas.Brush.Style := bsClear;
         for x := 0 to CBT.XValues.Count - 1 do
           if CBT.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(CBT.XValues[x]) - 8,
                         CBT.CalcYPosValue( CBT.YValues[x] ) - 8,
                         ImageCBT.Picture.Bitmap  ) ;
       end;

       If Ureia.Visible  and Ureia.Pointer.Visible  Then
       begin
         //Add some Shapes
         Canvas.Pen.Color := clBlue;
         Canvas.Pen.Width := 1;
         Canvas.Pen.Style := psDot;
         Canvas.Brush.Style := bsClear;
         for x := 0 to Ureia.XValues.Count - 1 do
           if Ureia.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(Ureia.XValues[x]) - 8,
                         Ureia.CalcYPosValue( Ureia.YValues[x] ) - 8,
                         ImageUreia.Picture.Bitmap  ) ;
       end;

       If Solidos.Visible and Solidos.Pointer.Visible  Then
       begin
         //Add some Shapes
         Canvas.Pen.Color := clBlue;
         Canvas.Pen.Width := 1;
         Canvas.Pen.Style := psDot;
         Canvas.Brush.Style := bsClear;
         for x := 0 to Solidos.XValues.Count - 1 do
           if Solidos.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(Solidos.XValues[x]) - 8,
                         Solidos.CalcYPosValue( Solidos.YValues[x] ) - 8,
                         ImageSolidos.Picture.Bitmap  ) ;
       end;

       If ESD.Visible and ESD.Pointer.Visible  Then
       begin
         //Add some Shapes
         Canvas.Pen.Color := clBlue;
         Canvas.Pen.Width := 1;
         Canvas.Pen.Style := psDot;
         Canvas.Brush.Style := bsClear;
         for x := 0 to ESD.XValues.Count - 1 do
           if ESD.YValues[x] > 0 then
           Canvas.Draw ( BottomAxis.CalcXPosValue(ESD.XValues[x]) - 8,
                         ESD.CalcYPosValue( ESD.YValues[x] ) - 8,
                         ImageESD.Picture.Bitmap  ) ;
       end;

     end;
   end;

end;



procedure TZoo_BancoDadosTanquesForm.GraficoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  SeriesIndex, IterateSeries : integer ;
  HintMsg : string ;
begin
  SeriesIndex  := -1 ;

  HintMsg := '' ;

  for IterateSeries := 0 to Grafico.SeriesCount - 1 do
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

initialization

   RegisterClass ( TZoo_BancoDadosTanquesForm ) ;

end.
