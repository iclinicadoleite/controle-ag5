unit Vcl.DBGrids.RSP14898;

interface


implementation

uses System.Classes,
     Winapi.Windows,
     Tc.RTL.CodeRedirect,
     VCL.Forms, Vcl.Grids, Vcl.DBGrids ;

type
  TCustomDBGridAccess = class(TCustomDBGrid);

  TCustomDBGridHelper = class helper for TCustomDBGrid
  protected
    function CanEditShow_RSP14898: Boolean;
  end;


function TCustomDBGridHelper.CanEditShow_RSP14898: Boolean;
  function IsActiveControl: Boolean;
  var
    H: Hwnd;
    ParentForm: TCustomForm;
  begin
    Result := False;
    ParentForm := GetParentForm(Self);
    if Assigned(ParentForm) then
      Result := (ParentForm.ActiveControl = Self) and (ParentForm = Screen.ActiveCustomForm)
    else
    begin
      H := GetFocus;
      while IsWindow(H) and not Result do
      begin
        if H = WindowHandle then
          Result := True
        else
          H := GetParent(H);
      end;
    end;
  end;


begin
    Result := (ColCount > 0)
        and (Col  > IndicatorOffSet -1)
        and ((Columns.Count > 0)
        and not Columns[Col - IndicatorOffSet ].Readonly)
        and (LayoutLock = 0)
        and ([dgRowSelect, dgEditing] * Options = [dgEditing])
        and EditorMode
        and not (csDesigning in ComponentState)
        and HandleAllocated
        and ((dgAlwaysShowEditor in Options) or IsActiveControl);
end;


var
 C: TCodeRedirect;

initialization
  C := TCodeRedirect.CreateWithMethod(
     @TCustomDBGridAccess.CanEditShow,
     @TCustomDBGrid.CanEditShow_RSP14898);
finalization
  C.Free;
end.
