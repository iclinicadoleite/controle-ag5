inherited frmCAD_Funcionarios: TfrmCAD_Funcionarios
  Left = 443
  Top = 154
  Caption = 'Funcion'#225'rios'
  ClientHeight = 617
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Height = 552
    ActivePage = _tbsFicha
    ExplicitHeight = 552
    inherited _tbsLista: TTabSheet
      ExplicitHeight = 524
      inherited _pnlSearch: TPanel
        Height = 50
        ExplicitHeight = 50
        object Label3: TLabel [1]
          Left = 5
          Top = 28
          Width = 39
          Height = 12
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Filtros :'
          FocusControl = _edtSearch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object cbxClientes: TCheckBox
          Left = 240
          Top = 26
          Width = 64
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = cbxInativosClick
        end
        object cbxFornecedores: TCheckBox
          Left = 410
          Top = 26
          Width = 93
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Fornecedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = cbxInativosClick
        end
        object cbxFuncionarios: TCheckBox
          Left = 312
          Top = 26
          Width = 83
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Funcion'#225'rios'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 2
          Visible = False
          OnClick = cbxInativosClick
        end
        object cbxTransportadora: TCheckBox
          Left = 517
          Top = 26
          Width = 107
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Transportadoras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnClick = cbxInativosClick
        end
        object cbxInativos: TCheckBox
          Left = 72
          Top = 27
          Width = 65
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
          TabOrder = 5
          OnClick = cbxInativosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 50
        Height = 474
        ExplicitTop = 50
        ExplicitHeight = 474
        inherited _dbgLista: TJvDBUltimGrid
          Tag = 99
          Height = 470
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELIDO'
              Width = 276
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome/Raz'#227'o social'
              Width = 166
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Caption = 'CPF/CNPJ'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 23
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 524
      inherited _pnlFicha: TPanel
        Height = 524
        Constraints.MinHeight = 213
        FullRepaint = False
        ExplicitHeight = 524
        inherited _ScrollBoxFicha: TScrollBox
          Height = 524
          ExplicitHeight = 524
          inherited _pnlScroll: TPanel
            Height = 524
            ExplicitHeight = 524
            object lblRGIE: TLabel
              Left = 361
              Top = 70
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
              Top = 11
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
              Left = 554
              Top = 10
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
              Top = 99
              Width = 72
              Height = 12
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'Fone'
              Transparent = True
            end
            object Label26: TLabel
              Left = 361
              Top = 99
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
            object Label28: TLabel
              Left = 7
              Top = 128
              Width = 31
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'email'
              FocusControl = dbeCodigo
            end
            object Label29: TLabel
              Left = 361
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
              Top = 70
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
              Left = 361
              Top = 40
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
              Top = 40
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
            object Label4: TLabel
              Left = 8
              Top = 362
              Width = 78
              Height = 13
              Caption = 'Observa'#231#245'es '
            end
            object dbeCPF_CNPJ: TDBEdit
              Left = 419
              Top = 37
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
              Left = 419
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
              Left = 603
              Top = 7
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
              TabStop = False
              Values.Strings = (
                'T'
                'F')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBEdit32: TDBEdit
              Left = 419
              Top = 96
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
              Left = 103
              Top = 125
              Width = 198
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
              Left = 419
              Top = 67
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
              Left = 103
              Top = 96
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
              Left = 103
              Top = 37
              Width = 230
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
              Left = 103
              Top = 67
              Width = 230
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
              Left = 103
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
              Top = 162
              Width = 681
              Height = 162
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = TabSheet2
              TabOrder = 10
              object TabSheet1: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Endere'#231'o'
                object Label5: TLabel
                  Left = 4
                  Top = 44
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
                  Left = 291
                  Top = 44
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
                  Left = 61
                  Top = 101
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
                  Left = 44
                  Top = 72
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
                  Left = 542
                  Top = 72
                  Width = 14
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'UF'
                end
                object Label11: TLabel
                  Left = 250
                  Top = 101
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
                  Left = 559
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
                  Left = 31
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
                object DBEdit1: TDBEdit
                  Left = 584
                  Top = 13
                  Width = 34
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
                  Width = 448
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
                  Top = 41
                  Width = 185
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
                  Left = 337
                  Top = 41
                  Width = 281
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
                  Top = 98
                  Width = 85
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
                  Top = 69
                  Width = 434
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
                  Left = 315
                  Top = 98
                  Width = 88
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
                  Left = 566
                  Top = 69
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
                  Width = 673
                  Height = 134
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
                      ControlName = 'JvDBComboBox2'
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
                    end>
                end
                object JvDBComboBox2: TJvDBComboBox
                  Left = 568
                  Top = 53
                  Width = 52
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
            object BitBtn2: TTcGDIButton
              Left = 566
              Top = 329
              Width = 122
              Height = 30
              Caption = 'Remover '#237'tem selecionado'
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
                000002050000120B0000120B000000000000000000008300E58300E58300E5B3
                B0AFBFBDBC6967A83636B1A3A0A5A4A09F9A96968F8B8B837E7F7D797A949192
                BBB8B8B4B2B1BAB8B8DDDBDB8300E58300E58300E5008300E58300E58300E5C6
                C3C37171BF6060D65757D4A3A2B7C6C3C1BBB7B6ADA9A99E9A9A8D898A7B7678
                716C6DD4D3D2E4E2E1ADAAA9C4C2C18300E58300E5008300E58300E58300E568
                67B76D6DD97D7DDD5555D38887ADA5A2B79D9BB09592A88B889E98949A908B8C
                7D787A989495F1F1F0E5E4E3C1BEBDC2C0C08300E5008300E5D9D8DC7676D064
                64D76F6FDA6F6FDA5F5FD65151D25151D25151D25151D24C4CD16D6BA8A29E9E
                918D8EA09D9EFAF9F9F2F2F1E7E6E5AEABAAD4D3D200D9D8DC5555CD5A5AD460
                60D66060D66060D66060D66060D66060D66060D66060D65A5AD47574B2B2AEAD
                A4A09FBDBABBE0DFE0D9D7D8E1E0E0E8E7E6AAA8A7007575CD5252D25454D354
                54D35454D35454D35454D35454D35454D35454D35454D35454D37C7BBCC0BCBB
                B3AFAFA5A1A1959192837E80706B6DA09E9EB8B5B500D9D8DC5E5ED14949D047
                47D04747D04747D04747D04747D04747D04747D04747D04D4DD18281C4CBC9C7
                C1BDBCB5B1B0A7A3A2979394868182726D6FADAAAA008300E5D9D8DC6262D341
                41CE3939CC3939CC4141CE4949D04949D04949D04949D05252D28786CCD5D3D2
                CCCAC8C2BFBDB6B2B1A8A4A49995958783847A7577008300E58300E5D9D8DC69
                68CF3D3DCD3232C25555D39F9EDED0D0E8D0CFE8CECDE6CCCBE3CDCCDDDDDCDA
                D6D4D2CDCBC9C3C0BFB8B4B3AAA6A69B9797817C7D008300E58300E58300E5B5
                B2B77574D63737CB5757D4B9B8CEEEEDECEEEDECEDECECEBEAEAE8E7E6E4E2E1
                DEDCDBD7D5D3CFCCCAC4C1C0B9B5B4ACA8A78F8B8B008300E58300E58300E5BA
                B8B7CCCBCE9493DA6F6FDAD0CFD9ECEBEAEEEDECEEEDECEEEDECECEBEAE9E8E7
                E5E4E3DFDDDCD8D6D4CFCDCBC6C3C1BAB7B69B9797008300E58300E58300E5B5
                B2B2CFCCCBD7D5D4DEDDDBE4E3E1E8E7E6ECEBEAEDECECEEEDECEEEDECECEBEA
                E9E8E7E5E4E3DFDEDCD9D7D5D1CECCC7C4C2A6A2A1008300E58300E58300E5AF
                ACABC3C0BFCECBCAD6D4D3DDDCDAE3E2E1E8E7E6EBEAE9EDECECEEEDECEEEDEC
                ECEBEBEAE9E7E5E4E3E0DFDDD9D8D6D1CFCDAFACAB008300E58300E58300E5A8
                A4A4B7B3B2C2BFBECCCAC8D5D3D2DDDBDAE3E1E0E8E6E5EBEAE9EDECEBEEEDEC
                EEEDECEDECEBEAE9E8E5E4E3E1DFDEDAD9D7B7B4B3008300E58300E58300E59F
                9C9CA7A3A3B5B1B0C1BEBCCCC9C7D5D3D1DCDAD9E2E1DFE7E6E5EBEAE9EDECEB
                EEEDECEEEDECEDECEBEAE9E8E5E4E3E1E0DEBDBABA008300E58300E58300E596
                9292969292A6A2A1B4B0AFC0BCBBCAC8C6D4D2D0DBDAD8E2E0DFE5E4E3EAE9E8
                EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5C2C0BF008300E58300E58300E58B
                8788827D7F949090A4A0A0B2AEAEBEBBBAC9C7C5D3D1CFDAD9D7E1DFDEE5E4E3
                EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9C6C4C3008300E58300E58300E580
                7C7C6C6769807B7D928E8EA29E9EB1ADACBDBAB9C8C6C4D2D0CEDAD8D6E0DFDD
                E5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECC9C7C6008300E58300E58300E573
                6F705550516A65667D797A908C8DA19D9CAFABABBCB8B7C7C4C2D1CFCDD9D7D5
                DFDEDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECCAC8C8008300E58300E58300E56D
                6A6A464243585354686364777273858081918D8D9C9897A5A1A1AEAAA9B5B2B1
                BBB8B7C0BDBDC4C2C1C7C5C4C9C7C7CAC8C8B0ADAD000000}
              TabOrder = 11
              OnClick = BitBtn2Click
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
            object DBMemo1: TDBMemo
              Left = 14
              Top = 383
              Width = 667
              Height = 89
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 12
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 552
    ExplicitTop = 552
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsEntidade
    OnDataChange = dtsFichaDataChange
    Left = 568
    Top = 56
  end
  inherited dtsLista: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsLstEntidades
    Left = 537
    Top = 56
  end
  object dtsEndereco: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsEndereco
    Left = 600
    Top = 56
  end
  object dtsEnderecoCobranca: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsEnderecoCobranca
    Left = 633
    Top = 56
  end
  object dtsEnderecoEntrega: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsEnderecoEntrega
    Left = 665
    Top = 56
  end
  object dtsOutrosEnderecos: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsOutrosEnderecos
    Left = 697
    Top = 56
  end
  object dtsContatos: TDataSource
    DataSet = dtmCAD_Funcionarios.cdsContatos
    Left = 731
    Top = 56
  end
end
