unit realparadolar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_dolares: TEdit;
    edt_cot_dolar: TEdit;
    btn_calcular: TButton;
    Label1: TLabel;
    Label2: TLabel;
    label_resultado: TLabel;
    procedure btn_calcularClick(Sender: TObject);

  private
    procedure realparadolar;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_calcularClick(Sender: TObject);
begin
  realparadolar;
end;

procedure TForm1.realparadolar;
var
  xreal, xdolar, xcotacao: Double;

begin
  xdolar   := StrToFloat(edt_dolares.Text);
  xcotacao := StrTofloat(edt_cot_dolar.text);

  xreal := xdolar * xcotacao;

  label_resultado.Caption := 'Voc� tem ' + FloatToSTr(xreal) + ' reais dispon�veis';
end;

end.
