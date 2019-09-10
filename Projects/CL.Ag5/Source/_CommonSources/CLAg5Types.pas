Unit CLAg5Types ;

interface

const

  _ST_AUTO_EVT                        = 'AUTO_EVT' ;
  _ST_AUTO_EVT_VETERINARIO                     = 3 ; // Checagem do Veterinário
  _ST_AUTO_EVT_PARTO                           = 4 ; // Parto
  _ST_AUTO_EVT_SECAGEM                         = 6 ; // Secagem
  _ST_AUTO_EVT_COBERTURA                       = 2 ; // Cobertura
  _ST_AUTO_EVT_CIO                             = 1 ; // Cio
  _ST_AUTO_EVT_COLETA                          = 5 ; // Coleta de Embrião
  _ST_AUTO_EVT_INTENCAO_DESCARTE               = 7 ; // Intenção de Descarte

  _ST_CENTROS_CUSTO                   = 'CENTROS_CUSTO' ;
  _ST_CENTROS_CUSTO_MASK                            = '000.00.00' ; // Mascara do Centro de Custo

  _ST_CERTIFICADORAS                  = 'CERTIFICADORAS' ;

  _ST_CFG_CATEGORIAS                  = 'CFG_CATEGORIAS' ;

  _ST_CFG_LIST_ADDRESS                = 'CFG_LIST_ADDRESS' ;
  _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_HOST               = 'FTP_SEND_BKP_HOST' ; // ControleLeiteiro.com.br
  _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_USER               = 'FTP_SEND_BKP_USER' ; // novo154
  _ST_CFG_LIST_ADDRESS_FTP_SEND_BKP_PASSWORD           = 'FTP_SEND_BKP_PASSWORD' ; // Thiago170683

  _ST_COOPERATIVAS                    = 'COOPERATIVAS' ;

  _ST_DEF_PLANOCONTAS                 = 'DEF_PLANOCONTAS' ;
  _ST_DEF_PLANOCONTAS_RECEITAS                        = 'x}xXQqVlKaPQj5+Y|=k6' ; // 4.19.01 - Receitas financeiras
  _ST_DEF_PLANOCONTAS_DESPESAS                        = 'S9Va(*(.t@NHAVg2bL?m' ; // 4.20.01 - Despesas financeiras (juros, taxa bancaria)

  _ST_EQA_PADRAO                      = 'EQA_PADRAO' ;

  _ST_LOGO_FAZENDA                    = 'LOGO_FAZENDA' ;
  _ST_LOGO_FAZENDA_WIDTH                           = 'WIDTH' ; // 100
  _ST_LOGO_FAZENDA_HEIGHT                          = 'HEIGHT' ; // 101

  _ST_MONTH                           = 'MONTH' ;
  _ST_MONTH_JAN                             = 1 ; // Janeiro
  _ST_MONTH_OCT                             = 10 ; // Outubro
  _ST_MONTH_NOV                             = 11 ; // Novembro
  _ST_MONTH_DEC                             = 12 ; // Dezembro
  _ST_MONTH_FEB                             = 2 ; // Fevereiro
  _ST_MONTH_MAR                             = 3 ; // Março
  _ST_MONTH_APR                             = 4 ; // Abril
  _ST_MONTH_MAY                             = 5 ; // Maio
  _ST_MONTH_JUN                             = 6 ; // Junho
  _ST_MONTH_JUL                             = 7 ; // Julho
  _ST_MONTH_AUG                             = 8 ; // Agosto
  _ST_MONTH_SEP                             = 9 ; // Setembro

  _ST_MONTH_ABBR                      = 'MONTH_ABBR' ;
  _ST_MONTH_ABBR_JAN                             = 1 ; // Jan
  _ST_MONTH_ABBR_OCT                             = 10 ; // Out
  _ST_MONTH_ABBR_NOV                             = 11 ; // Nov
  _ST_MONTH_ABBR_DEC                             = 12 ; // Dez
  _ST_MONTH_ABBR_FEB                             = 2 ; // Fev
  _ST_MONTH_ABBR_MAR                             = 3 ; // Mar
  _ST_MONTH_ABBR_APR                             = 4 ; // Abr
  _ST_MONTH_ABBR_MAY                             = 5 ; // Mai
  _ST_MONTH_ABBR_JUN                             = 6 ; // Jun
  _ST_MONTH_ABBR_JUL                             = 7 ; // Jul
  _ST_MONTH_ABBR_AUG                             = 8 ; // Ago
  _ST_MONTH_ABBR_SEP                             = 9 ; // Set

  _ST_MOTIVO_DESCARTE                 = 'MOTIVO_DESCARTE' ;

  _ST_MOTIVO_DESCARTE_MACHO           = 'MOTIVO_DESCARTE_MACHO' ;

  _ST_MOTIVO_INTERRUPCAO_BST          = 'MOTIVO_INTERRUPCAO_BST' ;

  _ST_PARAM_MATRIZES                  = 'PARAM_MATRIZES' ;
  _ST_PARAM_MATRIZES_DIAS_ABORTO_COM_LACTACAO        = 'DIAS_ABORTO_COM_LACTACAO' ; // Número de dias de gestação até aborto para considerar nova lactação
  _ST_PARAM_MATRIZES_DIAS_PARTO_SEM_CIO              = 'DIAS_PARTO_SEM_CIO' ; // Número de dias do parto sem cio
  _ST_PARAM_MATRIZES_DIAS_CONFIRMAR_PRENHEZ          = 'DIAS_CONFIRMAR_PRENHEZ' ; // Número de dias de gestação para confirmar prenhez
  _ST_PARAM_MATRIZES_DEL_MAX_RECEM_PARIDA            = 'DEL_MAX_RECEM_PARIDA' ; // Dias em lactação máximo para considerar o animal recém parida
  _ST_PARAM_MATRIZES_DIAS_DE_GESTACAO                = 'DIAS_DE_GESTACAO' ; // Número de dias de gestação
  _ST_PARAM_MATRIZES_DIAS_PRE_PARTO_SECAR            = 'DIAS_PRE_PARTO_SECAR' ; // Dias pré parto para secagem
  _ST_PARAM_MATRIZES_DIAS_POS_PARTO_INSEMINAR        = 'DIAS_POS_PARTO_INSEMINAR' ; // Dias pós parto para inseminar
  _ST_PARAM_MATRIZES_DIAS_REEXAMINAR_PALPACAO        = 'DIAS_REEXAMINAR_PALPACAO' ; // Dias para reexaminar (palpação)
  _ST_PARAM_MATRIZES_EQA_REBANHO                     = 'EQA_REBANHO' ; // EQA do rebanho
  _ST_PARAM_MATRIZES_BST_INTERVALO                   = 'BST_INTERVALO' ; // Intervalo para aplicação de BST
  _ST_PARAM_MATRIZES_BST_DEL                         = 'BST_DEL' ; // Dias pós parto para inicio da aplicação de BST
  _ST_PARAM_MATRIZES_BST_PRODUCAO                    = 'BST_PRODUCAO' ; // Ultima produção de leite superior a
  _ST_PARAM_MATRIZES_BST_DIAS_PRE_SECAGEM            = 'BST_DIAS_PRE_SECAGEM' ; // Dias antes da secagem para retirada do BST
  _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_1VEZ   = 'DIAS_RECONFIRMAR_PRENHEZ_1VEZ' ; // Número de dias de gestação para reconfirmar prenhez 1ª vez
  _ST_PARAM_MATRIZES_DIAS_RECONFIRMAR_PRENHEZ_2VEZ   = 'DIAS_RECONFIRMAR_PRENHEZ_2VEZ' ; // Número de dias de gestação para reconfirmar prenhez 2ª vez
  _ST_PARAM_MATRIZES_DIAS_COBERTURA_EFEITO_PROTOCOLO = 'DIAS_COBERTURA_EFEITO_PROTOCOLO' ; // Número máximo de dias após Protocolo reprodutivo para considerar cobertura efeito do Protocolo

  _ST_PARAM_NOVILHAS                  = 'PARAM_NOVILHAS' ;
  _ST_PARAM_NOVILHAS_PESO_DESMAME                    = 'PESO_DESMAME' ; // Peso das bezerras para desmame (Kg)
  _ST_PARAM_NOVILHAS_IDADE_DESMAME                   = 'IDADE_DESMAME' ; // Idade das bezerras para desmame (Dias)
  _ST_PARAM_NOVILHAS_IDADE_OBS_CIO                   = 'IDADE_OBS_CIO' ; // Idade das novilhas para iniciar observação de cios (Meses)
  _ST_PARAM_NOVILHAS_PESO_OBS_CIO                    = 'PESO_OBS_CIO' ; // Peso das novilhas para iniciar observação de cios (Kg)
  _ST_PARAM_NOVILHAS_IDADE_SEM_COBERTURA             = 'IDADE_SEM_COBERTURA' ; // Idade máxima das novilhas sem cobertura (Meses)
  _ST_PARAM_NOVILHAS_PESO_SEM_COBERTURA              = 'PESO_SEM_COBERTURA' ; // Peso máximo das novilhas sem cobertura (Kg)

  _ST_PLANO_CONTAS                    = 'PLANO_CONTAS' ;
  _ST_PLANO_CONTAS_MASK                            = '0.00.00' ; // Mascara do plano de contas

  _ST_RACA_ANIMAIS                    = 'RACA_ANIMAIS' ;

  _ST_RAZAO_DESCARTE                  = 'RAZAO_DESCARTE' ;

  _ST_RESULTADO_EXAMES                = 'RESULTADO_EXAMES' ;

  _ST_SEXO_CRIA                       = 'SEXO_CRIA' ;
  _ST_SEXO_CRIA_F                               = 1 ; // F
  _ST_SEXO_CRIA_M                               = 2 ; // M
  _ST_SEXO_CRIA_F_F                             = 3 ; // F&F
  _ST_SEXO_CRIA_F_M                             = 4 ; // F&M
  _ST_SEXO_CRIA_M_M                             = 5 ; // M&M

  _ST_SIGLA_CATEGORIA_FEMEA           = 'SIGLA_CATEGORIA_FEMEA' ;
  _ST_SIGLA_CATEGORIA_FEMEA_BEZ                             = 4 ; // BEZ
  _ST_SIGLA_CATEGORIA_FEMEA_NOV                             = 5 ; // NOV
  _ST_SIGLA_CATEGORIA_FEMEA_VL                              = 6 ; // VL
  _ST_SIGLA_CATEGORIA_FEMEA_VS                              = 7 ; // VS

  _ST_SIGLA_STATUS_ANIMAL             = 'SIGLA_STATUS_ANIMAL' ;
  _ST_SIGLA_STATUS_ANIMAL_EMBRIAO                         = 1 ; // EMB
  _ST_SIGLA_STATUS_ANIMAL_SEMEN                           = 2 ; // SEM
  _ST_SIGLA_STATUS_ANIMAL_NATIMORTO                       = 3 ; // NM
  _ST_SIGLA_STATUS_ANIMAL_BEZERRO                         = 4 ; // BEZ
  _ST_SIGLA_STATUS_ANIMAL_NOVILHA                         = 5 ; // NOV
  _ST_SIGLA_STATUS_ANIMAL_VACALACTACAO                    = 6 ; // VL
  _ST_SIGLA_STATUS_ANIMAL_VACASECA                        = 7 ; // VS
  _ST_SIGLA_STATUS_ANIMAL_TOURO                           = 8 ; // TOU
  _ST_SIGLA_STATUS_ANIMAL_DESCARTADO                      = 9 ; // DES

  _ST_SIGLA_STATUS_FEMEA              = 'SIGLA_STATUS_FEMEA' ;
  _ST_SIGLA_STATUS_FEMEA_BEZERRO                         = 4 ; // BEZ
  _ST_SIGLA_STATUS_FEMEA_NOVILHA                         = 5 ; // NOV
  _ST_SIGLA_STATUS_FEMEA_VACALACTACAO                    = 6 ; // VL
  _ST_SIGLA_STATUS_FEMEA_VACASECA                        = 7 ; // VS
  _ST_SIGLA_STATUS_FEMEA_DESCARTADO                      = 9 ; // DES

  _ST_STATUS_ANIMAL                   = 'STATUS_ANIMAL' ;
  _ST_STATUS_ANIMAL_EMBRIAO                         = 1 ; // Embrião
  _ST_STATUS_ANIMAL_SEMEN                           = 2 ; // Sêmen
  _ST_STATUS_ANIMAL_NATIMORTO                       = 3 ; // Nati-morto
  _ST_STATUS_ANIMAL_BEZERRO                         = 4 ; // Bezerro(a)
  _ST_STATUS_ANIMAL_NOVILHA                         = 5 ; // Novilha
  _ST_STATUS_ANIMAL_VACALACTACAO                    = 6 ; // Vaca em Lactação
  _ST_STATUS_ANIMAL_VACASECA                        = 7 ; // Vaca Seca
  _ST_STATUS_ANIMAL_TOURO                           = 8 ; // Touro
  _ST_STATUS_ANIMAL_DESCARTADO                      = 9 ; // Descartada

  _ST_STATUS_DESMAME                  = 'STATUS_DESMAME' ;
  _ST_STATUS_DESMAME_BEZERRO                         = 4 ; // BEZ
  _ST_STATUS_DESMAME_NOVILHA                         = 5 ; // NOV

  _ST_STATUS_DIAGNOSTICO              = 'STATUS_DIAGNOSTICO' ;
  _ST_STATUS_DIAGNOSTICO_ABERTO                          = 1 ; // Aberto
  _ST_STATUS_DIAGNOSTICO_ENCERRADO                       = 2 ; // Encerrado

  _ST_STATUS_EMBRIAO                  = 'STATUS_EMBRIAO' ;
  _ST_STATUS_EMBRIAO_EMBRIAO                         = 1 ; // Embrião

  _ST_STATUS_FEMEA                    = 'STATUS_FEMEA' ;
  _ST_STATUS_FEMEA_BEZERRO                         = 4 ; // Bezerro(a)
  _ST_STATUS_FEMEA_NOVILHA                         = 5 ; // Novilha
  _ST_STATUS_FEMEA_VACALACTACAO                    = 6 ; // Vaca em Lactação
  _ST_STATUS_FEMEA_VACASECA                        = 7 ; // Vaca Seca
  _ST_STATUS_FEMEA_DESCARTADO                      = 9 ; // Descartada

  _ST_STATUS_GEMELAR                  = 'STATUS_GEMELAR' ;
  _ST_STATUS_GEMELAR_GEMELAR                         = 'T' ; // Sim
  _ST_STATUS_GEMELAR_NAOGEMELAR                      = 'F' ; // Não
  _ST_STATUS_GEMELAR_NAOEXAMINADA                    = '' ; //

  _ST_STATUS_GESTACAO                 = 'STATUS_GESTACAO' ;
  _ST_STATUS_GESTACAO_ABORTO                          = 1 ; // Aborto
  _ST_STATUS_GESTACAO_ABORTO_LACTACAO                 = 2 ; // Aborto/Lactação
  _ST_STATUS_GESTACAO_PARTO                           = 3 ; // Parto

  _ST_STATUS_MACHO                    = 'STATUS_MACHO' ;
  _ST_STATUS_MACHO_BEZERRO                         = 4 ; // Bezerro
  _ST_STATUS_MACHO_SEMEN                           = 2 ; // Sêmen
  _ST_STATUS_MACHO_TOURO                           = 8 ; // Touro

  _ST_STATUS_PRENHEZ                  = 'STATUS_PRENHEZ' ;
  _ST_STATUS_PRENHEZ_NAOEXAMINADA                    = '' ; //
  _ST_STATUS_PRENHEZ_PRENHE                          = 'T' ; // Prenhe
  _ST_STATUS_PRENHEZ_NAOPRENHE                       = 'F' ; // Não prenhe

  _ST_STATUS_PRODUCAO                 = 'STATUS_PRODUCAO' ;

  _ST_STATUS_PROTOCOLO                = 'STATUS_PROTOCOLO' ;
  _ST_STATUS_PROTOCOLO_ABERTO                          = 1 ; // Aberto
  _ST_STATUS_PROTOCOLO_ENCERRADO                       = 2 ; // Encerrado
  _ST_STATUS_PROTOCOLO_INTERROMPIDO                    = 3 ; // Interrompido

  _ST_STATUS_REPRODUTIVO              = 'STATUS_REPRODUTIVO' ;
  _ST_STATUS_REPRODUTIVO_APTA                            = -10 ; // Apta
  _ST_STATUS_REPRODUTIVO_EMCRESCIMENTO                   = -1 ; // Em crescimento
  _ST_STATUS_REPRODUTIVO_INSEMINADA                      = -11 ; // Inseminada
  _ST_STATUS_REPRODUTIVO_PRENHE                          = -12 ; // Prenhe
  _ST_STATUS_REPRODUTIVO_VAZIA                           = -13 ; // Vazia
  _ST_STATUS_REPRODUTIVO_ABORTADA                        = -14 ; // Abortada
  _ST_STATUS_REPRODUTIVO_PEV                             = -40 ; // PEV
  _ST_STATUS_REPRODUTIVO_NAO_INSEMINAR                   = -50 ; // Não inseminar
  _ST_STATUS_REPRODUTIVO_DOADORA_APTA                    = -20 ; // Doadora apta
  _ST_STATUS_REPRODUTIVO_DOADORA_INSEMINADA              = -21 ; // Doadora inseminada
  _ST_STATUS_REPRODUTIVO_DOADORA_COLETADA                = -25 ; // Doadora coletada
  _ST_STATUS_REPRODUTIVO_RECEPTORA_APTA                  = -30 ; // Receptora apta
  _ST_STATUS_REPRODUTIVO_RECEPTORA_TRANSFERIDA           = -31 ; // Receptora transferida
  _ST_STATUS_REPRODUTIVO_RECEPTORA_PRENHE                = -32 ; // Receptora prenhe
  _ST_STATUS_REPRODUTIVO_RECEPTORA_VAZIA                 = -33 ; // Receptora vazia
  _ST_STATUS_REPRODUTIVO_RECEPTORA_ABORTADA              = -34 ; // Receptora abortada
  _ST_STATUS_REPRODUTIVO_COLETADA                        = -15 ; // Coletada

  _ST_STATUS_TAREFA                   = 'STATUS_TAREFA' ;
  _ST_STATUS_TAREFA_PENDENTE                        = 1 ; // Pendente
  _ST_STATUS_TAREFA_EXECUTADA                       = 2 ; // Executada
  _ST_STATUS_TAREFA_NAO_EXECUTADA                   = 3 ; // Não Executada
  _ST_STATUS_TAREFA_INTERROMPIDA                    = 4 ; // Interrompida
  _ST_STATUS_TAREFA_DESCARTE_LEITE                  = 5 ; // Descartar leite
  _ST_STATUS_TAREFA_DESCARTE_CARNE                  = 6 ; // Não descartar carne

  _ST_SYS_ORIGIN_TYPE                 = 'SYS_ORIGIN_TYPE' ;
  _ST_SYS_ORIGIN_TYPE_MANUAL                          = 0 ; // Manual
  _ST_SYS_ORIGIN_TYPE_IMPORTEDED                      = 1 ; // Importado
  _ST_SYS_ORIGIN_TYPE_SINCHRONIZED                    = 2 ; // Sincronizado

  _ST_TIPO_CAMPOESCORE                = 'TIPO_CAMPOESCORE' ;
  _ST_TIPO_CAMPOESCORE_VCHAR                           = 1 ; // Descrição
  _ST_TIPO_CAMPOESCORE_INTEGER                         = 2 ; // Numero Inteiro
  _ST_TIPO_CAMPOESCORE_FLOAT                           = 3 ; // Numero Fracionário
  _ST_TIPO_CAMPOESCORE_TIMESTAMP                       = 4 ; // Data
  _ST_TIPO_CAMPOESCORE_BLOB_TEXT                       = 5 ; // Observações

  _ST_TIPO_CAMPOINDICADOR             = 'TIPO_CAMPOINDICADOR' ;
  _ST_TIPO_CAMPOINDICADOR_VCHAR                           = 1 ; // Descrição
  _ST_TIPO_CAMPOINDICADOR_INTEGER                         = 2 ; // Numero Inteiro
  _ST_TIPO_CAMPOINDICADOR_FLOAT                           = 3 ; // Numero Fracionario
  _ST_TIPO_CAMPOINDICADOR_TIMESTAMP                       = 4 ; // Data
  _ST_TIPO_CAMPOINDICADOR_BLOB_TEXT                       = 5 ; // Observações

  _ST_TIPO_CMT                        = 'TIPO_CMT' ;

  _ST_TIPO_COMPOSICAORACA             = 'TIPO_COMPOSICAORACA' ;

  _ST_TIPO_DIAGNOSTICO                = 'TIPO_DIAGNOSTICO' ;
  _ST_TIPO_DIAGNOSTICO_SANITARIO                       = 1 ; // Sanitário
  _ST_TIPO_DIAGNOSTICO_REPRODUTIVO                     = 2 ; // Reprodutivo
  _ST_TIPO_DIAGNOSTICO_AGENDA_3                        = -1 ; // Agenda 3
  _ST_TIPO_DIAGNOSTICO_MASTITE                         = 3 ; // Mastite

  _ST_TIPO_DOADOR_RECEPTOR            = 'TIPO_DOADOR_RECEPTOR' ;
  _ST_TIPO_DOADOR_RECEPTOR_ND                              = 1 ; //
  _ST_TIPO_DOADOR_RECEPTOR_DOADOR                          = 2 ; // Doadora
  _ST_TIPO_DOADOR_RECEPTOR_RECEPTOR                        = 3 ; // Receptora

  _ST_TIPO_EVENTO_ZOO                 = 'TIPO_EVENTO_ZOO' ;
  _ST_TIPO_EVENTO_ZOO_CIO                             = 1 ; // Cio
  _ST_TIPO_EVENTO_ZOO_INSEMINA                        = 2 ; // Inseminação
  _ST_TIPO_EVENTO_ZOO_MONTA                           = 3 ; // Monta
  _ST_TIPO_EVENTO_ZOO_IMPLANTE                        = 4 ; // Embrião

  _ST_TIPO_MUCO                       = 'TIPO_MUCO' ;

  _ST_TIPO_PARTOABORTO                = 'TIPO_PARTOABORTO' ;
  _ST_TIPO_PARTOABORTO_ABORTO                          = 1 ; // Aborto
  _ST_TIPO_PARTOABORTO_ABORTO_LACTACAO                 = 2 ; // Aborto/Lactação
  _ST_TIPO_PARTOABORTO_PARTO                           = 3 ; // Parto
  _ST_TIPO_PARTOABORTO_COLETA                          = 4 ; // Coleta de Embrião

  _ST_TIPO_PLANOCONTAS                = 'TIPO_PLANOCONTAS' ;
  _ST_TIPO_PLANOCONTAS_CDL_PL                          = -1 ; // Plano de Contas - Pecuária de Leite
  _ST_TIPO_PLANOCONTAS_CDL_RCP                         = -2 ; // Plano de Contas - RCP

  _ST_TIPO_PROTOCOLO                  = 'TIPO_PROTOCOLO' ;
  _ST_TIPO_PROTOCOLO_GERAL                           = 1 ; // Tarefa Geral
  _ST_TIPO_PROTOCOLO_NASCIMENTO                      = 2 ; // Nascimento
  _ST_TIPO_PROTOCOLO_REPRODUTIVO                     = 3 ; // Reprodutivo
  _ST_TIPO_PROTOCOLO_SANITARIO                       = 4 ; // Sanitário
  _ST_TIPO_PROTOCOLO_PARTO                           = 5 ; // Parto
  _ST_TIPO_PROTOCOLO_PRODUTIVO                       = 6 ; // Produtivo
  _ST_TIPO_PROTOCOLO_IATF                            = 7 ; // IATF

  _ST_TIPO_QUARTO                     = 'TIPO_QUARTO' ;

  _ST_TIPO_SIGLAQUARTO                = 'TIPO_SIGLAQUARTO' ;

  _ST_TIPO_TAREFA                     = 'TIPO_TAREFA' ;
  _ST_TIPO_TAREFA_INDEFINIDO                      = 1 ; // Indefinido
  _ST_TIPO_TAREFA_DIAGNOSTICO                     = 2 ; // Diagnóstico
  _ST_TIPO_TAREFA_MEDICAO                         = 3 ; // Medicação
  _ST_TIPO_TAREFA_MANEJO                          = 4 ; // Manejo
  _ST_TIPO_TAREFA_VACINACAO                       = 5 ; // Vacinação


implementation

end.

