unit UZoo_CfgImportExportProtocolosDatamodule;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   Data.FMTBcd, Data.DB, Tc.Data.DB.Helpers, DataSnap.DBClient, Tc.DataSnap.DBClient.Helpers, Data.SqlExpr, Tc.Data.SQLExpr,
  Datasnap.Provider, UdtmSYS_BASE ;

type
  TZoo_CfgImportExportProtocolosDatamodule = class(T_dtmBASE)
    cdsProtocolos: TClientDataSet;
    cdsProtocolosKZOO_PROTOCOLO: TStringField;
    cdsProtocolosKCAD_FAZENDA: TStringField;
    cdsProtocolosCODIGO: TStringField;
    cdsProtocolosNOME: TStringField;
    cdsProtocolosTIPOPROTOCOLO: TIntegerField;
    dspProtocolos: TDataSetProvider;
    sqlProtocolos: TTcSQLDataSet;
    sqlProtocolosKZOO_PROTOCOLO: TStringField;
    sqlProtocolosKCAD_FAZENDA: TStringField;
    sqlProtocolosCODIGO: TStringField;
    sqlProtocolosNOME: TStringField;
    sqlProtocolosTIPOPROTOCOLO: TIntegerField;
    sqlTarefasProt: TTcSQLDataSet;
    sqlTarefasProtKZOO_PROTOCOLO_TAREFA: TStringField;
    sqlTarefasProtKZOO_PROTOCOLO: TStringField;
    sqlTarefasProtKZOO_TAREFA: TStringField;
    sqlTarefasProtNOME: TStringField;
    sqlTarefasProtDIA: TIntegerField;
    sqlTarefasProtVEZES: TIntegerField;
    sqlTarefasProtREPLICAR: TIntegerField;
    sqlTarefasProtATIVO: TStringField;
    dtsSQLEdit: TDataSource;
    cdsTarefasProt: TClientDataSet;
    cdsTarefasProtKZOO_PROTOCOLO_TAREFA: TStringField;
    cdsTarefasProtKZOO_PROTOCOLO: TStringField;
    cdsTarefasProtKZOO_TAREFA: TStringField;
    cdsTarefasProtNOME: TStringField;
    cdsTarefasProtREPLICAR: TIntegerField;
    cdsTarefasProtDIA: TIntegerField;
    cdsTarefasProtVEZES: TIntegerField;
    cdsTarefasProtATIVO: TStringField;
    cdsProtocolosEXPORT: TSmallintField;
    dtsSQLTarefasProt: TDataSource;
    sqlItensProt: TTcSQLDataSet;
    sqlItensProtKZOO_TAREFA_ITEM: TStringField;
    sqlItensProtKZOO_TAREFA: TStringField;
    sqlItensProtITEM: TStringField;
    sqlItensProtQTDE: TIntegerField;
    cdsItensProt: TClientDataSet;
    cdsItensProtKZOO_TAREFA_ITEM: TStringField;
    cdsItensProtKZOO_TAREFA: TStringField;
    cdsItensProtITEM: TStringField;
    cdsItensProtQTDE: TIntegerField;
    cdsTmpProtocolos: TClientDataSet;
    cdsTmpProtocolosIMPORT: TSmallintField;
    cdsTmpProtocolosCODIGO: TStringField;
    cdsTmpProtocolosNOME: TStringField;
    cdsTmpProtocolosTIPOPROTOCOLO: TIntegerField;
    cdsTmpProtocolossqlTarefas: TDataSetField;
    cdsTmpTarefas: TClientDataSet;
    cdsTmpTarefassqlItens: TDataSetField;
    cdsTmpItens: TClientDataSet;
    sqlTarefas: TTcSQLDataSet;
    cdsTarefas: TClientDataSet;
    cdsTarefassqlItens: TDataSetField;
    sqlItens: TTcSQLDataSet;
    sqlItensKZOO_TAREFA_ITEM: TStringField;
    sqlItensKZOO_TAREFA: TStringField;
    sqlItensITEM: TStringField;
    sqlItensQTDE: TIntegerField;
    cdsItens: TClientDataSet;
    cdsItensKZOO_TAREFA_ITEM: TStringField;
    cdsItensKZOO_TAREFA: TStringField;
    cdsItensITEM: TStringField;
    cdsItensQTDE: TIntegerField;
    dspTarefas: TDataSetProvider;
    cdsTmpTarefasProt: TClientDataSet;
    cdsTmpTarefasProtNOME: TStringField;
    cdsTmpTarefasProtREPLICAR: TIntegerField;
    cdsTmpTarefasProtDIA: TIntegerField;
    cdsTmpTarefasProtVEZES: TIntegerField;
    cdsTmpTarefasProtATIVO: TStringField;
    cdsTmpTarefasProtsqlItens: TDataSetField;
    cdsTmpItensProt: TClientDataSet;
    cdsTmpItensProtITEM: TStringField;
    cdsTmpItensProtQTDE: TIntegerField;
    cdsProtocolosTarefas: TClientDataSet;
    cdsProtocolosTarefasProtocolos: TDataSetField;
    cdsProtocolosTarefasTarefas: TDataSetField;
    cdsTmpTarefasIMPORT: TSmallintField;
    cdsTarefasEXPORT: TSmallintField;
    sqlTarefasKZOO_TAREFA: TStringField;
    sqlTarefasTIPOTAREFA: TIntegerField;
    sqlTarefasCODIGO: TStringField;
    sqlTarefasNOME: TStringField;
    sqlTarefasDESCRICAO: TMemoField;
    sqlTarefasATIVO: TStringField;
    sqlTarefasDESCARTECARNE: TIntegerField;
    sqlTarefasDESCARTELEITE: TIntegerField;
    sqlTarefasINTERNAL: TStringField;
    cdsTarefasKZOO_TAREFA: TStringField;
    cdsTarefasTIPOTAREFA: TIntegerField;
    cdsTarefasCODIGO: TStringField;
    cdsTarefasNOME: TStringField;
    cdsTarefasDESCRICAO: TMemoField;
    cdsTarefasATIVO: TStringField;
    cdsTarefasDESCARTECARNE: TIntegerField;
    cdsTarefasDESCARTELEITE: TIntegerField;
    cdsTarefasINTERNAL: TStringField;
    cdsTmpTarefasTIPOTAREFA: TIntegerField;
    cdsTmpTarefasCODIGO: TStringField;
    cdsTmpTarefasNOME: TStringField;
    cdsTmpTarefasDESCRICAO: TMemoField;
    cdsTmpTarefasATIVO: TStringField;
    cdsTmpTarefasDESCARTECARNE: TIntegerField;
    cdsTmpTarefasDESCARTELEITE: TIntegerField;
    cdsTmpTarefasINTERNAL: TStringField;
    sqlProtocolosDESCRICAO: TMemoField;
    sqlProtocolosINTERNAL: TStringField;
    sqlProtocolosKDEF_PROTOCOLO: TStringField;
    sqlTarefasProtCODIGO: TStringField;
    sqlTarefasProtDESCRICAO: TMemoField;
    sqlTarefasProtDESCARTECARNE: TIntegerField;
    sqlTarefasProtDESCARTELEITE: TIntegerField;
    sqlTarefasProtINTERNAL: TStringField;
    sqlTarefasProtKDEF_TAREFA: TStringField;
    cdsProtocolosDESCRICAO: TMemoField;
    cdsProtocolosINTERNAL: TStringField;
    cdsProtocolosKDEF_PROTOCOLO: TStringField;
    cdsProtocolossqlTarefasProt: TDataSetField;
    dtsSQLTarefas: TDataSource;
    cdsTarefasProtCODIGO: TStringField;
    cdsTarefasProtDESCRICAO: TMemoField;
    cdsTarefasProtDESCARTECARNE: TIntegerField;
    cdsTarefasProtDESCARTELEITE: TIntegerField;
    cdsTarefasProtINTERNAL: TStringField;
    cdsTarefasProtKDEF_TAREFA: TStringField;
    cdsTarefasProtsqlItensProt: TDataSetField;
    sqlTarefasKDEF_TAREFA: TStringField;
    sqlItensKDEF_TAREFA_ITEM: TStringField;
    cdsItensKDEF_TAREFA_ITEM: TStringField;
    cdsTarefasKDEF_TAREFA: TStringField;
    sqlItensProtKDEF_TAREFA_ITEM: TStringField;
    cdsItensProtKDEF_TAREFA_ITEM: TStringField;
    cdsTmpProtocolosKDEF_PROTOCOLO: TStringField;
    cdsTmpTarefasProtCODIGO: TStringField;
    cdsTmpTarefasProtDESCRICAO: TMemoField;
    cdsTmpTarefasProtDESCARTECARNE: TIntegerField;
    cdsTmpTarefasProtDESCARTELEITE: TIntegerField;
    cdsTmpTarefasProtINTERNAL: TStringField;
    cdsTmpTarefasProtKDEF_TAREFA: TStringField;
    cdsTmpTarefasProtTIPOTAREFA: TIntegerField;
    sqlTarefasProtTIPOTAREFA: TIntegerField;
    cdsTarefasProtTIPOTAREFA: TIntegerField;
    cdsTmpTarefasKDEF_TAREFA: TStringField;
    cdsTmpItensProtKDEF_TAREFA_ITEM: TStringField;
    cdsTmpItensKDEF_TAREFA_ITEM: TStringField;
    cdsTmpItensITEM: TStringField;
    cdsTmpItensQTDE: TIntegerField;
    cdsTmpProtocolosEXISTS: TSmallintField;
    cdsTmpTarefasEXISTS: TSmallintField;
    cdsTmpTarefasProtEXISTS: TSmallintField;
    cdsRelacaoProtocoloTarefa: TClientDataSet;
    dspRelacaoProtocoloTarefa: TDataSetProvider;
    sqlRelacaoProtocoloTarefa: TTcSQLDataSet;
    sqlRelacaoProtocoloTarefaKZOO_PROTOCOLO_TAREFA: TStringField;
    sqlRelacaoProtocoloTarefaKZOO_PROTOCOLO: TStringField;
    sqlRelacaoProtocoloTarefaKZOO_TAREFA: TStringField;
    sqlRelacaoProtocoloTarefaDIA: TIntegerField;
    sqlRelacaoProtocoloTarefaVEZES: TIntegerField;
    sqlRelacaoProtocoloTarefaREPLICAR: TIntegerField;
    cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO_TAREFA: TStringField;
    cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO: TStringField;
    cdsRelacaoProtocoloTarefaKZOO_TAREFA: TStringField;
    cdsRelacaoProtocoloTarefaDIA: TIntegerField;
    cdsRelacaoProtocoloTarefaVEZES: TIntegerField;
    cdsRelacaoProtocoloTarefaREPLICAR: TIntegerField;
    sqlTarefasKCAD_FAZENDA: TStringField;
    cdsTarefasKCAD_FAZENDA: TStringField;
    sqlTarefasProtINTERVALO: TIntegerField;
    sqlTarefasProtOBS: TMemoField;
    cdsTarefasProtINTERVALO: TIntegerField;
    cdsTarefasProtOBS: TMemoField;
    cdsTmpTarefasProtINTERVALO: TIntegerField;
    cdsTmpTarefasProtOBS: TMemoField;
    sqlRelacaoProtocoloTarefaINTERVALO: TIntegerField;
    sqlRelacaoProtocoloTarefaOBS: TMemoField;
    cdsRelacaoProtocoloTarefaINTERVALO: TIntegerField;
    cdsRelacaoProtocoloTarefaOBS: TMemoField;
    cdsTmpTarefasProtKZOO_TAREFA: TStringField;
    procedure cdsEditNewRecord(DataSet: TDataSet);
    procedure cdsProtocolosBeforeOpen(DataSet: TDataSet);
    procedure cdsTarefasBeforeOpen(DataSet: TDataSet);
    procedure cdsProtocolosCalcFields(DataSet: TDataSet);
    procedure cdsTarefasCalcFields(DataSet: TDataSet);
    procedure cdsTmpProtocolosCalcFields(DataSet: TDataSet);
    procedure cdsTmpTarefasCalcFields(DataSet: TDataSet);
    procedure cdsProtocolosEXPORTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTarefasEXPORTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTmpProtocolosIMPORTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTmpTarefasIMPORTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure ExportProtocols ;
    procedure ExportTarefas ;

    procedure ImportProtocolos ;
    procedure ImportTarefas ;
    procedure ImportRelacaoProtocolosTarefas ;
  public
    { Public declarations }
    procedure OpenTables ; override ;
    procedure OpenExportTables ;
    procedure OpenImportTables( AFileName : string ) ;
    procedure ExportAllProtocolos ( AExportAll : boolean ) ;
    procedure ExportAllTarefas ( AExportAll : boolean ) ;
    procedure ImportAllProtocolos ( AImportAll : boolean ) ;
    procedure ImportAllTarefas ( AImportAll : boolean ) ;

    procedure InvertExportProtocolos ;
    procedure InvertExportTarefas ;
    procedure InvertImportProtocolos ;
    procedure InvertImportTarefas ;

    procedure DoExport ( AFileName : string ) ;
    procedure DoImport ;

  end;

