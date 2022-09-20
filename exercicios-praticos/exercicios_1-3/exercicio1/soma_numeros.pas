unit soma_numeros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    caixa_label: TLabel;
    btn_calcular: TButton;
    edt_val1: TEdit;
    edt_val2: TEdit;
    Label2: TLabel;
    procedure btn_calcularClick(Sender: TObject);

  private
    procedure Somar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Somar;
var
xvalor1, xvalor2, xresultado : Integer;

begin
  xvalor1 := StrToInt(edt_val1.Text);
  xvalor2 := StrToInt(edt_val2.Text);
  xresultado := xvalor1 + xvalor2;
  caixa_label.Caption := IntToStr(xresultado);
end;

procedure TForm1.btn_calcularClick(Sender: TObject);
begin
  Somar
end;
end.
