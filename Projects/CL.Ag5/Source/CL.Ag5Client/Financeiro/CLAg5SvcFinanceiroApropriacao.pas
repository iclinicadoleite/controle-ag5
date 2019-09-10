unit CLAg5SvcFinanceiroApropriacao;

interface

uses DBClient ;

const
   TelaProduto    = 1;
   TelaPatrimonio = 2;

  _ST_PLANO_CONTAS_MASK                            = '0.00.00' ; // Mascara do plano de contas

type
    TTipoReceitaDespesa = ( toaCancel, toaReceita, toaDespesa ) ;

    TTipoPlanoAPRD = (tpAtivo, tpPassivo, tpReceitas, tpDespesas );

    TTiposPlanoAPRD = set of TTipoPlanoAPRD ;

    TPlanoAnaliticoSintetico = (pasAnaliticoSintetico, pasAnalitico, pasSintetico );

    TPlanoFilter = ( pfAll, pfSomenteEstoque, pfNaoPermiteEstoque );

    ISvcFinanceiroApropriacaoEdit = interface
    ['{CEBAD5D6-D653-4BBA-A4DB-A6D3BFAB15F3}']
      procedure ExecuteTela(
          const ATableName : string
        ; const ACDS_Item
              , ACDS_Apropriacao: TClientDataSet
        ; const Tela: Integer
        ; const ATiposPlanoAPRD : TTiposPlanoAPRD
        ; const APlanoFilter : TPlanoFilter = pfAll
      );
    end;

    ISvcFinanceiroApropriacaoDefault = interface
    ['{5F619AA2-8C5D-4A76-870C-9878347C6C18}']
     function ForceCC : boolean ;
     function NeedCC( KFIN_PLANOCONTA : string ) : boolean ;
     function AddCentroCustoFromTo( AOrigem : string ; AOrigemKey : string ;
                         ADestino : string ; ADestinoKey : string ;
                         ACDSApropriacao : TClientDataSet ;
                         AIsNeedCC : boolean  ) : boolean ;
     function  AddCentroCustoPadrao( ACDSApropriacao : TClientDataSet ) : boolean ;
    end;

    ISvcFinanceiroMascaraPlanoContas = interface
    ['{99ACED63-449D-4621-B377-794AB2F67821}']
      procedure SetMascara( AMascara : string ) ;
      function GetMascara : string ;
    end;

var
    SvcFinanceiroApropriacaoEdit : ISvcFinanceiroApropriacaoEdit ;
    SvcFinanceiroApropriacaoDefault : ISvcFinanceiroApropriacaoDefault ;
    SvcFinanceiroMascaraPlanoContas : ISvcFinanceiroMascaraPlanoContas ;

implementation

end.

