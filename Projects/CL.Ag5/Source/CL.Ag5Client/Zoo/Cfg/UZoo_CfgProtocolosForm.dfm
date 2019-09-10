inherited Zoo_CfgProtocolosForm: TZoo_CfgProtocolosForm
  Left = 377
  Top = 199
  Caption = 'Protocolos'
  ClientHeight = 612
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pageControl: TPageControl
    Height = 547
    ActivePage = _tbsFicha
    ExplicitHeight = 547
    inherited _tbsLista: TTabSheet
      ExplicitHeight = 519
      inherited _pnlSearch: TPanel
        Height = 33
        ExplicitHeight = 33
        inherited _lblPesquisas: TLabel
          Left = 56
          Top = 11
          ExplicitLeft = 56
          ExplicitTop = 11
        end
        inherited _edtSearch: TJvComboEdit
          Left = 117
          Top = 7
          ParentFont = False
          ExplicitLeft = 117
          ExplicitTop = 7
        end
        object CheckBox1: TCheckBox
          Left = 372
          Top = 11
          Width = 165
          Height = 17
          Caption = 'Exibir protocolos inativos'
          TabOrder = 1
          OnClick = CheckBox1Click
        end
      end
      inherited _pnldbgLista: TPanel
        Top = 33
        Height = 486
        ExplicitTop = 33
        ExplicitHeight = 486
        inherited _dbgLista: TJvDBUltimGrid
          Height = 482
          Constraints.MinHeight = 109
          OnCheckIfBooleanField = _dbgListaCheckIfBooleanField
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'Protocolo'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Descri'#231#227'o'
              Width = 268
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_TIPOPROTOCOLO'
              Title.Caption = 'Tipo protocolo'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UI'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DI'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$UU'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYS$DU'
              Width = 80
              Visible = True
            end>
        end
      end
    end
    inherited _tbsFicha: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 519
      inherited _pnlFicha: TPanel
        Height = 519
        Constraints.MinHeight = 213
        ExplicitHeight = 519
        inherited _ScrollBoxFicha: TScrollBox
          Height = 519
          ExplicitHeight = 519
          inherited _pnlScroll: TPanel
            Height = 468
            Align = alTop
            ExplicitHeight = 468
            object Label1: TLabel
              Left = 25
              Top = 30
              Width = 53
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Protocolo'
              FocusControl = DBEdit1
            end
            object Label3: TLabel
              Left = 380
              Top = 30
              Width = 56
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit2
            end
            object Label7: TLabel
              Left = 560
              Top = 3
              Width = 29
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Ativo'
              FocusControl = JvDBComboBox2
            end
            object Label5: TLabel
              Left = 23
              Top = 3
              Width = 81
              Height = 13
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = 'Tipo Protocolo'
              FocusControl = DBLookupComboBox1
            end
            object DBEdit1: TDBEdit
              Left = 88
              Top = 27
              Width = 269
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'CODIGO'
              DataSource = dtsFicha
              TabOrder = 2
            end
            object DBEdit2: TDBEdit
              Left = 444
              Top = 27
              Width = 239
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              AutoSize = False
              DataField = 'NOME'
              DataSource = dtsFicha
              TabOrder = 3
              OnExit = DBEdit2Exit
            end
            object JvDBComboBox2: TJvDBComboBox
              Left = 599
              Top = 0
              Width = 84
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
              TabStop = False
              Values.Strings = (
                'T'
                'F')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Verdana'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 114
              Top = 0
              Width = 179
              Height = 21
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              DataField = 'DESC_TIPOPROTOCOLO'
              DataSource = DataSource1
              TabOrder = 0
            end
            object Panel1: TPanel
              Left = 28
              Top = 57
              Width = 489
              Height = 411
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Anchors = [akLeft, akTop, akBottom]
              BorderWidth = 1
              Caption = '_pnldbgLista'
              Color = clSilver
              ParentBackground = False
              TabOrder = 4
              object DBCtrlGrid1: TDBCtrlGrid
                Left = 2
                Top = 2
                Width = 485
                Height = 407
                Align = alClient
                AllowDelete = False
                AllowInsert = False
                Color = clWhite
                DataSource = dtsTarefas
                PanelHeight = 135
                PanelWidth = 468
                ParentColor = False
                TabOrder = 0
                object Label2: TLabel
                  Left = 5
                  Top = 39
                  Width = 75
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Iniciar no dia'
                  FocusControl = edTarefa
                end
                object Label10: TLabel
                  Left = 182
                  Top = 39
                  Width = 139
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'N'#250'mero de vezes ao dia'
                  FocusControl = edTarefa
                end
                object Label9: TLabel
                  Left = 5
                  Top = 70
                  Width = 84
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Replicar tarefa'
                  FocusControl = edTarefa
                end
                object Label4: TLabel
                  Left = 182
                  Top = 10
                  Width = 56
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Descri'#231#227'o'
                  FocusControl = edTarefa
                end
                object DBText1: TDBText
                  Left = 5
                  Top = 9
                  Width = 65
                  Height = 17
                  DataField = 'EXAME'
                  DataSource = dtsTarefas
                end
                object Label6: TLabel
                  Left = 5
                  Top = 102
                  Width = 74
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'Observa'#231#245'es'
                  FocusControl = edTarefa
                end
                object Label8: TLabel
                  Left = 182
                  Top = 70
                  Width = 42
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'a cada '
                  FocusControl = edTarefa
                end
                object Label11: TLabel
                  Left = 283
                  Top = 70
                  Width = 33
                  Height = 13
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  Caption = 'dia(s)'
                  FocusControl = edTarefa
                end
                object edTarefa: TJvDBComboEdit
                  Left = 252
                  Top = 8
                  Width = 201
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'NOME'
                  DataSource = dtsTarefas
                  ImageKind = ikEllipsis
                  ButtonWidth = 15
                  TabOrder = 1
                  OnButtonClick = edTarefaButtonClick
                end
                object JvDBCalcEdit1: TJvDBCalcEdit
                  Left = 97
                  Top = 39
                  Width = 45
                  Height = 21
                  CheckOnExit = True
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  ShowButton = False
                  TabOrder = 2
                  ZeroEmpty = False
                  DecimalPlacesAlwaysShown = False
                  OnKeyPress = JvDBCalcEdit1KeyPress
                  DataField = 'DIA'
                  DataSource = dtsTarefas
                end
                object JvDBCalcEdit2: TJvDBCalcEdit
                  Left = 332
                  Top = 39
                  Width = 45
                  Height = 21
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  MinValue = 1.000000000000000000
                  ShowButton = False
                  TabOrder = 3
                  Value = 1.000000000000000000
                  ZeroEmpty = False
                  DecimalPlacesAlwaysShown = False
                  OnKeyPress = JvDBCalcEdit1KeyPress
                  DataField = 'VEZES'
                  DataSource = dtsTarefas
                end
                object JvDBCalcEdit3: TJvDBCalcEdit
                  Left = 97
                  Top = 70
                  Width = 45
                  Height = 21
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  ShowButton = False
                  TabOrder = 5
                  ZeroEmpty = False
                  DecimalPlacesAlwaysShown = False
                  OnKeyPress = JvDBCalcEdit1KeyPress
                  DataField = 'REPLICAR'
                  DataSource = dtsTarefas
                end
                object Ativa: TDBCheckBox
                  Left = 409
                  Top = 40
                  Width = 52
                  Height = 17
                  TabStop = False
                  Caption = 'Ativa'
                  DataField = 'ATIVO'
                  DataSource = dtsTarefas
                  ReadOnly = True
                  TabOrder = 4
                  ValueChecked = 'T'
                  ValueUnchecked = 'F'
                end
                object JvDBComboEdit1: TJvDBComboEdit
                  Left = 60
                  Top = 8
                  Width = 112
                  Height = 21
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  DataField = 'CODIGO'
                  DataSource = dtsTarefas
                  ImageKind = ikEllipsis
                  ButtonWidth = 15
                  TabOrder = 0
                  OnButtonClick = edTarefaButtonClick
                end
                object DBEdit3: TDBEdit
                  Left = 97
                  Top = 102
                  Width = 364
                  Height = 20
                  Margins.Left = 2
                  Margins.Top = 2
                  Margins.Right = 2
                  Margins.Bottom = 2
                  AutoSize = False
                  DataField = 'OBS'
                  DataSource = dtsTarefas
                  TabOrder = 7
                  OnEnter = DBEdit3Enter
                end
                object JvDBCalcEdit4: TJvDBCalcEdit
                  Left = 230
                  Top = 70
                  Width = 45
                  Height = 21
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  MinValue = 1.000000000000000000
                  ShowButton = False
                  TabOrder = 6
                  Value = 1.000000000000000000
                  ZeroEmpty = False
                  DecimalPlacesAlwaysShown = False
                  OnKeyPress = JvDBCalcEdit1KeyPress
                  DataField = 'INTERVALO'
                  DataSource = dtsTarefas
                end
                object DBEdit4: TDBEdit
                  Left = 391
                  Top = 70
                  Width = 67
                  Height = 16
                  TabStop = False
                  BorderStyle = bsNone
                  DataField = 'RECCOUNT'
                  DataSource = dtsTarefas
                  ReadOnly = True
                  TabOrder = 8
                end
              end
            end
            object BitBtn1: TTcGDIButton
              Left = 521
              Top = 57
              Width = 162
              Height = 31
              Caption = 'Adicionar tarefa/exame'
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
                DBDBBAB8B8B4B2B1BBB8B89491927D797A837E7F8F8B8B9A9696A4A09F7CAE86
                43BC6478B785BFBDBCB3B0AF8300E58300E58300E5008300E58300E5C4C2C1AD
                AAA9E4E2E1D4D3D2716C6D7B76788D898A9E9A9AADA9A9BBB7B682C08E55C877
                83D49D77CB8AE4E3E2C6C3C38300E58300E58300E5008300E5C2C0C0C1BEBDE5
                E4E3F1F1F09894957D787A908B8CA09C9CAFABAABCB8B785C1915ACA7D8FD8A8
                7CD2985FCA77AFD6B595BC9BACD3B2ACD3B2BAD7BE00D4D3D2AEABAAE7E6E5F2
                F2F1FAF9F9A09D9E918D8EA29E9EB0ACACBDB9B888C29465CD8682D39E82D39E
                79D39863CD8663CD8663CD8663CD8663CD865AC87700AAA8A7E8E7E6E1E0E0D9
                D7D8E0DFE0BDBABBA4A09FB2AEADBEBBB999C7A560CC8372D19272D19272D192
                72D19272D19272D19272D19272D19272D19261CB7C00B8B5B5A09E9E706B6D83
                7E80959192A5A1A1B3AFAFC0BCBBA2C6A965CD8A65CD8A65CD8A65CD8A65CD8A
                65CD8A65CD8A65CD8A65CD8A65CD8A65CD8A68CE8300ADAAAA726D6F86818297
                9394A7A3A2B5B1B0C1BDBCCBC9C7D4D2D078CC8D63CD8657CA7D57CA7D57CA7D
                57CA7D57CA7D57CA7D57CA7D57CA7D57CA7D6ECF89007A7577878384999595A8
                A4A4B6B2B1C2BFBDCCCAC8D5D3D2DCDBD9E2E1E082D39660CC8549C67249C672
                4DC87459CB7F59CB7F59CB7F59CB7F59CB7F77D08E00817C7D9B9797AAA6A6B8
                B4B3C3C0BFCDCBC9D6D4D2DDDCDAE3E2E1E8E7E6EBEAE98AD59D5FCB823EC268
                54C77893D6A5CFE0D3B4C5B8CFE0D3CFE0D3CADFCE008F8B8BACA8A7B9B5B4C4
                C1C0CFCCCAD7D5D3DEDCDBE4E2E1E8E7E6EBEAEAEDECECEEEDECC4E4CC53C673
                4DC67195D6A3DFDEDCBFBCBB8300E58300E58300E5009B9797BAB7B6C6C3C1CF
                CDCBD8D6D4DFDDDCE4E3E2E9E8E7ECEBEAEEEDECEEEDECEEEDECECEBEAAEDCB8
                6ECF8999D3A4D8D6D4BAB8B78300E58300E58300E500A6A2A1C7C4C2D1CECCD9
                D7D5DFDEDCE5E4E2E9E8E7ECEBEAEEEDECEEEDECEDECECECEBEAE8E7E6E4E3E1
                DEDDDBD7D5D4CFCCCBB5B2B28300E58300E58300E500AFACABD1CFCDD9D8D6E0
                DFDDE5E4E3EAE9E7ECEBEBEEEDECEEEDECEDECECEBEAE9E8E7E6E3E2E1DDDCDA
                D6D4D3CECBCAC3C0BFAFACAB8300E58300E58300E500B7B4B3DAD9D7E1DFDEE6
                E5E4EAE9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E8E6E5E3E1E0DDDBDAD5D3D2
                CCCAC8C2BFBEB7B3B2A8A4A48300E58300E58300E500BDBABAE1E0DEE6E5E4EA
                E9E8EDECEBEEEDECEEEDECEDECEBEBEAE9E7E6E5E2E1DFDCDAD9D5D3D1CCC9C7
                C1BEBCB5B1B0A7A3A39F9C9C8300E58300E58300E500C2C0BFE7E6E5EBEAE9ED
                ECEBEEEDECEEEDECEDECEBEAE9E8E6E5E4E2E0DFDBDAD8D4D2D0CAC8C6C0BCBB
                B4B0AFA6A2A19692929692928300E58300E58300E500C6C4C3EBEAE9EDECEBEE
                EDECEEEDECEDECEBEAE9E8E6E5E4E1DFDEDAD9D7D3D1CFC9C7C5BEBBBAB2AEAE
                A4A0A0949090827D7F8B87888300E58300E58300E500C9C7C6EDECECEEEDECEE
                EDECECEBEBEAE9E7E6E4E3E0DFDDDAD8D6D2D0CEC8C6C4BDBAB9B1ADACA29E9E
                928E8E807B7D6C6769807C7C8300E58300E58300E500CAC8C8EEEDECEEEDECEC
                EBEAE9E8E7E5E4E2DFDEDCD9D7D5D1CFCDC7C4C2BCB8B7AFABABA19D9C908C8D
                7D797A6A6566555051736F708300E58300E58300E500B0ADADCAC8C8C9C7C7C7
                C5C4C4C2C1C0BDBDBBB8B7B5B2B1AEAAA9A5A1A19C9897918D8D858081777273
                6863645853544642436D6A6A8300E58300E58300E5000000}
              TabOrder = 5
              OnClick = BitBtn1Click
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
            object BitBtn2: TTcGDIButton
              Left = 521
              Top = 90
              Width = 162
              Height = 29
              Caption = 'Remover tarefa/exame'
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
              TabOrder = 6
              OnClick = BitBtn2Click
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
            object BitBtn3: TTcGDIButton
              Left = 521
              Top = 268
              Width = 126
              Height = 25
              Caption = 'Cadastro de Tarefas'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 7
              OnClick = BitBtn3Click
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
            object BitBtn4: TTcGDIButton
              Left = 521
              Top = 299
              Width = 126
              Height = 25
              Caption = 'Cadastro de Exames'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              TabOrder = 8
              OnClick = BitBtn4Click
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
            object DBMemo1: TDBMemo
              Left = 147
              Top = 161
              Width = 362
              Height = 89
              DataField = 'OBS'
              DataSource = dtsTarefas
              TabOrder = 9
              Visible = False
              WantTabs = True
              OnKeyDown = DBMemo1KeyDown
            end
          end
        end
      end
    end
  end
  inherited _pnlToolButtons: TPanel
    Top = 547
    ExplicitTop = 547
    inherited _ToolBar: TToolBar
      inherited _ToolButtonPrint: TToolButton
        ExplicitWidth = 86
      end
      inherited _ToolButtonOther: TToolButton
        ExplicitWidth = 86
      end
    end
  end
  inherited ActionList: TInternalActionList
    inherited _actOther: TAction
      Enabled = False
    end
  end
  inherited dtsFicha: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule.cdsProtocolo
  end
  inherited dtsLista: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule.cdsLstProtocolos
  end
  object dtsTiposProtocolo: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule.cdsTiposProtocolo
    Left = 288
    Top = 32
  end
  object dtsTarefas: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule.cdsTarefas
    Left = 476
    Top = 253
  end
  object DataSource1: TDataSource
    DataSet = Zoo_CfgProtocolosDatamodule.cdsProtocolo
    Left = 636
    Top = 24
  end
  object TcMPControlPopuper1: TTcControlPopuper
    Control = DBMemo1
    PopupStyle = cpsPopup
    OnClose = TcMPControlPopuper1Close
    Left = 568
    Top = 203
  end
end
