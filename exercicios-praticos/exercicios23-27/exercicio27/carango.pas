unit carango;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
   Tcarro = record
    Modelo: String;
    combustivel: String;
    Preco : Double;
  end;

  TForm1 = class(TForm)
    lista_desconto: TMemo;
    btn_cadastrar: TButton;
    Label1: TLabel;
    btn_desconto: TButton;
    procedure Cadastro_Carango;
    procedure Desconto_Carango;
    procedure btn_cadastrarClick(Sender: TObject);
    procedure btn_descontoClick(Sender: TObject);
  private

    Fcarro: array of Tcarro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.Cadastro_Carango;
var
  xCarro: Tcarro;
  i: Integer;
begin
  setLength(Fcarro, 2);

  i := 0;

  for i := 0 to Length(Fcarro) - 1 do
  begin
    xCarro.Modelo := inputbox('Informar', 'Qual o Modelo Do carro?', '');
    xCarro.combustivel := inputbox('Informar', 'Qual O combust�vel?', '');
    xCarro.Preco := STrToFloat(inputbox('Informar', 'Qual o pre�o do carro?', ''));
    Fcarro[i] := xCarro; //o xcarro alimenta o record com os dados recebidos
  end;

end;

procedure TForm1.Desconto_Carango;
var
  xCarro : Tcarro;
  i, xcont : Integer;
  xdesconto : Double;
  xresp : String;
begin
  setLength(Fcarro, 2);
  const xDescontoGasolina  = 0.21;
  const xDescontoAlcool = 0.25;
  const xDescontoDiesel = 0.14;
  i := 0;
 
  xresp := '';

  repeat
    xresp := AnsiLowerCase(inputbox('Informar', 'Gostaria de continuar calculando desconto? s/n', ''));

  for i := 0 to Length(Fcarro) - 1 do
    begin
      xcont := 0;
      xCarro := Fcarro[i]; //aqui percorre o record com o xcarro

      if xCarro.combustivel='diesel' then
      begin
          xdesconto    := xCarro.Preco * xDescontoDiesel;
          xCarro.Preco := xCarro.Preco - xdesconto;
          lista_desconto.Lines.Add('O carro ' + xCarro.Modelo + ' do ano '
                                    + xCarro.combustivel + ' ficar� com o pre�o R$'
                                    + FormatFloat('##,#00.00', xCarro.Preco) + ' com desconto');

            Inc(xcont);
      end

      else if xCarro.combustivel = 'alcool' then
      begin
          xdesconto    := xCarro.Preco * xDescontoAlcool;
          xCarro.Preco := xCarro.Preco - xdesconto;

          lista_desconto.Lines.Add('O carro ' + xCarro.Modelo + ' do ano '
                                    + xCarro.combustivel + ' ficar� com o pre�o R$'
                                    + FormatFloat('##,#00.00', xCarro.Preco) + ' com desconto');
      end

      else if xCarro.combustivel = 'gasolina' then
      begin
          xdesconto    := xCarro.Preco * xDescontoGasolina;
          xCarro.Preco := xCarro.Preco - xdesconto;

          lista_desconto.Lines.Add('O carro ' + xCarro.Modelo + ' do ano '
                                    + xCarro.combustivel + ' ficar� com o pre�o R$'
                                    + FormatFloat('##,#00.00', xCarro.Preco) + ' com desconto');
      end;
      Fcarro[i] := xCarro;
    end;

   until xCarro.preco < 0.01;
   lista_desconto.Lines.Add('H� ' + IntToStr(xcont) + IntToStr(Length(Fcarro)) + ' no total' );
end;

procedure TForm1.btn_cadastrarClick(Sender: TObject);
begin
  Cadastro_Carango;
end;


procedure TForm1.btn_descontoClick(Sender: TObject);
begin
  Desconto_Carango;
end;

end.
