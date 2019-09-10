// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : Secagens
//
// License      : veja readme.txt


unit UZoo_AtividadesSecagemWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Grids,
  JvExDBGrids, VCL.DBGrids, JvDBGrid, JvDBUltimGrid, JvToolEdit, Tc.VCL.Edits,
  UZoo_AtividadesSecagemDatamodule, Data.DB, Tc.Data.DB.Helpers, VCL.Mask, JvExMask, UDBZootecnico,
  UZoo_AtividadesBaseWizard, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Extended.Mask, Tc.VCL.Application, Wrappers ;

type
  TZoo_AtividadesSecagemWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesSecagemDatamodule : TZoo_AtividadesSecagemDatamodule ;
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

  TZoo_AtividadesSecagemProximosDias   = class(TZoo_AtividadesSecagemWizard)
  private
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end ;


implementation

uses ClAg5ClientCommonTypes,
     ThreadSuppl;

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesSecagemWizard.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
   deAte.Date := Date ;
//   ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
   ThreadSuppl.TSyncThread.Create ( OpenTables ) ;
end;

class function TZoo_AtividadesSecagemWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesSecagemWizard;
begin
  ThisForm := TZoo_AtividadesSecagemWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
  
end ;

procedure TZoo_AtividadesSecagemWizard.OpenTables;
begin
   Zoo_AtividadesSecagemDatamodule := TZoo_AtividadesSecagemDatamodule.Create ( self ) ;
   dtsResultado.DataSet            := Zoo_AtividadesSecagemDatamodule.cdsASecagens ;
end;

procedure TZoo_AtividadesSecagemWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Secagem' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesSecagemDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesSecagemWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;
  Caption := 'Atividades - Secagem' ;

end;

{ TZoo_AtividadesSecagemProximosDias }

constructor TZoo_AtividadesSecagemProximosDias.Create(AOwner: TComponent);
begin
  inherited;
  Caption        := Format ( '%s próx. %d dias', [ 'Atividades - Secagem', ParametrosFazenda( LoggedUser.DomainID ).SecagensProxDias ] ) ;
  PageControl.ActivePage     := TabSheetResultado ;
  TabSheetParametros.Enabled := False ;
end;

procedure TZoo_AtividadesSecagemProximosDias.OpenTables;
begin
  inherited;
  Zoo_AtividadesSecagemDatamodule.Ate := Date + ParametrosFazenda( LoggedUser.DomainID ).SecagensProxDias ;
  EditControlsDBGrid;
end;

end.
