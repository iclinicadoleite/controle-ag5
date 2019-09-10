// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8081/wsdl/ICLAG5SerialControl
// Codegen  : [wfForceSOAP11+]
// Version  : 1.0
// (22/05/2013 14:08:29 - - $Rev: 25127 $)
// ************************************************************************ //

unit CLAg5.WSClientSerialControl;

interface

uses InvokeRegistry, SOAPHTTPClient, System.Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following System.Types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:CLAG5SerialControlIntf-ICLAG5SerialControl
  // soapAction: urn:CLAG5SerialControlIntf-ICLAG5SerialControl#GetSerials
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ICLAG5SerialControlbinding
  // service   : ICLAG5SerialControlservice
  // port      : ICLAG5SerialControlPort
  // URL       : http://localhost:8081/soap/ICLAG5SerialControl
  // ************************************************************************ //
  ICLAG5SerialControl = interface(IInvokable)
  ['{76A78D30-F4DC-C3F1-016E-4AEA8D23D767}']
    function  GetSerials(const Value: String): String; stdcall;
  end;

function GetICLAG5SerialControl(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICLAG5SerialControl;


implementation
  uses SysUtils;

function GetICLAG5SerialControl(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICLAG5SerialControl;
const
  defWSDL = 'http://127.0.0.1:8081/wsdl/ICLAG5SerialControl';
  defURL  = 'http://127.0.0.1:8081/soap/ICLAG5SerialControl';
  defSvc  = 'ICLAG5SerialControlservice';
  defPrt  = 'ICLAG5SerialControlPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ICLAG5SerialControl);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ICLAG5SerialControl), 'urn:CLAG5SerialControlIntf-ICLAG5SerialControl', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICLAG5SerialControl), 'urn:CLAG5SerialControlIntf-ICLAG5SerialControl#GetSerials');

end.