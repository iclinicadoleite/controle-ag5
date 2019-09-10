// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality :
//
// License      : veja readme.txt





unit UZoo_AtividadesLVPosPartoSCioWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  UZoo_AtividadesLVPosPartoSCioDatamodule, UZoo_AtividadesBaseWizard, VCL.Grids,
  VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask, Tc.VCL.Edits,
  Tc.VCL.Controls.GDIButton, System.Actions, Tc.VCL.Extended.Mask,
  Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesLVPosPartoSCioWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesLVPosPartoSCioDatamodule : TZoo_AtividadesLVPosPartoSCioDatamodule ;
  protected
    { Protected declarations }
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

implementation

uses ThreadSuppl, Exceptions ;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesLVPosPartoSCioWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;

   deAte.Date := Date ;

//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesLVPosPartoSCioWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesLVPosPartoSCioWizard;
begin
  ThisForm := TZoo_AtividadesLVPosPartoSCioWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesLVPosPartoSCioWizard.OpenTables;
begin
   Zoo_AtividadesLVPosPartoSCioDatamodule := TZoo_AtividadesLVPosPartoSCioDatamodule.Create ( self ) ;
   dtsResultado.DataSet := Zoo_AtividadesLVPosPartoSCioDatamodule.cdsAPartosSemCio ;
end;

procedure TZoo_AtividadesLVPosPartoSCioWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Pós Parto sem Cio' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesLVPosPartoSCioDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesLVPosPartoSCioWizard._actPriorExecute(Sender: TObject);
begin
  Caption := 'Atividades - Pós Parto sem Cio' ;

  inherited;
end;

end.
