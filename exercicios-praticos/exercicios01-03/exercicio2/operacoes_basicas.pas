unit operacoes_basicas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    caixa_texto: TLabel;
    edt_val1: TEdit;
    edt_val2: TEdit;
    btn_calcular: TButton;
    label_result: TLabel;
    procedure btn_calcularClick(Sender: TObject);
  private
    procedure operacoes_basicas;
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
   operacoes_basicas
end;

procedure TForm1.operacoes_basicas;
var
xval1, xval2, xresult_adicao,
xresult_subt, xresult_mult :Integer;
xresult_divisao : Double;
 begin
    xval1 := StrToInt(edt_val1.Text);
    xval2 := StrToInt(edt_val2.Text);

    xresult_adicao := xval1 + xval2;
    xresult_subt := xval1 - xval2;
    xresult_mult := xval1 * xval2;
    xresult_divisao := xval1/xval2;

    label_result.Caption := 'Adi��o resulta em: ' + IntToStr(xresult_adicao) + SLineBreak +
                            'Subtra��o resulta em: ' + IntToStr(xresult_subt) + SLineBreak +
                            'Multiplica��o resulta em: ' + IntToStr(xresult_mult) + SLineBreak +
                            'Divis�o resulta em: ' + FloatToStr(xresult_divisao) + SLineBreak;
 end;
end.
