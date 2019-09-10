inherited Fin_CadastroPatrimonioWizard: TFin_CadastroPatrimonioWizard
  Left = 415
  Top = 188
  ActiveControl = DBEdit1
  Caption = 'Patrim'#244'nio'
  ClientHeight = 637
  ClientWidth = 795
  ActionList.Left = 480
  ExplicitWidth = 811
  ExplicitHeight = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Width = 795
    Height = 572
    ActivePage = _tbsFicha
    Font.Style = [fsBold]
    ExplicitWidth = 795
    ExplicitHeight = 572
    inherited _tbsLista: TTabSheet
      ExplicitWidth = 787
      ExplicitHeight = 544
      inherited _pnlSearch: TPanel
        Width = 787
        Height = 50
        ExplicitWidth = 787
        ExplicitHeight = 50
        inherited _lblPesquisas: TLabel
          Left = 4
          Top = 15
          ExplicitLeft = 4
          ExplicitTop = 15
        end
        inherited _edtSearch: TJvComboEdit
          Left = 72
          Top = 10
          ParentFont = False
          ExplicitLeft = 72
          ExplicitTop = 10
        end
        object cbxInativos: TCheckBox
          Left = 324
          Top = 15
          Width = 64
          Height = 17
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = cbxInativosClick
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 50
        Width = 787
        Height = 494
        ExplicitTop = 50
        ExplicitWidth = 787
        ExplicitHeight = 494
        object Label1: TLabel [0]
          Left = 176
          Top = 48
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel [1]
          Left = 264
          Top = 120
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
        end
        inherited _dbgLista: TJvDBUltimGrid
          Width = 783
          Height = 449
          Constraints.MinHeight = 88
          DrawingStyle = gdsThemed
          ParentColor = True
          ParentFont = True
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Style = []
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 188
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_COMPRA'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_IMOBILIZADO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_FINAL'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDA_UTIL'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Width = 8
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECATEGORIA'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBS'
              Width = 22
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 2
          Top = 451
          Width = 783
          Height = 41
          Align = alBottom
          Caption = ' '
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            783
            41)
          object Label21: TLabel
            Left = 353
            Top = 12
            Width = 110
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Total do patrim'#244'nio'
          end
          object DBText2: TDBText
            Left = 518
            Top = 12
            Width = 114
            Height = 17
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            DataField = 'TOTAL_PATRIMONIO'
            DataSource = dtsLista
          end
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 787
      ExplicitHeight = 544
      inherited _pnlFicha: TPanel
        Width = 787
        Height = 544
        Constraints.MinHeight = 173
        ExplicitWidth = 787
        ExplicitHeight = 544
        inherited _ScrollBoxFicha: TScrollBox
          Width = 787
          Height = 544
          ExplicitWidth = 787
          ExplicitHeight = 544
          inherited _pnlScroll: TPanel
            Width = 787
            Height = 544
            ExplicitWidth = 787
            ExplicitHeight = 544
            object Label3: TLabel
              Left = 7
              Top = 14
              Width = 40
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
            end
            object Label4: TLabel
              Left = 7
              Top = 46
              Width = 56
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit2
            end
            object Label5: TLabel
              Left = 7
              Top = 78
              Width = 74
              Height = 13
              Caption = 'Data compra'
            end
            object Label8: TLabel
              Left = 7
              Top = 141
              Width = 65
              Height = 13
              Caption = 'Quantidade'
              FocusControl = DBEdit6
            end
            object Label9: TLabel
              Left = 13
              Top = 210
              Width = 74
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Observa'#231#245'es'
              FocusControl = DBMemo1
            end
            object Label7: TLabel
              Left = 506
              Top = 78
              Width = 88
              Height = 13
              Caption = 'Imobilizado em'
            end
            object Label10: TLabel
              Left = 495
              Top = 174
              Width = 105
              Height = 13
              Caption = 'Valor total final R$'
            end
            object Label11: TLabel
              Left = 291
              Top = 174
              Width = 81
              Height = 13
              Caption = 'Vida '#250'til (ano)'
              FocusControl = DBEdit5
            end
            object Label12: TLabel
              Left = 252
              Top = 141
              Width = 95
              Height = 13
              Caption = 'Valor unit'#225'rio R$'
            end
            object Label13: TLabel
              Left = 529
              Top = 141
              Width = 81
              Height = 13
              Caption = 'Valor total R$ '
            end
            object Label14: TLabel
              Left = 598
              Top = 14
              Width = 36
              Height = 13
              Caption = 'Status'
            end
            object Label15: TLabel
              Left = 487
              Top = 110
              Width = 46
              Height = 13
              Caption = 'Unidade'
            end
            object lblUnidade: TLabel
              Left = 638
              Top = 110
              Width = 88
              Height = 13
              Cursor = crHandPoint
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '(Nova unidade)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = lblUnidadeClick
            end
            object Label16: TLabel
              Left = 506
              Top = 46
              Width = 62
              Height = 13
              Caption = 'Data baixa'
            end
            object DBText1: TDBText
              Left = 617
              Top = 141
              Width = 109
              Height = 17
              DataField = 'VALOR_TOTAL'
              DataSource = dtsFicha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 7
              Top = 110
              Width = 56
              Height = 13
              Caption = 'Categoria'
            end
            object Label20: TLabel
              Left = 249
              Top = -6
              Width = 31
              Height = 13
              Caption = 'Setor'
              Visible = False
            end
            object Label18: TLabel
              Left = 7
              Top = 174
              Width = 142
              Height = 13
              Caption = 'Apropria'#231#227'o depreciac'#227'o'
            end
            object DBEdit1: TDBEdit
              Left = 106
              Top = 11
              Width = 121
              Height = 21
              DataField = 'CODIGO'
              DataSource = dtsFicha
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 106
              Top = 43
              Width = 365
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dtsFicha
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 106
              Top = 138
              Width = 121
              Height = 21
              DataField = 'QUANTIDADE'
              DataSource = dtsFicha
              TabOrder = 9
            end
            object DBMemo1: TDBMemo
              Left = 9
              Top = 229
              Width = 717
              Height = 292
              Anchors = [akLeft, akTop, akBottom]
              DataField = 'OBS'
              DataSource = dtsFicha
              TabOrder = 15
            end
            object TcMPDBDateEdit1: TTcDBDateEdit
              Left = 106
              Top = 75
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA_COMPRA'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              TabOrder = 4
            end
            object DBEdit5: TDBEdit
              Left = 398
              Top = 171
              Width = 83
              Height = 21
              DataField = 'VIDA_UTIL'
              DataSource = dtsFicha
              TabOrder = 12
            end
            object TcMPDBDateEdit2: TTcDBDateEdit
              Left = 605
              Top = 75
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA_IMOBILIZADO'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object cbStatus: TJvDBComboBox
              Left = 641
              Top = 11
              Width = 85
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'ATIVO'
              DataSource = dtsFicha
              Items.Strings = (
                'Ativo'
                'Inativo')
              TabOrder = 1
              Values.Strings = (
                'T'
                'F')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
              OnChange = cbStatusChange
            end
            object dblkUnidade: TJvDBLookupCombo
              Left = 549
              Top = 107
              Width = 76
              Height = 21
              DataField = 'DESC_UNIDADE'
              DataSource = dtsFicha
              ListStyle = lsDelimited
              TabOrder = 7
              UseRecordCount = True
            end
            object TcMPDBDateEdit3: TTcDBDateEdit
              Left = 605
              Top = 43
              Width = 121
              Height = 21
              Checked = False
              DataField = 'DATA_BAIXA'
              DataSource = dtsFicha
              CheckOnExit = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBEdit3: TJvDBCalcEdit
              Left = 360
              Top = 138
              Width = 121
              Height = 21
              DisplayFormat = ',0.00'
              ShowButton = False
              TabOrder = 10
              ZeroEmpty = False
              DecimalPlacesAlwaysShown = True
              DataField = 'VALOR_UNITARIO'
              DataSource = dtsFicha
              DefaultParams = True
            end
            object DBEdit4: TJvDBCalcEdit
              Left = 605
              Top = 171
              Width = 121
              Height = 21
              DisplayFormat = ',0.00'
              ShowButton = False
              TabOrder = 13
              ZeroEmpty = False
              DecimalPlacesAlwaysShown = True
              DataField = 'VALOR_FINAL'
              DataSource = dtsFicha
              DefaultParams = True
            end
            object edCategoria: TJvDBComboEdit
              Left = 106
              Top = 107
              Width = 366
              Height = 21
              Color = clWhite
              DataField = 'NOMECATEGORIA'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 6
              OnButtonClick = edCategoriaButtonClick
              OnKeyPress = edCategoriaKeyPress
            end
            object GroupBox1: TGroupBox
              Left = 719
              Top = 280
              Width = 719
              Height = 228
              Anchors = [akLeft, akTop, akBottom]
              Caption = 'Deprecia'#231#227'o'
              TabOrder = 14
              Visible = False
              DesignSize = (
                719
                228)
              object Label17: TLabel
                Left = 61
                Top = 190
                Width = 231
                Height = 28
                Anchors = [akLeft, akBottom]
                Caption = 
                  'A deprecia'#231#227'o ser'#225' calculada automaticamente '#13#10'ao salvar caso ne' +
                  'huma seja informada.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 51
                Top = 49
                Width = 139
                Height = 13
                Caption = 'Parcelas da deprecia'#231#227'o'
                FocusControl = DBMemo1
              end
              object btnRemoveItem: TTcGDIButton
                Left = 529
                Top = 190
                Width = 140
                Height = 26
                Anchors = [akLeft, akBottom]
                Caption = 'Remove deprecia'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                Picture.Data = {
                  424D380500000000000036000000280000001500000014000000010018000000
                  000002050000120B0000120B000000000000000000008300E58300E58300E5DD
                  DBDBBAB8B8B4B2B1BBB8B89491927D797A837E7F8F8B8B9A9696A4A09FA3A0A5
                  3636B16967A8BFBDBCB3B0AF8300E58300E58300E5008300E58300E5C4C2C1AD
                  AAA9E4E2E1D4D3D2716C6D7B76788D898A9E9A9AADA9A9BBB7B6C6C3C1A3A2B7
                  5757D46060D67171BFC6C3C38300E58300E58300E5008300E5C2C0C0C1BEBDE5
                  E4E3F1F1F09894957D787A908B8C98949A8B889E9592A89D9BB0A5A2B78887AD
                  5555D37D7DDD6D6DD96867B78300E58300E58300E500D4D3D2AEABAAE7E6E5F2
                  F2F1FAF9F9A09D9E918D8EA29E9E6D6BA84C4CD15151D25151D25151D25151D2
                  5F5FD66F6FDA6F6FDA6464D77676D0D9D8DC8300E500AAA8A7E8E7E6E1E0E0D9
                  D7D8E0DFE0BDBABBA4A09FB2AEAD7574B25A5AD46060D66060D66060D66060D6
                  6060D66060D66060D66060D65A5AD45555CDD9D8DC00B8B5B5A09E9E706B6D83
                  7E80959192A5A1A1B3AFAFC0BCBB7C7BBC5454D35454D35454D35454D35454D3
                  5454D35454D35454D35454D35454D35252D27575CD00ADAAAA726D6F86818297
                  9394A7A3A2B5B1B0C1BDBCCBC9C78281C44D4DD14747D04747D04747D04747D0
                  4747D04747D04747D04747D04949D05E5ED1D9D8DC007A7577878384999595A8
                  A4A4B6B2B1C2BFBDCCCAC8D5D3D28786CC5252D24949D04949D04949D04949D0
                  4141CE3939CC3939CC4141CE6262D3D9D8DC8300E500817C7D9B9797AAA6A6B8
                  B4B3C3C0BFCDCBC9D6D4D2DDDCDACDCCDDCCCBE3CECDE6D0CFE8D0D0E89F9EDE
                  5555D33232C23D3DCD6968CFD9D8DC8300E58300E5008F8B8BACA8A7B9B5B4C4
                  C1C0CFCCCAD7D5D3DEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECEEEDECB9B8CE
                  5757D43737CB7574D6B5B2B78300E58300E58300E5009B9797BAB7B6C6C3C1CF
                  CDCBD8D6D4DFDDDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECEEEDECECEBEAD0CFD9
                  6F6FDA9493DACCCBCEBAB8B78300E58300E58300E500A6A2A1C7C4C2D1CECCD9
                  D7D5DFDEDCE5E4E3E9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3E1
                  DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E500AFACABD1CFCDD9D8D6E0
                  DFDDE5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDCDA
                  D6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E500B7B4B3DAD9D7E1DFDEE5
                  E4E3EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E8E6E5E3E1E0DDDBDAD5D3D2
                  CCCAC8C2BFBEB7B3B2A8A4A48300E58300E58300E500BDBABAE1E0DEE5E4E3EA
                  E9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5E2E1DFDCDAD9D5D3D1CCC9C7
                  C1BEBCB5B1B0A7A3A39F9C9C8300E58300E58300E500C2C0BFE7E6E5EBEAE9ED
                  ECEBEEEDECEEEDECEDECEBEAE9E8E5E4E3E2E0DFDBDAD8D4D2D0CAC8C6C0BCBB
                  B4B0AFA6A2A19692929692928300E58300E58300E500C6C4C3EBEAE9EDECEBEE
                  EDECEEEDECEDECEBEAE9E8E5E4E3E1DFDEDAD9D7D3D1CFC9C7C5BEBBBAB2AEAE
                  A4A0A0949090827D7F8B87888300E58300E58300E500C9C7C6EDECECEEEDECEE
                  EDECECEBEBEAE9E7E5E4E3E0DFDDDAD8D6D2D0CEC8C6C4BDBAB9B1ADACA29E9E
                  928E8E807B7D6C6769807C7C8300E58300E58300E500CAC8C8EEEDECEEEDECEC
                  EBEAE9E8E7E5E4E3DFDEDCD9D7D5D1CFCDC7C4C2BCB8B7AFABABA19D9C908C8D
                  7D797A6A6566555051736F708300E58300E58300E500B0ADADCAC8C8C9C7C7C7
                  C5C4C4C2C1C0BDBDBBB8B7B5B2B1AEAAA9A5A1A19C9897918D8D858081777273
                  6863645853544642436D6A6A8300E58300E58300E5000000}
                TabOrder = 0
                OnClick = btnRemoveItemClick
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
              object dgbDepreciacao: TJvDBUltimGrid
                Left = 52
                Top = 68
                Width = 617
                Height = 106
                Anchors = [akLeft, akTop, akBottom]
                DataSource = dtsDepreciacao
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <
                  item
                    ControlName = 'edtData'
                    FieldName = 'DATA'
                    FitCell = fcCellSize
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end
                  item
                    ControlName = 'edtDataBaixa'
                    FieldName = 'DATA_BAIXA'
                    FitCell = fcBiggest
                    LeaveOnEnterKey = True
                    LeaveOnUpDownKey = True
                  end>
                RowsHeight = 17
                TitleRowHeight = 17
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 125
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_PATRIMONIO'
                    Width = 144
                    Visible = True
                  end>
              end
              object edtData: TTcDBDateEdit
                Left = 217
                Top = 58
                Width = 121
                Height = 21
                Checked = False
                DataField = 'DATA'
                DataSource = dtsDepreciacao
                CheckOnExit = False
                Color = clWhite
                TabOrder = 2
                Visible = False
              end
            end
            object edSetor: TJvDBComboEdit
              Left = 356
              Top = -8
              Width = 366
              Height = 21
              Color = clWhite
              DataField = 'NOMESETOR'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 8
              Visible = False
              OnButtonClick = edSetorButtonClick
              OnKeyPress = edSetorKeyPress
            end
            object edContaDepreciacao: TJvDBComboEdit
              Left = 162
              Top = 171
              Width = 120
              Height = 21
              DataField = 'DESCR_PC_NOME'
              DataSource = dtsFicha
              ImageKind = ikEllipsis
              ButtonWidth = 15
              TabOrder = 11
              OnButtonClick = edContaDepreciacaoButtonClick
              OnChange = edContaDepreciacaoChange
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 572
    Width = 795
    ExplicitTop = 572
    ExplicitWidth = 795
    inherited _imageBottom: TImage
      Width = 795
      ExplicitWidth = 795
    end
    inherited _ToolBar: TToolBar
      Left = 49
      ExplicitLeft = 49
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    Left = 480
    object actFichaDepreciacao: TAction
      Category = 'Print'
      Caption = 'Depreciacao Ficha'
      OnExecute = actFichaDepreciacaoExecute
    end
    object actListaDepreciacao: TAction
      Category = 'Print'
      Caption = 'Lista Deprecia'#231#227'o'
      OnExecute = actListaDepreciacaoExecute
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Fin_CadastroPatrimonioDatamodule.cdsCadPatrimonio
    Left = 744
    Top = 353
  end
  inherited dtsLista: TDataSource
    DataSet = Fin_CadastroPatrimonioDatamodule.cdsLstCadPatrimonio
    OnDataChange = dtsListaDataChange
    Left = 751
    Top = 301
  end
  inherited _popMenuPrint: TPopupMenu
    object DepreciacaoFicha1: TMenuItem
      Action = actListaDepreciacao
      Caption = 'Lista Completa'
    end
    object ListaDepreciao1: TMenuItem
      Action = actFichaDepreciacao
    end
  end
  inherited ToolBarIcons: TImageListProvider
    Left = 751
    Top = 248
  end
  object dtsDepreciacao: TDataSource
    DataSet = Fin_CadastroPatrimonioDatamodule.cdsDepreciacao
    Left = 747
    Top = 408
  end
end
