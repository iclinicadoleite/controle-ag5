object frmSelPeriodo: TfrmSelPeriodo
  Left = 226
  Top = 154
  AutoSize = True
  BorderStyle = bsSizeToolWin
  Caption = 'frmSelPeriodo'
  ClientHeight = 389
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 357
    Caption = 'Panel1'
    Color = clBlack
    TabOrder = 0
    object JvMonthCalendar21: TJvMonthCalendar2
      Left = -3
      Top = -4
      Width = 609
      Height = 365
      DotNetHighlighting = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabStop = True
      TabOrder = 0
      Colors.BackColor = clWhite
      Colors.TextColor = clBlack
      Colors.TitleBackColor = clBtnFace
      Colors.TitleTextColor = clBlack
      Colors.MonthBackColor = clBtnFace
      Colors.TrailingTextColor = clRed
      DateFirst = 39365.000000000000000000
      DateLast = 39365.000000000000000000
      MaxSelCount = 366
      MultiSelect = True
      WeekNumbers = True
      Today = 39365.068931203710000000
      OnSelChange = JvMonthCalendar21SelChange
    end
  end
  object btbSave: TTcGDIButton
    Left = 421
    Top = 360
    Width = 87
    Height = 29
    Caption = 'OK'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ModalResult = 1
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
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
  object btbCancel: TTcGDIButton
    Left = 513
    Top = 360
    Width = 87
    Height = 29
    Cancel = True
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ModalResult = 2
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 2
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