implementation

uses CDSSuppl, Exceptions;

{$R *.dfm}

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsProtocolosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  cdsProtocolos.params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;


procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTarefasBeforeOpen(
  DataSet: TDataSet);
begin
  cdsTarefas.params.ParamByName( 'KCAD_FAZENDA' ).Value := LoggedUser.DomainID ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsProtocolosCalcFields(
  DataSet: TDataSet);
begin
   if ( DataSet.State in [dsInternalCalc] ) and ( cdsProtocolosEXPORT.IsNull )  then
    cdsProtocolosEXPORT.asInteger := 0 ;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsProtocolosEXPORTGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsProtocolos.IsEmpty then
     exit ;

   if DisplayText then
     begin
        if Sender.asInteger = 1 then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTarefasCalcFields(
  DataSet: TDataSet);
begin
   if ( DataSet.State in [dsInternalCalc] ) and ( cdsTarefasEXPORT.IsNull )  then
    cdsTarefasEXPORT.asInteger := 0 ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTarefasEXPORTGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if cdsTarefas.IsEmpty then
     exit ;

   if DisplayText then
     begin
        if Sender.asInteger = 1 then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTmpProtocolosCalcFields(
  DataSet: TDataSet);
begin
   if ( DataSet.State in [dsInternalCalc] ) and ( cdsTmpProtocolosIMPORT.IsNull )  then
    cdsTmpProtocolosIMPORT.asInteger := 0 ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTmpProtocolosIMPORTGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if cdsTmpProtocolos.isEmpty then
     exit ;

   if DisplayText then
     begin
        if Sender.asInteger = 1 then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTmpTarefasCalcFields(
  DataSet: TDataSet);
