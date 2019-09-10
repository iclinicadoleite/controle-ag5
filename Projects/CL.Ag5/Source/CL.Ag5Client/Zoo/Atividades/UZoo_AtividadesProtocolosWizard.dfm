inherited Zoo_AtividadesProtocolosWizard: TZoo_AtividadesProtocolosWizard
  Left = 394
  Top = 240
  Caption = 'Atividades - Protocolos'
  ExplicitLeft = 394
  ExplicitTop = 240
  ExplicitHeight = 240
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
            Left = 33
            Top = 54
            Width = 179
            Height = 13
            Caption = 'Protocolos a serem executados at'#233' : '
          end
          object deAte: TTcDateEdit
            Left = 225
            Top = 51
            Width = 83
            Height = 21
            Checked = False
            CheckOnExit = False
            ButtonWidth = 19
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited dtsResultado: TDataSource
    DataSet = Zoo_AtividadesProtocolosDatamodule.cdsAProtocolos
  end
end
