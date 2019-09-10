inherited Zoo_AtividadesPartosWizard: TZoo_AtividadesPartosWizard
  Left = 350
  Top = 220
  Caption = 'Atividades - Partos'
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
          object deAte: TTcDateEdit
            Left = 228
            Top = 78
            Width = 87
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
            OnExit = deAteExit
          end
          object StaticText1: TStaticText
            Left = 97
            Top = 82
            Width = 120
            Height = 17
            Caption = 'Previs'#227'o de partos at'#233' :'
            TabOrder = 1
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
            ExplicitWidth = 649
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
    DataSet = Zoo_AtividadesPartosDatamodule.cdsAPartos
  end
end
