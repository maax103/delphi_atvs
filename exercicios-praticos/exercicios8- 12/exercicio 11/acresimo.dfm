object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
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
    Left = 136
    Top = 31
    Width = 149
    Height = 19
    Caption = 'Qual pre'#231'o de custo?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 95
    Width = 206
    Height = 19
    Caption = 'Qual ser'#225' a % de acr'#233'scimo?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object resultado: TLabel
    Left = 16
    Top = 223
    Width = 37
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edt_preco_custo: TEdit
    Left = 144
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edt_acrescimo: TEdit
    Left = 144
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn_calcular: TButton
    Left = 144
    Top = 176
    Width = 121
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btn_calcularClick
  end
end
