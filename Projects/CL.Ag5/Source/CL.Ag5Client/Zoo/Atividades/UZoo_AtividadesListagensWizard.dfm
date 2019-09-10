inherited Zoo_AtividadesListagensWizard: TZoo_AtividadesListagensWizard
  Left = 345
  Top = 210
  Caption = 'Atividades - Listagens'
  ClientHeight = 404
  ClientWidth = 932
  ExplicitWidth = 938
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 932
    Height = 404
    ExplicitWidth = 932
    ExplicitHeight = 404
    inherited _pnlFooter: TJvPanel
      Top = 373
      Width = 928
      ExplicitTop = 373
      ExplicitWidth = 928
      inherited _imageBottom: TImage
        Width = 928
        ExplicitWidth = 555
      end
      inherited _btbPrior: TTcGDIButton
        Left = 737
        ExplicitLeft = 737
      end
      inherited _btbNext: TTcGDIButton
        Left = 828
        ExplicitLeft = 828
      end
      inherited _btbExecute: TTcGDIButton
        Left = 843
        ExplicitLeft = 843
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 928
      Height = 371
      ExplicitWidth = 928
      ExplicitHeight = 371
      inherited PageControl: TJvPageControl
        Width = 928
        Height = 371
        ExplicitWidth = 928
        ExplicitHeight = 371
        inherited TabSheetParametros: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 928
          ExplicitHeight = 348
          object rgListagens: TRadioGroup
            Left = 29
            Top = 13
            Width = 275
            Height = 190
            Caption = 'Op'#231#245'es de listagens '
            ItemIndex = 0
            Items.Strings = (
              'BST'
              'CMT'
              'CC')
            TabOrder = 0
            OnClick = rgListagensClick
          end
          object gbMensagem: TGroupBox
            Left = 0
            Top = 224
            Width = 928
            Height = 124
            Align = alBottom
            Enabled = False
            TabOrder = 1
            object lbBST: TLabel
              Left = 130
              Top = 19
              Width = 125
              Height = 13
              Caption = 'Descri'#231#227'o parametros BST'
            end
            object lbDPP: TLabel
              Left = 130
              Top = 38
              Width = 126
              Height = 13
              Caption = 'Descricao parametros DPP'
            end
            object lbProd: TLabel
              Left = 130
              Top = 58
              Width = 190
              Height = 13
              Caption = 'Descricao parametros Produ'#231#227'o de leite'
            end
            object lblRetiradaBST: TLabel
              Left = 130
              Top = 96
              Width = 198
              Height = 13
              Caption = 'Descricao antes da secagem retirada BST'
            end
            object lblDiasSecagem: TLabel
              Left = 130
              Top = 77
              Width = 196
              Height = 13
              Caption = 'Descricao parametros dias para secagem'
            end
            object GroupBox2: TGroupBox
              Left = 10
              Top = 4
              Width = 54
              Height = 111
              TabOrder = 0
              object Label4: TLabel
                Left = 5
                Top = 0
                Width = 44
                Height = 13
                Caption = 'Prim'#237'para'
              end
              object edDPPPrimipara: TEdit
                Left = 5
                Top = 34
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Text = '100'
              end
              object edProdPrimipara: TEdit
                Left = 5
                Top = 53
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Text = '100'
              end
              object edBSTPrim: TEdit
                Left = 5
                Top = 14
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '100'
              end
              object edtDiasPreSecagemPrimipara: TEdit
                Left = 5
                Top = 91
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                Text = '100'
              end
              object edtDiasSecagemPrimipara: TEdit
                Left = 5
                Top = 72
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                Text = '100'
              end
            end
            object GroupBox3: TGroupBox
              Left = 70
              Top = 4
              Width = 54
              Height = 111
              TabOrder = 1
              object Label6: TLabel
                Left = 5
                Top = 0
                Width = 44
                Height = 13
                Caption = 'Mult'#237'para'
              end
              object edDPPMultipara: TEdit
                Left = 5
                Top = 34
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Text = '100'
              end
              object edProdMultipara: TEdit
                Left = 5
                Top = 53
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Text = '100'
              end
              object edBSTMult: TEdit
                Left = 5
                Top = 14
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '100'
              end
              object edtDiasPreSecagemMultipara: TEdit
                Left = 5
                Top = 91
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                Text = '100'
              end
              object edtDiasSecagemMultipara: TEdit
                Left = 5
                Top = 72
                Width = 44
                Height = 14
                TabStop = False
                Alignment = taCenter
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                Text = '100'
              end
            end
          end
          object dblcEscores: TDBLookupComboBox
            Left = 110
            Top = 168
            Width = 145
            Height = 21
            KeyField = 'KZOO_CFGESCORE'
            ListField = 'SIGLA;NOME'
            ListSource = dtsListaEscores
            TabOrder = 2
            Visible = False
          end
          object Panel1: TPanel
            Left = 81
            Top = 30
            Width = 209
            Height = 41
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 3
            object Label1: TLabel
              Left = 11
              Top = 18
              Width = 57
              Height = 13
              Caption = 'at'#233' a data :'
            end
            object dtBST: TTcDateEdit
              Left = 79
              Top = 15
              Width = 121
              Height = 21
              Checked = False
              CheckOnExit = False
              TabOrder = 0
            end
          end
        end
        inherited TabSheetResultado: TTabSheet
          ExplicitTop = 23
          ExplicitWidth = 928
          ExplicitHeight = 348
          inherited DBGridResultados: TJvDBUltimGrid
            Width = 928
            Height = 321
          end
          object Panel3: TPanel
            Left = 0
            Top = 321
            Width = 928
            Height = 27
            Align = alBottom
            Caption = ' '
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
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
    inherited _actNext: TAction
      OnUpdate = _actNextUpdate
    end
  end
  inherited dtsResultado: TDataSource
    Left = 370
    Top = 5
  end
  object dtsListaEscores: TDataSource
    DataSet = Zoo_AtividadesListagensDataModule.cdsListaEscores
    Left = 518
    Top = 6
  end
end
