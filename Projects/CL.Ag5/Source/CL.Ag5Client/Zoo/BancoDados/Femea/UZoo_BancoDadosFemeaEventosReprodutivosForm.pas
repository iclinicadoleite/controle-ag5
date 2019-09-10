unit UZoo_BancoDadosFemeaEventosReprodutivosForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ExtCtrls,
  UZoo_BancoDadosFemeaEventosReprodutivosDatamodule, VCL.ActnList,
  Tc.VCL.FormIntf, VCL.StdCtrls, VCL.Mask, JvExMask, JvToolEdit, JvDBControls,
  DBForm, VCL.DBCtrls, Tc.VCL.Edits, Tc.VCL.Edits.DBControls,
  JvExStdCtrls, JvCombobox,
  Tc.VCL.Form,Tc.VCL.Application,
  JvDBCombobox, System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask,
  Wrappers  ;

{$define _IATF_MONTA}

type

  TJvDBUltimGrid = class ( Wrappers.TJvDBUltimGrid )
     procedure Loaded ; override ;
  end ;

  TZoo_BancoDadosFemeaEventosReprodutivosForm = class(TTcForm, ITcDataForm)
    Panel11: TPanel;
    dbgEventosReprodutivos: TJvDBUltimGrid;
    dtsEventosZootecnicos: TDataSource;
    deDataEvento: TTcDBDateEdit;
    deDataToque: TTcDBDateEdit;
    deDataAbortoParto: TTcDBDateEdit;
    dbmObsEvento: TDBMemo;
    dblcDescPartoAborto: TDBLookupComboBox;
    cbStatusPrenhez: TJvDBComboBox;
    dtsStatusPrenhez: TDataSource;
    dtsStatusGestacao: TDataSource;
    dtsProtocolosIATF: TDataSource;
    dblcProtocoloIATF: TDBLookupComboBox;
    dblcSexoCria: TDBLookupComboBox;
    dsSexoCria: TDataSource;
    cbStatusGemelar: TJvDBComboBox;
    dsStatusGemelar: TDataSource;
    function dbgEventosReprodutivosCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgEventosReprodutivosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgEventosReprodutivosKeyPress(Sender: TObject; var Key: Char);
    procedure cbStatusPrenhezEnter(Sender: TObject);
    procedure cbStatusPrenhezKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsEventosZootecnicosDataChange(Sender: TObject; Field: TField);
    procedure dbgEventosReprodutivosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgEventosReprodutivosEditButtonClick(Sender: TObject);
    procedure dbgEventosReprodutivosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbStatusPrenhezExit(Sender: TObject);
  protected
    procedure loaded ; override ;
  private
    FpkEvento: String;
    FMasterSource: TDataSource;
    FDadosFemea: TDataSource;
    Zoo_BancoDadosFemeaEventosReprodutivosDatamodule : TZoo_BancoDadosFemeaEventosReprodutivosDatamodule ;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
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
    procedure Help ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    procedure SetDadosFemea(const Value: TDataSource);
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;

    procedure SetFuncionario ( TextToSearch : string);
    procedure SetMacho ( TextToSearch : string);
    procedure SearchAnimalMacho ( TextToSearch : string);
    procedure GetCria ;
    procedure ValidateAborto;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property DadosFemea : TDataSource  read FDadosFemea write SetDadosFemea;
  end;


implementation

{$R *.dfm}

uses  ThreadSuppl, UfdlgZoo_CadastroCrias, CLAg5Types, SearchsZootecnico, SysPrintGridDialog , ClAg5ClientZootecnicoCommonTypes;

{ TfrmZoo_EventosReprodutivosAnimal }

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.Cancel;
begin
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.CancelUpdates ;
  dbgEventosReprodutivos.EditorMode := False ;
  dbgEventosReprodutivos.CloseControl ;
end;


procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.cbStatusPrenhezEnter(
  Sender: TObject);
begin
//   if not cbStatusPrenhez.DroppedDown then
//     cbStatusPrenhez.DroppedDown := True ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.cbStatusPrenhezExit(
  Sender: TObject);
begin
  if (dbgEventosReprodutivos.CanFocus) and (dbgEventosReprodutivos.Showing) then
     dbgEventosReprodutivos.SetFocus ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.cbStatusPrenhezKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
    end
  else if ( not Key in [ VK_RETURN ] ) and not ( TJvDBComboBox ( Sender ).DroppedDown ) then
     TJvDBComboBox ( Sender ).DroppedDown := True  ;
end;

