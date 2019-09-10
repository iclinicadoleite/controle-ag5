inherited WBGerencialZootecnico: TWBGerencialZootecnico
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 339
  ClientWidth = 651
  Position = poDesigned
  ExplicitWidth = 651
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter: TSplitter
    Left = 641
    Height = 279
    ExplicitLeft = 641
    ExplicitHeight = 279
  end
  inherited NavControlPnl: TPanel
    Width = 651
    ExplicitWidth = 651
    inherited URLEditPnl: TPanel
      Width = 445
      ExplicitWidth = 445
      inherited URLCbx: TComboBox
        Width = 445
        ExplicitWidth = 445
      end
    end
    inherited ConfigPnl: TPanel
      Left = 578
      ExplicitLeft = 578
    end
  end
  inherited CEFWindowParent: TCEFWindowParent
    Width = 641
    Height = 279
    ExplicitWidth = 0
    ExplicitHeight = 279
  end
  inherited DevTools: TCEFWindowParent
    Left = 651
    Height = 279
    ExplicitLeft = 0
    ExplicitHeight = 279
  end
  inherited StatusBar: TStatusBar
    Top = 320
    Width = 651
    ExplicitTop = 320
    ExplicitWidth = 651
  end
  object sqlWebGerencialZootecnico: TTcSQLDataSet
    CommandText = 
      'SELECT '#13#10'  KSYS$USER_MODULE,'#13#10'  KSYS$USER,'#13#10'  KSYS$DOMAIN,'#13#10'  MO' +
      'DULE,'#13#10'  MODULE_DOMAIN,'#13#10'  MODULE_LOGIN,'#13#10'  MODULE_PASSWORD'#13#10'FRO' +
      'M SYS$USERS_MODULES'#13#10'WHERE '#13#10'         KSYS$USER     =   :KSYS$US' +
      'ER'#13#10'AND  KSYS$DOMAIN =  :KSYS$DOMAIN'#13#10'AND  MODULE = 1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'KSYS$USER'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'KSYS$DOMAIN'
        ParamType = ptInput
      end>
    SQLConnection = DBEntidades.SQLDB
    Left = 440
    Top = 248
  end
end
