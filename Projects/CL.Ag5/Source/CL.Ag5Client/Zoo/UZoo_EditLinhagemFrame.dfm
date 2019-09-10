object Zoo_EditLinhagemFrame: TZoo_EditLinhagemFrame
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 174
  ClientWidth = 354
  Color = clWhite
  TransparentColorValue = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 174
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    Caption = ' '
    Color = clWhite
    DoubleBuffered = True
    ParentBackground = False
    TabOrder = 0
    object TcMPFloatingPanel1: TTcCaptionedPanel
      Left = 3
      Top = 3
      Width = 348
      Height = 139
      Caption = 'Editar pedigree'
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 27
      Constraints.MinWidth = 120
      DoubleBuffered = True
      DragMode = dmAutomatic
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      ParentDoubleBuffered = False
      object Label49: TLabel
        Left = 15
        Top = 40
        Width = 14
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Pai'
      end
      object Label50: TLabel
        Left = 9
        Top = 74
        Width = 20
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'M'#227'e'
      end
      object Label4: TLabel
        Left = 241
        Top = 21
        Width = 74
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'GS/Composi'#231#227'o'
      end
      object Label3: TLabel
        Left = 10
        Top = 109
        Width = 77
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Grau de Sangue'
      end
      object DBText1: TDBText
        Left = 91
        Top = 2
        Width = 229
        Height = 14
        Color = 14737632
        DataField = 'BRINCONOME'
        DataSource = dtsAnimal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object edPai: TJvDBComboEdit
        Left = 40
        Top = 40
        Width = 189
        Height = 21
        Color = clWhite
        DataField = 'NOMEPAI'
        DataSource = dtsLinhagem
        ImageKind = ikEllipsis
        ButtonWidth = 15
        TabOrder = 0
        OnButtonClick = edPaiButtonClick
      end
      object edMae: TJvDBComboEdit
        Left = 40
        Top = 74
        Width = 189
        Height = 21
        Color = clWhite
        DataField = 'NOMEMAE'
        DataSource = dtsLinhagem
        ImageKind = ikEllipsis
        ButtonWidth = 15
        TabOrder = 1
        OnButtonClick = edMaeButtonClick
      end
      object DBEdit6: TDBEdit
        Left = 241
        Top = 40
        Width = 79
        Height = 21
        TabStop = False
        DataField = 'GSR_PAI'
        DataSource = dtsLinhagem
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 241
        Top = 74
        Width = 79
        Height = 21
        TabStop = False
        DataField = 'GSR_MAE'
        DataSource = dtsLinhagem
        ReadOnly = True
        TabOrder = 3
      end
      object dbxGrauSangue: TDBComboBox
        Left = 110
        Top = 106
        Width = 74
        Height = 21
        DataField = 'GRAUSANGUE'
        DataSource = dtsAnimal
        Items.Strings = (
          '1/1 ( 1 )'
          '1/2 ( 50 ) '
          '3/4 ( 25 )'
          '7/8  ( 87 )'
          '15/16 ( 94 )')
        TabOrder = 4
        OnKeyPress = dbxGrauSangueKeyPress
      end
      object dbEdtComposicaoRaca: TJvDBComboEdit
        Left = 192
        Top = 106
        Width = 128
        Height = 21
        DataField = 'COMPOSICAORACA'
        DataSource = dtsAnimal
        ImageKind = ikEllipsis
        ButtonWidth = 15
        ReadOnly = True
        TabOrder = 5
        OnButtonClick = dbEdtComposicaoRacaButtonClick
        OnKeyPress = dbEdtComposicaoRacaKeyPress
      end
    end
    object PanelFooter: TPanel
      Left = 3
      Top = 142
      Width = 348
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        348
        29)
      object Label1: TLabel
        Left = 7
        Top = 8
        Width = 82
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Animais externos'
      end
      object Shape1: TShape
        Left = 7
        Top = 3
        Width = 197
        Height = 1
      end
      object SpeedButton7: TTcGDIButton
        Left = 93
        Top = 6
        Width = 54
        Height = 20
        Caption = 'Machos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = SpeedButton7Click
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
      object SpeedButton8: TTcGDIButton
        Left = 150
        Top = 6
        Width = 54
        Height = 20
        Caption = 'F'#234'meas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = SpeedButton8Click
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
      object FloatEditorOKButton: TTcGDIButton
        Left = 282
        Top = 3
        Width = 27
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -8
        Font.Name = 'Times New Roman'
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
        OnClick = FloatEditorOKButtonClick
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
      object FloatEditorCancelButton: TTcGDIButton
        Left = 310
        Top = 3
        Width = 27
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -8
        Font.Name = 'Times New Roman'
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
  object dtsLinhagem: TDataSource
    DataSet = Zoo_EditLinhagemDatamodule.cdsLinhagem
    Left = 168
    Top = 80
  end
  object dtsAnimal: TDataSource
    DataSet = Zoo_EditLinhagemDatamodule.cdsAnimal
    Left = 136
    Top = 76
  end
end
