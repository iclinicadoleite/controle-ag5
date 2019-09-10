unit UDBFinanceiro_InitCFOP;

interface

uses
   Tc.DBRTL.AbstractDB,
   Tc.DBRTL.AbstractDB.DBX ;

type
   TInitCFOP = class
   private
    FDBFinanceiro: ITcAbstractDB ;
    procedure INSERT_CFOP ( a,b,c : string ) ;
    procedure Execute_1000 ;
    procedure Execute_2000 ;
    procedure Execute_3000 ;
    procedure Execute_5000 ;
    procedure Execute_6000 ;
    procedure Execute_7000 ;
    procedure InternalExecute ;
   public
     class procedure Execute ( ADBFinanceiro: ITcAbstractDB ) ;
   end;


implementation

uses SysUtils ;

procedure TInitCFOP.INSERT_CFOP ( a,b,c : string ) ;
const
  _INSERT_FAT_CFOP =
     'INSERT INTO FAT_CFOP(CFOP,DESCRICAO,APLICACAO) VALUES ( ''%s'', ''%s'', ''%s'' )' ;
begin
  FDBFinanceiro.ExecuteDirect( Format ( _INSERT_FAT_CFOP, [ a, b, c] ) );
end;

procedure TInitCFOP.InternalExecute ;
begin
   Execute_1000 ;
   Execute_2000 ;
   Execute_3000 ;
   Execute_5000 ;
   Execute_6000 ;
   Execute_7000 ;
end;

class procedure TInitCFOP.Execute ( ADBFinanceiro: ITcAbstractDB ) ;
begin
  with Create do
   try
      FDBFinanceiro := ADBFinanceiro ;
      InternalExecute ;
   finally
      Free ;
   end;
end ;

procedure TInitCFOP.Execute_1000 ;
begin

INSERT_CFOP( '1000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO ESTADO','Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado na mesma unidade da Federação do destinatário' ) ;
INSERT_CFOP( '1100','COMPRAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS ','' ) ;
INSERT_CFOP( '1101','Compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Compra de mercadoria a ser utilizada em processo de industrialização ou produção rural, bem como a entrada de mercadoria em estabelecimento industrial ou produtor rural de cooperativa recebida de seus cooperados ou de estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '1102','Compra para comercialização',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas.'
                   +'Também serão classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '1111','Compra para industrialização de mercadoria recebida anteriormente em consignação industrial','Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de industrialização, recebidas anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '1113','Compra para comercialização, de mercadoria recebida anteriormente em consignação mercantil','Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '1116','Compra para industrialização ou produção rural originada de encomenda para recebimento futuro (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)',
                    'Compra de mercadoria, a ser utilizada em processo de industrialização ou produção rural, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código '
                   +'“1.922 – Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro”.' ) ;
INSERT_CFOP( '1117','Compra para comercialização originada de encomenda para recebimento futuro',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no código '
                   +'1.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro.' ) ;
INSERT_CFOP( '1118','Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem.',
                    'Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo estabelecimento do adquirente originário, '
                    +'sejam entregues pelo vendedor remetente diretamente ao destinatário, em operação de venda à ordem, cuja venda seja classificada, pelo adquirente originário, '
                    +'no código 5.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem.' ) ;
