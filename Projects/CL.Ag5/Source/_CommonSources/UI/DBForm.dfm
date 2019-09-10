object _DBForm: T_DBForm
  Left = 321
  Top = 267
  Caption = '_DBForm'
  ClientHeight = 429
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList: TInternalActionList
    object _actNew: TAction
      Category = 'Edit'
      Caption = '&Novo'
      Hint = 'Novo registro'
      ImageIndex = 1
      ShortCut = 16462
      OnExecute = _actNewExecute
      OnUpdate = _actNewUpdate
    end
    object _actEdit: TAction
      Category = 'Edit'
      Caption = '&Editar'
      Hint = 'Editar registro'
      ImageIndex = 2
      ShortCut = 16453
      OnExecute = _actEditExecute
      OnUpdate = _actEditUpdate
    end
    object _actDelete: TAction
      Category = 'Edit'
      Caption = '&Apagar'
      Hint = 'Novo registro'
      ImageIndex = 3
      ShortCut = 16449
      OnExecute = _actDeleteExecute
      OnUpdate = _actDeleteUpdate
    end
    object _actSave: TAction
      Category = 'Edit'
      Caption = '&Salvar'
      Hint = 'Salvar altera'#231#245'es'
      ImageIndex = 4
      ShortCut = 16467
      OnExecute = _actSaveExecute
      OnUpdate = _actSaveUpdate
    end
    object _actCancel: TAction
      Category = 'Edit'
      Caption = 'Cancela&r'
      Hint = 'Cancelar altera'#231#245'es'
      ImageIndex = 5
      ShortCut = 16466
      OnExecute = _actCancelExecute
    end
  end
  object dtsFicha: TDataSource
    Left = 632
    Top = 24
  end
end
