object FormMensagemEnvio: TFormMensagemEnvio
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsNone
  Caption = 'FormMensagemEnvio'
  ClientHeight = 114
  ClientWidth = 362
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 26
    Width = 347
    Height = 41
    Caption = 
      'O sistema est'#225' pronto para gerar o backup e enviar para a Cl'#237'nic' +
      'a do Leite. Deseja fazer isso agora ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbSim: TLabel
    Left = 64
    Top = 82
    Width = 22
    Height = 16
    Cursor = crHandPoint
    Caption = 'Sim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lbSimClick
  end
  object lbLembrarDepois: TLabel
    Left = 160
    Top = 82
    Width = 127
    Height = 16
    Cursor = crHandPoint
    Caption = 'Lembrar mais tarde'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lbLembrarDepoisClick
  end
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 89
    Height = 16
    Caption = 'Controle MDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
