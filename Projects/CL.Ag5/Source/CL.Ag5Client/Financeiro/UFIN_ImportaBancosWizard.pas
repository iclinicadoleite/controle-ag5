unit UFIN_ImportaBancosWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Data.DB, Tc.Data.DB.Helpers, 
  UdtmFIN_Bancos, JvDialogs, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, VCL.Mask,
  JvDBUltimGrid, JvExMask, JvToolEdit, VCL.Dialogs,
  Tc.VCL.Controls.GDIButton, Wrappers ;

type
  TFIN_ImportaBancosWizard = class(T_FormWizard)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edtFileBancos: TTcFilenameEdit;
    Label1: TLabel;
    JvDBUltimGrid1: TJvDBUltimGrid;
    JvSaveDialog1: TJvSaveDialog;
    Panel1: TPanel;
    cbImportAllProtocolos: TCheckBox;
    dtsImportaBancos: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    dtmImportaBancos : TdtmFIN_Bancos ;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

constructor TFIN_ImportaBancosWizard.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
end;

destructor TFIN_ImportaBancosWizard.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TFIN_ImportaBancosWizard.Execute : boolean;
var
  ThisForm: TFIN_ImportaBancosWizard;
begin
  ThisForm := TFIN_ImportaBancosWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TFIN_ImportaBancosWizard._actNextExecute(Sender: TObject);
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

procedure TFIN_ImportaBancosWizard._actPriorExecute(Sender: TObject);
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
