unit comandos_repeticao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Classes;

type
  // TRadioGrupo = (func_for, func_while, func_repeat);
  TForm1 = class(TForm)
    Label1: TLabel;
    grupo_radio: TRadioGroup;
    btn_executar: TButton;
    caixa_1: TEdit;
    caixa_2: TEdit;
    procedure btn_executarClick(Sender: TObject);

  private

    procedure Somar;
    procedure Sangria;
    procedure Meta;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
(* function Somar(var num1, num2 : Integer):Integer ;
  var
  xsoma, i : Integer;
  begin
  i := 0 ;
  xsoma := 0;
  for i := num1 to num2 do
  if (i mod 2) = 0 then
  xsoma := xsoma + i;
  result := xsoma;
  end;


  function Sangria(var val_1, val_2: Integer):Integer;
  var
  cont, saldo_restante : Integer;

  begin
  while saldo_restante>0 do
  begin
  val_1 := val_1 - val_2;
  saldo_restante := val_1;
  Inc(cont);
  //cont := cont + 1;
  result := cont;
  end;
  end;


  function Meta(var caixa_1, caixa_2: Integer):Integer;
  var
  contador, valor_meta: Integer;
  begin
  contador := 0;
  valor_meta:= 0;
  repeat
  begin
  valor_meta := valor_meta + caixa_2;
  contador := contador + 1;
  result := contador;
  end;
  until valor_meta = caixa_1;
  end;



  procedure TForm1.btn_executarClick(Sender: TObject);
  var
  valorcaixa1: Integer;
  valorcaixa2: Integer;
  resultado :  Integer;
  r : Integer;

  begin
  valorcaixa1 := StrToInt(caixa_1.Text);
  valorcaixa2 := StrToint(caixa_2.Text);

  case TRadioGrupo(grupo_radio.itemIndex) of

  func_for:
  begin
  resultado := Somar(valorcaixa1, valorcaixa2);
  showmessage(IntToStr(resultado) + ' � o resultado.');
  end;

  func_while:
  begin
  resultado := Sangria(valorcaixa1, valorcaixa2);
  showmessage(IntToStr(resultado) + ' Dias voc� ter� um saldo = 0')
  end;

  func_repeat:
  begin
  r := Meta(valorcaixa1, valorcaixa2);
  showmessage(IntToStr(r) + ' Dias voc� atingir� sua meta')
  end;
  end;
  end; *)

{ TForm1 }

procedure TForm1.Sangria;

var
  xSaldo, xSangria, xContador: Integer;

begin
  xSaldo := StrToInt(caixa_1.Text);
  xSangria := StrToInt(caixa_2.Text);
  xContador := 0;
  while xSaldo > 0 do
  begin
    xSaldo := xSaldo - xSangria;
    Inc(xContador);
  end;

  ShowMessage('Em ' + IntToStr(xContador) + 'Dias voc� ter� zerado seu saldo');

end;

procedure TForm1.Somar;
var
  xSoma, i, num1, num2: Integer;
begin
  xSoma := 0;
  num1 := StrToInt(caixa_1.Text);
  num2 := StrToInt(caixa_2.Text);

  for i := num1 to num2 do
    if (i mod 2) = 0 then
      xSoma := xSoma + i;

  ShowMessage('A Soma dos Pares resulta em: ' + IntToStr(xSoma));

end;

procedure TForm1.Meta;
var
  xMeta, xDeposito, xDias, xValor: Integer;

begin
  xMeta := StrToInt(caixa_1.Text);
  xDeposito := StrToInt(caixa_2.Text);
  xDias := 0;
  repeat
  begin
    xMeta := xMeta - xDeposito;
    Inc(xDias);
  end;

  until xMeta = 0;

  ShowMessage('Em ' + IntToStr(xDias) + ' dias voc� ter� atingido a sua meta.');

end;

procedure TForm1.btn_executarClick(Sender: TObject);
var
  xItemSelecionado: String;

begin
  xItemSelecionado := grupo_radio.Items[grupo_radio.ItemIndex];

  if xItemSelecionado = 'For' then
  begin
    Somar;
  end

  else if xItemSelecionado = 'While' then
  begin
    Sangria;
  end

  else if xItemSelecionado = 'Repeat' then
  begin
    Meta;
  end;
end;

end.