begin
   if ( DataSet.State in [dsInternalCalc] ) and ( cdsTmpTarefasIMPORT.IsNull )  then
    cdsTmpTarefasIMPORT.asInteger := 0 ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.cdsTmpTarefasIMPORTGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if cdsTmpTarefas.isEmpty then
     Exit ;

   if DisplayText then
     begin
        if Sender.asInteger = 1 then
           Text := 'Sim'
        else
           Text := 'Não'
     end
   else
     Text := Sender.asString
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.DoExport(AFileName: string);
begin

   TCDSSuppl.CreateDataSet( cdsProtocolosTarefas ) ;
   cdsProtocolosTarefas.Append ;
   ExportProtocols ;
   ExportTarefas ;
   cdsProtocolosTarefas.Post ;
   cdsProtocolosTarefas.SaveToFile( AFileName );
   cdsProtocolosTarefas.EmptyDataSet ;
   cdsProtocolosTarefas.Close ;

   cdsProtocolos.Close ;
   cdsTarefas.Close ;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.DoImport;
begin
    TCDSSuppl.CreateDataSet( cdsTarefas ) ;
    TCDSSuppl.CreateDataSet( cdsProtocolos ) ;
    TCDSSuppl.CreateDataSet( cdsRelacaoProtocoloTarefa );

    ImportTarefas ;
    ImportProtocolos ;
    TCDSSuppl.ApplyUpdates ( cdsTarefas ) ;
    TCDSSuppl.ApplyUpdates ( cdsProtocolos ) ;
    ImportRelacaoProtocolosTarefas ;
    TCDSSuppl.ApplyUpdates ( cdsRelacaoProtocoloTarefa ) ;

    cdsTarefas.Close ;
    cdsProtocolos.Close ;
    cdsRelacaoProtocoloTarefa.Close ;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ExportAllProtocolos( AExportAll: boolean);
