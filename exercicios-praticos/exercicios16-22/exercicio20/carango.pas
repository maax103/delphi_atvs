unit carango;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
   Tcarro = record
    Modelo: String;
    Ano: Integer;
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
    xCarro.Ano := StrToInt(inputbox('Informar', 'Qual O ano Do carro?', ''));
    xCarro.Preco := STrToFLoat(inputbox('Informar', 'Qual o pre�o do carro?', ''));
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
  const xDescontoAntes2000  = 0.12;
  const xDescontoDepois2000 = 0.07;

  i := 0;
 
  xresp := '';

  repeat
    xresp := AnsiLowerCase(inputbox('Informar', 'Gostaria de continuar calculando desconto? s/n', ''));

  for i := 0 to Length(Fcarro) - 1 do
    begin
      xcont := 0;
      xCarro := Fcarro[i]; //aqui percorre o record com o xcarro

      if xCarro.Ano<=2000 then
      begin
          xdesconto    := xCarro.Preco * xDescontoAntes2000;
          xCarro.Preco := xCarro.Preco - xdesconto;
          lista_desconto.Lines.Add('O carro ' + xCarro.Modelo + ' do ano '
                                    + IntToStr(xCarro.Ano) + ' ficar� com o pre�o R$'
                                    + FormatFloat('##,#00.00', xCarro.Preco) + ' com desconto');

            Inc(xcont);
      end

      else if xCarro.Ano>2000 then
      begin
          xdesconto    := xCarro.Preco * xDescontoDepois2000;
          xCarro.Preco := xCarro.Preco - xdesconto;

          lista_desconto.Lines.Add('O carro ' + xCarro.Modelo + ' do ano '
                                    + IntToStr(xCarro.Ano) + ' ficar� com o pre�o R$'
                                    + FormatFloat('##,#00.00', xCarro.Preco) + ' com desconto');
      end;

    end;

   until xresp = 'n';
   lista_desconto.Lines.Add('H� ' + IntToStr(xcont) + ' carros dos anos 2000 e ' +
                              IntToStr(Length(Fcarro)) + ' no total' );
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
