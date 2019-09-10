inherited CAD_TiposEstoqueWizard: TCAD_TiposEstoqueWizard
  Left = 392
  Top = 321
  Caption = 'Cadastro de tipos (Grupo/Unidade/Tipos de produto)'
  ClientHeight = 297
  ClientWidth = 458
  ExplicitWidth = 474
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 458
    Height = 232
    ActivePage = _tbsFicha
    ExplicitWidth = 458
    ExplicitHeight = 232
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 450
      ExplicitHeight = 204
      inherited _pnlSearch: TPanel
        Width = 450
        ExplicitWidth = 450
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        Width = 450
        Height = 166
        ExplicitWidth = 450
        ExplicitHeight = 166
        inherited _dbgLista: TJvDBUltimGrid
          Width = 446
          Height = 162
          Constraints.MinHeight = 88
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 445
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 450
      ExplicitHeight = 204
      inherited _pnlFicha: TPanel
        Width = 450
        Height = 204
        Constraints.MinHeight = 173
        ExplicitWidth = 450
        ExplicitHeight = 204
        inherited _ScrollBoxFicha: TScrollBox
          Width = 450
          Height = 204
          ExplicitWidth = 450
          ExplicitHeight = 204
          inherited _pnlScroll: TPanel
            Width = 450
            Height = 204
            ExplicitWidth = 450
            ExplicitHeight = 204
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 450
              Height = 204
              Align = alClient
              TabOrder = 0
              object Label1: TLabel
                Left = 19
                Top = 57
                Width = 60
                Height = 13
                Caption = 'Descri'#231#227'o '
              end
              object pnlTipo: TPanel
                Left = 80
                Top = 88
                Width = 273
                Height = 65
                TabOrder = 0
                Visible = False
                object Label2: TLabel
                  Left = 8
                  Top = 22
                  Width = 95
                  Height = 13
                  Caption = 'Tipo de cadastro'
                end
                object JvDBComboBox1: TJvDBComboBox
                  Left = 114
                  Top = 19
                  Width = 145
                  Height = 21
                  Items.Strings = (
                    'Grupo de cliente'
                    'Unidade'
                    'Tipo de produto')
                  TabOrder = 0
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                  ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                  ListSettings.OutfilteredValueFont.Color = clRed
                  ListSettings.OutfilteredValueFont.Height = -11
                  ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                  ListSettings.OutfilteredValueFont.Style = []
                end
              end
              object DBEdit1: TDBEdit
                Left = 90
                Top = 54
                Width = 282
                Height = 21
                DataField = 'DESCRICAO'
                DataSource = dtsFicha
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 232
    Width = 458
    ExplicitTop = 232
    ExplicitWidth = 458
    inherited _imageBottom: TImage
      Width = 458
      ExplicitWidth = 500
    end
    inherited _ToolBar: TToolBar
      Left = -145
      Top = 0
      ExplicitLeft = -145
      ExplicitTop = 0
      inherited ToolButton1: TToolButton
        ExplicitWidth = 65
        ExplicitHeight = 52
      end
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = CAD_TiposEstoqueDatamodule.cdsTiposCadastros
    Left = 179
    Top = 3
  end
  inherited dtsLista: TDataSource
    DataSet = CAD_TiposEstoqueDatamodule.cdsLstTiposCadastros
    Left = 138
    Top = 3
  end
end
