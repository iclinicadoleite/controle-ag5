object EmbeddedBrowser: TEmbeddedBrowser
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 518
    Width = 864
    Height = 7
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    ExplicitTop = 427
  end
  object Chromium: TChromium
    Left = 0
    Top = 25
    Width = 864
    Height = 493
    Align = alClient
    DefaultUrl = 'about:blank'
    TabOrder = 0
    OnProcessMessageReceived = ChromiumProcessMessageReceived
    OnLoadStart = ChromiumLoadStart
    OnLoadEnd = ChromiumLoadEnd
    OnBeforeContextMenu = ChromiumBeforeContextMenu
    OnContextMenuCommand = ChromiumContextMenuCommand
    OnAddressChange = ChromiumAddressChange
    OnTitleChange = ChromiumTitleChange
    OnStatusMessage = ChromiumStatusMessage
    OnConsoleMessage = ChromiumConsoleMessage
    OnBeforeDownload = ChromiumBeforeDownload
    OnDownloadUpdated = ChromiumDownloadUpdated
    OnJsdialog = ChromiumJsdialog
    OnBeforePopup = ChromiumBeforePopup
    OnBeforeResourceLoad = ChromiumBeforeResourceLoad
    OnCertificateError = ChromiumCertificateError
    OnPluginCrashed = ChromiumPluginCrashed
    Options.Javascript = STATE_ENABLED
    Options.Plugins = STATE_ENABLED
    Options.FileAccessFromFileUrls = STATE_ENABLED
    ExplicitHeight = 332
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 653
    Width = 864
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 1000
  end
  object PanelControl: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 25
    Align = alTop
    TabOrder = 1
    Visible = False
    DesignSize = (
      864
      25)
    object ButtonPrev: TSpeedButton
      Left = 0
      Top = 0
      Width = 23
      Height = 22
      Action = ActionPrev
    end
    object ButtonNext: TSpeedButton
      Left = 24
      Top = 0
      Width = 23
      Height = 22
      Action = ActionNext
    end
    object ButtonHome: TSpeedButton
      Left = 48
      Top = 0
      Width = 23
      Height = 22
      Action = ActionHome
    end
    object ButtonReload: TSpeedButton
      Left = 72
      Top = 0
      Width = 23
      Height = 22
      Action = ActionReload
    end
    object ButtonGoto: TSpeedButton
      Left = 841
      Top = 0
      Width = 23
      Height = 22
      Action = ActionGoTo
      Anchors = [akTop, akRight]
    end
    object EditAddress: TEdit
      Left = 95
      Top = 0
      Width = 744
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'http://www.google.com'
      OnKeyPress = EditAddressKeyPress
    end
  end
  object DevToolsPanel: TPanel
    Left = 0
    Top = 525
    Width = 864
    Height = 128
    Align = alBottom
    Caption = ' '
    ShowCaption = False
    TabOrder = 3
    ExplicitTop = 544
    object DevTools: TChromiumDevTools
      Left = 1
      Top = 1
      Width = 862
      Height = 37
      Align = alClient
      Visible = False
      ExplicitLeft = -23
      ExplicitTop = -13
    end
    object Memo1: TMemo
      Left = 1
      Top = 38
      Width = 862
      Height = 89
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 564
      ExplicitWidth = 864
    end
  end
  object ActionList: TActionList
    Left = 624
    Top = 112
    object ActionPrev: TAction
      Caption = '<-'
      Enabled = False
      OnExecute = ActionPrevExecute
      OnUpdate = ActionPrevUpdate
    end
    object ActionNext: TAction
      Caption = '->'
      Enabled = False
      OnExecute = ActionNextExecute
      OnUpdate = ActionNextUpdate
    end
    object ActionHome: TAction
      Caption = 'H'
      OnExecute = ActionHomeExecute
      OnUpdate = ActionHomeUpdate
    end
    object ActionReload: TAction
      Caption = 'R'
      OnExecute = ActionReloadExecute
      OnUpdate = ActionReloadUpdate
    end
    object ActionGoTo: TAction
      Caption = '>'
      OnExecute = ActionGoToExecute
    end
    object ActionGetSource: TAction
      Caption = 'Get source'
      OnExecute = ActionGetSourceExecute
    end
    object ActionGetText: TAction
      Caption = 'Get text'
      OnExecute = ActionGetTextExecute
    end
    object ActionZoomIn: TAction
      Caption = 'Zoom in'
      OnExecute = ActionZoomInExecute
    end
    object ActionZoomOut: TAction
      Caption = 'Zoom out'
      OnExecute = ActionZoomOutExecute
    end
    object ActionZoomReset: TAction
      Caption = 'Zoom reset'
      OnExecute = ActionZoomResetExecute
    end
    object ActionExecuteJS: TAction
      Caption = 'Execute JavaScript'
      OnExecute = ActionExecuteJSExecute
    end
    object ActionDom: TAction
      Caption = 'Hook DOM'
      OnExecute = ActionDomExecute
    end
    object ActionDevTool: TAction
      AutoCheck = True
      Caption = 'Show DevTools'
      OnExecute = ActionDevToolExecute
    end
    object ActionDoc: TAction
      Caption = 'Documentation'
      OnExecute = ActionDocExecute
    end
    object ActionGroup: TAction
      Caption = 'Google group'
      OnExecute = ActionGroupExecute
    end
    object ActionFileScheme: TAction
      Caption = 'File Scheme'
      OnExecute = ActionFileSchemeExecute
    end
    object ActionPrint: TAction
      Caption = 'Print'
      OnExecute = ActionPrintExecute
    end
  end
  object MainMenu: TMainMenu
    Left = 624
    Top = 56
    object MenuItemFile: TMenuItem
      Caption = '&File'
      object MenuItemPrint: TMenuItem
        Action = ActionPrint
      end
      object MenuItemExit: TMenuItem
        Caption = 'Exit'
        ShortCut = 16465
        OnClick = MenuItemExitClick
      end
    end
    object MenuItemTest: TMenuItem
      Caption = '&Test'
      object MenuItemGetSource: TMenuItem
        Action = ActionGetSource
      end
      object MenuItemGetText: TMenuItem
        Action = ActionGetText
      end
      object MenuItemExecuteJavaScript: TMenuItem
        Action = ActionExecuteJS
      end
      object MenuItemZoomIn: TMenuItem
        Action = ActionZoomIn
      end
      object MenuItemZoomOut: TMenuItem
        Action = ActionZoomOut
      end
      object MenuItemZoomReset: TMenuItem
        Action = ActionZoomReset
      end
      object MenuItemFileScheme: TMenuItem
        Action = ActionFileScheme
      end
      object MenuItemVisitDOM: TMenuItem
        Action = ActionDom
      end
      object MenuItemDevelopperTools: TMenuItem
        Action = ActionDevTool
        AutoCheck = True
        ShortCut = 123
      end
    end
    object MenuItemHelp: TMenuItem
      Caption = 'Help'
      object MenuItemDocumentation: TMenuItem
        Action = ActionDoc
      end
      object MenuItemGoogleGroup: TMenuItem
        Action = ActionGroup
      end
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 624
    Top = 176
  end
end
