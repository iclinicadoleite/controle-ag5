inherited frmFIN_Bancos: TfrmFIN_Bancos
  Left = 455
  Top = 215
  Caption = 'Bancos'
  ActionList.Left = 152
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    inherited _tbsLista: TTabSheet
      inherited _pnldbgLista: TPanel
        inherited _dbgLista: TJvDBUltimGrid
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOMEPAGE'
              Width = 314
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEBRABAN'
              Width = 70
              Visible = True
            end>
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
              Left = 32
              Top = 31
              Width = 40
              Height = 13
              Caption = 'C'#243'digo'
            end
            object Label2: TLabel
              Left = 39
              Top = 67
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object Label3: TLabel
              Left = 13
              Top = 104
              Width = 61
              Height = 13
              Caption = 'Homepage'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 87
              Top = 139
              Width = 164
              Height = 17
              Caption = 'Assossiado a FEBRABAN'
              DataField = 'FEBRABAN'
              DataSource = dtsFicha
              TabOrder = 3
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            object DBEdit1: TDBEdit
              Left = 87
              Top = 28
              Width = 43
              Height = 21
              DataField = 'CODIGO'
              DataSource = dtsFicha
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 87
              Top = 64
              Width = 320
              Height = 21
              DataField = 'NOME'
              DataSource = dtsFicha
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 87
              Top = 101
              Width = 320
              Height = 21
              DataField = 'HOMEPAGE'
              DataSource = dtsFicha
              TabOrder = 2
            end
            object btnImportaBancos: TTcGDIButton
              Left = 32
              Top = 178
              Width = 241
              Height = 25
              Caption = 'Importar Lista de bancos'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 4
              Visible = False
              Appearance.ColorChecked = 16111818
              Appearance.ColorCheckedTo = 16367008
              Appearance.ColorDisabled = 15921906
              Appearance.ColorDisabledTo = 15921906
              Appearance.ColorDown = 16111818
              Appearance.ColorDownTo = 16367008
              Appearance.ColorHot = 16117985
              Appearance.ColorHotTo = 16372402
              Appearance.ColorMirrorHot = 16107693
              Appearance.ColorMirrorHotTo = 16775412
              Appearance.ColorMirrorDown = 16102556
              Appearance.ColorMirrorDownTo = 16768988
              Appearance.ColorMirrorChecked = 16102556
              Appearance.ColorMirrorCheckedTo = 16768988
              Appearance.ColorMirrorDisabled = 11974326
              Appearance.ColorMirrorDisabledTo = 15921906
            end
          end
        end
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 152
  end
  inherited dtsFicha: TDataSource
    DataSet = dtmFIN_Bancos.cdsBanco
    Left = 323
    Top = 8
  end
  inherited dtsLista: TDataSource
    DataSet = dtmFIN_Bancos.cdsLstBancos
    Left = 283
    Top = 8
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 687
    Top = 36
  end
end
