unit UZoo_RelatorioProtocolosReprodutivosIATF;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,  DBClient,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions, UZoo_RelatorioProtocolosReprodutivosIATFDataModule,
  Tc.VCL.Controls.GDIButton, Tc.VCL.Application, Vcl.Mask, SysPrintGridDialog,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits, Data.DB, Tc.Data.DB.Helpers, Vcl.Grids, Vcl.DBGrids, QuickRpt, QrCtrls,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Wrappers ;

type
  TZoo_RelatorioProtocolosReprodutivosIATF = class(T_FormWizard)
    TabSheet1: TTabSheet;
    gbOpcoes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    deInicial: TTcDateEdit;
    deFinal: TTcDateEdit;
    TabSheet2: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    gbMensagem: TPanel;
    Image1: TImage;
    Label17: TLabel;
    lblTotalLinhas: TLabel;
    dtsResultado: TDataSource;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure DBGridResultadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridResultadosUserSort(Sender: TJvDBUltimGrid;
      var FieldsToSort: TSortFields; SortString: string; var SortOK: Boolean);
    procedure _actExecuteExecute(Sender: TObject);
  private
    { Private declarations }
    Zoo_RelatorioProtocolosReprodutivosIATFDataModule: TZoo_RelatorioProtocolosReprodutivosIATFDataModule;
    DoDetailBeforePrint : TProcedureTypeDetailBeforePrint;
    procedure SetParams;
    procedure DetailBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }

constructor TZoo_RelatorioProtocolosReprodutivosIATF.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  Zoo_RelatorioProtocolosReprodutivosIATFDataModule:= TZoo_RelatorioProtocolosReprodutivosIATFDataModule.Create( self );
  dtsResultado.DataSet := Zoo_RelatorioProtocolosReprodutivosIATFDataModule.cdsResultados;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF.DBGridResultadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if DBGridResultados.DataSource.DataSet.FieldByName('TIPO_REG').AsInteger = 2 then
   begin
     DBGridResultados.Canvas.Font.Style := [fsbold];
     DBGridResultados.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF.DBGridResultadosUserSort(
  Sender: TJvDBUltimGrid; var FieldsToSort: TSortFields; SortString: string;
  var SortOK: Boolean);
var
 LFieldName : string ;
 cAscFields : string ;
 cDescField : string ;
 x: integer ;
 CDS : TClientDataSet ;
begin

  CDS := TClientDataSet ( TJvDBUltimGrid( Sender ).DataSource.DataSet ) ;

  if Assigned ( CDS.MasterSource ) then
    begin
     exit ;
    end;

  cAscFields := '' ;
  cDescField := '' ;

  for x := Low ( FieldsToSort ) to High( FieldsToSort ) do
    begin
        LFieldName := FieldsToSort[x].Name + '_' ;
        if not Assigned ( CDS.FindField( LFieldName ) ) then
           LFieldName := FieldsToSort[x].Name ;

        cAscFields := cAscFields + ';' + LFieldName;

        if not ( FieldsToSort[x].Order ) then
           cDescField := cDescField + ';' + LFieldName;
    end;


  Delete ( cAscFields, 1, 1  ) ;

  Delete ( cDescField, 1, 1  ) ;

  cAscFields := 'TIPO_REG;'+cAscFields;

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

destructor TZoo_RelatorioProtocolosReprodutivosIATF.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF.DetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var i: Integer;
begin

  for I := 0 to Sender.ControlCount-1 do
   begin
     if (Sender.Controls[I].ClassName = 'TQRDBText')  then
      begin
        if ( TQuickRep(Sender.Parent).DataSet.FieldByName('TIPO_REG').AsInteger = 2 ) then
         begin

          TQRDBText( Sender.Controls[I] ).Font.Style := [fsBold]
         end
        else
         begin

          TQRDBText( Sender.Controls[I] ).Font.Style := []
         end;
      end;
   end;

end;

class function TZoo_RelatorioProtocolosReprodutivosIATF.Execute : boolean;
var
  ThisForm: TZoo_RelatorioProtocolosReprodutivosIATF;
begin
  ThisForm := TZoo_RelatorioProtocolosReprodutivosIATF.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_RelatorioProtocolosReprodutivosIATF.SetParams;
begin
  Zoo_RelatorioProtocolosReprodutivosIATFDataModule.DataIni := deInicial.Date ;
  Zoo_RelatorioProtocolosReprodutivosIATFDataModule.DataFim := deFinal.Date ;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF._actExecuteExecute(
  Sender: TObject);
begin
  DoDetailBeforePrint := DetailBeforePrint;

 SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption,
                                             '',
                                            True, '', DoDetailBeforePrint      );
  inherited;

end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption :='';
  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;
  SetParams;
  inherited;
  Zoo_RelatorioProtocolosReprodutivosIATFDataModule.OpenTables;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);

end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF._actNextUpdate(
  Sender: TObject);
begin
  _actNext.Enabled := (deInicial.Date > 0) and (deFinal.Date >= deInicial.Date) and (deInicial.Date <= Date) ;
end;

procedure TZoo_RelatorioProtocolosReprodutivosIATF._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

initialization
   RegisterClass ( TZoo_RelatorioProtocolosReprodutivosIATF ) ;

end.
