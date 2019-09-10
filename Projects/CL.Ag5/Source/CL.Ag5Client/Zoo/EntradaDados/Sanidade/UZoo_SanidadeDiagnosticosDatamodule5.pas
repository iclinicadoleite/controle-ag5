unit UZoo_SanidadeDiagnosticosDatamodule5;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE, Dialogs ;

type
  TValidateMessage = procedure ( AFieldName : string ) of object;

type
  TZoo_SanidadeDiagnosticosDatamodule = class(T_dtmBASE)
    cdsDiagnosticoAplicar: TClientDataSet;
    cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA: TStringField;
    cdsDiagnosticoAplicarBRINCO: TStringField;
    cdsDiagnosticoAplicarKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticoAplicarQUARTO: TSmallintField;
    cdsDiagnosticoAplicarDATA: TSQLTimeStampField;
    cdsDiagnosticoAplicarKZOO_PROTOCOLO: TStringField;
    cdsDiagnosticosDisponiveis: TClientDataSet;
    cdsDiagnosticosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosDisponiveisCODIGO: TStringField;
    cdsDiagnosticosDisponiveisNOME: TStringField;
    cdsDiagnosticosDisponiveisPOR_QUARTO: TStringField;
    cdsProtocolosDisponiveis: TClientDataSet;
    cdsDiagnosticosPadrao: TClientDataSet;
    cdsDiagnosticosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsDiagnosticosPadraoCODIGO: TStringField;
    cdsDiagnosticosPadraoNOME: TStringField;
    cdsDiagnosticosPadraoPOR_QUARTO: TStringField;
    cdsProtocolosPadrao: TClientDataSet;
    cdsQuartoDisponiveis: TClientDataSet;
    cdsQuartoDisponiveisTIPO: TStringField;
    cdsQuartoDisponiveisVALOR: TStringField;
    cdsQuartoDisponiveisDESCRICAO: TStringField;
    cdsQuartoDisponiveisORDEM: TIntegerField;
    cdsQuartoPadrao: TClientDataSet;
    cdsQuartoPadraoTIPO: TStringField;
    cdsQuartoPadraoVALOR: TStringField;
    cdsQuartoPadraoDESCRICAO: TStringField;
    cdsQuartoPadraoORDEM: TIntegerField;
    cdsDiagnosticoAplicarNOME_DIAGNOSTICO: TStringField;
    cdsDiagnosticoAplicarCODIGO_PROTOCOLO: TStringField;
    cdsDiagnosticoAplicarQUARTO_DESCR: TStringField;
    cdsProtocolosPadraoKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosPadraoKZOO_PROTOCOLO: TStringField;
    cdsProtocolosPadraoCODIGO: TStringField;
    cdsProtocolosDisponiveisKZOO_DIAGNOSTICO: TStringField;
    cdsProtocolosDisponiveisKZOO_PROTOCOLO: TStringField;
    cdsProtocolosDisponiveisCODIGO: TStringField;
    dtsDiagnosticos: TDataSource;
    dtsPadroes: TDataSource;
    cdsPadroes: TClientDataSet;
    cdsPadroesDATA: TSQLTimeStampField;
    cdsPadroesKZOO_DIAGNOSTICO: TStringField;
    cdsPadroesNOME_DIAGNOSTICO: TStringField;
    cdsPadroesKZOO_PROTOCOLO: TStringField;
    cdsPadroesCODIGO_PROTOCOLO: TStringField;
    cdsPadroesQUARTOS: TStringField;
    dtsDiagnosticoAplicar: TDataSource;
    cdsDiagnosticoAplicarDESC_PROTOCOLO: TStringField;
    cdsProtocolosDisponiveisVINCULADO: TStringField;
    cdsProtocolosPadraoVINCULADO: TStringField;
    cdsTarefasPadrao: TClientDataSet;
    cdsTarefasPadraoKZOO_TAREFA: TStringField;
    cdsTarefasPadraoCHECKED: TIntegerField;
    cdsTarefasPadraoNOME: TStringField;
    cdsTarefas: TClientDataSet;
    cdsTarefasKZOO_TAREFA: TStringField;
    cdsTarefasEXAME: TStringField;
    cdsTarefasNOME: TStringField;
    cdsTarefasDIA: TSmallintField;
    cdsDiagnosticoAplicarKZOO_DIAGNOSTICO_APLICAR: TStringField;
    cdsDiagnosticoAplicarTarefas: TDataSetField;
    cdsTarefasPadraoDEFAULT: TStringField;
    cdsPadroesKLAST_PROTOCOLO: TStringField;
    cdsPadroesDESCR_TAREFAS: TStringField;
    cdsDiagnosticoAplicarDESCR_TAREFAS: TStringField;
    cdsTarefasCHECKED: TIntegerField;
    cdsDiagnosticoAplicarKLAST_PROTOCOLO: TStringField;
    cdsTarefasPadraoDIA: TSmallintField;
    cdsDiagnosticoAplicarKCAD_FUNCIONARIO: TStringField;
    cdsDiagnosticoAplicarNOMEFUNCIONARIO: TStringField;
    cdsPadroesKCAD_FUNCIONARIO: TStringField;
    cdsPadroesNOMEFUNCIONARIO: TStringField;
    cdsTarefasPadraoEXAME: TStringField;
    cdsTarefasDEFAULT: TStringField;
    cdsTarefasVEZES: TIntegerField;
    cdsTarefasDESCARTELEITE: TSmallintField;
    cdsTarefasDESCARTECARNE: TSmallintField;
    cdsTarefasOBS: TMemoField;
    cdsDiagnosticoAplicarPROCESSED: TStringField;
    cdsTarefasCODIGO: TStringField;
    cdsTarefasPadraoCODIGO: TStringField;
    cdsTarefasPadraoVEZES: TIntegerField;
    cdsTarefasPadraoDESCARTELEITE: TSmallintField;
    cdsTarefasPadraoDESCARTECARNE: TSmallintField;
    cdsDiagnosticoAplicarCOUNT_TAREFAS: TIntegerField;
    cdsPadroesCOUNT_TAREFAS: TIntegerField;
    cdsTarefasPadraoREPLICAR: TIntegerField;
    cdsTarefasPadraoINTERVALO: TIntegerField;
    cdsTarefasREPLICAR: TIntegerField;
    cdsTarefasINTERVALO: TIntegerField;
    procedure cdsDiagnosticoAplicarBeforePost(DataSet: TDataSet);
    procedure cdsDiagnosticoAplicarNewRecord(DataSet: TDataSet);
    procedure cdsProtocolosPadraoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dtsPadroesDataChange(Sender: TObject; Field: TField);
    procedure cdsProtocolosDisponiveisFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dtsDiagnosticoAplicarDataChange(Sender: TObject; Field: TField);
    procedure cdsDiagnosticoAplicarKZOO_PROTOCOLOChange(Sender: TField);
    procedure cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange(Sender: TField);
    procedure cdsTarefasPadraoCHECKEDChange(Sender: TField);
    procedure cdsDiagnosticoAplicarNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsPadroesNOMEFUNCIONARIOSetText(Sender: TField;
      const Text: string);
    procedure cdsTarefasCHECKEDChange(Sender: TField);
  private
    { Private declarations }
    FUseQuickInput: boolean;
    FPreviousAnimalFemea: string;
    FPreviousDiagnostico: string;
    FPreviousData : TDateTime;
    FPreviousDiagnosticoAnimal : string;
    FDoApllyMessageError: string;
    FValidateMessage: TValidateMessage ;

    function FormatTextTarefas ( const AQTDE : integer ; const AList : string = '' ) : string ;

    procedure InsereTarefa ( const ADiagnosticoAnimal, AProtocoloAnimal : string ) ;
    procedure InsereTarefas ( const ADiagnosticoAnimal, AProtocoloAnimal : string ) ;
    procedure InsereDiagnostico ;
    procedure ClearQuarto;
    procedure SetUseQuickInput(const Value: boolean);
    procedure SetProtocoloVinculado;


    procedure CopyTarefasPadrao ;

    procedure LoadTarefas( var AClientDataSet : TClientDataSet ; const AKZOO_Protocolo : string ) ;
    procedure LoadTarefasPadrao( const AInit : boolean = false ) ;
    procedure LoadTarefasAAplicar( const AInit : boolean = false ) ;

    procedure AddDiagnosticoAAplicar(AKey, ABrinco: String ; const AQuarto : string ; const AForceAddNew : boolean ) ;

    procedure DoApply ;
  public
    { Public declarations }


    procedure UpdateHintQuartosPadrao ( const AQuartos : string );
    procedure UpdateHintTarefasPadrao ;
    procedure UpdateHintTarefas ;
    procedure OpenDiagnosticosAplicar  ;

    property ValidateMessage: TValidateMessage read FValidateMessage write FValidateMessage;

    property DoApllyMessageError: String read FDoApllyMessageError write FDoApllyMessageError;

    function PorQuartoDefault: Boolean;
    function PorQuarto       : Boolean;
    procedure OpenTables ; override;
    procedure OpenDiagnosticos;
    procedure OpenProtocolos;
    procedure OpenTarefas;
    procedure OpenTarefasPadrao;
    procedure SetProtocolo(KProtocolo : Variant);
    procedure AddByKey(AKey, ABrinco: String ; const AForceAddNew : boolean ) ;
    function AddBrinco ( ABrinco : string ; const AForceAddNew : boolean ) : boolean ;
    procedure RemoveDiagnostico;
    property UseQuickInput : boolean  read FUseQuickInput write SetUseQuickInput;
    constructor Create(AOwner: TComponent); override;
    function GetProtocoloVinculadoDefault( KDiagnosticoPadrao: Variant ): string ;
    procedure SetFuncionario( const AKFuncionario, ANomeFuncionario: string);
    procedure SetFuncionarioPadrao( const AKFuncionario, ANomeFuncionario: string);
    procedure Apply ;

    function HasTarefas: Boolean;
    procedure InvertSelectionTarefas( ACds: TClientDataSet );
  end;


