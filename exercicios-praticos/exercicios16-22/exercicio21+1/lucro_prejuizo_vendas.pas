unit lucro_prejuizo_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TVendas = record
    custo: Double;
    venda: Double;
  end;

  TForm1 = class(TForm)
    memo_listagem: TMemo;
    Label1: TLabel;
    btn_cadastrar: TButton;
    btn_listar: TButton;
    procedure btn_cadastrarClick(Sender: TObject);
    procedure btn_listarClick(Sender: TObject);
  private
    FVendas: array of TVendas;
    procedure Cadastrar_Vendas;
    procedure Listar_Vendas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }




procedure TForm1.Cadastrar_Vendas;
var
  xVendas: TVendas;
  i: Integer;

begin
  i := 0;
  setlength(FVendas, 3);

  for i := 0 to length(FVendas) - 1 do
  begin
    xVendas.custo := StrToFloat(inputbox('Informar',
      'Qual foi o custo do produto?', ''));
    xVendas.venda := StrToFloat(inputbox('Informar',
      'Qual foi o pre�o de venda?', ''));
    FVendas[i] := xVendas;
  end;

end;

procedure TForm1.Listar_Vendas;
var
  xVendas: TVendas;
  i: Integer;
  xDiferenca, xMedia: Double;
begin
  i := 0;
  setlength(FVendas, 3);

  for i := 0 to length(FVendas) - 1 do
  begin
    xVendas := FVendas[i];
      xDiferenca := xVendas.venda - xVendas.custo;
      xMedia := (xVendas.venda + xVendas.custo) / 2;
    if xDiferenca = 0 then
      memo_listagem.Lines.Add('N�o houve lucro vendendo R$' +
        formatFloat('###,##0.00', xVendas.custo) + ' o que custou R$' +
        formatFloat('###,##0.00', xVendas.venda))

    else if xDiferenca > 0 then
      memo_listagem.Lines.Add('Houve lucro de R$' + formatFloat('###,##0.00',
        xDiferenca) + ' vendendo a R$' + formatFloat('###,##0.00', xVendas.venda)
        + ' o que custou R$' + formatFloat('###,##0.00', xVendas.custo))
    else
      memo_listagem.Lines.Add('Houve preju�zo de R$' + formatFloat('###,##0.00',
        xDiferenca) + ' vendendo a R$' + formatFloat('###,##0.00', xVendas.venda)
        + ' o que custou R$' + formatFloat('###,##0.00', xVendas.custo));
    memo_listagem.Lines.Add('');
    memo_listagem.Lines.Add('A m�dia entre pre�o de custo e pre�o de venda foi de: R$ ' + FormatFloat('###,##0.00', xMedia));
  end;

end;

procedure TForm1.btn_cadastrarClick(Sender: TObject);
begin
  Cadastrar_Vendas
end;

procedure TForm1.btn_listarClick(Sender: TObject);
begin
  Listar_Vendas;
end;

end.
