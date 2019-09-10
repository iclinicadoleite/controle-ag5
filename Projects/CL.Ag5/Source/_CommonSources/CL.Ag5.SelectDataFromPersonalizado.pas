unit CL.Ag5.SelectDataFromPersonalizado;

interface

uses system.generics.collections, DBClient ;

type

   TKeyCode = record
     Key : string  ;
     Code : string ;
   end;
   TKeyCodeList = TList<TKeyCode> ;
   TSelectDataFromPersonalizado = procedure ( const AKeyList : TKeyCodeList )  ;

function PersonalizadoAssigned : boolean ;
function SetPersonalizado(  APersonalizado : TSelectDataFromPersonalizado ) : boolean ;
function SelectFromPersonalizado : TKeyCodeList ;

implementation

var
  SelectDataFromPersonalizado : TSelectDataFromPersonalizado ;

function PersonalizadoAssigned : boolean ;
begin
  Result := Assigned ( SelectDataFromPersonalizado ) ;
end;

function SetPersonalizado(  APersonalizado : TSelectDataFromPersonalizado ) : boolean ;
begin
  SelectDataFromPersonalizado := APersonalizado ;
  Result := Assigned ( SelectDataFromPersonalizado ) ;
end;

function SelectFromPersonalizado : TKeyCodeList ;
begin
  if not Assigned ( SelectDataFromPersonalizado )  then
     exit( nil ) ;
  Result := TKeyCodeList.Create ;
  SelectDataFromPersonalizado( Result ) ;
end;

initialization
   SelectDataFromPersonalizado := nil ;

end.
