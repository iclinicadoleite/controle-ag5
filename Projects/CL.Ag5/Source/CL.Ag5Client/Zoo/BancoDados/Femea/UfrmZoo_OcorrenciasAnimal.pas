unit UfrmZoo_OcorrenciasAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmZoo_OcorrenciasAnimal, VCL.ActnList, Data.DB, Tc.Data.DB.Helpers,
  KControls, KGrids, KDBGrids, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.VCL.FormIntf, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ComCtrls, VCL.StdCtrls,
  VCL.ExtCtrls, VCL.DBCtrls, VCL.Mask, JvExMask, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  Tc.VCL.Form,Tc.VCL.Application,
   System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TfrmZoo_OcorrenciasAnimal = class(TTcForm, ITcDataForm)
    dtsOcorrenciasGroup: TDataSource;
    KDBGrid1: TKDBGrid;
    pgcOcorrencias: TPageControl;
    tbsAgrupado: TTabSheet;
    tbsCronologico: TTabSheet;
    dbgOcorrenciasCronologica: TJvDBUltimGrid;
    dtsOcorrenciasCronologica: TDataSource;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    DBMemo1: TDBMemo;
    dbdeDATA: TTcDBDateEdit;
    dbdeEXECUCAO: TTcDBDateEdit;
    dblcStatus: TDBLookupComboBox;
    dtsStatus: TDataSource;
    dbdeREEXECUTAR_EM: TTcDBDateEdit;
    gbMensagem: TPanel;
    Image1: TImage;
    Label17: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    procedure KDBGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; R: TRect;
      State: TKGridDrawState);
    procedure dbgOcorrenciasCronologicaShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    function dbgOcorrenciasCronologicaCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgOcorrenciasCronologicaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgOcorrenciasCronologicaEnter(Sender: TObject);
    procedure dbgOcorrenciasCronologicaEditButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FMasterSource: TDataSource;
    dtmZoo_OcorrenciasAnimal : TdtmZoo_OcorrenciasAnimal ;
    FMessageSync : string ;
    procedure SetMasterSource(const Value: TDataSource);
    procedure RebuildCells( Sender : TObject ) ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
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
    procedure SetFuncionario ( TextToSearch : string);
    procedure DoMessageSync ;
    procedure ShowMessageSync ( AMessage : string ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses   SysTypes,
       UZooQueryInclusaoDiagnosticoProtocoloTarefa,
       UZoo_SanidadeDiagnosticosWizard5,
       UZoo_SanidadeProtocolosWizard,
       SysPrintGridDialog,
       Tc.RTL.Exceptions,
       Tc.VCL.Graphics,
       KGraphics,
       ClAg5Types,
       SearchsZootecnico,
       CLAg5ClientCommonTypes,
       ThreadSuppl ;


{ TfrmZoo_OcorrenciasAnimal }

procedure TfrmZoo_OcorrenciasAnimal.Cancel;
begin
  dtmZoo_OcorrenciasAnimal.CancelUpdates ;
  dbgOcorrenciasCronologica.EditorMode := False ;
  dbgOcorrenciasCronologica.CloseControl ;
end;

procedure TfrmZoo_OcorrenciasAnimal.CheckBox1Click(Sender: TObject);
begin
  dtmZoo_OcorrenciasAnimal.ShowExclued ( CheckBox1.Checked ) ;
end;

constructor TfrmZoo_OcorrenciasAnimal.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   dtmZoo_OcorrenciasAnimal := TdtmZoo_OcorrenciasAnimal.Create ( self ) ;
   dtsOcorrenciasGroup.DataSet := dtmZoo_OcorrenciasAnimal.cdsOcorrenciasGroup ;
   dtsOcorrenciasCronologica.DataSet := dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologica ;
   dtmZoo_OcorrenciasAnimal.OnRebuildGridCells := RebuildCells ;

   TCLAg5NSMsgEVT_Sanidade.Subscribe ( NeedRefresh ) ;
   TCLAg5NSMsgEVT_Diagnosticos.Subscribe( NeedRefresh ) ;
   TCLAg5NSMsgEVT_Protocolos.Subscribe( NeedRefresh )   ;
   TCLAg5NSMsgEVT_BaixaTarefas.Subscribe( NeedRefresh ) ;

   self.pgcOcorrencias.ActivePage := self.tbsAgrupado

end;

procedure TfrmZoo_OcorrenciasAnimal.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  dtmZoo_OcorrenciasAnimal.DeleteRecord
end;

destructor TfrmZoo_OcorrenciasAnimal.Destroy;
begin
   TCLAg5NSMsgEVT_Sanidade.UnSubscribe ( NeedRefresh ) ;
   TCLAg5NSMsgEVT_Diagnosticos.UnSubscribe( NeedRefresh ) ;
   TCLAg5NSMsgEVT_Protocolos.UnSubscribe( NeedRefresh )   ;
   TCLAg5NSMsgEVT_BaixaTarefas.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TfrmZoo_OcorrenciasAnimal.DoMessageSync;
begin
   ShowMessage ( FMessageSync ) ;
end;

procedure TfrmZoo_OcorrenciasAnimal.EditRecord;
begin
  dtmZoo_OcorrenciasAnimal.EditRecord ;
  dbgOcorrenciasCronologica.SetFocus ;
  dbgOcorrenciasCronologica.EditorMode := True ;
end;

function TfrmZoo_OcorrenciasAnimal.GetBOF: boolean;
begin

end;

function TfrmZoo_OcorrenciasAnimal.GetEOF: boolean;
begin

end;


procedure TfrmZoo_OcorrenciasAnimal.InsertRecord;
begin
   if self.MasterSource.DataSet.FieldByName('STATUS').asInteger = _ST_STATUS_ANIMAL_DESCARTADO then
      raise Warning.Create('Animal descartado, não é possível lançar novas ocorrências');
   case TZooQueryInclusaoDiagnosticoProtocoloTarefa.Execute of
      toaDiagnostico : TZoo_SanidadeDiagnosticosWizard.Execute (  self.MasterSource.DataSet.FieldByName('BRINCO').AsString ) ;
      toaProtocolo   : TZoo_SanidadeProtocolosWizard.Execute   (  self.MasterSource.DataSet.FieldByName('BRINCO').AsString,
                                              self.MasterSource.DataSet.FieldByName('KZOO_ANIMAL' ).AsString ) ;
   end;
end;

function TfrmZoo_OcorrenciasAnimal.dbgOcorrenciasCronologicaCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
   Result := Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO ;
   StringForTrue  := 'T' ;
   StringForFalse := 'F' ;
end;

procedure TfrmZoo_OcorrenciasAnimal.dbgOcorrenciasCronologicaEditButtonClick(
  Sender: TObject);
begin
   with dtmZoo_OcorrenciasAnimal, dbgOcorrenciasCronologica do
       if ( SelectedField = cdsOcorrenciasCronologicaNOMEFUNCIONARIO ) then
            self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TfrmZoo_OcorrenciasAnimal.dbgOcorrenciasCronologicaEnter(
  Sender: TObject);
begin
  inherited;
//  dbgCC.SelectedField := dtmZoo_CondicaoCorporalAnimal.cdsCCDATA ;

end;

procedure TfrmZoo_OcorrenciasAnimal.dbgOcorrenciasCronologicaKeyPress(Sender: TObject;
  var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key <> #13 ) then
    exit ;

  with dtmZoo_OcorrenciasAnimal, dbgOcorrenciasCronologica do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsOcorrenciasCronologicaNOMEFUNCIONARIO ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;


   if (  Screen.ActiveControl = dbgOcorrenciasCronologica ) then
      Key := #0 ;

   with (dbgOcorrenciasCronologica) do
       begin
          SkipDone := False ;
          while selectedindex < (fieldcount - 1) do
            begin
              selectedindex := selectedindex + 1 ;
              if ( not Columns[ selectedindex ].ReadOnly ) and ( Columns[ selectedindex ].Visible ) then
               begin
                 SkipDone := True ;
                 Break ;
               end;
           end ;

          if not SkipDone then
             begin
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;
end;

procedure TfrmZoo_OcorrenciasAnimal.ShowMessageSync ( AMessage : string ) ;
begin
   FMessageSync := AMessage ;
   ThreadSuppl.TSyncThread.Create( DoMessageSync );
end;


procedure TfrmZoo_OcorrenciasAnimal.dbgOcorrenciasCronologicaShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin

  if ( Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO )
    and ( not CheckBox1.Checked ) then
    begin
      AllowEdit := False ;
      ShowMessageSync ( 'Para excluir uma ocorrênica, marque a caixa de seleção'
             +#13#10'Exibir occorências excluídas.'
             +#13#10 ) ;
      exit ;
    end;


  if dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaTIPO.asString = 'X' then
    begin
      AllowEdit := (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO ) ;
      if ( AllowEdit ) and not ParametrosFazenda( LoggedUser.DomainID ).PermiteExcluirTarefasDescarte then
          begin
            AllowEdit := False ;
            ShowMessageSync ( 'Não é permitido excluir tarefas de descarte.' ) ;
          end;
      dtsStatus.DataSet := dtmZoo_OcorrenciasAnimal.cdsStatusTarefas ;
    end
  else if dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaTIPO.asString = 'D' then
    begin
      AllowEdit := (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATA             )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATAEXECUCAO     )
                or (    (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDESCR_QUARTO)
                    and (dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaPOR_QUARTO.asBoolean)
                   )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDESCR_STATUS     )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaOBS              )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO         ) ;
      dtsStatus.DataSet := dtmZoo_OcorrenciasAnimal.cdsStatusDiagnostico ;
   end
  else if dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaTIPO.asString = 'P' then
    begin
      AllowEdit := (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATA             )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATAEXECUCAO     )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDESCR_STATUS     )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaOBS              )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO         ) ;
      dtsStatus.DataSet := dtmZoo_OcorrenciasAnimal.cdsStatusProtocolo ;
    end
  else if dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaTIPO.asString = 'T' then
    begin
      AllowEdit := (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaKCAD_FUNCIONARIO )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaNOMEFUNCIONARIO )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATA             )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDATAEXECUCAO     )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaDESCR_STATUS     )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaOBS              )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaEXCLUIDO         )
                or (Field = dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologicaREEXECUTAR_EM    ) ;
      dtsStatus.DataSet := dtmZoo_OcorrenciasAnimal.cdsStatusTarefas ;
    end;

