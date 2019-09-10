unit UEST_ProdutosInsumosReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, ReportTypes, VCL.Mask, JvExMask,
  JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel,
  SysFormWizard, SysReportTypes, VCL.ComCtrls,
  Tc.VCL.Edits, JvImage, JvExComCtrls, JvComCtrls,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Application, Wrappers ;

type

  TSpecificReportParams = ReportTypes.TReportParamsProdutos ;

  TEST_ProdutosInsumosReportDialog = class(T_FormWizard, IReportDialog )
    TabSheet1: TTabSheet;
    lblPesquisar: TLabel;
    edSearch: TJvComboEdit;
    rgTipo: TRadioGroup;
    procedure edSearchButtonClick(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
    FKTipo : string ;
  protected
    { Protected declarations }
    procedure GetParameters (var Parameters : TReportParams ) ;
    procedure SetParameters (var Parameters : TReportParams ) ;
  public
    { Public declarations }
    function Execute (Parameters : TReportParams ) : boolean ; reintroduce ;
  end;

implementation

uses SearchsEntidades;

{$R *.dfm}

{ TfrmCustomDialog }


procedure TEST_ProdutosInsumosReportDialog.edSearchButtonClick(Sender: TObject);
begin
  with TSearchTipoProduto.Create do
    try
      TextToFind := edSearch.Text ;
      if Execute then
        begin
          edSearch.Text := Result.FieldByName( 'DESCRICAO' ).asString;
          FKTipo        := Result.FieldByName( 'KCAD_TIPOS' ).asString;
        end;
    finally
      free ;
    end ;
end;

procedure TEST_ProdutosInsumosReportDialog.edSearchChange(Sender: TObject);
begin
  inherited;
  self.FKTipo := ''
end;

procedure TEST_ProdutosInsumosReportDialog.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit ( Sender ).DoClick ;
end;

function TEST_ProdutosInsumosReportDialog.Execute(Parameters: TReportParams) : boolean ;
begin
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TEST_ProdutosInsumosReportDialog.GetParameters( var Parameters: TReportParams);
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;
    end ;
end;

procedure TEST_ProdutosInsumosReportDialog.SetParameters( var Parameters: TReportParams ) ;
begin
  with TSpecificReportParams ( Parameters ) do
    begin
      // Param := FormControl ;
      IS_PRODUTO := 'T';
      IS_INSUMO  := 'T';

      if rgTipo.ItemIndex = 0 then //Produtos
        IS_INSUMO := 'F';

      if rgTipo.ItemIndex = 1 then //Insumos
        IS_PRODUTO := 'F';

      POR_TIPO  := 'T';
      TIPO      := FKTipo;
    end ;
end;

procedure TEST_ProdutosInsumosReportDialog._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := FKTipo <> '' ;
end;

end.

