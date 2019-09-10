inherited frmFIN_TransferenciaValores: TfrmFIN_TransferenciaValores
  Left = 219
  Top = 185
  Caption = 'Transfer'#234'ncia de valores entre contas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    ActivePage = _tbsFicha
    ExplicitLeft = -5
    ExplicitTop = -8
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
        inherited _ScrollBoxFicha: TScrollBox
          inherited _pnlScroll: TPanel
            object Label1: TLabel
              Left = 26
              Top = 31
              Width = 118
              Height = 13
              Caption = 'Data da tranfer'#234'ncia'
            end
            object Label2: TLabel
              Left = 287
              Top = 84
              Width = 109
              Height = 13
              Caption = 'Documento origem'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 287
              Top = 132
              Width = 110
              Height = 13
              Caption = 'Documento destino'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 287
              Top = 31
              Width = 29
              Height = 13
              Caption = 'Valor'
            end
            object Label5: TLabel
              Left = 26
              Top = 211
              Width = 74
              Height = 13
              Caption = 'Observa'#231#245'es'
              FocusControl = DBMemo1
            end
            object Label6: TLabel
              Left = 26
              Top = 84
              Width = 78
              Height = 13
              Caption = 'Conta origem'
              FocusControl = DBEdit2
            end
            object Label7: TLabel
              Left = 26
              Top = 132
              Width = 79
              Height = 13
              Caption = 'Conta destino'
              FocusControl = DBEdit3
            end
            object DBEdit2: TDBEdit
              Left = 287
              Top = 103
              Width = 185
              Height = 21
              DataField = 'DOC_ORIGEM'
              DataSource = dtsFicha
              TabOrder = 3
            end
            object DBEdit3: TDBEdit
              Left = 287
              Top = 151
              Width = 159
              Height = 21
              DataField = 'DOC_DESTINO'
              DataSource = dtsFicha
              TabOrder = 5
            end
            object TcDBCalcEdit1: TTcDBCalcEdit
              Left = 287
              Top = 47
              Width = 121
              Height = 21
              Checked = False
              Color = clWhite
              DisplayFormat = '0.00'
              TabOrder = 1
              DecimalPlacesAlwaysShown = True
              DataField = 'VALOR'
              DataSource = dtsFicha
            end
            object DBMemo1: TDBMemo
              Left = 26
              Top = 230
              Width = 473
              Height = 89
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 6
            end
            object TcDBDateEdit1: TTcDBDateEdit
              Left = 26
              Top = 49
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              TabOrder = 0
            end
            object edConta: TJvDBComboEdit
              Left = 26
              Top = 103
              Width = 176
              Height = 21
              DataField = 'NOMECONTA_ORIGEM'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 2
              OnButtonClick = edContaButtonClick
            end
            object JvDBComboEdit1: TJvDBComboEdit
              Left = 26
              Top = 152
              Width = 176
              Height = 21
              DataField = 'NOMECONTA_DESTINO'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 4
              OnButtonClick = JvDBComboEdit1ButtonClick
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmFIN_TransferenciaValores.cdsTransferencia
  end
  inherited dtsLista: TDataSource
    Left = 538
  end
end