var
  checked : integer ;
begin
  if AExportAll then
     checked := 1
  else
     checked := 0 ;

  with   cdsProtocolos do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsProtocolos.Edit ;
           cdsProtocolosEXPORT.asInteger := checked ;
           cdsProtocolos.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ExportAllTarefas(   AExportAll: boolean);
var
  checked : integer ;
begin
  if AExportAll then
     checked := 1
  else
     checked := 0 ;

  with   cdsTarefas do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsTarefas.Edit ;
           cdsTarefasEXPORT.asInteger := checked ;
           cdsTarefas.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ExportProtocols;

   procedure ExportItensTarefasProt ;
   begin

    with cdsItensProt do
      begin
        DisableControls ;
        First ;
        while not eof do
          begin
            cdsTmpItensProt.Append ;
            cdsTmpItensProtKDEF_TAREFA_ITEM.AsString := cdsItensProtKDEF_TAREFA_ITEM.AsString ;
            cdsTmpItensProtITEM.AsString := cdsItensProtITEM.AsString ;
            cdsTmpItensProtQTDE.AsString := cdsItensProtQTDE.AsString ;
            cdsTmpItensProt.Post ;
            Next ;
          end;
        First ;
        enableControls ;
      end;

   end;

   procedure ExportTarefasProtocolo ;
   begin
    with cdsTarefasProt do
      begin
        DisableControls ;
        First ;
        while not eof do
          begin
            cdsTmpTarefasProt.Append ;
            cdsTmpTarefasProtTIPOTAREFA.AsInteger    := cdsTarefasProtTIPOTAREFA.AsInteger ;
            cdsTmpTarefasProtCODIGO.AsString         := cdsTarefasProtCODIGO.AsString ;
            cdsTmpTarefasProtNOME.AsString           := cdsTarefasProtNOME.AsString ;
            cdsTmpTarefasProtATIVO.AsString          := cdsTarefasProtATIVO.AsString ;
            cdsTmpTarefasProtDESCRICAO.AsString      := cdsTarefasProtDESCRICAO.AsString ;
            cdsTmpTarefasProtDESCARTECARNE.AsInteger := cdsTarefasProtDESCARTECARNE.AsInteger ;
            cdsTmpTarefasProtDESCARTELEITE.AsInteger := cdsTarefasProtDESCARTELEITE.AsInteger  ;
            cdsTmpTarefasProtINTERNAL.AsString       := cdsTarefasProtINTERNAL.AsString ;
            cdsTmpTarefasProtDIA.asInteger           := cdsTarefasProtDIA.asInteger             ;
            cdsTmpTarefasProtVEZES.asInteger         := cdsTarefasProtVEZES.asInteger           ;
            cdsTmpTarefasProtREPLICAR.asInteger      := cdsTarefasProtREPLICAR.asInteger    ;
            cdsTmpTarefasProtINTERVALO.asInteger     := cdsTarefasProtINTERVALO.asInteger   ;
            cdsTmpTarefasProtOBS.asString            := cdsTarefasProtOBS.asString          ;

            cdsTmpTarefasProtKDEF_TAREFA             := cdsTarefasProtKDEF_TAREFA ;
            ExportItensTarefasProt ;
            cdsTmpTarefasProt.Post ;
            next ;
          end;
        First ;
        enableControls ;
      end;

   end;