end;

type
  TKGridCellAccessProtected = class ( TKGridCell ) ;

procedure TfrmZoo_OcorrenciasAnimal.KDBGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; R: TRect; State: TKGridDrawState);
begin

  if (ARow < KDBGrid1.FixedRows) and (goHeader in KDBGrid1.Options) then
    begin
     try
     Tc.VCL.Graphics.cyGradientFill(KDBGrid1.Canvas, R, SysTypes._GRADIENT_COLOR , clWhite, dgdVertical, 60, bmMirror, 255, 100);
     DrawEdge(KDBGrid1.Canvas.Handle, R, BDR_RAISEDINNER, KDBGrid1.CellPainter.DefaultEdges);

//     KGraphics.DrawEdges(KDBGrid1.Canvas, R, cl3DHilight, cl3DShadow, DefaultEdges);
     TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).ApplyDrawProperties ;
     KDBGrid1.CellPainter.DrawCellCommon ;
     except
     end;
    end
  else
    begin
      try
       TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).ApplyDrawProperties ;
       TKGridCellAccessProtected ( KDBGrid1.Cell[ ACol, ARow ] ).DrawCell ( ACol, ARow, R, State ) ;
      except
      end;
    end;

end;

procedure TfrmZoo_OcorrenciasAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
  with dtmZoo_OcorrenciasAnimal do
    begin
      if ( cdsOcorrenciasCronologica.State in [dsInsert,dsEdit] ) or (cdsOcorrenciasCronologica.ChangeCount > 0 ) then
         exit ;
     ChangeOcorrencias ;
    end;
