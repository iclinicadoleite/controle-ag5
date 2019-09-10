unit UZoo_RelatorioRastreamentoFormDialog;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls,
  VCL.Forms,  SysFormDialog, VCL.ActnList, VCL.ExtCtrls, VCL.StdCtrls, VCL.Buttons, Exceptions,
  JvExExtCtrls, JvExtComponent, JvPanel, JvImage, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids,
  DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, JvDBGrid, JvDBUltimGrid, UdtmSYS_BASE, UDBZootecnico, ClAg5ClientZootecnicoCommonTypes,
  Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.VCL.Application, Wrappers ;

type
  TZoo_RelatorioRastreamentoFormDialog = class(T_FormDialog)
    _btbSave: TTcGDIButton;
    _btbCancel: TTcGDIButton;
    ScrollBox1: TScrollBox;
    JvDBUltimGrid1: TJvDBUltimGrid;
    dtsListaAnimais: TDataSource;
    Memo1: TMemo;
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
    procedure JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
  private
    { Private declarations }
    cdsListaAnimais : TClientDataSet ;
    procedure GeraListaAnimais;
  public
    { Public declarations }
    class function Execute( TipoEvento:String; WHERE:string; Params:TParams; Repete:Boolean ) : boolean ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses Tc.DBRTL.AbstractDB, CDSSuppl, Data.SQLTimSt, DateUtils;

var
  FTipoEvento : String ;
  FWHERE      : string ;
  FParams     : TParams;
  FRepete     : Boolean;

{$R *.dfm}

{ TfrmCustomDialog }

constructor TZoo_RelatorioRastreamentoFormDialog.Create(AOwner: TComponent);
begin
  inherited;

  JvDBUltimGrid1.ShowHighlighter := True ;

  if debugHook <> 0 then
    begin
       Memo1.Visible := True ;
       Memo1.Align   := alBottom ;
    end;

  cdsListaAnimais := TClientDataSet.Create(Self);
  GeraListaAnimais;
end;

destructor TZoo_RelatorioRastreamentoFormDialog.Destroy;
begin
  cdsListaAnimais.Free;
  inherited;
end;

class function TZoo_RelatorioRastreamentoFormDialog.Execute( TipoEvento:String; WHERE:string;
    Params:TParams; Repete:Boolean ) : boolean ;
var
  ThisForm: TZoo_RelatorioRastreamentoFormDialog;
  ModalResult : integer ;
begin
  FParams       := TParams.Create();
  FParams.Assign( Params );
  FTipoEvento   := TipoEvento;
  FWHERE        := WHERE ;
  FRepete       := Repete ;

  ThisForm := TZoo_RelatorioRastreamentoFormDialog.Create( nil );
  try
    ModalResult := ThisForm.ShowModal;
    Result := ( ModalResult = mrOK );
    if Result then
      { ThisForm.  } ;
  finally
    ThisForm.free;
  end;

end ;

procedure TZoo_RelatorioRastreamentoFormDialog.GeraListaAnimais;
var
  Sql_ListaAnimais : string;
  i : Integer ;
