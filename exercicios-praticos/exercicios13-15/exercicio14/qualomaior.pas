unit qualomaior;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_num1: TEdit;
    edt_num2: TEdit;
    btn_descobrir: TButton;
    Label1: TLabel;
    procedure btn_descobrirClick(Sender: TObject);

  private
    procedure QualOMaior;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.QualOMaior;
var
  xnum1, xnum2 :Integer;
begin
   xnum1 := StrToint(edt_num1.Text);
   xnum2 := StrToInt(edt_num2.Text);

   if xnum1>xnum2 then
      showmessage(IntToStr(xnum1) + ' � maior que ' + IntToStr(xnum2))

   else if xnum1<xnum2 then
      showmessage(IntToStr(xnum2) + ' � maior que ' + IntToStr(xnum1))

   else
    showmessage('Os n�meros s�o iguais')
end;

procedure TForm1.btn_descobrirClick(Sender: TObject);
begin
   QualOMaior
end;

end.
