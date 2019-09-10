inherited Zoo_RelatorioProtocolosReprodutivosIATF: TZoo_RelatorioProtocolosReprodutivosIATF
  Left = 363
  Top = 241
  Caption = 'Protocolos reprodutivos e IATF'
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
        ActivePage = TabSheet2
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object gbOpcoes: TGroupBox
            Left = 3
            Top = 4
            Width = 454
            Height = 77
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 40
              Width = 13
              Height = 13
              Caption = 'De'
            end
            object Label2: TLabel
              Left = 181
              Top = 40
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object Label4: TLabel
              Left = 10
              Top = 13
              Width = 107
              Height = 13
              Caption = 'Protocolos no per'#237'odo '
            end
            object deInicial: TTcDateEdit
              Left = 42
              Top = 40
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
            end
            object deFinal: TTcDateEdit
              Left = 202
              Top = 40
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object DBGridResultados: TJvDBUltimGrid
            Left = 0
            Top = 0
            Width = 527
            Height = 252
            Align = alClient
            DataSource = dtsResultado
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = DBGridResultadosDrawColumnCell
            TitleButtons = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            SortWith = swUserFunc
            OnUserSort = DBGridResultadosUserSort
          end
          object gbMensagem: TPanel
            Left = 0
            Top = 252
            Width = 527
            Height = 35
            Align = alBottom
            Color = clSilver
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            object Image1: TImage
              Left = 553
              Top = 12
              Width = 17
              Height = 14
              AutoSize = True
              ParentShowHint = False
              Picture.Data = {
                07544269746D61700E030000424D0E0300000000000036000000280000001100
                00000E0000000100180000000000D80200000000000000000000000000000000
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF90DBFF00003A00
                0000000000000000000000000000000000000000000000000000000000000000
                3A0000FFDB90FFFFFF00DBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDB00DBFF
                FF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFDBFFFF003A90903A00FFFFDB00FFFFFF3A90DB000000FFB666FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF66B6FF000000DB
                903AFFFFFF00FFFFFFDBFFFF003A90903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFDBFFFF003A90903A00FFFFDBFFFFFF00FFFFFFFFFFFF
                90DBFF00003AFFB666FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF66B6
                FF3A0000FFDB90FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0066B6660000FFFFB6
                FFFFFFFFFFFF000000FFFFFFFFFFFFB6FFFF000066B66600FFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFB6FFFF000066DB903AFFFFFFFFFFFF000000FFFFFF
                FFFFFF3A90DB660000FFFFB6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF3A90DB660000FFFFB6FFFFFF000000FFFFFFB6FFFF000066DB903AFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A90B66600FF
                FFFF000000FFFFFF0066B6903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF90DBFF3A003AFFDB90FFFFFF90DBFF3A003AFF
                DB90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF0066B6903A00DBFFDB003A90B66600FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBFFFF003A900000
                00903A00FFFFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
              ShowHint = False
              Transparent = True
              Visible = False
            end
            object Label17: TLabel
              Left = 574
              Top = 11
              Width = 106
              Height = 14
              Caption = '- Tarefas em atraso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object lblTotalLinhas: TLabel
              Left = 21
              Top = 11
              Width = 72
              Height = 14
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  object dtsResultado: TDataSource
    DataSet = Zoo_RelatorioProtocolosReprodutivosIATFDataModule.cdsResultados
    Left = 426
    Top = 65
  end
end
