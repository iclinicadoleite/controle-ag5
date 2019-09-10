unit UfrmZoo_InformacoesAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList,  UdtmZoo_InformacoesAnimal, Data.DB, Tc.Data.DB.Helpers, VCL.StdCtrls, VCL.Mask,
  VCL.DBCtrls, VCL.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Tc.VCL.Application,
  Tc.VCL.FormIntf, Tc.VCL.Form, JvDBCheckBox,
  UZoo_BancoDadosFemeaDatamodule, System.Actions,
  CL.Ag5.NSMsgs, Wrappers ;

type
  TfrmZoo_InformacoesAnimal = class(TTcForm, ITcDataForm)
    dtsResumo: TDataSource;
    pnlInfDados: TJvPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label35: TLabel;
    Label53: TLabel;
    pnlTitleGeral: TJvPanel;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit8: TDBEdit;
    pnlInfSanidade: TJvPanel;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    pnlTitleSanidade: TJvPanel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    pnlInfTarefas: TJvPanel;
    Label51: TLabel;
    Label57: TLabel;
    pnlTitleTarefas: TJvPanel;
    DBEdit44: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    pnlInfReproducao: TJvPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    pnlTitleReproducao: TJvPanel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    pnlInfProducao: TJvPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label36: TLabel;
    Label48: TLabel;
    pnlTitleProducao: TJvPanel;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    dtsUltimaTarefa: TDataSource;
    dtsProximaTarefa: TDataSource;
    ScrollBox1: TScrollBox;
    Label9: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TJvDBCheckBox;
    dtsSanidade: TDataSource;
    Label2: TLabel;
  private
    { Private declarations }
    dtmZoo_InformacoesAnimal : TdtmZoo_InformacoesAnimal ;
    FZoo_BancoDadosFemeaDatamodule : TZoo_BancoDadosFemeaDatamodule ;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    //ITcDataForm
    function GetBOF : boolean ; virtual ; abstract ;
    function GetEOF : boolean ; virtual ; abstract ;
    procedure InsertRecord ;    virtual ;
    procedure EditRecord ;      virtual ; abstract ;
    procedure DeleteRecord ;    virtual ; abstract ;
    procedure Save ;            virtual ; abstract ;
    procedure Cancel ;          virtual ; abstract ;
    procedure PrintData  ;      virtual ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    procedure SetZoo_BancoDadosFemeaDatamodule(
      const Value: TZoo_BancoDadosFemeaDatamodule);
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    property Zoo_BancoDadosFemeaDatamodule : TZoo_BancoDadosFemeaDatamodule  write SetZoo_BancoDadosFemeaDatamodule;
  end;


implementation

uses UInclusaoFemeaWizard, SysTypes ;

{$R *.dfm}

constructor TfrmZoo_InformacoesAnimal.Create(AOwner: TComponent);
begin
  inherited Create ( AOwner ) ;
  dtmZoo_InformacoesAnimal := TdtmZoo_InformacoesAnimal.Create ( self ) ;
  dtsResumo.DataSet        := dtmZoo_InformacoesAnimal.cdsResumoAnimal ;
  dtsUltimaTarefa.DataSet  := dtmZoo_InformacoesAnimal.cdsResumoAnimalUltimaTarefa ;
  dtsProximaTarefa.DataSet := dtmZoo_InformacoesAnimal.cdsResumoAnimalProximaTarefa ;
  dtsSanidade.DataSet      := dtmZoo_InformacoesAnimal.cdsResumoAnimalSanidade ;

  TCLAg5NSMsgEVT_Sanidade.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ImportacaoSISBOV.Subscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_BancoDadosFemea.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_OcorrenciasAnimal.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ProducaoAnimal.Subscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_Diagnosticos.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_TrocaBrinco.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_TrocaLote.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ControleLeiteiro.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Secagem.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_DiagnosticosGestacao.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Desmame.Subscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_Descartes.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe ( NeedRefresh ) ;


  pnlTitleGeral.Color      := SysTypes._TITLE_COLOR ;
  pnlTitleSanidade.Color   := SysTypes._TITLE_COLOR ;
  pnlTitleTarefas.Color    := SysTypes._TITLE_COLOR ;
  pnlTitleReproducao.Color := SysTypes._TITLE_COLOR ;
  pnlTitleProducao.Color   := SysTypes._TITLE_COLOR ;

  pnlTitleGeral.Font.Color      := SysTypes._TITLE_FONT_COLOR ;
  pnlTitleSanidade.Font.Color   := SysTypes._TITLE_FONT_COLOR ;
  pnlTitleTarefas.Font.Color    := SysTypes._TITLE_FONT_COLOR ;
  pnlTitleReproducao.Font.Color := SysTypes._TITLE_FONT_COLOR ;
  pnlTitleProducao.Font.Color   := SysTypes._TITLE_FONT_COLOR ;

end;


destructor TfrmZoo_InformacoesAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_Sanidade.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ImportacaoSISBOV.UnSubscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_BancoDadosFemea.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_OcorrenciasAnimal.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ProducaoAnimal.UnSubscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_Diagnosticos.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_TrocaBrinco.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_TrocaLote.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_ControleLeiteiro.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Secagem.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_AnaliseLeite.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_DiagnosticosGestacao.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_Desmame.UnSubscribe ( NeedRefresh ) ;

  TCLAg5NSMsgEVT_Descartes.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe ( NeedRefresh ) ;

  inherited;
end;

procedure TfrmZoo_InformacoesAnimal.InsertRecord;
begin
     TInclusaoFemeaWizard.Execute ( FZoo_BancoDadosFemeaDatamodule ) ;
end;

procedure TfrmZoo_InformacoesAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
var
  KZOO_ANIMAL : string;
begin

  with dtmZoo_InformacoesAnimal do
    begin
      if ( cdsResumoAnimal.State in [dsInsert,dsEdit] ) or (cdsResumoAnimal.ChangeCount > 0 ) then
         exit ;

      KZOO_ANIMAL := cdsResumoAnimalKZOO_ANIMAL.AsString;
      ReOpenTables ;
      cdsResumoAnimal.Locate('KZOO_ANIMAL', KZOO_ANIMAL, [] );
      cdsResumoAnimal.Refresh;
    end;
end;

procedure TfrmZoo_InformacoesAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_InformacoesAnimal.PrintData;
begin
//
end;

function TfrmZoo_InformacoesAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [daInsert] ;
   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;

function TfrmZoo_InformacoesAnimal.QueryAllowedDataActions: TTcDataActions;
begin
   Result := [daInsert] ;
end;

procedure TfrmZoo_InformacoesAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_InformacoesAnimal.MasterSource := FMasterSource ;
  dtmZoo_InformacoesAnimal.OpenTables ;

end;

procedure TfrmZoo_InformacoesAnimal.SetZoo_BancoDadosFemeaDatamodule(
  const Value: TZoo_BancoDadosFemeaDatamodule);
begin
 FZoo_BancoDadosFemeaDatamodule := Value ;
end;

end.

