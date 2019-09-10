inherited Zoo_AtividadesSecagemWizard: TZoo_AtividadesSecagemWizard
  Left = 509
  Top = 399
  Caption = 'Atividades - Secagem'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    inherited _pnlFooter: TJvPanel
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      inherited _btbPrior: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbExecute: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
    end
    inherited _pnlDetail: TJvPanel
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      inherited PageControl: TJvPageControl
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 527
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 64
            Top = 64
            Width = 72
            Height = 13
            Caption = 'Secagens at'#233' :'
          end
          object deAte: TTcDateEdit
            Left = 147
            Top = 61
            Width = 88
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
          end
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 527
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Height = 260
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 527
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object lblTotalLinhas: TLabel
              Left = 16
              Top = 7
              Width = 64
              Height = 13
              Caption = 'lblTotalLinhas'
            end
          end
        end
      end
    end
  end
  inherited dtsResultado: TDataSource
    DataSet = Zoo_AtividadesSecagemDatamodule.cdsASecagens
  end
end
