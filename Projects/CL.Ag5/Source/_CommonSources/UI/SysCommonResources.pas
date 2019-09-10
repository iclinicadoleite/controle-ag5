unit SysCommonResources;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls ;

type
  TCommonResources = class(TDataModule)
    ToolBarIcons: TImageList;
  private
    { Private declarations }
   class var FThis : TCommonResources ;
  public
    { Public declarations }
//    class function NewInstance : TObject ; override ;
  end;

function GetCommonResources : TCommonResources ;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TCommonResources }

(*
class function TCommonResources.NewInstance: TObject;
begin
   if not Assigned ( FThis ) then
     begin
       FThis := TCommonResources( inherited NewInstance ) ;
     end;
   Result := FThis ;
end;
*)

function GetCommonResources : TCommonResources ;
begin
   if not Assigned ( TCommonResources.FThis ) then
      TCommonResources.FThis := TCommonResources.Create( nil ) ;
   Result := TCommonResources.FThis ;
end;


end.
