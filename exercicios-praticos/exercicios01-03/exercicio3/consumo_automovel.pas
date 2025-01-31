unit consumo_automovel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TForm1 = class(TForm)
    label_resultado: TLabel;
    btn_calcular: TButton;
    edt_val1: TEdit;
    edt_val2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_calcularClick(Sender: TObject);
  private
    procedure CalcularConsumoMedio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.CalcularConsumoMedio;
var
xdistancia, xgasto, xmediagasta : Double;

begin
  xdistancia := StrToFloat(edt_val1.Text);
  xgasto := StrToFloat(edt_val2.Text);
  xmediagasta := xdistancia/xgasto;

  label_resultado.Caption := 'A m�dia de gasolina gasta foi de ' + FloatToStr(xmediagasta) + 'km por litro de gasolina';
end;

procedure TForm1.btn_calcularClick(Sender: TObject);
begin
  CalcularConsumoMedio;
end;
end.
