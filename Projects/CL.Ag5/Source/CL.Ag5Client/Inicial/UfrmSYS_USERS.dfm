inherited frmSYS_USERS: TfrmSYS_USERS
  Left = 342
  Top = 319
  Caption = 'Usu'#225'rios'
  ClientHeight = 769
  ExplicitHeight = 808
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Height = 704
    ActivePage = _tbsFicha
    ExplicitHeight = 704
    inherited _tbsLista: TTabSheet
      ExplicitHeight = 676
      inherited _pnlSearch: TPanel
        inherited _lblPesquisas: TLabel
          Width = 55
          Caption = 'Pesquisar'
          ExplicitWidth = 55
        end
      end
      inherited _pnldbgLista: TPanel
        Height = 638
        ExplicitHeight = 638
        inherited _dbgLista: TJvDBUltimGrid
          Height = 634
          Constraints.MinHeight = 109
          DrawingStyle = gdsThemed
          Columns = <
            item
              Expanded = False
              FieldName = 'LOGIN'
              Title.Caption = 'Usu'#225'rio'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELIDO'
              Title.Caption = 'Nome'
              Width = 191
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome completo'
              Width = 296
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 52
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 676
      inherited _pnlFicha: TPanel
        Height = 676
        Constraints.MinHeight = 213
        ExplicitHeight = 676
        inherited _ScrollBoxFicha: TScrollBox
          Height = 676
          ExplicitHeight = 676
          inherited _pnlScroll: TPanel
            Height = 676
            Font.Height = -12
            Font.Name = 'DINPro-Regular'
            ExplicitHeight = 676
            object Label3: TLabel
              Left = 11
              Top = 41
              Width = 33
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Senha'
              FocusControl = dbEditPassword
            end
            object Label24: TLabel
              Left = 11
              Top = 104
              Width = 85
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome completo'
              FocusControl = DBEdit27
              Transparent = True
            end
            object Label2: TLabel
              Left = 11
              Top = 11
              Width = 41
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Usu'#225'rio'
              FocusControl = dbEditLogin
            end
            object Label28: TLabel
              Left = 11
              Top = 157
              Width = 36
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'E-mail'
            end
            object Label5: TLabel
              Left = 11
              Top = 220
              Width = 76
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Complemento'
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 11
              Top = 251
              Width = 33
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Bairro'
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 11
              Top = 283
              Width = 23
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'CEP'
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 273
              Top = 251
              Width = 37
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Cidade'
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 430
              Top = 251
              Width = 15
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'UF'
              FocusControl = DBEdit9
            end
            object Label11: TLabel
              Left = 259
              Top = 283
              Width = 51
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Cx.Postal'
              FocusControl = DBEdit10
            end
            object Label1: TLabel
              Left = 430
              Top = 189
              Width = 18
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'No.'
              FocusControl = DBEdit9
            end
            object Label4: TLabel
              Left = 11
              Top = 189
              Width = 50
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Endere'#231'o'
              FocusControl = DBEdit4
            end
            object Label10: TLabel
              Left = 11
              Top = 73
              Width = 32
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Nome'
              FocusControl = DBEdit11
              Transparent = True
            end
            object Label12: TLabel
              Left = 60
              Top = 428
              Width = 111
              Height = 15
              Caption = 'Gerencial Zoot'#233'cnico'
              Visible = False
            end
            object Label13: TLabel
              Left = 60
              Top = 460
              Width = 110
              Height = 15
              Caption = 'Gerencial Financeiro'
              Visible = False
            end
            object Label14: TLabel
              Left = 60
              Top = 493
              Width = 50
              Height = 15
              Caption = 'Monitoria'
              Visible = False
            end
            object Label15: TLabel
              Left = 60
              Top = 526
              Width = 62
              Height = 15
              Caption = 'Indicadores'
              Visible = False
            end
            object Label16: TLabel
              Left = 60
              Top = 371
              Width = 73
              Height = 15
              Caption = 'Portal Cl'#237'nica'
            end
            object Label17: TLabel
              Left = 60
              Top = 557
              Width = 117
              Height = 15
              Caption = 'Caixa de Ferramentas'
              Visible = False
            end
            object Shape1: TShape
              Left = 16
              Top = 326
              Width = 700
              Height = 1
            end
            object Label18: TLabel
              Left = 255
              Top = 320
              Width = 265
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = ' Configura'#231'oes de acesso aos m'#243'dulos adicionais '
              FocusControl = DBEdit7
              Transparent = False
            end
            object Label19: TLabel
              Left = 248
              Top = 388
              Width = 44
              Height = 15
              Caption = 'Dom'#237'nio'
              Visible = False
            end
            object Label20: TLabel
              Left = 235
              Top = 342
              Width = 30
              Height = 15
              Caption = 'Login'
            end
            object Label21: TLabel
              Left = 415
              Top = 342
              Width = 33
              Height = 15
              Caption = 'Senha'
            end
            object dbEditEmail: TDBEdit
              Left = 106
              Top = 154
              Width = 300
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'EMAIL'
              DataSource = dtsFicha
              TabOrder = 5
            end
            object dbEditPassword: TDBEdit
              Left = 106
              Top = 38
              Width = 199
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'USERPASSWORD'
              DataSource = dtsFicha
              PasswordChar = 'o'
              TabOrder = 1
            end
            object DBEdit27: TDBEdit
              Left = 106
              Top = 101
              Width = 180
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'NOME'
              DataSource = dtsEntidade
              TabOrder = 3
            end
            object dbEditLogin: TDBEdit
              Left = 106
              Top = 8
              Width = 199
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              CharCase = ecLowerCase
              DataField = 'LOGIN'
              DataSource = dtsFicha
              TabOrder = 0
            end
            object btnAlterarPermissoes: TTcGDIButton
              Left = 565
              Top = 152
              Width = 137
              Height = 25
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Alterar Permiss'#245'es'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 15
              OnClick = btnAlterarPermissoesClick
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
              Left = 462
              Top = 186
              Width = 84
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'NUMERO'
              DataSource = dtsEndereco
              TabOrder = 7
            end
            object DBEdit9: TDBEdit
              Left = 462
              Top = 248
              Width = 30
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'UF'
              DataSource = dtsEndereco
              TabOrder = 11
            end
            object DBEdit4: TDBEdit
              Left = 106
              Top = 186
              Width = 301
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'ENDERECO'
              DataSource = dtsEndereco
              TabOrder = 6
            end
            object DBEdit5: TDBEdit
              Left = 106
              Top = 217
              Width = 300
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'COMPLEMENTO'
              DataSource = dtsEndereco
              TabOrder = 8
            end
            object DBEdit6: TDBEdit
              Left = 106
              Top = 248
              Width = 157
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'BAIRRO'
              DataSource = dtsEndereco
              TabOrder = 9
            end
            object DBEdit7: TDBEdit
              Left = 106
              Top = 280
              Width = 83
              Height = 19
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'CEP'
              DataSource = dtsEndereco
              TabOrder = 12
            end
            object DBEdit8: TDBEdit
              Left = 321
              Top = 248
              Width = 86
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'CIDADE'
              DataSource = dtsEndereco
              TabOrder = 10
            end
            object DBEdit10: TDBEdit
              Left = 319
              Top = 280
              Width = 88
              Height = 19
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'CXPOSTAL'
              DataSource = dtsEndereco
              TabOrder = 13
            end
            object cbFuncionario: TJvDBCheckBox
              Left = 106
              Top = 132
              Width = 84
              Height = 16
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Funcion'#225'rio'
              DataField = 'IS_FUNCIONARIO'
              DataSource = dtsEntidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object DBEdit11: TDBEdit
              Left = 106
              Top = 70
              Width = 180
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'APELIDO'
              DataSource = dtsEntidade
              TabOrder = 2
            end
            object dbgIn: TDBGrid
              Left = 425
              Top = 7
              Width = 277
              Height = 141
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              TabStop = False
              DataSource = dtsFazendas
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 14
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -12
              TitleFont.Name = 'DINPro-Regular'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'APELIDO'
                  Title.Caption = 'Permiss'#227'o de acesso nas Fazendas'
                  Width = 284
                  Visible = True
                end>
            end
            object edtDomainModulo1: TDBEdit
              Left = 204
              Top = 425
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource1
              TabOrder = 16
              Visible = False
            end
            object edtDomainModulo2: TDBEdit
              Left = 204
              Top = 457
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource2
              TabOrder = 19
              Visible = False
            end
            object edtDomainModulo3: TDBEdit
              Left = 204
              Top = 490
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource3
              TabOrder = 22
              Visible = False
            end
            object edtDomainModulo4: TDBEdit
              Left = 204
              Top = 523
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource4
              TabOrder = 25
              Visible = False
            end
            object edtDomainModulo5: TDBEdit
              Left = 204
              Top = 396
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource5
              TabOrder = 28
              Visible = False
            end
            object edtDomainModulo6: TDBEdit
              Left = 204
              Top = 554
              Width = 163
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_DOMAIN'
              DataSource = DataSource6
              TabOrder = 31
              Visible = False
            end
            object edtLoginModulo1: TDBEdit
              Left = 375
              Top = 425
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource1
              TabOrder = 17
              Visible = False
            end
            object edtLoginModulo2: TDBEdit
              Left = 375
              Top = 457
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource2
              TabOrder = 20
              Visible = False
            end
            object edtLoginModulo3: TDBEdit
              Left = 375
              Top = 490
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource3
              TabOrder = 23
              Visible = False
            end
            object edtLoginModulo4: TDBEdit
              Left = 375
              Top = 523
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource4
              TabOrder = 26
              Visible = False
            end
            object edtLoginModulo5: TDBEdit
              Left = 202
              Top = 368
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource5
              TabOrder = 29
            end
            object edtLoginModulo6: TDBEdit
              Left = 375
              Top = 554
              Width = 146
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_LOGIN'
              DataSource = DataSource6
              TabOrder = 32
              Visible = False
            end
            object edtPasswordModulo1: TDBEdit
              Left = 527
              Top = 425
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource1
              PasswordChar = 'o'
              TabOrder = 18
              Visible = False
            end
            object edtPasswordModulo2: TDBEdit
              Left = 527
              Top = 457
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource2
              PasswordChar = 'o'
              TabOrder = 21
              Visible = False
            end
            object edtPasswordModulo3: TDBEdit
              Left = 527
              Top = 490
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource3
              PasswordChar = 'o'
              TabOrder = 24
              Visible = False
            end
            object edtPasswordModulo4: TDBEdit
              Left = 527
              Top = 523
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource4
              PasswordChar = 'o'
              TabOrder = 27
              Visible = False
            end
            object edtPasswordModulo5: TDBEdit
              Left = 390
              Top = 368
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource5
              PasswordChar = 'o'
              TabOrder = 30
            end
            object edtPasswordModulo6: TDBEdit
              Left = 527
              Top = 554
              Width = 132
              Height = 23
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'MODULE_PASSWORD'
              DataSource = DataSource6
              PasswordChar = 'o'
              TabOrder = 33
              Visible = False
            end
            object CheckBox1: TCheckBox
              Left = 562
              Top = 395
              Width = 97
              Height = 17
              Caption = 'Exibir senhas'
              TabOrder = 34
              OnClick = CheckBox1Click
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 704
    ExplicitTop = 704
    inherited _ToolBar: TToolBar
      Left = 0
      Top = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmSYS_USERS.cdsUser
    OnDataChange = dtsFichaDataChange
    Left = 486
    Top = 3
  end
  inherited dtsLista: TDataSource
    DataSet = dtmSYS_USERS.cdsLstUsers
    Left = 454
    Top = 3
  end
  inherited _popMenuPrint: TPopupMenu
    Left = 720
    Top = 192
  end
  inherited _popMenuOther: TPopupMenu
    Left = 724
    Top = 248
  end
  object dtsEndereco: TDataSource
    DataSet = dtmSYS_USERS.cdsEndereco
    Left = 549
    Top = 3
  end
  object dtsEntidade: TDataSource
    DataSet = dtmSYS_USERS.cdsEntidade
    Left = 517
    Top = 3
  end
  object dtsFazendas: TDataSource
    DataSet = dtmSYS_USERS.cdsFazendas
    Left = 589
    Top = 3
  end
  object DataSource1: TDataSource
    DataSet = dtmSYS_USERS.cdsWebGerencialZootecnico
    Left = 716
    Top = 304
  end
  object DataSource2: TDataSource
    DataSet = dtmSYS_USERS.cdsWebGerencialFinanceiro
    Left = 704
    Top = 344
  end
  object DataSource3: TDataSource
    DataSet = dtmSYS_USERS.cdsWebMonitoria
    Left = 696
    Top = 384
  end
  object DataSource4: TDataSource
    DataSet = dtmSYS_USERS.cdsWebIndicadores
    Left = 688
    Top = 424
  end
  object DataSource5: TDataSource
    DataSet = dtmSYS_USERS.cdsWebPortal
    Left = 672
    Top = 464
  end
  object DataSource6: TDataSource
    DataSet = dtmSYS_USERS.cdsWebCaixaFerramentas
    Left = 724
    Top = 480
  end
end
