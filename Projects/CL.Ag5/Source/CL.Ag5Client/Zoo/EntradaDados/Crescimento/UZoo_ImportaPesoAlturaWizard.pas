unit UZoo_ImportaPesoAlturaWizard ;

interface

uses
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.ActnList, VCL.StdCtrls, VCL.Buttons, VCL.ComCtrls,
  JvExComCtrls, JvComCtrls, VCL.ExtCtrls,
  SysFormWizard, JvExExtCtrls, JvExtComponent, JvPanel, JvImage, VCL.Mask,
  Tc.VCL.Application,
  JvExMask, JvToolEdit,  JvDialogs, VCL.Dialogs, Tc.VCL.Controls.GDIButton,
  System.Actions, Tc.RTL.Exceptions, Tc.VCL.Extended.Mask, Tc.VCL.Edits, Wrappers ;

type
  TZoo_ImportaPesoAlturaWizard = class(T_FormWizard)
    TabSheet1: TTabSheet;
    Label2: TLabel;
    edtFilePesagens: TTcFilenameEdit;
    Button1: TTcGDIButton;
    JvSaveDialog1: TJvSaveDialog;
    procedure _actNextExecute(Sender: TObject);
    procedure _actPriorExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure _actExecuteUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute ( var AFileName : string ) : boolean; reintroduce ;
  end;


implementation

{$R *.dfm}

{ TfrmCustomWizard }
(*
procedure TZoo_ImportaPesoAlturaWizard.Button1Click(Sender: TObject);
var
  source : string ;
begin
  source := ExtractFilePath ( Application.ExeName ) + 'Modelos\Modelo Pesagens.xls' ;
  if JvSaveDialog1.Execute then
    begin
     CopyFile( PChar ( source ), PChar( JvSaveDialog1.FileName ), False ) ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;
*)

procedure SaveRes(const AResourceName, AFileName : string );
var
  ResStream: TResourceStream;
begin
  ResStream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  try
    ResStream.Position := 0;
    ResStream.SaveToFile(AFileName);
  finally
    ResStream.Free;
  end;
end;

procedure TZoo_ImportaPesoAlturaWizard.Button1Click(Sender: TObject);
begin
  JvSaveDialog1.FileName := 'Modelo Peso Altura.xlsx' ;
  if JvSaveDialog1.Execute then
    begin
     if FileExists ( JvSaveDialog1.FileName ) then
       if not DeleteFile( JvSaveDialog1.FileName ) then
         Raise Fail.Create( 'Não foi possível exportar o arquivo. '
             +#13#10'Verifique se o arquivo está sendo utilizado por outro processo.' ) ;
     SaveRes ( 'XLS_PESOALTURA', JvSaveDialog1.FileName )  ;
     MessageDlg ( 'Modelo salvo em :' + JvSaveDialog1.FileName ) ;
    end;
end;


class function TZoo_ImportaPesoAlturaWizard.Execute ( var AFileName : string ) : boolean;
var
  ThisForm: TZoo_ImportaPesoAlturaWizard;
begin
  ThisForm := TZoo_ImportaPesoAlturaWizard.Create ( nil ) ;
  try
      Result := ThisForm.ShowModal = mrOK ;
      if Result then
        AFileName := ThisForm.edtFilePesagens.Text  ;
  finally
     ThisForm.free ;
  end ;

end ;

procedure TZoo_ImportaPesoAlturaWizard._actExecuteUpdate(Sender: TObject);
begin

      _actExecute.Enabled := ( Application.LicenseState <> lsReadOnly ) and
          ( edtFilePesagens.Text <> '' )
      and (    ( AnsiUpperCase ( ExtractFileExt (  edtFilePesagens.Text ) ) = '.XLS' )
            or ( AnsiUpperCase ( ExtractFileExt (  edtFilePesagens.Text ) ) = '.XLSX' )
          )
      and ( FileExists( edtFilePesagens.Text ) ) ;

end;

procedure TZoo_ImportaPesoAlturaWizard._actNextExecute(Sender: TObject);
begin

  // insira as validacoes antes do inherited
  //
  // if PageControl.ActivePage and CheckBox1.checked then
  //  begin
  //     showMessage ( 'opcao invalida' ) ;
  //     abort ;
  // end ;

  inherited;

end;

procedure TZoo_ImportaPesoAlturaWizard._actPriorExecute(Sender: TObject);
begin
  // insira as validacoes antes do inherited
  //
  // if MessageDlg ( 'Caso volte, as configuracoes desta pagina serão perdidas'#13#10'Voltar', [ mbYes, mbNo ] ) <> mrYes then
  //    abort ;
  //
  //

  inherited;

end;

end.
