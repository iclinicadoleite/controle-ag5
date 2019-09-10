Unit UZoo_RelatorioSISBOV;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids, VCL.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.DBCtrls, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.FMTBcd,
  Data.SqlExpr, Tc.Data.SQLExpr, Datasnap.Provider, UZoo_RelatorioSISBOVDatamodule, SysPrintGridDialog,
  Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioSISBOV = class(T_FormWizard)
    dtsFazenda: TDataSource;
    dtsAnimais: TDataSource;
    TabSheetParametros: TTabSheet;
    TabSheetResultado: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure DBGridResultadosShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
  private
    Zoo_RelatorioSISBOVDatamodule : TZoo_RelatorioSISBOVDatamodule ;
    { Private declarations }
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation


{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_RelatorioSISBOV.Create(AOwner: TComponent);
begin
  inherited;
  Zoo_RelatorioSISBOVDatamodule := TZoo_RelatorioSISBOVDatamodule.Create( self );
  dtsFazenda.DataSet            := Zoo_RelatorioSISBOVDatamodule.cdsFazenda ;
  dtsAnimais.DataSet            := Zoo_RelatorioSISBOVDatamodule.cdsAnimais ;
  DBGridResultados.ShowHighlighter := True ;
  Zoo_RelatorioSISBOVDatamodule.OpenTables ;
end;

destructor TZoo_RelatorioSISBOV.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TZoo_RelatorioSISBOV.Execute : boolean;
var
  ThisForm: TZoo_RelatorioSISBOV;
begin
  ThisForm := TZoo_RelatorioSISBOV.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_RelatorioSISBOV.DBGridResultadosShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False;
end;

procedure TZoo_RelatorioSISBOV._actExecuteExecute(Sender: TObject);
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption );
  inherited;
end;

procedure TZoo_RelatorioSISBOV._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  Zoo_RelatorioSISBOVDatamodule.cdsAnimais.Open ;
  inherited;

end;

procedure TZoo_RelatorioSISBOV._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  Zoo_RelatorioSISBOVDatamodule.cdsAnimais.Close ;
  inherited;

end;

initialization
  RegisterClass ( TZoo_RelatorioSISBOV) ;


end.
