unit maiorque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_numero: TEdit;
    btn_descobrir: TButton;
    Label1: TLabel;
    procedure btn_descobrirClick(Sender: TObject);
  private
    procedure MaiorQue10;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }


procedure TForm1.MaiorQue10;
var
  xnum :Double;
begin
  xnum := StrToFloat(edt_numero.Text);

  if xnum>10 then
    showmessage('� maior que 10')
  else
    showmessage('N�o � maior que 10');
end;

procedure TForm1.btn_descobrirClick(Sender: TObject);
begin
  MaiorQue10;
end;

end.
