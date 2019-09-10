unit UZoo_ReproducaoFIVWizard;


{ DONE -oCaique -cDados do Periodo / Reproducao : - Acertar tela para abrir em aba }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Remover Chaves }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Acertar campos informativos }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Travar edição de Campos informativos }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Campo de Data }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Numerico - inteiro }
{ TODO -oCaique -cDados do Periodo / Reproducao : - Acertar filtro de inseminações }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Incluir Botão fechar }

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, UZoo_ReproducaoFIVDatamodule, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvExExtCtrls, JvExtComponent, JvPanel,
  JvToolEdit, JvDBControls, VCL.Mask, JvExMask, JvBaseEdits, JvImage, JvSpin,
  JvExStdCtrls, JvEdit, JvDBSearchEdit, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  CL.AG5.NSMsgs, System.Actions, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_ReproducaoFIVWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsColetaEmbriao: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    deDataEvento: TTcDateEdit;
    JvDBDateEdit1: TTcDBDateEdit;
    JvDBCalcEdit1: TJvDBCalcEdit;
    edPadraoNomeFuncionario: TJvComboEdit;
    lblEdPadraoFuncionario: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure edPadraoNomeFuncionarioButtonClick(Sender: TObject);
    procedure edPadraoNomeFuncionarioChange(Sender: TObject);
    procedure edPadraoNomeFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1Enter(Sender: TObject);
    procedure deDataEventoChange(Sender: TObject);
  private
    { Private declarations }
    FKFuncionario : string ;
    Zoo_ReproducaoFIVDatamodule : TZoo_ReproducaoFIVDatamodule ;
    procedure MessageSemDoadoresInseminados ;
    procedure SearchFuncionario ( TextToSearch : string);
    procedure SetFuncionario ( TextToSearch : string);
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
    Destructor Destroy ; override ;
  end;


implementation

uses UDBZootecnico, Exceptions, SearchsZootecnico, ThreadSuppl ;


