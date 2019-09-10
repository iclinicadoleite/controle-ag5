inherited Zoo_AtividadesDiarioDaMastiteWizard: TZoo_AtividadesDiarioDaMastiteWizard
  Left = 440
  Top = 242
  Caption = 'Di'#225'rio da mastite'
  ClientWidth = 817
  ActionList.Left = 506
  ActionList.Top = 4
  ExplicitWidth = 823
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 817
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 817
    inherited _pnlFooter: TJvPanel
      Width = 813
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 813
      inherited _imageBottom: TImage
        Width = 813
        ExplicitWidth = 683
      end
      inherited _btbPrior: TTcGDIButton
        Left = 622
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 622
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 713
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 713
      end
      inherited _btbExecute: TTcGDIButton
        Left = 728
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 728
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 813
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 813
      inherited PageControl: TJvPageControl
        Width = 813
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitWidth = 813
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 813
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 64
            Top = 48
            Width = 118
            Height = 13
            Caption = 'Tarefas a executar at'#233' :'
          end
          object RadioGroup1: TRadioGroup
            Left = 64
            Top = 83
            Width = 360
            Height = 79
            Caption = ' Funcion'#225'rio'
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Pesquisar')
            TabOrder = 1
          end
          object deAte: TTcDateEdit
            Left = 193
            Top = 45
            Width = 88
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
          end
          object edFuncionario: TTcComboEdit
            Left = 193
            Top = 132
            Width = 217
            Height = 21
            Checked = False
            ButtonWidth = 17
            ImageKind = ikEllipsis
            TabOrder = 2
            Text = ''
            OnButtonClick = edFuncionarioButtonClick
            OnChange = edFuncionarioChange
            OnKeyPress = edFuncionarioKeyPress
          end
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 813
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Width = 813
            Height = 253
            OnDrawColumnCell = DBGridResultadosDrawColumnCell
          end
          object gbMensagem: TPanel
            Left = 0
            Top = 253
            Width = 813
            Height = 34
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
              StyleElements = [seClient, seBorder]
            end
            object Label19: TLabel
              Left = 17
              Top = 11
              Width = 138
              Height = 14
              Caption = 'NL - N'#250'mero da Lacta'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label20: TLabel
              Left = 366
              Top = 11
              Width = 116
              Height = 14
              Caption = 'DPS - Dias Para Secar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label23: TLabel
              Left = 199
              Top = 11
              Width = 111
              Height = 14
              Caption = 'DPP - Dias P'#243's-Parto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object lblTotalLinhas: TLabel
              Left = 713
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
    Left = 506
    Top = 4
  end
  inherited dtsResultado: TDataSource
    DataSet = Zoo_AtividadesDiarioDaMastiteDatamodule.cdsTarefas
    Left = 66
    Top = 88
  end
end