implementation

uses
    Math
  , Exceptions
  , UDBZootecnico
  , SQLTimSt
  , CLAg5Types
  , DiagnosticosAnimalClass
  , ProtocolosAnimalClass
  , ThreadSuppl
  , CDSSuppl
  , ClAg5ClientZootecnicoCommonTypes
  , TarefasAnimalClass ;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


function TZoo_SanidadeDiagnosticosDatamodule.AddBrinco( ABrinco : string ; const AForceAddNew : boolean ) : boolean ;
var
    KeyAnimal : string ;
begin
    //cdsDiagnosticoAplicar.Edit ;

  if not AForceAddNew
     and cdsDiagnosticoAplicar.Locate( 'BRINCO', ABrinco, [] )
  then
    exit( True ) ;

  Result :=  TAnimalFemea.GetActiveKeyFromBrinco ( LoggedUser.DomainID, ABrinco, KeyAnimal ) ;

  if Result then
    AddByKey ( KeyAnimal, ABrinco, AForceAddNew  )

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.AddByKey(AKey, ABrinco: String ; const AForceAddNew : boolean ) ;
var
  I  : integer ;
  A  : TArray<string> ;
  LRecno : integer ;
begin

  if ABrinco = '' then
    exit;

  if cdsDiagnosticoAplicar.State in [dsInsert, dsEdit] then
    cdsDiagnosticoAplicar.Post;

  if cdsDiagnosticoAplicar.Locate( 'KZOO_ANIMAL_FEMEA', AKey, [] )
    and not AForceAddNew
  then
    exit ;

  if     FUseQuickInput
     and ( cdsPadroesKZOO_DIAGNOSTICO.AsString <> '' )
     and PorQuartoDefault
     and ( cdsPadroesQUARTOS.AsString <> '' )  then
    begin
      A := cdsPadroesQUARTOS.AsString.Split( [ ','  ]) ;
      for I := Low(A) to High(A) do
        begin
         AddDiagnosticoAAplicar( AKey, ABrinco, A[I], AForceAddNew  ) ;
         if I = Low(A) then
           LRecno := cdsDiagnosticoAplicar.RecNo ;
        end;
      cdsDiagnosticoAplicar.RecNo := LRecno  ;
    end
  else
    AddDiagnosticoAAplicar( AKey, ABrinco, '', AForceAddNew  ) ;


end;