end;

procedure TfrmZoo_OcorrenciasAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_OcorrenciasAnimal.PrintData;
begin
//  SysPrintGridDialog
   showMessage ( 'necessário implementar impressão específica' )
end;

function TfrmZoo_OcorrenciasAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daInsert,{ daDelete, } daPrint ] ;

   if self.pgcOcorrencias.ActivePage =  tbsCronologico then
     with dtmZoo_OcorrenciasAnimal.cdsOcorrenciasCronologica do
       begin
        Result := Result + [daEdit] ;
        if ( State in [dsInsert,dsEdit] )
           or ( ChangeCount > 0 )  then
           Result := Result + [daSave,daCancel] - [daEdit] ;

         if BOF and EOF then
          Result := Result - [daEdit] ;
     end;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;

end;

function TfrmZoo_OcorrenciasAnimal.QueryAllowedDataActions: TTcDataActions;
begin
  Result := [ daInsert, daEdit, daDelete ] ;
end;

procedure TfrmZoo_OcorrenciasAnimal.RebuildCells;
var
  LastDiagnostico, LastProtocolo : string ;
  LastDataPrevista : TDateTime ;
  FirstRowDiagnostico,  countDiag,
  FirstRowProtocolo,    countProtocolo,
  FirstRowDataPrevista, countDataPrevista,
  FirstCol : integer ;
