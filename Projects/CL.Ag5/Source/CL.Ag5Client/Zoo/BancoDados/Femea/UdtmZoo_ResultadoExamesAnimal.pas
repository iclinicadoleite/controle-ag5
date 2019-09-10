unit UdtmZoo_ResultadoExamesAnimal;

interface

uses
  System.SysUtils, System.Classes, UdtmSYS_BASE, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.FMTBcd, Data.SqlExpr, Tc.Data.SQLExpr, Provider;

type
  TdtmZoo_ResultadoExamesAnimal = class(T_dtmBASE)
    cdsExames: TClientDataSet;
    dspExames: TDataSetProvider;
    sqlExames: TTcSQLDataSet;
    sqlExamesKZOO_ANIMAL_TAREFA: TStringField;
    sqlExamesKZOO_ANIMAL_PROTOCOLO: TStringField;
    sqlExamesKZOO_TAREFA: TStringField;
    sqlExamesKZOO_ANIMAL: TStringField;
    sqlExamesCODIGO: TStringField;
    sqlExamesNOME: TStringField;
    sqlExamesKCAD_FUNCIONARIO_EXAME: TStringField;
    sqlExamesNOMEFUNCIONARIO_EXAME: TStringField;
    sqlExamesOBS_EXAME: TMemoField;
    cdsExamesKZOO_ANIMAL_TAREFA: TStringField;
    cdsExamesKZOO_ANIMAL_PROTOCOLO: TStringField;
    cdsExamesKZOO_TAREFA: TStringField;
    cdsExamesKZOO_ANIMAL: TStringField;
    cdsExamesCODIGO: TStringField;
    cdsExamesNOME: TStringField;
    cdsExamesKCAD_FUNCIONARIO_EXAME: TStringField;
    cdsExamesNOMEFUNCIONARIO_EXAME: TStringField;
    cdsExamesOBS_EXAME: TMemoField;
    cdsExamesPROTOCOLO: TStringField;
    cdsExamesDIAGNOSTICO: TStringField;
    cdsTipoResultado1: TClientDataSet;
    cdsTipoResultado2: TClientDataSet;
    cdsTipoResultado3: TClientDataSet;
    cdsExamesDESCR_RESULTADO2: TStringField;
    cdsExamesDESCR_RESULTADO3: TStringField;
    sqlTipoResultado1: TTcSQLDataSet;
    sqlTipoResultado2: TTcSQLDataSet;
    sqlTipoResultado3: TTcSQLDataSet;
    dtsExames: TDataSource;
    sqlExamesKZOO_TAREFA_RESULTADO1: TStringField;
    sqlExamesKZOO_TAREFA_RESULTADO2: TStringField;
    sqlExamesKZOO_TAREFA_RESULTADO3: TStringField;
    sqlTipoResultado1KZOO_TAREFA_RESULTADO: TStringField;
    sqlTipoResultado1NOME: TStringField;
    sqlTipoResultado2KZOO_TAREFA_RESULTADO: TStringField;
    sqlTipoResultado2NOME: TStringField;
    sqlTipoResultado3KZOO_TAREFA_RESULTADO: TStringField;
    sqlTipoResultado3NOME: TStringField;
    cdsExamesKZOO_TAREFA_RESULTADO1: TStringField;
    cdsExamesKZOO_TAREFA_RESULTADO2: TStringField;
    cdsExamesKZOO_TAREFA_RESULTADO3: TStringField;
    cdsExamesDESCR_RESULTADO1: TStringField;
    cdsTipoResultado1KZOO_TAREFA_RESULTADO: TStringField;
    cdsTipoResultado1NOME: TStringField;
    cdsTipoResultado2KZOO_TAREFA_RESULTADO: TStringField;
    cdsTipoResultado2NOME: TStringField;
    cdsTipoResultado3KZOO_TAREFA_RESULTADO: TStringField;
    cdsTipoResultado3NOME: TStringField;
    sqlExamesDATASTATUS: TSQLTimeStampField;
    cdsExamesDATASTATUS: TSQLTimeStampField;
    sqlExamesPROTOCOLO_RESULTADO1: TStringField;
    sqlExamesPROTOCOLO_RESULTADO2: TStringField;
    sqlExamesPROTOCOLO_RESULTADO3: TStringField;
    cdsExamesPROTOCOLO_RESULTADO1: TStringField;
    cdsExamesPROTOCOLO_RESULTADO2: TStringField;
    cdsExamesPROTOCOLO_RESULTADO3: TStringField;
    sqlExamesDATA_RESULTADO: TSQLTimeStampField;
    cdsExamesDATA_RESULTADO: TSQLTimeStampField;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    sqlTipoResultado1KZOO_TAREFA: TStringField;
    cdsTipoResultado1KZOO_TAREFA: TStringField;
    sqlTipoResultado2KZOO_TAREFA: TStringField;
    sqlTipoResultado3KZOO_TAREFA: TStringField;
    cdsTipoResultado2KZOO_TAREFA: TStringField;
    cdsTipoResultado3KZOO_TAREFA: TStringField;
    sqlExamesDESCR_RESULTADO1: TStringField;
    sqlExamesDESCR_RESULTADO2: TStringField;
    sqlExamesDESCR_RESULTADO3: TStringField;
    sqlExamesDATADIAGNOSTICO: TSQLTimeStampField;
    sqlExamesQUARTO: TSmallintField;
    cdsExamesDATADIAGNOSTICO: TSQLTimeStampField;
    cdsExamesQUARTO: TSmallintField;
    cdsTipoQuarto: TClientDataSet;
    cdsTipoQuartoTIPO: TStringField;
    cdsTipoQuartoVALOR: TStringField;
    cdsTipoQuartoDESCRICAO: TStringField;
    cdsTipoQuartoORDEM: TIntegerField;
    cdsExamesDESCR_QUARTO: TStringField;
    sqlExamesPROTOCOLO: TStringField;
    sqlExamesDIAGNOSTICO: TStringField;
    procedure cdsExamesNewRecord(DataSet: TDataSet);
    procedure dspExamesAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure cdsExamesAfterEdit(DataSet: TDataSet);
    procedure cdsExamesBeforePost(DataSet: TDataSet);
    procedure dtsExamesDataChange(Sender: TObject; Field: TField);
    procedure cdsExamesKZOO_TAREFA_RESULTADO1Validate(Sender: TField);
    procedure cdsExamesKZOO_TAREFA_RESULTADO2Validate(Sender: TField);
    procedure cdsExamesKZOO_TAREFA_RESULTADO3Validate(Sender: TField);
  private
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
   procedure SetFuncionario ( AKFuncionario, ANomeFuncionario : string  ) ;
   procedure OpenTables ; Override ;
   property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
  end;


