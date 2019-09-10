unit UfrmZoo_OcorrenciasAninal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmZoo_OcorrenciasAninal, SysForms, VCL.ActnList, Data.DB, Tc.Data.DB.Helpers,
  KControls, KGrids, KDBGrids, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.VCL.FormIntf, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ComCtrls, Wrappers ;

type
  TfrmZoo_OcorrenciasAninal = class(T_Form, ITcDataForm)
    dtsOcorrenciasGroup: TDataSource;
    KDBGrid1: TKDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsOcorrenciasCronologica: TDataSource;
    procedure KDBGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; R: TRect;
      State: TKGridDrawState);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    dtmZoo_OcorrenciasAninal : TdtmZoo_OcorrenciasAninal ;
    procedure SetMasterSource(const Value: TDataSource);
    procedure RebuildCells( Sender : TObject ) ;
    procedure NeedRefresh ( Sender : TObject ) ;
    //ITcDataForm
    function GetBOF : boolean ;
    function GetEOF : boolean ;
    procedure InsertRecord ;
    procedure EditRecord ;
    procedure DeleteRecord ;
    procedure Save ;
    procedure Cancel ;
    procedure PrintData ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses   UZoo_SanidadeDiagnosticosWizard,
       UZoo_SanidadeProtocolosWizard,
       SysPrintGridDialog,
       Tc.VCL.Graphics,
       KGraphics ;


{ TfrmZoo_OcorrenciasAninal }

procedure TfrmZoo_OcorrenciasAninal.Cancel;
begin
  dtmZoo_OcorrenciasAninal.CancelUpdates
end;

constructor TfrmZoo_OcorrenciasAninal.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   dtmZoo_OcorrenciasAninal := TdtmZoo_OcorrenciasAninal.Create ( self ) ;
   dtsOcorrenciasGroup.DataSet := dtmZoo_OcorrenciasAninal.cdsOcorrenciasGroup ;
   dtsOcorrenciasCronologica.DataSet := dtmZoo_OcorrenciasAninal.cdsOcorrenciasCronologica ;
   dtmZoo_OcorrenciasAninal.OnRebuildGridCells := RebuildCells ;
   NotificationService.SubscribeStr( NeedRefresh,
                                 [ 'PROCESS_TZoo_ReproducaoCiosCoberturasWizard',
                                   'PROCESS_TZoo_SanidadeDiagnosticosWizard',
                                   'PROCESS_TZoo_SanidadeProtocolosWizard',
                                   'PROCESS_TZoo_ProducaoSecagemWizard' ] );
end;

procedure TfrmZoo_OcorrenciasAninal.DeleteRecord;
begin
  dtmZoo_OcorrenciasAninal.DeleteRecord
end;

destructor TfrmZoo_OcorrenciasAninal.Destroy;
begin
  NotificationService.UnSubscribe( [ NeedRefresh ] );
  inherited;
end;

procedure TfrmZoo_OcorrenciasAninal.EditRecord;
begin
  dtmZoo_OcorrenciasAninal.EditRecord
end;

function TfrmZoo_OcorrenciasAninal.GetBOF: boolean;
begin

end;

function TfrmZoo_OcorrenciasAninal.GetEOF: boolean;
begin

end;


procedure TfrmZoo_OcorrenciasAninal.InsertRecord;
begin
   TZoo_SanidadeDiagnosticosWizard.Execute (  self.MasterSource.DataSet.FieldByName('BRINCO').AsString ) ;
   TZoo_SanidadeProtocolosWizard.Execute   (  self.MasterSource.DataSet.FieldByName('BRINCO').AsString,
                                              self.MasterSource.DataSet.FieldByName('KZOO_ANIMAL' ).AsString ) ;
end;

type
  TKGridCellAccessProtected = class ( TKGridCell ) ;

procedure TfrmZoo_OcorrenciasAninal.KDBGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; R: TRect; State: TKGridDrawState);
begin

  if (ARow < KDBGrid1.FixedRows) and (goHeader in KDBGrid1.Options) then
    begin
     Tc.VCL.Graphics.cyGradientFill(KDBGrid1.Canvas, R, $00EAD1B9, clWhite, dgdVertical, 60, bmMirror, 255, 100);
     DrawEdge(KDBGrid1.Canvas.Handle, R, BDR_RAISEDINNER, KDBGrid1.CellPainter.DefaultEdges);

//     KGraphics.DrawEdges(KDBGrid1.Canvas, R, cl3DHilight, cl3DShadow, DefaultEdges);
     TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).ApplyDrawProperties ;
     KDBGrid1.CellPainter.DrawCellCommon ;
    end
  else
    begin
     TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).ApplyDrawProperties ;
     TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).DrawCell ( ACol, ARow, R, State ) ;
    end;

end;

procedure TfrmZoo_OcorrenciasAninal.NeedRefresh(Sender: TObject);
begin
  dtmZoo_OcorrenciasAninal.ChangeOcorrencias ;
end;

procedure TfrmZoo_OcorrenciasAninal.OtherOptions;
begin

end;

procedure TfrmZoo_OcorrenciasAninal.PrintData;
begin
//  SysPrintGridDialog
   showMessage ( 'necessário implementar impressão específica' )