{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_ReproducaoFIVWizard.Create ( AOwner : TComponent ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_ReproducaoFIVDatamodule := TZoo_ReproducaoFIVDatamodule.Create ( self ) ;
   Zoo_ReproducaoFIVDatamodule.OpenTables ;
   dtsColetaEmbriao.DataSet := Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriao ;
   if Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriao.IsEmpty then
      ThreadSuppl.TSyncThread.Create( MessageSemDoadoresInseminados );
   deDataEvento.Date := Date;

   TCLAg5NSMsgEVT_CiosCoberturas.Subscribe( NeedRefresh ) ;
   TCLAg5NSMsgEVT_PartosAbortos.Subscribe( NeedRefresh ) ;
end;

procedure TZoo_ReproducaoFIVWizard.deDataEventoChange(Sender: TObject);
begin
  inherited;
  Zoo_ReproducaoFIVDatamodule.DataColeta := deDataEvento.Date ;
end;

destructor TZoo_ReproducaoFIVWizard.Destroy;
begin
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe( NeedRefresh ) ;
  TCLAg5NSMsgEVT_PartosAbortos.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TZoo_ReproducaoFIVWizard.edPadraoNomeFuncionarioButtonClick(Sender: TObject);
begin
  inherited;
  SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoFIVWizard.edPadraoNomeFuncionarioChange(Sender: TObject);
begin
  inherited;
  FKFuncionario := '' ;
  edPadraoNomeFuncionario.Font.Color := clRed ;
  Zoo_ReproducaoFIVDatamodule.SetFuncionarioPadrao ( '', '' ) ;
end;

procedure TZoo_ReproducaoFIVWizard.edPadraoNomeFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchFuncionario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

class function TZoo_ReproducaoFIVWizard.Execute : boolean;
begin
  with Create ( nil ) do
    try
        Result := ShowModal = mrOK ;
        if Result then
          {ThisForm.DoSomething}  ;
    finally
       free ;
    end ;
end ;


procedure TZoo_ReproducaoFIVWizard.JvDBUltimGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  with Zoo_ReproducaoFIVDatamodule, JvDBUltimGrid1 do
     if ( SelectedField = cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA ) then
        self.SetFuncionario ( InplaceEditor.Text ) ;
end;

procedure TZoo_ReproducaoFIVWizard.JvDBUltimGrid1Enter(Sender: TObject);
begin
  if  ( JvDBUltimGrid1.SelectedField <> Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA )
   and ( JvDBUltimGrid1.SelectedField <> Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriaoDATAABORTOPARTO )
   and ( JvDBUltimGrid1.SelectedField <> Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriaoEMBRIOESCOLETADOS ) then
      JvDBUltimGrid1.SelectedField := Zoo_ReproducaoFIVDatamodule.cdsColetaEmbriaoEMBRIOESCOLETADOS
end;

procedure TZoo_ReproducaoFIVWizard.JvDBUltimGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
     Key := 0 ;
end;

procedure TZoo_ReproducaoFIVWizard.JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
var SkipDone : boolean ;
begin
  if ( Key <> #13 ) then
    exit ;

   if (  Screen.ActiveControl = TJvDBUltimGrid ( Sender ) ) then
      Key := #0 ;

  with Zoo_ReproducaoFIVDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsColetaEmbriaoNOMEFUNCIONARIO_COLETA ) then
         begin
            self.SetFUNCIONARIO ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   with (JvDBUltimGrid1) do
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
{
               if not (JvDBCalcEdit1.Text = EmptyStr) then
                 with Zoo_ReproducaoFIVDatamodule do
                   begin
                     if cdsColetaEmbriaoKCAD_FUNCIONARIO_COLETA.AsString = EmptyStr then
                        if not (edPadraoNomeFuncionario.Text = EmptyStr) then
                                self.SetFuncionario ( edPadraoNomeFuncionario.Text )
                        else
                           raise Warning.Create('Selecione o funcionário');

                     if not (cdsColetaEmbriaoDATAABORTOPARTO.AsDateTime < 0) then
                        cdsColetaEmbriaoDATAABORTOPARTO.AsDateTime := deDataEvento.Date
                     else
                        raise Warning.Create('Selecione a data da coleta');


                   end;
}
               _btbExecute.Enabled := True;
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;

end;

procedure TZoo_ReproducaoFIVWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
//  inherited;

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;
end;

procedure TZoo_ReproducaoFIVWizard.MessageSemDoadoresInseminados;
begin
      MessageDlg ( 'Não foi encontrado nenhum animal doador inseminado.' )
end;

procedure TZoo_ReproducaoFIVWizard.NeedRefresh(Sender: TCLAg5NSMsg );
begin
 if not self._actExecute.Enabled then
    begin
      Zoo_ReproducaoFIVDatamodule.ReOpenTables ;// .cdsColetaEmbriao.Refresh
    end;
end;

procedure TZoo_ReproducaoFIVWizard.SearchFuncionario(TextToSearch: string);
begin
  with TSearchFuncionarioAtivo.Create do
     try
        TextToFind := TextToSearch ;
        if Execute then
           begin
             edPadraoNomeFuncionario.Text       := Result.FieldByName( 'APELIDO'       ).asString ;
             FKFuncionario                      := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
             Zoo_ReproducaoFIVDatamodule.SetFuncionarioPadrao( FKFuncionario, edPadraoNomeFuncionario.Text );
//             Zoo_ReproducaoFIVDatamodule.SetFuncionarioPadrao( Result.FieldByName( 'KCAD_ENTIDADE' ).asString, Result.FieldByName( 'APELIDO').asString );
             edPadraoNomeFuncionario.Font.Color := clNavy ;
           end ;
     finally
        free ;
     end ;
end;

procedure TZoo_ReproducaoFIVWizard.SetFuncionario(TextToSearch: string);
begin

  with TSearchFuncionarioAtivo.Create do
     try
        TextToFind := TextToSearch ;
        if Execute then
           Zoo_ReproducaoFIVDatamodule.SetFuncionario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
     finally
        free ;
     end ;

end;

procedure TZoo_ReproducaoFIVWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_ReproducaoFIVDatamodule.ApplyUpdates ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_FIV.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_ReproducaoFIVWizard._actExecuteUpdate(Sender: TObject);
begin
  with Zoo_ReproducaoFIVDatamodule, cdsColetaEmbriao do
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and not IsEmpty
                        and not ( State in [dsInsert,dsEdit] )
                        and  (TryVarToFloat ( cdsColetaEmbriaoTOTALCOLETADO.Value ) > 0) ;
end;

procedure TZoo_ReproducaoFIVWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TZoo_ReproducaoFIVWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
  RegisterClass ( TZoo_ReproducaoFIVWizard ) ;

end.
