inherited DomainValidateForm: TDomainValidateForm
  Left = 531
  Top = 240
  Caption = 'Nova fazenda'
  ClientHeight = 201
  ClientWidth = 485
  OldCreateOrder = False
  OnActivate = TcFormActivate
  OnCreate = TcFormCreate
  ExplicitWidth = 491
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 485
    Height = 201
    ExplicitWidth = 485
    ExplicitHeight = 201
    inherited _pnlDetail: TJvPanel
      Width = 481
      Height = 160
      ExplicitWidth = 481
      ExplicitHeight = 160
      object Label1: TLabel
        Left = 15
        Top = 14
        Width = 31
        Height = 13
        Caption = 'Chave'
      end
      object Label2: TLabel
        Left = 15
        Top = 89
        Width = 69
        Height = 13
        Caption = 'Nome fazenda'
      end
      object Label3: TLabel
        Left = 296
        Top = 54
        Width = 40
        Height = 13
        Caption = 'Validade'
        Visible = False
      end
      object Label5: TLabel
        Left = 15
        Top = 54
        Width = 75
        Height = 13
        Caption = 'Codigo fazenda'
      end
      object lblCodigoFazenda: TLabel
        Left = 108
        Top = 54
        Width = 48
        Height = 14
        Caption = '999999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSerial: TLabel
        Left = 15
        Top = 120
        Width = 47
        Height = 14
        Cursor = crHandPoint
        Hint = 'Clique para copiar para a '#225'rea de transfer'#234'ncia...'
        Caption = 'lblSerial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = lblSerialClick
      end
      object lblValidade: TLabel
        Left = 348
        Top = 54
        Width = 78
        Height = 14
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblValidacao: TLabel
        Left = 15
        Top = 140
        Width = 71
        Height = 14
        Cursor = crHandPoint
        Hint = 'Clique para copiar para a '#225'rea de transfer'#234'ncia...'
        Caption = 'lblValidacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
        StyleElements = [seClient, seBorder]
      end
      object edtKey: TMaskEdit
        AlignWithMargins = True
        Left = 67
        Top = 13
        Width = 241
        Height = 21
        EditMask = '99999\-99999\-99999\-99999\-99999\-99999;1;_'
        MaxLength = 35
        TabOrder = 0
        Text = '     -     -     -     -     -     '
        OnChange = edtKeyChange
        OnClick = edtKeyClick
        OnEnter = edtKeyEnter
      end
      object edtNomeFazenda: TEdit
        Left = 108
        Top = 86
        Width = 356
        Height = 21
        TabOrder = 1
        OnChange = edtNomeFazendaChange
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 162
      Width = 481
      Height = 37
      ExplicitTop = 162
      ExplicitWidth = 481
      ExplicitHeight = 37
      inherited _imageBottom: TImage
        Width = 481
        Height = 37
        ExplicitWidth = 481
        ExplicitHeight = 37
      end
      object Button1: TTcGDIButton
        Left = 270
        Top = 4
        Width = 98
        Height = 29
        Caption = 'Validar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
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
      object Button2: TTcGDIButton
        Left = 374
        Top = 4
        Width = 98
        Height = 29
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
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
end
