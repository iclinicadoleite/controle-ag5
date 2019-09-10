inherited frmZoo_ProducaoRecalculoLactacao: TfrmZoo_ProducaoRecalculoLactacao
  Left = 499
  Top = 189
  Caption = 'Recalcular Lacta'#231#227'o'
  ClientHeight = 525
  ClientWidth = 618
  OldCreateOrder = False
  ExplicitLeft = 499
  ExplicitTop = 189
  ExplicitWidth = 634
  ExplicitHeight = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    Width = 618
    Height = 525
    ExplicitWidth = 618
    ExplicitHeight = 525
    inherited _pnlFooter: TJvPanel
      Top = 494
      Width = 614
      ExplicitTop = 312
      ExplicitWidth = 614
      inherited _imageBottom: TImage
        Width = 614
        ExplicitWidth = 614
      end
      inherited _btbPrior: TTcGDIButton
        Left = 409
        ExplicitLeft = 759
      end
      inherited _btbNext: TTcGDIButton
        Left = 500
        ExplicitLeft = 850
      end
      inherited _btbExecute: TTcGDIButton
        Left = 515
        ExplicitLeft = 865
      end
    end
    inherited _pnlDetail: TJvPanel
      Width = 614
      Height = 492
      ExplicitWidth = 614
      ExplicitHeight = 310
      inherited PageControl: TJvPageControl
        Width = 614
        Height = 492
        ActivePage = TabSheet1
        ExplicitWidth = 614
        ExplicitHeight = 492
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          DesignSize = (
            614
            469)
          object Label3: TLabel
            Left = 14
            Top = 34
            Width = 573
            Height = 73
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Clique em processar para recalcular as lacta'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object ProgressBar: TProgressBar
            Left = 30
            Top = 180
            Width = 549
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Visible = False
          end
        end
      end
    end
  end
end
