unit UZoo_BancoDadosMachoEventosReprodutivosForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, VCL.ExtCtrls,
  UZoo_BancoDadosMachoEventosReprodutivosDatamodule, VCL.ActnList,
  System.Actions, Tc.VCL.Application, Tc.VCL.Form, Wrappers ;

type

  TZoo_BancoDadosMachoEventosReprodutivosForm = class(TTcForm)
    Panel11: TPanel;
    dbgEventosReprodutivos: TJvDBUltimGrid;
    dtsEventosZootecnicos: TDataSource;
    function dbgEventosReprodutivosCheckIfBooleanField(Grid: TJvDBGrid; Field: TField;
      var StringForTrue, StringForFalse: string): Boolean;
    procedure dbgEventosReprodutivosShowEditor(Sender: TObject; Field: TField;
      var AllowEdit: Boolean);
  private
    FMasterSource: TDataSource;
     Zoo_BancoDadosMachoEventosReprodutivosDatamodule : TZoo_BancoDadosMachoEventosReprodutivosDatamodule ;
    procedure SetMasterSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent  ) ; override ;
    property MasterSource : TDataSource  read FMasterSource write SetMasterSource;
    procedure Print ;
  end;


implementation

uses
   SysPrintGridDialog ;

{$R *.dfm}

{ TfrmZoo_EventosReprodutivosAnimal }

constructor TZoo_BancoDadosMachoEventosReprodutivosForm.Create(AOwner: TComponent);
begin
   inherited Create ( AOwner ) ;
    Zoo_BancoDadosMachoEventosReprodutivosDatamodule := TZoo_BancoDadosMachoEventosReprodutivosDatamodule.Create ( self ) ;
   dtsEventosZootecnicos.DataSet :=  Zoo_BancoDadosMachoEventosReprodutivosDatamodule.cdsEventosZoo ;
end;

function TZoo_BancoDadosMachoEventosReprodutivosForm.dbgEventosReprodutivosCheckIfBooleanField(
  Grid: TJvDBGrid; Field: TField; var StringForTrue,
  StringForFalse: string): Boolean;
begin
  inherited;
  Result := Assigned ( Field ) and ( ( Field.FieldName = 'PRENHEZ' ) or  ( Field.FieldName = 'REEXAMINAR' ) or ( Field.FieldName = 'PROTOCOLO_TOQUE' ) ) ;
  StringForTrue := 'T' ;
  StringForFalse := 'F' ;
end;

procedure TZoo_BancoDadosMachoEventosReprodutivosForm.dbgEventosReprodutivosShowEditor(
  Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := False ;
end;

procedure TZoo_BancoDadosMachoEventosReprodutivosForm.Print;
begin
   SysPrintGridDialog.TPrintGridDialog.Execute( dbgEventosReprodutivos, Caption );
end;

procedure TZoo_BancoDadosMachoEventosReprodutivosForm.SetMasterSource(
  const Value: TDataSource);
begin
  FMasterSource := Value;
   Zoo_BancoDadosMachoEventosReprodutivosDatamodule.MasterSource := FMasterSource ;
   Zoo_BancoDadosMachoEventosReprodutivosDatamodule.OpenTables ;
end;

end.
