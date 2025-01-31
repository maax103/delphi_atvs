unit comissao_calcular;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_nome_func: TEdit;
    edt_salario: TEdit;
    edt_vendas: TEdit;
    btn_calcular: TButton;
    Label1: TLabel;
    resultado: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btn_calcularClick(Sender: TObject);
  private
    procedure calcularcomissao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TForm1.btn_calcularClick(Sender: TObject);
begin
  calcularcomissao;
end;

procedure TForm1.calcularcomissao;
var
  xnome: String;
  xsalario, xvendas, xcomissao: Double;
const
  c_comissao = 0.15;
begin
  xnome := edt_nome_func.Text;
  xsalario := StrToFloat(edt_salario.Text);
  xvendas := StrToFloat(edt_vendas.Text);

  xcomissao := xvendas * c_comissao;
  xcomissao := xcomissao + xsalario;

  resultado.Caption := xnome + ' recebe R$' + FormatFloat(' #,##0.00', xsalario) +
     ' receber� R$ ' + FormatFloat('#,##0.00', xcomissao) + ' ao final do m�s';

end;

end.
