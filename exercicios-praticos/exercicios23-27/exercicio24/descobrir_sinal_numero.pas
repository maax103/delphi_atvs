unit descobrir_sinal_numero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    Tnumeros = record
      numero : Integer;
      sinal : String;
    end;

  TForm1 = class(TForm)
    edt_tam_for: TEdit;
    btn_receber: TButton;
    memo_resultado: TMemo;
    btn_listar: TButton;
    Label1: TLabel;
    procedure btn_receberClick(Sender: TObject);
    procedure btn_listarClick(Sender: TObject);
  private
    Fnumeros : array of Tnumeros;

    procedure Descobrir_Sinal;
    procedure Listar_Numeros;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }



procedure TForm1.Descobrir_Sinal;
var
  xnumeros : TNumeros;
  i : integer;
begin
  i := StrToInt(edt_tam_for.Text);
  setlength(Fnumeros, i);

  for i := 0 to Length(FNumeros)-1 do
  begin
    xNumeros.numero := STrToInt(inputbox('Informar', 'Digite um n�mero', ''));

    if xNumeros.numero > 0 then
       xNumeros.sinal := ' � positivo'
    else if xNumeros.numero < 0 then
       xNumeros.sinal := ' � negativo'
    else
      xNumeros.sinal := ' � igual a zero';

    FNumeros[i] := xNumeros;
  end;

end;

procedure TForm1.Listar_Numeros;
var
  xnumeros : TNumeros;
  i: Integer;
begin

  for i := 0 to Length(FNumeros)-1 do
  begin
    xNumeros := FNumeros[i];
    memo_resultado.Lines.Add(FloatToStr(xNumeros.numero) + xNumeros.sinal);
  end;

end;

procedure TForm1.btn_listarClick(Sender: TObject);
begin
  Listar_Numeros
end;

procedure TForm1.btn_receberClick(Sender: TObject);
begin
  Descobrir_Sinal
end;

end.