constructor TZoo_BancoDadosFemeaEventosReprodutivosForm.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule := TZoo_BancoDadosFemeaEventosReprodutivosDatamodule.Create ( self ) ;
  dtsEventosZootecnicos.DataSet := Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos ;

  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.OnGetCria := TfdlgZoo_CadastroCrias.Execute  ;

  TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ColetaEmbriao.Subscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_DiagnosticosGestacao.Subscribe( NeedRefresh ) ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.DeleteRecord;
begin
   if MessageDlg ( 'Excluir registro?', mtConfirmation, [mbYes, mbNo] ) <> mrYes then
     exit ;
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.DeleteRecord ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.CreateAndDispatch( self ) ;
end;

destructor TZoo_BancoDadosFemeaEventosReprodutivosForm.Destroy;
begin
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ColetaEmbriao.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_DiagnosticosGestacao.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dtsEventosZootecnicosDataChange(
  Sender: TObject; Field: TField);
begin

  if not Assigned ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule ) then
    exit;

  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
      if (    ( Field = cdsEventosReprodutivosDATAEVENTO )
          and ( not cdsEventosReprodutivosDATAEVENTO.IsNull ) ) then
          ValidateAborto ;


  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
   begin
     //FilterSexoCria(cdsEventosReprodutivosGEMELAR.AsBoolean);
     if   ( Field = cdsEventosReprodutivosABORTOPARTO ) then
      begin
        if (   ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO_LACTACAO  )
            or ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_PARTO ) ) then
         begin
            if MessageDlg ( 'Deseja abrir nova lactação ?', mtConfirmation ) = mrYes then
             begin
               Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.CheckLactacaoNaoSeca ;

               if ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_PARTO )
                 and (MessageDlg ( 'Deseja cadastrar filhos ?', mtConfirmation ) = mrYes) then
                begin
                   FpkEvento := cdsEventosReprodutivosKZOO_EVENTO_ZOOTECNICO.asString;
                   ThreadSuppl.TSyncThread.Create( GetCria ) ;

                end;
             end
            else
             begin
               dtsEventosZootecnicos.OnDataChange := nil ;
               ForceAborto( dtsEventosZootecnicos.DataSet ) ;
               dtsEventosZootecnicos.OnDataChange := dtsEventosZootecnicosDataChange ;
             end;
         end
        else
        if ( cdsEventosReprodutivos.FieldByName ( 'ABORTOPARTO' ).asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO  )
          and ( not VarIsNull ( cdsEventosReprodutivos.FieldByName ( 'KZOO_LACTACAO' ).AsVariant ) ) then
         begin
           if not CheckLactacaoAtual then
            begin
              cdsEventosReprodutivos.Cancel;
            end;
         end;
      end;

   end;

end;


procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.ValidateAborto;
var
 diasEvento, abortoComLactacaoPrimipara, abortoComLactacaoMultipara : integer ;
 isPrimipara, abrirLactacao : boolean ;
 diferencaDias : integer ;
 LKEventoAAbortar : string ;
 ADataEventoAbortar : TDateTime ;