begin
//  KDBGrid1.CellSpan[1, 1] := MakeCellSpan( 1 ,  2 );
//  KDBGrid1.DataSource := nil  ;
//  KDBGrid1.DataSource := dtsOcorrencias ;


  FirstCol := -1 ;

  with dtmZoo_OcorrenciasAnimal, cdsOcorrenciasGroup, KDBGrid1 do
    begin
      disableControls ;
      first ;
      FirstRowDiagnostico    := 2 ;
      FirstRowProtocolo      := 2 ;
      FirstRowDataPrevista   := 2 ;
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

                       countDataPrevista := 0 ;
                       LastDataPrevista  := cdsOcorrenciasGroupDATAPREVISTA.AsDateTime ;
                       while not eof
                         and ( LastDiagnostico   = cdsOcorrenciasGroupKZOO_ANIMAL_DIAGNOSTICO.AsString )
                         and ( LastProtocolo     = cdsOcorrenciasGroupKZOO_ANIMAL_PROTOCOLO.AsString   )
                         and ( LastDataPrevista  = cdsOcorrenciasGroupDATAPREVISTA.asDateTime ) do
                           begin
                             countDataPrevista := countDataPrevista + 1 ;
                             next ;
                           end;

                       KDBGrid1.CellSpan[FirstCol + 11, FirstRowDataPrevista ] := MakeCellSpan( 0 ,  countDataPrevista );
                       FirstRowDataPrevista := FirstRowDataPrevista + countDataPrevista ;
                       countProtocolo := countProtocolo + countDataPrevista ;
                       //Next ;
                     end;
                 KDBGrid1.CellSpan[FirstCol +  6, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol +  7, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol +  8, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol +  9, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
                 KDBGrid1.CellSpan[FirstCol + 10, FirstRowProtocolo ] := MakeCellSpan( 0 ,  countProtocolo );
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
      First ;
      enableControls ;
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

  // o titulo das colunas estao invertidos no CDS
  KDBGrid1.Cell[ FirstCol + 11, 1 ]  := KDBGrid1.Cell[ FirstCol + 12, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 12, 1 ]  := KDBGrid1.Cell[ FirstCol + 11, 0 ] ;

  KDBGrid1.Cell[ FirstCol + 13, 1 ]  := KDBGrid1.Cell[ FirstCol + 13, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 14, 1 ]  := KDBGrid1.Cell[ FirstCol + 14, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 15, 1 ]  := KDBGrid1.Cell[ FirstCol + 15, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 16, 1 ]  := KDBGrid1.Cell[ FirstCol + 16, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 17, 1 ]  := KDBGrid1.Cell[ FirstCol + 17, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 18, 1 ]  := KDBGrid1.Cell[ FirstCol + 18, 0 ] ;
  KDBGrid1.Cell[ FirstCol + 19, 1 ]  := KDBGrid1.Cell[ FirstCol + 19, 0 ] ;


  KDBGrid1.CellSpan[ FirstCol + 1, 0 ] := MakeCellSpan( 5 ,  0 );
  KDBGrid1.CellSpan[ FirstCol + 6, 0 ] := MakeCellSpan( 5 ,  0 );
  KDBGrid1.CellSpan[ FirstCol + 11, 0 ] := MakeCellSpan( 10,  0 );


  KDBGrid1.Repaint ;
end ;

procedure TfrmZoo_OcorrenciasAnimal.Save;
begin
  dtmZoo_OcorrenciasAnimal.ApplyUpdates ;
  dbgOcorrenciasCronologica.EditorMode := False ;
  dbgOcorrenciasCronologica.CloseControl ;
  TCLAg5NSMsgEVT_OcorrenciasAnimal.CreateAndDispatch ( self );
end;

procedure TfrmZoo_OcorrenciasAnimal.SetFuncionario(TextToSearch: string);
begin
    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;

          if Execute then
             dtmZoo_OcorrenciasAnimal.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;

       finally
          free ;
       end ;
end;

procedure TfrmZoo_OcorrenciasAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_OcorrenciasAnimal.MasterSource  := FMasterSource ;
  dtmZoo_OcorrenciasAnimal.OpenTables ;
end;

end.
