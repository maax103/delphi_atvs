object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 480
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 24
    Width = 270
    Height = 18
    Caption = 'Lista com lucro ou Prejuizo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object memo_listagem: TMemo
    Left = 88
    Top = 64
    Width = 241
    Height = 313
    TabOrder = 0
  end
  object btn_cadastrar: TButton
    Left = 88
    Top = 392
    Width = 113
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btn_cadastrarClick
  end
  object btn_listar: TButton
    Left = 216
    Top = 392
    Width = 113
    Height = 25
    Caption = 'Listar'
    TabOrder = 2
    OnClick = btn_listarClick
  end
end