implementation

{$R *.dfm}

uses Tc.DBRTL.AbstractDB, Tc. RTL.Exceptions, UDBZootecnico, ClAg5Types ,
  ResultadoExamesClass,
  System.Variants,
  CDSSuppl ;

{ TdtmZoo_ResultadoExamesAnimal }

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesAfterEdit(
  DataSet: TDataSet);
begin
//-- julio
//  if cdsExamesDATA_RESULTADO.IsNull then
//     cdsExamesDATA_RESULTADO.asDateTime := Date ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesBeforePost(DataSet: TDataSet);
begin
   if not cdsExamesKZOO_TAREFA_RESULTADO1.isNull and ( cdsExamesKZOO_TAREFA_RESULTADO1.asString = '' )  then
       cdsExamesKZOO_TAREFA_RESULTADO1.Clear ;
   if not cdsExamesKZOO_TAREFA_RESULTADO2.isNull and ( cdsExamesKZOO_TAREFA_RESULTADO2.asString = '' )  then
       cdsExamesKZOO_TAREFA_RESULTADO2.Clear ;
   if not cdsExamesKZOO_TAREFA_RESULTADO3.isNull and ( cdsExamesKZOO_TAREFA_RESULTADO3.asString = '' )  then
       cdsExamesKZOO_TAREFA_RESULTADO3.Clear ;

   if    (   cdsExamesDATA_RESULTADO.isNull
          or (cdsExamesDATA_RESULTADO.asDateTime = 0)
         )
    and  (    not cdsExamesKZOO_TAREFA_RESULTADO1.isNull
          or  not cdsExamesKZOO_TAREFA_RESULTADO2.isNull
          or  not cdsExamesKZOO_TAREFA_RESULTADO3.isNull
         ) then
    raise Warning.Create('Informe a data do resultado.');

   if   cdsExamesKZOO_TAREFA_RESULTADO1.isNull
    and cdsExamesKZOO_TAREFA_RESULTADO2.isNull
    and cdsExamesKZOO_TAREFA_RESULTADO3.isNull then
       cdsExamesDATA_RESULTADO.Clear ;

   if cdsExamesKZOO_TAREFA_RESULTADO1.isNull and ( cdsExamesPROTOCOLO_RESULTADO1.asBoolean )  then
       cdsExamesPROTOCOLO_RESULTADO1.asString := 'F' ;

   if cdsExamesKZOO_TAREFA_RESULTADO2.isNull and ( cdsExamesPROTOCOLO_RESULTADO2.asBoolean )  then
       cdsExamesPROTOCOLO_RESULTADO2.asString := 'F' ;

   if cdsExamesKZOO_TAREFA_RESULTADO3.isNull and ( cdsExamesPROTOCOLO_RESULTADO3.asBoolean )  then
       cdsExamesPROTOCOLO_RESULTADO3.asString := 'F' ;