procedure TZoo_SanidadeDiagnosticosDatamodule.AddDiagnosticoAAplicar(AKey, ABrinco: String ; const AQuarto : string ; const AForceAddNew : boolean ) ;
begin
  try
    cdsDiagnosticoAplicar.DisableControls;
    if AForceAddNew then
      cdsDiagnosticoAplicar.Insert
    else
      cdsDiagnosticoAplicar.Append;

    cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.AsString := AKey;
    cdsDiagnosticoAplicarBRINCO.AsString            := ABrinco;

    if FUseQuickInput and ( cdsPadroesDATA.asDateTime > 0 ) then
      cdsDiagnosticoAplicarDATA.AsDateTime            := cdsPadroesDATA.asDateTime
    else
      cdsDiagnosticoAplicarDATA.AsDateTime            := Date ;

    if FUseQuickInput and ( cdsPadroesKZOO_DIAGNOSTICO.AsString <> '' ) then
     begin
        cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString  := cdsPadroesKZOO_DIAGNOSTICO.AsString ;
        if AQuarto = 'AD' then
           cdsDiagnosticoAplicarQUARTO.asInteger := 1 ;
        if AQuarto = 'AE' then
           cdsDiagnosticoAplicarQUARTO.asInteger := 2 ;
        if AQuarto = 'PD' then
           cdsDiagnosticoAplicarQUARTO.asInteger := 3 ;
        if AQuarto = 'PE' then
           cdsDiagnosticoAplicarQUARTO.asInteger := 4 ;
     end
    else
      cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString  := '' ;

    if FUseQuickInput and ( cdsPadroesKZOO_PROTOCOLO.AsString <> '' ) then
      begin
        cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsString    := cdsPadroesKZOO_PROTOCOLO.AsString ;
        cdsDiagnosticoAplicarCODIGO_PROTOCOLO.asString  := cdsPadroesCODIGO_PROTOCOLO.AsString ;
        cdsDiagnosticoAplicarDESC_PROTOCOLO.asString    := cdsPadroesCODIGO_PROTOCOLO.AsString ;
      end
    else
      cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsString    := '' ;

    if FUseQuickInput and ( cdsPadroesKCAD_FUNCIONARIO.AsString <> '' ) then
      begin
        cdsDiagnosticoAplicarNOMEFUNCIONARIO.asString    := cdsPadroesNOMEFUNCIONARIO.asString    ;
        cdsDiagnosticoAplicarKCAD_FUNCIONARIO.asString   := cdsPadroesKCAD_FUNCIONARIO.asString ;
      end;


    if FUseQuickInput then //and ( cdsPadroesKZOO_PROTOCOLO.AsString <> '' ) then
      CopyTarefasPadrao
    else
      LoadTarefasAAplicar( True ) ;

//    if ( cdsDiagnosticoAplicarKCAD_FUNCIONARIO.AsString = '' ) and HasTarefas then
//      Self.ValidateMessage ( cdsDiagnosticoAplicarNOMEFUNCIONARIO.FieldName ) ;

    cdsDiagnosticoAplicar.BeforePost := nil;
    cdsDiagnosticoAplicar.Post;
    cdsDiagnosticoAplicar.BeforePost := cdsDiagnosticoAplicarBeforePost;
    cdsDiagnosticoAplicar.EnableControls;
    cdsDiagnosticoAplicar.Edit;
  finally
    cdsDiagnosticoAplicar.EnableControls;
  end;

end ;

procedure TZoo_SanidadeDiagnosticosDatamodule.Apply;
begin
  DoApply ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarBeforePost(
  DataSet: TDataSet);
var
  ErrMsg : string ;
  procedure AddErr ( e : string ) ;
    begin
      ErrMsg := ErrMsg + '  - ' + e + #13#10 ;
    end;
begin
  if cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.IsNull then
     AddErr ( 'Brinco da fêmea ainda não foi preenchido' ) ;

