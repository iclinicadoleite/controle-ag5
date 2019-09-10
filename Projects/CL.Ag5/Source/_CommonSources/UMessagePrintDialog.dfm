inherited MessagePrintDialog: TMessagePrintDialog
  Left = 473
  Top = 190
  Caption = 'Imprimir...'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      Top = 311
      Height = 30
      ExplicitTop = 311
      ExplicitHeight = 30
      inherited _imageBottom: TImage
        Height = 30
        ExplicitLeft = -1
        ExplicitHeight = 30
      end
      inherited _btbHelp: TTcGDIButton
        Top = 3
        ExplicitTop = 3
      end
      inherited _btbPrior: TTcGDIButton
        Top = 3
        ExplicitTop = 3
      end
      inherited _btbCancel: TTcGDIButton
        Top = 3
        ExplicitTop = 3
      end
      inherited _btbNext: TTcGDIButton
        Top = 3
        ExplicitTop = 3
      end
      inherited _btbExecute: TTcGDIButton
        Top = 5
        Font.Color = clNavy
        ExplicitTop = 5
      end
      object TcGDIButton1: TTcGDIButton
        Left = 102
        Top = 3
        Width = 87
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Action = actYes
        Anchors = [akLeft, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 5
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
      object TcGDIButton2: TTcGDIButton
        Left = 192
        Top = 3
        Width = 87
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Action = actNo
        Anchors = [akLeft, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 6
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
    inherited _pnlDetail: TJvPanel
      Height = 286
      ExplicitHeight = 286
      inherited PageControl: TJvPageControl
        Height = 286
        ActivePage = TabSheet1
        ExplicitHeight = 286
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 527
            Height = 32
            Align = alTop
            Caption = 
              'Message Message Message Message Message Message Message Message ' +
              'Message Message '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            ExplicitWidth = 476
          end
          object Memo1: TMemo
            Left = 0
            Top = 32
            Width = 527
            Height = 231
            Align = alClient
            Lines.Strings = (
              'Memo1')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object pnlDSA: TPanel
      Left = 2
      Top = 288
      Width = 527
      Height = 23
      Align = alBottom
      Caption = ' '
      TabOrder = 2
      object chkDSA: TCheckBox
        Left = 8
        Top = 2
        Width = 161
        Height = 17
        Caption = 'N'#227'o exibir novamente'
        TabOrder = 0
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actExecute: TAction
      Caption = 'V&isualizar'
    end
    object actYes: TAction
      Category = 'Wizard'
      Caption = 'Sim'
      Visible = False
      OnExecute = actYesExecute
    end
    object actNo: TAction
      Category = 'Wizard'
      Caption = 'N'#227'o'
      Visible = False
      OnExecute = actNoExecute
    end
  end
end
