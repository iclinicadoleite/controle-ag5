object PopupMenuManuais: TPopupMenuManuais
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ClinicaTalk'
  ClientHeight = 94
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'DINPro-Regular'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 14
  object _PanelManuais: TPanel
    Left = 0
    Top = 0
    Width = 205
    Height = 94
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = True
    TabOrder = 0
    object _LabelManualZootecnico: TLabel
      Left = 39
      Top = 19
      Width = 123
      Height = 19
      Cursor = crHandPoint
      AutoSize = False
      Caption = 'Manual Zoot'#233'cnico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'DINPro-Regular'
      Font.Style = []
      ParentFont = False
      OnClick = _ManualZootecnicoImgClick
      OnMouseEnter = _ManualZootecnicoImgMouseEnter
      OnMouseLeave = _ManualZootecnicoImgMouseLeave
    end
    object _ManualZootecnicoImg: TImage
      Left = 23
      Top = 17
      Width = 159
      Height = 22
      Cursor = crHandPoint
      OnClick = _ManualZootecnicoImgClick
      OnMouseEnter = _ManualZootecnicoImgMouseEnter
      OnMouseLeave = _ManualZootecnicoImgMouseLeave
    end
    object _LabelManualFinanceiro: TLabel
      Left = 39
      Top = 59
      Width = 121
      Height = 19
      Cursor = crHandPoint
      Caption = 'Manual Financeiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'DINPro-Regular'
      Font.Style = []
      ParentFont = False
      OnClick = _ManualFinanceiroImgClick
      OnMouseEnter = _ManualFinanceiroImgMouseEnter
      OnMouseLeave = _ManualFinanceiroImgMouseLeave
    end
    object _ManualFinanceiroImg: TImage
      Left = 23
      Top = 57
      Width = 159
      Height = 22
      Cursor = crHandPoint
      OnClick = _ManualFinanceiroImgClick
      OnMouseEnter = _ManualFinanceiroImgMouseEnter
      OnMouseLeave = _ManualFinanceiroImgMouseLeave
    end
  end
end
