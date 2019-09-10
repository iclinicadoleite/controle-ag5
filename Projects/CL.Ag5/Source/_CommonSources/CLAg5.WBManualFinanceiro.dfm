inherited WBManualFinanceiro: TWBManualFinanceiro
  Caption = 'Manual Financeiro'
  ClientHeight = 300
  ClientWidth = 635
  ExplicitWidth = 651
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter: TSplitter
    Left = 625
    Height = 240
    ExplicitLeft = 625
    ExplicitHeight = 240
  end
  inherited NavControlPnl: TPanel
    Width = 635
    ExplicitWidth = 635
    inherited URLEditPnl: TPanel
      Width = 429
      ExplicitWidth = 429
      inherited URLCbx: TComboBox
        Width = 429
        ExplicitWidth = 429
      end
    end
    inherited ConfigPnl: TPanel
      Left = 562
      ExplicitLeft = 562
    end
  end
  inherited CEFWindowParent: TCEFWindowParent
    Width = 625
    Height = 240
    ExplicitWidth = 625
    ExplicitHeight = 240
  end
  inherited DevTools: TCEFWindowParent
    Left = 635
    Height = 240
    ExplicitLeft = 635
    ExplicitHeight = 240
  end
  inherited StatusBar: TStatusBar
    Top = 281
    Width = 635
    ExplicitTop = 281
    ExplicitWidth = 635
  end
end
