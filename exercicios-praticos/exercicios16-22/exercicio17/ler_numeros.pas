unit ler_numeros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TForm1 = class(TForm)
    Label1: TLabel;
    label_resultado: TLabel;
    btn_descobrir: TButton;
    procedure btn_descobrirClick(Sender: TObject);
  private
    procedure NumerosNoIntervalo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.NumerosNoIntervalo;
var
  //xNum: String;
  xValor : Double;
  i, cont: Integer;
  //aNumeros: array of Double;

begin
  i := 0;
  cont := 0;

  //setlength(aNumeros, 3);

  for i := 0 to 4 do
    begin
      xValor := StrToFloat(InputBox('Digite um n�mero', 'Digite aqui', ''));
      //aNumeros[i] := StrToFloat(xNum);
      //xValor := StrToFloat(xNum);

      if (xValor>=10) and (xValor<=150) then
        cont := cont + 1;
    end;

   showmessage('H� ' + IntToStr(cont) + ' n�meros no intervalo');

end;


procedure TForm1.btn_descobrirClick(Sender: TObject);
begin
  NumerosNoIntervalo;
end;

end.
