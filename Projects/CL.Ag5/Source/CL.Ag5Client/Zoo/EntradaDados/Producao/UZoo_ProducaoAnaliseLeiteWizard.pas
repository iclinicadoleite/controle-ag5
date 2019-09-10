unit UZoo_ProducaoAnaliseLeiteWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_ProducaoAnaliseLeiteDatamodule, VCL.Mask, JvExMask, Tc.VCL.Edits, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers,
  VCL.DBCtrls,
  Tc.VCL.Application,
  UZoo_EntradaDadosBaseWizard, Tc.VCL.Controls.GDIButton,
  Vcl.Dialogs, JvDialogs, System.Actions, Tc.RTL.Exceptions,
  CL.Ag5.NSMsgs, Tc.VCL.Extended.Mask, Wrappers ;

type
  TZoo_ProducaoAnaliseLeiteWizard = class(TZoo_EntradaDadosBaseWizard)
    TabSheet1: TTabSheet;
    Label3: TLabel;
    edFileName: TTcFilenameEdit;
    TabSheet2: TTabSheet;
    pnlTeste: TPanel;
    Button1: TTcGDIButton;
    edtFileTeste: TTcFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dtsLotes: TDataSource;
    dtsPesagens: TDataSource;
    Panel1: TPanel;
    JvDBUltimGrid1: TJvDBUltimGrid;
    Panel2: TPanel;
    JvDBUltimGrid2: TJvDBUltimGrid;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    dtsLoteAnalise: TDataSource;
    Label6: TLabel;
    deTeste: TTcDateEdit;
    TcGDIButton1: TTcGDIButton;
    JvSaveDialog1: TJvSaveDialog;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvDBUltimGrid2ShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
    procedure TcGDIButton1Click(Sender: TObject);
  private
    { Private declarations }
    FProcessed : Boolean ;
    Zoo_ProducaoAnaliseLeiteDatamodule : TZoo_ProducaoAnaliseLeiteDatamodule ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

procedure TZoo_ProducaoAnaliseLeiteWizard.Button1Click(Sender: TObject);
begin
  Zoo_ProducaoAnaliseLeiteDatamodule.GerarTeste( edtFileTeste.Text, deTeste.Date );
end;

constructor TZoo_ProducaoAnaliseLeiteWizard.Create(AOwner: TComponent);
begin
  inherited;
  Zoo_ProducaoAnaliseLeiteDatamodule := TZoo_ProducaoAnaliseLeiteDatamodule.Create( self );
  pnlTeste.Visible := DebugHook <> 0 ;
end;

destructor TZoo_ProducaoAnaliseLeiteWizard.Destroy;
begin
//
  inherited;
end;

class function TZoo_ProducaoAnaliseLeiteWizard.Execute : boolean;
var
  ThisForm: TZoo_ProducaoAnaliseLeiteWizard;
begin
  ThisForm := TZoo_ProducaoAnaliseLeiteWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_ProducaoAnaliseLeiteWizard.JvDBUltimGrid2ShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := False ;
end;


(*
procedure SaveRes(const AResName, AFileName : string );
var
  HResource: TResourceHandle;
  HResData: THandle;
  PWav: Pointer;
begin
 HResource := FindResource(HInstance, PChar(AResName), 'WAV');

 if HResource <> 0 then begin
   HResData:=LoadResource(HInstance, HResource);
   if HResData <> 0 then begin
     PWav:=LockResource(HResData);
     if Assigned(PWav) then
     begin
       // uses MMSystem
       sndPlaySound(nil, SND_NODEFAULT); // nil = stop currently playing
       sndPlaySound(PWav, SND_ASYNC or SND_MEMORY);
     end;
//      UnlockResource(HResData); // unnecessary per MSDN
//      FreeResource(HResData);   // unnecessary per MSDN
    end;
  end
  else
    RaiseLastOSError;
end;

*)

procedure SaveRes(const AResourceName, AFileName : string );
var
  ResStream: TResourceStream;
begin
  ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  try
    ResStream.Position := 0;
    ResStream.SaveToFile(AFileName);
  finally
    ResStream.Free;
  end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard.TcGDIButton1Click(Sender: TObject);
var
  source : string ;
begin
//  source := ExtractFilePath ( Application.ExeName ) + 'Modelos\Modelo Análises.xls' ;
  JvSaveDialog1.FileName := 'Modelo Análises.xlsx' ;
  if JvSaveDialog1.Execute then
    begin
     //CopyFile( PChar ( source ), PChar( JvSaveDialog1.FileName ), False ) ;
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível exportar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     SaveRes ( 'XLS_ANALISES', JvSaveDialog1.FileName )  ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actExecuteExecute(Sender: TObject);
begin
  Zoo_ProducaoAnaliseLeiteDatamodule.ApplyUpdates ;
  FProcessed := True ;
  MessageDlg ( Format ( '%s %s', [ Caption, FMessageProcessed ] ) ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.CreateAndDispatch( self ) ; ;
  inherited;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actExecuteUpdate(Sender: TObject);
begin
  if FProcessed then
    _actExecute.Enabled := False
  else
    inherited
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  FProcessed := False ;
  Zoo_ProducaoAnaliseLeiteDatamodule.LoadAnaliseFromFile ( edFileName.Text ) ;
  inherited;
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actNextUpdate(Sender: TObject);
begin
  inherited;
  _actNext.Enabled := ( Application.LicenseState <> lsReadOnly )
     and  (edFileName.Text <> '')
     and  (    (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.cdla')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.sql')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.xls')
            or (AnsiLowerCase ( ExtractFileExt (edFileName.Text )) = '.xlsx')
          )
     and   FileExists ( edFileName.Text )
end;

procedure TZoo_ProducaoAnaliseLeiteWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

end.



12/24/2013
12/24/2013
INSERT INTO CLINICA (TIPO,DTANALISE,AMOSTRA,BRINCO,DTLEITE,GORDURA,PROTEINA,LACTOSE,SOLIDOS,CCS,UREIA,EL,NOME,CBG,ATB,LOTE) VALUES ('A','12/24/2013','5','       103','12/19/2013','3.94 ','3.46 ','4.57 ','12.98 ','322','11.5 ','4.687','BALANCA',null,null,'OS92359');

