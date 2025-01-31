unit media;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TForm1 = class(TForm)
    Label1: TLabel;
    edt_nome: TEdit;
    edt_nota1: TEdit;
    edt_nota2: TEdit;
    edt_nota3: TEdit;
    btn_calcular: TButton;
    label_resultado: TLabel;
    aaa: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btn_calcularClick(Sender: TObject);
  private
    procedure media;
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
  media;
end;

procedure TForm1.media;
var
  xnota1, xnota2, xnota3, xmedia: Double;
  xnome : String;
begin
  xnome  := edt_nome.Text;
  xnota1 := StrToFloat(edt_nota1.Text);
  xnota2 := StrToFloat(edt_nota2.Text);
  xnota3 := StrToFloat(edt_nota3.Text);

  xmedia := (xnota1 + xnota2 + xnota3) / 3;

  if xmedia >= 7 then
    label_resultado.Caption := xnome + ' a sua m�dia �: ' +
                              FormatFloat('#,##0.00', xmedia) + ' voc� foi aprovado'

  else if xmedia <= 5 then
    label_resultado.Caption := xnome + ' a sua m�dia �: ' +
                              FormatFloat('#,##0.00', xmedia) + ' voc� foi reprovado'

  else if (xmedia>5)  and (xmedia < 6.9) then
    label_resultado.Caption := xnome + ' a sua m�dia �: ' +
                              FormatFloat('#,##0.00', xmedia) + ' voc� est� de recupera��o'

end;

end.
