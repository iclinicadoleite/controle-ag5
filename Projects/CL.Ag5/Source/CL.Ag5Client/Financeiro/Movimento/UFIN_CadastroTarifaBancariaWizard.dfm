inherited FIN_CadastroTarifaBancariaWizard: TFIN_CadastroTarifaBancariaWizard
  Left = 502
  Top = 278
  Caption = 'Cadastro de Tarifa Banc'#225'ria'
  ClientHeight = 268
  ClientWidth = 523
  ActionList.Top = 8
  ExplicitWidth = 529
  ExplicitHeight = 297
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 523
    Height = 268
    ExplicitWidth = 523
    ExplicitHeight = 268
    inherited _pnlDetail: TJvPanel
      Width = 519
      Height = 226
      ExplicitWidth = 519
      ExplicitHeight = 226
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 519
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 14
          Top = 14
          Width = 36
          Height = 13
          Caption = 'Conta :'
        end
        object dbcbNomeConta: TJvDBComboEdit
          Left = 77
          Top = 11
          Width = 308
          Height = 21
          DataField = 'NOMECONTA'
          DataSource = dtsParcela
          ImageKind = ikEllipsis
          TabOrder = 0
          OnButtonClick = dbcbNomeContaButtonClick
          OnKeyPress = dbcbNomeContaKeyPress
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 41
        Width = 519
        Height = 206
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object Label4: TLabel
          Left = 14
          Top = 71
          Width = 99
          Height = 13
          Caption = 'Documento / cheque'
        end
        object Label5: TLabel
          Left = 356
          Top = 71
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 14
          Top = 42
          Width = 80
          Height = 13
          Caption = 'Data pagamento'
        end
        object Label10: TLabel
          Left = 14
          Top = 12
          Width = 41
          Height = 13
          Caption = 'Hist'#243'rico'
        end
        object Label8: TLabel
          Left = 287
          Top = 42
          Width = 93
          Height = 13
          Caption = 'Data Compensa'#231#227'o'
        end
        object Label11: TLabel
          Left = 16
          Top = 102
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object DBEdit5: TDBEdit
          Left = 119
          Top = 68
          Width = 159
          Height = 21
          DataField = 'DOCUMENTO'
          DataSource = dtsParcela
          MaxLength = 10
          TabOrder = 3
        end
        object JvDBCalcEdit1: TJvDBCalcEdit
          Left = 385
          Top = 68
          Width = 121
          Height = 21
          DisplayFormat = ',0.00'
          TabOrder = 4
          DecimalPlacesAlwaysShown = True
          DataField = 'VALOR'
          DataSource = dtsParcela
        end
        object dbDt_Emissao: TTcDBDateEdit
          Left = 119
          Top = 39
          Width = 121
          Height = 21
          Checked = False
          DataField = 'PAGTO'
          DataSource = dtsParcela
          CheckOnExit = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = dbDt_EmissaoExit
        end
        object DBEdit1: TDBEdit
          Left = 119
          Top = 9
          Width = 387
          Height = 21
          DataField = 'HISTORICO'
          DataSource = dtsConta
          TabOrder = 0
        end
        object dbDt_Compensacao: TJvDBDateEdit
          Left = 385
          Top = 39
          Width = 121
          Height = 21
          DataField = 'DT_COMPENSACAO'
          DataSource = dtsParcela
          ShowNullDate = False
          TabOrder = 2
        end
        object DBMemo1: TDBMemo
          Left = 14
          Top = 120
          Width = 492
          Height = 46
          BevelOuter = bvNone
          DataField = 'OBS'
          DataSource = dtsParcela
          TabOrder = 6
        end
        object dbcbCheque: TDBCheckBox
          Left = 373
          Top = 96
          Width = 133
          Height = 17
          Caption = 'Pagamento com cheque'
          DataField = 'CHEQUE'
          DataSource = dtsParcela
          TabOrder = 5
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 228
      Width = 519
      Height = 38
      ExplicitTop = 228
      ExplicitWidth = 519
      ExplicitHeight = 38
      inherited _imageBottom: TImage
        Width = 519
        Height = 38
        ExplicitWidth = 519
        ExplicitHeight = 30
      end
      object _btbSave: TTcGDIButton
        Left = 316
        Top = 4
        Width = 98
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = '&OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        DisabledPicture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          000033333F333333333333000000333377F333333333330000003337337F3333
          33333300000033733337F333333333000000373333337F333333330000007F33
          7F3337F33333330000007F3737F337F33333330000007F73337F337F33333300
          000037333337F337F33333000000333333337F337F33330000003333333337F3
          37F33300000033333333337F337F33000000333333333337F337F30000003333
          333333337F37F300000033333333333337F73300000033333333333333733300
          0000333333333333333333000000}
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Picture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          0000333333333333333333000000333334433333333333000000333342243333
          3333330000003334222243333333330000003342222224333333330000003422
          2A2222433333330000003222A3A222433333330000003A2A333A222433333300
          000033A33333A222433333000000333333333A222433330000003333333333A2
          22433300000033333333333A222433000000333333333333A222430000003333
          333333333A224300000033333333333333A223000000333333333333333A3300
          0000333333333333333333000000}
        TabOrder = 0
        OnClick = _btbSaveClick
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
      object _btbCancel: TTcGDIButton
        Left = 418
        Top = 4
        Width = 98
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = 'Cancela&r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        DisabledPicture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          00003333F333333333333300000033377F333333F33333000000337F37F333F7
          7F3333000000337F337F3F7337F333000000337F3337F733337F330000003337
          F33373333F733300000033337F333333F73333000000333337F3333373333300
          00003333337F3337333333000000333333733337F33333000000333337333337
          F33333000000333373337F337F33330000003337F33737F337F3330000003337
          FF73337F337F33000000333377333337FFF73300000033333333333377733300
          0000333333333333333333000000}
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Picture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          0000333377333333333333000000333911733333973333000000333911173339
          1173330000003339111173911117330000003333911117111117330000003333
          3911111111733300000033333391111117333300000033333331111173333300
          0000333333391111733333000000333333911111733333000000333339111711
          1733330000003333911173911173330000003333911733391117330000003333
          3913333391113300000033333333333339193300000033333333333333333300
          0000333333333333333333000000}
        TabOrder = 1
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
    end
  end
  inherited ActionList: TInternalActionList
    Top = 8
  end
  object dtsConta: TDataSource
    Left = 402
    Top = 18
  end
  object dtsParcela: TDataSource
    Left = 466
    Top = 18
  end
end
