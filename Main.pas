unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, Winsock2, ComCtrls,
  StdCtrls;

type
  TForm1 = class(TForm)
    IdTCPServer1: TIdTCPServer;
    stat1: TStatusBar;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
    procedure IdTCPServer1Exception(AThread: TIdPeerThread;
      AException: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TMacAddress = array [1..6] of byte;
var
  Form1: TForm1;

  function SendARP(const DestIP, SrcIP: ULONG;
                   pMacAddr: PULONG;
                   var PhyAddrLen: ULONG): DWORD; stdcall; external 'IPHLPAPI.DLL';

implementation

{$R *.dfm}


function getmac(Value: TMacAddress; Length: DWORD): String;
var i: integer;
begin
 if Length = 0 then Result := 'MAC адрес не найден!' else begin
  Result:= '';
  for i:= 1 to Length - 1 do
   Result:= Result + IntToHex(Value[i], 2) + ':';
  Result:= Result + IntToHex(Value[Length], 2)
 end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Idtcpserver1.Active:=True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Idtcpserver1.Active:=False;
end;


procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
var DestIP, SrcIP: ULONG;
     pMacAddr: TMacAddress;
     PhyAddrLen: ULONG;
begin
 with  AThread.Connection do
     begin
       DestIP:= inet_addr(pchar(AThread.Connection.CurrentReadBuffer));
       PhyAddrLen:= 6;
       SendArp(DestIP, 0, @pMacAddr, PhyAddrLen);
       WriteLn( getmac(pMacAddr, PhyAddrLen));
       Disconnect;
     end;
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
stat1.Panels[0].Text:='Connect!';
end;

procedure TForm1.IdTCPServer1Disconnect(AThread: TIdPeerThread);
begin
 stat1.Panels[0].Text:='Disconnect!';
end;

procedure TForm1.IdTCPServer1Exception(AThread: TIdPeerThread;
  AException: Exception);
begin
   stat1.Panels[0].Text:='Error!';
end;

end.