begin
  with cdsProtocolos do
    begin
      DisableControls ;
      First ;
      while not eof do
        begin
          if cdsProtocolosEXPORT.asInteger = 1 then
             begin
                cdsTmpProtocolos.Append ;
                cdsTmpProtocolosKDEF_PROTOCOLO.AsString := cdsProtocolosKDEF_PROTOCOLO.AsString ;
                cdsTmpProtocolosCODIGO.AsString         := cdsProtocolosCODIGO.AsString ;
                cdsTmpProtocolosNOME.AsString           := cdsProtocolosNOME.AsString ;
                cdsTmpProtocolosTIPOPROTOCOLO.AsInteger := cdsProtocolosTIPOPROTOCOLO.AsInteger ;
                ExportTarefasProtocolo ;
                cdsTmpProtocolos.Post ;
             end;
          next ;
        end;
      First ;
      enableControls ;
    end;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ExportTarefas;

  procedure ExportItensTarefas ;
  begin
    with cdsItens do
      begin
        First ;
        while not eof do
          begin
            cdsTmpItens.Append ;
            cdsTmpItensKDEF_TAREFA_ITEM.AsString := cdsItensKDEF_TAREFA_ITEM.AsString ;
            cdsTmpItensITEM.AsString := cdsItensITEM.AsString ;
            cdsTmpItensQTDE.AsString := cdsItensQTDE.AsString ;
            cdsTmpItens.Post ;
            Next ;
          end;
      end
  end;

begin

  with cdsTarefas do
    begin
      DisableControls ;
      First ;
      while not eof do
        begin
          if cdsTarefasEXPORT.AsInteger = 1 then
             begin
                cdsTmpTarefas.Append ;
                cdsTmpTarefasTIPOTAREFA.AsInteger    := cdsTarefasTIPOTAREFA.AsInteger ;
                cdsTmpTarefasCODIGO.AsString         := cdsTarefasCODIGO.AsString ;   // tarefa
                cdsTmpTarefasNOME.AsString           := cdsTarefasNOME.AsString ;     // descricao
                cdsTmpTarefasATIVO.AsString          := cdsTarefasATIVO.AsString ;
                if cdsTarefasDESCRICAO.AsString <> '' then
                   cdsTmpTarefasDESCRICAO.AsString      := cdsTarefasDESCRICAO.AsString ; // obs
                cdsTmpTarefasDESCARTECARNE.AsInteger := cdsTarefasDESCARTECARNE.AsInteger ;
                cdsTmpTarefasDESCARTELEITE.AsInteger := cdsTarefasDESCARTELEITE.AsInteger  ;
                cdsTmpTarefasINTERNAL.AsString       := cdsTarefasINTERNAL.AsString ;
                cdsTmpTarefasKDEF_TAREFA             := cdsTarefasKDEF_TAREFA ;
                ExportItensTarefas ;
                cdsTmpTarefas.Post ;
             end;
          next ;
        end;
      First ;
      enableControls ;
    end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ImportAllProtocolos(   AImportAll: boolean);
var
  checked : integer ;
begin
  if AImportAll then
     checked := 1
  else
     checked := 0 ;

  with   cdsTmpProtocolos do
    begin
      DisableControls ;
      First ;
      while not eof do
         begin
           cdsTmpProtocolos.Edit ;
           cdsTmpProtocolosIMPORT.asInteger := checked ;
           cdsTmpProtocolos.Post ;
           next ;
         end;
      First ;
      EnableControls ;
      end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ImportAllTarefas(   AImportAll: boolean);
var
  checked : integer ;
begin
  if AImportAll then
     checked := 1
  else
     checked := 0 ;

  with   cdsTmpTarefas do
    begin
      DisableControls ;
      First ;

      while not eof do
         begin
           cdsTmpTarefas.Edit ;
           cdsTmpTarefasIMPORT.asInteger := checked ;
           cdsTmpTarefas.Post ;
           next ;
         end;
      First ;
      EnableControls ;
    end;
end;


