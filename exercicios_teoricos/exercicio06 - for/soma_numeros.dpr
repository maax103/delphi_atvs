program soma_numeros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xQtdEntrada: Integer;
  xNumero: Integer;
  I: Integer;
  xSoma: Integer;
begin
  try
  xSoma := 0;

  WriteLn('Digite o total de n�meros:');
  ReadLn(xQtdEntrada);

  for I := 0 to xQtdEntrada-1 do
  begin
    WriteLn('Entre com o ' + IntToStr(I+1) + ' n�: ');
    ReadLn(xNumero);

  {for I := xQtdEntrada downto 1 do
  begin
    WriteLn('Entre com o ' + IntToStr(I+1) + ' n�: ');
    ReadLn(xNumero);}

    xSoma := xSoma + xNumero;
  end;

  WriteLn('A soma �: ' + IntToStr(xSoma));
  ReadLn;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
