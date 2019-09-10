inherited Zoo_CfgProtocolosForm2: TZoo_CfgProtocolosForm2
  Left = 377
  Top = 199
  Caption = 'Protocolos'
  ClientHeight = 669
  ClientWidth = 1047
  ExplicitWidth = 1063
  ExplicitHeight = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    Width = 1047
    Height = 669
    ExplicitWidth = 1047
    ExplicitHeight = 669
    inherited _pnlFooter: TPanel
      Top = 603
      Width = 1045
      ExplicitTop = 603
      ExplicitWidth = 1045
      inherited _imageBottom: TImage
        Width = 1045
        ExplicitWidth = 1045
      end
      inherited _ToolBar: TToolBar
        Left = 192
        ExplicitLeft = 192
        inherited _ToolButtonPrint: TToolButton
          ExplicitWidth = 86
        end
        inherited _ToolButtonOther: TToolButton
          ExplicitWidth = 86
        end
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      Width = 1045
      Height = 602
      ExplicitWidth = 1045
      ExplicitHeight = 602
      object Splitter1: TSplitter [0]
        Left = 642
        Top = 0
        Height = 602
        Align = alRight
        ExplicitLeft = 468
        ExplicitTop = 320
        ExplicitHeight = 100
      end
      inherited _dbgLista: TJvDBUltimGrid
        Width = 642
        Height = 602
        Constraints.MinHeight = 109
        OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Protocolo'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Descri'#231#227'o'
            Width = 202
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Caption = 'Ativo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_TIPOPROTOCOLO'
            Title.Caption = 'Tipo protocolo'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYS$UI'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SYS$DI'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SYS$UU'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SYS$DU'
            Visible = False
          end>
      end
      object Panel1: TPanel
        Left = 645
        Top = 0
        Width = 400
        Height = 602
        Align = alRight
        Caption = 'Panel1'
        TabOrder = 1
        object dbTreeProtocolos: TDTClientTree
          Left = 1
          Top = 42
          Width = 398
          Height = 439
          ParentCustomHint = False
          Align = alClient
          DefaultNodeHeight = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Header.AutoSizeIndex = -1
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Verdana'
          Header.Font.Style = [fsBold]
          Header.Height = 21
          Header.Options = [hoColumnResize, hoDrag, hoShowImages, hoShowSortGlyphs, hoVisible]
          LineMode = lmBands
          LineStyle = lsSolid
          NodeDataSize = 4
          ParentFont = False
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect]
          DataSource = dtsTarefas
          DBTreeFields.KeyFieldName = 'KZOO_PROTOCOLO_TAREFA'
          DBTreeFields.ParentFieldName = 'KMZOO_PROTOCOLO_TAREFA'
          DBTreeFields.ListFieldName = 'CODIGO'
          DBTreeFields.ParentOfRootValue = 'NULL'
          DBTreeImages.HasChildrenImageIndex = -1
          DBTreeImages.HasChildrenSelectedIndex = -1
          DBTreeImages.NoChildrenImageIndex = -1
          DBTreeImages.NoChildrenSelectedIndex = -1
          UseFilter = False
          Columns = <
            item
              Position = 0
              Width = 52
              FieldName = 'DIA'
              WideText = 'Dia'
            end
            item
              Position = 1
              Width = 200
              FieldName = 'CODIGO'
              WideText = 'Tarefa'
            end
            item
              Position = 2
              FieldName = 'ATIVO'
              WideText = 'Ativo'
            end>
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 481
          Width = 398
          Height = 120
          Align = alBottom
          DataSource = dtsTarefas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'KZOO_PROTOCOLO_TAREFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KZOO_PROTOCOLO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KZOO_TAREFA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOREC'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXAME'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEZES'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REPLICAR'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERVALO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEZES'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KMZOO_PROTOCOLO_TAREFA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREFAS_NO_DIA'
              Width = 64
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 398
          Height = 41
          Align = alTop
          Caption = ' '
          TabOrder = 2
          object Label1: TLabel
            Left = 13
            Top = 12
            Width = 19
            Height = 13
            Caption = 'Dia'
          end
          object Label2: TLabel
            Left = 121
            Top = 12
            Width = 36
            Height = 13
            Caption = 'Tarefa'
          end
          object edDiaTarefa: TJvCalcEdit
            Left = 57
            Top = 8
            Width = 50
            Height = 21
            DecimalPlaces = 0
            DisplayFormat = ',0'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
          end
          object JvComboEdit1: TJvComboEdit
            Left = 170
            Top = 8
            Width = 121
            Height = 21
            ButtonWidth = 15
            ImageKind = ikEllipsis
            TabOrder = 1
            Text = ''
            OnButtonClick = edTarefaButtonClick
          end
          object Button1: TButton
            Left = 298
            Top = 7
            Width = 95
            Height = 23
            Action = actRemoveTarefa
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actOther: TAction
      Enabled = False
    end
    object actRemoveTarefa: TAction
      Category = 'Edit'
      Caption = 'Remove tarefa'
      OnExecute = actRemoveTarefaExecute
      OnUpdate = actRemoveTarefaUpdate
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule2.cdsProtocolos
    Left = 483
    Top = 120
  end
  inherited _popMenuPrint: TPopupMenu
    Top = 116
  end
  inherited _popMenuOther: TPopupMenu
    Left = 388
    Top = 124
  end
  object dtsTiposProtocolo: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule2.cdsTiposProtocolo
    Left = 656
    Top = 116
  end
  object dtsTarefas: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule2.cdsTarefas
    Left = 560
    Top = 125
  end
  object TcMPControlPopuper1: TTcControlPopuper
    PopupStyle = cpsPopup
    OnClose = TcMPControlPopuper1Close
    Left = 568
    Top = 203
  end
end
