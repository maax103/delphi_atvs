unit maior_igual_menor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_num: TEdit;
    Label1: TLabel;
    btn_mostrar: TButton;
    procedure btn_mostrarClick(Sender: TObject);
  private
    procedure Mostrar_Mensagem;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Mostrar_Mensagem;
var
  xNumero: Double;
begin
  xNumero := STrToFloat(edt_num.Text);

  if xNumero > 80 then
    ShowMessage('O n�mero inserido � maior que 80')

  else if xNumero < 25 then
    ShowMessage('O n�mero inserido � menor que 25')

  else if xNumero = 40 then
    ShowMessage('O n�mero inserido � igual a 40')
  else
    ShowMessage('Tente outro n�mero');
end;

procedure TForm1.btn_mostrarClick(Sender: TObject);
begin
  Mostrar_Mensagem;
end;

end.