end;

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesKZOO_TAREFA_RESULTADO1Validate(
  Sender: TField);
begin
  cdsExamesDESCR_RESULTADO1.AsString := cdsTipoResultado1NOME.AsString ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesKZOO_TAREFA_RESULTADO2Validate(
  Sender: TField);
begin
  cdsExamesDESCR_RESULTADO2.AsString := cdsTipoResultado2NOME.AsString ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesKZOO_TAREFA_RESULTADO3Validate(
  Sender: TField);
begin
  cdsExamesDESCR_RESULTADO3.AsString := cdsTipoResultado3NOME.AsString ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.cdsExamesNewRecord(
  DataSet: TDataSet);
begin
  GetKey ( cdsExamesKZOO_ANIMAL_TAREFA ) ;
  cdsExamesKZOO_ANIMAL.Value := FMasterSource.DataSet.FieldByName( 'KZOO_ANIMAL' ).Value ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.dspExamesAfterUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
var
 LKAnimal : String ;
 LResultado : integer ;
 LKResultado : string ;
 LAplicarProtocolo : boolean ;
 LKZOO_ANIMAL_TAREFA : string ;
 LData : TDateTime ;
begin

 if        VarIsEmpty( DeltaDS.FieldByName('DATA_RESULTADO').NewValue )
  and not  VarIsNull( DeltaDS.FieldByName('DATA_RESULTADO').OLDValue ) then
   LData := DeltaDS.FieldByName('DATA_RESULTADO').OldValue
 else if not VarIsNull( DeltaDS.FieldByName('DATA_RESULTADO').NewValue ) then
   LData := DeltaDS.FieldByName('DATA_RESULTADO').NewValue ;

 LKAnimal := DeltaDS.FieldByName('KZOO_ANIMAL').OldValue ;
 LKZOO_ANIMAL_TAREFA := DeltaDS.FieldByName('KZOO_ANIMAL_TAREFA').OldValue ;

 LKResultado := ''  ;
 if   ( not VarIsEmpty( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO1').NewValue ) )
  and ( not VarIsNull ( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO1').NewValue ) ) then
    LKResultado := DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO1').asString ;


 LAplicarProtocolo :=     (  LKResultado <> '' )
                      and (  ( not VarIsEmpty( DeltaDS.FieldByName('PROTOCOLO_RESULTADO1').NewValue )
                               and ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO1').NewValue = 'T' )
                              )
                          or ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO1').OldValue = 'T' )
                         ) ;
 if LAplicarProtocolo then
   TResultadosExameAnimal.SetResultado( LKAnimal, 1, LKResultado, LKZOO_ANIMAL_TAREFA, LData ) ;

 LKResultado := ''  ;
 if   ( not VarIsEmpty( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO2').NewValue ) )
  and ( not VarIsNull ( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO2').NewValue ) ) then
    LKResultado := DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO2').asString ;

 LAplicarProtocolo :=     (  LKResultado <> '' )
                      and (  ( not VarIsEmpty( DeltaDS.FieldByName('PROTOCOLO_RESULTADO2').NewValue )
                               and ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO2').NewValue = 'T' )
                              )
                          or ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO2').OldValue = 'T' )
                         ) ;

 if LAplicarProtocolo then
   TResultadosExameAnimal.SetResultado( LKAnimal, 2, LKResultado, LKZOO_ANIMAL_TAREFA, LData ) ;

 LKResultado := ''  ;
 if   ( not VarIsEmpty( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO3').NewValue ) )
  and ( not VarIsNull ( DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO3').NewValue ) ) then
    LKResultado := DeltaDS.FieldByName('KZOO_TAREFA_RESULTADO3').asString ;

 LAplicarProtocolo :=     (  LKResultado <> '' )
                      and (  ( not VarIsEmpty( DeltaDS.FieldByName('PROTOCOLO_RESULTADO3').NewValue )
                               and ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO3').NewValue = 'T' )
                              )
                          or ( DeltaDS.FieldByName('PROTOCOLO_RESULTADO3').OldValue = 'T' )
                         ) ;

 if LAplicarProtocolo then
   TResultadosExameAnimal.SetResultado( LKAnimal, 3, LKResultado, LKZOO_ANIMAL_TAREFA, LData ) ;

end;

procedure TdtmZoo_ResultadoExamesAnimal.dtsExamesDataChange(Sender: TObject;
  Field: TField);
begin
// if not Assigned ( Field )  then
//   begin
//    cdsTipoResultado1.Refresh ;
//    cdsTipoResultado2.Refresh ;
//    cdsTipoResultado3.Refresh ;
//    cdsExamesDESCR_RESULTADO1.RefreshLookupList ;
//   end;
end;

procedure TdtmZoo_ResultadoExamesAnimal.OpenTables;
begin
//    TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RESULTADO_EXAMES,     cdsTipoResultado1  ) ;
//    TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RESULTADO_EXAMES,     cdsTipoResultado2  ) ;
//    TTcAbstractDB.GetByAlias('ZOOTECNICO').GetSystemTypes ( _ST_RESULTADO_EXAMES,     cdsTipoResultado3  ) ;

    TTcAbstractDB.GetByAlias( 'ZOOTECNICO' ).GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsTipoQuarto        );

    cdsTipoResultado1.Open ;
    cdsTipoResultado2.Open ;
    cdsTipoResultado3.Open ;

    TCDSSuppl.SetMasterSource(cdsExames, 'KZOO_ANIMAL', FMasterSource, 'KZOO_ANIMAL' ) ;
    cdsExames.ParamByName('STATUS_EXECUTADA').AsInteger := _ST_STATUS_TAREFA_EXECUTADA ;
    TCDSSuppl.Open (  cdsExames )  ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.SetFuncionario(AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsExames.State in [dsInsert, dsEdit] ) then
    cdsExames.Edit ;

  cdsExamesNOMEFUNCIONARIO_EXAME.Text      := ANomeFuncionario ;
  cdsExamesKCAD_FUNCIONARIO_EXAME.asString := AKFuncionario ;
end;

procedure TdtmZoo_ResultadoExamesAnimal.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
end;

end.
