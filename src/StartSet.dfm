object F_StartSet: TF_StartSet
  Left = 915
  Top = 329
  ActiveControl = E_Hr1_Name
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #268'erv'#237'ci'
  ClientHeight = 385
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0222222222220001111111111000000222222222222200011111111110000022
    2222222222200001111111110000022222222222222000011111111100002222
    2222222222000001111111111000222222222222200000011111111111002222
    2222222200000000111111111110222222222200000000001111111111102222
    2222000000000000011111111110222222200000000000000111111111102222
    2220000000000000001111111110222222222000000000000111111111102222
    2222220000000000111111111110222222222200000000001111111111102222
    2222222000000001111111111100222222222220000000011111111110000222
    2222222000000001111111110000002222222220000000001111111100000002
    2222222000000000111111110000000222222222000000001111111100000002
    2222222200000000111111111000000200000002000000001000000010000002
    0222220200000000101111101000000222000222000000001110001110000002
    2200022200000000111000111000000222222222000000001111111110000002
    0002000200000000100010001000000200020002000000001000100010000002
    0002000200000000100010001000000222222222000000001111111110000000
    000000000000000000000000000000000000000000000000000000000000F800
    E007E000E007C001E00F8001E00F0003E0070007E003000FF001003FF00100FF
    F80101FFF80101FFFC01007FF801003FF001003FF001001FE003001FE007801F
    E00FC01FF00FE01FF00FE00FF00FE00FF007E00FF007E00FF007E00FF007E00F
    F007E00FF007E00FF007E00FF007E00FF007E00FF007FFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object B_Start: TButton
    Left = 128
    Top = 344
    Width = 153
    Height = 33
    Caption = 'Start'
    TabOrder = 1
    OnClick = B_StartClick
  end
  object GB_Hraci: TGroupBox
    Left = 8
    Top = 192
    Width = 393
    Height = 145
    Caption = ' Hr'#225#269'i '
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 86
      Height = 13
      Caption = 'Rychlost '#269'erv'#237'k'#367' :'
    end
    object GB_Hrac1: TGroupBox
      Left = 8
      Top = 16
      Width = 185
      Height = 89
      Caption = ' Hr'#225#269' 1 '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Nick :'
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 34
        Height = 13
        Caption = 'Barva :'
      end
      object E_Hr1_Name: TEdit
        Left = 56
        Top = 20
        Width = 121
        Height = 21
        MaxLength = 10
        TabOrder = 0
        Text = '1'
      end
      object CB_Hr1Col: TColorBox
        Left = 56
        Top = 56
        Width = 121
        Height = 22
        Selected = clRed
        ItemHeight = 16
        TabOrder = 1
      end
    end
    object GB_Hrac2: TGroupBox
      Left = 200
      Top = 16
      Width = 185
      Height = 89
      Caption = ' Hr'#225#269' 2 '
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Nick :'
      end
      object Label4: TLabel
        Left = 8
        Top = 56
        Width = 34
        Height = 13
        Caption = 'Barva :'
      end
      object E_Hr2_Name: TEdit
        Left = 56
        Top = 20
        Width = 121
        Height = 21
        MaxLength = 10
        TabOrder = 0
        Text = '2'
      end
      object CB_Hr2Col: TColorBox
        Left = 56
        Top = 56
        Width = 121
        Height = 22
        Selected = clLime
        ItemHeight = 16
        TabOrder = 1
      end
    end
    object CB_Rychlost: TComboBox
      Left = 208
      Top = 112
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 2
      Text = '3x'
      Items.Strings = (
        '1x'
        '2x'
        '3x'
        '4x'
        '5x')
    end
  end
  object M_Info: TMemo
    Left = 8
    Top = 8
    Width = 393
    Height = 73
    Alignment = taCenter
    Lines.Strings = (
      'V'#237'tejte ve h'#345'e '#269'erv'#237'c'#237' 2.4.'
      ''
      
        'C'#237'lem hry je vyv'#225'znout '#382'iv'#253' a nechat druh'#233'ho '#269'erva narazit bu'#271' d' +
        'o sv'#233' '
      'trajektorie, nebo do jeho vlastn'#237'.')
    ReadOnly = True
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 88
    Width = 393
    Height = 97
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Ovl'#225'd'#225'n'#237' hry :'
      'Hr'#225#269' 1 : Doleva    - kl'#225'vesa "A"'
      '         Doprava   - kl'#225'vesa "D"'
      'Hr'#225#269' 2 : Doleva    - '#353'ipka vlevo'
      '         Doprava   - '#353'ipka vpravo')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