procedure TZoo_CfgImportExportProtocolosDatamodule.ImportProtocolos;

  procedure ImportItensTarefas ;
  begin
    with cdsTmpItensProt do
      begin
        First ;
        while not eof do
          begin
            cdsItens.Append ;
            GetKey ( cdsItensKZOO_TAREFA_ITEM ) ;
            cdsItensKZOO_TAREFA.AsString       := cdsTarefasKZOO_TAREFA.asString ;
            cdsItensKDEF_TAREFA_ITEM.AsString  := cdsTmpItensProtKDEF_TAREFA_ITEM.AsString ;
            cdsItensITEM.AsString              := cdsTmpItensProtITEM.AsString ;
            cdsItensQTDE.AsString              := cdsTmpItensProtQTDE.AsString ;
            cdsItens.Post ;
            Next ;
          end;
      end
  end;

  procedure ImportTarefasProt ;
  begin
    with cdsTmpTarefasProt do
      begin
        DisableControls ;
        First ;
        while not eof do
          begin
            if    ( cdsTmpTarefasProtEXISTS.asInteger <> 1 )
              and (not cdsTarefas.Locate ( 'CODIGO', cdsTmpTarefasProtCODIGO.AsString, [] )) then
               begin
                  cdsTarefas.Append ;
                  GetKey ( cdsTarefasKZOO_TAREFA );
                  cdsTarefasKCAD_FAZENDA.AsString    := LoggedUser.DomainID ;
                  cdsTarefasTIPOTAREFA.AsInteger     := cdsTmpTarefasProtTIPOTAREFA.AsInteger    ;
                  cdsTarefasCODIGO.AsString          := cdsTmpTarefasProtCODIGO.AsString         ;
                  cdsTarefasNOME.AsString            := cdsTmpTarefasProtNOME.AsString           ;
                  cdsTarefasATIVO.AsString           := cdsTmpTarefasProtATIVO.AsString          ;
                  cdsTarefasDESCRICAO.AsString       := cdsTmpTarefasProtDESCRICAO.AsString      ;
                  cdsTarefasDESCARTECARNE.AsInteger  := cdsTmpTarefasProtDESCARTECARNE.AsInteger ;
                  cdsTarefasDESCARTELEITE.AsInteger  := cdsTmpTarefasProtDESCARTELEITE.AsInteger ;
                  cdsTarefasINTERNAL.AsString        := cdsTmpTarefasProtINTERNAL.AsString       ;
                  cdsTarefasKDEF_TAREFA              := cdsTmpTarefasProtKDEF_TAREFA             ;
                  ImportItensTarefas ;
                  cdsTarefas.Post ;
               end;
            next ;
          end;
        First ;
        enableControls ;
      end;
  end ;
begin

  with cdsTmpProtocolos do
    begin
      DisableControls ;
      First ;
      while not eof do
        begin
          if  ( cdsTmpProtocolosIMPORT.asInteger = 1 )
          and ( cdsTmpProtocolosEXISTS.asInteger <> 1 ) then
             begin
                cdsProtocolos.Append ;
                GetKey ( cdsProtocolosKZOO_PROTOCOLO ) ;
                cdsProtocolosKCAD_FAZENDA.asString     := LoggedUser.DomainID ;
                cdsProtocolosKDEF_PROTOCOLO.AsString   := cdsTmpProtocolosKDEF_PROTOCOLO.AsString ;
                cdsProtocolosCODIGO.AsString           := cdsTmpProtocolosCODIGO.AsString         ;
                cdsProtocolosNOME.AsString             := cdsTmpProtocolosNOME.AsString           ;
                cdsProtocolosTIPOPROTOCOLO.AsInteger   := cdsTmpProtocolosTIPOPROTOCOLO.AsInteger ;
                cdsProtocolosINTERNAL.AsString         := 'F' ;
                ImportTarefasProt ;
                cdsProtocolos.Post ;
             end;
          next ;
        end;
      First ;
      enableControls ;
    end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ImportRelacaoProtocolosTarefas;

  procedure ImportRelacao ;
  var
    KTarefa : string ;
  begin
    with cdsTmpTarefasProt do
      begin
        First ;
        while not eof do
          begin
             KTarefa := '' ;

             // se a tarefa ja existe no banco... usa ela...
             if cdsTmpTarefasProtKZOO_TAREFA.asString <> '' then
                KTarefa := cdsTmpTarefasProtKZOO_TAREFA.asString

             // se não existe, checa se foi importada
             else if cdsTarefas.Locate ( 'CODIGO', cdsTmpTarefasProtCODIGO.AsString, [] ) then
                KTarefa := cdsTarefasKZOO_TAREFA.asString ;

             // se existe e achar o protocolo, importa...
             if ( KTarefa <> '' ) and ( cdsProtocolos.Locate ( 'CODIGO', cdsTmpProtocolosCODIGO.AsString, [] ) ) then
               begin

                 cdsRelacaoProtocoloTarefa.Append ;
                 GetKey ( cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO_TAREFA ) ;
                 cdsRelacaoProtocoloTarefaKZOO_PROTOCOLO.asString          :=  cdsProtocolosKZOO_PROTOCOLO.asString    ;
                 cdsRelacaoProtocoloTarefaKZOO_TAREFA.asString             :=  KTarefa ;
                 cdsRelacaoProtocoloTarefaDIA.asInteger                    :=  cdsTmpTarefasProtDIA.asInteger             ;
                 cdsRelacaoProtocoloTarefaVEZES.asInteger                  :=  cdsTmpTarefasProtVEZES.asInteger           ;
                 cdsRelacaoProtocoloTarefaREPLICAR.asInteger               :=  cdsTmpTarefasProtREPLICAR.asInteger    ;
                 cdsRelacaoProtocoloTarefaINTERVALO.asInteger              :=  cdsTmpTarefasProtINTERVALO.asInteger   ;
                 cdsRelacaoProtocoloTarefaOBS.asString                     :=  cdsTmpTarefasProtOBS.asString          ;
                 cdsRelacaoProtocoloTarefa.Post ;
               end;
             next ;
          end;
      end;
  end ;
