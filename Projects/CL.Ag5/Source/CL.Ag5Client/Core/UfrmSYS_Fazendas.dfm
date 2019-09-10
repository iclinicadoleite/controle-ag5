inherited frmCustomListaFicha: TfrmCustomListaFicha
  Left = 347
  Top = 160
  Caption = 'frmCustomListaFicha'
  ExplicitLeft = 347
  ExplicitTop = 160
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    ActivePage = _tbsFicha
    inherited _tbsLista: TTabSheet
      inherited _pnlSearch: TPanel
        inherited _edtSearch: TJvComboEdit
          ParentFont = False
        end
      end
      inherited _pnldbgLista: TPanel
        inherited _dbgLista: TJvDBUltimGrid
          Constraints.MinHeight = 88
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 363
      inherited _pnlFicha: TPanel
        Constraints.MinHeight = 173
        ExplicitHeight = 363
        inherited _ScrollBoxFicha: TScrollBox
          ExplicitHeight = 363
          inherited _pnlScroll: TPanel
            ExplicitHeight = 363
          end
        end
      end
    end
  end
end
