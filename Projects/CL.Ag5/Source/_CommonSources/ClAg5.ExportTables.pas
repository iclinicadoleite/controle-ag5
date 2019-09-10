unit ClAg5.ExportTables;

interface

uses System.Classes, Tc.DBRTL.AbstractDB ;

type

  TCLAg5ExportTables = class
  public
    class procedure ExportTable ( AbstractDB : TTcAbstractDB ; ATableName : string ; ATargetFolder : string );
    class procedure ExportTableToStream( AbstractDB : TTcAbstractDB ;  ATableName: string ; AStream : TStream );
  end;

implementation

{ TCLAg5ExportTables }

uses System.SysUtils, DBClient ;

class procedure TCLAg5ExportTables.ExportTable( AbstractDB : TTcAbstractDB ;  ATableName: string ; ATargetFolder : string  );
var
  CDS : TClientDataSet ;
  LTargetName : string ;
const
   _DIAGNOSTICOS =
         'SELECT'
  +#13#10'   KDEF_DIAGNOSTICO'
  +#13#10',  CODIGO'
  +#13#10',  TIPODIAGNOSTICO'
  +#13#10',  TIPOEVENTO'
  +#13#10',  SYS$EVENTOID'
  +#13#10',  NOME'
  +#13#10',  CAST( DESCRICAO AS VARCHAR(1024)) DESCRICAO'
  +#13#10',  POR_QUARTO'
  +#13#10',  ATIVO'
  +#13#10',  INTERNAL'
  +#13#10',  SYS$UI'
  +#13#10',  SYS$DI'
  +#13#10',  SYS$UU'
  +#13#10',  SYS$DU'
  +#13#10'FROM DEF_DIAGNOSTICOS' ;


begin
  CDS := nil ;

  if ATableName = 'DEF_DIAGNOSTICOS' then
    AbstractDB.populateClientDataSet( CDS, _DIAGNOSTICOS )
  else
    AbstractDB.populateClientDataSet( CDS, Format ( 'SELECT * FROM %s', [ ATableName ] ) );
  LTargetName := IncludeTrailingPathDelimiter( ATargetFolder ) + ATableName + '.$' ;
  CDS.SaveToFile( LTargetName, dfXML ) ;
  CDS.Free ;
end;

class procedure TCLAg5ExportTables.ExportTableToStream( AbstractDB : TTcAbstractDB ;  ATableName: string ; AStream : TStream );
var
  CDS : TClientDataSet ;
begin
  CDS := nil ;
  AbstractDB.populateClientDataSet( CDS, Format ( 'SELECT * FROM %s', [ ATableName ] ) );
  CDS.SaveToStream( AStream, dfXML ) ;
  CDS.Free ;
end;

end.
