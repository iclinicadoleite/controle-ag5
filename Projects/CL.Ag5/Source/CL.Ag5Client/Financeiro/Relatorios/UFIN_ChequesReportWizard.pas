// Project      : Agenda 5
// Sub-Project  : Financeiro
// Module       : Relatórios
// Funcionality : Relação de outras despesas
//
// License      : veja readme.txt





unit UFIN_ChequesReportWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  Tc.VCL.Controls.GDIButton, UFIN_ChequesReportDatamodule, VCL.Mask,
  JvExMask, Tc.VCL.Edits, ReportTypes, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, JvToolEdit, Data.DB, Tc.Data.DB.Helpers, Tc.VCL.Extended.Mask,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TFIN_ChequesReportWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TTcDateEdit;
    deDataFinal: TTcDateEdit;
    dbgResultado: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure dbgResultadoShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    FIN_ChequesReportDatamodule : TFIN_ChequesReportDatamodule ;
    RParams : TReportParamsFIN_Cheques ;
  public
    { Public declarations }
    class function Execute : boolean ; reintroduce ; // overload ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;

implementation

uses DateUtils, SearchsFinanceiro, UFIN_ChequesReport;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TFIN_ChequesReportWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;

  FIN_ChequesReportDatamodule := TFIN_ChequesReportDatamodule.Create( Self ) ;

  RParams := TReportParamsFIN_Cheques.Create;

  dbgResultado.ShowHighlighter := True ;

  deDataInicial.Date        := StartOfTheMonth( Date );
  deDataFinal.Date          := EndOfTheMonth( Date ) ;
  _btbExecute.Caption       := 'V&isualizar' ;
end;

procedure TFIN_ChequesReportWizard.dbgResultadoShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

destructor TFIN_ChequesReportWizard.Destroy;
begin
  RParams.Free;
  inherited;
end;


class function TFIN_ChequesReportWizard.Execute : boolean;
var
  ThisForm: TFIN_ChequesReportWizard;
begin
  ThisForm := TFIN_ChequesReportWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething} ;
  finally
     ThisForm.free ;
  end ;

end ;


procedure TFIN_ChequesReportWizard._actExecuteExecute(Sender: TObject);
begin
  TFIN_ChequesReport.Execute( RParams );
end;

procedure TFIN_ChequesReportWizard._actNextExecute(Sender: TObject);
begin
  RParams.ReportTitle      := 'Cheques';
  RParams.StartDate        := deDataInicial.Date;
  RParams.EndDate          := deDataFinal.Date;
  RParams.FDataModule      := FIN_ChequesReportDatamodule ;

  FIN_ChequesReportDatamodule.SetReportParams( RParams );
  FIN_ChequesReportDatamodule.OpenTables;

  inherited;
end;

procedure TFIN_ChequesReportWizard._actPriorExecute(Sender: TObject);
begin
  FIN_ChequesReportDatamodule.cdsCheques.Close ;

  inherited;
end;

initialization
   RegisterClass ( TFIN_ChequesReportWizard ) ;

end.
