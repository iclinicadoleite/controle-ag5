inherited Zoo_RelatorioSISBOV: TZoo_RelatorioSISBOV
  Left = 448
  Top = 255
  Caption = 'Relat'#243'rio - SISBOV'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      inherited _btbExecute: TTcGDIButton
        Caption = 'V&isualizar'
      end
    end
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        ActivePage = TabSheetParametros
        object TabSheetParametros: TTabSheet
          Caption = 'TabSheetParametros'
          object Label3: TLabel
            Left = 12
            Top = 39
            Width = 62
            Height = 13
            Caption = 'Certificadora'
            FocusControl = DBLookupComboBox1
          end
          object RadioGroup1: TRadioGroup
            Left = 80
            Top = 80
            Width = 105
            Height = 105
            Caption = 'Tipo Relat'#243'rio '
            ItemIndex = 0
            Items.Strings = (
              'Animal'
              'Movimenta'#231#227'o'
              'Corte')
            TabOrder = 0
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 80
            Top = 35
            Width = 277
            Height = 21
            DataField = 'LISTA_CERTIFICADORAS'
            DataSource = dtsFazenda
            TabOrder = 1
          end
        end
        object TabSheetResultado: TTabSheet
          Caption = 'TabSheetResultado'
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 287
            Align = alClient
            DataSource = dtsAnimais
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'BRINCO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMEESTABULO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 90
                Visible = True
              end>
          end
        end
      end
    end
  end
  object dtsFazenda: TDataSource
    DataSet = Zoo_RelatorioSISBOVDatamodule.cdsFazenda
    Left = 278
    Top = 37
  end
  object dtsAnimais: TDataSource
    DataSet = Zoo_RelatorioSISBOVDatamodule.cdsAnimais
    Left = 390
    Top = 37
  end
end
