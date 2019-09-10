object UpdateAppForm: TUpdateAppForm
  AlignWithMargins = True
  Left = 1207
  Top = 679
  Margins.Top = 10
  Margins.Right = 10
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'UpdateAppForm'
  ClientHeight = 101
  ClientWidth = 339
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    339
    101)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 101
    Anchors = [akRight, akBottom]
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LbInfo: TLabel
      Left = 34
      Top = 20
      Width = 281
      Height = 26
      Caption = 
        'H'#225' uma nova vers'#227'o do sistema pronta para ser instalada. Deseja ' +
        'instalar agora ?'
      WordWrap = True
    end
    object Shape1: TShape
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 327
      Height = 89
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = 9474192
      ExplicitLeft = -2
      ExplicitTop = -2
      ExplicitWidth = 339
      ExplicitHeight = 102
    end
    object BtnYes: TBitBtn
      Left = 85
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Sim'
      ModalResult = 1
      TabOrder = 0
    end
    object BtnNo: TBitBtn
      Left = 166
      Top = 57
      Width = 75
      Height = 25
      Caption = 'N'#227'o'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