//  if HasTarefas and (cdsDiagnosticoAplicarKCAD_FUNCIONARIO.IsNull) then
//   begin
//     AddErr ( 'Ao selecionar alguma tarefa o responsável deve ser informado' ) ;
//     Self.ValidateMessage( cdsDiagnosticoAplicarNOMEFUNCIONARIO.FieldName );
//   end;

  if ErrMsg <> '' then
     raise Warning.Create('Dados inválidos para o registro atual'#13#10#13#10 + ErrMsg );

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_DIAGNOSTICOChange(
  Sender: TField);
begin
  if not cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.IsNull then
   begin
     SetProtocoloVinculado;
   end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarKZOO_PROTOCOLOChange(
  Sender: TField);
begin
   cdsDiagnosticoAplicarDESC_PROTOCOLO.asString := cdsDiagnosticoAplicarCODIGO_PROTOCOLO.asString ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNewRecord(
  DataSet: TDataSet);
begin
  DBResources['ZOOTECNICO'].GetKey( cdsDiagnosticoAplicarKZOO_DIAGNOSTICO_APLICAR ) ;
  cdsDiagnosticoAplicarPROCESSED.asString := 'F' ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsDiagnosticoAplicarNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsDiagnosticoAplicarKCAD_FUNCIONARIO.Clear;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsPadroesNOMEFUNCIONARIOSetText(
  Sender: TField; const Text: string);
begin
  Sender.asString := Text ;
  cdsPadroesKCAD_FUNCIONARIO.Clear;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosPadraoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept :=      //cdsProtocolosPadraoKZOO_DIAGNOSTICO.asString = ''
           //or
            (   cdsProtocolosPadraoKZOO_DIAGNOSTICO.asString
                 = cdsDiagnosticosPadraoKZOO_DIAGNOSTICO.asString
               ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsProtocolosDisponiveisFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
   Accept :=   //cdsProtocolosKZOO_DIAGNOSTICO.asString.Trim = ''
           //or
            ( cdsProtocolosDisponiveisKZOO_DIAGNOSTICO.asString.Trim
                = cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.asString.Trim
              ) ;

end;

function TZoo_SanidadeDiagnosticosDatamodule.FormatTextTarefas ( const AQTDE : integer ; const AList : string = '' ) : string ;
begin

  if AQTDE = 0 then
    Result :='nenhuma tarefa selecionada'
  else if AQTDE = 1 then
    Result := '1 tarefa selecionada'
  else
    Result := Format ( '%d tarefas selecionadas', [ AQTDE ] ) ;

  if AList <> '' then
    Result := Result + AList ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsTarefasCHECKEDChange(
  Sender: TField);
begin

  if Sender.asInteger = 0 then
    cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger := cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger - 1
  else
    cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger := cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger + 1 ;

  cdsDiagnosticoAplicarDESCR_TAREFAS.asString := FormatTextTarefas( cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger ) ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.cdsTarefasPadraoCHECKEDChange(
  Sender: TField);
begin

  if Sender.asInteger = 0 then
    cdsPadroesCOUNT_TAREFAS.asInteger := cdsPadroesCOUNT_TAREFAS.asInteger - 1
  else
    cdsPadroesCOUNT_TAREFAS.asInteger := cdsPadroesCOUNT_TAREFAS.asInteger + 1 ;

  cdsPadroesDESCR_TAREFAS.asString := FormatTextTarefas( cdsPadroesCOUNT_TAREFAS.asInteger ) ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.ClearQuarto;
begin
  if (cdsDiagnosticoAplicar.RecNo <= 0) or (cdsDiagnosticoAplicarQUARTO.IsNull) then
    exit;

  if cdsDiagnosticoAplicar.State in [dsInsert, dsEdit] then
   cdsDiagnosticoAplicar.Edit;

  cdsDiagnosticoAplicarQUARTO.Clear;
  cdsDiagnosticoAplicarQUARTO_DESCR.Text := '';
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.CopyTarefasPadrao;
var
  LRecNo, LCountChecked : integer ;
  LDescricao : string ;
begin
  cdsTarefasPadrao.DisableControls ;
  LRecNo := cdsTarefasPadrao.RecNo ;


  LCountChecked := 0 ;
  LDescricao := #13#10  ;
  cdsTarefas.DisableControls ;
  cdsTarefasPadrao.First ;
  while not cdsTarefasPadrao.eof do
    begin
      if cdsTarefasPadraoCHECKED.asInteger = 1 then
        begin
          LCountChecked := LCountChecked + 1;
          LDescricao :=      LDescricao
                   +#13#10 + cdsTarefasPadraoNOME.asString   ;
        end ;
      cdsTarefas.Append ;
      cdsTarefasKZOO_TAREFA.asString         := cdsTarefasPadraoKZOO_TAREFA.asString          ;
      cdsTarefasEXAME.asString               := cdsTarefasPadraoEXAME.asString                ;
      cdsTarefasCHECKED.asString             := cdsTarefasPadraoCHECKED.asString              ;
      cdsTarefasDEFAULT.asString             := cdsTarefasPadraoDEFAULT.asString              ;
      cdsTarefasCODIGO.AsString              := cdsTarefasPadraoCODIGO.AsString               ;
      cdsTarefasNOME.asString                := cdsTarefasPadraoNOME.asString                 ;
      cdsTarefasDIA.asInteger                := cdsTarefasPadraoDIA.asInteger                 ;
      cdsTarefasVEZES.asInteger              := cdsTarefasPadraoVEZES.asInteger               ;
      cdsTarefasREPLICAR.asInteger           := cdsTarefasPadraoREPLICAR.asInteger            ;
      cdsTarefasINTERVALO.asInteger          := cdsTarefasPadraoINTERVALO.asInteger            ;
      cdsTarefasDESCARTELEITE.asInteger      := cdsTarefasPadraoDESCARTELEITE.asInteger       ;
      cdsTarefasDESCARTECARNE.asInteger      := cdsTarefasPadraoDESCARTECARNE.asInteger       ;
      cdsTarefas.Post ;
      cdsTarefasPadrao.Next ;
    end;

  cdsTarefasPadrao.RecNo := LRecNo;
  cdsTarefasPadrao.EnableControls ;
  cdsTarefas.First ;
  cdsTarefas.EnableControls ;

  cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger := LCountChecked ;
  cdsDiagnosticoAplicarDESCR_TAREFAS.asString := FormatTextTarefas( LCountChecked, LDescricao ) ;

end;

constructor TZoo_SanidadeDiagnosticosDatamodule.Create(AOwner: TComponent);
begin
  inherited;
end;


procedure TZoo_SanidadeDiagnosticosDatamodule.DoApply;
var
  LIndex : String;
begin

  FDoApllyMessageError := '';
  FPreviousAnimalFemea := '';
  FPreviousDiagnostico := '';
  FPreviousData        := 0;
  cdsDiagnosticoAplicar.DisableControls ;
  try
    LIndex := cdsDiagnosticoAplicar.IndexName;
    cdsDiagnosticoAplicar.IndexName := '';
    cdsDiagnosticoAplicar.IndexFieldNames := 'KZOO_ANIMAL_FEMEA;KZOO_DIAGNOSTICO;DATA';
    cdsDiagnosticoAplicar.First ;
    with cdsDiagnosticoAplicar do
      while not eof do
        begin
         InsereDiagnostico ;
         FPreviousAnimalFemea := cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.AsString;
         FPreviousDiagnostico := cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString;
         FPreviousData        := cdsDiagnosticoAplicarDATA.AsDateTime;
         Next ;
       end ;
    cdsDiagnosticoAplicar.IndexFieldNames := '';
    cdsDiagnosticoAplicar.IndexName := LIndex;

    cdsDiagnosticoAplicar.First ;
    with cdsDiagnosticoAplicar do
      while not eof do
        begin
         if cdsDiagnosticoAplicarPROCESSED.asBoolean then
           RemoveDiagnostico
         else
           Next ;
       end ;
  finally
    cdsDiagnosticoAplicar.EnableControls ;
    cdsDiagnosticoAplicar.First ;
  end;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.dtsPadroesDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned( Field ) and (Field = cdsPadroesKZOO_DIAGNOSTICO) then
    begin

      cdsProtocolosPadrao.Filtered := False ;
      cdsProtocolosPadrao.Filtered := True ;

    end;

   if Assigned( Field ) and (Field = cdsPadroesKZOO_PROTOCOLO) then
     LoadTarefasPadrao ; //ThreadSuppl.TSyncThread.Create(  ) ;

end;


procedure TZoo_SanidadeDiagnosticosDatamodule.dtsDiagnosticoAplicarDataChange(
  Sender: TObject; Field: TField);
begin
  if not Assigned( Field )
 or  (Assigned( Field ) and (Field = cdsDiagnosticoAplicarKZOO_DIAGNOSTICO)) then
    begin

      cdsProtocolosDisponiveis.Filtered := False ;
      cdsProtocolosDisponiveis.Filtered := True ;

    end;

  if Assigned( Field ) and (Field = cdsDiagnosticoAplicarKZOO_PROTOCOLO) then
    LoadTarefasAAplicar ; //ThreadSuppl.TSyncThread.Create(  ) ;
end;


procedure TZoo_SanidadeDiagnosticosDatamodule.InsereTarefa ( const ADiagnosticoAnimal, AProtocoloAnimal : string ) ;
var
  LIterateReplicar, LIterateVezes : integer ;
  LDiaExecucao, LVezesAoDia, LReplicas, LIntervaloDias : integer ;
  LNomeFuncionario : string ;
begin
  if cdsTarefasDEFAULT.asBoolean then
    begin
//      LDiaExecucao   := Max ( cdsTarefasDIA.asInteger,           1 ) - 1 ; // no 1o dia ou posterior
      LDiaExecucao   := Max ( cdsTarefasDIA.asInteger,           0 ) ; // considerar dia 0

      LVezesAoDia    := Max ( cdsTarefasVEZES.asInteger,         1 ) ; // pelo menos 1 v.d.
      LReplicas      := Max ( cdsTarefasREPLICAR.asInteger + 1,  1 ) ; // pelo menos 1 tarefa ( = 0, inclui 1x, = 1 inclui 2x... )
      LIntervaloDias := Max ( cdsTarefasINTERVALO.asInteger,     1 ) ; // menor intervalo 1 dia
    end
  else
    begin
      LDiaExecucao   := 0  ; // no 1o dia ou posterior
      LVezesAoDia    := 1  ; // pelo menos 1 v.d.
      LReplicas      := 1  ; // pelo menos 1 tarefa ( = 0, inclui 1x, = 1 inclui 2x... )
      LIntervaloDias := 1  ; // menor intervalo 1 dia
    end;

  LNomeFuncionario := '' ;
  if cdsDiagnosticoAplicarKCAD_FUNCIONARIO.asString <> '' then
     LNomeFuncionario := cdsDiagnosticoAplicarNOMEFUNCIONARIO.asString  ;   // ANomeFuncionario

  for LIterateReplicar := 1 to LReplicas do
      begin
        for LIterateVezes := 1 To LVezesAoDia do
          begin

           TTarefasAnimal.AddTarefa(
               ADiagnosticoAnimal                                   // AKDiagnosticoAnimal
             , AProtocoloAnimal                                     // AKProtocoloAnimal
             , cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA .asString     // AKAnimal
             , cdsTarefasKZOO_TAREFA                  .AsString     // AKTarefa
             , cdsTarefasEXAME                        .asBoolean    // AExame
             , LDiaExecucao  //cdsTarefasDIA    .asInteger          // ADia
             , cdsDiagnosticoAplicarDATA.asDateTime
             + LDiaExecucao                                         //Data
             , LIterateVezes //cdsTarefasVEZES  .asInteger          // VezAoDia
             , cdsTarefasCODIGO                       .asString     // ACodigo
             , cdsTarefasNOME                         .asString     // ANome
             , cdsTarefasDESCARTELEITE                .asInteger    // ADescarteLeite
             , cdsTarefasDESCARTECARNE                .asInteger    // ADescarteCarne
             , cdsDiagnosticoAplicarKCAD_FUNCIONARIO  .asString     // ACAD_FUNCIONARIO
             , LNomeFuncionario // ANomeFuncionario
             , cdsTarefasOBS                          .asString     // Observacao
             , ''                                                   // ALote
             , True ) ;                                             // AGetLoteIfEmpty
          end;
          Inc ( LDiaExecucao, LIntervaloDias ) ;
      end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.InsereTarefas ( const ADiagnosticoAnimal, AProtocoloAnimal : string ) ;
begin
  cdsTarefas.First ;
  with cdsTarefas do
    while not eof do
      begin
         if cdsTarefasCHECKED.asInteger = 1 then
           InsereTarefa ( ADiagnosticoAnimal, AProtocoloAnimal) ;
         Next ;
      end ;
  cdsTarefas.First ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.InvertSelectionTarefas(
  ACds: TClientDataSet);
begin
  ACds.Edit;
  if ACds.FieldByName( 'CHECKED') .asInteger = 1 then
    ACds.FieldByName( 'CHECKED') .asInteger := 0
  else
    ACds.FieldByName( 'CHECKED') .asInteger := 1;
  ACds.Post;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.InsereDiagnostico ;
var
  LDiagnosticoAnimal : string ;
  LProtocoloAnimal   :  string ;
  LHasTarefas : boolean ;
begin
    Try

      LHasTarefas         := False ;

      cdsTarefas.First ;
      with cdsTarefas do
          while not eof do
            begin
               if cdsTarefasCHECKED.asInteger = 1 then
                 begin
                    LHasTarefas := True ;
                    Break ;
                 end;
               Next ;
            end ;

//     if    LHasTarefas
//       and (cdsDiagnosticoAplicarKCAD_FUNCIONARIO.asString = '')
//     then
//      begin
//        FDoApllyMessageError := FDoApllyMessageError+
//                  #13#10' - Fêmea: '+cdsDiagnosticoAplicarBRINCO.AsString+
//                          ' Ao selecionar alguma tarefa o responsável deve ser informado';
//        exit ;
//      end;

      LDiagnosticoAnimal := '' ;
      LProtocoloAnimal   := '' ;

      if (cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.asString <> '') and
         ((cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA.AsString <> FPreviousAnimalFemea) or
          (cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.AsString <> FPreviousDiagnostico) or
          (cdsDiagnosticoAplicarDATA.AsDateTime <> FPreviousData)
          )  then
        LDiagnosticoAnimal := TDiagnosticosAnimal.AddDiagnostico (
             cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA .asString   // AKAnimal
           , cdsDiagnosticoAplicarKZOO_DIAGNOSTICO  .asString   // AKDiagnostico
           , cdsDiagnosticoAplicarQUARTO            .asInteger  // AQuarto
           , cdsDiagnosticoAplicarDATA              .asDateTime // AData
           , ''             // ALote
           , True           // AGetLoteIfEmpty
           , False          // AIniciarProtocolos : boolean = True
                            // AFinalizarProtocolos : boolean = True
        )
      else
      if (cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.asString <> '') then
        LDiagnosticoAnimal := FPreviousDiagnosticoAnimal;


      FPreviousDiagnosticoAnimal :=  LDiagnosticoAnimal;


      if cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString <> '' then
       LProtocoloAnimal :=  TProtocolosAnimal.AddProtocolo (
            cdsDiagnosticoAplicarKZOO_ANIMAL_FEMEA .asString   // AKAnimal
          , cdsDiagnosticoAplicarKZOO_PROTOCOLO    .asString   // AKProtocolo
          , cdsDiagnosticoAplicarDATA              .asDateTime // AData
          , LDiagnosticoAnimal                                 // AKDiagnosticoAnimal
          , ''                                                 // AKTarefaAnimal
          , ''                                                 // AKResultadoTarefa
          , 0                                                  // AResultado
          , False                                              // InsertTarefas
          , ''                                                 // ALote :
          , True                                               // AGetLoteIfEmpty
          , False                                              // ANotify
        ) ;

      if    ( LDiagnosticoAnimal = '' )
        and ( LProtocoloAnimal   = '' )
        and not LHasTarefas
      then
        exit ;

      if LHasTarefas then
        InsereTarefas ( LDiagnosticoAnimal, LProtocoloAnimal  ) ;

       cdsDiagnosticoAplicar.Edit ;
       cdsDiagnosticoAplicarPROCESSED.asString := 'T' ;
       cdsDiagnosticoAplicar.Post ;

    except on E : Exception do
        RaiseException( E, UnitName, ClassName,  'InsereDiagnostico' )
    End;

end;


procedure TZoo_SanidadeDiagnosticosDatamodule.SetFuncionario( const AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsDiagnosticoAplicar.State in [dsInsert, dsEdit] ) then
    cdsDiagnosticoAplicar.Edit ;

  cdsDiagnosticoAplicarNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
  cdsDiagnosticoAplicarKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetFuncionarioPadrao( const AKFuncionario, ANomeFuncionario: string);
begin
  if not ( cdsPadroes.State in [dsInsert, dsEdit] ) then
    cdsPadroes.Edit ;

  cdsPadroesNOMEFUNCIONARIO.Text  := ANomeFuncionario ;
  cdsPadroesKCAD_FUNCIONARIO.asString := AKFuncionario ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticos;
const
  _SELECT_DIAGNOSTICOS =
          'SELECT'
   +#13#10'  '''' KZOO_DIAGNOSTICO'
   +#13#10', '''' CODIGO'
   +#13#10', '''' NOME'
   +#13#10', ''F'' POR_QUARTO'
   +#13#10'FROM RDB$DATABASE D'
   +#13#10'UNION ALL'
   +#13#10'SELECT'
   +#13#10'  D.KZOO_DIAGNOSTICO'
   +#13#10', D.CODIGO'
   +#13#10', D.NOME'
   +#13#10', D.POR_QUARTO'
   +#13#10'FROM ZOO_DIAGNOSTICOS D'
   +#13#10'WHERE D.ATIVO = ''T'''
   +#13#10'  AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10'ORDER BY 3' ;
begin
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsDiagnosticosPadrao,       _SELECT_DIAGNOSTICOS ) ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsDiagnosticosDisponiveis,  _SELECT_DIAGNOSTICOS ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenDiagnosticosAplicar;
begin
  if not cdsDiagnosticoAplicar.Active then
    cdsDiagnosticoAplicar.CreateDataSet
end;


procedure TZoo_SanidadeDiagnosticosDatamodule.OpenProtocolos;
const
  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS =
          'WITH DIAGNOSTICOS_PROTOCOLOS AS'
   +#13#10'  (SELECT'
   +#13#10'    D.KZOO_DIAGNOSTICO'
   +#13#10'  , P.KZOO_PROTOCOLO'
   +#13#10'  , P.CODIGO'
   +#13#10'  FROM ZOO_DIAGNOSTICOS D,ZOO_PROTOCOLOS P'
   +#13#10'   WHERE D.ATIVO = ''T'''
   +#13#10'     AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10'    AND P.ATIVO IS DISTINCT FROM ''F'''
   +#13#10' )'
   +#13#10' SELECT'
   +#13#10'    D.KZOO_DIAGNOSTICO'
   +#13#10' ,  '''' KZOO_PROTOCOLO'
   +#13#10' ,  '''' CODIGO'
   +#13#10' ,  '''' VINCULADO'
   +#13#10' FROM ZOO_DIAGNOSTICOS D'
   +#13#10' WHERE D.ATIVO = ''T'''
   +#13#10'   AND D.TIPODIAGNOSTICO IS NOT NULL'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'    DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO'
   +#13#10' ,  DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO'
   +#13#10' ,  CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'      ELSE ''*''||DIAGNOSTICOS_PROTOCOLOS.CODIGO'
   +#13#10'    END CODIGO'
   +#13#10' ,  CASE'
   +#13#10'      WHEN DP.KZOO_DIAGNOSTICO IS NULL THEN ''F'' '
   +#13#10'      ELSE ''T'' '
   +#13#10'    END VINCULADO'
   +#13#10' FROM DIAGNOSTICOS_PROTOCOLOS'
   +#13#10' LEFT JOIN ZOO_DIAGNOSTICO_PROTOCOLOS DP'
   +#13#10'    ON     DP.KZOO_DIAGNOSTICO = DIAGNOSTICOS_PROTOCOLOS.KZOO_DIAGNOSTICO'
   +#13#10'      AND  DP.KZOO_PROTOCOLO = DIAGNOSTICOS_PROTOCOLOS.KZOO_PROTOCOLO'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'  '''' KZOO_DIAGNOSTICO'
   +#13#10' , '''' KZOO_PROTOCOLO'
   +#13#10' , '''' CODIGO'
   +#13#10' , '''' VINCULADO'
   +#13#10' FROM RDB$DATABASE D'
   +#13#10' UNION ALL'
   +#13#10' SELECT'
   +#13#10'    '''''
   +#13#10' ,  P.KZOO_PROTOCOLO'
   +#13#10' ,  P.CODIGO'
   +#13#10' ,  '''' VINCULADO'
   +#13#10' FROM ZOO_PROTOCOLOS P'
   +#13#10' WHERE P.ATIVO IS DISTINCT FROM ''F'''
   +#13#10'ORDER BY  1, 3, 2' ;
begin
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolosPadrao,       _SELECT_PROTOCOLOS_X_DIAGNOSTICOS ) ;
  DBResources['ZOOTECNICO'].populateClientDataSet( cdsProtocolosDisponiveis,  _SELECT_PROTOCOLOS_X_DIAGNOSTICOS ) ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenTables ;