end;

function TfrmZoo_OcorrenciasAninal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,daEdit, { daDelete, } daPrint ] ;
end;

function TfrmZoo_OcorrenciasAninal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert, daEdit, daDelete ] ;
end;

procedure TfrmZoo_OcorrenciasAninal.RebuildCells;
var
  LastDiagnostico, LastProtocolo : string ;
  FirstRowDiagnostico, countDiag, FirstRowProtocolo, countProtocolo, FirstCol : integer ;
begin
//  KDBGrid1.CellSpan[1, 1] := MakeCellSpan( 1 ,  2 );
//  KDBGrid1.DataSource := nil  ;
//  KDBGrid1.DataSource := dtsOcorrencias ;


  FirstCol := -1 ;

  with dtmZoo_OcorrenciasAninal, cdsOcorrenciasGroup, KDBGrid1 do
    begin
//      disableControls ;
      first ;
      FirstRowDiagnostico := 2 ;
      FirstRowProtocolo   := 2 ;
      while not eof do
        begin
           countDiag := 0 ;
           LastDiagnostico  := cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO.AsString ;
           while not eof and ( LastDiagnostico  = cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO.AsString ) do
              begin
                 countProtocolo := 0 ;
                 LastProtocolo := cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO.AsString ;
                 while not eof
                   and ( LastDiagnostico  = cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO.AsString )
                   and ( LastProtocolo  = cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO.AsString ) do
                     begin
                      countProtocolo := countProtocolo + 1 ;
                      Next ;
                     end;
                 KDBGrid1.CellSpan[FirstCol + 5, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol + 6, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol + 7, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol + 8, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol + 9, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 FirstRowProtocolo := FirstRowProtocolo + countProtocolo ;
                 countDiag := countDiag + countProtocolo ;
              end;
           if eof or ( LastDiagnostico <> cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO.AsString ) then
              begin
                 KDBGrid1.CellSpan[FirstCol + 1, FirstRowDiagnostico] := MakeCellSpan( 0 ,  countDiag );
                 KDBGrid1.CellSpan[FirstCol + 2, FirstRowDiagnostico] := MakeCellSpan( 0 ,  countDiag );
                 KDBGrid1.CellSpan[FirstCol + 3, FirstRowDiagnostico] := MakeCellSpan( 0 ,  countDiag );
                 KDBGrid1.CellSpan[FirstCol + 4, FirstRowDiagnostico] := MakeCellSpan( 0 ,  countDiag );
                 KDBGrid1.CellSpan[FirstCol + 5, FirstRowDiagnostico] := MakeCellSpan( 0 ,  countDiag );
                 FirstRowDiagnostico := FirstRowDiagnostico + countDiag
              end
           else
              Next ;
         end ;
//      enableControls ;
    end;


  KDBGrid1.Cell[ FirstCol + 1, 1 ]  := KDBGrid1.Cell[ FirstCol + 1, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 2, 1 ]  := KDBGrid1.Cell[ FirstCol + 2, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 3, 1 ]  := KDBGrid1.Cell[ FirstCol + 3, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 4, 1 ]  := KDBGrid1.Cell[ FirstCol + 4, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 5, 1 ]  := KDBGrid1.Cell[ FirstCol + 5, 0 ] ;

  KDBGrid1.Cell[ FirstCol + 6, 1 ]  := KDBGrid1.Cell[ FirstCol + 6, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 7, 1 ]  := KDBGrid1.Cell[ FirstCol + 7, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 8, 1 ]  := KDBGrid1.Cell[ FirstCol + 8, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 9, 1 ]  := KDBGrid1.Cell[ FirstCol + 9, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 10, 1 ]  := KDBGrid1.Cell[ FirstCol + 10, 0 ] ;

  KDBGrid1.Cell[ FirstCol + 11, 1 ]  := KDBGrid1.Cell[ FirstCol + 11, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 12, 1 ]  := KDBGrid1.Cell[ FirstCol + 12, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 13, 1 ]  := KDBGrid1.Cell[ FirstCol + 13, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 14, 1 ]  := KDBGrid1.Cell[ FirstCol + 14, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 15, 1 ]  := KDBGrid1.Cell[ FirstCol + 15, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 16, 1 ]  := KDBGrid1.Cell[ FirstCol + 16, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 17, 1 ]  := KDBGrid1.Cell[ FirstCol + 17, 0 ] ;

  KDBGrid1.CellSpan[ FirstCol + 1, 0 ] := MakeCellSpan( 5 ,  0 );
  KDBGrid1.CellSpan[ FirstCol + 6, 0 ] := MakeCellSpan( 5 ,  0 );
  KDBGrid1.CellSpan[ FirstCol + 11, 0 ] := MakeCellSpan( 8 ,  0 );

  KDBGrid1.Repaint ;
end ;

procedure TfrmZoo_OcorrenciasAninal.Save;
begin
  dtmZoo_OcorrenciasAninal.ApplyUpdates
end;

procedure TfrmZoo_OcorrenciasAninal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_OcorrenciasAninal.MasterSource  := FMasterSource ;
  dtmZoo_OcorrenciasAninal.OpenTables ;
end;

end.
