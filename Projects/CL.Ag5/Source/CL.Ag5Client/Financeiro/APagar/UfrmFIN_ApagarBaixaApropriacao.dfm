inherited frmFIN_ApagarBaixaApropriacao: TfrmFIN_ApagarBaixaApropriacao
  Tag = -99
  Left = 483
  Top = 174
  BorderStyle = bsToolWindow
  Caption = 'Lan'#231'amento de contas a pagar'
  ClientHeight = 358
  ClientWidth = 458
  ActionList.Left = 104
  ExplicitWidth = 464
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 458
    Height = 358
    ExplicitWidth = 458
    ExplicitHeight = 358
    inherited _pnlDetail: TJvPanel
      Width = 454
      Height = 318
      ExplicitWidth = 454
      ExplicitHeight = 318
      object pnlSuperior: TPanel
        Left = 0
        Top = 0
        Width = 454
        Height = 62
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 13
          Width = 61
          Height = 13
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit3: TDBText
          Left = 118
          Top = 13
          Width = 297
          Height = 17
          DataField = 'NOMEENTIDADE'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 11
          Top = 39
          Width = 66
          Height = 13
          Caption = 'Vencimento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBEdit2: TDBText
          Left = 118
          Top = 39
          Width = 84
          Height = 17
          DataField = 'VENCTO'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 254
          Top = 39
          Width = 29
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBText
          Left = 303
          Top = 39
          Width = 84
          Height = 17
          DataField = 'VALOR'
          DataSource = dtsFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlCentroCustos: TTcCaptionedPanel
        Left = 0
        Top = 62
        Width = 454
        Height = 216
        Caption = 'Juros / Descontos'
        Align = alTop
        Constraints.MinHeight = 20
        TabOrder = 1
        object dbtTotalPorcentagem: TDBText
          Left = 350
          Top = 194
          Width = 65
          Height = 17
          DataField = 'TOTAL_PORCENTAGEM'
          DataSource = dtsApropriacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 349
          Top = 179
          Width = 98
          Height = 13
          Caption = 'Porcentagem total : '
        end
        object DBText4: TDBText
          Left = 13
          Top = 29
          Width = 308
          Height = 17
          DataField = 'DESCRICAO_JURO_DESCONTO'
          DataSource = dtsFicha
        end
        object Label1: TLabel
          Left = 13
          Top = 52
          Width = 100
          Height = 13
          Caption = 'Centros de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object dbgCentroCustos: TJvDBUltimGrid
          Left = 13
          Top = 66
          Width = 430
          Height = 109
          DataSource = dtsApropriacao
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnEditButtonClick = dbgCentroCustosEditButtonClick
          OnExit = dbgCentroCustosExit
          OnKeyPress = dbgCentroCustosKeyPress
          OnShowEditor = dbgCentroCustosShowEditor
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'NOME'
              Width = 189
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAGEM'
              Width = 158
              Visible = True
            end>
        end
        object btnAdicionaCentro: TTcGDIButton
          Left = 13
          Top = 180
          Width = 162
          Height = 30
          Caption = 'Adiciona centro de custo'
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
          TabOrder = 1
          OnClick = btnAdicionaCentroClick
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
        object btnRemoveCentro: TTcGDIButton
          Left = 179
          Top = 180
          Width = 158
          Height = 30
          Caption = 'Remove centro de custo'
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
          TabOrder = 2
          OnClick = btnRemoveCentroClick
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
        object JvDBCalcEdit1: TTcDBCalcEdit
          Left = 327
          Top = 26
          Width = 112
          Height = 21
          Checked = False
          Color = clSilver
          DisplayFormat = ',0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          OnChange = edtPagoChange
          DataField = 'JURO_DESCONTO'
          DataSource = dtsFicha
        end
      end
    end
    inherited _pnlFooter: TJvPanel
      Top = 320
      Width = 454
      Height = 36
      ExplicitTop = 320
      ExplicitWidth = 454
      ExplicitHeight = 36
      inherited _imageBottom: TImage
        Width = 454
        Height = 36
        ExplicitWidth = 443
        ExplicitHeight = 36
      end
      object btnOk: TTcGDIButton
        Left = 246
        Top = 3
        Width = 97
        Height = 29
        Action = actOK
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        DisabledPicture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          000033333F333333333333000000333377F333333333330000003337337F3333
          33333300000033733337F333333333000000373333337F333333330000007F33
          7F3337F33333330000007F3737F337F33333330000007F73337F337F33333300
          000037333337F337F33333000000333333337F337F33330000003333333337F3
          37F33300000033333333337F337F33000000333333333337F337F30000003333
          333333337F37F300000033333333333337F73300000033333333333333733300
          0000333333333333333333000000}
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Picture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          0000333333333333333333000000333334433333333333000000333342243333
          3333330000003334222243333333330000003342222224333333330000003422
          2A2222433333330000003222A3A222433333330000003A2A333A222433333300
          000033A33333A222433333000000333333333A222433330000003333333333A2
          22433300000033333333333A222433000000333333333333A222430000003333
          333333333A224300000033333333333333A223000000333333333333333A3300
          0000333333333333333333000000}
        TabOrder = 0
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
      object btbCancel: TTcGDIButton
        Left = 351
        Top = 3
        Width = 97
        Height = 29
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        DisabledPicture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          00003333F333333333333300000033377F333333F33333000000337F37F333F7
          7F3333000000337F337F3F7337F333000000337F3337F733337F330000003337
          F33373333F733300000033337F333333F73333000000333337F3333373333300
          00003333337F3337333333000000333333733337F33333000000333337333337
          F33333000000333373337F337F33330000003337F33737F337F3330000003337
          FF73337F337F33000000333377333337FFF73300000033333333333377733300
          0000333333333333333333000000}
        ModalResult = 2
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        Picture.Data = {
          424D4E0100000000000076000000280000001200000012000000010004000000
          0000D80000000000000000000000000000000000000000000000000080000080
          00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333333333300
          0000333377333333333333000000333911733333973333000000333911173339
          1173330000003339111173911117330000003333911117111117330000003333
          3911111111733300000033333391111117333300000033333331111173333300
          0000333333391111733333000000333333911111733333000000333339111711
          1733330000003333911173911173330000003333911733391117330000003333
          3913333391113300000033333333333339193300000033333333333333333300
          0000333333333333333333000000}
        TabOrder = 1
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
  inherited ActionList: TInternalActionList
    Left = 104
    object actEstornar: TAction
      Caption = 'Estornar'
    end
    object actOK: TAction
      Caption = 'OK'
      OnExecute = actOKExecute
    end
  end
  object dtsFicha: TDataSource
    DataSet = Fin_BaixaAPagarColetivoDatamodule.cdsBaixaAPagar
    Left = 328
    Top = 8
  end
  object dtsApropriacao: TDataSource
    DataSet = dtmFIN_ApagarBaixaTitulo.cdsApropriacaoJuroDesconto
    Left = 389
    Top = 10
  end
end
