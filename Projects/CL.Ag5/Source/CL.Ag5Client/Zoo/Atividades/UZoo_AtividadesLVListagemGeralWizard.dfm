inherited Zoo_AtividadesLVListagemGeralWizard: TZoo_AtividadesLVListagemGeralWizard
  Left = 428
  Top = 276
  Caption = 'Atividades - Listagem Geral'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlDetail: TJvPanel
      inherited PageControl: TJvPageControl
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 527
          ExplicitHeight = 287
          object Label1: TLabel
            Left = 55
            Top = 48
            Width = 93
            Height = 13
            Caption = 'Listar animais at'#233' : '
          end
          object deAte: TTcDateEdit
            Left = 161
            Top = 45
            Width = 84
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
            ExplicitTop = 321
            ExplicitWidth = 928
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
end
