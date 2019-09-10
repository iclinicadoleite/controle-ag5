inherited Zoo_AtividadesCiosCoberturasWizard: TZoo_AtividadesCiosCoberturasWizard
  Left = 546
  Top = 265
  Caption = 'Atividades - Cios / Coberturas'
  ClientWidth = 653
  ExplicitWidth = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 653
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 653
    inherited _pnlFooter: TJvPanel
      Width = 649
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 649
      inherited _imageBottom: TImage
        Width = 649
        ExplicitWidth = 649
      end
      inherited _btbPrior: TTcGDIButton
        Left = 458
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 458
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 549
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 549
      end
      inherited _btbExecute: TTcGDIButton
        Left = 564
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 564
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 649
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 649
      inherited PageControl: TJvPageControl
        Width = 649
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitWidth = 649
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 649
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 75
            Top = 74
            Width = 49
            Height = 13
            Caption = 'Cios at'#233' : '
          end
          object deAte: TTcDateEdit
            Left = 137
            Top = 71
            Width = 86
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
            OnExit = deAteExit
          end
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 649
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Width = 649
            Height = 260
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 649
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            ExplicitTop = 379
            ExplicitWidth = 619
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
    DataSet = Zoo_AtividadesCiosCoberturasDatamodule.cdsACioCobertura
    Left = 402
    Top = 80
  end
end