begin

  with cdsTmpProtocolos do
    begin
      DisableControls ;
      First ;
      while not eof do
        begin
          if cdsTmpProtocolosEXISTS.asInteger <> 1 then
             ImportRelacao ;
          next ;
        end;
      First ;
      enableControls ;
    end;

    TCDSSuppl.ApplyUpdates (  cdsRelacaoProtocoloTarefa ) ;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.ImportTarefas;

  procedure ImportItensTarefas ;
  begin
    with cdsTmpItens do
      begin
        First ;
        while not eof do
          begin
            cdsItens.Append ;
            GetKey ( cdsItensKZOO_TAREFA_ITEM ) ;
            cdsItensKZOO_TAREFA.AsString       := cdsTarefasKZOO_TAREFA.asString ;
            cdsItensKDEF_TAREFA_ITEM.AsString  := cdsTmpItensKDEF_TAREFA_ITEM.AsString ;
            cdsItensITEM.AsString              := cdsTmpItensITEM.AsString ;
            cdsItensQTDE.AsString              := cdsTmpItensQTDE.AsString ;
            cdsItens.Post ;
            Next ;
          end;
      end
  end;

begin

  with cdsTmpTarefas do
    begin
      DisableControls ;
      First ;
      while not eof do
        begin
          if    ( cdsTmpTarefasIMPORT.AsInteger = 1 )
            and ( cdsTmpTarefasEXISTS.AsInteger <> 1 ) then
             begin
                cdsTarefas.Append ;
                GetKey ( cdsTarefasKZOO_TAREFA ) ;
                cdsTarefasKCAD_FAZENDA.AsString    := LoggedUser.DomainID ;
                cdsTarefasTIPOTAREFA.AsInteger     := cdsTmpTarefasTIPOTAREFA.AsInteger    ;
                cdsTarefasCODIGO.AsString          := cdsTmpTarefasCODIGO.AsString         ;   //tarefa
                cdsTarefasNOME.AsString            := cdsTmpTarefasNOME.AsString           ;   //descricao
                cdsTarefasATIVO.AsString           := cdsTmpTarefasATIVO.AsString          ;
                if cdsTmpTarefasDESCRICAO.AsString <> '' then
                   cdsTarefasDESCRICAO.AsString       := cdsTmpTarefasDESCRICAO.AsString      ; // obs
                cdsTarefasDESCARTECARNE.AsInteger  := cdsTmpTarefasDESCARTECARNE.AsInteger ;
                cdsTarefasDESCARTELEITE.AsInteger  := cdsTmpTarefasDESCARTELEITE.AsInteger ;
                cdsTarefasINTERNAL.AsString        := cdsTmpTarefasINTERNAL.AsString       ;
                cdsTarefasKDEF_TAREFA              := cdsTmpTarefasKDEF_TAREFA             ;
                ImportItensTarefas ;
                cdsTarefas.Post ;
             end;
          next ;
        end;
      First ;
      enableControls ;
    end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.InvertExportProtocolos ;
begin
    cdsProtocolos.Edit ;
    if cdsProtocolosEXPORT.asInteger = 0 then
      cdsProtocolosEXPORT.asInteger := 1
    else
      cdsProtocolosEXPORT.asInteger := 0 ;
    cdsProtocolos.Post ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.InvertExportTarefas ;
begin
    cdsTarefas.Edit ;
    if cdsTarefasEXPORT.asInteger = 0 then
      cdsTarefasEXPORT.asInteger := 1
    else
      cdsTarefasEXPORT.asInteger := 0 ;
    cdsTarefas.Post ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.InvertImportProtocolos ;
