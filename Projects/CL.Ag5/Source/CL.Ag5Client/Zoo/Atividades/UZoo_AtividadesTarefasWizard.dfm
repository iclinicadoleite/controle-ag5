inherited Zoo_AtividadesTarefasWizard: TZoo_AtividadesTarefasWizard
  Left = 440
  Top = 242
  Caption = 'Atividades - Tarefas'
  ClientWidth = 687
  OnActivate = TcFormActivate
  ActionList.Left = 506
  ActionList.Top = 4
  ExplicitWidth = 693
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 687
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitWidth = 687
    inherited _pnlFooter: TJvPanel
      Width = 683
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 683
      inherited _imageBottom: TImage
        Width = 683
        ExplicitWidth = 683
      end
      object Label2: TLabel [1]
        Left = 112
        Top = 8
        Width = 265
        Height = 13
        Caption = '* Descarte calculado em fun'#231#227'o das tarefas em atraso.'
        Transparent = True
      end
      inherited _btbPrior: TTcGDIButton
        Left = 492
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 492
      end
      inherited _btbCancel: TTcGDIButton
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
      end
      inherited _btbNext: TTcGDIButton
        Left = 583
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 583
      end
      inherited _btbExecute: TTcGDIButton
        Left = 598
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitLeft = 598
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 683
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 683
      inherited PageControl: TJvPageControl
        Width = 683
        Margins.Left = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 3
        ExplicitWidth = 683
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 683
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 64
            Top = 89
            Width = 118
            Height = 13
            Caption = 'Tarefas a executar at'#233' :'
          end
          object deAte: TTcDateEdit
            Left = 193
            Top = 86
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
          ExplicitWidth = 683
          ExplicitHeight = 287
          inherited DBGridResultados: TJvDBUltimGrid
            Width = 683
            Height = 260
          end
          object Panel3: TPanel
            Left = 0
            Top = 260
            Width = 683
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            ExplicitWidth = 527
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
  inherited ActionList: TInternalActionList
    Left = 506
    Top = 4
  end
  inherited dtsResultado: TDataSource
    DataSet = Zoo_AtividadesTarefasDatamodule.cdsATarefas
    Left = 258
    Top = 8
  end
end
