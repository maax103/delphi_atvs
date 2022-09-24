unit entreosvalores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_num: TEdit;
    btn_descobrir: TButton;
    procedure btn_descobrirClick(Sender: TObject);
  private
    procedure EntreOsValores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.EntreOsValores;
var
  xnum1 : Integer;

  begin
    xnum1 := StrToInt(edt_num.text);

    if (xnum1>100) and (xnum1<200) then
      showmessage('Est� entre 100 e 200')

    else
      showmessage('N�o est� entre 100 e 200');

  end;


procedure TForm1.btn_descobrirClick(Sender: TObject);
begin
  EntreOsValores;
end;

end.
