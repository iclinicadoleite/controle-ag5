inherited frmCAD_Fazendas: TfrmCAD_Fazendas
  Left = 349
  Top = 165
  Caption = 'Fazenda'
  ClientHeight = 584
  OnShow = TcFormShow
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Height = 519
    ActivePage = _tbsFicha
    ExplicitHeight = 519
    inherited _tbsLista: TTabSheet
      ExplicitHeight = 491
      inherited _pnldbgLista: TPanel
        Height = 453
        ExplicitHeight = 453
        inherited _dbgLista: TJvDBUltimGrid
          Height = 449
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 491
      inherited _pnlFicha: TPanel
        Height = 491
        Constraints.MinHeight = 213
        ExplicitHeight = 491
        inherited _ScrollBoxFicha: TScrollBox
          Height = 491
          ExplicitHeight = 491
          inherited _pnlScroll: TPanel
            Height = 491
            ExplicitHeight = 491
            object Label24: TLabel
              Left = 6
              Top = 39
              Width = 100
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome da fazenda'
              FocusControl = DBEdit27
              Transparent = True
            end
            object Label28: TLabel
              Left = 6
              Top = 249
              Width = 47
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'E-mail 1'
            end
            object Label4: TLabel
              Left = 6
              Top = 10
              Width = 67
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Propriet'#225'rio'
              FocusControl = DBEdit3
            end
            object Label9: TLabel
              Left = 246
              Top = 126
              Width = 14
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'UF'
              FocusControl = DBEdit9
            end
            object Label8: TLabel
              Left = 6
              Top = 126
              Width = 40
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Cidade'
              FocusControl = DBEdit8
            end
            object Label3: TLabel
              Left = 6
              Top = 310
              Width = 79
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome contato'
              FocusControl = DBEdit2
            end
            object Label13: TLabel
              Left = 6
              Top = 187
              Width = 59
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Telefone 1'
              FocusControl = DBEdit12
            end
            object Label14: TLabel
              Left = 6
              Top = 218
              Width = 59
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Telefone 2'
              FocusControl = DBEdit13
            end
            object Label16: TLabel
              Left = 6
              Top = 157
              Width = 100
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Ra'#231'a dos animais'
              FocusControl = DBLookupComboBox1
            end
            object Label10: TLabel
              Left = 6
              Top = 334
              Width = 117
              Height = 26
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'C'#243'digo do cliente no sistema da cl'#237'nica'
              FocusControl = DBEdit11
              WordWrap = True
            end
            object Label15: TLabel
              Left = 443
              Top = 3
              Width = 48
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Logotipo'
              FocusControl = DBImage1
            end
            object Label1: TLabel
              Left = 6
              Top = 279
              Width = 47
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'E-mail 2'
            end
            object lblCNPCNPJ: TLabel
              Left = 5
              Top = 96
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
            object Label29: TLabel
              Left = 6
              Top = 65
              Width = 40
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Pessoa'
            end
            object Label2: TLabel
              Left = 6
              Top = 372
              Width = 70
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Cooperativa'
              FocusControl = DBLookupComboBox2
            end
            object DBEdit31: TDBEdit
              Left = 136
              Top = 246
              Width = 249
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'EMAIL1'
              DataSource = dtsFicha
              TabOrder = 9
            end
            object DBEdit27: TDBEdit
              Left = 136
              Top = 36
              Width = 179
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOME'
              DataSource = dtsEntidade
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 136
              Top = 7
              Width = 162
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'PROPRIETARIO'
              DataSource = dtsFicha
              TabOrder = 0
            end
            object DBEdit9: TDBEdit
              Left = 273
              Top = 123
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
            object DBEdit8: TDBEdit
              Left = 136
              Top = 123
              Width = 87
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
            object DBEdit2: TDBEdit
              Left = 136
              Top = 307
              Width = 162
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOMECONTATO'
              DataSource = dtsFicha
              TabOrder = 11
            end
            object DBEdit12: TDBEdit
              Left = 136
              Top = 184
              Width = 101
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'TELEFONE1'
              DataSource = dtsFicha
              MaxLength = 14
              TabOrder = 7
            end
            object DBEdit13: TDBEdit
              Left = 136
              Top = 215
              Width = 101
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'TELEFONE2'
              DataSource = dtsFicha
              MaxLength = 14
              TabOrder = 8
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 136
              Top = 154
              Width = 249
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_RACA'
              DataSource = dtsFicha
              TabOrder = 6
            end
            object DBEdit11: TDBEdit
              Left = 136
              Top = 338
              Width = 181
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'CODIGOCLINICA'
              DataSource = dtsFicha
              ReadOnly = True
              TabOrder = 12
            end
            object DBImage1: TJvDBImage
              Left = 443
              Top = 16
              Width = 95
              Height = 70
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'LOGO'
              DataSource = dtsFicha
              TabOrder = 14
              TabStop = False
              ShowNameIfEmpty = False
              Transparent = True
            end
            object Button2: TTcGDIButton
              Left = 569
              Top = 24
              Width = 123
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Action = actAlterarLogotipo
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 15
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
            object DBEdit1: TDBEdit
              Left = 136
              Top = 276
              Width = 249
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'EMAIL2'
              DataSource = dtsFicha
              TabOrder = 10
            end
            object Button3: TTcGDIButton
              Left = 569
              Top = 53
              Width = 123
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Action = actLimparLogotipo
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 16
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
            object dbeCPF_CNPJ: TDBEdit
              Left = 137
              Top = 93
              Width = 126
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'CPF_CNPJ'
              DataSource = dtsEntidade
              TabOrder = 3
            end
            object cbTipoPessoa: TJvDBComboBox
              Left = 136
              Top = 64
              Width = 109
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'PESSOA'
              DataSource = dtsEntidade
              Items.Strings = (
                'F'#237'sica'
                'Jur'#237'dica')
              TabOrder = 2
              Values.Strings = (
                'F'
                'J')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 136
              Top = 369
              Width = 249
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESCR_COOPERATIVA'
              DataSource = dtsFicha
              TabOrder = 13
            end
            object Button1: TTcGDIButton
              Left = 493
              Top = 366
              Width = 194
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Action = actAlterarPermissaoUsuarios
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 17
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
            object dbgIn: TDBGrid
              Left = 443
              Top = 123
              Width = 247
              Height = 236
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataSource = dtsUsuarios
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 18
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'LOGIN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Width = 146
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 519
    ExplicitTop = 519
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNew: TAction
      Enabled = False
    end
    inherited _actDelete: TAction
      Enabled = False
    end
    object actAlterarLogotipo: TAction
      Category = 'Edit'
      Caption = 'Alterar logotipo'
      OnExecute = actAlterarLogotipoExecute
      OnUpdate = actAlterarLogotipoUpdate
    end
    object actLimparLogotipo: TAction
      Category = 'Edit'
      Caption = 'Limpar logotipo'
      OnExecute = actLimparLogotipoExecute
      OnUpdate = actLimparLogotipoUpdate
    end
    object actAlterarPermissaoUsuarios: TAction
      Category = 'Edit'
      Caption = 'Alterar permiss'#227'o de usu'#225'rios'
      OnExecute = actAlterarPermissaoUsuariosExecute
      OnUpdate = actAlterarPermissaoUsuariosUpdate
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmCAD_Fazendas.cdsFazenda
    Left = 550
  end
  inherited dtsLista: TDataSource
    DataSet = dtmCAD_Fazendas.cdsLstFazendas
    Left = 518
  end
  object dtsEndereco: TDataSource
    DataSet = dtmCAD_Fazendas.cdsEndereco
    Left = 613
    Top = 24
  end
  object dtsEntidade: TDataSource
    DataSet = dtmCAD_Fazendas.cdsEntidade
    OnDataChange = dtsEntidadeDataChange
    Left = 581
    Top = 24
  end
  object dtsUsuarios: TDataSource
    DataSet = dtmCAD_Fazendas.cdsUsuarios
    Left = 648
    Top = 24
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 636
    Top = 67
  end
end
