inherited DomainListForm: TDomainListForm
  Left = 443
  Top = 152
  BorderStyle = bsSingle
  Caption = 'Gerenciar fazendas'
  ClientHeight = 447
  ClientWidth = 736
  OldCreateOrder = False
  OnActivate = TcFormActivate
  ExplicitWidth = 742
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 736
    Height = 447
    ExplicitWidth = 786
    ExplicitHeight = 447
    inherited _pnlDetail: TJvPanel
      Top = 39
      Width = 732
      Height = 342
      ExplicitTop = 100
      ExplicitWidth = 782
      ExplicitHeight = 281
      object dbgDomains: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 732
        Height = 342
        ParentCustomHint = False
        Align = alClient
        DataSource = dtsDomains
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnGetCellParams = dbgDomainsGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        OnCheckIfBooleanField = dbgDomainsCheckIfBooleanField
        Columns = <
          item
            Expanded = False
            FieldName = 'DOMAIN_CODE'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOMAIN_NAME'
            ReadOnly = True
            Width = 420
            Visible = True
          end
          item
            Expanded = False
            ReadOnly = True
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VALIDADE'
            ReadOnly = True
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ISVALID'
            ReadOnly = True
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DBINITIALIZED'
            ReadOnly = True
            Visible = False
          end>
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 381
      Width = 732
      Height = 64
      ExplicitTop = 381
      ExplicitWidth = 782
      ExplicitHeight = 64
      inherited _imageBottom: TImage
        Width = 732
        Height = 64
        ExplicitWidth = 782
        ExplicitHeight = 64
      end
      object lblStatus: TLabel
        Left = 15
        Top = 7
        Width = 41
        Height = 13
        Caption = 'lblStatus'
        Visible = False
      end
      object Button1: TTcGDIButton
        Left = 13
        Top = 30
        Width = 161
        Height = 29
        Action = actAddLicense
        Caption = 'Adicionar fazenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Left = 603
        Top = 30
        Width = 123
        Height = 29
        Action = actInitDomain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object Button3: TTcGDIButton
        Left = 346
        Top = 30
        Width = 220
        Height = 29
        Action = actAddLicenseFromArchive
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
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
        Left = 177
        Top = 30
        Width = 166
        Height = 29
        Action = actValideLicense
        Caption = 'Validar fazenda...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 3
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
    object PanelTitle: TPanel
      Left = 2
      Top = 2
      Width = 732
      Height = 37
      Align = alTop
      Color = 15724527
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 782
      DesignSize = (
        732
        37)
      object Bevel2: TBevel
        Left = 7
        Top = 93
        Width = 714
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        ExplicitWidth = 764
      end
      object Label4: TLabel
        Left = 98
        Top = 6
        Width = 509
        Height = 23
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Gerenciar fazendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 559
      end
      object Label2: TLabel
        Left = 114
        Top = 57
        Width = 107
        Height = 13
        Caption = 'Exibir licen'#231'as/status :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblSerial: TLabel
        Left = 98
        Top = 36
        Width = 509
        Height = 14
        Cursor = crHandPoint
        Hint = 'Clique para copiar para a '#225'rea de transfer'#234'ncia...'
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Serial : 99999-99999-99999-XXX'
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
        ExplicitWidth = 559
      end
      object rbFilterAll: TRadioButton
        Left = 136
        Top = 72
        Width = 57
        Height = 17
        Caption = 'Todas'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Visible = False
        OnClick = rbFilterAllClick
      end
      object rbFilterReadOnly: TRadioButton
        Left = 422
        Top = 72
        Width = 113
        Height = 17
        Caption = 'Somente leitura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnClick = rbFilterReadOnlyClick
      end
      object rbFilterActive: TRadioButton
        Left = 206
        Top = 72
        Width = 64
        Height = 17
        Caption = 'Ativas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = rbFilterActiveClick
      end
      object rbFilterLess15: TRadioButton
        Left = 278
        Top = 72
        Width = 122
        Height = 17
        Caption = 'Expiram < 15 dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = rbFilterLess15Click
      end
      object rbFilterExpired: TRadioButton
        Left = 560
        Top = 72
        Width = 87
        Height = 17
        Caption = 'Expiradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = rbFilterExpiredClick
      end
    end
  end
  object dtsDomains: TDataSource
    DataSet = DomainListDatamodule.cdsDomains
    Left = 32
    Top = 48
  end
  object ActionList1: TActionList
    Left = 84
    Top = 52
    object actAddLicense: TAction
      Caption = 'Adicionar fazenda/licen'#231'a...'
      OnExecute = actAddLicenseExecute
    end
    object actAddLicenseFromArchive: TAction
      Caption = 'Adicionar/validar licen'#231'a via arquivo...'
      OnExecute = actAddLicenseFromArchiveExecute
    end
    object actValideLicense: TAction
      Caption = 'Validar licen'#231'a da fazenda...'
      OnExecute = actValideLicenseExecute
      OnUpdate = actValideLicenseUpdate
    end
    object actInitDomain: TAction
      Caption = 'Inicializar banco...'
      Visible = False
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.ch'
    Filter = 'Chave Agenda|*.ch'
    Left = 52
    Top = 88
  end
  object ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    Left = 486
    Top = 137
  end
end
