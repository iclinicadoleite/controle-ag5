unit UEST_CompraEstoqueMinimoReport;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, System.Actions, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  UEST_CompraEstoqueMinimoDatamodule,
  Tc.VCL.Application, Wrappers ;

type
  TEST_CompraEstoqueMinimoReport = class(T_FormWizard)
    TabSheet1: TTabSheet;
    JvDBUltimGrid1: TJvDBUltimGrid;
    DataSource1: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    function JvDBUltimGrid1CheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    FEST_CompraEstoqueMinimoDatamodule: TEST_CompraEstoqueMinimoDatamodule;
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses SysPrintGridDialog,
     CLAg5SvcEstoqueProdutosEstoqueMinimo ;


type
  SvcEstoqueProdutosEstoqueMinimoFactory = class( TInterfacedObject, ISvcEstoqueProdutosEstoqueMinimo )
    procedure ShowEstoqueMinimo ;
  end;

{ TfrmCustomWizard }

constructor TEST_CompraEstoqueMinimoReport.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui

  FEST_CompraEstoqueMinimoDatamodule := TEST_CompraEstoqueMinimoDatamodule.Create( self ) ;
  DataSource1.DataSet := FEST_CompraEstoqueMinimoDatamodule.cdsProdutosQtdeMinima ;
  JvDBUltimGrid1.ShowHighlighter := True ;

  FEST_CompraEstoqueMinimoDatamodule.OpenTables ;

  _btbExecute.Caption       := 'V&isualizar' ;
end;

destructor TEST_CompraEstoqueMinimoReport.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

class function TEST_CompraEstoqueMinimoReport.Execute : boolean;
var
  ThisForm: TEST_CompraEstoqueMinimoReport;
begin
  ThisForm := Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

function TEST_CompraEstoqueMinimoReport.JvDBUltimGrid1CheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  Result := Field =  FEST_CompraEstoqueMinimoDatamodule.cdsProdutosQtdeMinimaSELECTED ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TEST_CompraEstoqueMinimoReport._actExecuteExecute(Sender: TObject);
begin
  FEST_CompraEstoqueMinimoDatamodule.Filter ;
  SysPrintGridDialog.TPrintGridDialog.Execute( JvDBUltimGrid1, 'Solicitação de Compras' );
  FEST_CompraEstoqueMinimoDatamodule.UnFilter ;
end;

procedure TEST_CompraEstoqueMinimoReport._actNextExecute(Sender: TObject);
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

procedure TEST_CompraEstoqueMinimoReport._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

{ SvcEstoqueProdutosEstoqueMinimoFactory }

procedure SvcEstoqueProdutosEstoqueMinimoFactory.ShowEstoqueMinimo ;
begin
   TEST_CompraEstoqueMinimoReport.Execute ;
end;


initialization
   RegisterClass ( TEST_CompraEstoqueMinimoReport ) ;
   SvcEstoqueProdutosEstoqueMinimo := SvcEstoqueProdutosEstoqueMinimoFactory.Create ;
finalization
  SvcEstoqueProdutosEstoqueMinimo := nil ;

end.