begin

  LKEventoAAbortar := Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.GetEventoAAbortar( ADataEventoAbortar )  ;
  if LKEventoAAbortar = '' then
     exit ;

  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.GetDadosAborto ( isPrimipara, abortoComLactacaoPrimipara, abortoComLactacaoMultipara ) ;

  diasEvento  := Trunc ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATAEVENTO.asDateTime - ADataEventoAbortar ) ;

  AbrirLactacao := False ;

  if (  isPrimipara and (diasEvento > abortoComLactacaoPrimipara) ) then
      AbrirLactacao :=  MessageDlg (
         Format ( 'Animal prenhe (primípara) com mais de %d dias de gestação.', [ abortoComLactacaoPrimipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes

  else if ( not isPrimipara and (diasEvento > abortoComLactacaoMultipara) ) then
      AbrirLactacao :=  MessageDlg (
         Format ( 'Animal prenhe (multípara) com mais de %d dias de gestação.', [ abortoComLactacaoMultipara ] )
        +#13#10'Será lançado um aborto.'#13#10'Deseja abrir lactação?', mtWarning, [mbYes, mbNo] ) = mrYes

  else
     MessageDlg ('Animal prenhe, será lançado um aborto.', mtWarning ) ;


  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.AbortarEvento(
    LKEventoAAbortar,
    Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATAEVENTO.asDateTime - 1,
    AbrirLactacao )  ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.EditRecord;
begin
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.EditRecord ;
  dbgEventosReprodutivos.SetFocus ;
  dbgEventosReprodutivos.EditorMode := True ;
end;


function TZoo_BancoDadosFemeaEventosReprodutivosForm.GetBOF: boolean;
begin
   Result := Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos.bof ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.GetCria;
begin
  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
    cdsEventosReprodutivos.Locate ( 'KZOO_EVENTO_ZOOTECNICO', FpkEvento, [] );

  TfdlgZoo_CadastroCrias.Execute ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule )
end;

function TZoo_BancoDadosFemeaEventosReprodutivosForm.GetEOF: boolean;
begin
   Result := Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos.eof ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.Help;
begin

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.InsertRecord;
begin
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.NewRecord ;
  dbgEventosReprodutivos.SelectedField := Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosDATAEVENTO ;
  dbgEventosReprodutivos.SetFocus ;
  dbgEventosReprodutivos.EditorMode := True ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.loaded;
begin
  inherited;

  dbgEventosReprodutivos.AutoSizeColumns := False ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.NeedRefresh(Sender: TCLAg5NSMsg);
begin

  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
    begin
      if ( cdsEventosReprodutivos.State in [dsInsert,dsEdit] ) or (cdsEventosReprodutivos.ChangeCount > 0 ) then
         exit ;

      ReOpenTables ;
    end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.OtherOptions;
begin

end;

function TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field )
//    and ( ( Field.FieldName = 'PRENHEZ' )
    and ( ( Field.FieldName = 'REEXAMINAR'      )
       or ( Field.FieldName = 'PROTOCOLO_TOQUE' )
       or ( Field.FieldName = 'PROTOCOLO_PARTO' )
       or ( Field.FieldName = 'INCLUIRCRIA'     )
       or ( Field.FieldName = 'IATF'            ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosEditButtonClick(
  Sender: TObject);
begin
   with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule, dbgEventosReprodutivos do
     begin

       if    ( SelectedField = cdsEventosReprodutivosNUMEROFILHOS )
        and  (  ( cdsEventosReprodutivosAbortoParto.AsInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
             or ( cdsEventosReprodutivosAbortoParto.asInteger =  ClAg5Types._ST_TIPO_PARTOABORTO_PARTO   ) ) then
          TfdlgZoo_CadastroCrias.Execute( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule )

       else if ( SelectedField = cdsEventosReprodutivosNOMEFUNCIONARIO ) then
            self.SetFUNCIONARIO ( InplaceEditor.Text )

       else if ( SelectedField = cdsEventosReprodutivosNOMEMACHO ) then
            self.SetMACHO ( InplaceEditor.Text ) ;
     end;

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (  Key = VK_INSERT ) and not dbgEventosReprodutivos.EditorMode then
     Key := 0 ;


end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosKeyPress(
  Sender: TObject; var Key: Char);
var
 SkipDone : boolean ;
begin

  if ( Key = '-' ) then
    begin
      Key := #0 ;
      exit ;
    end
  else if ( Key = ',' ) or ( Key = '.' ) then
    begin
      Key := FormatSettings.DecimalSeparator ;
      exit ;
    end
  else if ( Key <> #13 ) then
    exit ;

  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule, dbgEventosReprodutivos do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsEventosReprodutivosNOMEFUNCIONARIO ) {and (InplaceEditor.Text = '')} then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end;

       if ( SelectedField = cdsEventosReprodutivosNOMEMACHO ) then
         begin
            self.SetMACHO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   if (  Screen.ActiveControl = dbgEventosReprodutivos ) then
      Key := #0 ;

   with (dbgEventosReprodutivos) do
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

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

  if not AllowEdit then
     exit ;

 with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
   begin

     case cdsEventosReprodutivosTIPOEVENTO.asInteger of
       _ST_TIPO_EVENTO_ZOO_CIO :

           AllowEdit := ( Field <> cdsEventosReprodutivosNOMEMACHO )
                    and ( Field <> cdsEventosReprodutivosDOSES )
                    and ( Field <> cdsEventosReprodutivosDATATOQUE )
                    and ( Field <> cdsEventosReprodutivosDESC_PRENHEZ )
                    and ( Field <> cdsEventosReprodutivosREEXAMINAR )
                    and ( Field <> cdsEventosReprodutivosPREVISAOPARTO )
                    and ( Field <> cdsEventosReprodutivosDATAABORTOPARTO )
                    and ( Field <> cdsEventosReprodutivosDESC_PARTOABORTO )
                    and ( Field <> cdsEventosReprodutivosEMBRIOESCOLETADOS )
                    and ( Field <> cdsEventosReprodutivosIATF )
                    and ( Field <> cdsEventosReprodutivosDESC_PROTOCOLO_IATF ) ;

       _ST_TIPO_EVENTO_ZOO_INSEMINA :

           if FDadosFemea.DataSet.FieldByName ('DOADOR_RECEPTOR').asInteger =  _ST_TIPO_DOADOR_RECEPTOR_DOADOR then
              AllowEdit := (    (  Field <> cdsEventosReprodutivosDESC_PARTOABORTO )
                              and (  Field <> cdsEventosReprodutivosEMBRIOESCOLETADOS )
                           )
                      or   ( (Field = cdsEventosReprodutivosEMBRIOESCOLETADOS) and not cdsEventosReprodutivosDATAABORTOPARTO.IsNull )

           else
              AllowEdit := (     ( Field <> cdsEventosReprodutivosDESC_PARTOABORTO   )
                             and ( Field <> cdsEventosReprodutivosEMBRIOESCOLETADOS  )
                             and ( Field <> cdsEventosReprodutivosDESC_PROTOCOLO_IATF )
                            )
                        or ( (Field = cdsEventosReprodutivosDESC_PARTOABORTO) and not cdsEventosReprodutivosDATAABORTOPARTO.IsNull )
                        or ( (Field = cdsEventosReprodutivosDESC_PROTOCOLO_IATF) and cdsEventosReprodutivosIATF.asBoolean ) ;

       _ST_TIPO_EVENTO_ZOO_MONTA :

           if FDadosFemea.DataSet.FieldByName ('DOADOR_RECEPTOR').asInteger =  _ST_TIPO_DOADOR_RECEPTOR_DOADOR then
              AllowEdit :=       ( Field <> cdsEventosReprodutivosDESC_PARTOABORTO )
                           {$IFNDEF _IATF_MONTA}
                             and ( Field <> cdsEventosReprodutivosIATF ) // removed for MONTA/IATF
                             and ( Field <> cdsEventosReprodutivosDESC_PROTOCOLO_IATF ) // removed for MONTA/IATF
                           {$ENDIF ~_IATF_MONTA}
           else
              AllowEdit := (     ( Field <> cdsEventosReprodutivosDESC_PARTOABORTO  )
                             and ( Field <> cdsEventosReprodutivosEMBRIOESCOLETADOS )
                           {$IFNDEF _IATF_MONTA}
                             and ( Field <> cdsEventosReprodutivosIATF ) // removed
                           {$ENDIF ~_IATF_MONTA}
                             and ( Field <> cdsEventosReprodutivosDESC_PROTOCOLO_IATF )
                           )
                       or  ( (Field = cdsEventosReprodutivosDESC_PARTOABORTO) and not cdsEventosReprodutivosDATAABORTOPARTO.IsNull )
                       {$IFDEF _IATF_MONTA}
                       or ( (Field = cdsEventosReprodutivosDESC_PROTOCOLO_IATF) and cdsEventosReprodutivosIATF.asBoolean )  // added
                       {$ENDIF _IATF_MONTA}  ;
         //end
       _ST_TIPO_EVENTO_ZOO_IMPLANTE :

           if FDadosFemea.DataSet.FieldByName ('DOADOR_RECEPTOR').asInteger =  _ST_TIPO_DOADOR_RECEPTOR_DOADOR then
              AllowEdit := (    (Field <> cdsEventosReprodutivosDESC_PARTOABORTO)
                            and (Field <> cdsEventosReprodutivosDESC_PARTOABORTO)
                           )
                       or  ( (Field = cdsEventosReprodutivosDESC_PROTOCOLO_IATF) and cdsEventosReprodutivosIATF.asBoolean )
           else
              AllowEdit := (     ( Field <> cdsEventosReprodutivosDESC_PARTOABORTO  )
                             and ( Field <> cdsEventosReprodutivosEMBRIOESCOLETADOS )
                             and ( Field <> cdsEventosReprodutivosDESC_PROTOCOLO_IATF)
                            )
                        or ( (Field = cdsEventosReprodutivosDESC_PARTOABORTO) and not cdsEventosReprodutivosDATAABORTOPARTO.IsNull )
                        or ( (Field = cdsEventosReprodutivosDESC_PROTOCOLO_IATF) and cdsEventosReprodutivosIATF.asBoolean ) ;

     else
       AllowEdit :=    (cdsEventosReprodutivos.State = dsInsert)
                   and (    ( Field = cdsEventosReprodutivosDATAEVENTO)
                         or ( Field = cdsEventosReprodutivosDESC_EVENTO)
                       ) ;

     end;

   end;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgEventosReprodutivos, 'Eventos reprodutivos do animal' );
end;

function TZoo_BancoDadosFemeaEventosReprodutivosForm.QueryActiveDataActions: TTcDataActions;
begin
  if  ( not Assigned ( FMasterSource ))
  or  (not Assigned ( FMasterSource.DataSet ))
  or  (FMasterSource.DataSet.FieldByName('STATUS').asInteger = _ST_SIGLA_STATUS_FEMEA_BEZERRO) then
   begin
    Result := [] ;
    dbgEventosReprodutivos.AutoAppend := false ;
    exit ;
  end ;

    dbgEventosReprodutivos.AutoAppend := True ;
   Result := [ daInsert,daEdit, daDelete, daPrint ] ;

   with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivos do
     begin
       if ( State in [dsInsert,dsEdit] ) or ( ChangeCount > 0 )  then
          Result := Result + [daSave,daCancel] - [daEdit,daDelete] ;
       if BOF and EOF then
        Result := Result - [daEdit,daDelete] ;
     end;


   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TZoo_BancoDadosFemeaEventosReprodutivosForm.QueryAllowedDataActions: TTcDataActions;
begin
    Result := [ daInsert,daEdit,daDelete,daSave,daCancel,daPrint,daOther ] ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.Save;
begin
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.ApplyUpdates ;
  dbgEventosReprodutivos.EditorMode := False ;
  dbgEventosReprodutivos.CloseControl ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.CreateAndDispatch( self );
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.SearchAnimalMacho(
  TextToSearch: string);
begin

end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.SetDadosFemea(
  const Value: TDataSource);
begin
  FDadosFemea := Value;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.SetFuncionario(
  TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
//               edFuncionario.Text := Result.FieldByName( 'APELIDO' ).asString ;
               Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.SetMacho(
  TextToSearch: string);
begin

  if ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_MONTA ) then
    with TSearchTouroAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString,  Result.FieldByName( 'NOMEESTABULO' ).asString, tmTouro ) ;
             end ;
       finally
          free ;
       end
  else if ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_INSEMINA ) then
    with TSearchSemenAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_MACHO' ).asString,  Result.FieldByName( 'NOMEESTABULO' ).asString, tmSemen ) ;
             end ;
       finally
          free ;
       end
  else if ( Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.cdsEventosReprodutivosTIPOEVENTO.asInteger = _ST_TIPO_EVENTO_ZOO_IMPLANTE ) then
    with TSearchEmbriao.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.SetMacho(Result.FieldByName( 'KZOO_ANIMAL_EMBRIAO' ).asString,  Result.FieldByName( 'NOMECOMPLETO' ).asString, tmEmbriao) ;
             end ;
       finally
          free ;
       end ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.MasterSource := FMasterSource ;
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.DadosFemea   := FDadosFemea ;
  Zoo_BancoDadosFemeaEventosReprodutivosDatamodule.OpenTables ;
end;

procedure TZoo_BancoDadosFemeaEventosReprodutivosForm.dbgEventosReprodutivosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin

  with Zoo_BancoDadosFemeaEventosReprodutivosDatamodule do
     if  ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO ) then
         Background := $008080FF //vermelho pastel
     else if  ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_ABORTO_LACTACAO )
           or ( cdsEventosReprodutivosABORTOPARTO.asInteger = ClAg5Types._ST_TIPO_PARTOABORTO_PARTO  ) then
         Background := $007DFF7D //$00D9F0E9 //$00A0D9C8 // verde pastel
     else if cdsEventosReprodutivosPRENHEZ.asBoolean then
         Background := $00AAFFFF //$00CBF7FE // $009DEEFD  // amarelo pastel

end ;



{

 FieldName = 'IEE'
 FieldName = 'DESC_MUCO'
 FieldName = 'DOSES'
 FieldName = 'PROTOCOLO_TOQUE'
 FieldName = 'PROTOCOLO_PARTO'
 FieldName = 'IEP_MESES'
 FieldName = 'IDADE_MESES'

}
{ TJvDBUltimGrid }

procedure TJvDBUltimGrid.Loaded;
begin
//  self.FDisableAutoLoad := True ;
  inherited;
//  DoAutoSizeColumns;
  self.AutoSizeColumns := False ;
end;

end.
