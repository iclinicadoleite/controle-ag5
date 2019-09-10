unit UCAD_EntidadesReportDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls,
  VCL.Buttons, ReportTypes, VCL.Mask, JvExMask,
  JvToolEdit, JvExExtCtrls, JvExtComponent, JvPanel,
  SysFormWizard, SysReportTypes, VCL.ComCtrls,
  Tc.VCL.Edits, JvImage, JvExComCtrls, JvComCtrls,
  Tc.VCL.Controls.GDIButton, Wrappers, System.Actions, Tc.VCL.Application ;

type

  TSpecificReportParams = ReportTypes.TReportParamsEntidades ;

  TCAD_EntidadesReportDialog = class(T_FormWizard, IReportDialog )
    TabSheet1: TTabSheet;
    lblPesquisar: TLabel;
    edSearch: TJvComboEdit;
    procedure edSearchButtonClick(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
    FKGrupo : string;
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


procedure TCAD_EntidadesReportDialog.edSearchChange(Sender: TObject);
begin
  self.FKGrupo := ''
end;

procedure TCAD_EntidadesReportDialog.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    TJvComboEdit ( Sender ).DoClick ;
end;

function TCAD_EntidadesReportDialog.Execute(Parameters: TReportParams) : boolean ;
begin
  GetParameters ( Parameters ) ;
  Result := ShowModal = mrOK ;
  if Result then
     SetParameters ( Parameters ) ;
end;

procedure TCAD_EntidadesReportDialog.GetParameters(
  var Parameters: TReportParams);
begin
  // pega os parametros e poe na tela ...
  with TSpecificReportParams ( Parameters ) do
    begin
      // FormControl := Param ;
    end ;
end;

procedure TCAD_EntidadesReportDialog.SetParameters( var Parameters: TReportParams ) ;
begin
  // pega da tela... e reconfigura os parametros ...
  with TSpecificReportParams ( Parameters ) do
    begin
      // Param := FormControl ;
      POR_GRUPO := 'T';
      GRUPO     := FKGrupo;
    end ;
end;

procedure TCAD_EntidadesReportDialog._actExecuteUpdate(Sender: TObject);
begin
  inherited;
  _actExecute.Enabled := FKGrupo <> '' ;
end;

procedure TCAD_EntidadesReportDialog.edSearchButtonClick(Sender: TObject);
begin
  with TSearchGrupoCliente.Create do
    try
      TextToFind := edSearch.Text ;
      if Execute then
        begin
          edSearch.Text := Result.FieldByName( 'DESCRICAO' ).asString;
          FKGrupo       := Result.FieldByName( 'KCAD_TIPOS' ).asString;
        end;
    finally
      free ;
    end ;
end;

end.

