unit UZoo_EditLinhagemFrame;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
   VCL.StdCtrls, CheckLst, VCL.Buttons, Tc.VCL.FloatPanel, VCL.ExtCtrls, VCL.DBCtrls,
  VCL.Mask, JvExMask, JvToolEdit, JvDBControls,
  UZoo_EditLinhagemDatamodule, Data.DB, Tc.Data.DB.Helpers,
  Tc.VCL.Controls.GDIButton,
  Wrappers ;

type
  TZoo_EditLinhagemFrame = class(TForm)
    PanelFooter: TPanel;
    FloatEditorOKButton: TTcGDIButton;
    FloatEditorCancelButton: TTcGDIButton;
    TcMPFloatingPanel1: TTcCaptionedPanel;
    Label49: TLabel;
    Label50: TLabel;
    edPai: TJvDBComboEdit;
    edMae: TJvDBComboEdit;
    SpeedButton7: TTcGDIButton;
    SpeedButton8: TTcGDIButton;
    Label1: TLabel;
    PanelMain: TPanel;
    dtsLinhagem: TDataSource;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    dbxGrauSangue: TDBComboBox;
    dbEdtComposicaoRaca: TJvDBComboEdit;
    DBText1: TDBText;
    dtsAnimal: TDataSource;
    Shape1: TShape;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FloatEditorOKButtonClick(Sender: TObject);
    procedure edPaiButtonClick(Sender: TObject);
    procedure edMaeButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaButtonClick(Sender: TObject);
    procedure dbEdtComposicaoRacaKeyPress(Sender: TObject; var Key: Char);
    procedure dbxGrauSangueKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Zoo_EditLinhagemDatamodule : TZoo_EditLinhagemDatamodule ;
    procedure SearchPai ( TextToSearch : string);
    procedure SearchMae ( TextToSearch : string);
    procedure ValidateGenealogy ;
  public
    { Public declarations }
    class procedure Execute ( AX, AY : integer ; AKZOO_ANIMAL : string ) ;
    constructor Create ( AOwner : TComponent ) ; override ;
    procedure OpenTables ( AKZOO_ANIMAL : string ) ;
  end;

implementation

uses Tc.VCL.ControlPopuper, SearchsZootecnico ;

{$R *.dfm}

constructor TZoo_EditLinhagemFrame.Create(AOwner: TComponent);
begin
   inherited ;
   Zoo_EditLinhagemDatamodule := TZoo_EditLinhagemDatamodule.Create ( self ) ;
   dtsAnimal.DataSet := Zoo_EditLinhagemDatamodule.cdsAnimal ;
   dtsLinhagem.DataSet := Zoo_EditLinhagemDatamodule.cdsLinhagem ;

   Zoo_EditLinhagemDatamodule.GrauDeSangue.GetGrausSangue ( dbxGrauSangue.Items ) ;

  with PanelMain do
    begin
    BevelInner := bvLowered ;
    BevelOuter := bvRaised ;
    BorderWidth := 0 ;
    end;

end;

procedure TZoo_EditLinhagemFrame.dbEdtComposicaoRacaButtonClick(
  Sender: TObject);
begin
  Zoo_EditLinhagemDatamodule.UpdateRacasGrauSangue ;
  if Zoo_EditLinhagemDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
     Zoo_EditLinhagemDatamodule.SetComposicaoRacas ;
end;

