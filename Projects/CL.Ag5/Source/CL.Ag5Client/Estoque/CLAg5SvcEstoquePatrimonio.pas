unit CLAg5SvcEstoquePatrimonio;

interface

type

    TPatrimonioInfo = record
      KCAD_PATRIMONIO : String;
      Codigo          : String;
      Descricao       : String;
      DataCompra      : TDateTime;
      Unidade         : String;
      Valor           : Double;
      KFin_PlanoConta : String;
      DescrPlanoConta : String;
      KFin_Categoria  : String;
      DescrCategoria  : String;
    end;

    ISvcEstoquePatrimonioCadastro = interface
    ['{3CE74269-1B4B-465D-A8E8-14F1DD0C80E5}']
      function Execute : string ;
      procedure NovoCadastro( var APatrimonioInfo : TPatrimonioInfo ) ;
    end;

var
    SvcEstoquePatrimonioCadastro : ISvcEstoquePatrimonioCadastro ;

implementation

end.