begin
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsQuartoPadrao );
  DBResources['ZOOTECNICO'].GetSystemTypes ( _ST_TIPO_SIGLAQUARTO,   cdsQuartoDisponiveis );

  OpenDiagnosticos;

  OpenProtocolos;

  cdsPadroes.CreateDataSet  ;
  LoadTarefasPadrao( True ) ;

  OpenDiagnosticosAplicar   ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenTarefas;
begin
  if cdsDiagnosticoAplicar.IsEmpty then
    Exit;
  LoadTarefasAAplicar( True );
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.OpenTarefasPadrao;
begin
  LoadTarefasPadrao( True ) ;
end;

const
  _TAREFAS =
         'SELECT'
  +#13#10'  T.KZOO_TAREFA'                                                       // cdsTarefasKZOO_TAREFA
  +#13#10', 0 CHECKED'                                                           // cdsTarefasCHECKED
  +#13#10', ''F'' "DEFAULT"'                                                     // cdsTarefasDEFAULT
  +#13#10', IIF( T.TIPOTAREFA = -1, ''T'', ''F'' ) EXAME'                        // cdsTarefasEXAME
  +#13#10', T.CODIGO'                                                            // cdsTarefasCODIGO
  +#13#10', T.NOME'                                                              // cdsTarefasNOME
  +#13#10', 0 DIA'                                                               // cdsTarefasDIA
  +#13#10', 1 VEZES'                                                             // cdsTarefasVEZES
  +#13#10', 1 REPLICAR'                                                          // cdsTarefasREPLICAR
  +#13#10', 0 INTERVALO'                                                         // cdsTarefasINTERVALO
  +#13#10', T.DESCARTELEITE'                                                     // cdsTarefasDESCARTELEITE
  +#13#10', T.DESCARTECARNE'                                                     // cdsTarefasDESCARTECARNE
  +#13#10'FROM ZOO_TAREFAS T'                                                    // cdsTarefasOBS
  +#13#10'WHERE'
  +#13#10'  T.ATIVO = ''T'''
  +#13#10'ORDER BY'
  +#13#10'  2 DESC, 3' ;

  _TAREFAS_POR_PROTOCOLO =
         'SELECT'
  +#13#10'  T.KZOO_TAREFA'                                                      // cdsTarefasKZOO_TAREFA
  +#13#10', IIF ( PT.KZOO_PROTOCOLO IS NULL,  0, 1 ) CHECKED'                   // cdsTarefasCHECKED
  +#13#10', IIF ( PT.KZOO_PROTOCOLO IS NULL,  ''F'', ''T'' )  "DEFAULT"'        // cdsTarefasDEFAULT
  +#13#10', PT.EXAME'                                                           // cdsTarefasEXAME
  +#13#10', T.CODIGO'                                                           // cdsTarefasCODIGO
  +#13#10', T.NOME'                                                             // cdsTarefasNOME
  +#13#10', PT.DIA'                                                             // cdsTarefasDIA
  +#13#10', PT.VEZES'                                                           // cdsTarefasVEZES
  +#13#10', PT.REPLICAR'                                                        // cdsTarefasREPLICAR
  +#13#10', PT.INTERVALO'                                                       // cdsTarefasINTERVALO
  +#13#10', T.DESCARTELEITE'                                                    // cdsTarefasDESCARTELEITE
  +#13#10', T.DESCARTECARNE'                                                    // cdsTarefasDESCARTECARNE
  +#13#10'FROM ZOO_TAREFAS T'                                                   // cdsTarefasOBS
  +#13#10'LEFT JOIN ZOO_PROTOCOLO_TAREFAS PT USING ( KZOO_TAREFA )'
  +#13#10'WHERE'
  +#13#10'      T.ATIVO = ''T'''