INSERT_CFOP( '1120','Compra para industrialização, em venda à ordem, já recebida do vendedor remetente','Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente originário.' ) ;
INSERT_CFOP( '1121','Compra para comercialização, em venda à ordem, já recebida do vendedor remetente','Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já recebidas do vendedor remetente por ordem do adquirente originário.' ) ;
INSERT_CFOP( '1122','Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente','Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '1124','Industrialização efetuada por outra empresa',
                    'Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos serviços prestados e '
                   +'os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo '
                   +'imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos 1.551 - Compra de bem para o ativo imobilizado ou 1.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '1125','Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria',
                    'Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utilização no processo de industrialização não transitaram pelo estabelecimento do adquirente das mercadorias, '
                   +'compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias '
                   +'para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos 1.551 - Compra de bem para o ativo imobilizado ou 1.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '1126','Compra para utilização na prestação de serviço sujeita ao ICMS (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) - DECRETO 36.465/2011','Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ICMS. (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '1128','Compra para utilização na prestação de serviço sujeita ao ISSQN(AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011','Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ISSQN. (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011 - DECRETO 36.465/2011.' ) ;
INSERT_CFOP( '1150','TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','' ) ;
INSERT_CFOP( '1151','Transferência para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Entrada de mercadoria recebida, em transferência de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrialização ou produção rural.' ) ;
INSERT_CFOP( '1152','Transferência para comercialização','Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.' ) ;
INSERT_CFOP( '1153','Transferência de energia elétrica para distribuição','Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro estabelecimento da mesma empresa, para distribuição.' ) ;
INSERT_CFOP( '1154','Transferência para utilização na prestação de serviço','Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.' ) ;
INSERT_CFOP( '1200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO DO ESTABELECIMENTO, DE PRODUTOS DE TERCEIROS OU ANULAÇÕES DE VALORES','' ) ;
INSERT_CFOP( '1201','Devolução de venda de produção do estabelecimento ','Devolução de venda de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada como "Venda de produção do estabelecimento". (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)' ) ;
INSERT_CFOP( '1202','Devolução de venda de mercadoria adquirida ou recebida de terceiros',
                    'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de industrialização no estabelecimento, '
                   +'cujas saídas tenham sido classificadas como Venda de mercadoria adquirida ou recebida de terceiros.' ) ;
INSERT_CFOP( '1203','Devolução de venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio ',
                    'Devolução de venda de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada no código '
                   +'"5.109 – Venda de produção do estabelecimento destinada à Zona Franca de Manaus ou Áreas de Livre Comércio". (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)' ) ;
INSERT_CFOP( '1204','Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio',
                    'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas foram classificadas no código '
                   +'5.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio.' ) ;
INSERT_CFOP( '1205','Anulação de valor relativo à prestação de serviço de comunicação','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de comunicação.' ) ;
INSERT_CFOP( '1206','Anulação de valor relativo à prestação de serviço de transporte','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de transporte.' ) ;
INSERT_CFOP( '1207','Anulação de valor relativo à venda de energia elétrica','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de venda de energia elétrica.' ) ;
INSERT_CFOP( '1208','Devolução de produção do estabelecimento, remetida em transferência','Devolução de produto industrializado ou produzido pelo estabelecimento transferido para outro estabelecimento da mesma empresa. (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)' ) ;
INSERT_CFOP( '1209','Devolução de mercadoria adquirida ou recebida de terceiros, remetida em transferência','Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros, transferidas para outros estabelecimentos da mesma empresa.' ) ;
INSERT_CFOP( '1250','COMPRAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '1251','Compra de energia elétrica para distribuição ou comercialização','Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição aos seus cooperados.' ) ;
INSERT_CFOP( '1252','Compra de energia elétrica por estabelecimento industrial','Classificam-se neste código as compras de energia elétrica utilizada no processo de industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '1253','Compra de energia elétrica por estabelecimento comercial','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '1254','Compra de energia elétrica por estabelecimento prestador de serviço de transporte','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de transporte.' ) ;
INSERT_CFOP( '1255','Compra de energia elétrica por estabelecimento prestador de serviço de comunicação','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '1256','Compra de energia elétrica por estabelecimento de produtor rural','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '1257','Compra de energia elétrica para consumo por demanda contratada','Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.' ) ;
INSERT_CFOP( '1300','AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO','' ) ;
INSERT_CFOP( '1301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '1302','Aquisição de serviço de comunicação por estabelecimento industrial','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '1303','Aquisição de serviço de comunicação por estabelecimento comercial','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '1304','Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento prestador de serviço de transporte.' ) ;
INSERT_CFOP( '1305','Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '1306','Aquisição de serviço de comunicação por estabelecimento de produtor rural','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '1350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','' ) ;
INSERT_CFOP( '1351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '1352','Aquisição de serviço de transporte por estabelecimento industrial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '1353','Aquisição de serviço de transporte por estabelecimento comercial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '1354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '1355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '1356','Aquisição de serviço de transporte por estabelecimento de produtor rural','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '1360','Aquisição de serviço de transporte por contribuinte-substituto em relação ao serviço de transporte (ACR) (Ajuste SINIEF 06/2007- Decreto nº 30.861/2007) –– a partir de 01.01.2008','Aquisição de serviço de transporte quando o adquirente for contribuinte-substituto em relação ao imposto incidente na prestação dos serviços' ) ;
INSERT_CFOP( '1400','ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','' ) ;
INSERT_CFOP( '1401','Compra para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)',
                    'Compra de mercadoria sujeita ao regime de substituição tributária, a ser utilizada em processo de industrialização ou produção rural, bem como compra, '
                   +'por estabelecimento industrial ou produtor rural de cooperativa, de mercadoria sujeita ao mencionado regime. ' ) ;
INSERT_CFOP( '1403','Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de operações com mercadorias sujeitas ao regime de substituição '
                   +'tributária. Também serão classificadas neste código as compras de mercadorias sujeitas ao regime de substituição tributária em estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '1406','Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária','Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '1407','Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária','Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '1408','Transferência para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Mercadoria sujeita ao regime de substituição tributária, recebida em transferência de outro estabelecimento da mesma empresa, para ser industrializada ou consumida na produção rural no estabelecimento.' ) ;
INSERT_CFOP( '1409','Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '1410','Devolução de venda de mercadoria, de produção do estabelecimento, sujeita ao regime de substituição tributária','Devolução de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada como "Venda de mercadoria de produção do estabelecimento sujeita ao regime de substituição tributária".' ) ;
INSERT_CFOP( '1411','Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas saídas tenham sido classificadas como '
                   +'Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '1414','Retorno de mercadoria de produção do estabelecimento, remetida para venda fora do estabelecimento, sujeita ao regime de substituição tributária','Entrada, em retorno, de produto industrializado ou produzido pelo próprio estabelecimento, remetido para venda fora do estabelecimento, inclusive por meio de veículo, sujeito ao regime de substituição tributária e não comercializado.' ) ;
INSERT_CFOP( '1415','Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as entradas, em retorno, de mercadorias adquiridas ou recebidas de terceiros remetidas para vendas fora do estabelecimento, '
                   +'inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária, e não comercializadas.' ) ;
INSERT_CFOP( '1450','SISTEMAS DE INTEGRAÇÃO','' ) ;
INSERT_CFOP( '1451','Retorno de animal do estabelecimento produtor','Classificam-se neste código as entradas referentes ao retorno de animais criados pelo produtor no sistema integrado.' ) ;
INSERT_CFOP( '1452','Retorno de insumo não utilizado na produção','Classificam-se neste código o retorno de insumos não utilizados pelo produtor na criação de animais pelo sistema integrado.' ) ;
INSERT_CFOP( '1500','ENTRADAS DE MERCADORIAS REMETIDAS PARA FORMAÇÃO DE LOTE OU COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES (NR Ajuste SINIEF 09/2005)','' ) ;
INSERT_CFOP( '1501','Entrada de mercadoria recebida com fim específico de exportação','Classificam-se neste código as entradas de mercadorias em estabelecimento de trading company, empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de exportação.' ) ;
INSERT_CFOP( '1503','Entrada decorrente de devolução de produto, de fabricação do estabelecimento, remetido com fim específico de exportação',
                    'Devolução de produto industrializado ou produzido pelo estabelecimento, remetido a "trading company", a empresa comercial exportadora ou a outro estabelecimento '
                   +'do remetente, com fim específico de exportação, cuja saída tenha sido classificada no código "5.501 – Remessa de produção do estabelecimento com fim específico de exportação". ' ) ;
INSERT_CFOP( '1504','Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros',
                    'Devolução de mercadoria, adquirida ou recebida de terceiro, remetida a trading company, a empresa comercial exportadora ou a outro estabelecimento do remetente, '
                   +'com fim específico de exportação, cuja saída tenha sido classificada no código “5.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação”.' ) ;
INSERT_CFOP( '1505','Entrada decorrente de devolução simbólica de mercadoria remetida para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento.',
                    'Devolução simbólica de mercadoria remetida para formação de lote de exportação, cuja saída tenha sido classificada no código "5.504 – Remessa de mercadoria para formação de lote de exportação, '
                   +'de produto industrializado ou produzido pelo próprio estabelecimento".' ) ;
INSERT_CFOP( '1506','Entrada decorrente de devolução simbólica de mercadoria, adquirida ou recebida de terceiros, remetida para formação de lote de exportação.',
                    'Devolução simbólica de mercadoria remetida para formação de lote de exportação em armazéns alfandegados, entrepostos aduaneiros ou outros estabelecimentos que venham a ser '
                   +'regulamentados pela legislação tributária de cada Unidade Federada, efetuada pelo estabelecimento depositário, cuja saída tenha sido classificada no código '
                   +'"5.505 – Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação".' ) ;
INSERT_CFOP( '1550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '1551','Compra de bem para o ativo imobilizado','Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.' ) ;
INSERT_CFOP( '1552','Transferência de bem do ativo imobilizado','Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em transferência de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '1553','Devolução de venda de bem do ativo imobilizado','Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código 5.551 - Venda de bem do ativo imobilizado.' ) ;
INSERT_CFOP( '1554','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento','Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas saídas tenham sido classificadas no código 5.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento.' ) ;
INSERT_CFOP( '1555','Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento','Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento.' ) ;
INSERT_CFOP( '1556','Compra de material para uso ou consumo','Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.' ) ;
INSERT_CFOP( '1557','Transferência de material para uso ou consumo','Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '1600','CRÉDITOS E RESSARCIMENTOS DE ICMS','' ) ;
INSERT_CFOP( '1601','Recebimento, por transferência, de crédito de ICMS','Classificam-se neste código os lançamentos destinados ao registro de créditos de ICMS, recebidos por transferência de outras empresas.' ) ;
INSERT_CFOP( '1602','Recebimento, por transferência, de saldo credor do ICMS, de outro estabelecimento da mesma empresa, para compensação de saldo devedor do imposto. ','Lançamento destinado ao registro da transferência de saldo credor do ICMS, recebido de outro estabelecimento da mesma empresa, destinado à compensação do saldo devedor do estabelecimento, inclusive no caso de apuração centralizada do imposto. ' ) ;
INSERT_CFOP( '1603','Ressarcimento de ICMS retido por substituição tributária',
                    'Lançamento destinado ao registro de ressarcimento de ICMS retido por substituição tributária à contribuinte substituído, efetuado pelo contribuinte substituto, ou, '
                   +'ainda, quando o ressarcimento for apropriado pelo próprio contribuinte substituído, nas hipóteses previstas na legislação aplicável.' ) ;
INSERT_CFOP( '1604','Lançamento do crédito relativo à compra de bem para o ativo imobilizado','Lançamento destinado ao registro da apropriação de crédito de bem do ativo imobilizado. (Dec.25.068/2003-EFEITOS A PARTIR DE 01.01.2003)' ) ;
INSERT_CFOP( '1605','Recebimento, por transferência, de saldo devedor do ICMS de outro estabelecimento da mesma empresa',
                     'Lançamento destinado ao registro da transferência de saldo devedor do ICMS, recebido de outro estabelecimento da mesma empresa, '
                    +'para efetivação da apuração centralizada do imposto. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810/2004) (a partir de 01.01.2005)' ) ;
INSERT_CFOP( '1650','ENTRADAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTES (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004)','' ) ;
INSERT_CFOP( '1651','Compra de combustível ou lubrificante para industrialização subseqüente','Compra de combustível ou lubrificante a ser utilizados em processo de industrialização do próprio produto. (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004)' ) ;
INSERT_CFOP( '1652','Compra de combustível ou lubrificante para comercialização','Compra de combustível ou lubrificante a ser comercializados. (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004)' ) ;
INSERT_CFOP( '1653','Compra de combustível ou lubrificante por consumidor ou usuário final','Compra de combustível ou lubrificante, a ser consumidos em processo de industrialização de outros produtos, na produção rural, na prestação de serviço ou por usuário final. ' ) ;
INSERT_CFOP( '1658','Transferência de combustível ou lubrificante para industrialização','Entrada de combustível ou lubrificante, recebidos em transferência de outro estabelecimento da mesma empresa, para ser utilizados em processo de industrialização do próprio produto.(Decreto 26.174/2003)(efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1659','Transferência de combustível ou lubrificante para comercialização','Entrada de combustível ou lubrificante, recebidos em transferência de outro estabelecimento da mesma empresa, para ser comercializados. .(Decreto 26.174/2003) (efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1660','Devolução de venda de combustível ou lubrificante destinados à industrialização subseqüente','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante destinados à industrialização subseqüente". (Decreto 26.174/2003)(efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1661','Devolução de venda de combustível ou lubrificante destinados à comercialização','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante para comercialização".(Decreto 26.174/2003)(efeitos a partir 01.01.2004).' ) ;
INSERT_CFOP( '1662','Devolução de venda de combustível ou lubrificante destinados a consumidor ou usuário final','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante por consumidor ou usuário final"..(Decreto 26.174/2003)(efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1663','Entrada de combustível ou lubrificante para armazenagem','Entrada de combustível ou lubrificante para armazenagem. .(Decreto 26.174/2003)(efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1664','Retorno de combustível ou lubrificante remetidos para armazenagem','Entrada, ainda que simbólica, por retorno de combustível ou lubrificante, remetidos para armazenagem. .(Decreto 26.174/2003)(efeitos a partir 01.01.2004)' ) ;
INSERT_CFOP( '1900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '1901','Entrada para industrialização por encomenda','Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de outra empresa ou de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '1902','Retorno de mercadoria remetida para industrialização por encomenda','Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, incorporados ao produto final pelo estabelecimento industrializador.' ) ;
INSERT_CFOP( '1903','Entrada de mercadoria remetida para industrialização e não aplicada no referido processo','Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e não aplicados no referido processo.' ) ;
INSERT_CFOP( '1904','Retorno de remessa para venda fora do estabelecimento','Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de veículos, e não comercializadas.' ) ;
INSERT_CFOP( '1905','Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral','Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '1906','Retorno de mercadoria remetida para depósito fechado ou armazém geral','Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '1907','Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral',
                    'Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito em depósito fechado ou armazém geral, '
                   +'quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não tenham retornado ao estabelecimento depositante.' ) ;
INSERT_CFOP( '1908','Entrada de bem por conta de contrato de comodato','Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.' ) ;
INSERT_CFOP( '1909','Retorno de bem remetido por conta de contrato de comodato','Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de comodato.' ) ;
INSERT_CFOP( '1910','Entrada de bonificação, doação ou brinde','Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou brinde.' ) ;
INSERT_CFOP( '1911','Entrada de amostra grátis','Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.' ) ;
INSERT_CFOP( '1912','Entrada de mercadoria ou bem recebido para demonstração','Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.' ) ;
INSERT_CFOP( '1913','Retorno de mercadoria ou bem remetido para demonstração','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para demonstração.' ) ;
INSERT_CFOP( '1914','Retorno de mercadoria ou bem remetido para exposição ou feira','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição ou feira.' ) ;
INSERT_CFOP( '1915','Entrada de mercadoria ou bem recebido para conserto ou reparo','Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.' ) ;
INSERT_CFOP( '1916','Retorno de mercadoria ou bem remetido para conserto ou reparo','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo.' ) ;
INSERT_CFOP( '1917','Entrada de mercadoria recebida em consignação mercantil ou industrial','Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '1918','Devolução de mercadoria remetida em consignação mercantil ou industrial','Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '1919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial','Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '1920','Entrada de vasilhame ou sacaria','Classificam-se neste código as entradas de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '1921','Retorno de vasilhame ou sacaria','Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '1922','Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro','Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de compra para recebimento futuro.' ) ;
INSERT_CFOP( '1923','Entrada de mercadoria recebida do vendedor remetente, em venda à ordem',
                    'Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à ordem, '
                   +'cuja compra do adquirente originário, foi classificada nos códigos 1.120 - Compra para industrialização, em venda à ordem, '
                   +'já recebida do vendedor remetente ou 1.121 - Compra para comercialização, em venda à ordem, já recebida do vendedor remetente.' ) ;
INSERT_CFOP( '1924','Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.' ) ;
INSERT_CFOP( '1925','Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para industrialização e incorporados ao produto final pelo estabelecimento industrializador, '
                   +'nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '1926','Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação','Classificam-se neste código os registros efetuados a título de reclassificação decorrente de formação de kit de mercadorias ou de sua desagregação.' ) ;
INSERT_CFOP( '1931','Lançamento efetuado pelo tomador do serviço de transporte, '
                   +'quando a responsabilidade de retenção do imposto for atribuída ao remetente ou alienante da mercadoria, '
                   +'pelo serviço de transporte realizado por transportador autônomo ou por transportador não-inscrito na '
                   +'Unidade da Federação onde se tenha iniciado o serviço.',
                   'Lançamento efetuado pelo tomador do serviço de transporte realizado por transportador autônomo ou por transportador não-inscrito na '
                   +'Unidade da Federação onde se tenha iniciado o serviço, quando a responsabilidade pela retenção do imposto for atribuída ao remetente '
                   +'ou alienante da mercadoria.' ) ;
INSERT_CFOP( '1932','Aquisição de serviço de transporte iniciado em Unidade da Federação diversa daquela onde esteja inscrito o prestador','Aquisição de serviço de transporte que tenha sido iniciado em Unidade da Federação diversa daquela onde o prestador esteja inscrito como contribuinte. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810/2004) (efeitos a partir 01.01.2005)' ) ;
INSERT_CFOP( '1933','Aquisição de serviço tributado pelo Imposto sobre Serviços de Qualquer Natureza (Ajuste SINIEF 06/2005) (NR)','Aquisição de serviço, cujo imposto é de competência municipal, desde que informado em Nota Fiscal modelo 1 ou 1-A. (NR Ajuste SINIEF 06/2005) (DECRETO Nº 26.868/2006 - efeitos a partir 01.01.2006)' ) ;
INSERT_CFOP( '1934','Entrada simbólica de mercadoria recebida para depósito fechado ou armazém geral',
                    'Classificam-se neste código as entradas simbólicas de mercadorias recebidas para depósito em depósito fechado ou armazém geral, '
                   +'cuja remessa tenha sido classificada pelo remetente no código "5.934 - Remessa simbólica de mercadoria depositada em armazém geral ou '
                   +'depósito fechado AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009 (efeitos a partir de 1º de julho de 2010) - DECRETO 36.465/2011' ) ;
INSERT_CFOP( '1949','Outra entrada de mercadoria ou prestação de serviço não especificada','Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não tenham sido especificadas nos códigos anteriores.' ) ;
end ;

procedure TInitCFOP.Execute_2000 ;
begin

INSERT_CFOP( '2000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DE OUTROS ESTADOS','Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado em unidade da Federação diversa daquela do destinatário' ) ;
INSERT_CFOP( '2100','COMPRAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS (NR Ajuste SINIEF 05/2005  (Decreto 28.868/2006)','' ) ;
INSERT_CFOP( '2101','Compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)',
                    'Compra de mercadoria a ser utilizada em processo de industrialização ou produção rural, bem como a entrada de mercadoria em estabelecimento industrial '
                   +'ou produtor rural de cooperativa, recebida de seus cooperados ou de estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '2102','Compra para comercialização',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão classificadas neste código as entradas de mercadorias em '
                   +'estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '2111','Compra para industrialização de mercadoria recebida anteriormente em consignação industrial','Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de industrialização, recebidas anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '2113','Compra para comercialização, de mercadoria recebida anteriormente em consignação mercantil','Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '2116','Compra para industrialização ou produção rural originada de encomenda para recebimento futuro (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)',
                    'Compra de mercadoria a ser utilizada em processo de industrialização ou produção rural, quando da entrada real da mercadoria, '
                   +'cuja aquisição tenha sido classificada no código "2.922 – Lançamento efetuado a título de simples faturamento decorrente de compra '
                   +'para recebimento futuro".' ) ;
INSERT_CFOP( '2117','Compra para comercialização originada de encomenda para recebimento futuro',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisição tenha sido '
                   +'classificada no código 2.922 - Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro.' ) ;
INSERT_CFOP( '2118','Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem',
                    'Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo estabelecimento do adquirente originário, '
                   +'sejam entregues pelo vendedor remetente diretamente ao destinatário, em operação de venda à ordem, cuja venda seja classificada, '
                   +'pelo adquirente originário, no código 6.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem.' ) ;
INSERT_CFOP( '2120','Compra para industrialização, em venda à ordem, já recebida do vendedor remetente','Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente originário.' ) ;
INSERT_CFOP( '2121','Compra para comercialização, em venda à ordem, já recebida do vendedor remetente','Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já recebidas do vendedor remetente por ordem do adquirente originário.' ) ;
INSERT_CFOP( '2122','Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente','Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '2124','Industrialização efetuada por outra empresa',
                    'Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos serviços prestados e '
                   +'os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a bens do ativo '
                   +'imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos '
                   +'2.551 - Compra de bem para o ativo imobilizado ou 2.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '2125','Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria',
                    'Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utilização no '
                   +'processo de industrialização não transitaram pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços '
                   +'prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir '
                   +'a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos '
                   +'2.551 - Compra de bem para o ativo imobilizado ou 2.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '2126','Compra para utilização na prestação de serviço sujeita ao ICMS (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) - DECRETO 36.465/2011',
                    'Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ICMS (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010). efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '2128','Compra para utilização na prestação de serviço sujeita ao ISSQN(AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011','Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ISSQN. (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '2150','TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','' ) ;
INSERT_CFOP( '2151','Transferência para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Entrada de mercadoria, recebida em transferência de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrialização ou produção rural.' ) ;
INSERT_CFOP( '2152','Transferência para comercialização','Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.' ) ;
INSERT_CFOP( '2153','Transferência de energia elétrica para distribuição','Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro estabelecimento da mesma empresa, para distribuição.' ) ;
INSERT_CFOP( '2154','Transferência para utilização na prestação de serviço','Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.' ) ;
INSERT_CFOP( '2200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO DO ESTABELECIMENTO OU DE TERCEIROS OU ANULAÇÕES DE VALORES','' ) ;
INSERT_CFOP( '2201','Devolução de venda de produção do estabelecimento','Devolução de venda de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada no código "6.101 - Venda de produção do estabelecimento". ' ) ;
INSERT_CFOP( '2202','Devolução de venda de mercadoria adquirida ou recebida de terceiros','Devolução de vendas de mercadoria, adquirida ou recebida de terceiro, que não tenham sido objeto de industrialização no estabelecimento, cuja saída tenha sido classificada como Venda de mercadoria adquirida ou recebida de terceiros.' ) ;
INSERT_CFOP( '2203','Devolução de venda de produção do estabelecimento destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','Devolução de venda de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada no código "6.109 – Venda de produção do estabelecimento destinada à Zona Franca de Manaus ou Áreas de Livre Comércio".' ) ;
INSERT_CFOP( '2204','Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','Devolução de venda de mercadoria adquirida ou recebida de terceiro, cuja saída tenha sido classificada no código “6.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio”.' ) ;
INSERT_CFOP( '2205','Anulação de valor relativo à prestação de serviço de comunicação','Anulação correspondente a valor faturado indevidamente, decorrente de prestação de serviço de comunicação.' ) ;
INSERT_CFOP( '2206','Anulação de valor relativo à prestação de serviço de transporte','Anulação correspondente a valor faturado indevidamente, decorrente de prestação de serviço de transporte.' ) ;
INSERT_CFOP( '2207','Anulação de valor relativo à venda de energia elétrica','Anulação correspondente a valor faturado indevidamente, decorrente de venda de energia elétrica.' ) ;
INSERT_CFOP( '2208','Devolução de produção do estabelecimento, remetida em transferência.','Devolução de produto industrializado ou produzido pelo estabelecimento e transferido para outro estabelecimento da mesma empresa. ' ) ;
INSERT_CFOP( '2209','Devolução de mercadoria adquirida ou recebida de terceiros e remetida em transferência','Devolução de mercadoria adquirida ou recebida de terceiros, transferidas para outros estabelecimentos da mesma empresa.' ) ;
INSERT_CFOP( '2250','COMPRAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '2251','Compra de energia elétrica para distribuição ou comercialização','Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição com seus cooperados.' ) ;
INSERT_CFOP( '2252','Compra de energia elétrica por estabelecimento industrial','Classificam-se neste código as compras de energia elétrica utilizada no processo de industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '2253','Compra de energia elétrica por estabelecimento comercial','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '2254','Compra de energia elétrica por estabelecimento prestador de serviço de transporte','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de transporte.' ) ;
INSERT_CFOP( '2255','Compra de energia elétrica por estabelecimento prestador de serviço de comunicação','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '2256','Compra de energia elétrica por estabelecimento de produtor rural','Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '2257','Compra de energia elétrica para consumo por demanda contratada','Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.' ) ;
INSERT_CFOP( '2300','AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO','' ) ;
INSERT_CFOP( '2301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '2302','Aquisição de serviço de comunicação por estabelecimento industrial','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '2303','Aquisição de serviço de comunicação por estabelecimento comercial','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de comunicação utilizados por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '2304','Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte','Classificam-se neste código as aquisições de serviços de comunicação utilizado por estabelecimento prestador de serviço de transporte.' ) ;
INSERT_CFOP( '2305','Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '2306','Aquisição de serviço de comunicação por estabelecimento de produtor rural','Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '2350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','' ) ;
INSERT_CFOP( '2351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '2352','Aquisição de serviço de transporte por estabelecimento industrial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '2353','Aquisição de serviço de transporte por estabelecimento comercial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '2354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '2355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '2356','Aquisição de serviço de transporte por estabelecimento de produtor rural','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '2400','ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','' ) ;
INSERT_CFOP( '2401','Compra para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)',
                    'Compra de mercadoria, sujeita ao regime de substituição tributária, a ser utilizada em processo de industrialização ou produção rural, '
                   +'bem como compra, por estabelecimento industrial ou produtor rural de cooperativa, de mercadoria sujeita ao mencionado regime.' ) ;
INSERT_CFOP( '2403','Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de operações com mercadorias sujeitas ao '
                   +'regime de substituição tributária. Também serão classificadas neste código as compras de mercadorias sujeitas ao regime de substituição '
                   +'tributária em estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '2406','Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária','Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '2407','Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária','Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '2408','Transferência para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Entrada de mercadoria, sujeita ao regime de substituição tributária, recebida em transferência de outro estabelecimento da mesma empresa, para ser industrializada ou consumida na produção rural no estabelecimento destinatário.' ) ;
INSERT_CFOP( '2409','Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '2410','Devolução de venda de produção do estabelecimento, quando o produto estiver sujeito ao regime de substituição tributária','Devolução de produto industrializado ou produzido pelo estabelecimento, cuja saída tenha sido classificada como "Venda de produção do estabelecimento quando o produto estiver sujeito ao regime de substituição tributária". ' ) ;
INSERT_CFOP( '2411','Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária','Devolução de vendas de mercadoria adquirida ou recebida de terceiro, cuja saída tenha sido classificada como “Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária”.' ) ;
INSERT_CFOP( '2414','Retorno de produção do estabelecimento, remetida para venda fora do estabelecimento, quando o produto estiver sujeito ao regime de substituição tributária','Entrada, em retorno, de produto industrializado ou produzido pelo estabelecimento sujeito ao regime de substituição tributária, remetido para venda fora do estabelecimento, inclusive por meio de veículo, e não comercializado. ' ) ;
INSERT_CFOP( '2415','Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária','Entrada, em retorno, de mercadoria sujeita ao regime de substituição tributária, adquirida ou recebida de terceiro remetida para venda fora do estabelecimento, inclusive por meio de veículo, e não comercializada.' ) ;
INSERT_CFOP( '2500','ENTRADAS DE MERCADORIAS REMETIDAS PARA FORMAÇÃO DE LOTE OU COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES (NR Ajuste SINIEF 09/2005)','' ) ;
INSERT_CFOP( '2501','Entrada de mercadoria recebida com fim específico de exportação','Classificam-se neste código as entradas de mercadorias em estabelecimento de trading company, empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de exportação.' ) ;
INSERT_CFOP( '2503','Entrada decorrente de devolução de produto industrializado pelo estabelecimento, remetido com fim específico de exportação',
                    'Devolução de produto industrializado ou produzido pelo estabelecimento, remetido a "trading company", a empresa comercial exportadora ou a outro '
                   +'estabelecimento do remetente, com fim específico de exportação, cuja saída tenha sido classificada no código "6.501 – Remessa de produção do estabelecimento com fim específico de exportação". ' ) ;
INSERT_CFOP( '2504','Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros remetidas a trading company, a empresa comercial exportadora '
                   +'ou a outro estabelecimento do remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código 6.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação.' ) ;
INSERT_CFOP( '2505','Entrada decorrente de devolução simbólica de mercadoria remetida para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento.',
                    'Devolução simbólica de mercadoria remetida para formação de lote de exportação, cuja saída tenha sido classificada no código '
                   +'"6.504 – Remessa de mercadoria para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento". '
                   +'(ACR Ajuste SINIEF 09/2005) (Decreto 28.868/2006)' ) ;
INSERT_CFOP( '2506','Entrada decorrente de devolução simbólica de mercadoria, adquirida ou recebida de terceiros, remetida para formação de lote de exportação.',
                    'Devolução simbólica de mercadoria remetida para formação de lote de exportação em armazéns alfandegados, entrepostos aduaneiros ou outros estabelecimentos '
                   +'que venham a ser regulamentados pela legislação tributária de cada Unidade Federada, efetuada pelo estabelecimento depositário, cuja saída tenha sido '
                   +'classificada no código "6.505 – Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação". ' ) ;
INSERT_CFOP( '2550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '2551','Compra de bem para o ativo imobilizado','Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.' ) ;
INSERT_CFOP( '2552','Transferência de bem do ativo imobilizado','Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em transferência de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '2553','Devolução de venda de bem do ativo imobilizado','Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código 6.551 - Venda de bem do ativo imobilizado.' ) ;
INSERT_CFOP( '2554','Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento','Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas saídas tenham sido classificadas no código 6.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento.' ) ;
INSERT_CFOP( '2555','Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento','Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento.' ) ;
INSERT_CFOP( '2556','Compra de material para uso ou consumo','Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.' ) ;
INSERT_CFOP( '2557','Transferência de material para uso ou consumo','Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '2600','CRÉDITOS E RESSARCIMENTOS DE ICMS','' ) ;
INSERT_CFOP( '2603','Ressarcimento de ICMS retido por substituição tributária','Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.' ) ;
INSERT_CFOP( '2650','ENTRADAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTES (ACR Ajuste SINIEF 9/2003)','' ) ;
INSERT_CFOP( '2651','Compra de combustível ou lubrificante para industrialização subseqüente','Compra de combustível ou lubrificante a ser utilizados em processo de industrialização do próprio produto. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2652','Compra de combustível ou lubrificante para comercialização','Compra de combustível ou lubrificante a ser comercializados. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2652','Compra de combustível ou lubrificante para comercialização','Compra de combustível ou lubrificante a ser comercializados. ' ) ;
INSERT_CFOP( '2653','Compra de combustível ou lubrificante por consumidor ou usuário final','Compra de combustível ou lubrificante, a ser consumidos em processo de industrialização de outros produtos, na produção rural, na prestação de serviço ou por usuário final. ' ) ;
INSERT_CFOP( '2658','Transferência de combustível ou lubrificante para industrialização','Entrada de combustível ou lubrificante, recebidos em transferência de outro estabelecimento da mesma empresa, para ser utilizados em processo de industrialização do próprio produto. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2659','Transferência de combustível ou lubrificante para comercialização ','Entrada de combustível ou lubrificante, recebidos em transferência de outro estabelecimento da mesma empresa, para ser comercializados. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2660','Devolução de venda de combustível ou lubrificante destinados à industrialização subseqüente','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante destinados à industrialização subseqüente".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2661','Devolução de venda de combustível ou lubrificante destinados à comercialização','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante para comercialização".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2662','Devolução de venda de combustível ou lubrificante destinados a consumidor ou usuário final','Devolução de venda de combustível ou lubrificante, cuja saída tenha sido classificada como "Venda de combustível ou lubrificante por consumidor ou usuário final".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2663','Entrada de combustível ou lubrificante para armazenagem','Entrada de combustível ou lubrificante para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2664','Retorno de combustível ou lubrificante remetidos para armazenagem','Entrada, ainda que simbólica, por retorno de combustível ou lubrificante, remetidos para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '2900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '2901','Entrada para industrialização por encomenda','Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de outra empresa ou de outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '2902','Retorno de mercadoria remetida para industrialização por encomenda','Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, incorporados ao produto final pelo estabelecimento industrializador.' ) ;
INSERT_CFOP( '2903','Entrada de mercadoria remetida para industrialização e não aplicada no referido processo','Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e não aplicados no referido processo.' ) ;
INSERT_CFOP( '2904','Retorno de remessa para venda fora do estabelecimento','Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de veículos, e não comercializadas.' ) ;
INSERT_CFOP( '2905','Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral','Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '2906','Retorno de mercadoria remetida para depósito fechado ou armazém geral','Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '2907','Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral',
                    'Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito em depósito fechado ou armazém geral, '
                   +'quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não tenham retornado ao estabelecimento depositante.' ) ;
INSERT_CFOP( '2908','Entrada de bem por conta de contrato de comodato','Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.' ) ;
INSERT_CFOP( '2909','Retorno de bem remetido por conta de contrato de comodato','Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de comodato.' ) ;
INSERT_CFOP( '2910','Entrada de bonificação, doação ou brinde','Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou brinde.' ) ;
INSERT_CFOP( '2911','Entrada de amostra grátis','Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.' ) ;
INSERT_CFOP( '2912','Entrada de mercadoria ou bem recebido para demonstração','Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.' ) ;
INSERT_CFOP( '2913','Retorno de mercadoria ou bem remetido para demonstração','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para demonstração.' ) ;
INSERT_CFOP( '2914','Retorno de mercadoria ou bem remetido para exposição ou feira','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição ou feira.' ) ;
INSERT_CFOP( '2915','Entrada de mercadoria ou bem recebido para conserto ou reparo','Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.' ) ;
INSERT_CFOP( '2916','Retorno de mercadoria ou bem remetido para conserto ou reparo','Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo.' ) ;
INSERT_CFOP( '2917','Entrada de mercadoria recebida em consignação mercantil ou industrial','Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '2918','Devolução de mercadoria remetida em consignação mercantil ou industrial','Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '2919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial','Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '2920','Entrada de vasilhame ou sacaria','Classificam-se neste código as entradas de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '2921','Retorno de vasilhame ou sacaria','Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '2922','Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro','Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de compra para recebimento futuro.' ) ;
INSERT_CFOP( '2923','Entrada de mercadoria recebida do vendedor remetente, em venda à ordem',
                    'Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à ordem, cuja compra do adquirente originário, '
                   +'foi classificada nos códigos 2.120 - Compra para industrialização, em venda à ordem, já recebida do vendedor remetente ou '
                   +'2.121 - Compra para comercialização, em venda à ordem, já recebida do vendedor remetente.' ) ;
INSERT_CFOP( '2924','Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente','Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.' ) ;
INSERT_CFOP( '2925','Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para industrialização e '
                   +'incorporados ao produto final pelo estabelecimento industrializador, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '2931','Lançamento efetuado pelo tomador do serviço de transporte, quando a responsabilidade de retenção do imposto for atribuída ao remetente ou '
                   +'alienante da mercadoria, pelo serviço de transporte realizado por transportador autônomo ou por transportador não-inscrito na Unidade da Federação '
                   +'onde se tenha iniciado o serviço  ',
                    'Lançamento efetuado pelo tomador do serviço de transporte realizado por transportador autônomo ou por transportador não-inscrito na Unidade da Federação '
                   +'onde se tenha iniciado o serviço, quando a responsabilidade pela retenção do imposto for atribuída ao remetente ou alienante da mercadoria.' ) ;
INSERT_CFOP( '2932','Aquisição de serviço de transporte iniciado em Unidade da Federação diversa daquela onde esteja inscrito o prestador ','Aquisição de serviço de transporte que tenha sido iniciado em Unidade da Federação diversa daquela onde o prestador esteja inscrito como contribuinte. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810/2004) (a partir de 01.01.2005)' ) ;
INSERT_CFOP( '2933','Aquisição de serviço tributado pelo Imposto Sobre Serviços de Qualquer Natureza','Aquisição de serviço, cujo imposto é de competência municipal, desde que informado em Nota Fiscal modelo 1 e 1-A. (NR Ajuste SINIEF 06/2005) (a partir de 01.01.2006)' ) ;
INSERT_CFOP( '2934','Entrada simbólica de mercadoria recebida para depósito fechado ou armazém geral',
                    'Classificam-se neste código as entradas simbólicas de mercadorias recebidas para depósito em depósito fechado ou armazém geral, '
                   +'cuja remessa tenha sido classificada pelo remetente no código "6.934 - Remessa simbólica de mercadoria depositada em armazém geral ou depósito fechado '
                   +'(AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009 efeitos a partir de 1º de julho de 2010- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '2949','Outra entrada de mercadoria ou prestação de serviço não especificado','Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.' ) ;
end ;

procedure TInitCFOP.Execute_3000 ;
begin

INSERT_CFOP( '3000','ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO EXTERIOR','Classificam-se, neste grupo, as entradas de mercadorias oriundas de outro país, inclusive as decorrentes de aquisição por arrematação, concorrência ou qualquer outra forma de alienação promovida pelo poder público, e os serviços iniciados no exterior' ) ;
INSERT_CFOP( '3100','COMPRAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','' ) ;
INSERT_CFOP( '3101','Compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Compra de mercadoria a ser utilizada em processo de industrialização ou produção rural, bem como a entrada de mercadoria em estabelecimento industrial ou produtor rural de cooperativa.' ) ;
INSERT_CFOP( '3102','Compra para comercialização','Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '3126','Compra para utilização na prestação de serviço sujeita ao ICMS (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011','Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ICMS (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010). efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '3127','Compra para industrialização sob o regime de drawback ',
                    'Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de industrialização e posterior exportação do produto resultante, '
                   +'cujas vendas serão classificadas no código 7.127 - Venda de produção do estabelecimento sob o regime de drawback.' ) ;
INSERT_CFOP( '3128','Compra para utilização na prestação de serviço sujeita ao ISSQN(AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011','Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de serviços sujeitas ao ISSQN. (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de 1º de janeiro de 2011- DECRETO 36.465/2011' ) ;
INSERT_CFOP( '3200','DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES',' Início' ) ;
INSERT_CFOP( '3201','Devolução de venda de produção do estabelecimento','Devolução de venda de produto industrializado ou produzido pelo próprio estabelecimento, cuja saída tenha sido classificada como "Venda de produção do estabelecimento". ' ) ;
INSERT_CFOP( '3202','Devolução de venda de mercadoria adquirida ou recebida de terceiros',
                    'Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de industrialização '
                   +'no estabelecimento, cujas saídas tenham sido classificadas como Venda de mercadoria adquirida ou recebida de terceiros.' ) ;
INSERT_CFOP( '3205','Anulação de valor relativo à prestação de serviço de comunicação','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de comunicação.' ) ;
INSERT_CFOP( '3206','Anulação de valor relativo à prestação de serviço de transporte','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de prestações de serviços de transporte.' ) ;
INSERT_CFOP( '3207','Anulação de valor relativo à venda de energia elétrica','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes de venda de energia elétrica.' ) ;
INSERT_CFOP( '3211','Devolução de venda de produção do estabelecimento sob o regime de drawback ','Classificam-se neste código as devoluções de vendas de produtos industrializados pelo estabelecimento sob o regime de drawback.' ) ;
INSERT_CFOP( '3250','COMPRAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '3251','Compra de energia elétrica para distribuição ou comercialização','Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou comercialização. Também serão classificadas neste código as compras de energia elétrica por cooperativas para distribuição aos seus cooperados.' ) ;
INSERT_CFOP( '3250','COMPRAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '3301','Aquisição de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '3350','AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE','' ) ;
INSERT_CFOP( '3351','Aquisição de serviço de transporte para execução de serviço da mesma natureza','Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '3352','Aquisição de serviço de transporte por estabelecimento industrial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '3353','Aquisição de serviço de transporte por estabelecimento comercial','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial. Também serão classificadas neste código as aquisições de serviços de transporte utilizados por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '3354','Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '3355','Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '3356','Aquisição de serviço de transporte por estabelecimento de produtor rural','Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '3500','ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','' ) ;
INSERT_CFOP( '3503','Devolução de mercadoria exportada que tenha sido recebida com fim específico de exportação',
                    'Classificam-se neste código as devoluções de mercadorias exportadas por trading company, empresa comercial exportadora ou outro estabelecimento do remetente, '
                   +'recebidas com fim específico de exportação, cujas saídas tenham sido classificadas no código 7.501 - Exportação de mercadorias recebidas com fim específico de exportação.' ) ;
INSERT_CFOP( '3550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '3551','Compra de bem para o ativo imobilizado','Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.' ) ;
INSERT_CFOP( '3553','Devolução de venda de bem do ativo imobilizado','Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas tenham sido classificadas no código 7.551 - Venda de bem do ativo imobilizado.' ) ;
INSERT_CFOP( '3556','Compra de material para uso ou consumo','Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.' ) ;
INSERT_CFOP( '3650','ENTRADAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTES ','' ) ;
INSERT_CFOP( '3651','Compra de combustível ou lubrificante para industrialização subseqüente','Compra de combustível ou lubrificante a ser utilizados em processo de industrialização do próprio produto. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '3652','Compra de combustível ou lubrificante para comercialização','Compra de combustível ou lubrificante a ser comercializados. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '3653','Compra de combustível ou lubrificante por consumidor ou usuário final','Compra de combustível ou lubrificante, a ser consumidos em processo de industrialização de outros produtos, na produção rural, na prestação de serviço ou por usuário final. ' ) ;
INSERT_CFOP( '3900','OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '3930','Lançamento efetuado a título de entrada de bem sob amparo de regime especial aduaneiro de admissão temporária','Lançamento efetuado a título de entrada de bem amparada por regime especial aduaneiro de admissão temporária. – (Decreto Nº 26.174 de 26/11/2003). a partir 01.01.2004   ' ) ;
INSERT_CFOP( '3949','Outra entrada de mercadoria ou prestação de serviço não especificado','Outra entrada de mercadoria ou prestação de serviço que não tenham sido especificada nos códigos anteriores. – (Decreto Nº 26.174 de 26/11/2003). a partir 01.01.2004   ' ) ;
end ;

procedure TInitCFOP.Execute_5000 ;
begin

INSERT_CFOP( '5000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O ESTADO','Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado na mesma unidade da Federação do destinatário.' ) ;
INSERT_CFOP( '5100','VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','' ) ;
INSERT_CFOP( '5101','Venda de produção do estabelecimento','Venda de produto industrializado ou produzido pelo estabelecimento, bem como a de mercadoria por estabelecimento industrial ou produtor rural de cooperativa destinada a seus cooperados ou a estabelecimento de outra cooperativa. ' ) ;
INSERT_CFOP( '5102','Venda de mercadoria adquirida ou recebida de terceiros',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                   +'que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de mercadorias '
                   +'por estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '5103','Venda de produção do estabelecimento efetuada fora do estabelecimento','Venda efetuada fora do estabelecimento, inclusive por meio de veículo, de produto industrializado ou produzido no estabelecimento. ' ) ;
INSERT_CFOP( '5104','Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento',
                    'Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de veículo, '
                   +'de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não tenham sido objeto de qualquer '
                   +'processo industrial no estabelecimento.' ) ;
INSERT_CFOP( '5105','Venda de produção do estabelecimento que não deva por ele transitar','Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '5106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                   +'armazenadas em depósito fechado, armazém geral ou outro, que não tenham sido objeto de qualquer processo industrial no estabelecimento '
                   +'sem que haja retorno ao estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias importadas, '
                   +'cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou o desembaraço aduaneiro, '
                   +'com destino ao estabelecimento do comprador, sem transitar pelo estabelecimento do importador.' ) ;
INSERT_CFOP( '5109','Venda de produção do estabelecimento destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','Venda de produto industrializado ou produzido pelo estabelecimento destinado à Zona Franca de Manaus ou Áreas de Livre Comércio. ' ) ;
INSERT_CFOP( '5110','Venda de mercadoria, adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comercio, '
                    +'de que trata o Anexo do Convênio SINIEF s/n, de 15 de dezembro de 1970, que dispõe sobre o Sistema Nacional Integrado de Informações Econômico-Fiscais ',
                    'Venda de mercadoria, adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio, desde que alcançada pelos benefícios '
                    +'fiscais de que tratam o Decreto-Lei nº 288, de 28 de fevereiro de 1967, o Convênio ICM 65/88, de 06 de dezembro de 1988, o Convênio ICMS 36/97, '
                    +'de 23 de maio de 1997, e o Convênio ICMS 37/97, de 23 de maio de 1997. (NR Ajuste SINIEF 09/2004) (Decreto nº 26.955/2004' ) ;
INSERT_CFOP( '5111','Venda de produção do estabelecimento remetida anteriormente em consignação industrial','Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '5112','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação industrial','Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '5113','Venda de produção do estabelecimento remetida anteriormente em consignação mercantil','Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '5114','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil','Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '5115','Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil','Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '5116','Venda de produção do estabelecimento originada de encomenda para entrega futura','Venda de produto industrializado ou produzido pelo estabelecimento, quando da saída real do produto, cujo faturamento tenha sido classificado no código "5.922 – Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura". ' ) ;
INSERT_CFOP( '5117','Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial '
                    +'no estabelecimento, quando da saída real da mercadoria, cujo faturamento tenha sido classificado no código '
                    +'5.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura.' ) ;
INSERT_CFOP( '5118','Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.' ) ;
INSERT_CFOP( '5119','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.' ) ;
INSERT_CFOP( '5120','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem',
                    'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer '
                   +'processo industrial no estabelecimento, entregues pelo vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, '
                   +'no código 1.118 - Compra de mercadoria pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem.' ) ;
INSERT_CFOP( '5122','Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos para serem industrializados em outro estabelecimento, '
                   +'por conta e ordem do adquirente, sem que os produtos tenham transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '5123','Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial '
                    +'no estabelecimento, remetidas para serem industrializadas em outro estabelecimento, por conta e ordem do adquirente, sem que as mercadorias tenham '
                    +'transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '5124','Industrialização efetuada para outra empresa','Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.' ) ;
INSERT_CFOP( '5125','Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria',
                    'Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, em que as mercadorias recebidas para utilização no processo '
                    +'de industrialização não tenham transitado pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.' ) ;
INSERT_CFOP( '5150','TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','' ) ;
INSERT_CFOP( '5151','Transferência de produção do estabelecimento','Transferência de produto industrializado ou produzido no estabelecimento para outro estabelecimento da mesma empresa. ' ) ;
INSERT_CFOP( '5152','Transferência de mercadoria adquirida ou recebida de terceiros',
                    'Mercadoria adquirida ou recebida de terceiros para industrialização, comercialização ou utilização na prestação de serviço e que não tenha sido '
                    +'objeto de qualquer processo industrial no estabelecimento, transferida para outro estabelecimento da mesma empresa. '
                    +'A partir  10 de julho de 2003. (Decreto nº 26.020/2003)' ) ;
INSERT_CFOP( '5153','Transferência de energia elétrica','Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da mesma empresa, para distribuição.' ) ;
INSERT_CFOP( '5155','Transferência de produção do estabelecimento, que não deva por ele transitar',
                    'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, '
                   +'de produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, depósito fechado ou outro, '
                   +'sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '5156','Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar',
                    'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, '
                    +'de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                    +'que não tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, depósito fechado ou outro, '
                    +'sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '5200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, PRODUÇÃO RURAL, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','' ) ;
INSERT_CFOP( '5201','Devolução de compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Devolução de mercadoria adquirida para ser utilizada em processo de industrialização ou produção rural, cuja entrada tenha sido classificada como "1.101 - Compra para industrialização ou produção rural".' ) ;
INSERT_CFOP( '5202','Devolução de compra para comercialização','Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como Compra para comercialização.' ) ;
INSERT_CFOP( '5205','Anulação de valor relativo a aquisição de serviço de comunicação','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.' ) ;
INSERT_CFOP( '5206','Anulação de valor relativo a aquisição de serviço de transporte','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.' ) ;
INSERT_CFOP( '5207','Anulação de valor relativo à compra de energia elétrica','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.' ) ;
INSERT_CFOP( '5208','Devolução de mercadoria recebida em transferência para industrialização ou produção rural ','Devolução de mercadoria recebida em transferência de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrialização ou produção rural. ' ) ;
INSERT_CFOP( '5209','Devolução de mercadoria recebida em transferência para comercialização','Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.' ) ;
INSERT_CFOP( '5210','Devolução de compra para utilização na prestação de serviço',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, '
                   +'cujas entradas tenham sido classificadas nos códigos “1.126 - Compra para utilização na prestação de serviço sujeita ao ICMS” e '
                   +'“1.128 - Compra para utilização na prestação de serviço sujeita ao ISSQN. (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010) efeitos a partir de '
                   +'1º de janeiro de 2011 – DECRETO 36.465/2011. Vejamais ' ) ;
INSERT_CFOP( '5250','VENDAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '5251','Venda de energia elétrica para distribuição ou comercialização','Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a cooperativas para distribuição aos seus cooperados.' ) ;
INSERT_CFOP( '5252','Venda de energia elétrica para estabelecimento industrial','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '5253','Venda de energia elétrica para estabelecimento comercial','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '5254','Venda de energia elétrica para estabelecimento prestador de serviço de transporte','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de transporte.' ) ;
INSERT_CFOP( '5255','Venda de energia elétrica para estabelecimento prestador de serviço de comunicação','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '5256','Venda de energia elétrica para estabelecimento de produtor rural','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '5257','Venda de energia elétrica para consumo por demanda contratada','Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.' ) ;
INSERT_CFOP( '5258','Venda de energia elétrica a não contribuinte','Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '5300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','' ) ;
INSERT_CFOP( '5301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '5302','Prestação de serviço de comunicação a estabelecimento industrial','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '5303','Prestação de serviço de comunicação a estabelecimento comercial','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '5304','Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de serviço de transporte.' ) ;
INSERT_CFOP( '5305','Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '5306','Prestação de serviço de comunicação a estabelecimento de produtor rural','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '5307','Prestação de serviço de comunicação a não contribuinte','Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '5350','PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE','' ) ;
INSERT_CFOP( '5351','Prestação de serviço de transporte para execução de serviço da mesma natureza','Classificam-se neste código as prestações de serviços de transporte destinados às prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '5352','Prestação de serviço de transporte a estabelecimento industrial','Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '5353','Prestação de serviço de transporte a estabelecimento comercial','Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '5354','Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação','Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '5355','Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '5356','Prestação de serviço de transporte a estabelecimento de produtor rural','Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '5357','Prestação de serviço de transporte a não contribuinte','Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '5359','Prestação de serviço de transporte a contribuinte ou a não-contribuinte, quando a mercadoria transportada esteja dispensada de emissão de Nota Fiscal  ',
                    'Prestação de serviço de transporte a contribuinte ou a não-contribuinte, quando não existir a obrigação legal de emissão de Nota Fiscal para a mercadoria '
                   +'transportada. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810, DE 10 DE JUNHO DE 2004) (a partir de 01.01.2005)' ) ;
INSERT_CFOP( '5360','Prestação de serviço de transporte a contribuinte-substituto em relação ao serviço de transporte (ACR) (Ajuste SINIEF 06/2007- Decreto nº 30.861/2007) – a partir de 01.01.2008','Prestação de serviço de transporte a contribuinte a quem tenha sido atribuída a condição de contribuinte-substituto em relação ao imposto incidente na prestação dos serviços.' ) ;
INSERT_CFOP( '5400','SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','' ) ;
INSERT_CFOP( '5401','Venda de produção do estabelecimento quando o produto esteja sujeito ao regime de substituição tributária',
                    'Venda de produto industrializado ou produzido pelo estabelecimento, quando o referido produto estiver sujeito ao regime de substituição tributária, '
                   +'bem como a de produto industrializado, por estabelecimento industrial ou produtor rural de cooperativa, sujeito ao regime de substituição tributária. ' ) ;
INSERT_CFOP( '5402','Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto','Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto' ) ;
INSERT_CFOP( '5403','Venda de mercadoria, adquirida ou recebida de terceiros, sujeita ao regime de substituição tributária, na condição de contribuinte-substituto','Venda de mercadoria, adquirida ou recebida de terceiros, sujeita ao regime de substituição tributária, na condição de contribuinte-substituto.' ) ;
INSERT_CFOP( '5405','Venda de mercadoria, adquirida ou recebida de terceiros, sujeita ao regime de substituição tributária, na condição de contribuinte-substituído','Venda de mercadoria, adquirida ou recebida de terceiros, sujeita ao regime de substituição tributária, na condição de contribuinte-substituído.' ) ;
INSERT_CFOP( '5408','Transferência de produção do estabelecimento quando o produto estiver sujeito ao regime de substituição tributária','Transferência de produto industrializado ou produzido no estabelecimento, para outro estabelecimento da mesma empresa, quando o produto estiver sujeito ao regime de substituição tributária. ' ) ;
INSERT_CFOP( '5409','Transferência de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, '
                   +'de mercadorias adquiridas ou recebidas de terceiros que não tenham sido objeto de qualquer processo industrial no estabelecimento, '
                   +'em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '5410','Devolução de compra para industrialização de mercadoria sujeita ao regime de substituição tributária','Devolução de mercadoria adquirida para ser utilizada em processo de industrialização ou produção rural, cuja entrada tenha sido classificada como "Compra para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária". ' ) ;
INSERT_CFOP( '5411','Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '5412','Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, '
                   +'cuja entrada tenha sido classificada no código 1.406 - Compra de bem para o ativo imobilizado cuja mercadoria está sujeita '
                   +'ao regime de substituição tributária.' ) ;
INSERT_CFOP( '5413','Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária.',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do estabelecimento, '
                   +'cuja entrada tenha sido classificada no código 1.407 - Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao '
                   +'regime de substituição tributária.' ) ;
INSERT_CFOP( '5414','Remessa de produção do estabelecimento para venda fora do estabelecimento, quando o produto estiver sujeito ao regime de substituição tributária','Remessa de produto industrializado ou produzido pelo estabelecimento para ser vendido fora do estabelecimento, inclusive por meio de veículo, quando o mencionado produto estiver sujeito ao regime de substituição tributária. ' ) ;
INSERT_CFOP( '5415','Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, em operação com mercadoria sujeita ao regime de substituição tributária','Classificam-se neste código as remessas de mercadorias adquiridas ou recebidas de terceiros para serem vendidas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '5450','SISTEMAS DE INTEGRAÇÃO','' ) ;
INSERT_CFOP( '5451','Remessa de animal e de insumo para estabelecimento produtor','Classificam-se neste código as saídas referentes à remessa de animais e de insumos para criação de animais no sistema integrado, tais como: pintos, leitões, rações e medicamentos.' ) ;
INSERT_CFOP( '5500','REMESSAS PARA FORMAÇÃO DE LOTE E COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES (NR Ajuste SINIEF 09/2005)','' ) ;
INSERT_CFOP( '5501','Remessa de produção do estabelecimento, com fim específico de exportação','Saída de produto industrializado ou produzido pelo estabelecimento, remetido com fim específico de exportação a "trading company", empresa comercial exportadora ou outro estabelecimento do remetente' ) ;
INSERT_CFOP( '5502','Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação','Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas com fim específico de exportação a trading company, empresa comercial exportadora ou outro estabelecimento do remetente.' ) ;
INSERT_CFOP( '5503','Devolução de mercadoria recebida com fim específico de exportação',
                    'Classificam-se neste código as devoluções efetuadas por trading company, empresa comercial exportadora ou outro estabelecimento do destinatário, '
                   +'de mercadorias recebidas com fim específico de exportação, cujas entradas tenham sido classificadas no código 1.501 - Entrada de mercadoria recebida com fim específico de exportação.' ) ;
INSERT_CFOP( '5504','Remessa de mercadoria para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento.','Remessa de mercadoria para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento. ' ) ;
INSERT_CFOP( '5505','Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação.','Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação. ' ) ;
INSERT_CFOP( '5550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '5551','Venda de bem do ativo imobilizado','Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.' ) ;
INSERT_CFOP( '5552','Transferência de bem do ativo imobilizado','Classificam-se neste código os bens do ativo imobilizado transferidos para outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '5553','Devolução de compra de bem para o ativo imobilizado','Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código 1.551 - Compra de bem para o ativo imobilizado.' ) ;
INSERT_CFOP( '5554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento','Classificam-se neste código as remessas de bens do ativo imobilizado para uso fora do estabelecimento.' ) ;
INSERT_CFOP( '5555','Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento',
                    'Classificam-se neste código as saídas em devolução, de bens do ativo imobilizado de terceiros, recebidos para uso no estabelecimento, '
                   +'cuja entrada tenha sido classificada no código 1.555 - Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento.' ) ;
INSERT_CFOP( '5556','Devolução de compra de material de uso ou consumo','Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código 1.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '5557','Transferência de material de uso ou consumo','Classificam-se neste código os materiais para uso ou consumo transferidos para outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '5600','CRÉDITOS E RESSARCIMENTOS DE ICMS','' ) ;
INSERT_CFOP( '5601','Transferência de crédito de ICMS acumulado','Classificam-se neste código os lançamentos destinados ao registro da transferência de créditos de ICMS para outras empresas.' ) ;
INSERT_CFOP( '5602','Transferência de saldo credor do ICMS, para outro estabelecimento da mesma empresa, destinado à compensação de saldo devedor do ICMS',
                    'Lançamento destinado ao registro da transferência de saldo credor do ICMS, para outro estabelecimento da mesma empresa, destinado à compensação do '
                   +'saldo devedor desse estabelecimento, inclusive no caso de apuração centralizada do imposto. (NR Ajuste SINIEF 09/2003 – a partir 01.01.2004)' ) ;
INSERT_CFOP( '5603','Ressarcimento de ICMS retido por substituição tributária','Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.' ) ;
INSERT_CFOP( '5605','Transferência de saldo devedor do ICMS de outro estabelecimento da mesma empresa  ','Lançamento destinado ao registro da transferência de saldo devedor do ICMS para outro estabelecimento da mesma empresa, para efetivação da apuração centralizada do imposto. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810/2004) (a partir de 01.01.2005)' ) ;
INSERT_CFOP( '5606','Utilização de saldo credor do ICMS para extinção por compensação de débitos fiscais',
                    'Lançamento destinado ao registro de utilização de saldo credor do ICMS em conta gráfica para extinção por compensação de débitos fiscais desvinculados de conta gráfica. '
                   +'(ACR Ajuste SINIEF 02/2005 – a partir de 01.01.2006). (DECRETO Nº 27.995 de 06.06.2005) a partir de 01.01.2006' ) ;
INSERT_CFOP( '5650','SAÍDAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTES ',' (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004) ( Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5651','Venda de combustível ou lubrificante de produção do estabelecimento destinados à industrialização subseqüente',
                    'Venda de combustível ou lubrificante, industrializados no estabelecimento e destinados à industrialização do próprio produto, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5652','Venda de combustível ou lubrificante, de produção do estabelecimento, destinados à comercialização',
                    'Venda de combustível ou lubrificante, industrializados no estabelecimento, destinados à comercialização, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5653','Venda de combustível ou lubrificante, de produção do estabelecimento, destinados a consumidor ou usuário final',
                    'Venda de combustível ou lubrificante, industrializados no estabelecimento, destinados a consumo em processo de industrialização de outro produto, '
                   +'à prestação de serviço ou a usuário final, inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5654','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à industrialização subseqüente',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à industrialização do próprio produto, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5655','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à comercialização',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à comercialização, '
                    +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                    +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5656','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados a consumidor ou usuário final',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados a consumo em processo de industrialização de outro produto, '
                    +'à prestação de serviço ou a usuário final, inclusive aquela decorrente de encomenda para entrega futura, '
                    +'cujo faturamento tenha sido classificado no código 5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".'
                    +'(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5657','Remessa de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para venda fora do estabelecimento','Remessa de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para ser vendidos fora do estabelecimento, inclusive por meio de veículos. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5658','Transferência de combustível ou lubrificante de produção do estabelecimento','Transferência de combustível ou lubrificante, industrializados no estabelecimento, para outro estabelecimento da mesma empresa. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5659','Transferência de combustível ou lubrificante adquiridos ou recebidos de terceiros','Transferência de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para outro estabelecimento da mesma empresa. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5660','Devolução de compra de combustível ou lubrificante adquiridos para industrialização subseqüente',
                    'Devolução de compra de combustível ou lubrificante, adquiridos para industrialização do próprio produto, cuja entrada tenha sido classificada '
                    +'como "Compra de combustível ou lubrificante para industrialização subseqüente".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5661','Devolução de compra de combustível ou lubrificante adquiridos para comercialização','Devolução de compra de combustível ou lubrificante, adquiridos para comercialização, cuja entrada tenha sido classificada como "Compra de combustível ou lubrificante para comercialização".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5662','Devolução de compra de combustível ou lubrificante adquiridos por consumidor ou usuário final',
                    'Devolução de compra de combustível ou lubrificante, adquiridos para consumo em processo de industrialização de outro produto, '
                    +'na prestação de serviço ou por usuário final, cuja entrada tenha sido classificada como '
                    +'"Compra de combustível ou lubrificante por consumidor ou usuário final".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5663','Remessa para armazenagem de combustível ou lubrificante','Remessa para armazenagem de combustível ou lubrificante. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5664','Retorno de combustível ou lubrificante recebidos para armazenagem','Remessa, em devolução, de combustível ou lubrificante, recebidos para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5665','Retorno simbólico de combustível ou lubrificante recebidos para armazenagem',
                     'Retorno simbólico de combustível ou lubrificante, recebidos para armazenagem, quando a mercadoria armazenada tenha sido objeto de saída, '
                     +'a qualquer título, e não deva retornar ao estabelecimento depositante. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5666','Remessa, por conta e ordem de terceiros, de combustível ou lubrificante recebidos para armazenagem','Saída, por conta e ordem de terceiros, de combustível ou lubrificante, recebidos anteriormente para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '5667','Venda de combustível ou lubrificante a consumidor ou usuário final estabelecido em outra Unidade da Federação',
                    'Venda de combustível ou lubrificante a consumidor ou a usuário final estabelecido em outra Unidade da Federação, '
                   +'cujo abastecimento tenha sido efetuado na unidade da Federação do remetente. ACR Ajuste SINIEF 05/2009 – a partir de 01.07.2009)(Decreto nº 34.490/2009)' ) ;
INSERT_CFOP( '5900','OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '5901','Remessa para industrialização por encomenda','Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '5902','Retorno de mercadoria utilizada na industrialização por encomenda',
                    'Classificam-se neste código as remessas, pelo estabelecimento industrializador, '
                    +'dos insumos recebidos para industrialização e incorporados ao produto final, '
                    +'por encomenda de outra empresa ou de outro estabelecimento da mesma empresa. '
                    +'O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.' ) ;
INSERT_CFOP( '5903','Retorno de mercadoria recebida para industrialização e não aplicada no referido processo','Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e não aplicados no referido processo.' ) ;
INSERT_CFOP( '5904','Remessa para venda fora do estabelecimento','Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive por meio de veículos.' ) ;
INSERT_CFOP( '5905','Remessa para depósito fechado ou armazém geral','Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '5906','Retorno de mercadoria depositada em depósito fechado ou armazém geral','Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém geral ao estabelecimento depositante.' ) ;
INSERT_CFOP( '5907','Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral',
                     'Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em depósito fechado ou armazém geral, '
                     +'quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não devam retornar ao estabelecimento depositante.' ) ;
INSERT_CFOP( '5908','Remessa de bem por conta de contrato de comodato','Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.' ) ;
INSERT_CFOP( '5909','Retorno de bem recebido por conta de contrato de comodato','Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.' ) ;
INSERT_CFOP( '5910','Remessa em bonificação, doação ou brinde','Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.' ) ;
INSERT_CFOP( '5911','Remessa de amostra grátis','Classificam-se neste código as remessas de mercadorias a título de amostra grátis.' ) ;
INSERT_CFOP( '5912','Remessa de mercadoria ou bem para demonstração','Classificam-se neste código as remessas de mercadorias ou bens para demonstração.' ) ;
INSERT_CFOP( '5913','Retorno de mercadoria ou bem recebido para demonstração','Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para demonstração.' ) ;
INSERT_CFOP( '5914','Remessa de mercadoria ou bem para exposição ou feira','Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.' ) ;
INSERT_CFOP( '5915','Remessa de mercadoria ou bem para conserto ou reparo','Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.' ) ;
INSERT_CFOP( '5916','Retorno de mercadoria ou bem recebido para conserto ou reparo','Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto ou reparo.' ) ;
INSERT_CFOP( '5917','Remessa de mercadoria em consignação mercantil ou industrial','Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '5918','Devolução de mercadoria recebida em consignação mercantil ou industrial','Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '5919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial','Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '5920','Remessa de vasilhame ou sacaria','Classificam-se neste código as remessas de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '5921','Devolução de vasilhame ou sacaria','Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '5922','Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura','Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de venda para entrega futura.' ) ;
INSERT_CFOP( '5923','Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem ou em operações com armazém geral ou depósito fechado. (NR AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009)Vejamais  efeitos a partir de 1º de julho de 2010– DECRETO 37.993/2012.',
                    'Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de terceiros, em vendas à ordem, '
                    +'cuja venda ao adquirente originário foi classificada nos códigos “5.118 - Venda de produção do estabelecimento entregue ao destinatário '
                    +'por conta e ordem do adquirente originário, em venda à ordem” ou “5.119 - Venda de mercadoria adquirida ou recebida de terceiros entregue '
                    +'ao destinatário por conta e ordem do adquirente originário, em venda à ordem”.' ) ;
INSERT_CFOP( '5924','Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, para serem industrializados por conta e ordem do adquirente, '
                    +'nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.' ) ;
INSERT_CFOP( '5925','Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos, por conta e ordem do adquirente, '
                    +'para industrialização e incorporados ao produto final, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. '
                    +'O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.' ) ;
INSERT_CFOP( '5926','Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação','Classificam-se neste código os registros efetuados a título de reclassificação decorrente de formação de kit de mercadorias ou de sua desagregação.' ) ;
INSERT_CFOP( '5927','Lançamento efetuado a título de baixa de estoque decorrente de perda, roubo ou deterioração','Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente de perda, roubou ou deterioração das mercadorias.' ) ;
INSERT_CFOP( '5928','Lançamento efetuado a título de baixa de estoque decorrente do encerramento da atividade da empresa','Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente do encerramento das atividades da empresa.' ) ;
INSERT_CFOP( '5929','Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal - ECF','Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal - ECF.' ) ;
INSERT_CFOP( '5931','Lançamento efetuado em decorrência da responsabilidade de retenção do imposto por substituição tributária, '
                   +'atribuída ao remetente ou alienante da mercadoria, pelo serviço de transporte realizado por transportador autônomo ou por '
                   +'transportador não inscrito na unidade da Federação onde iniciado o serviço',
                     'Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da mercadoria quando lhe for atribuída a '
                   +'responsabilidade pelo recolhimento do imposto devido pelo serviço de transporte realizado por transportador autônomo ou por transportador'
                   +'não inscrito na unidade da Federação onde iniciado o serviço.' ) ;
INSERT_CFOP( '5932','Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador','Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.' ) ;
INSERT_CFOP( '5933','Prestação de serviço tributado pelo Imposto Sobre Serviços de Qualquer Natureza','Prestação de serviço, cujo imposto é de competência municipal, desde que informado em Nota Fiscal modelo 1 ou 1-A. (NR Ajuste SINIEF 06/2005)a partir de 01/01/2006' ) ;
INSERT_CFOP( '5934','Remessa simbólica de mercadoria depositada em armazém geral ou depósito fechado. (AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009) – DECRETO 36.465/2011.',
                    'Classificam-se neste código as remessas simbólicas de mercadorias depositadas em depósito fechado ou armazém geral, '
                    +'efetuadas nas situações em que haja a transmissão de propriedade com a permanência das mercadorias em depósito ou quando a mercadoria tenha sido '
                    +'entregue pelo remetente diretamente a depósito fechado ou armazém geral. (AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009) – DECRETO 36.465/2011.' ) ;
INSERT_CFOP( '5949','Outra saída de mercadoria ou prestação de serviço não especificado','Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.' ) ;
end ;

procedure TInitCFOP.Execute_6000 ;
begin

INSERT_CFOP( '6000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA OUTROS ESTADOS','Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja localizado em unidade da Federação diversa daquela do destinatário' ) ;
INSERT_CFOP( '6101','Venda de produção do estabelecimento','Venda de produto industrializado ou produzido pelo estabelecimento, bem como a de mercadoria por estabelecimento industrial ou produtor rural de cooperativa destinada a seus cooperados ou a estabelecimento de outra cooperativa. ' ) ;
INSERT_CFOP( '6102','Venda de mercadoria adquirida ou recebida de terceiros',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                   +'que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de '
                   +'mercadorias por estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra cooperativa.' ) ;
INSERT_CFOP( '6103','Venda de produção do estabelecimento, efetuada fora do estabelecimento','venda efetuada fora do estabelecimento, inclusive por meio de veículo, de produto industrializado no estabelecimento. ' ) ;
INSERT_CFOP( '6104','Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento','venda efetuada fora do estabelecimento, inclusive por meio de veículo, de mercadoria adquirida ou recebida de terceiro para industrialização ou comercialização, que não tenha sido objeto de qualquer processo industrial no estabelecimento.' ) ;
INSERT_CFOP( '6105','Venda de produção do estabelecimento que não deva por ele transitar','Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '6106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar',
                    'Vendas de mercadoria adquirida ou recebida de terceiro para industrialização ou comercialização, '
                    +'armazenada em depósito fechado, armazém geral ou outro, que não tenha sido objeto de qualquer processo industrial no estabelecimento '
                    +'sem que haja retorno ao estabelecimento depositante. Bem como venda de mercadoria importada, cuja saída ocorra do recinto alfandegado ou '
                    +'da repartição alfandegária onde se processou o desembaraço aduaneiro, com destino ao estabelecimento do comprador, '
                    +'sem que tenha transitado pelo estabelecimento do importador.' ) ;
INSERT_CFOP( '6107','Venda de produção do estabelecimento, destinada a não contribuinte','Vendas de produto industrializado no estabelecimento, ou produzido no estabelecimento do produtor rural, destinada a não contribuinte, bem como qualquer operação de venda destinada a não contribuinte' ) ;
INSERT_CFOP( '6108','Venda de mercadoria adquirida ou recebida de terceiros, destinada a não contribuinte',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                    +'que não tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas a não contribuintes. '
                    +'Quaisquer operações de venda destinadas a não contribuintes deverão ser classificadas neste código.' ) ;
INSERT_CFOP( '6109','Venda de produção do estabelecimento destinada à Zona Franca de Manaus ou Áreas de Livre Comércio','Venda de produto industrializado ou produzido pelo estabelecimento destinado à Zona Franca de Manaus ou Áreas de Livre Comércio.' ) ;
INSERT_CFOP( '6110','Venda de mercadoria, adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio, '
                    +'de que trata o Anexo do Convênio SINIEF s/n, de 15 de dezembro de 1970, que dispõe sobre o Sistema Nacional Integrado '
                    +'de Informações Econômico-Fiscais (Decreto nº 26.955/2004) RETROAGINDO SEUS EFEITOS A 24.06.2004',
                    'Venda de mercadoria, adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio, '
                    +'desde que alcançada pelos benefícios fiscais de que tratam o Decreto-Lei nº 288, de 28 de fevereiro de 1967, '
                    +'o Convênio ICM 65/88, de 06 de dezembro de 1988, o Convênio ICMS 36/97, de 23 de maio de 1997, '
                    +'e o Convênio ICMS 37/97, de 23 de maio de 1997. (NR Ajuste SINIEF 09/2004) (Decreto nº 26.955/2004) RETROAGINDO SEUS EFEITOS A 24.06.2004' ) ;
INSERT_CFOP( '6111','Venda de produção do estabelecimento remetida anteriormente em consignação industrial','Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '6112','Venda de mercadoria adquirida ou recebida de Terceiros remetida anteriormente em consignação industrial','Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação industrial.' ) ;
INSERT_CFOP( '6113','Venda de produção do estabelecimento remetida anteriormente em consignação mercantil','Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento remetidos anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '6114','Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil','Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '6115','Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil','Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas anteriormente a título de consignação mercantil.' ) ;
INSERT_CFOP( '6116','Venda de produção do estabelecimento originada de encomenda para entrega futura','Venda de produto industrializado ou produzido pelo estabelecimento, quando da saída real do produto, cujo faturamento tenha sido classificado no código "5.922 – Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura". ' ) ;
INSERT_CFOP( '6117','Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer '
                    +'processo industrial no estabelecimento, quando da saída real da mercadoria, cujo faturamento tenha sido classificado no código '
                    +'6.922 - Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura.' ) ;
INSERT_CFOP( '6118','Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.' ) ;
INSERT_CFOP( '6119','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem','Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao destinatário por conta e ordem do adquirente originário.' ) ;
INSERT_CFOP( '6120','Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem',
                    'Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, que não tenham sido objeto de qualquer '
                   +'processo industrial no estabelecimento, entregues pelo vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, '
                   +'no código 2.118 - Compra de mercadoria pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem.' ) ;
INSERT_CFOP( '6122','Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos para serem industrializados em outro estabelecimento, '
                   +'por conta e ordem do adquirente, sem que os produtos tenham transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '6123','Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, '
                   +'que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas para serem industrializadas em outro estabelecimento, '
                   +'por conta e ordem do adquirente, sem que as mercadorias tenham transitado pelo estabelecimento do adquirente.' ) ;
INSERT_CFOP( '6124','Industrialização efetuada para outra empresa','Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.' ) ;
INSERT_CFOP( '6125','Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria',
                    'Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, '
                    +'em que as mercadorias recebidas para utilização no processo de industrialização não tenham transitado pelo estabelecimento do adquirente das mercadorias, '
                    +'compreendendo os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.' ) ;
INSERT_CFOP( '6150','TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','' ) ;
INSERT_CFOP( '6151','Transferência de produção do estabelecimento','Produtos industrializado ou produzido no estabelecimento e transferido para outro estabelecimento da mesma empresa. ' ) ;
INSERT_CFOP( '6152','Transferência de mercadoria adquirida ou recebida de terceiros',
                    'Mercadoria adquirida ou recebida de terceiros para industrialização, '
                    +'comercialização ou utilização na prestação de serviço e que não tenha sido objeto de qualquer processo industrial no estabelecimento, '
                    +'transferida para outro estabelecimento da mesma empresa. A partir  10 de julho de 2003. (Decreto nº 26.020/2003)' ) ;
INSERT_CFOP( '6153','Transferência de energia elétrica','Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da mesma empresa, para distribuição.' ) ;
INSERT_CFOP( '6155','Transferência de produção do estabelecimento, que não deva por ele transitar',
                     'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, '
                    +'de produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, '
                    +'depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '6156','Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar',
                     'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, '
                     +'de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                     +'que não tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, '
                     +'depósito fechado ou outro, sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '6200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES','' ) ;
INSERT_CFOP( '6201','Devolução de compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Devolução de mercadoria adquirida para ser utilizada em processo de industrialização ou produção rural, cuja entrada tenha sido classificada como "1.101 - Compra para industrialização ou produção rural".' ) ;
INSERT_CFOP( '6202','Devolução de compra para comercialização','Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como Compra para comercialização.' ) ;
INSERT_CFOP( '6205','Anulação de valor relativo a aquisição de serviço de comunicação','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.' ) ;
INSERT_CFOP( '6206','Anulação de valor relativo a aquisição de serviço de transporte','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.' ) ;
INSERT_CFOP( '6207','Anulação de valor relativo à compra de energia elétrica','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.' ) ;
INSERT_CFOP( '6208','Devolução de mercadoria recebida em transferência para industrialização ou produção rural ','Devolução de mercadoria recebida em transferência de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrialização ou produção rural. ' ) ;
INSERT_CFOP( '6209','Devolução de mercadoria recebida em transferência para comercialização','Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro estabelecimento da mesma empresa, para serem comercializadas.' ) ;
INSERT_CFOP( '6210','Devolução de compra para utilização na prestação de serviço',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, '
                    +'cujas entradas tenham sido classificadas nos códigos “2.126 - Compra para utilização na prestação de serviço sujeita ao ICMS” '
                    +'e “2.128 Compra para utilização na prestação de serviço sujeita ao ISSQN” (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010). '
                    +'Vejamais  efeitos a partir de 1º de janeiro de 2011– DECRETO 36.465/2011.' ) ;
INSERT_CFOP( '6250','VENDAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '6251','Venda de energia elétrica para distribuição ou comercialização','Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a cooperativas para distribuição aos seus cooperados.' ) ;
INSERT_CFOP( '6252','Venda de energia elétrica para estabelecimento industrial','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '6253','Venda de energia elétrica para estabelecimento comercial','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '6254','Venda de energia elétrica para estabelecimento prestador de serviço de transporte','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de transporte.' ) ;
INSERT_CFOP( '6255','Venda de energia elétrica para estabelecimento prestador de serviço de comunicação','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '6256','Venda de energia elétrica para estabelecimento de produtor rural','Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '6257','Venda de energia elétrica para consumo por demanda contratada','Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que prevalecerá sobre os demais códigos deste subgrupo.' ) ;
INSERT_CFOP( '6258','Venda de energia elétrica a não contribuinte','Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '6300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO',' Início' ) ;
INSERT_CFOP( '6301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '6302','Prestação de serviço de comunicação a estabelecimento industrial','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '6303','Prestação de serviço de comunicação a estabelecimento comercial','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. Também serão classificados neste código os serviços de comunicação prestados a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '6304','Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de serviço de transporte.' ) ;
INSERT_CFOP( '6305','Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '6306','Prestação de serviço de comunicação a estabelecimento de produtor rural','Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '6307','Prestação de serviço de comunicação a não contribuinte','Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '6350','PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE','' ) ;
INSERT_CFOP( '6351','Prestação de serviço de transporte para execução de serviço da mesma natureza','Classificam-se neste código as prestações de serviços de transporte destinados às prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '6352','Prestação de serviço de transporte a estabelecimento industrial','Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento industrial de cooperativa.' ) ;
INSERT_CFOP( '6353','Prestação de serviço de transporte a estabelecimento comercial','Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. Também serão classificados neste código os serviços de transporte prestados a estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '6354','Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação','Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de serviços de comunicação.' ) ;
INSERT_CFOP( '6355','Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica','Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica.' ) ;
INSERT_CFOP( '6356','Prestação de serviço de transporte a estabelecimento de produtor rural','Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor rural.' ) ;
INSERT_CFOP( '6357','Prestação de serviço de transporte a não contribuinte','Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas jurídicas não indicadas nos códigos anteriores.' ) ;
INSERT_CFOP( '6359','Prestação de serviço de transporte a contribuinte ou a não-contribuinte, quando a mercadoria transportada esteja dispensada de emissão de Nota Fiscal  ','Prestação de serviço de transporte a contribuinte ou a não-contribuinte, quando não existir a obrigação legal de emissão de Nota Fiscal para a mercadoria transportada. (ACR Ajuste SINIEF 03/2004) (DECRETO Nº 26.810/2004) (a partir de 01.01.2005)' ) ;
INSERT_CFOP( '6360','Prestação de serviço de transporte a contribuinte substituto em relação ao serviço de transporte  ',
                    'Prestação de serviço de transporte a contribuinte a quem tenha sido atribuída a condição de contribuinte-substituto em relação '
                    +'ao imposto incidente na prestação dos serviços. (Ajuste SINIEF 03/2008) (Decreto nº 32.653, de 14.11.2008) a partir de 01.05.2008' ) ;
INSERT_CFOP( '6400','SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA','' ) ;
INSERT_CFOP( '6401','Venda de produção do estabelecimento quando o produto estiver sujeito ao regime de substituição tributária',
                    'Venda de produto industrializado ou produzido no estabelecimento, quando o produto estiver sujeito ao regime de substituição tributária, '
                   +'bem como a venda de produto industrializado por estabelecimento industrial ou rural de cooperativa, quando o produto estiver sujeito ao referido regime.' ) ;
INSERT_CFOP( '6402','Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto','Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto.' ) ;
INSERT_CFOP( '6403','Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituto','Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, na condição de contribuinte substituto, em operação com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6404','Venda de mercadoria sujeita ao regime de substituição tributária, cujo imposto já tenha sido retido anteriormente','Classificam-se neste código as vendas de mercadorias sujeitas ao regime de substituição tributária, na condição de substituto tributário, exclusivamente nas hipóteses em que o imposto já tenha sido retido anteriormente.' ) ;
INSERT_CFOP( '6408','Transferência de produção do estabelecimento quando o produto estiver sujeito ao regime de substituição tributária','Transferência de produto industrializado ou produzido no estabelecimento, para outro estabelecimento da mesma empresa, quando o produto estiver sujeito ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6409','Transferência de mercadoria adquirida ou recebida de terceiros, sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de mercadorias adquiridas ou recebidas de terceiros '
                    +'que não tenham sido objeto de qualquer processo industrial no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6410','Devolução de compra para industrialização ou ptrodução rural quando a mercadoria sujeita ao regime de substituição tributária','Devolução de mercadoria adquirida para ser utilizada em processo de industrialização ou produção rural, cuja entrada tenha sido classificada como "Compra para industrialização ou produção rural de mercadoria sujeita ao regime de substituição tributária". ' ) ;
INSERT_CFOP( '6411','Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária','Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6412','Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, '
                    +'cuja entrada tenha sido classificada no código 2.406 - Compra de bem para o ativo imobilizado cuja mercadoria está '
                    +'sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6413','Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do estabelecimento, cuja entrada tenha sido classificada '
                   +'no código 2.407 - Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6414','Remessa de produção do estabelecimento para venda fora do estabelecimento, quando o produto estiver sujeito ao regime de substituição tributária','Remessa de produto industrializado ou produzido pelo estabelecimento para ser vendido fora do estabelecimento, inclusive por meio de veículo, quando o mencionado produto estiver sujeito ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6415','Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, quando a referida ração com mercadoria sujeita ao regime de substituição tributária','Remessa de mercadoria adquirida ou recebida de terceiro para serem vendida fora do estabelecimento, inclusive por meio de veículo, quando a referida mercadorias estiver sujeita ao regime de substituição tributária.' ) ;
INSERT_CFOP( '6500','REMESSAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES','' ) ;
INSERT_CFOP( '6501','Remessa de produção do estabelecimento, com fim específico de exportação','Saída de produto industrializado ou produzido pelo estabelecimento, remetido com fim específico de exportação a "trading company", empresa comercial exportadora ou outro estabelecimento do remetente. ' ) ;
INSERT_CFOP( '6502','Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação','Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas com fim específico de exportação a trading company, empresa comercial exportadora ou outro estabelecimento do remetente.' ) ;
INSERT_CFOP( '6503','Devolução de mercadoria recebida com fim específico de exportação',
                    'Classificam-se neste código as devoluções efetuadas por trading company, empresa comercial exportadora ou outro estabelecimento do destinatário, '
                    +'de mercadorias recebidas com fim específico de exportação, cujas entradas tenham sido classificadas no código '
                    +'2.501 - Entrada de mercadoria recebida com fim específico de exportação.' ) ;
INSERT_CFOP( '6504','Remessa de mercadoria para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento.','Remessa de mercadoria para formação de lote de exportação, de produto industrializado ou produzido pelo próprio estabelecimento. ' ) ;
INSERT_CFOP( '6505','Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação.','Remessa de mercadoria, adquirida ou recebida de terceiros, para formação de lote de exportação. ' ) ;
INSERT_CFOP( '6550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '6551','Venda de bem do ativo imobilizado','Vendas de bem integrante do ativo imobilizado do estabelecimento. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6552','Transferência de bem do ativo imobilizado','Transferência de bem do ativo imobilizado para outro estabelecimento da mesma empresa. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6553','Devolução de compra de bem para o ativo imobilizado','Devolução de bem adquirido para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código 2.551 - Compra de bem para o ativo imobilizado. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6554','Remessa de bem do ativo imobilizado para uso fora do estabelecimento','Remessa de bem do ativo imobilizado para uso fora do estabelecimento. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6555','Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento',
                    'Saída em devolução, de bem do ativo imobilizado de terceiros, recebidos para uso no estabelecimento, cuja entrada tenha sido classificada no código '
                    +'2.555 - Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6556','Devolução de compra de material de uso ou consumo','Devolução de mercadoria destinada ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código 2.556 - compra de material para uso ou consumo –a partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6557','Transferência de material de uso ou consumo','Transferência de material de uso ou consumo para outro estabelecimento da mesma empresa. –a  partir 01.01.2004-  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6600','CRÉDITOS E RESSARCIMENTOS DE ICMS','' ) ;
INSERT_CFOP( '6603','Ressarcimento de ICMS retido por substituição tributária','Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas hipóteses previstas na legislação aplicável.' ) ;
INSERT_CFOP( '6650','SAÍDAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTE ',' (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004) –  Decreto Nº 26.174 de 26/11/2003' ) ;
INSERT_CFOP( '6651','Venda de combustível ou lubrificante, de produção do estabelecimento, destinados à industrialização subseqüente',
                     'Venda de combustível ou lubrificante, industrializados no estabelecimento e destinados à industrialização do próprio produto, '
                     +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                     +'6.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6652','Venda de combustível ou lubrificante, de produção do estabelecimento, destinados à comercialização',
                    'Venda de combustível ou lubrificante, industrializados no estabelecimento e destinados à comercialização, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'6.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6653','Venda de combustível ou lubrificante, de produção do estabelecimento, destinados a consumidor ou usuário final ',
                    'Venda de combustível ou lubrificante, industrializados no estabelecimento e destinados a consumo em processo de industrialização de outro produto, '
                   +'à prestação de serviço ou a usuário final, inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no '
                   +'código 6.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".'
                   +'(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6654','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à industrialização subseqüente ',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à industrialização do próprio produto, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6655','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à comercialização',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados à comercialização, '
                   +'inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado no código '
                   +'5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6656','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados a consumidor ou usuário final',
                    'Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados a consumo em processo de industrialização de outro produto, '
                   +'à prestação de serviço ou a usuário final, inclusive aquela decorrente de encomenda para entrega futura, cujo faturamento tenha sido classificado '
                   +'no código 5.922 – "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6657','Remessa de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para venda fora do estabelecimento','Remessa de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para ser vendidos fora do estabelecimento, inclusive por meio de veículos. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6658','Transferência de combustível ou lubrificante de produção do estabelecimento','Transferência de combustível ou lubrificante, industrializados no estabelecimento, para outro estabelecimento da mesma empresa. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6659','Transferência de combustível ou lubrificante adquiridos ou recebidos de terceiros','Transferência de combustível ou lubrificante, adquiridos ou recebidos de terceiros, para outro estabelecimento da mesma empresa. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6660','Devolução de compra de combustível ou lubrificante adquiridos para industrialização subseqüente',
                    'Devolução de compra de combustível ou lubrificante, adquiridos para industrialização do próprio produto, '
                    +'cuja entrada tenha sido classificada como "Compra de combustível ou lubrificante para industrialização subseqüente".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6661','Devolução de compra de combustível ou lubrificante adquiridos para comercialização','Devolução de compra de combustível ou lubrificante, adquiridos para comercialização, cuja entrada tenha sido classificada como "Compra de combustível ou lubrificante para comercialização".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6662','Devolução de compra de combustível ou lubrificante adquiridos por consumidor ou usuário final',
                    'Devolução de compra de combustível ou lubrificante, adquiridos para consumo em processo de industrialização de outro produto, '
                   +'na prestação de serviço ou por usuário final, cuja entrada tenha sido classificada como "Compra de combustível ou lubrificante por consumidor ou usuário final".(a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6663','Remessa para armazenagem de combustível ou lubrificante','Remessa para armazenagem de combustível ou lubrificante. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6664','Retorno de combustível ou lubrificante recebidos para armazenagem','Remessa, em devolução, de combustível ou lubrificante, recebidos para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6665','Retorno simbólico de combustível ou lubrificante recebidos para armazenagem',
                    'Retorno simbólico de combustível ou lubrificante, recebidos para armazenagem, '
                    +'quando a mercadoria armazenada tenha sido objeto de saída, a qualquer título, e não deva retornar ao estabelecimento depositante. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6666','Remessa, por conta e ordem de terceiros, de combustível ou lubrificante recebidos para armazenagem','Saída, por conta e ordem de terceiros, de combustível ou lubrificante, recebidos anteriormente para armazenagem. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '6667','Venda de combustível ou lubrificante a consumidor ou usuário final estabelecido em outra Unidade da Federação diferente da que ocorrer o consumo','Venda de combustível ou lubrificante a consumidor ou a usuário final, cujo abastecimento tenha sido efetuado em Unidade da Federação diferente do remetente e do destinatário. ACR Ajuste SINIEF 05/2009 – a partir de 01.07.2009)(Decreto nº 34.490/2009)' ) ;
INSERT_CFOP( '6900','OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '6901','Remessa para industrialização por encomenda','Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.' ) ;
INSERT_CFOP( '6902','Retorno de mercadoria utilizada na industrialização por encomenda',
                    'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos para industrialização e incorporados ao produto final, '
                    +'por encomenda de outra empresa ou de outro estabelecimento da mesma empresa. O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.' ) ;
INSERT_CFOP( '6903','Retorno de mercadoria recebida para industrialização e não aplicada no referido processo','Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e não aplicados no referido processo.' ) ;
INSERT_CFOP( '6904','Remessa para venda fora do estabelecimento','Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive por meio de veículos.' ) ;
INSERT_CFOP( '6905','Remessa para depósito fechado ou armazém geral','Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém geral.' ) ;
INSERT_CFOP( '6906','Retorno de mercadoria depositada em depósito fechado ou armazém geral','Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém geral ao estabelecimento depositante.' ) ;
INSERT_CFOP( '6907','Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral',
                    'Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em depósito fechado ou armazém geral, '
                   +'quando as mercadorias depositadas tenham sido objeto de saída a qualquer título e que não devam retornar ao estabelecimento depositante.' ) ;
INSERT_CFOP( '6908','Remessa de bem por conta de contrato de comodato','Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.' ) ;
INSERT_CFOP( '6909','Retorno de bem recebido por conta de contrato de comodato','Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.' ) ;
INSERT_CFOP( '6910','Remessa em bonificação, doação ou brinde','Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.' ) ;
INSERT_CFOP( '6911','Remessa de amostra grátis','Classificam-se neste código as remessas de mercadorias a título de amostra grátis.' ) ;
INSERT_CFOP( '6912','Remessa de mercadoria ou bem para demonstração','Classificam-se neste código as remessas de mercadorias ou bens para demonstração.' ) ;
INSERT_CFOP( '6913','Retorno de mercadoria ou bem recebido para demonstração','Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para demonstração.' ) ;
INSERT_CFOP( '6914','Remessa de mercadoria ou bem para exposição ou feira','Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.' ) ;
INSERT_CFOP( '6915','Remessa de mercadoria ou bem para conserto ou reparo','Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.' ) ;
INSERT_CFOP( '6916','Retorno de mercadoria ou bem recebido para conserto ou reparo','Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto ou reparo.' ) ;
INSERT_CFOP( '6917','Remessa de mercadoria em consignação mercantil ou industrial','Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '6918','Devolução de mercadoria recebida em consignação mercantil ou industrial','Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '6919','Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial','Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou industrial.' ) ;
INSERT_CFOP( '6920','Remessa de vasilhame ou sacaria','Classificam-se neste código as remessas de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '6921','Devolução de vasilhame ou sacaria','Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.' ) ;
INSERT_CFOP( '6922','Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura','Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de venda para entrega futura.' ) ;
INSERT_CFOP( '6923','Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem ou em operações com armazém geral ou depósito fechado Vejamais (NR AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009) efeitos a partir de 1º de julho de 2010– DECRETO 36.465/2011.',
                    'Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de terceiros, '
                    +'em vendas à ordem, cuja venda ao adquirente originário foi classificada nos códigos '
                    +'“6.118 - Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, '
                    +'em venda à ordem” ou “6.119 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, '
                    +'em venda à ordem”. ' ) ;
INSERT_CFOP( '6924','Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, para serem industrializados por conta e ordem do adquirente, '
                   +'nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente dos mesmos.' ) ;
INSERT_CFOP( '6925','Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente',
                    'Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos recebidos, '
                    +'por conta e ordem do adquirente, para industrialização e incorporados ao produto final, '
                    +'nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. '
                    +'O valor dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.' ) ;
INSERT_CFOP( '6929','Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal - ECF','Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal - ECF.' ) ;
INSERT_CFOP( '6931','Lançamento efetuado em decorrência da responsabilidade de retenção do imposto por substituição tributária, '
                   +'atribuída ao remetente ou alienante da mercadoria, pelo serviço de transporte realizado por transportador autônomo '
                   +'ou por transportador não inscrito na unidade da Federação onde iniciado o serviço',
                   'Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da mercadoria quando lhe for atribuída '
                   +'a responsabilidade pelo recolhimento do imposto devido pelo serviço de transporte realizado por transportador autônomo '
                   +'ou por transportador não inscrito na unidade da Federação onde iniciado o serviço.' ) ;
INSERT_CFOP( '6932','Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador','Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.' ) ;
INSERT_CFOP( '6933','Prestação de serviço tributado pelo Imposto Sobre Serviços de Qualquer Natureza ','Prestação de serviço, cujo imposto   é de competência municipal, desde que informado em nota fiscal modelo 1 ou 1-A. (ACR Ajuste SINIEF 03/2004 e Ajuste SINIEF 06/2005) (DECRETO Nº 26.868/2006)' ) ;
INSERT_CFOP( '6934','Remessa simbólica de mercadoria depositada em armazém geral ou depósito fechado- (ACR AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009) efeitos a partir de 1º de julho de 2010 – DECRETO 36.465/2011.',
                    'Remessa simbólica de mercadoria depositada em depósito fechado ou armazém geral, '
                   +'efetuada nas situações em que haja a transmissão de propriedade com a permanência da mercadoria em depósito ou quando a mercadoria tenha '
                   +'sido entregue pelo remetente diretamente a depósito fechado ou armazém geral. (ACR AJUSTE SINIEF 14, DE 11 DE DEZEMBRO DE 2009) '
                   +'efeitos a partir de 1º de julho de 2010– DECRETO 36.465/2011.' ) ;
INSERT_CFOP( '6949','Outra saída de mercadoria ou prestação de serviço não especificado','Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.' ) ;
end ;

procedure TInitCFOP.Execute_7000 ;
begin

INSERT_CFOP( '7000','SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O EXTERIOR','Classificam-se, neste grupo, as operações ou prestações em que o destinatário esteja localizado em outro país' ) ;
INSERT_CFOP( '7100','VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS','' ) ;
INSERT_CFOP( '7101','Venda de produção do estabelecimento','Venda de produto industrializado ou produzido pelo estabelecimento, bem como a de mercadoria por estabelecimento industrial ou produtor rural de cooperativa destinada a seus cooperados ou a estabelecimento de outra cooperativa. ' ) ;
INSERT_CFOP( '7102','Venda de mercadoria adquirida ou recebida de terceiros',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                   +'que não tenham sido objeto de qualquer processo industrial no estabelecimento. Também serão classificadas neste código as vendas de mercadorias por estabelecimento comercial de cooperativa.' ) ;
INSERT_CFOP( '7105','Venda de produção do estabelecimento, que não deva por ele transitar','Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.' ) ;
INSERT_CFOP( '7106','Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar',
                    'Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, '
                   +'armazenadas em depósito fechado, armazém geral ou outro, que não tenham sido objeto de qualquer processo industrial no estabelecimento '
                   +'sem que haja retorno ao estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias importadas, '
                   +'cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou o desembaraço aduaneiro, com destino ao '
                   +'estabelecimento do comprador, sem transitar pelo estabelecimento do importador.' ) ;
INSERT_CFOP( '7127','Venda de produção do estabelecimento sob o regime de drawback ','Classificam-se neste código as vendas de produtos industrializados no estabelecimento sob o regime de drawback , cujas compras foram classificadas no código 3.127 - Compra para industrialização sob o regime de drawback.' ) ;
INSERT_CFOP( '7200','DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES','' ) ;
INSERT_CFOP( '7201','Devolução de compra para industrialização ou produção rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)','Devolução de mercadoria adquirida para ser utilizada em processo de industrialização ou produção rural, cuja entrada tenha sido classificada como "1.101 - Compra para industrialização ou produção rural".' ) ;
INSERT_CFOP( '7202','Devolução de compra para comercialização','Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, cujas entradas tenham sido classificadas como Compra para comercialização.' ) ;
INSERT_CFOP( '7205','Anulação de valor relativo à aquisição de serviço de comunicação','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de comunicação.' ) ;
INSERT_CFOP( '7206','Anulação de valor relativo a aquisição de serviço de transporte','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes das aquisições de serviços de transporte.' ) ;
INSERT_CFOP( '7207','Anulação de valor relativo à compra de energia elétrica','Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, decorrentes da compra de energia elétrica.' ) ;
INSERT_CFOP( '7210','Devolução de compra para utilização na prestação de serviço',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de serviços, cujas entradas tenham sido classificadas nos códigos “3.126 - Compra para utilização na prestação de serviço sujeita ao ICMS” '
                   +'e “3.128 - Compra para utilização na prestação de serviço sujeita ao ISSQN Vejamais (AJUSTE SINIEF 4, DE 9 DE JULHO DE 2010). efeitos a partir de 1º de janeiro de 2011– DECRETO 36.465/2011.' ) ;
INSERT_CFOP( '7211','Devolução de compras para industrialização sob o regime de drawback ',
                    'Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em processo de industrialização sob o regime de drawback e não utilizadas no referido processo, '
                   +'cujas entradas tenham sido classificadas no código 3.127 - Compra para industrialização sob o regime de drawback.' ) ;
INSERT_CFOP( '7250','VENDAS DE ENERGIA ELÉTRICA','' ) ;
INSERT_CFOP( '7251','Venda de energia elétrica para o exterior','Classificam-se neste código as vendas de energia elétrica para o exterior.' ) ;
INSERT_CFOP( '7300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','' ) ;
INSERT_CFOP( '7301','Prestação de serviço de comunicação para execução de serviço da mesma natureza','Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de serviços da mesma natureza.' ) ;
INSERT_CFOP( '7300','PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO','' ) ;
INSERT_CFOP( '7358','Prestação de serviço de transporte','Classificam-se neste código as prestações de serviços de transporte destinado a estabelecimento no exterior.' ) ;
INSERT_CFOP( '7500','EXPORTAÇÃO DE MERCADORIAS RECEBIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO','' ) ;
INSERT_CFOP( '7501','Exportação de mercadorias recebidas com fim específico de exportação',
                    'Classificam-se neste código as exportações das mercadorias recebidas anteriormente com finalidade específica de exportação, '
                   +'cujas entradas tenham sido classificadas nos códigos 1.501 - Entrada de mercadoria recebida com fim específico de exportação ou '
                   +'2.501 - Entrada de mercadoria recebida com fim específico de exportação.' ) ;
INSERT_CFOP( '7550','OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO','' ) ;
INSERT_CFOP( '7551','Venda de bem do ativo imobilizado','Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.' ) ;
INSERT_CFOP( '7553','Devolução de compra de bem para o ativo imobilizado','Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do estabelecimento, cuja entrada foi classificada no código 3.551 - Compra de bem para o ativo imobilizado.' ) ;
INSERT_CFOP( '7556','Devolução de compra de material de uso ou consumo','Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do estabelecimento, cuja entrada tenha sido classificada no código 3.556 - Compra de material para uso ou consumo.' ) ;
INSERT_CFOP( '7650','SAÍDAS DE COMBUSTÍVEIS, DERIVADOS OU NÃO DE PETRÓLEO, E LUBRIFICANTES ',' (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '7651','Venda de combustível ou lubrificante de produção do estabelecimento','Venda de combustível ou lubrificante industrializados no estabelecimento e destinados ao exterior. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '7654','Venda de combustível ou lubrificante adquiridos ou recebidos de terceiros','Venda de combustível ou lubrificante, adquiridos ou recebidos de terceiros, destinados ao exterior. (a partir 01.01.2004 -  Decreto Nº 26.174 de 26/11/2003)' ) ;
INSERT_CFOP( '7667','Venda de combustível ou lubrificante a consumidor ou usuário final','Venda de combustível ou lubrificante a consumidor ou a usuário final, cuja operação tenha sido equiparada a uma exportação. ACR Ajuste SINIEF 05/2009 – a partir de 01.07.2009)(Decreto nº 34.490/2009)' ) ;
INSERT_CFOP( '7900','OUTRAS SAIDAS DE MERCADORIA OU PRESTAÇÕES DE SERVIÇOS','' ) ;
INSERT_CFOP( '7930','Lançamento efetuado a título de devolução de bem cuja entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária','Classificam-se neste código os lançamentos efetuados a título de saída em devolução de bens cuja entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária.' ) ;
INSERT_CFOP( '7949','Outra saída de mercadoria ou prestação de serviço não especificado','Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham sido especificados nos códigos anteriores.' ) ;

end ;

end.