begin
  if FRepete then
    Sql_ListaAnimais := 'SELECT '
  else
    Sql_ListaAnimais := 'SELECT DISTINCT ';

    Sql_ListaAnimais := Sql_ListaAnimais +
             #13#10 + '  AF.KZOO_ANIMAL_FEMEA, ' +
             #13#10 + '  AN.BRINCO, ' +
             #13#10 + '  AN.NOMEESTABULO, ' +
             #13#10 + '  AF.LOTE, ' ;

       if FTipoEvento = 'D' then Sql_ListaAnimais := Sql_ListaAnimais + #13#10 + '  AD.DATA DATA_EVENTO, '
  else if FTipoEvento = 'E' then Sql_ListaAnimais := Sql_ListaAnimais + #13#10 + '  EZ.DATAEVENTO DATA_EVENTO, '
  else if FTipoEvento = 'P' then Sql_ListaAnimais := Sql_ListaAnimais + #13#10 + '  EZ.DATAABORTOPARTO DATA_EVENTO, ';

  Sql_ListaAnimais := Sql_ListaAnimais +
             #13#10 + '  LA.DEL, ' +
             #13#10 + '  NL.NL, ' +
             #13#10 + '  ST.STATUS, ' +
             #13#10 + '  (  SELECT P.TOTAL FROM ZOO_PESAGEM_LEITE P ' +
             #13#10 + '      WHERE P.KZOO_LACTACAO = LA.KZOO_LACTACAO ' +
             #13#10 + '        AND P.DATA <= :DATAFIM ' +
             #13#10 + '      ORDER BY P.DATA DESC ROWS 1 ' +
             #13#10 + '   ) ULTIMA_PESAGEM ' +
             #13#10 + 'FROM ZOO_ANIMAIS AN ' +
             #13#10 + 'JOIN ZOO_ANIMAIS_FEMEA AF ON AF.KZOO_ANIMAL_FEMEA = AN.KZOO_ANIMAL ' +
             #13#10 + 'LEFT JOIN ( SELECT L.KZOO_LACTACAO, ' +
             #13#10 + '              CAST( IIF ( ( ( L.DATA_SECAGEM IS NOT NULL ) OR ( L.DATA_SECAGEM <= :DATAFIM )), ' +
             #13#10 + '                 L.DATA_SECAGEM - L.DATALACTACAO, ' +
             #13#10 + '                 DATEDIFF( DAY, L.DATALACTACAO, :DATAFIM ) ' +
             #13#10 + '                  ) AS INT ) DEL ' +
             #13#10 + '             FROM ZOO_LACTACOES L ' +
             #13#10 + '           ) LA ON LA.KZOO_LACTACAO = AF.KULTIMA_LACTACAO ' ;

  if FTipoEvento = 'D' then
    Sql_ListaAnimais := Sql_ListaAnimais +
             #13#10 + 'LEFT JOIN ZOO_ANIMAL_DIAGNOSTICOS AD ON AD.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA ' +
             #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, AD.DATA ) ST ON 1=1 ' +
             #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, AD.DATA) NL ON 1=1 '
  else if FTipoEvento = 'E' then
    Sql_ListaAnimais := Sql_ListaAnimais +
             #13#10 + 'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA ' +
             #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, COALESCE(EZ.DATATOQUE, EZ.DATAEVENTO) ) ST ON 1=1 ' +
             #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAEVENTO ) NL ON 1=1 '
  else if FTipoEvento = 'P' then
    Sql_ListaAnimais := Sql_ListaAnimais +
             #13#10 + 'LEFT JOIN ZOO_EVENTOS_ZOOTECNICOS EZ ON EZ.KZOO_ANIMAL_FEMEA = AF.KZOO_ANIMAL_FEMEA ' +
             #13#10 + 'LEFT JOIN ZOO_GET_STATUS_NADATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAABORTOPARTO ) ST ON 1=1 ' +
             #13#10 + 'LEFT JOIN ZOO_GET_NL_ATEDATA ( AF.KZOO_ANIMAL_FEMEA, EZ.DATAABORTOPARTO ) NL ON 1=1 ' ;

  Sql_ListaAnimais := Sql_ListaAnimais + FWHERE ;

  Memo1.Text := Sql_ListaAnimais + #13#10 ;
  for i := 0 to FParams.Count-1 do Memo1.Text := Memo1.Text + #13#10 + FParams[i].Name + ' - ' + FParams[i].Text;

  TTcAbstractDB.GetByAlias('ZOOTECNICO').populateClientDataSet( cdsListaAnimais, Sql_ListaAnimais, FParams );
  dtsListaAnimais.DataSet := cdsListaAnimais;
  FreeAndNil( FParams ) ;
end;

procedure TZoo_RelatorioRastreamentoFormDialog.JvDBUltimGrid1DblClick(Sender: TObject);
begin
  inherited;
  TShowFichaAnimal.Execute( cdsListaAnimais.FieldByName('KZOO_ANIMAL_FEMEA').AsString );
end;

procedure TZoo_RelatorioRastreamentoFormDialog.JvDBUltimGrid1ShowEditor(Sender: TObject; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False ;
end;

end.
