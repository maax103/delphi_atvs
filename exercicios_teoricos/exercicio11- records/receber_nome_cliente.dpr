program receber_nome_cliente;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
    TRegCliente = record
    Codigo : Integer;
    Nome : String;
    Idade : Byte;
  end;
var
   xCliente : TRegCliente;

begin
  try
    WriteLn('Entre com o c�digo do cliente: ');
    ReadLn(xCliente.Codigo);

    WriteLn('Digite o Nome do Cliente: ');
    ReadLn(xCliente.Nome);

    WriteLn('Digite a idade do cliente: ');
    ReadLn(xCliente.Idade);

    WriteLn('C�digo: ' + xCliente.Codigo.ToString);
    WriteLn('Seu nome �: ' + xCliente.Nome);
    WriteLn('sua idade �: ' + xCliente.Idade.Tostring);

    ReadLn;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
