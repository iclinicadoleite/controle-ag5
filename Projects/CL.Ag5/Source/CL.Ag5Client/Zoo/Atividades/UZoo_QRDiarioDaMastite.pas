unit UZoo_QRDiarioDaMastite;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, UfqrSYS_BaseReport, jpeg, Printers, QRCtrls, QuickRpt, VCL.ExtCtrls,
  UZoo_AtividadesTarefasDatamodule ;

type
  TPrinterOrder = ( poBrinco, poNome, poLote, poTarefa, poProtocolo, poResponsavel ) ;

const
  StrFieldsOrder : array [TPrinterOrder] of string =
     ( 'BRINCOFEMEA', 'NOMEFEMEA', 'LOTE', 'TAREFA', 'PROTOCOLO', 'REPONSAVEL' ) ;
type
  TZoo_QRDiarioDaMastite = class(TfqrSYS_BaseReport)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup: TQRGroup;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
  private
    { Private declarations }
//    FPrinterName : string ;
    Zoo_AtividadesTarefasDatamodule : TZoo_AtividadesTarefasDatamodule ;
  public
    { Public declarations }
    class procedure PrintAte ( ADateTime : TDateTime ; AOrder : TPrinterOrder ; APageBreak : boolean ; APrinterName : string ; APreview : boolean ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
  end;

implementation

{$R *.dfm}

{ TZoo_QRTarefasAExecutar }

constructor TZoo_QRDiarioDaMastite.Create(AOwner: TComponent);
begin
   inherited ;
   Zoo_AtividadesTarefasDatamodule := TZoo_AtividadesTarefasDatamodule.Create ( self ) ;
end;

class procedure TZoo_QRDiarioDaMastite.PrintAte(ADateTime : TDateTime  ; AOrder : TPrinterOrder ; APageBreak : boolean ; APrinterName : string ; APreview : boolean ) ;
var
  SelectedPrinterIndex : integer ;
begin
  with Create ( nil ) do
    try
       QuickRep.DataSet := Zoo_AtividadesTarefasDatamodule.cdsATarefas ;
       Zoo_AtividadesTarefasDatamodule.Ate := ADateTime ;

      //   TPrinterOrder = ( poBrinco, poNome, poLote, poTarefa, poProtocolo, poResponsavel ) ;

       if ( not APageBreak ) or ( AOrder in [ poBrinco, poNome, poTarefa, poProtocolo ] ) then
         begin
           if ( AOrder = poProtocolo ) then
              Zoo_AtividadesTarefasDatamodule.cdsATarefas.IndexFieldNames := 'DATAPROGRAMADA;' + StrFieldsOrder [ poProtocolo ] + ';' + StrFieldsOrder [ poTarefa ]+ ';' + StrFieldsOrder [ poBrinco ]
           else
              Zoo_AtividadesTarefasDatamodule.cdsATarefas.IndexFieldNames := 'DATAPROGRAMADA;' + StrFieldsOrder [ AOrder ] + ';' + StrFieldsOrder [ poBrinco ] ;
           QRGroup.Expression := 'DATAPROGRAMADA'
         end
       else if ( AOrder = poLote ) then
         begin
           Zoo_AtividadesTarefasDatamodule.cdsATarefas.IndexFieldNames := StrFieldsOrder [ poLote ] + ';DATAPROGRAMADA'  + ';' + StrFieldsOrder [ poBrinco ] ;
           QRGroup.Expression := StrFieldsOrder [ poLote ] + '+DATAPROGRAMADA'  ;
         end
       else
         begin   // lote, responsavel
           Zoo_AtividadesTarefasDatamodule.cdsATarefas.IndexFieldNames := StrFieldsOrder [ AOrder ] + ';DATAPROGRAMADA'  + ';' + StrFieldsOrder [ poBrinco ] ;
           QRGroup.Expression := StrFieldsOrder [ AOrder ] ;
         end ;

       QRGroup.Height := 1 ;
       QRGroup.Enabled := APageBreak ;

       QuickRep.ReportTitle := 'Tarefas até ' + FormatDateTime ( 'dd.mm.yyyy', ADateTime ) ;

       SelectedPrinterIndex := Printer.Printers.IndexOf( APrinterName ) ;
       if SelectedPrinterIndex > -1 then
          QuickRep.PrinterSettings.PrinterIndex := SelectedPrinterIndex ;

       if APreview then
          QuickRep.Preview
       else
          QuickRep.Print
    finally
      Free ;
    end;
end;

end.
