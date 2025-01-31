unit comando_if_case;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TNivel = (estagiario, junior, senior, pleno);
    TForm1 = class(TForm)
    edt_caixa: TEdit;
    caixa_texto: TLabel;
    btn_if: TButton;
    btn_case: TButton;
    caixa_radio: TRadioGroup;
    procedure btn_caseClick(Sender: TObject);
    procedure btn_ifClick(Sender: TObject);

  private
  procedure QualMeuNiVel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

procedure ver_Nome(const xnome:String);

  begin
    if xnome = 'Aline' then
      showmessage('Sou Eu. Presente');
  end;

procedure TForm1.btn_caseClick(Sender: TObject);
begin
  QualMeuNivel
end;

procedure TForm1.btn_ifClick(Sender: TObject);
begin
ver_Nome(edt_caixa.text);
end;

procedure TForm1.QualMeuNiVel;
var
  mensagem : String;
  begin
    case TNivel(caixa_radio.itemindex) of

      estagiario:
      begin
        showmessage('Meu n�vel � estagi�rio')
      end;

      junior:
      begin
        showmessage('Meu n�vel � J�nior')
      end;

      senior:
      begin
        showmessage('Meu N�vel � S�nior')
      end;

      pleno:
      begin
        showmessage('Meu N�vel � Pleno')
      end;

    end;
  end;


{$R *.dfm}

end.
