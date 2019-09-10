inherited frmCAD_Fornecedores: TfrmCAD_Fornecedores
  Left = 582
  Top = 208
  ActiveControl = _edtSearch
  Caption = 'Fornecedores'
  ClientHeight = 789
  ClientWidth = 836
  ExplicitWidth = 852
  ExplicitHeight = 828
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 836
    Height = 724
    ExplicitWidth = 836
    ExplicitHeight = 724
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 828
      ExplicitHeight = 696
      inherited _pnlSearch: TPanel
        Width = 828
        Height = 65
        ExplicitWidth = 828
        ExplicitHeight = 65
        inherited _lblPesquisas: TLabel
          Top = 16
          ExplicitTop = 16
        end
        inherited _edtSearch: TJvComboEdit
          Top = 10
          ButtonWidth = 17
          ClickKey = 0
          OnEnter = _edtSearchEnter
          ExplicitTop = 10
        end
        object cbxInativos: TCheckBox
          Left = 72
          Top = 40
          Width = 64
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = cbxInativosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 65
        Width = 828
        Height = 631
        ExplicitTop = 65
        ExplicitWidth = 828
        ExplicitHeight = 631
        inherited _dbgLista: TJvDBUltimGrid
          Tag = 99
          Width = 824
          Height = 627
          BorderStyle = bsSingle
          Color = clWindow
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
          TitleButtons = False
          BevelInner = bvRaised
          AlternateRowColor = clNone
          TitleArrow = False
          AutoSizeRows = True
          RowsHeight = 15
          TitleRowHeight = 16
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELIDO'
              Title.Caption = 'Apelido / Nome Fantasia'
              Width = 162
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 165
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 62
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 828
      ExplicitHeight = 696
      inherited _pnlFicha: TPanel
        Width = 828
        Height = 696
        Constraints.MinHeight = 213
        FullRepaint = False
        ExplicitWidth = 828
        ExplicitHeight = 696
        inherited _ScrollBoxFicha: TScrollBox
          Width = 828
          Height = 696
          AutoScroll = False
          ExplicitWidth = 828
          ExplicitHeight = 696
          inherited _pnlScroll: TPanel
            Width = 828
            Height = 669
            Align = alTop
            AutoSize = False
            ExplicitWidth = 828
            ExplicitHeight = 669
            object lblRGIE: TLabel
              Left = 386
              Top = 89
              Width = 32
              Height = 12
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'IE'
              Transparent = True
            end
            object Label10: TLabel
              Left = 7
              Top = 10
              Width = 40
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'C'#243'digo'
              FocusControl = dbeCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 634
              Top = 12
              Width = 36
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Status'
              FocusControl = dbeCodigo
            end
            object Label25: TLabel
              Left = 7
              Top = 128
              Width = 72
              Height = 12
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'Telefone'
              Transparent = True
            end
            object Label26: TLabel
              Left = 386
              Top = 128
              Width = 23
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'Fax'
              Transparent = True
            end
            object Label27: TLabel
              Left = 386
              Top = 168
              Width = 104
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'P'#225'gina na internet'
              FocusControl = dbeCodigo
            end
            object Label28: TLabel
              Left = 7
              Top = 168
              Width = 31
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Email'
              FocusControl = dbeCodigo
            end
            object Label29: TLabel
              Left = 386
              Top = 10
              Width = 40
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pessoa'
              FocusControl = dbeCodigo
            end
            object lblApelidoFantasia: TLabel
              Left = 7
              Top = 89
              Width = 82
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome fantasia'
              Transparent = True
            end
            object lblCNPCNPJ: TLabel
              Left = 386
              Top = 50
              Width = 32
              Height = 11
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'CNPJ'
              Transparent = True
            end
            object lblNomeRazao: TLabel
              Left = 7
              Top = 50
              Width = 74
              Height = 11
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'Raz'#227'o social'
              Transparent = True
            end
            object Label13: TLabel
              Left = 11
              Top = 508
              Width = 78
              Height = 13
              Caption = 'Observa'#231#245'es '
            end
            object dbeCPF_CNPJ: TDBEdit
              Left = 434
              Top = 46
              Width = 126
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'CPF_CNPJ'
              DataSource = dtsFicha
              TabOrder = 4
              OnExit = dbeCPF_CNPJExit
            end
            object cbTipoPessoa: TJvDBComboBox
              Left = 434
              Top = 7
              Width = 109
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'PESSOA'
              DataSource = dtsFicha
              Items.Strings = (
                'F'#237'sica'
                'Jur'#237'dica')
              TabOrder = 1
              Values.Strings = (
                'F'
                'J')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object cbStatus: TJvDBComboBox
              Left = 690
              Top = 8
              Width = 85
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'ATIVO'
              DataSource = dtsFicha
              Items.Strings = (
                'Ativo'
                'Inativo')
              TabOrder = 2
              Values.Strings = (
                'T'
                'F')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBEdit30: TDBEdit
              Left = 506
              Top = 165
              Width = 269
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'URL'
              DataSource = dtsFicha
              TabOrder = 10
            end
            object DBEdit32: TDBEdit
              Left = 434
              Top = 125
              Width = 113
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'FAX'
              DataSource = dtsFicha
              TabOrder = 8
            end
            object DBEdit31: TDBEdit
              Left = 100
              Top = 165
              Width = 250
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'EMAIL'
              DataSource = dtsFicha
              TabOrder = 9
            end
            object DBEdit29: TDBEdit
              Left = 434
              Top = 86
              Width = 126
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'RG_IE'
              DataSource = dtsFicha
              TabOrder = 6
            end
            object DBEdit28: TDBEdit
              Left = 100
              Top = 125
              Width = 113
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'FONE'
              DataSource = dtsFicha
              TabOrder = 7
            end
            object DBEdit27: TDBEdit
              Left = 100
              Top = 46
              Width = 250
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOME'
              DataSource = dtsFicha
              TabOrder = 3
            end
            object DBEdit26: TDBEdit
              Left = 100
              Top = 86
              Width = 250
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'APELIDO'
              DataSource = dtsFicha
              TabOrder = 5
            end
            object dbeCodigo: TDBEdit
              Left = 99
              Top = 7
              Width = 100
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Color = clBtnFace
              DataField = 'CODIGO'
              DataSource = dtsFicha
              ReadOnly = True
              TabOrder = 0
            end
            object PageControl1: TPageControl
              Left = 7
              Top = 293
              Width = 768
              Height = 185
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = TabSheet1
              TabOrder = 12
              object TabSheet1: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Endere'#231'o'
                object Label5: TLabel
                  Left = 2
                  Top = 45
                  Width = 80
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Complemento'
                  FocusControl = DBEdit5
                end
                object Label6: TLabel
                  Left = 462
                  Top = 45
                  Width = 35
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Bairro'
                  FocusControl = DBEdit6
                end
                object Label7: TLabel
                  Left = 2
                  Top = 103
                  Width = 23
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'CEP'
                  FocusControl = DBEdit7
                end
                object Label8: TLabel
                  Left = 2
                  Top = 75
                  Width = 40
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Cidade'
                  FocusControl = DBEdit8
                end
                object Label9: TLabel
                  Left = 462
                  Top = 75
                  Width = 14
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'UF'
                end
                object Label11: TLabel
                  Left = 253
                  Top = 105
                  Width = 54
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Cx.Postal'
                  FocusControl = DBEdit10
                end
                object Label1: TLabel
                  Left = 462
                  Top = 16
                  Width = 14
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'N'#186
                end
                object Label2: TLabel
                  Left = 2
                  Top = 16
                  Width = 53
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Endere'#231'o'
                  FocusControl = DBEdit4
                end
                object Label4: TLabel
                  Left = 2
                  Top = 129
                  Width = 45
                  Height = 13
                  Caption = 'Contato'
                end
                object Label3: TLabel
                  Left = 462
                  Top = 129
                  Width = 48
                  Height = 13
                  Caption = 'Telefone'
                end
                object DBEdit1: TDBEdit
                  Left = 520
                  Top = 13
                  Width = 103
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'NUMERO'
                  DataSource = dtsEndereco
                  TabOrder = 1
                end
                object DBEdit4: TDBEdit
                  Left = 92
                  Top = 13
                  Width = 317
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'ENDERECO'
                  DataSource = dtsEndereco
                  TabOrder = 0
                end
                object DBEdit5: TDBEdit
                  Left = 92
                  Top = 42
                  Width = 317
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'COMPLEMENTO'
                  DataSource = dtsEndereco
                  TabOrder = 2
                end
                object DBEdit6: TDBEdit
                  Left = 520
                  Top = 42
                  Width = 163
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'BAIRRO'
                  DataSource = dtsEndereco
                  TabOrder = 3
                end
                object DBEdit7: TDBEdit
                  Left = 92
                  Top = 100
                  Width = 130
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'CEP'
                  DataSource = dtsEndereco
                  TabOrder = 6
                  OnKeyPress = DBEdit7KeyPress
                end
                object DBEdit8: TDBEdit
                  Left = 92
                  Top = 72
                  Width = 318
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'CIDADE'
                  DataSource = dtsEndereco
                  TabOrder = 4
                end
                object DBEdit10: TDBEdit
                  Left = 311
                  Top = 102
                  Width = 98
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'CXPOSTAL'
                  DataSource = dtsEndereco
                  TabOrder = 7
                end
                object JvDBComboBox1: TJvDBComboBox
                  Left = 521
                  Top = 72
                  Width = 52
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'UF'
                  DataSource = dtsEndereco
                  Items.Strings = (
                    'AC'
                    'AL'
                    'AP'
                    'AM'
                    'BA'
                    'CE'
                    'DF'
                    'ES'
                    'GO'
                    'MA'
                    'MT'
                    'MS'
                    'MG'
                    'PA'
                    'PB'
                    'PR'
                    'PE'
                    'PI'
                    'RJ'
                    'RN'
                    'RS'
                    'RO'
                    'RR'
                    'SC'
                    'SP'
                    'SE'
                    'TO')
                  TabOrder = 5
                  Values.Strings = (
                    'AC'
                    'AL'
                    'AP'
                    'AM'
                    'BA'
                    'CE'
                    'DF'
                    'ES'
                    'GO'
                    'MA'
                    'MT'
                    'MS'
                    'MG'
                    'PA'
                    'PB'
                    'PR'
                    'PE'
                    'PI'
                    'RJ'
                    'RN'
                    'RS'
                    'RO'
                    'RR'
                    'SC'
                    'SP'
                    'SE'
                    'TO')
                  ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                  ListSettings.OutfilteredValueFont.Color = clRed
                  ListSettings.OutfilteredValueFont.Height = -11
                  ListSettings.OutfilteredValueFont.Name = 'Verdana'
                  ListSettings.OutfilteredValueFont.Style = []
                end
                object DBEdit2: TDBEdit
                  Left = 92
                  Top = 126
                  Width = 270
                  Height = 21
                  DataField = 'CONTATO'
                  DataSource = dtsEndereco
                  TabOrder = 8
                end
                object DBEdit3: TDBEdit
                  Left = 521
                  Top = 126
                  Width = 121
                  Height = 21
                  DataField = 'FONE'
                  DataSource = dtsEndereco
                  TabOrder = 9
                end
              end
              object TabSheet2: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Outros endere'#231'os'
                ImageIndex = 1
                object JvDBUltimGrid1: TJvDBUltimGrid
                  Left = 0
                  Top = 0
                  Width = 760
                  Height = 157
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Align = alClient
                  BorderStyle = bsNone
                  DataSource = dtsOutrosEnderecos
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clBlack
                  TitleFont.Height = -11
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  SelectColumnsDialogStrings.Caption = 'Select columns'
                  SelectColumnsDialogStrings.OK = '&OK'
                  SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                  EditControls = <
                    item
                      ControlName = 'dbcbUFOutrosEnderecos'
                      FieldName = 'UF'
                      FitCell = fcBiggest
                      LeaveOnEnterKey = True
                      LeaveOnUpDownKey = True
                    end>
                  RowsHeight = 16
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ENDERECO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUMERO'
                      Width = 22
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COMPLEMENTO'
                      Width = 112
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BAIRRO'
                      Width = 79
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CEP'
                      Width = 45
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CIDADE'
                      Width = 101
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'UF'
                      Width = 25
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CXPOSTAL'
                      Width = 78
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CONTATO'
                      Width = 78
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FONE'
                      Width = 64
                      Visible = True
                    end>
                end
                object dbcbUFOutrosEnderecos: TJvDBComboBox
                  Left = 486
                  Top = 40
                  Width = 40
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'UF'
                  DataSource = dtsOutrosEnderecos
                  Items.Strings = (
                    'AC'
                    'AL'
                    'AP'
                    'AM'
                    'BA'
                    'CE'
                    'DF'
                    'ES'
                    'GO'
                    'MA'
                    'MT'
                    'MS'
                    'MG'
                    'PA'
                    'PB'
                    'PR'
                    'PE'
                    'PI'
                    'RJ'
                    'RN'
                    'RS'
                    'RO'
                    'RR'
                    'SC'
                    'SP'
                    'SE'
                    'TO')
                  TabOrder = 1
                  Values.Strings = (
                    'AC'
                    'AL'
                    'AP'
                    'AM'
                    'BA'
                    'CE'
                    'DF'
                    'ES'
                    'GO'
                    'MA'
                    'MT'
                    'MS'
                    'MG'
                    'PA'
                    'PB'
                    'PR'
                    'PE'
                    'PI'
                    'RJ'
                    'RN'
                    'RS'
                    'RO'
                    'RR'
                    'SC'
                    'SP'
                    'SE'
                    'TO')
                  Visible = False
                  ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                  ListSettings.OutfilteredValueFont.Color = clRed
                  ListSettings.OutfilteredValueFont.Height = -11
                  ListSettings.OutfilteredValueFont.Name = 'Verdana'
                  ListSettings.OutfilteredValueFont.Style = []
                end
              end
            end
            object GroupBox1: TGroupBox
              Left = 7
              Top = 195
              Width = 475
              Height = 89
              Caption = ' Apropria'#231#227'o favorita '
              TabOrder = 11
              object Label12: TLabel
                Left = 6
                Top = 29
                Width = 34
                Height = 13
                Caption = 'Conta'
              end
              object Codigo: TLabel
                Left = 6
                Top = 62
                Width = 40
                Height = 13
                Caption = 'C'#243'digo'
              end
              object lblClassificacao: TLabel
                Left = 280
                Top = 62
                Width = 74
                Height = 13
                Caption = 'Classifica'#231#227'o'
              end
              object dbtCodigoConta: TDBText
                Left = 93
                Top = 62
                Width = 133
                Height = 17
                DataField = 'DESCR_PC_CODIGO'
                DataSource = dtsDadosFinanceiro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dtbClassificacao: TDBText
                Left = 370
                Top = 62
                Width = 91
                Height = 13
                AutoSize = True
                DataField = 'DESCR_PC_CLASSIFICACAO'
                DataSource = dtsDadosFinanceiro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object JvDBComboEdit1: TJvDBComboEdit
                Left = 93
                Top = 26
                Width = 368
                Height = 21
                DataField = 'DESCR_PC_NOME'
                DataSource = dtsDadosFinanceiro
                ImageKind = ikEllipsis
                TabOrder = 0
                OnButtonClick = JvDBComboEdit1ButtonClick
                OnKeyPress = JvDBComboEdit1KeyPress
              end
            end
            object btnAdicionaEndereco: TTcGDIButton
              Left = 482
              Top = 484
              Width = 140
              Height = 30
              Caption = 'Adicionar endere'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Picture.Data = {
                424D380500000000000036000000280000001500000014000000010018000000
                000002050000120B0000120B000000000000000000008300E58300E58300E5DD
                DBDBBAB8B8B4B2B1BBB8B89491927D797A837E7F8F8B8B9A9696A4A09F7CAE86
                43BC6478B785BFBDBCB3B0AF8300E58300E58300E5008300E58300E5C4C2C1AD
                AAA9E4E2E1D4D3D2716C6D7B76788D898A9E9A9AADA9A9BBB7B682C08E55C877
                83D49D77CB8AE4E3E2C6C3C38300E58300E58300E5008300E5C2C0C0C1BEBDE5
                E4E3F1F1F09894957D787A908B8CA09C9CAFABAABCB8B785C1915ACA7D8FD8A8
                7CD2985FCA77AFD6B595BC9BACD3B2ACD3B2BAD7BE00D4D3D2AEABAAE7E6E5F2
                F2F1FAF9F9A09D9E918D8EA29E9EB0ACACBDB9B888C29465CD8682D39E82D39E
                79D39863CD8663CD8663CD8663CD8663CD865AC87700AAA8A7E8E7E6E1E0E0D9
                D7D8E0DFE0BDBABBA4A09FB2AEADBEBBB999C7A560CC8372D19272D19272D192
                72D19272D19272D19272D19272D19272D19261CB7C00B8B5B5A09E9E706B6D83
                7E80959192A5A1A1B3AFAFC0BCBBA2C6A965CD8A65CD8A65CD8A65CD8A65CD8A
                65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A68CE8300ADAAAA726D6F86818297
                9394A7A3A2B5B1B0C1BDBCCBC9C7D4D2D078CC8D63CD8657CA7D57CA7D57CA7D
                57CA7D57CA7D57CA7D57CA7D57CA7D57CA7D6ECF89007A7577878384999595A8
                A4A4B6B2B1C2BFBDCCCAC8D5D3D2DCDBD9E2E1E082D39660CC8549C67249C672
                4DC87459CB7F59CB7F59CB7F59CB7F59CB7F77D08E00817C7D9B9797AAA6A6B8
                B4B3C3C0BFCDCBC9D6D4D2DDDCDAE3E2E1E8E7E6EBEAE98AD59D5FCB823EC268
                54C77893D6A5CFE0D3B4C5B8CFE0D3CFE0D3CADFCE008F8B8BACA8A7B9B5B4C4
                C1C0CFCCCAD7D5D3DEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECC4E4CC53C673
                4DC67195D6A3DFDEDCBFBCBB8300E58300E58300E5009B9797BAB7B6C6C3C1CF
                CDCBD8D6D4DFDDDCE4E3E2E9E8E7ECEBEAEEEDECEEEDECEEEDECECEBEAAEDCB8
                6ECF8999D3A4D8D6D4BAB8B78300E58300E58300E500A6A2A1C7C4C2D1CECCD9
                D7D5DFDEDCE5E4E2E9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3E1
                DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E500AFACABD1CFCDD9D8D6E0
                DFDDE5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDCDA
                D6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E500B7B4B3DAD9D7E1DFDEE6
                E5E4EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E8E6E5E3E1E0DDDBDAD5D3D2
                CCCAC8C2BFBEB7B3B2A8A4A48300E58300E58300E500BDBABAE1E0DEE6E5E4EA
                E9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5E2E1DFDCDAD9D5D3D1CCC9C7
                C1BEBCB5B1B0A7A3A39F9C9C8300E58300E58300E500C2C0BFE7E6E5EBEAE9ED
                ECEBEEEDECEEEDECEDECEBEAE9E8E6E5E4E2E0DFDBDAD8D4D2D0CAC8C6C0BCBB
                B4B0AFA6A2A19692929692928300E58300E58300E500C6C4C3EBEAE9EDECEBEE
                EDECEEEDECEDECEBEAE9E8E6E5E4E1DFDEDAD9D7D3D1CFC9C7C5BEBBBAB2AEAE
                A4A0A0949090827D7F8B87888300E58300E58300E500C9C7C6EDECECEEEDECEE
                EDECECEBEBEAE9E7E6E4E3E0DFDDDAD8D6D2D0CEC8C6C4BDBAB9B1ADACA29E9E
                928E8E807B7D6C6769807C7C8300E58300E58300E500CAC8C8EEEDECEEEDECEC
                EBEAE9E8E7E5E4E2DFDEDCD9D7D5D1CFCDC7C4C2BCB8B7AFABABA19D9C908C8D
                7D797A6A6566555051736F708300E58300E58300E500B0ADADCAC8C8C9C7C7C7
                C5C4C4C2C1C0BDBDBBB8B7B5B2B1AEAAA9A5A1A19C9897918D8D858081777273
                6863645853544642436D6A6A8300E58300E58300E5000000}
              TabOrder = 13
              OnClick = btnAdicionaEnderecoClick
              Appearance.ColorChecked = 16111818
              Appearance.ColorCheckedTo = 16367008
              Appearance.ColorDisabled = 15921906
              Appearance.ColorDisabledTo = 15921906
              Appearance.ColorDown = 16111818
              Appearance.ColorDownTo = 16367008
              Appearance.ColorHot = 16117985
              Appearance.ColorHotTo = 16372402
              Appearance.ColorMirrorHot = 16107693
              Appearance.ColorMirrorHotTo = 16775412
              Appearance.ColorMirrorDown = 16102556
              Appearance.ColorMirrorDownTo = 16768988
              Appearance.ColorMirrorChecked = 16102556
              Appearance.ColorMirrorCheckedTo = 16768988
              Appearance.ColorMirrorDisabled = 11974326
              Appearance.ColorMirrorDisabledTo = 15921906
            end
            object btnRemoveEndereco: TTcGDIButton
              Left = 627
              Top = 484
              Width = 140
              Height = 30
              Caption = 'Remove endere'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Picture.Data = {
                424D380500000000000036000000280000001500000014000000010018000000
                000002050000120B0000120B000000000000000000008300E58300E58300E5DD
                DBDBBAB8B8B4B2B1BBB8B89491927D797A837E7F8F8B8B9A9696A4A09FA3A0A5
                3636B16967A8BFBDBCB3B0AF8300E58300E58300E5008300E58300E5C4C2C1AD
                AAA9E4E2E1D4D3D2716C6D7B76788D898A9E9A9AADA9A9BBB7B6C6C3C1A3A2B7
                5757D46060D67171BFC6C3C38300E58300E58300E5008300E5C2C0C0C1BEBDE5
                E4E3F1F1F09894957D787A908B8C98949A8B889E9592A89D9BB0A5A2B78887AD
                5555D37D7DDD6D6DD96867B78300E58300E58300E500D4D3D2AEABAAE7E6E5F2
                F2F1FAF9F9A09D9E918D8EA29E9E6D6BA84C4CD15151D25151D25151D25151D2
                5F5FD66F6FDA6F6FDA6464D77676D0D9D8DC8300E500AAA8A7E8E7E6E1E0E0D9
                D7D8E0DFE0BDBABBA4A09FB2AEAD7574B25A5AD46060D66060D66060D66060D6
                6060D66060D66060D66060D65A5AD45555CDD9D8DC00B8B5B5A09E9E706B6D83
                7E80959192A5A1A1B3AFAFC0BCBB7C7BBC5454D35454D35454D35454D35454D3
                5454D35454D35454D35454D35454D35252D27575CD00ADAAAA726D6F86818297
                9394A7A3A2B5B1B0C1BDBCCBC9C78281C44D4DD14747D04747D04747D04747D0
                4747D04747D04747D04747D04949D05E5ED1D9D8DC007A7577878384999595A8
                A4A4B6B2B1C2BFBDCCCAC8D5D3D28786CC5252D24949D04949D04949D04949D0
                4141CE3939CC3939CC4141CE6262D3D9D8DC8300E500817C7D9B9797AAA6A6B8
                B4B3C3C0BFCDCBC9D6D4D2DDDCDACDCCDDCCCBE3CECDE6D0CFE8D0D0E89F9EDE
                5555D33232C23D3DCD6968CFD9D8DC8300E58300E5008F8B8BACA8A7B9B5B4C4
                C1C0CFCCCAD7D5D3DEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECEEEDECB9B8CE
                5757D43737CB7574D6B5B2B78300E58300E58300E5009B9797BAB7B6C6C3C1CF
                CDCBD8D6D4DFDDDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECEEEDECECEBEAD0CFD9
                6F6FDA9493DACCCBCEBAB8B78300E58300E58300E500A6A2A1C7C4C2D1CECCD9
                D7D5DFDEDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3E1
                DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E500AFACABD1CFCDD9D8D6E0
                DFDDE5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDCDA
                D6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E500B7B4B3DAD9D7E1DFDEE5
                E4E3EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E8E6E5E3E1E0DDDBDAD5D3D2
                CCCAC8C2BFBEB7B3B2A8A4A48300E58300E58300E500BDBABAE1E0DEE5E4E3EA
                E9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5E2E1DFDCDAD9D5D3D1CCC9C7
                C1BEBCB5B1B0A7A3A39F9C9C8300E58300E58300E500C2C0BFE7E6E5EBEAE9ED
                ECEBEEEDECEEEDECEDECEBEAE9E8E5E4E3E2E0DFDBDAD8D4D2D0CAC8C6C0BCBB
                B4B0AFA6A2A19692929692928300E58300E58300E500C6C4C3EBEAE9EDECEBEE
                EDECEEEDECEDECEBEAE9E8E5E4E3E1DFDEDAD9D7D3D1CFC9C7C5BEBBBAB2AEAE
                A4A0A0949090827D7F8B87888300E58300E58300E500C9C7C6EDECECEEEDECEE
                EDECECEBEBEAE9E7E5E4E3E0DFDDDAD8D6D2D0CEC8C6C4BDBAB9B1ADACA29E9E
                928E8E807B7D6C6769807C7C8300E58300E58300E500CAC8C8EEEDECEEEDECEC
                EBEAE9E8E7E5E4E3DFDEDCD9D7D5D1CFCDC7C4C2BCB8B7AFABABA19D9C908C8D
                7D797A6A6566555051736F708300E58300E58300E500B0ADADCAC8C8C9C7C7C7
                C5C4C4C2C1C0BDBDBBB8B7B5B2B1AEAAA9A5A1A19C9897918D8D858081777273
                6863645853544642436D6A6A8300E58300E58300E5000000}
              TabOrder = 14
              OnClick = btnRemoveEnderecoClick
              Appearance.ColorChecked = 16111818
              Appearance.ColorCheckedTo = 16367008
              Appearance.ColorDisabled = 15921906
              Appearance.ColorDisabledTo = 15921906
              Appearance.ColorDown = 16111818
              Appearance.ColorDownTo = 16367008
              Appearance.ColorHot = 16117985
              Appearance.ColorHotTo = 16372402
              Appearance.ColorMirrorHot = 16107693
              Appearance.ColorMirrorHotTo = 16775412
              Appearance.ColorMirrorDown = 16102556
              Appearance.ColorMirrorDownTo = 16768988
              Appearance.ColorMirrorChecked = 16102556
              Appearance.ColorMirrorCheckedTo = 16768988
              Appearance.ColorMirrorDisabled = 11974326
              Appearance.ColorMirrorDisabledTo = 15921906
            end
            object GroupBox2: TGroupBox
              Left = 487
              Top = 195
              Width = 288
              Height = 89
              Caption = 'Dados banc'#225'rios'
              TabOrder = 15
              object Label15: TLabel
                Left = 12
                Top = 29
                Width = 35
                Height = 13
                Caption = 'Banco'
              end
              object Label16: TLabel
                Left = 151
                Top = 29
                Width = 19
                Height = 13
                Caption = 'Ag.'
              end
              object Label17: TLabel
                Left = 12
                Top = 58
                Width = 34
                Height = 13
                Caption = 'Conta'
              end
              object DBEdit9: TDBEdit
                Left = 57
                Top = 24
                Width = 84
                Height = 21
                DataField = 'BANCO'
                DataSource = dtsDadosFinanceiro
                TabOrder = 0
              end
              object DBEdit11: TDBEdit
                Left = 179
                Top = 24
                Width = 96
                Height = 21
                DataField = 'AGENCIA'
                DataSource = dtsDadosFinanceiro
                TabOrder = 1
              end
              object DBEdit12: TDBEdit
                Left = 56
                Top = 55
                Width = 121
                Height = 21
                DataField = 'CONTA'
                DataSource = dtsDadosFinanceiro
                TabOrder = 2
              end
            end
            object DBMemo1: TDBMemo
              Left = 11
              Top = 531
              Width = 757
              Height = 89
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 16
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 724
    Width = 836
    ExplicitTop = 724
    ExplicitWidth = 836
    inherited _imageBottom: TImage
      Width = 836
      ExplicitWidth = 769
    end
    inherited _ToolBar: TToolBar
      Left = 44
      ExplicitLeft = 44
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    object actPrintFicha: TAction
      Category = 'Print'
      Caption = 'Imprimir Ficha'
      OnExecute = actPrintFichaExecute
    end
    object actPrintAll: TAction
      Category = 'Print'
      Caption = 'Lista Completa'
      OnExecute = actPrintAllExecute
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsEntidade
    OnDataChange = dtsFichaDataChange
    Left = 545
    Top = 65530
  end
  inherited dtsLista: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsLstEntidades
    Left = 503
    Top = 65530
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 229
    Top = 8
    object N1: TMenuItem
      Caption = '-'
    end
    object ImprimirFicha1: TMenuItem
      Action = actPrintFicha
    end
    object ListaCompleta1: TMenuItem
      Action = actPrintAll
    end
  end
  inherited _popMenuOther: TPopupMenu
    Left = 311
    Top = 7
  end
  object dtsEndereco: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsEndereco
    Left = 600
    Top = 65530
  end
  object dtsEnderecoCobranca: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsEnderecoCobranca
    Left = 633
    Top = 65530
  end
  object dtsEnderecoEntrega: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsEnderecoEntrega
    Left = 665
    Top = 65530
  end
  object dtsOutrosEnderecos: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsOutrosEnderecos
    Left = 697
    Top = 65530
  end
  object dtsContatos: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsContatos
    Left = 731
    Top = 65530
  end
  object dtsDadosFinanceiro: TDataSource
    DataSet = dtmCAD_Fornecedores.cdsDadosFinanceiro
    Left = 664
    Top = 87
  end
end
