unit calcular_conta_luz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TTipo = (tpResidencia, tpComercio, tpIndustria, tpFazenda) ;
    TForm1 = class(TForm)
    Label1: TLabel;
    edt_qtd_kw: TEdit;
    btnCalcular: TButton;
    rgroupTipo: TRadioGroup;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure calcularValorLuz;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.calcularValorLuz;
var
  xKwGasto, xResultado : double;
const
  CTAXA_RESIDENCIA = 0.6;
  CTAXA_GASTO = 0.48;
  CTAXA_INDUSTRIA = 1.29;
  CTAXA_FAZENDA = 2.18;

  begin
  xKwGasto := StrToFloatDef(edt_qtd_kw.Text, 0);
  lblResultado.Caption := '';
  if not (xKwGasto > 0) then Exit;
  

    case TTipo(rgroupTipo.ItemIndex) of
      tpResidencia:
      begin
        xResultado := xKwGasto * CTAXA_RESIDENCIA;
      end;

      tpComercio:
      begin
        xResultado := xKwGasto * CTAXA_GASTO;
      end;

      tpIndustria:
      begin
        xResultado := xKwGasto * CTAXA_INDUSTRIA;
      end;

      tpFazenda:
      begin
        xResultado := xKwGasto * CTAXA_FAZENDA;
      end;

  end;
  lblResultado.Caption := 'Voc� pagar� R$: ' +
                          FormatFloat('###,##0.00', xResultado)
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
  C_ENTER = '13';
begin

  if Key.ToString = C_ENTER then
  begin
    calcularValorLuz;
  end
end;

procedure TForm1.btnCalcularClick(Sender: TObject);
begin
  calcularValorLuz;
end;

end.
