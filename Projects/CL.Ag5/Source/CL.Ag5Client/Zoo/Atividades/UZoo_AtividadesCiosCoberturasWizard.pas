// Project      : Agenda 5
// Sub-Project  : Zootécnico
// Module       : Atividades a Executar
// Funcionality : - Cios / Coberutrar até uma data
//                - Cios / Coberturaras nos próximos X Dias
// License      : veja readme.txt



unit UZoo_AtividadesCiosCoberturasWizard;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls, JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, JvDBUltimGrid,
  UZoo_AtividadesCiosCoberturasDatamodule, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid,
  VCL.Mask, JvExMask, JvToolEdit, Tc.VCL.Edits, UZoo_AtividadesBaseWizard,
   Data.DB, Tc.Data.DB.Helpers, UDBZootecnico, JvDBControls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Extended.Mask, System.Actions,
  Tc.VCL.Application, Wrappers  ;

type
  TZoo_AtividadesCiosCoberturasWizard = class(TZoo_AtividadesBaseWizard)
    deAte: TTcDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure deAteExit(Sender: TObject);
  private
    { Private declarations }
    Zoo_AtividadesCiosCoberturasDatamodule : TZoo_AtividadesCiosCoberturasDatamodule ;
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    class function Execute : boolean ; override ;
  end;

  TZoo_AtividadesCiosCoberturasProximosDias   = class(TZoo_AtividadesCiosCoberturasWizard)
  private
    procedure OpenTables ; override ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
  end ;

implementation

uses ThreadSuppl,
     Exceptions ,
     UApplResources,
     ClAg5ClientCommonTypes ;


{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_AtividadesCiosCoberturasWizard.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  deAte.Date            := Date ;
//  ThreadSuppl.TSimpleThread.Create ( OpenTables ) ;
end;

procedure TZoo_AtividadesCiosCoberturasWizard.deAteExit(Sender: TObject);
begin
  inherited;
  if deAte.Date < Date then
    begin
      deAte.SetFocus ;
      raise Warning.Create('Data Inválida');
    end;
end;

class function TZoo_AtividadesCiosCoberturasWizard.Execute : boolean;
var
  ThisForm: TZoo_AtividadesCiosCoberturasWizard;
begin
  ThisForm := TZoo_AtividadesCiosCoberturasWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;
end ;

procedure TZoo_AtividadesCiosCoberturasWizard.OpenTables;
begin
  Zoo_AtividadesCiosCoberturasDatamodule           := TZoo_AtividadesCiosCoberturasDatamodule.Create ( self ) ;
  dtsResultado.DataSet := Zoo_AtividadesCiosCoberturasDatamodule.cdsACioCobertura ;
end;

procedure TZoo_AtividadesCiosCoberturasWizard._actExecuteExecute(Sender: TObject);
begin
//---
//  MessageDlg ( 'Processado com sucesso' ) ;
//  _lblCaption.Caption    := Caption ;
//  PageControl.ActivePage := TabSheetParametros ;
  inherited;
end;

procedure TZoo_AtividadesCiosCoberturasWizard._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption := '';
  Caption := 'Atividades - Cios / Coberturas' + ' até ' + FormatDateTime ( 'dd.mm.yyyy', deAte.date ) ;
  Zoo_AtividadesCiosCoberturasDatamodule.Ate := deAte.date ;

  inherited;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_AtividadesCiosCoberturasWizard._actPriorExecute(Sender: TObject);
begin
  inherited;
  Caption := 'Atividades - Cios / Coberturas' ;
end;

{ TZoo_AtividadesCiosCoberturasProximosDias }

constructor TZoo_AtividadesCiosCoberturasProximosDias.Create(AOwner: TComponent);
begin
  inherited;
  Caption        := Format ( '%s próx. %d dias', [ 'Atividades - Cios / Coberturas', ParametrosFazenda( LoggedUser.DomainID ).CiosProxDias ] ) ;
  TabSheetParametros.Enabled := False ;
  PageControl.ActivePage     := TabSheetResultado ;
  EditControlsDBGrid;
end;

procedure TZoo_AtividadesCiosCoberturasProximosDias.OpenTables;
begin
  Inherited;
  Zoo_AtividadesCiosCoberturasDatamodule.Ate := Date + ParametrosFazenda( LoggedUser.DomainID ).CiosProxDias;
end;

initialization
 RegisterClass ( TZoo_AtividadesCiosCoberturasWizard ) ;
 RegisterClass ( TZoo_AtividadesCiosCoberturasProximosDias ) ;


end.