begin
    cdsTmpProtocolos.Edit ;
    if cdsTmpProtocolosIMPORT.asInteger = 0 then
      cdsTmpProtocolosIMPORT.asInteger := 1
    else
      cdsTmpProtocolosIMPORT.asInteger := 0 ;
    cdsTmpProtocolos.Post ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.InvertImportTarefas ;
begin
    cdsTmpTarefas.Edit ;
    if cdsTmpTarefasIMPORT.asInteger = 0 then
      cdsTmpTarefasIMPORT.asInteger := 1
    else
      cdsTmpTarefasIMPORT.asInteger := 0 ;
    cdsTmpTarefas.Post ;
end;


procedure TZoo_CfgImportExportProtocolosDatamodule.OpenExportTables;
begin
  if cdsProtocolos.Active then
    cdsProtocolos.Close ;

  if cdsTarefas.Active then
    cdsTarefas.Close ;

  TCDSSuppl.Open (  cdsProtocolos ) ;
  TCDSSuppl.Open (  cdsTarefas )  ;
end;

procedure TZoo_CfgImportExportProtocolosDatamodule.OpenImportTables( AFileName: string ) ;
const
  _SELECT_CODIGO_PROTOCOLO =
    'SELECT CODIGO FROM ZOO_PROTOCOLOS WHERE KCAD_FAZENDA = :KCAD_FAZENDA' ;

  _SELECT_CODIGO_TAREFA =
    'SELECT KZOO_TAREFA, CODIGO FROM ZOO_TAREFAS WHERE KCAD_FAZENDA = :KCAD_FAZENDA' ;

var
  cdsProtExists : TClientDataSet ;
  cdsTarefaExists : TClientDataSet ;
  p : TParams ;

  procedure CheckProtocoloExists ;
      procedure CheckTarefasProt ;
      begin
        with cdsTmpTarefasProt do
           begin
              while not eof do
                 begin
                    if cdsTarefaExists.Locate ( 'CODIGO', cdsTmpTarefasProtCODIGO.asString, [] )  then
                      begin
                           Edit ;
                           cdsTmpTarefasProtEXISTS.AsInteger := 1 ;
                           cdsTmpTarefasProtKZOO_TAREFA.asString := cdsTarefaExists.FieldByName ( 'KZOO_TAREFA' ).asString  ;
                           Post ;
                      end;
                    next ;
                 end;
           end ;
      end ;
  begin

      DBResources['ZOOTECNICO'].populateClientDataSet ( cdsProtExists, _SELECT_CODIGO_PROTOCOLO, p ) ;

      with cdsTmpProtocolos do
        begin
          First ;
          while not eof  do
             begin
               if cdsProtExists.Locate( 'CODIGO', cdsTmpProtocolosCODIGO.AsString, [] ) then
                 begin
                    Edit ;
                    cdsTmpProtocolosEXISTS.AsInteger := 1 ;
                    Post ;
                 end
               else
                 CheckTarefasProt ;
               next ;
             end;
          First ;
        end;
        FreeAndNil ( cdsProtExists ) ;
  end;

  procedure CheckTarefaExists ;
  begin

      with cdsTmpTarefas do
        begin
          First ;
          while not eof  do
             begin
               if cdsTarefaExists.Locate( 'CODIGO', cdsTmpTarefasCODIGO.AsString, [] ) then
                 begin
                    Edit ;
                    cdsTmpTarefasEXISTS.AsInteger := 1 ;
                    Post ;
                 end;
               next ;
             end;
          First ;
        end;
  end;

begin
  cdsProtocolosTarefas.LoadFromFile( AFileName );

  cdsProtExists := nil ;
  cdsTarefaExists := nil ;

  p := TParams.Create ;
  p.CreateParam( ftString, 'KCAD_FAZENDA', ptInput ).AsString := LoggedUser.DomainID ;

  DBResources['ZOOTECNICO'].populateClientDataSet ( cdsTarefaExists, _SELECT_CODIGO_TAREFA, p ) ;

  cdsTmpProtocolos.DisableControls ;
  cdsTmpTarefas.DisableControls ;
  try
     CheckProtocoloExists ;
     CheckTarefaExists ;
  finally
      p.Free ;
      cdsTmpTarefas.EnableControls ;
      cdsTmpProtocolos.EnableControls ;
      if Assigned ( cdsProtExists ) then
        cdsProtExists.Free ;
      if Assigned ( cdsTarefaExists ) then
        cdsTarefaExists.Free ;
  end;

end;

procedure TZoo_CfgImportExportProtocolosDatamodule.OpenTables;
begin
  inherited;
  //
end;


procedure TZoo_CfgImportExportProtocolosDatamodule.cdsEditNewRecord(DataSet: TDataSet);
begin
  inherited;
  self.InitializeKeys ;
end;


end.
