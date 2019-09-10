inherited frmCAD_Entidades: TfrmCAD_Entidades
  Left = 350
  Top = 76
  Caption = 'Cliente/Fornecedor'
  ExplicitLeft = 350
  ExplicitTop = 76
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    inherited _tbsLista: TTabSheet
      inherited _pnlSearch: TPanel
        Height = 50
        ExplicitHeight = 50
        object Label3: TLabel [1]
          Left = 7
          Top = 30
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
          Left = 73
          Top = 28
          Width = 64
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Clientes'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = cbxInativosClick
        end
        object cbxFornecedores: TCheckBox
          Left = 148
          Top = 28
          Width = 93
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Fornecedores'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          OnClick = cbxInativosClick
        end
        object cbxFuncionarios: TCheckBox
          Left = 527
          Top = 28
          Width = 82
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Funcion'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = cbxInativosClick
        end
        object cbxTransportadora: TCheckBox
          Left = 255
          Top = 28
          Width = 107
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Transportadoras'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 4
          OnClick = cbxInativosClick
        end
        object cbxInativos: TCheckBox
          Left = 386
          Top = 28
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
          TabOrder = 5
          OnClick = cbxInativosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 50
        Height = 303
        ExplicitTop = 50
        ExplicitHeight = 303
        inherited _dbgLista: TJvDBUltimGrid
          Tag = 99
          Height = 299
          Constraints.MinHeight = 109
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELIDO'
              Title.Caption = 'Apelido'
              Width = 252
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome/Raz'#227'o social'
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Caption = 'CPF/CNPJ'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 51
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      inherited _pnlFicha: TPanel
        Constraints.MinHeight = 213
        FullRepaint = False
        inherited _ScrollBoxFicha: TScrollBox
          inherited _pnlScroll: TPanel
            object lblRGIE: TLabel
              Left = 353
              Top = 52
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
              Top = 3
              Width = 35
              Height = 12
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'C'#243'digo'
              FocusControl = dbeCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 7
              Top = 104
              Width = 91
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Relacionamento'
              Transparent = True
            end
            object Label24: TLabel
              Left = 549
              Top = 3
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
              Top = 76
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
              Left = 353
              Top = 76
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
              Left = 276
              Top = 127
              Width = 104
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'p'#225'gina na internet'
              FocusControl = dbeCodigo
            end
            object Label28: TLabel
              Left = 7
              Top = 129
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
              Left = 353
              Top = 3
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
              Top = 52
              Width = 81
              Height = 12
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              Caption = 'Nome fantasia'
              Transparent = True
            end
            object lblCNPCNPJ: TLabel
              Left = 353
              Top = 27
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
              Top = 27
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
            object dbeCPF_CNPJ: TDBEdit
              Left = 396
              Top = 24
              Width = 126
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'CPF_CNPJ'
              DataSource = dtsFicha
              TabOrder = 5
              OnExit = dbeCPF_CNPJExit
            end
            object cbCliente: TJvDBCheckBox
              Left = 96
              Top = 103
              Width = 78
              Height = 16
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Cliente'
              DataField = 'IS_CLIENTE'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object cbFornecedor: TJvDBCheckBox
              Left = 168
              Top = 103
              Width = 90
              Height = 16
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Fornecedor'
              DataField = 'IS_FORNECEDOR'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object cbFuncionario: TJvDBCheckBox
              Left = 498
              Top = 103
              Width = 84
              Height = 16
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Funcion'#225'rio'
              DataField = 'IS_FUNCIONARIO'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              ValueChecked = 'T'
              ValueUnchecked = 'F'
              Visible = False
            end
            object cbTransportadora: TJvDBCheckBox
              Left = 274
              Top = 103
              Width = 118
              Height = 16
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Transportadora'
              DataField = 'IS_TRANSPORTADORA'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object cbTipoPessoa: TJvDBComboBox
              Left = 396
              Top = 0
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
              Left = 592
              Top = 0
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
              Left = 396
              Top = 124
              Width = 196
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'URL'
              DataSource = dtsFicha
              TabOrder = 14
            end
            object DBEdit32: TDBEdit
              Left = 396
              Top = 74
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
              Left = 50
              Top = 124
              Width = 198
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'EMAIL'
              DataSource = dtsFicha
              TabOrder = 13
            end
            object DBEdit29: TDBEdit
              Left = 396
              Top = 50
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
              Left = 91
              Top = 74
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
              Left = 91
              Top = 24
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
              Left = 91
              Top = 50
              Width = 230
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'APELIDO'
              DataSource = dtsFicha
              TabOrder = 4
            end
            object dbeCodigo: TDBEdit
              Left = 90
              Top = 0
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
              Top = 147
              Width = 681
              Height = 162
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              ActivePage = TabSheet1
              TabOrder = 15
              object TabSheet1: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Endere'#231'o'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label5: TLabel
                  Left = 4
                  Top = 43
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
                  Left = 46
                  Top = 68
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
                  Left = 56
                  Top = 99
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
                  Left = 209
                  Top = 69
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
                  Left = 382
                  Top = 69
                  Width = 14
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'UF'
                  FocusControl = DBEdit9
                end
                object Label11: TLabel
                  Left = 206
                  Top = 99
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
                  Left = 369
                  Top = 15
                  Width = 19
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'No.'
                  FocusControl = DBEdit9
                end
                object Label2: TLabel
                  Left = 28
                  Top = 15
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
                  Left = 402
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
                object DBEdit9: TDBEdit
                  Left = 405
                  Top = 66
                  Width = 31
                  Height = 19
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'UF'
                  DataSource = dtsEndereco
                  TabOrder = 5
                end
                object DBEdit4: TDBEdit
                  Left = 92
                  Top = 13
                  Width = 267
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
                  Left = 91
                  Top = 41
                  Width = 349
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
                  Left = 91
                  Top = 66
                  Width = 109
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
                  Left = 91
                  Top = 97
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
                  Left = 262
                  Top = 66
                  Width = 94
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
                  Left = 263
                  Top = 97
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
              end
              object TabSheet2: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Outros endere'#231'os'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object JvDBUltimGrid1: TJvDBUltimGrid
                  Left = 0
                  Top = 0
                  Width = 675
                  Height = 137
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
                  EditControls = <>
                  RowsHeight = 16
                  TitleRowHeight = 17
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ENDERECO'
                      Width = 218
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
              end
            end
          end
        end
      end
    end
  end
  inherited dtsFicha: TDataSource
    OnDataChange = dtsFichaDataChange
    Left = 568
    Top = 13
  end
  inherited dtsLista: TDataSource
    Left = 537
    Top = 13
  end
  object dtsEndereco: TDataSource
    DataSet = dtmCAD_Entidades.cdsEndereco
    Left = 600
    Top = 13
  end
  object dtsEnderecoCobranca: TDataSource
    DataSet = dtmCAD_Entidades.cdsEnderecoCobranca
    Left = 633
    Top = 13
  end
  object dtsEnderecoEntrega: TDataSource
    DataSet = dtmCAD_Entidades.cdsEnderecoEntrega
    Left = 665
    Top = 13
  end
  object dtsOutrosEnderecos: TDataSource
    DataSet = dtmCAD_Entidades.cdsOutrosEnderecos
    Left = 697
    Top = 13
  end
  object dtsContatos: TDataSource
    DataSet = dtmCAD_Entidades.cdsContatos
    Left = 731
    Top = 13
  end
end