//  +#13#10'      P.ATIVO = ''T'''
  +#13#10' AND ('
  +#13#10'       PT.KZOO_PROTOCOLO IS NULL'
  +#13#10'    OR PT.KZOO_PROTOCOLO  = :KZOO_PROTOCOLO'
  +#13#10'      )'
  +#13#10'ORDER BY'
  +#13#10'  2 DESC, 3' ;


procedure TZoo_SanidadeDiagnosticosDatamodule.LoadTarefas( var AClientDataSet : TClientDataSet ; const AKZOO_Protocolo : string ) ;
var
  p : TParams ;
begin
  if (AKZOO_PROTOCOLO = '') then
    DBResources['ZOOTECNICO']
       .populateClientDataSet(
          AClientDataSet
       , _TAREFAS
    )
  else
    begin
      p := TParams.Create ;
      p.CreateParam( ftString, 'KZOO_PROTOCOLO', ptInput ).AsString := AKZOO_PROTOCOLO ;
      DBResources['ZOOTECNICO']
         .populateClientDataSet(
            AClientDataSet
          , _TAREFAS_POR_PROTOCOLO
          , p
      ) ;
      p.free ;
    end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.LoadTarefasPadrao( const AInit : boolean = false ) ;
begin

  if    ( not AInit )
    and ( cdsPadroesKZOO_PROTOCOLO.asString = cdsPadroesKLAST_PROTOCOLO.asString )then
     exit ;

  LoadTarefas( cdsTarefasPadrao, cdsPadroesKZOO_PROTOCOLO.asString ) ;

  cdsTarefasPadrao.First ;

  if not ( cdsPadroes.State in [dsInsert,dsEdit] ) then
     cdsPadroes.Edit ;

  cdsPadroesKLAST_PROTOCOLO.asString := cdsPadroesKZOO_PROTOCOLO.asString ;
  UpdateHintTarefasPadrao ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.LoadTarefasAAplicar( const AInit : boolean = false ) ;
