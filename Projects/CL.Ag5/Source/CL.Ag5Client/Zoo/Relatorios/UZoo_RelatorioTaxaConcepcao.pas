unit UZoo_RelatorioTaxaConcepcao;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage,
  {Tc.MP.VCL.Controls.GDIButton,} System.Actions,
  Tc.VCL.Controls.GDIButton,
  Vcl.Mask, JvExMask, JvToolEdit, Tc.VCL.Application,
  Data.DB, Tc.Data.DB.Helpers, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, UZoo_RelatorioTaxaConcepcaoDataModule, ReportTypes, QuickRpt, QRCtrls,
  SysPrintGridDialog,
  Tc.VCL.Extended.Mask, Tc.VCL.Edits,
  Wrappers {Deixar a unit wrappers como ultima no uses} ;

type
  TProcedureTypeDetailBeforePrint = procedure (Sender: TQRCustomBand;  var PrintBand: Boolean) of object;

  TZoo_RelatorioTaxaConcepcao = class(T_FormWizard)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridResultados: TJvDBUltimGrid;
    dtsResultado: TDataSource;
    gbMensagem: TPanel;
    Image1: TImage;
    Label17: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    gbOpcoes: TGroupBox;
    rgTipoData: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    deInicial: TTcDateEdit;
    deFinal: TTcDateEdit;
    Label4: TLabel;
    lblTotalLinhas: TLabel;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure _actExecuteExecute(Sender: TObject);
    procedure _actNextUpdate(Sender: TObject);
    procedure DBGridResultadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridResultadosUserSort(Sender: TJvDBUltimGrid;
      var FieldsToSort: TSortFields; SortString: string; var SortOK: Boolean);
    procedure DBGridResultadosDblClick(Sender: TObject);
  private
    { Private declarations }
    Zoo_RelatorioTaxaConcepcaoDataModule: TZoo_RelatorioTaxaConcepcaoDataModule;
    DoDetailBeforePrint : TProcedureTypeDetailBeforePrint;
    procedure SetParams ;
    procedure DetailBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
  public
    { Public declarations }
    class function Execute : boolean ; override ;
    constructor Create ( AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
  end;


implementation

{$R *.dfm}

uses
     ClAg5ClientZootecnicoCommonTypes ;


{ TfrmCustomWizard }

constructor TZoo_RelatorioTaxaConcepcao.Create(AOwner: TComponent);
begin
  inherited;
  // insira os codigos de criação de DTM ou variaveis aqui
  Zoo_RelatorioTaxaConcepcaoDataModule:= TZoo_RelatorioTaxaConcepcaoDataModule.Create( Self );
  dtsResultado.DataSet:= Zoo_RelatorioTaxaConcepcaoDataModule.cdsResultados;
  DBGridResultados.ShowHighlighter := True ;
end;

procedure TZoo_RelatorioTaxaConcepcao.DBGridResultadosDblClick(Sender: TObject);
begin
  inherited;
  if ( DBGridResultados.ScreenToClient( Mouse.CursorPos ).Y <= DBGridResultados.TitleRowHeight ) then
    exit ;

  with dtsResultado, DataSet do
  if Assigned ( DataSet ) and not ( BOF and EOF ) then
    if Assigned ( Fields.FindField( 'KZOO_ANIMAL_FEMEA'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL_FEMEA').AsString )
    else if Assigned ( Fields.FindField( 'KZOO_ANIMAL'  ) ) then
     TShowFichaAnimal.Execute( FieldByName('KZOO_ANIMAL').AsString );
end;

procedure TZoo_RelatorioTaxaConcepcao.DBGridResultadosDrawColumnCell(
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

procedure TZoo_RelatorioTaxaConcepcao.DBGridResultadosUserSort(
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

destructor TZoo_RelatorioTaxaConcepcao.Destroy;
begin
  // destrua as variaveis alocadas aqui.
  inherited;
end;

procedure TZoo_RelatorioTaxaConcepcao.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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

class function TZoo_RelatorioTaxaConcepcao.Execute : boolean;
var
  ThisForm: TZoo_RelatorioTaxaConcepcao;
begin
  ThisForm := TZoo_RelatorioTaxaConcepcao.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        {ThisForm.DoSomething}  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_RelatorioTaxaConcepcao.SetParams;
begin
  Zoo_RelatorioTaxaConcepcaoDataModule.DataInicial := deInicial.Date ;
  Zoo_RelatorioTaxaConcepcaoDataModule.DataFinal   := deFinal.Date ;
  Zoo_RelatorioTaxaConcepcaoDataModule.TipoData    := rgTipoData.ItemIndex;
end;

procedure TZoo_RelatorioTaxaConcepcao._actExecuteExecute(Sender: TObject);
begin

 DoDetailBeforePrint := DetailBeforePrint;

 SysPrintGridDialog.TPrintGridDialog.Execute( DBGridResultados, Caption,
                                             '*    Número de coberturas/inseminações com diagnóstico de gestação'+
                                       #13#10'**   Natimortos fêmeas são considerados para Fêmeas e Taxa de fêmeas (%).'+
                                       #13#10'     Coberturas realizadas para coleta de embrião não são consideradas nesse relatório.',
                                            True, '', DoDetailBeforePrint      );
  inherited;

end;

procedure TZoo_RelatorioTaxaConcepcao._actNextExecute(Sender: TObject);
begin
  lblTotalLinhas.Caption :='';

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;
  SetParams;
  Zoo_RelatorioTaxaConcepcaoDataModule.OpenTables  ;
  DBGridResultados.Columns[2].Visible := rgTipoData.ItemIndex = 0;
  DBGridResultados.Columns[3].Visible := rgTipoData.ItemIndex = 0;
  DBGridResultados.Columns[4].Visible := rgTipoData.ItemIndex = 0;
  lblTotalLinhas.Caption := Format('Total de linhas: %d',[dtsResultado.Dataset.RecordCount]);
end;

procedure TZoo_RelatorioTaxaConcepcao._actNextUpdate(Sender: TObject);
begin
  _actNext.Enabled := (deInicial.Date > 0) and (deFinal.Date >= deInicial.Date) and (deInicial.Date <= Date) ;
end;

procedure TZoo_RelatorioTaxaConcepcao._actPriorExecute(Sender: TObject);
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
   RegisterClass ( TZoo_RelatorioTaxaConcepcao ) ;

end.
