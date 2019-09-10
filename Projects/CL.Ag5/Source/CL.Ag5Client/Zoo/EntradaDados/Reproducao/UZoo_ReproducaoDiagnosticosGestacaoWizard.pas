unit UZoo_ReproducaoDiagnosticosGestacaoWizard;

{ DONE -oCaique -cDados do Periodo / Reproducao : - Acertar tela para abrir em aba }
{ DONE -oCaique -cDados do Periodo / Reproducao : - ao entrar na grid setar o foco para o campo prenhez }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Acrescentar data do ultimo toque - apenas informativo }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Prenhez SIM - REXAMINAR = NAO }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Prenhez NAO - REXAMINAR = SIM }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Reexaminar SIM - PRENEZ = NAO - DATA DO TOQUE }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Calcular Previsao de Parto }
{ DONE -oCaique -cDados do Periodo / Reproducao : - Limpar a Data - remove diagnostico }
{ DONE -oCaique -cDados do Periodo / Reproducao : - ao setar a data manualmente - Prenhez NAO - REXAMINAR = SIM }
{ DONE -oCaique -cDados do Periodo / Reproducao : - incluir outras informacoes : data do evento origem, tipo... }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Barra de Título }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Alterar Posição Titulo }
{ DONE -oCaique -cDados do Periodo / Reprodução : - Incluir Botão fechar }

{ DIAS_CONF_PRENHEZ }
{ DIAS_REEXAMINAR }

interface

uses
  WinApi.Windows,  WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,  DBClient,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvToolEdit, VCL.Mask, JvExMask, JvDBControls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, UZoo_ReproducaoDiagnosticosGestacaoDatamodule,
  Exceptions, VCL.DBCtrls, JvDBCheckBox, JvExStdCtrls, JvEdit,
  JvDBSearchEdit, JvCombobox, JvDBCombobox, Tc.VCL.Edits.DBControls, Tc.VCL.Edits,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  System.Actions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers, System.ImageList, Vcl.ImgList ;

