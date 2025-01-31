unit numporextenso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TExtenso = (nUm, nDois, nTres, nQuatro, nCinco);

    TForm1 = class(TForm)
    edt_num: TEdit;
    btn_mostrar: TButton;
    lbl_resultado: TLabel;
    Label1: TLabel;
    procedure btn_mostrarClick(Sender: TObject);
  private
  procedure NumPorExtenso;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btn_mostrarClick(Sender: TObject);
begin
  NumPorExtenso
end;

procedure TForm1.NumPorExtenso;
var
  xNum : Integer;
begin
  xNum := (StrToIntDef(edt_num.Text, 0))-1;

  case TExtenso(xNum) of
    nUm:
    begin
      lbl_resultado.Caption := 'Um'
    end;
    nDois:
    begin
      lbl_resultado.Caption := 'Dois'
    end;
    nTres:
    begin
       lbl_resultado.Caption := 'Tr�s'
    end;
    nQuatro:
    begin
       lbl_resultado.Caption := 'Quatro'
    end;
    nCinco:
    begin
      lbl_resultado.Caption := 'Cinco'
    end;
    else
    begin
       lbl_resultado.Caption := 'N�mero inv�lido'
    end;
  end;

end;

end.
