unit UfrmZoo_HistoricoAnimal;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  UdtmZoo_HistoricoAnimal, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, VCL.ExtCtrls, VCL.ActnList, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  Tc.VCL.Application,
  Tc.VCL.FormIntf, Tc.VCL.Form, System.Actions,
  CL.Ag5.NSMsgs, Wrappers ;

type
  TfrmZoo_HistoricoAnimal = class(TTcForm, ITcDataForm)
    Panel2: TPanel;
    dbgHistoricoAnimal: TJvDBUltimGrid;
    dtsHistorico: TDataSource;
    procedure dbgHistoricoAnimalGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgHistoricoAnimalUserSort(Sender: TJvDBUltimGrid;
      var FieldsToSort: TSortFields; SortString: string; var SortOK: Boolean);
    procedure dbgHistoricoAnimalGetSortFieldName(Sender: TJvDBUltimGrid;
      var FieldName: string);
    function dbgHistoricoAnimalCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
  private
    { Private declarations }
    dtmZoo_HistoricoAnimal : TdtmZoo_HistoricoAnimal ;
    FMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);
    //ITcDataForm
    function GetBOF : boolean ; virtual ; abstract ;
    function GetEOF : boolean ; virtual ; abstract ;
    procedure InsertRecord ;    virtual ; abstract ;
    procedure EditRecord ;      virtual ; abstract ;
    procedure DeleteRecord ;    virtual ; abstract ;
    procedure Save ;            virtual ; abstract ;
    procedure Cancel ;          virtual ; abstract ;
    procedure PrintData ;
    procedure OtherOptions ;
    // security
    function QueryAllowedDataActions : TTcDataActions ;
    // active actions
    function QueryActiveDataActions : TTcDataActions ;
    // properties
    property BOF : boolean read GetBOF ;
    property EOF : boolean read GetEOF ;
    procedure NeedRefresh ( Sender : TCLAg5NSMsg );
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    destructor Destroy ; override ;

  end;

implementation

{$R *.dfm}

Uses SysPrintGridDialog ;

constructor TfrmZoo_HistoricoAnimal.Create(AOwner: TComponent);
begin
  inherited;
  dtmZoo_HistoricoAnimal := TdtmZoo_HistoricoAnimal.Create(self) ;
  dtsHistorico.DataSet := dtmZoo_HistoricoAnimal.cdsHistoricoAnimal ;

  TCLAg5NSMsgEVT_Sanidade.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.Subscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.Subscribe( NeedRefresh ) ;
end;


