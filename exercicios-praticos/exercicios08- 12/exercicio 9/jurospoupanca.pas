unit jurospoupanca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt_val_depositado: TEdit;
    btn_calcular: TButton;
    Label1: TLabel;
    label_resultado: TLabel;
    Label2: TLabel;
    edt_meses: TEdit;
    procedure btn_calcularClick(Sender: TObject);
  private
    procedure Rendimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.Rendimento;
var
  xvalorDepositado, xvalorRendimento, xResultado, xtempo: Double;

begin
  const xValorJuros = 0.0007;

  xvalorDepositado := StrToFLoat(edt_val_depositado.Text);
  xtempo           := StrToFloat(edt_meses.Text);
  xvalorRendimento := (xvalordepositado * xValorJuros)*xtempo;

  xResultado       := xValorRendimento + xValorDepositado;

  label_resultado.Caption := 'Seu valor com rendimento ser� de R$' + FormatFloat( '#,##0.00' , xresultado)
                            + ' ao final do per�odo';

end;

procedure TForm1.btn_calcularClick(Sender: TObject);
begin
  Rendimento
end;

end.
