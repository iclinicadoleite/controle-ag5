inherited SYS_VQDWizard: TSYS_VQDWizard
  Left = 363
  Top = 241
  ExplicitLeft = 363
  ExplicitTop = 241
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited _pnlForm: TJvPanel
    inherited _pnlFooter: TJvPanel
      ExplicitTop = 312
    end
    inherited _pnlDetail: TJvPanel
      ExplicitHeight = 287
      object atVisualQuery1: TatVisualQuery
        Left = 80
        Top = 72
        Width = 400
        Height = 200
        TargetMetaSQL = atMetaSQL1
        MetaSqlDefs = <
          item
            MetaSQLName = 'MetaSql1'
            Title = '(New visual query)'
          end>
        ResizeHeight = 200
        Database = TcMPadb_DBX1
        SQLSyntax = ssCustom
        SyntaxConf.ParentesisInJoins = False
        SyntaxConf.JoinSyntax = alsFrom
        SyntaxConf.SortInnerJoins = False
        SyntaxConf.CaseSensitive = False
        SyntaxConf.IndexInGroupBy = False
        SyntaxConf.IndexInOrderBy = False
        DisablePrettyText = False
        QualifiedFieldAliases = False
        FieldAliasSeparator = '_'
        AutoUpdateFieldAliases = False
        SelectionColor = clHighlight
        SelectionFontColor = clHighlightText
        ItemHeight = 20
        TabOrder = 1
        object MetaSql1: TatInternalMetaSql
          SQLSyntax = ssCustom
          SQLTables = <>
          SQLFields = <>
          TableJoins = <>
          Conditions = <>
          GroupFields = <>
          OrderFields = <>
          Params = <>
          SyntaxConf.ParentesisInJoins = False
          SyntaxConf.JoinSyntax = alsFrom
          SyntaxConf.SortInnerJoins = False
          SyntaxConf.CaseSensitive = False
          SyntaxConf.IndexInGroupBy = False
          SyntaxConf.IndexInOrderBy = False
        end
      end
    end
  end
  object TcMPadb_DBX1: TTcadb_DBX
    Connection = DBEntidades.SQLDB
    Left = 122
    Top = 69
  end
  object atMetaSQL1: TatMetaSQL
    SQLSyntax = ssCustom
    SQLTables = <>
    SQLFields = <>
    TableJoins = <>
    Conditions = <>
    GroupFields = <>
    OrderFields = <>
    Params = <>
    SyntaxConf.ParentesisInJoins = False
    SyntaxConf.JoinSyntax = alsFrom
    SyntaxConf.SortInnerJoins = False
    SyntaxConf.CaseSensitive = False
    SyntaxConf.IndexInGroupBy = False
    SyntaxConf.IndexInOrderBy = False
    Left = 234
    Top = 53
  end
end