type
  TZoo_ReproducaoDiagnosticosGestacaoWizard = class(TZoo_EntradaDadosBaseWizard)
    tbsDiagnosticosGestacao: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsDiagnosticosGestacao: TDataSource;
    gbxDefault: TGroupBox;
    Label1: TLabel;
    deDataEvento: TTcDateEdit;
    dbegDataToque: TTcDBDateEdit;
    gbxEdit: TGroupBox;
    tbsPeriodo: TTabSheet;
    Label3: TLabel;
    deAte: TTcDateEdit;
    lblEdPadraoFuncionario: TLabel;
    edPadraoVeterinario: TJvComboEdit;
    cbxgPrenhez: TDBComboBox;
    CheckBox1: TCheckBox;
    pnlGrid: TPanel;
    cbgStatusGemelar: TJvDBComboBox;
    dblcgSexoCria: TDBLookupComboBox;
    dsStatusGemelar: TDataSource;
    dsSexoCria: TDataSource;
    pnlExibirCampos: TPanel;
    pnlCamposEntrada: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    edtBrinco: TJvDBSearchEdit;
    jvedtBrinco: TJvComboEdit;
    cbxPrenhez: TDBComboBox;
    pnlReexaminar: TPanel;
    Label6: TLabel;
    deDataNovoToque: TTcDBDateEdit;
    cbxReexaminar: TJvDBCheckBox;
    pnlSexoCria: TPanel;
    Label5: TLabel;
    cbStatusGemelar: TJvDBComboBox;
    dblcSexoCria: TDBLookupComboBox;
    cbExibeSexagem: TCheckBox;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    JvDBUltimGrid4: TJvDBUltimGrid;
    Panel4: TPanel;
    cbSelectAll: TCheckBox;
    dsLotes: TDataSource;
    ImgedPadraoVeterinario: TImage;
    ImageList1: TImageList;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure deDataEventoChange(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _actExecuteExecute(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure JvDBUltimGrid1Enter(Sender: TObject);
    procedure edtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPrenhezKeyPress(Sender: TObject; var Key: Char);
    procedure cbxReexaminarKeyPress(Sender: TObject; var Key: Char);
    procedure deDataNovoToqueKeyPress(Sender: TObject; var Key: Char);
    procedure edtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxPrenhezChange(Sender: TObject);
    procedure dtsDiagnosticosGestacaoDataChange(Sender: TObject; Field: TField);
    procedure edtBrincoEnter(Sender: TObject);
    procedure deDataEventoExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure JvDBUltimGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edPadraoVeterinarioButtonClick(Sender: TObject);
    procedure edPadraoVeterinarioChange(Sender: TObject);
    procedure edPadraoVeterinarioKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1EditButtonClick(Sender: TObject);
    procedure cbxgPrenhezKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxPrenhezKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure deDataEventoAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure deDataEventoInvalidDate(Sender: TObject; const DateString: string;
      var NewDate: TDateTime; var Accept: Boolean);
    procedure cbxgPrenhezEnter(Sender: TObject);
    procedure edtBrincoExit(Sender: TObject);
    procedure jvedtBrincoChange(Sender: TObject);
    procedure jvedtBrincoButtonClick(Sender: TObject);
    procedure jvedtBrincoEnter(Sender: TObject);
    procedure jvedtBrincoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvedtBrincoKeyPress(Sender: TObject; var Key: Char);
    procedure cbExibeSexagemClick(Sender: TObject);
    procedure JvDBUltimGrid4CellClick(Column: TColumn);
    function JvDBUltimGrid4CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure cbSelectAllClick(Sender: TObject);
    procedure JvDBUltimGrid4KeyPress(Sender: TObject; var Key: Char);
    procedure dblcSexoCriaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Zoo_ReproducaoDiagnosticosGestacaoDatamodule : TZoo_ReproducaoDiagnosticosGestacaoDatamodule ;
    FKVeterinario : string ;
    FBrinco       : string ;
    procedure CheckPanelReexaminar ;
    procedure SearchVeterinario ( TextToSearch : string);
    procedure SetVeterinario ( TextToSearch : string);
    procedure AddBrinco ;
    procedure AddByKey ( AKey : String ) ;
    function SearchAnimalFemea ( TextToSearch : string) : boolean ;
    procedure UpdateEdtBrinco ;
    procedure ShowFieldsSexoCria( AShow: Boolean );
    procedure InvertSelecao;
    procedure InvertAllSelection( ASelectAll : Boolean );
    procedure ImageStatus(const AImage: TImage; const AName : string; const AVisible: Boolean ; const ASelecionado: boolean );
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    class function Execute : boolean ; reintroduce ; // overload ;
  end;

implementation


Uses SearchsZootecnico ;

{$R *.dfm}

{ TfrmCustomWizard }


procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.AddBrinco;
begin
  //ValidateCamposFixo;

  try
    if ( Trim ( FBrinco ) <> '' ) and
       Zoo_ReproducaoDiagnosticosGestacaoDatamodule.AddBrinco( FBrinco ) then
      begin
        cbxPrenhez.Font.Color := clNavy ;
        deDataNovoToque.Font.Color := clNavy ;
        UpdateEdtBrinco ;
        jvedtBrinco.SetFocus ;
        jvedtBrinco.SelectAll ;
        exit ;
      end ;

    if SearchAnimalFemea ( FBrinco ) then
      begin
        jvedtBrinco.SetFocus ;
        jvedtBrinco.SelectAll ;
      end
    else
       raise Warning.Create('Animal não encontrado');
  except
     jvedtBrinco.setFocus ;
     jvedtBrinco.SelectAll ;
     raise ;
  end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.AddByKey(AKey: String);
begin
  if Zoo_ReproducaoDiagnosticosGestacaoDatamodule.LocateBrinco( FBrinco ) then
     exit ;

  //ValidateCamposFixo;


  if Zoo_ReproducaoDiagnosticosGestacaoDatamodule.AddByKey ( AKey ) then
    begin
      UpdateEdtBrinco;
    end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbExibeSexagemClick(
  Sender: TObject);
begin
  ShowFieldsSexoCria( cbExibeSexagem.Checked );
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbSelectAllClick(
  Sender: TObject);
begin
  InvertAllSelection( cbSelectAll.Checked );
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxgPrenhezEnter(
  Sender: TObject);
begin
   //cbxgPrenhez.DroppedDown:= True ;
 ////  TDBComboBox ( Sender ).DroppedDown:= True ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxgPrenhezKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key in [ VK_UP, VK_DOWN ] ) and not ( TDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TDBComboBox ( Sender ).DroppedDown := True  ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxPrenhezChange(Sender: TObject);
begin
  SendMessage( cbxPrenhez.Handle, CM_EXIT, 0, 0 ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxPrenhezKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key in [ VK_UP, VK_DOWN ] ) and not ( TDBComboBox ( Sender ).DroppedDown ) then
    begin
     Key := 0 ;
     TDBComboBox ( Sender ).DroppedDown := True  ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxPrenhezKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      //if pnlReexaminar.Visible then
      //  deDataNovoToque.SetFocus
      if pnlSexoCria.Visible then
         dblcSexoCria.SetFocus
      else
         jvedtBrinco.SetFocus ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.cbxReexaminarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
   begin
     Key := #0 ;
     jvedtBrinco.setFocus ;
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.AplicarProtocolos( checkBox1.Checked )  ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.CheckPanelReexaminar;
begin
   pnlReexaminar.Visible := False;
    {
                            ( not Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ.IsNull )
                        and (Trim ( Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ.asString ) <> '')}
end;

constructor TZoo_ReproducaoDiagnosticosGestacaoWizard.Create ( AOwner : TComponent  ) ;
begin
   inherited Create ( AOwner ) ;
   Zoo_ReproducaoDiagnosticosGestacaoDatamodule := TZoo_ReproducaoDiagnosticosGestacaoDatamodule.Create ( self ) ;
   Zoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenTables ;
   Zoo_ReproducaoDiagnosticosGestacaoDatamodule.OpenLotes;
   dtsDiagnosticosGestacao.DataSet := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao ;
   dsLotes.DataSet := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsLotes;
   CheckPanelReexaminar ;
   FKVeterinario := '' ;


   deAte.Date := Date ;
   deDataEvento.Date := Date ;
end;

class function TZoo_ReproducaoDiagnosticosGestacaoWizard.Execute : boolean;
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

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.ImageStatus(const AImage: TImage; const AName : string; const AVisible: Boolean ; const ASelecionado: boolean );
begin
  AImage.Visible := AVisible;

  if ASelecionado then
    begin
      AImage.Hint := AName + ' selecionado.'  ;
      ImageList1.GetIcon( 0, AImage.Picture.Icon ) ;
    end
  else
    begin
      AImage.Hint := AName + ' não selecionado.' ;
      ImageList1.GetIcon( 2, AImage.Picture.Icon ) ;
    end;
  AImage.Refresh ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.InvertAllSelection(
  ASelectAll: Boolean);
var
  checked : integer ;
begin
  if ASelectAll then
     checked := 1
  else
     checked := 0 ;

  with  TClientDataSet( dsLotes.DataSet ) do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           Edit ;
           FieldByName('SELECTED').asInteger := checked ;
           Post ;
           Next ;
         end;
      First ;
      EnableControls ;
    end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.InvertSelecao;
begin
  with TClientDataSet( dsLotes.DataSet ) do
   begin
     Edit ;
     if FieldByName('SELECTED').asInteger = 0 then
        FieldByName('SELECTED').asInteger := 1
     else
        FieldByName('SELECTED').asInteger := 0 ;

     Post ;
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.dblcSexoCriaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0 ;
      jvedtBrinco.SetFocus ;
      jvedtBrinco.SelectAll;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.deDataEventoAcceptDate(
  Sender: TObject; var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  Action := ADate > 0  ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.deDataEventoChange(Sender: TObject);
begin
  inherited;
  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.DataToque := deDataEvento.Date ;
end;


procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.deDataEventoExit(Sender: TObject);
begin
  inherited;
  if Screen.ActiveControl <> deDataEvento then
     exit ;

  if ( deDataEvento.date = 0  ) then
     begin
       deDataEvento.SetFocus ;
       raise Warning.Create('Data inválida');
     end
  else if ( deDataEvento.date > Date  ) then
     begin
       deDataEvento.SetFocus ;
       raise Warning.Create('Data superior a atual');
     end
//  else if ( deDataEvento.date < ( Date - 30 )) then
//     begin
//       deDataEvento.SetFocus ;
//       raise Warning.Create('Data inferiror a 30 dias');
//     end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.deDataEventoInvalidDate(
  Sender: TObject; const DateString: string; var NewDate: TDateTime;
  var Accept: Boolean);
begin
  inherited;
  Accept := False ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.deDataNovoToqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SendMessage( cbxPrenhez.Handle, CM_EXIT, 0, 0 ) ;
      if pnlReexaminar.Visible then
         cbxReexaminar.SetFocus
      else
         jvedtBrinco.setFocus ;
    end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.dtsDiagnosticosGestacaoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if ( Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ ) then
     CheckPanelReexaminar ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edPadraoVeterinarioButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchVeterinario ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edPadraoVeterinarioChange(
  Sender: TObject);
begin
  inherited;
  FKVeterinario := '' ;
  edPadraoVeterinario.Font.Color := clRed ;
  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinarioDefault ( '', '' ) ;
  ImageStatus(ImgedPadraoVeterinario, 'Veterinário', edPadraoVeterinario.Text <> '', FKVeterinario <> '');
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edPadraoVeterinarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      Key := #0 ;
      SearchVeterinario ( TJvComboEdit ( Sender ).Text ) ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edtBrincoEnter(Sender: TObject);
begin
  inherited;
  edtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edtBrincoExit(
  Sender: TObject);
begin
  if  ( Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.IsEmpty )
   or ( Trim( edtBrinco.Text ) = ''  ) then
     Exit ;

  if AnsiCompareText ( edtBrinco.Text, Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ) <> 0  then
   begin
     edtBrinco.SetFocus ;
     raise Warning.Create('Brinco não encontrado');
   end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edtBrincoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.Prior ;
     edtBrinco.DataSource := nil ;
     edtBrinco.text := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
     edtBrinco.DataSource := dtsDiagnosticosGestacao ;
     edtBrinco.SelectAll ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.Next ;
     edtBrinco.DataSource := nil ;
     edtBrinco.text := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
     edtBrinco.DataSource := dtsDiagnosticosGestacao ;
     edtBrinco.SelectAll ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.edtBrincoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       Key := #0 ;
       cbxPrenhez.SetFocus ;
     end;
  (*
  if Key = #13 then
     begin
       Key := #0 ;
       if not Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.Locate( 'BRINCOFEMEA', edtBrinco.Text, [ loCaseInsensitive ] ) then
         begin
          edtBrinco.SelectAll ;
          Raise Warning.Create ( 'Brinco não localizado' ) ;
         end ;
        JvDBUltimGrid1.SetFocus ;
     end;
     *)
end;

function TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
//  Result := Assigned ( Field ) and ( ((Field.FieldName = 'PRENHEZ') and (Field.Text <> 'não examinada') ) or ( Field.FieldName = 'REEXAMINAR' ) ) ;
//  Result := Assigned ( Field ) and ( ((Field.FieldName = 'PRENHEZ') and ( not Field.IsNull) ) or ( Field.FieldName = 'REEXAMINAR' ) ) ;
  Result := Assigned ( Field )
     and (  ( Field.FieldName = 'REEXAMINAR' )
         or ( Field.FieldName = 'PROTOCOLO_TOQUE' )
         ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid1EditButtonClick(
  Sender: TObject);
begin
  inherited;
   with Zoo_ReproducaoDiagnosticosGestacaoDatamodule, JvDBUltimGrid1 do
       if ( SelectedField = cdsDiagGestacaoNOMEVETERINARIO ) then
            self.SetVeterinario ( InplaceEditor.Text ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid1Enter(Sender: TObject);
begin
  JvDBUltimGrid1.SelectedField := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid1KeyPress(Sender: TObject;
  var Key: Char);
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


  with Zoo_ReproducaoDiagnosticosGestacaoDatamodule, JvDBUltimGrid1 do
     if Assigned ( InplaceEditor ) and ( InplaceEditor.Visible ) then
     begin
       if ( SelectedField = cdsDiagGestacaoNOMEVETERINARIO ) and ( InplaceEditor.Text <> '' ) then
         begin
            self.SetVeterinario ( InplaceEditor.Text ) ;
            exit ;
         end ;
     end;

   if (  Screen.ActiveControl = JvDBUltimGrid1 ) then
      Key := #0 ;

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
               DataSource.DataSet.Next;
               selectedindex := 0 ;
               while ( Columns[ selectedindex ].ReadOnly or not Columns[ selectedindex ].Visible ) and (selectedindex < (fieldcount - 1)) do
                  selectedindex := selectedindex + 1 ;
             end ;
      end;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid1ShowEditor(Sender: TObject;
  Field: TField; var AllowEdit: Boolean);
begin
  if ( deDataEvento.date = 0  ) then
     begin
       deDataEvento.SetFocus ;
       raise Warning.Create('Data do toque inválida');
     end
  else if ( deDataEvento.date > Date  ) then
     begin
       deDataEvento.SetFocus ;
       raise Warning.Create('Data do toque superior a atual');
     end ;
//  else if ( deDataEvento.date < ( Date - 30 )) then
//     begin
//       deDataEvento.SetFocus ;
//       raise Warning.Create('Data inferiror a 30 dias');
//     end;

  with TJvDBUltimGrid(Sender), DataSource.DataSet do
    if dgIndicator in Options then
      AllowEdit := not ( ( Columns [ Col - 1 ].ReadOnly ) or ( IsEmpty ) )
    else
      AllowEdit := not ( ( Columns [ Col ].ReadOnly ) or ( IsEmpty ) ) ;

  if ( AllowEdit ) and (  Field <> Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ ) then
    begin
       AllowEdit := {(Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ) or}
                    (Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVAPRENHEZ) or
                    (Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoNOVOTOQUE) or
                 ( Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoDESC_SEXO_CRIA )
                  {(( not Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ.IsNull )
                and (Trim ( Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoPRENHEZ.asString ) <> '')) or
                ( ( Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoDESC_GEMELAR ) or
                 ( Field = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoDESC_SEXO_CRIA ) );}
    end;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid4CellClick(
  Column: TColumn);
begin

  if not ( dsLotes.DataSet.IsEmpty )
   and ( Column.FieldName =  'SELECTED' ) then
     InvertSelecao ;
end;

function TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid4CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := ( Field.FieldName = 'SELECTED'  ) ;

  StringForTrue  := '1' ;
  StringForFalse := '0' ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.JvDBUltimGrid4KeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #32 then
    InvertSelecao ;
end;

PRocedure TZoo_ReproducaoDiagnosticosGestacaoWizard.jvedtBrincoButtonClick(
  Sender: TObject);
begin
  inherited;
  SearchAnimalFemea ( TJvComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.jvedtBrincoChange(
  Sender: TObject);
begin
  inherited;

  if edtBrinco.Text = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString then
     edtBrinco.Font.Color := clNavy
  else
     edtBrinco.Font.Color := clRed ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.jvedtBrincoEnter(
  Sender: TObject);
begin
  inherited;
  jvedtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.jvedtBrincoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_up then
    begin
     Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.Prior ;
     jvedtBrinco.text := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
     jvedtBrinco.SelectAll ;
     Key := 0 ;
    end
  else if Key = vk_down then
    begin
     Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.Next ;
     jvedtBrinco.text := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
     jvedtBrinco.SelectAll ;
     Key := 0 ;
    end ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.jvedtBrincoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13  ) then
    begin
      Key := #0 ;
//      if ( Trim ( edtBrinco.Text ) = '' ) then
//        exit ;

      if   ( Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString <> '' )
       and ( jvedtBrinco.Text = Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ) then
       begin
         cbxPrenhez.SetFocus ;
         exit ;
       end ;

      FBrinco := jvedtBrinco.Text ;
      AddBrinco ;
    end;
end;

function TZoo_ReproducaoDiagnosticosGestacaoWizard.SearchAnimalFemea(
  TextToSearch: string): boolean;
var
  lFound : boolean ;
begin
    lFound := False ;
    with TSearchFemeaAtivo.Create do
       try
          //FBrinco := '' ;
          //TextToFind := TextToSearch ;
          TextToFind := FBrinco ;
          FBrinco := '' ;
          lFound := Execute ;
          if ( lFound ) then
             begin
               FBrinco                  := Result.FieldByName( 'BRINCO' ).asString ;
               jvedtBrinco.Text         := Result.FieldByName( 'BRINCO' ).asString ;
               jvedtBrinco.Font.Color   := clNavy ;
               AddByKey ( Result.FieldByName( 'KZOO_ANIMAL_FEMEA' ).asString ) ;
             end ;
       finally
          SearchAnimalFemea := lFound ;
          free ;
       end ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.SearchVeterinario(TextToSearch: string);
begin

      with TSearchFuncionarioAtivo.Create do
         try
            TextToFind := TextToSearch ;
            if Execute then
               begin
                 edPadraoVeterinario.Text := Result.FieldByName( 'APELIDO' ).asString ;
                 FKVeterinario            := Result.FieldByName( 'KCAD_ENTIDADE' ).asString ;
                 Zoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinarioDefault ( FKVeterinario, edPadraoVeterinario.Text ) ;
                 edPadraoVeterinario.Font.Color := clNavy ;
               end
            else
              begin
                 edPadraoVeterinario.Text := '' ;
                 FKVeterinario            := '' ;
                 Zoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinarioDefault ( '', '' ) ;
                 edPadraoVeterinario.Font.Color := clNavy ;
              end;

         finally
            ImageStatus(ImgedPadraoVeterinario, 'Veterinário', edPadraoVeterinario.Text <> '' , FKVeterinario <> '');
            free ;
         end ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.SetVeterinario(TextToSearch: string);
begin

    with TSearchFuncionarioAtivo.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             begin
               Zoo_ReproducaoDiagnosticosGestacaoDatamodule.SetVeterinario(Result.FieldByName( 'KCAD_ENTIDADE' ).asString,  Result.FieldByName( 'APELIDO' ).asString) ;
             end ;
       finally
          free ;
       end ;

end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.ShowFieldsSexoCria(
  AShow: Boolean);
begin
  pnlSexoCria.Visible := AShow;
  JvDBUltimGrid1.Columns[9].Visible := AShow; //Sexo da Cria
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard.UpdateEdtBrinco;
begin
  jvedtBrinco.text := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
  jvedtBrinco.Font.color := clNavy ;
  FBrinco := Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacaoBRINCOFEMEA.asString ;
  jvedtBrinco.SelectAll ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.ApplyUpdates  ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_DiagnosticosGestacao.CreateAndDispatch( self ) ; ;
  PageControl.ActivePage := tbsPeriodo ;
  inherited;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard._actExecuteUpdate(
  Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly )
  and  ( PageControl.ActivePage = tbsDiagnosticosGestacao )
  and (  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.CountDiagnosticos > 0 ) ;
end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;
  if Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsLotesTOTAL_SELECTED.AsVariant < 1 then
     raise Warning.Create('Ao menos um lote deve ser selecionado') ;

  Zoo_ReproducaoDiagnosticosGestacaoDatamodule.SetPeriodo ( deAte.Date ) ;
  if Zoo_ReproducaoDiagnosticosGestacaoDatamodule.cdsDiagGestacao.IsEmpty then
     raise Warning.Create('Não há dados para o período') ;

  inherited;
  CheckPanelReexaminar ;
  Caption  := 'Diagnóstico de Reprodução'+ ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.Date ) ;
  ShowFieldsSexoCria( cbExibeSexagem.Checked );

  if jvedtBrinco.CanFocus then
     jvedtBrinco.SetFocus
  else
  if JvDBUltimGrid1.CanFocus and (not ( TClientDataSet(JvDBUltimGrid1.DataSource.DataSet).IsEmpty ) ) then
     JvDBUltimGrid1.SetFocus;


end;

procedure TZoo_ReproducaoDiagnosticosGestacaoWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption  := 'Diagnóstico de reprodução' ;

end;

initialization
  RegisterClass ( TZoo_ReproducaoDiagnosticosGestacaoWizard ) ;

end.