function TfrmZoo_HistoricoAnimal.dbgHistoricoAnimalCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field )
    and (  ( Field.FieldName = 'PRENHEZ' )
        or ( Field.FieldName = 'REEXAMINAR' )
        or ( Field.FieldName = 'PROTOCOLO_TOQUE' )
        or ( Field.FieldName = 'PROTOCOLO_PARTO' )
         ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;

end;

procedure TfrmZoo_HistoricoAnimal.dbgHistoricoAnimalGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if   ( dtmZoo_HistoricoAnimal.cdsHistoricoAnimalLACTACAO.AsInteger > 0 )
   and (   (dtmZoo_HistoricoAnimal.cdsHistoricoAnimalEVENTO.asString = 'Parto')
        or (    (dtmZoo_HistoricoAnimal.cdsHistoricoAnimalEVENTO.asString = 'Aborto')
            and (dtmZoo_HistoricoAnimal.cdsHistoricoAnimalDESCRICAO.asString = 'com lactação')
           )
        )
   and ( dtmZoo_HistoricoAnimal.cdsHistoricoAnimalDIASPARTO.AsInteger = 0 ) then
  Background := $00CBF7FE // $009DEEFD  // amarelo pastel ;
end;

procedure TfrmZoo_HistoricoAnimal.dbgHistoricoAnimalGetSortFieldName(
  Sender: TJvDBUltimGrid; var FieldName: string);
begin
  if   SameText ( FieldName, 'DIAS' ) then
      FieldName := 'DIAS.DIASPARTO'
  else if   SameText ( FieldName, 'DIASPARTO' )
    or SameText ( FieldName, 'DIASEVENTO' )
    or SameText ( FieldName, 'DIASHOJE' ) then
      FieldName := 'DIAS.' + FieldName ;
end;

procedure TfrmZoo_HistoricoAnimal.dbgHistoricoAnimalUserSort(Sender: TJvDBUltimGrid;
  var FieldsToSort: TSortFields; SortString: string; var SortOK: Boolean);
var
 cAscFields : string ;
 cDescField : string ;
 x: integer ;
 CDS : TClientDataSet ;
begin

  CDS := TClientDataSet ( TJvDBUltimGrid( Sender ).DataSource.DataSet ) ;

  if Assigned ( CDS.MasterSource ) then
     exit ;

  cAscFields := '' ;
  cDescField := '' ;
  for x := Low ( FieldsToSort ) to High( FieldsToSort ) do
    if not SameText ( FieldsToSort[x].Name, 'DATA' ) then
     begin
        if   SameText ( FieldsToSort[x].Name, 'DIASPARTO' )
          or SameText ( FieldsToSort[x].Name, 'DIASEVENTO' )
          or SameText ( FieldsToSort[x].Name, 'DIASHOJE' ) then
        cAscFields := cAscFields + ';DIAS.' + FieldsToSort[x].Name
        else
        cAscFields := cAscFields + ';' + FieldsToSort[x].Name ;
        if not ( FieldsToSort[x].Order ) then // acendente
           cDescField := cDescField + ';' + FieldsToSort[x].Name ;
     end ;
  cAscFields := cAscFields + ';DATA' ;
  Delete ( cAscFields, 1, 1  ) ;
  Delete ( cDescField, 1, 1  ) ;

  with CDS do
     begin
        if IndexName = '__Idx' then
           DeleteIndex('__Idx') ;
        try
          AddIndex( '__Idx', cAscFields, [ixNonMaintained],cDescField ) ;
          IndexName := '__Idx' ;
          SortOK := True ;
        except
          MessageDlg ( 'Não é possível ordenar por este campo' ) ;
        end;
     end ;
end;



destructor TfrmZoo_HistoricoAnimal.Destroy;
begin
  TCLAg5NSMsgEVT_Sanidade.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_CiosCoberturas.UnSubscribe ( NeedRefresh ) ;
  TCLAg5NSMsgEVT_BancoDadosFemeaEventosReprodutivos.UnSubscribe( NeedRefresh ) ;
  inherited;
end;

procedure TfrmZoo_HistoricoAnimal.NeedRefresh(Sender: TCLAg5NSMsg );
begin
   with dtmZoo_HistoricoAnimal do
     begin
      if ( cdsHistoricoAnimal.State in [dsInsert,dsEdit] ) or (cdsHistoricoAnimal.ChangeCount > 0 ) then
         exit ;

      ChangeHistorico;
     end;
end;

procedure TfrmZoo_HistoricoAnimal.OtherOptions;
begin

end;

procedure TfrmZoo_HistoricoAnimal.PrintData;
begin
  SysPrintGridDialog.TPrintGridDialog.Execute( dbgHistoricoAnimal, 'Histórico animal' );
end;

function TfrmZoo_HistoricoAnimal.QueryAllowedDataActions: TTcDataActions;
begin
   Result := [ daPrint ] ;
end;

function TfrmZoo_HistoricoAnimal.QueryActiveDataActions: TTcDataActions;
begin
   Result := [ daPrint ] ;

   if Application.LicenseState = lsReadOnly then
      Result := Result - [ daInsert,daEdit,daDelete,daSave,daCancel ] ;
end;


procedure TfrmZoo_HistoricoAnimal.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
  dtmZoo_HistoricoAnimal.MasterSource := FMasterSource ;
  dtmZoo_HistoricoAnimal.OpenTables ;
end;

end.

