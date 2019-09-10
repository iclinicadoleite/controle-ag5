unit UPopupMenuManuais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Tc.RTL.Packages.Manager ;

type
  TPopupMenuManuais = class(TForm)
    _PanelManuais: TPanel;
    _LabelManualZootecnico: TLabel;
    _ManualZootecnicoImg: TImage;
    _LabelManualFinanceiro: TLabel;
    _ManualFinanceiroImg: TImage;
    procedure _ManualZootecnicoImgClick(Sender: TObject);
    procedure _ManualFinanceiroImgClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure _ManualZootecnicoImgMouseEnter(Sender: TObject);
    procedure _ManualZootecnicoImgMouseLeave(Sender: TObject);
    procedure _ManualFinanceiroImgMouseEnter(Sender: TObject);
    procedure _ManualFinanceiroImgMouseLeave(Sender: TObject);
  private
    { Private declarations }
    function LoadPackageMainPackage ( APackageName : string) : cardinal ;
  public
    { Public declarations }
  end;

var
  PopupMenuManuais: TPopupMenuManuais;

implementation

{$R *.dfm}

procedure TPopupMenuManuais.FormDeactivate(Sender: TObject);
begin
    hide ;
end;

function TPopupMenuManuais.LoadPackageMainPackage(APackageName: string): cardinal;
begin

  ActivateClassGroup( TControl ) ;

  try
    Result := PackageManager.LoadPackage( APackageName ) ;
  except On E : Exception do
    begin
      Result := 0 ;
//      ErrPkg := ErrPkg + APackageName + ' ' + E.Message + #13#10 ;
//      ShowMessage ( ErrPkg ) ;
    end;
  end;

end;

procedure TPopupMenuManuais._ManualFinanceiroImgClick(Sender: TObject);
var
  C : TFormClass  ;
begin

  LoadPackageMainPackage ( 'CL.Ag5.WB.ManualFinanceiro.bpl' )   ;
  ActivateClassGroup( TControl ) ;
  C := TFormClass ( GetClass ( 'TWBManualFinanceiro' ) ) ;
  with C.Create( self ) do
    begin
      Top    := Trunc ( Screen.Height * 0.10 ) ;
      Left   := Trunc ( Screen.width  * 0.10 ) ;
      Height := Trunc ( Screen.Height * 0.80 ) ;
      width  := Trunc ( Screen.width  * 0.80 ) ;
      show ;
    end;

end;

procedure TPopupMenuManuais._ManualZootecnicoImgClick(Sender: TObject);
var
  C : TFormClass  ;
begin
  LoadPackageMainPackage ( 'CL.Ag5.WB.ManualZootecnico.bpl' )   ;
  ActivateClassGroup( TControl ) ;
  C := TFormClass( GetClass ( 'TWBManualZootecnico' ) );
  with C.Create ( self ) do
    begin
      Top    := Trunc ( Screen.Height * 0.10 ) ;
      Left   := Trunc ( Screen.width  * 0.10 ) ;
      Height := Trunc ( Screen.Height * 0.80 ) ;
      width  := Trunc ( Screen.width  * 0.80 ) ;
      show ;
    end;
end;

procedure TPopupMenuManuais._ManualZootecnicoImgMouseEnter(Sender: TObject);
begin
   _LabelManualZootecnico.Font.Style := _LabelManualZootecnico.Font.Style + [fsUnderline]
end;

procedure TPopupMenuManuais._ManualZootecnicoImgMouseLeave(Sender: TObject);
begin
   _LabelManualZootecnico.Font.Style := _LabelManualZootecnico.Font.Style - [fsUnderline]
end;

procedure TPopupMenuManuais._ManualFinanceiroImgMouseEnter(Sender: TObject);
begin
   _LabelManualFinanceiro.Font.Style := _LabelManualFinanceiro.Font.Style + [fsUnderline]
end;

procedure TPopupMenuManuais._ManualFinanceiroImgMouseLeave(Sender: TObject);
begin
   _LabelManualFinanceiro.Font.Style := _LabelManualFinanceiro.Font.Style - [fsUnderline]
end;


end.
