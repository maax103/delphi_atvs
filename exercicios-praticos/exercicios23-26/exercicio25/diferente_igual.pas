unit diferente_igual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_num_1: TEdit;
    edt_num2: TEdit;
    btn_mensagem: TButton;
    Label1: TLabel;
    procedure btn_mensagemClick(Sender: TObject);
  private
    procedure IguaisOuNao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btn_mensagemClick(Sender: TObject);
begin
 IguaisOuNao
end;

procedure TForm1.IguaisOuNao;
var
  xnum1, xnum2: Double;
begin
  xnum1 := StrToFloat(edt_num_1.Text);
  xnum2 := StrToFloat(edt_num2.Text);

  if xnum1 = xnum2 then
    showmessage('S�o iguais')
  else if xnum1 > xnum2 then
    showmessage('S�o diferentes e ' + FloatToStr(xnum1) + ' � maior')
  else
    showmessage('S�o diferentes e ' + FloatToStr(xnum2) + ' � maior');

end;

end.
