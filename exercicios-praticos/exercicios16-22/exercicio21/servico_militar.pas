unit servico_militar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPessoa = record
    nome: String;
    idade: Integer;
    sexo: String;
    saude: String;
  end;

  TForm1 = class(TForm)
    memo_resultado: TMemo;
    btn_cadastrar: TButton;
    btn_listar: TButton;
    Label1: TLabel;
    procedure btn_cadastrarClick(Sender: TObject);
    procedure btn_listarClick(Sender: TObject);
  private
      FPessoa:array of TPessoa;
    procedure Cadastrar_Pessoas;
    procedure Verificar_Aptidao;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }




procedure TForm1.Cadastrar_Pessoas;
var
  xPessoa: TPessoa;
  i: Integer;
begin
  i := 0;
  setLength(FPessoa, 2);

  for i := 0 to Length(FPessoa)-1 do
  begin
    xPessoa.nome := AnsiLowerCase(inputbox('Informar nome', 'Nome: ', ''));
    xPessoa.idade := StrToInt(inputbox('Informar', 'Idade: ', ''));
    xPessoa.sexo := AnsiLowerCase(inputbox('Informar', 'Sexo(masculino/feminino):', ''));
    xPessoa.saude := AnsiLowerCase(inputbox('Informar', 'Sa�de(boa,media,ruim)):', ''));
    FPessoa[i] := xPessoa;
  end;

end;

procedure TForm1.Verificar_Aptidao;
var
  xPessoa: TPessoa;
  i: Integer;
  xcontAptos, xcontNAptos: Integer;
begin
  setLength(FPessoa, 2);
  xcontNAptos := 0;
  xcontAptos := 0;

  for i := 0 to Length(FPessoa)-1 do
  begin
    xPessoa := FPessoa[i];
    if ((xPessoa.idade >= 18) and (xPessoa.sexo = 'masculino')) and
      (xPessoa.saude = 'boa') then
      begin
        memo_resultado.Lines.Add(xPessoa.nome + ' ' + IntToStr(xPessoa.idade) + ' anos do sexo '+ xPessoa.sexo + ' e tem a sa�de '+xPessoa.saude +
                                ' est� apto para prestar o servi�o militar');
        Inc(xcontAptos)
      end

    else
      begin
      memo_resultado.Lines.Add(xPessoa.nome + ' ' + IntToStr(xPessoa.idade) + ' anos do sexo '+xPessoa.sexo + ' e tem a sa�de ' +xPessoa.saude +
                                ' n�o est� apto para prestar o servi�o militar');
      Inc(xcontNAptos)
      end;

    end;
  memo_resultado.Lines.Add(' ');
  memo_resultado.Lines.Add('H� ' + IntToStr(xcontAptos) + ' aptos para o servi�o militar e ' + SLineBreak
                            + IntToSTr(xcontNAptos) + ' n�o aptos para o servi�o militar');
  memo_resultado.Lines.Add('S�o ' + IntTostr(xcontAptos+xcontNAptos) + ' pessoas no total');
end;

procedure TForm1.btn_cadastrarClick(Sender: TObject);
begin
  Cadastrar_Pessoas;
end;

procedure TForm1.btn_listarClick(Sender: TObject);
begin
  Verificar_Aptidao;
end;

end.