procedure TZoo_EditLinhagemFrame.dbEdtComposicaoRacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet (  Key, [#32, 'A'..'Z', 'a'..'z'] ) then
   begin
    Key := #0 ;
    Zoo_EditLinhagemDatamodule.UpdateRacasGrauSangue ;
    if Zoo_EditLinhagemDatamodule.GrauDeSangue.PopupListaRacas ( TJvDBComboEdit ( Sender ) ) then
       Zoo_EditLinhagemDatamodule.SetComposicaoRacas ;
   end;
end;

procedure TZoo_EditLinhagemFrame.dbxGrauSangueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet (  Key, [ '0' .. '9', #8, #7, '/' ] ) then
    Key := #0;
end;

procedure TZoo_EditLinhagemFrame.edMaeButtonClick(Sender: TObject);
begin
  SearchMae ( TJvDBComboEdit ( Sender ).Text ) ;
end;

procedure TZoo_EditLinhagemFrame.edPaiButtonClick(Sender: TObject);
begin
  SearchPai ( TJvDBComboEdit ( Sender ).Text ) ;
end;

class procedure TZoo_EditLinhagemFrame.Execute ( AX, AY : integer ; AKZOO_ANIMAL : string ) ;
var
   EditLinhagem : TZoo_EditLinhagemFrame ;
begin
   with TTcControlPopuper.create ( nil ) do
     try
       EditLinhagem := TZoo_EditLinhagemFrame.create ( nil ) ;
       EditLinhagem.OpenTables( AKZOO_ANIMAL ) ;
       EnterKeyAction := enterKeyDefault ; // enterKeyNothing ; // enterKeyGotoNextControl
       Control := EditLinhagem ;
       ShowModal ( Point ( AX, AY ) ) ;

//       Result := ( ModalResult = mrOK  ) ;
//       if Result then
//          FRaca := EditLinhagem.Raca ;
       EditLinhagem.free ;
     finally
       free ;
     end ;
end;

procedure TZoo_EditLinhagemFrame.FloatEditorOKButtonClick(Sender: TObject);
begin
  ValidateGenealogy ;
  TCustomForm( Parent ).ModalResult := mrOK ;
end;

procedure TZoo_EditLinhagemFrame.FormShow(Sender: TObject);
begin
   //Refresh ;
    edPai.Refresh ;
    edMae.Refresh ;
    dbEdtComposicaoRaca.Refresh ;
end;

procedure TZoo_EditLinhagemFrame.OpenTables(AKZOO_ANIMAL: string);
begin
       Zoo_EditLinhagemDatamodule.SetParams ( AKZoo_Animal ) ;
       Zoo_EditLinhagemDatamodule.OpenTables ;
end;

procedure TZoo_EditLinhagemFrame.SearchMae(TextToSearch: string);
begin

    with Zoo_EditLinhagemDatamodule, TSearchMae.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             SetMae ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                      Result.FieldByName( 'NOMEESTABULO' ).asString,
                      Result.FieldByName( 'GRAUSANGUE' ).asString,
                      Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
       finally
          free ;
       end ;

end;

procedure TZoo_EditLinhagemFrame.SearchPai(TextToSearch: string);
begin

    with Zoo_EditLinhagemDatamodule, TSearchPai.Create do
       try
          TextToFind := TextToSearch ;
          if Execute then
             SetPai ( Result.FieldByName( 'KZOO_ANIMAL' ).asString,
                      Result.FieldByName( 'NOMEESTABULO' ).asString,
                      Result.FieldByName( 'GRAUSANGUE' ).asString,
                      Result.FieldByName( 'COMPOSICAORACA' ).asString  ) ;
       finally
          free ;
       end ;
end;

procedure TZoo_EditLinhagemFrame.SpeedButton7Click(Sender: TObject);
begin
  with TFormClass ( FindClass ( 'TZoo_AnimaisExternosMachoForm' ) ).Create( nil ) do
    try
      BorderStyle := bsDialog ;
      ShowModal
    finally
      free ;
    end;
  Refresh ;
end;

procedure TZoo_EditLinhagemFrame.SpeedButton8Click(Sender: TObject);
begin
  with TFormClass ( FindClass ( 'TZoo_AnimaisExternosFemeaForm' ) ).Create( nil ) do
    try
      BorderStyle := bsDialog ;
      ShowModal
    finally
      free ;
    end;
  Refresh ;
end;

procedure TZoo_EditLinhagemFrame.ValidateGenealogy;
begin
   Zoo_EditLinhagemDatamodule.ApplyUpdates ;
end;

end.
