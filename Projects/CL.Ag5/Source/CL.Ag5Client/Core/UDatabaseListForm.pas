unit UDatabaseListForm;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, Data.DB, Tc.Data.DB.Helpers, VCL.Grids, VCL.DBGrids, Tc.VCL.Form ;

type
  TDatabaseListForm = class(TTcForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseListForm: TDatabaseListForm;

implementation

{$R *.dfm}

end.
