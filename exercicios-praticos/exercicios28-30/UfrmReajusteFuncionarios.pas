unit UfrmReajusteFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfuncionario = record
    nome: String;
    salario: Double;
    reajuste: Double;
    novoSalario: Double;
  end;

  TfrmReajusteFuncionarios = class(TForm)
    edt_qtd_func: TEdit;
    Label1: TLabel;
    btn_cadastrar: TButton;
    memo_resultado: TMemo;
    Button1: TButton;
  private
    FFuncionario: array of Tfuncionario;
    procedure CadastrarFuncionarios;
    procedure CalcularReajuste;
    procedure ListarReajuste;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReajusteFuncionarios: TfrmReajusteFuncionarios;

implementation

{$R *.dfm}
{ TForm2 }

procedure TfrmReajusteFuncionarios.CadastrarFuncionarios;
var
  xFuncionario: Tfuncionario;
  i: Integer;
begin
  i := StrToInt(edt_qtd_func.Text);
  setLength(FFuncionario, i);

  for i := 0 to Length(FFuncionario) - 1 do
  begin
    xFuncionario.nome := inputbox('Informar',
      'Qual nome do seu funcion�rio?', '');
    xFuncionario.salario := StrToFloat(inputbox('Informar', 'Qual sal�rio do seu funcion�rio?', ''));
    if xFuncionario.salario < 0 then
      break
    else
      FFuncionario[i] := xFuncionario;
  end;

end;

function CalcularReajuste(var xAumentoFolha:Double):Double;
var
  xFuncionario: Tfuncionario;
  i: Integer;

const
  cDesconto50    = 0.5;
  cDesconto20    = 0.2;
  cDesconto15    = 0.15;
  cDesconto10    = 0.1;
  cSalarioMinimo = 1200;

begin

  for i := 0 to Length(FFuncionario) - 1 do
  begin
    if xFuncionario.salario < 3*cSalarioMinimo then
    begin
      xFuncionario.reajuste    := xFuncionario.salario * cDesconto50;
      xFuncionario.novoSalario := xFuncionario.salario + xFuncionario.reajuste;
      xAumentoFolha            := xAumentoFolha + xFuncionario.reajuste;
    end

    else if ((3*cSalarioMinimo) > xFuncionario.salario) and (xFuncionario.salario < (10*cSalarioMinimo)) then
    begin
      xFuncionario.reajuste    := xFuncionario.salario * cDesconto20;
      xFuncionario.novoSalario := xFuncionario.salario + xFuncionario.reajuste;
      xAumentoFolha            := xAumentoFolha + xFuncionario.reajuste;
    end

    else if ((10*cSalarioMinimo) > xFuncionario.salario) and (xFuncionario.salario < (20*cSalarioMinimo)) then
    begin
      xFuncionario.reajuste    := xFuncionario.salario * cDesconto15;
      xFuncionario.novoSalario := xFuncionario.salario + xFuncionario.reajuste;
      xAumentoFolha            := xAumentoFolha + xFuncionario.reajuste;
    end

    else
    begin
      xFuncionario.reajuste    := xFuncionario.salario * cDesconto10;
      xFuncionario.novoSalario := xFuncionario.salario + xFuncionario.reajuste;
      xAumentoFolha            := xAumentoFolha + xFuncionario.reajuste;
    end;

    FFuncionario[i] := xFuncionario;
  end;

end;

procedure TfrmReajusteFuncionarios.ListarReajuste;
var
  xFuncionario : TFuncionario;
  i : Integer;

begin
  for i := 0 to Length(FFuncionario) do
    begin
      xFuncionario := FFuncionario[i];

      memo_resultado.Lines.Add('O funcion�rio ' + xFuncionario.nome + ' tinha um s�lario de R$' + FloatToStr(xFuncionario.salario) +
                                ' e ap�s o reajuste de ' + FormatFloat('###,##0.00', xFuncionario.reajuste) + ' passar� a receber R$' +
                                FormatFloat('###,##0.00', xFuncionario.novoSalario))

    end;
    memo_resultado.Lines.Add(' folha da empresa aumentar� em R$' + FormatFloat('###,##0.00', xAumentoFolha))
end;

end.