var
  cds : TClientDataSet ;
begin

  if    ( not AInit )
    and ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString = cdsDiagnosticoAplicarKLAST_PROTOCOLO.asString )then
     exit ;

///  cdsTarefas.EmptyDataSet ;
///
///
  cdsTarefas.first ;
  while not cdsTarefas.eof do
    cdsTarefas.delete ;


  cds := nil ;
  LoadTarefas( cds, cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString ) ;
  with cds do
    while not eof do
      begin
        cdsTarefas.Append ;
        cdsTarefasKZOO_TAREFA   .asString    := cds.FieldByName ( 'KZOO_TAREFA'    ).asString     ;        //     cdsTarefasKZOO_TAREFA
        cdsTarefasCHECKED       .asInteger   := cds.FieldByName ( 'CHECKED'        ).asInteger    ;        //     cdsTarefasCHECKED
        cdsTarefasDEFAULT       .asString    := cds.FieldByName ( 'DEFAULT'        ).asString     ;        //     cdsTarefasDEFAULT
        cdsTarefasEXAME         .asString    := cds.FieldByName ( 'EXAME'          ).asString     ;        //     cdsTarefasEXAME
        cdsTarefasCODIGO        .asString    := cds.FieldByName ( 'CODIGO'         ).asString     ;        //     cdsTarefasCODIGO
        cdsTarefasNOME          .asString    := cds.FieldByName ( 'NOME'           ).asString     ;        //     cdsTarefasNOME
        cdsTarefasDIA           .asInteger   := cds.FieldByName ( 'DIA'            ).asInteger    ;        //     cdsTarefasDIA
        cdsTarefasVEZES         .asInteger   := cds.FieldByName ( 'VEZES'          ).asInteger    ;        //     cdsTarefasVEZES
        cdsTarefasREPLICAR      .asInteger   := cds.FieldByName ( 'REPLICAR'       ).asInteger    ;     //     cdsTarefasREPLICAR
        cdsTarefasINTERVALO     .asInteger   := cds.FieldByName ( 'INTERVALO'      ).asInteger    ;     //     cdsTarefasINTERVALO
        cdsTarefasDESCARTELEITE .asInteger   := cds.FieldByName ( 'DESCARTELEITE'  ).asInteger    ;     //     cdsTarefasDESCARTELEITE
        cdsTarefasDESCARTECARNE .asInteger   := cds.FieldByName ( 'DESCARTECARNE'  ).asInteger    ;     //     cdsTarefasDESCARTECARNE
                                                     //     cdsTarefasOBS
        cdsTarefas.Post ;
        next ;
      end ;
   cds.Free ;

  cdsTarefas.First ;

