program maioridade_hora;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function MaiorIdade(const aIdade:Byte): Boolean;
begin
  if aIdade >= 18 then
  begin
    Result := True
  end
  else
  begin
    Result := False;
  end;
end;

function Periodo(const aHora: Byte):String;
begin
  if aHora <12 then
     begin
     Result := 'Bom dia' + #13#10
     end
  else if aHora < 18 then
     begin
     Result := 'Boa tarde ' + #13#10
     end
  else
     begin
     Result := 'Boa noite' + #13#10
     end;
end;

var
  xIdade : Byte;
  xHora : Byte;
  xStrPeriodo : String;
  xEntrada : String;

begin
    try
    writeLn('Digite a sua idade: ');
    ReadLn(xIdade);

    writeLn('Que horas s�o?');
    ReadLn(xHora);

    xStrPeriodo := Periodo(xHora);

    if MaiorIdade(xIdade) then
    writeLn(xStrPeriodo + 'Voc� � maior de idade')
    else
    writeLn(xStrPeriodo + 'Voc� n�o � maior de idade');

    ReadLn(xEntrada);
    { TODO -oUser -cConsole Main : Insert code here }

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
