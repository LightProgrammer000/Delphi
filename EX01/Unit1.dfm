object FrmLem: TFrmLem
  Left = 1038
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Lembrete'
  ClientHeight = 210
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblMen: TLabel
    Left = 43
    Top = 16
    Width = 3
    Height = 13
    Alignment = taCenter
  end
  object btnMen: TButton
    Left = 40
    Top = 88
    Width = 97
    Height = 41
    Cursor = crHandPoint
    Caption = '&Mensagem'
    TabOrder = 0
    OnClick = btnMenClick
  end
  object btnAlt: TButton
    Left = 136
    Top = 152
    Width = 97
    Height = 41
    Cursor = crMultiDrag
    Caption = '&Alterar'
    TabOrder = 1
    OnClick = btnAltClick
  end
end