//  if not ( cdsDiagnosticoAplicar.State in [dsInsert,dsEdit] ) then
//     cdsDiagnosticoAplicar.Edit ;

  cdsDiagnosticoAplicarKLAST_PROTOCOLO.asString := cdsDiagnosticoAplicarKZOO_PROTOCOLO.asString ;
  UpdateHintTarefas ;

end;

function TZoo_SanidadeDiagnosticosDatamodule.PorQuarto: Boolean;
begin
  Result := cdsDiagnosticosDisponiveisPOR_QUARTO.AsBoolean;

  if not Result then
    ClearQuarto;
end;

function TZoo_SanidadeDiagnosticosDatamodule.PorQuartoDefault: Boolean;
begin
  Result := cdsDiagnosticosPadraoPOR_QUARTO.AsBoolean;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.RemoveDiagnostico;
begin
  if not cdsDiagnosticoAplicar.IsEmpty then
    begin
     cdsTarefas.first ;
     while not cdsTarefas.eof do
        cdsTarefas.delete ;
     cdsDiagnosticoAplicar.Delete;
    end;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetProtocolo(KProtocolo: Variant);
begin
  if not  (cdsDiagnosticoAplicar.State in [dsEdit, dsInsert])  then
   exit;

  if (VarIsNull( KProtocolo )) or (VarIsEmpty( KProtocolo )) and
     (not cdsDiagnosticoAplicarKZOO_PROTOCOLO.IsNull ) then
     cdsDiagnosticoAplicarKZOO_PROTOCOLO.Clear
  else
  if (not ((VarIsNull( KProtocolo )) or (VarIsEmpty( KProtocolo ))) ) and
     ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant <> KProtocolo ) then
      cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant := KProtocolo;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetProtocoloVinculado;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolosDisponiveis, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr(cdsDiagnosticoAplicarKZOO_DIAGNOSTICO.NewValue)+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if ( cds.RecordCount = 1 ) and
     ( (cdsDiagnosticoAplicarKZOO_PROTOCOLO.isNull ) or
       ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant <> cds.FieldByName('KZOO_PROTOCOLO').AsVariant ) ) then
   begin
    cdsDiagnosticoAplicarCODIGO_PROTOCOLO.AsVariant := cds.FieldByName('CODIGO').AsVariant;
    cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant := cds.FieldByName('KZOO_PROTOCOLO').AsVariant;
    cdsDiagnosticoAplicarDESC_PROTOCOLO.asString  := cds.FieldByName('CODIGO').AsVariant;
   end
  else
  if ( cdsDiagnosticoAplicarKZOO_PROTOCOLO.AsVariant <> cds.FieldByName('KZOO_PROTOCOLO').AsVariant ) then
   begin
    cdsDiagnosticoAplicarCODIGO_PROTOCOLO.Clear;
    cdsDiagnosticoAplicarKZOO_PROTOCOLO.Clear;
    cdsDiagnosticoAplicarDESC_PROTOCOLO.Clear;
   end;

  FreeAndNil(cds);
end;



function TZoo_SanidadeDiagnosticosDatamodule.GetProtocoloVinculadoDefault( KDiagnosticoPadrao: Variant): string ;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create( nil );
  cds.CloneCursor(cdsProtocolosPadrao, True);
  cds.Filtered := False;
  cds.Filter := 'KZOO_DIAGNOSTICO = '''+VarToStr( KDiagnosticoPadrao )+
        ''' and VINCULADO = ''T'' ';
  cds.Filtered := True;

  if cds.RecordCount = 1 then
    Result := cds.FieldByName('KZOO_PROTOCOLO').asString
  else
    Result := '';

  cds.DisposeOf ;
end;

function TZoo_SanidadeDiagnosticosDatamodule.HasTarefas: Boolean;
var
  LHasTarefas : Boolean;
begin
  LHasTarefas         := False ;

  cdsTarefas.First ;
  with cdsTarefas do
    while not eof do
     begin
       if cdsTarefasCHECKED.asInteger = 1 then
        begin
          LHasTarefas := True ;
          Break ;
        end;
       Next ;
     end ;
  cdsTarefas.First ;
  Result := LHasTarefas;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.SetUseQuickInput(
  const Value: boolean);
begin
  FUseQuickInput := Value;
end;


procedure TZoo_SanidadeDiagnosticosDatamodule.UpdateHintQuartosPadrao ( const AQuartos : string );
begin
  cdsPadroes.Edit ;
  cdsPadroesQUARTOS.asString := AQuartos ;
end;

procedure TZoo_SanidadeDiagnosticosDatamodule.UpdateHintTarefasPadrao;
var
  LRecNo, LCountChecked : integer ;
  LDescricao : string ;
begin
  cdsTarefasPadrao.DisableControls ;
  LRecNo := cdsTarefasPadrao.RecNo ;

  LCountChecked := 0 ;
  LDescricao := #13#10  ;
  cdsTarefasPadrao.First ;
  while not cdsTarefasPadrao.eof do
    begin
      if cdsTarefasPadraoCHECKED.asInteger = 1 then
        begin
          LCountChecked := LCountChecked + 1;
          LDescricao :=      LDescricao
                   +#13#10 + cdsTarefasPadraoCODIGO.asString   ;
        end;
      cdsTarefasPadrao.Next ;
    end;

  cdsTarefasPadrao.RecNo := LRecNo;
  cdsTarefasPadrao.EnableControls ;

  cdsPadroes.Edit ;
  cdsPadroesCOUNT_TAREFAS.asInteger := LCountChecked ;
  cdsPadroesDESCR_TAREFAS.asString := FormatTextTarefas( LCountChecked, LDescricao ) ;

end;

procedure TZoo_SanidadeDiagnosticosDatamodule.UpdateHintTarefas;
var
  LRecNo, LCountChecked : integer ;
  LDescricao : string ;
begin
  cdsTarefas.DisableControls ;
  LRecNo := cdsTarefas.RecNo ;

  LCountChecked := 0 ;
  LDescricao := #13#10 ;
  cdsTarefas.First ;
  while not cdsTarefas.eof do
    begin
      if cdsTarefasCHECKED.asInteger = 1 then
        begin
          LCountChecked := LCountChecked + 1;
          LDescricao :=      LDescricao
                   +#13#10 + cdsTarefasCODIGO.asString   ;
        end;
      cdsTarefas.Next ;
    end;

  cdsTarefas.RecNo := LRecNo;
  cdsTarefas.EnableControls ;

  cdsDiagnosticoAplicar.Edit ;
  cdsDiagnosticoAplicarCOUNT_TAREFAS.asInteger := LCountChecked ;
  cdsDiagnosticoAplicarDESCR_TAREFAS.asString := FormatTextTarefas( LCountChecked, LDescricao ) ;
end;

end.

