inherited Zoo_CfgDiagnosticosForm: TZoo_CfgDiagnosticosForm
  Left = 310
  Top = 180
  Caption = 'Diagn'#243'sticos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlFicha: TPanel
    inherited _pnlFooter: TPanel
      inherited _ToolBar: TToolBar
        inherited _ToolButtonPrint: TToolButton
          ExplicitWidth = 86
        end
        inherited _ToolButtonOther: TToolButton
          ExplicitWidth = 86
        end
      end
    end
    inherited _ScrollBoxFicha: TScrollBox
      inherited _dbgLista: TJvDBUltimGrid
        BorderStyle = bsNone
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
        AutoAppend = False
        BevelKind = bkTile
        OnShowEditor = JvDBUltimGrid1ShowEditor
        AlternateRowColor = clBtnFace
        OnCheckIfBooleanField = JvDBUltimGrid1CheckIfBooleanField
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNew: TAction
      OnUpdate = NoAct
    end
    inherited _actEdit: TAction
      OnUpdate = NoAct
    end
    inherited _actDelete: TAction
      OnUpdate = NoAct
    end
    inherited _actOther: TAction
      OnUpdate = NoAct
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgDiagnosticosDatamodule.cdsDiagnosticos
  end
end
