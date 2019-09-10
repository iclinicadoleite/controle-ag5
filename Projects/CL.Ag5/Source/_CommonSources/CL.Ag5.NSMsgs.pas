unit CL.Ag5.NSMsgs;

interface


uses Tc.RTL.NotificationService ;

type

  TCLAg5NSMsg {TTcNSMsg   } = Tc.RTL.NotificationService.TTcNSMsg ;
  TCLAg5NSMsgClass {TTcNSMsgClass   } = Tc.RTL.NotificationService.TTcNSMsgClass ;
//  TCLAg5NSMsg =
//  TCLAg5NSMsg = class ( TTcNSMsg ) ;


  TCLAg5NSMsgShowTalk = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgHideTalk = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSupportUpdateStatus = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSupportFinished = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgBringToFront = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgDB  = class ( TCLAg5NSMsg )
  type
     TEventType = ( EnterBeforeConnect, EnterAfterConnect, EnterBeforeDisconnect, EnterAfterDisconnect, EnterOnLogin,
                    ExitBeforeConnect,  ExitAfterConnect,  ExitBeforeDisconnect,  ExitAfterDisconnect,  ExitOnLogin ) ;
  private
    FSQLConnection: TObject;
    FEventType: TEventType;
    procedure SetEventType(const Value: TEventType);
    procedure SetSQLConnection(const Value: TObject);
  public
    property SQLConnection : TObject  read FSQLConnection write SetSQLConnection;
    property EventType : TEventType  read FEventType write SetEventType;
  end ;

  TCLAg5NSMsgDBUpdate  = class ( TCLAg5NSMsg )
  public
    Message : string ;
  end ;

  TCLAg5NSMsgDBSession = class ( TCLAg5NSMsgDB )
  end;

  TCLAg5NSMsgDBEntidades = class ( TCLAg5NSMsgDB )
  end;

  TCLAg5NSMsgDBZootecnico = class ( TCLAg5NSMsgDB )
  end;

  TCLAg5NSMsgDBFinanceiro = class ( TCLAg5NSMsgDB )
  end;

  TCLAg5NSMsgDBAttachments = class ( TCLAg5NSMsgDB )
  end;


  TCLAg5NSMsgParamsChanged = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgParamsRefresh = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSysDomainChanged = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSysDomainImageChanged = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSysDomainImageRefresh = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSysLockApp = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgSysUnLockApp = class ( TCLAg5NSMsg )
  end;

  // configuracoes
  TCLAg5NSMsgEVT_CfgTarefas = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_CfgExames = class ( TCLAg5NSMsg )
  end;
  // entrada de dados - generico
  TCLAg5NSMsgEVT_Sanidade = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_ImportacaoSISBOV = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_Descartes= class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_TrocaBrinco = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_TrocaLote = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_TrocaRetiro = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_Indicadores = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_EstoqueSemen = class ( TCLAg5NSMsg )
  end;

  // entrada de dados - sanidade
  TCLAg5NSMsgEVT_Diagnosticos = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_BST = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_CMT = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_CC = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_ESCORES = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_Protocolos = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_BaixaTarefas = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_ImportacaoMastite = class ( TCLAg5NSMsg )
  end;

  // entrada de dados - producao
  TCLAg5NSMsgEVT_ControleLeiteiro = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_Secagem = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_AnaliseLeite = class ( TCLAg5NSMsg )
  end;

  // entrada dados - reproducao
  TCLAg5NSMsgEVT_CiosCoberturas = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_DiagnosticosGestacao = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_PartosAbortos = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_ColetaEmbriao = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_FIV = class ( TCLAg5NSMsg )
  end;

  // entrada dados - crescimento
  TCLAg5NSMsgEVT_PesoAltura = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_Desmame = class ( TCLAg5NSMsg )
  end;

  // banco dados - femea
  TCLAg5NSMsgEVT_BancoDadosFemea = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_OcorrenciasAnimal = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_ProducaoAnimal = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgEVT_AnimaisExternosFemea = class ( TCLAg5NSMsg )
  end;

  // Blur On/Off

  TCLAg5NSMsgDashBlurOn = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgDashBlurOff = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgBackgroundChanged = class ( TCLAg5NSMsg )
  end;

  // modulos
  TCLAg5NSMsgModulo = class ( TCLAg5NSMsg )
  public
    ModuleIndex : integer ;
  end;

  TCLAg5NSMsgModuloClass = class of TCLAg5NSMsgModulo ;

  TCLAg5NSMsgModuloZootecnico = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloFinanceiro = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloGerencialZootecnico = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloGerencialFinanceiro = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloPortal = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloPlanner = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloRPPA = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloICG = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloLoja = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloConfig = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgModuloHome = class ( TCLAg5NSMsgModulo )
  end;

  TCLAg5NSMsgUserInfoChanged = class ( TCLAg5NSMsgModulo )
  end;

  // financeiro
  TCLAg5NSMsgEVT_CentrosCusto = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgResetDRE = class ( TCLAg5NSMsg )
  end;

  TCLAg5NSMsgGetListPlanosDRE  = class ( TCLAg5NSMsg ) ;
  TCLAg5NSMsgGetResultListPlanosDRE  = class ( TCLAg5NSMsg )
  public
     Planos : string ;
  end ;

  TCLAg5NSMsgSetListPlanosDRE  = class ( TCLAg5NSMsg )
  public
     Planos : string ;
  end ;



implementation

{ TCLAg5NSMsgDB }

procedure TCLAg5NSMsgDB.SetEventType(const Value: TEventType);
begin
  FEventType := Value;
end;

procedure TCLAg5NSMsgDB.SetSQLConnection(const Value: TObject);
begin
  FSQLConnection := Value;
end;

end.
