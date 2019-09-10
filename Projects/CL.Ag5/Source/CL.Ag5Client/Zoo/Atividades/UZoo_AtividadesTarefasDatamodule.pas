unit UZoo_AtividadesTarefasDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   UdtmSYS_BASE, Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Provider;

type
  TZoo_AtividadesTarefasDatamodule = class(T_dtmBASE)
    cdsATarefas: TClientDataSet;
    dspATarefas: TDataSetProvider;
    sqlATarefas: TTcSQLDataSet;
    sqlATarefasBRINCOFEMEA: TStringField;
    sqlATarefasNOMEFEMEA: TStringField;
    sqlATarefasDATAPROGRAMADA: TSQLTimeStampField;
    sqlATarefasPROTOCOLO: TStringField;
    sqlATarefasREPONSAVEL: TStringField;
    cdsATarefasBRINCOFEMEA: TStringField;
    cdsATarefasNOMEFEMEA: TStringField;
    cdsATarefasDATAPROGRAMADA: TSQLTimeStampField;
    cdsATarefasTAREFA: TStringField;
    cdsATarefasPROTOCOLO: TStringField;
    cdsATarefasREPONSAVEL: TStringField;
    sqlATarefasLOTE: TStringField;
    cdsATarefasLOTE: TStringField;
    sqlATarefasOBS: TMemoField;
    cdsATarefasOBS: TMemoField;
    sqlATarefasBRINCOFEMEA_: TStringField;
    cdsATarefasBRINCOFEMEA_: TStringField;
    sqlATarefasATRASADA: TStringField;
    cdsATarefasATRASADA: TStringField;
    sqlATarefasKZOO_ANIMAL_FEMEA: TStringField;
    cdsATarefasKZOO_ANIMAL_FEMEA: TStringField;
    sqlATarefasTAREFA: TStringField;
    procedure cdsATarefasBeforeOpen(DataSet: TDataSet);
    procedure cdsATarefasDATAPROGRAMADAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FAte: TDateTime;
    procedure SetParams ;
    procedure SetAte(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    ProxXDias : Boolean ;
    property Ate : TDateTime  read FAte write SetAte;
    procedure OpenTables ; override ;
    procedure ApplyUpdates ; override ;
  end;


implementation

uses Exceptions, CDSSuppl, UDBZootecnico, Data.SQLTimSt, DateUtils , CLAg5Types;

{$R *.dfm}

{ TdtmZoo_AtividadesSecagem }

procedure TZoo_AtividadesTarefasDatamodule.ApplyUpdates;
begin
//
end;

procedure TZoo_AtividadesTarefasDatamodule.cdsATarefasBeforeOpen(DataSet: TDataSet);
begin
  SetParams ;
end;

procedure TZoo_AtividadesTarefasDatamodule.cdsATarefasDATAPROGRAMADAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not cdsATarefas.IsEmpty  then
   if cdsATarefasATRASADA.AsString = 'T' then
     Text := Sender.AsString +  '*'
   else
     Text := Sender.AsString
end;

procedure TZoo_AtividadesTarefasDatamodule.OpenTables;
begin
//
end;

procedure TZoo_AtividadesTarefasDatamodule.SetAte(const Value: TDateTime);
begin
  FAte := Value;
  if cdsATarefas.Active then
     cdsATarefas.Close ;
  TCDSSuppl.Open ( cdsATarefas ) ;
end;

procedure TZoo_AtividadesTarefasDatamodule.SetParams;
begin
  cdsATarefas.Params.ParamByName ( 'KCAD_FAZENDA' ).asString          := LoggedUser.DomainID ;
  cdsATarefas.Params.ParamByName ( 'STATUS_DESCARTADO' ).asInteger    := _ST_STATUS_ANIMAL_DESCARTADO ;

//  if ProxXDias then
//    cdsATarefas.Params.paramByName ( 'DATAINI'      ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( StartOfTheDay( Date ) )
//  else
//    cdsATarefas.Params.paramByName ( 'DATAINI'      ).asSQLTimeStamp  := DateTimeToSQLTimeStamp ( 1 ) ;

  cdsATarefas.Params.paramByName ( 'DATAFIM'      ).asSQLTimeStamp    := DateTimeToSQLTimeStamp ( EndOfTheDay( FAte ) ) ;

  cdsATarefas.Params.paramByName ( 'EXECUTADO'    ).AsInteger         := _ST_STATUS_TAREFA_EXECUTADA ;
  cdsATarefas.Params.paramByName ( 'PENDENTE'     ).AsInteger         := _ST_STATUS_TAREFA_PENDENTE ;
  cdsATarefas.Params.paramByName ( 'DESCARTE_LEITE'     ).AsInteger   := 5 ; //_ST_STATUS_TAREFA_DESCARTE_LEITE ;
  cdsATarefas.Params.paramByName ( 'DESCARTE_CARNE'     ).AsInteger   := 6 ; //_ST_STATUS_TAREFA_DESCARTE_CARNE ;

end;

end.
