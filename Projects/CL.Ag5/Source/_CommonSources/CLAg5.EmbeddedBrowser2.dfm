object EmbeddedBrowser2: TEmbeddedBrowser2
  Left = 276
  Top = 194
  Caption = 'Chromium Embedded'
  ClientHeight = 672
  ClientWidth = 864
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 557
    Width = 864
    Height = 7
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    ExplicitTop = 427
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 653
    Width = 864
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Memo1: TMemo
    Left = 0
    Top = 564
    Width = 864
    Height = 89
    Align = alBottom
    TabOrder = 1
  end
end
