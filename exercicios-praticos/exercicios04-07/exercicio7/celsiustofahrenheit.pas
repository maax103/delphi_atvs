unit celsiustofahrenheit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtCelsius: TEdit;
    btncalcular: TButton;
    label1: TLabel;
    label_resultado: TLabel;
    procedure btncalcularClick(Sender: TObject);
  private
    procedure celsiustofahrenheit;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.btncalcularClick(Sender: TObject);
begin
  celsiustofahrenheit;
end;

procedure TForm1.celsiustofahrenheit;
var
  xcelsius, xfahrenheit : Double;
begin
  xcelsius    := StrToFloat(edtCelsius.text);
  xfahrenheit := (9 * xcelsius + 160)/5;

  label_resultado.Caption := FloatToStr(xcelsius) + ' graus Celsius em Fahrenheit s�o: ' +
                             FloatToStr(xfahrenheit);
end;
end.
