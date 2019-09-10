object frmZoo_AcasalamentoAnimal: TfrmZoo_AcasalamentoAnimal
  Left = 342
  Top = 269
  Caption = 'frmZoo_AcasalamentoAnimal'
  ClientHeight = 576
  ClientWidth = 821
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    821
    576)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 16
    Width = 94
    Height = 13
    Caption = 'Localizar por c'#243'digo'
  end
  object Label2: TLabel
    Left = 14
    Top = 551
    Width = 430
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 
      'As altera'#231#245'es realizadas nas sugest'#245'es de acasalamentos ser'#227'o sa' +
      'lvas automaticamente.'
  end
  object GroupBox4: TGroupBox
    Left = 511
    Top = 46
    Width = 305
    Height = 87
    Anchors = [akTop, akRight]
    Caption = '1a sugest'#227'o'
    TabOrder = 0
    ExplicitLeft = 496
    object Button1: TTcGDIButton
      Left = 11
      Top = 18
      Width = 75
      Height = 25
      Caption = '>>'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
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
      Left = 11
      Top = 52
      Width = 75
      Height = 25
      Caption = '<<'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
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
    object DBEdit26: TDBEdit
      Left = 109
      Top = 52
      Width = 181
      Height = 21
      DataField = 'NOMEMACHO'
      DataSource = dtsAcasalamento1
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 109
      Top = 21
      Width = 73
      Height = 21
      DataField = 'BRINCOMACHO'
      DataSource = dtsAcasalamento1
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 511
    Top = 145
    Width = 305
    Height = 87
    Anchors = [akTop, akRight]
    Caption = '2a sugest'#227'o'
    TabOrder = 1
    ExplicitLeft = 496
    object Button3: TTcGDIButton
      Left = 11
      Top = 18
      Width = 75
      Height = 25
      Caption = '>>'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 0
      OnClick = Button3Click
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
    object Button4: TTcGDIButton
      Left = 11
      Top = 52
      Width = 75
      Height = 25
      Caption = '<<'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 1
      OnClick = Button4Click
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
    object DBEdit29: TDBEdit
      Left = 109
      Top = 52
      Width = 181
      Height = 21
      DataField = 'NOMEMACHO'
      DataSource = dtsAcasalamento2
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 109
      Top = 21
      Width = 73
      Height = 21
      DataField = 'BRINCOMACHO'
      DataSource = dtsAcasalamento2
      TabOrder = 3
    end
  end
  object GroupBox6: TGroupBox
    Left = 511
    Top = 244
    Width = 305
    Height = 87
    Anchors = [akTop, akRight]
    Caption = '3a sugest'#227'o'
    TabOrder = 2
    ExplicitLeft = 496
    object Button5: TTcGDIButton
      Left = 11
      Top = 18
      Width = 75
      Height = 25
      Caption = '>>'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 0
      OnClick = Button5Click
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
    object Button6: TTcGDIButton
      Left = 11
      Top = 52
      Width = 75
      Height = 25
      Caption = '<<'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 1
      OnClick = Button6Click
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
    object DBEdit45: TDBEdit
      Left = 109
      Top = 52
      Width = 181
      Height = 21
      DataField = 'NOMEMACHO'
      DataSource = dtsAcasalamento3
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 109
      Top = 21
      Width = 73
      Height = 21
      DataField = 'BRINCOMACHO'
      DataSource = dtsAcasalamento3
      TabOrder = 3
    end
  end
  object GroupBox7: TGroupBox
    Left = 511
    Top = 342
    Width = 305
    Height = 87
    Anchors = [akTop, akRight]
    Caption = '4a sugest'#227'o'
    TabOrder = 3
    ExplicitLeft = 496
    object Button7: TTcGDIButton
      Left = 11
      Top = 18
      Width = 75
      Height = 25
      Caption = '>>'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 0
      OnClick = Button7Click
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
    object Button8: TTcGDIButton
      Left = 11
      Top = 48
      Width = 75
      Height = 25
      Caption = '<<'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 1
      OnClick = Button8Click
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
    object DBEdit46: TDBEdit
      Left = 109
      Top = 48
      Width = 181
      Height = 21
      DataField = 'NOMEMACHO'
      DataSource = dtsAcasalamento4
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 109
      Top = 17
      Width = 73
      Height = 21
      DataField = 'BRINCOMACHO'
      DataSource = dtsAcasalamento4
      TabOrder = 3
    end
  end
  object edtQuickSearch: TJvDBSearchEdit
    Left = 123
    Top = 13
    Width = 135
    Height = 21
    DataSource = dtsListaMachos
    DataField = 'BRINCOMACHO'
    TabOrder = 4
    Text = 'edtQuickSearch'
  end
  object JvDBUltimGrid1: TJvDBUltimGrid
    Left = 7
    Top = 48
    Width = 496
    Height = 495
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dtsListaMachos
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnShowEditor = JvDBUltimGrid1ShowEditor
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object ActionList: TInternalActionList
  end
  object dtsAcasalamento1: TDataSource
    DataSet = dtmZoo_AcasalamentoAnimal.cdsAcasalamento1
    Left = 681
    Top = 29
  end
  object dtsAcasalamento2: TDataSource
    DataSet = dtmZoo_AcasalamentoAnimal.cdsAcasalamento2
    Left = 710
    Top = 97
  end
  object dtsAcasalamento3: TDataSource
    DataSet = dtmZoo_AcasalamentoAnimal.cdsAcasalamento3
    Left = 702
    Top = 165
  end
  object dtsAcasalamento4: TDataSource
    DataSet = dtmZoo_AcasalamentoAnimal.cdsAcasalamento4
    Left = 698
    Top = 245
  end
  object dtsListaMachos: TDataSource
    DataSet = dtmZoo_AcasalamentoAnimal.cdsListaMacho
    Left = 56
    Top = 74
  end
end
