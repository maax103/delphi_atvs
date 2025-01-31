unit UfrmCalculadora2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
//todo enumerado � baseado no indice 0, ent�o a sequencia fica = 0,1,2,3
  TOperadores = (opSomar, opSubtrair, opMultiplicar,
                  opDividir, opResto,opDivisaoInteira);{essa � a sintaxe de
                                                        declarar uma lista de enumerados}

  Tfrmcalculadora2 = class(TForm)
    operador: TComboBox;
    Label1: TLabel;
    bt_calcular: TButton;
    num1: TEdit;
    num2: TEdit;
    Label2: TLabel;
    resultado: TEdit;
    procedure bt_calcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcalculadora2: Tfrmcalculadora2;

implementation

{$R *.dfm}

procedure Tfrmcalculadora2.bt_calcularClick(Sender: TObject);

var
  xNum1: Integer;
  xNum2:Integer;
  xResultado:Integer;
begin

  try
       xNum1 := StrToInt(num1.Text);
  except
      on E: Exception do
        raise Exception.Create('Digite apenas n�meros');
  //mensagem personalizada de erro
  end;

  xNum2 := StrToIntDef(num2.Text, 0);

  xResultado := 0;//sempre iniciar as variaveis com valor 0 q serao usadas p resultado

  case TOperadores(operador.ItemIndex) of
    opSomar:
    begin
       xResultado := xNum1 + xNum2;
    end;

    opSubtrair:
    begin
      xResultado := xNum1 - xNum2;
    end;

    opMultiplicar:
    begin
       xResultado := xNum1 * xNum2;
    end;

    opDividir:
    begin
      xResultado := Trunc(xNum1 / xNum2);//trunc para nao retornar numero float
    end;

    opResto:
    begin
      xResultado := xNum1 mod xNum2;
    end;

    opDivisaoInteira:
    begin
      xResultado:= xNum1 div xNum2;
    end;
  end;
  resultado.Text := IntToStr(xResultado);
end;

end.
