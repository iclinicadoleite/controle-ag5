inherited fdlgZoo_PartosAbortosCrias: TfdlgZoo_PartosAbortosCrias
  Left = 207
  Top = 82
  Caption = 'Cadastro de crias'
  ClientHeight = 627
  ClientWidth = 640
  ExplicitWidth = 646
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 640
    Height = 627
    ExplicitWidth = 640
    ExplicitHeight = 597
    inherited _pnlDetail: TJvPanel
      Width = 636
      Height = 588
      ExplicitWidth = 636
      ExplicitHeight = 558
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 0
        Width = 636
        Height = 588
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        DataSource = dtsLinhagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        PanelHeight = 196
        PanelWidth = 619
        ParentFont = False
        TabOrder = 0
        SelectedColor = clSkyBlue
        OnEnter = DBCtrlGrid1Enter
        OnPaintPanel = DBCtrlGrid1PaintPanel
        ExplicitHeight = 558
        object Label1: TLabel
          Left = 99
          Top = 8
          Width = 29
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Sexo'
          FocusControl = JvDBComboBox1
        end
        object Label3: TLabel
          Left = 216
          Top = 8
          Width = 36
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Brinco'
        end
        object Label4: TLabel
          Left = 11
          Top = 41
          Width = 85
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Nome est'#225'bulo'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 4
          Top = 77
          Width = 89
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Nome completo'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 405
          Top = 8
          Width = 24
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Lote'
          FocusControl = DBEdit6
        end
        object Label8: TLabel
          Left = 402
          Top = 41
          Width = 27
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Peso'
        end
        object Label9: TLabel
          Left = 395
          Top = 77
          Width = 34
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Altura'
        end
        object Label11: TLabel
          Left = 15
          Top = 132
          Width = 17
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Pai'
        end
        object Label12: TLabel
          Left = 15
          Top = 163
          Width = 23
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'M'#227'e'
        end
        object Label10: TLabel
          Left = 395
          Top = 129
          Width = 70
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Composi'#231#227'o'
        end
        object Label6: TLabel
          Left = 256
          Top = 160
          Width = 28
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ra'#231'a'
          Visible = False
        end
        object Label13: TLabel
          Left = 203
          Top = 129
          Width = 93
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Grau de Sangue'
          FocusControl = DBLookupComboBox2
        end
        object Shape1: TShape
          Left = 213
          Top = 113
          Width = 402
          Height = 1
          Brush.Style = bsClear
          Pen.Color = 10724259
        end
        object Label2: TLabel
          Left = 7
          Top = 105
          Width = 201
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Grau de sangue/Composi'#231#227'o racial'
          FocusControl = DBEdit4
        end
        object DBCheckBox1: TJvDBCheckBox
          Left = 9
          Top = 10
          Width = 87
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Natimorto'
          DataField = 'NATIMORTO'
          DataSource = dtsLinhagem
          TabOrder = 0
          ValueChecked = 'T'
          ValueUnchecked = 'F'
        end
        object DBEdit2: TDBEdit
          Left = 554
          Top = 10
          Width = 55
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          TabStop = False
          BorderStyle = bsNone
          DataField = 'NUMERO'
          DataSource = dtsLinhagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object JvDBComboBox1: TJvDBComboBox
          Left = 135
          Top = 8
          Width = 72
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'SEXO'
          DataSource = dtsLinhagem
          Items.Strings = (
            'Macho'
            'F'#234'mea')
          TabOrder = 1
          Values.Strings = (
            'M'
            'F')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object DBEdit3: TDBEdit
          Left = 106
          Top = 41
          Width = 274
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'NOMEESTABULO'
          DataSource = dtsLinhagem
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 106
          Top = 74
          Width = 274
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'NOMECOMPLETO'
          DataSource = dtsLinhagem
          TabOrder = 6
        end
        object DBEdit6: TDBEdit
          Left = 441
          Top = 8
          Width = 80
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'LOTE'
          DataSource = dtsLinhagem
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 270
          Top = 8
          Width = 111
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'BRINCO'
          DataSource = dtsLinhagem
          TabOrder = 2
        end
        object edPeso: TJvDBCalcEdit
          Left = 441
          Top = 41
          Width = 80
          Height = 21
          ShowButton = False
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          DataField = 'PESO'
          DataSource = dtsLinhagem
        end
        object edAltura: TJvDBCalcEdit
          Left = 441
          Top = 74
          Width = 80
          Height = 21
          ShowButton = False
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          DataField = 'ALTURA'
          DataSource = dtsLinhagem
        end
        object DBEdit9: TDBEdit
          Left = 50
          Top = 129
          Width = 137
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'GSR_PAI'
          DataSource = dtsLinhagem
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 50
          Top = 160
          Width = 137
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'GSR_MAE'
          DataSource = dtsLinhagem
          ReadOnly = True
          TabOrder = 10
        end
        object DBLookupComboBox2: TJvDBLookupCombo
          Left = 293
          Top = 160
          Width = 279
          Height = 21
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'DESCR_RACA'
          DataSource = dtsLinhagem
          TabOrder = 11
          Visible = False
        end
        object dbxGrauSangue: TDBComboBox
          Left = 306
          Top = 129
          Width = 74
          Height = 21
          DataField = 'GRAUSANGUE'
          DataSource = dtsLinhagem
          Items.Strings = (
            '1/1 ( 1 )'
            '1/2 ( 50 ) '
            '5/8 ( 62 )'
            '3/4 ( 75 )'
            '7/8  ( 87 )'
            '15/16 ( 94 )')
          TabOrder = 12
          OnKeyPress = dbxGrauSangueKeyPress
        end
        object dbEdtComposicaoRaca: TJvDBComboEdit
          Left = 477
          Top = 129
          Width = 128
          Height = 21
          DataField = 'COMPOSICAORACA'
          DataSource = dtsLinhagem
          ImageKind = ikEllipsis
          ButtonWidth = 15
          ReadOnly = True
          TabOrder = 13
          OnButtonClick = dbEdtComposicaoRacaButtonClick
          OnKeyPress = dbEdtComposicaoRacaKeyPress
        end
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 590
      Width = 636
      Height = 35
      ExplicitTop = 560
      ExplicitWidth = 636
      ExplicitHeight = 35
      inherited _imageBottom: TImage
        Width = 636
        Height = 35
        ExplicitWidth = 606
        ExplicitHeight = 35
      end
      object _btbSave: TTcGDIButton
        Left = 432
        Top = 3
        Width = 99
        Height = 29
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
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
        Left = 534
        Top = 3
        Width = 99
        Height = 29
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
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
  object pnlOpts: TPanel [1]
    Left = 551
    Top = 36
    Width = 66
    Height = 26
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = ' '
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 0
      Top = 0
      Width = 33
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 33
      Top = 0
      Width = 33
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object dtsLinhagem: TDataSource
    DataSet = Zoo_ReproducaoPartosAbortosDatamodule.cdsLinhagem
    Left = 284
    Top = 28
  end
end
