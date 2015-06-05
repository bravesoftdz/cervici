object F_GamerData: TF_GamerData
  Left = 268
  Top = 540
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Data hr'#225#269'e'
  ClientHeight = 193
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object L_Gamer1: TLabel
    Left = 8
    Top = 0
    Width = 58
    Height = 13
    Caption = 'Nick hr'#225#269'e :'
  end
  object L_Gamer2: TLabel
    Left = 8
    Top = 48
    Width = 64
    Height = 13
    Caption = 'Barva hr'#225#269'e :'
  end
  object L_Gamer3: TLabel
    Left = 8
    Top = 96
    Width = 91
    Height = 13
    Caption = 'Startovn'#237' pozice x :'
  end
  object L_Gamer4: TLabel
    Left = 8
    Top = 128
    Width = 91
    Height = 13
    Caption = 'Startovn'#237' pozice y :'
  end
  object E_Nazev: TEdit
    Left = 8
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object CB_Barva: TColorBox
    Left = 8
    Top = 64
    Width = 225
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
  end
  object B_SaveData: TButton
    Left = 160
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Pou'#382#237't'
    TabOrder = 2
    OnClick = B_SaveDataClick
  end
  object E_X: TEdit
    Left = 168
    Top = 96
    Width = 65
    Height = 21
    MaxLength = 4
    TabOrder = 3
    OnKeyPress = E_XKeyPress
  end
  object E_Y: TEdit
    Left = 168
    Top = 128
    Width = 65
    Height = 21
    MaxLength = 4
    TabOrder = 4
    OnKeyPress = E_XKeyPress
  end
  object B_Storno: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Storno'
    TabOrder = 5
    OnClick = B_StornoClick
  end
end
