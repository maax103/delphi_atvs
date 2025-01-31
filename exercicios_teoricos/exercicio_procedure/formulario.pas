unit formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DateUtils;

type
    TForm1 = class(TForm)
    btn_procedure: TButton;
    btn_function: TButton;
    btn_par_ref: TButton;
    btn_var_const: TButton;
    btn_array: TButton;
    btn_array_variant: TButton;
    btn_format: TButton;
    btn_data: TButton;
    btn_sobrecarga: TButton;
    btn_par_def: TButton;
    btn_dec_forw: TButton;
    procedure btn_procedureClick(Sender: TObject);
    procedure btn_functionClick(Sender: TObject);
    procedure btn_par_refClick(Sender: TObject);
    procedure btn_var_constClick(Sender: TObject);
    procedure btn_arrayClick(Sender: TObject);
    procedure btn_array_variantClick(Sender: TObject);
    procedure btn_formatClick(Sender: TObject);
    procedure btn_dataClick(Sender: TObject);
    procedure btn_sobrecargaClick(Sender: TObject);
    procedure btn_par_defClick(Sender: TObject);
    procedure btn_dec_forwClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{=========================FUN��ES E PROCEDURES==========================}

//isso aqui � uma procedure
procedure OlaMundo;
begin
  showmessage('Ol� Mundo')
end;


//isso aqui � uma function
function RetornarNomeSobrenome: String;
begin
  Result := 'Aline Scholl'
end;


procedure DoubleTheValue(var Value:Integer);
begin
  Value := Value *2;
end;


function DoubleTheValue2(const Value: Integer):Integer;
begin
  //Value := Value * 2; compiler error
  Result := Value;
end;


function Sum(const A: Array of Integer): Integer;
var
  I: Integer;
begin
  result := 0;

  for i := Low(A) to High(A) do
    Result := Result +A[i];
end;


function Min(A, B :Integer):Integer; overload;
begin
   Result := A;
   if B < A then
    Result := B;
end;


function Min(A, B: Double):Double; overload;
begin
  Result := A;
  if B < A then
    Result := B;
end;


function Min(A, B :Extended):Extended; overload;
begin
  Result:= A;
  if B < A then
    Result := B;
end;


procedure NewMessage(aMsg: String; aCaption : String = 'Message'; aSeparator: String = SLineBreak);
var
  xMensagem : String;

begin
  xMensagem := aCaption;
  xMensagem := xMensagem + ': ';
  xMensagem := xMensagem + AMsg;
  xMensagem := xMensagem + aSeparator;

  ShowMessage(xMensagem);

end;

procedure Hello; Forward;
procedure DoubleHello; Forward;

procedure Hello;
  begin
    if Messagedlg('Do You want a double message?', mtConfirmation,
                  [mbYes, mbNo], 0) = mrYes then DoubleHello
    else
      ShowMessage('Hello');
  end;

procedure DoubleHello;
begin
  Hello;
  Hello
end;

{===============BOT�ES COM SUAS FUN��ES PARA O CLIQUE===================}


procedure TForm1.btn_var_constClick(Sender: TObject);
var
  x:Integer;
begin
  x := 10;
  DoubleTheValue2(x);
  ShowmEssage(x.ToString);
end;


procedure TForm1.btn_arrayClick(Sender: TObject);
var
  xSoma : Integer;
begin
   xSoma :=  Sum([1, 2, 3]);

   ShowMessage(xSoma.ToString);
end;


procedure TForm1.btn_array_variantClick(Sender: TObject);
var
  xNum1 : Integer;
  xNum2 : Double;
begin
  xNum1 := 20;
  xNum2 := 200;

  ShowMessage(
      Format('Total do caixa � de' + #13#10 + 'R$ %d' + ',00',[xNum1]));

  ShowMessage(
      Format('Ol� %s, seu saldo � ' + #13#10 + 'R$ %f', ['Aline', xNum2]))
end;


procedure TForm1.btn_dataClick(Sender: TObject);
begin
  var myDate : TDateTime;

  myDate := EncodeDateTime(2000, 6, 3, 1, 2, 3, 4);
   ShowMessage('              d/m/y = '+
              FormatDateTime('d/m/y', myDate));

  ShowMessage('           dd/mm/yy = '+
              FormatDateTime('dd/mm/yy', myDate));

  ShowMessage('  ddd d of mmm yyyy = '+
              FormatDateTime('ddd d of mmm yyyy', myDate));

  ShowMessage('dddd d of mmmm yyyy = '+
              FormatDateTime('dddd d of mmmm yyyy', myDate));

  ShowMessage('              ddddd = '+
              FormatDateTime('ddddd', myDate));

  ShowMessage('             dddddd = '+
              FormatDateTime('dddddd', myDate));

  ShowMessage('                  c = '+
              FormatDateTime('c', myDate));
  ShowMessage('')
end;



procedure TForm1.btn_procedureClick(Sender: TObject);
var
  xNomeSobrenome : String;

begin
  //xNomeSobrenome := RetornarNomeSobrenome;
  //ShowMessage(xNomeSobrenome) tamb�m funciona
  xNomeSobrenome := ('Aline Scholl');
  ShowMessage(xNomeSobrenome)
end;


procedure TForm1.btn_sobrecargaClick(Sender: TObject);
var
  xNum1, xNum2: Integer;
  xNum3, xNum4: Double;
  xNum5, xNum6: Extended;
begin
  xNum1 := 1; xNum2 := 2;
  xNum3 := 1; xNum4 := 2;
  xNum5 := 1; xNum6 := 2;

  Min(xNum1, xNum2);
  Min(xNum3, xNum4);
  Min(xNum5, xNum6);

  showmessage(Min(xNum1,xNum2).ToString);
  showmessage(Min(xNum3,xNum4).ToString);
  showmessage(Min(xNum5,xNum6).ToString);
end;


procedure TForm1.btn_formatClick(Sender: TObject);
var
  Text:string;

begin
  ShowMessage(Format('%s', ['Aline']));

  ShowMessage(Format('string = %s', ['Aline']));
  ShowMessage(' ');

  ShowMessage(Format('Decimal = %d', [-123]));
  ShowMessage(Format('Exponent = %e', [12345.65]));
  ShowMessage(Format('Fixed = %f', [12345.678]));
  ShowMessage(Format('General = %g', [12345.678]));
  ShowMessage(Format('Number = %n', [12345.678]));
  ShowMessage(Format('Money = %m', [12345.678]));
  ShowMessage(Format('Pointer = %p', [addr(text)]));
  ShowMessage(Format('String = %s', ['Aline']));
  ShowMessage(Format('Unsigned decimal = %u', [123]));
  ShowMessage(Format('Hexadecimal = %x', [140]));
end;


procedure TForm1.btn_functionClick(Sender: TObject);
begin
  OlaMundo;
end;


procedure TForm1.btn_par_refClick(Sender: TObject);
var
  x:Integer;
begin
   x := 10;
   DoubleTheValue(x);
   ShowMessage(x.ToString);
end;


procedure TForm1.btn_par_defClick(Sender: TObject);
begin
  NewMessage('Algo Deu Errado aqui!');
  NewMessage('Algo Deu errado', 'ATEN��O');
  NewMessage('Ol�', 'Mensagem', '--');
end;


procedure TForm1.btn_dec_forwClick(Sender: TObject);
begin
  DoubleHello;
end;


end.
