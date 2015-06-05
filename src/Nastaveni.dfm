object F_Options: TF_Options
  Left = 717
  Top = 545
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Nastaven'#237
  ClientHeight = 183
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC_Options: TPageControl
    Left = 0
    Top = 0
    Width = 301
    Height = 183
    ActivePage = TS_Konzole
    Align = alClient
    TabOrder = 0
    OnChange = PC_OptionsChange
    object TS_Hraci: TTabSheet
      Caption = 'Hr'#225#269'i'
      object LV_Hrac: TListView
        Left = 0
        Top = 0
        Width = 293
        Height = 155
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            Width = 25
          end
          item
            Caption = 'N'#225'zev hr'#225#269'e'
            Width = 150
          end
          item
            Alignment = taCenter
            Caption = 'Barva hr'#225#269'e'
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnCustomDrawItem = LV_HracCustomDrawItem
        OnDblClick = LV_HracDblClick
      end
    end
    object TS_Rychlost: TTabSheet
      Caption = 'Rychlost'
      ImageIndex = 1
      object CB_Rychlost: TComboBox
        Left = 72
        Top = 64
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CB_RychlostChange
        Items.Strings = (
          '1x'
          '2x'
          '3x'
          '4x'
          '5x')
      end
    end
    object TS_Konzole: TTabSheet
      Caption = 'Konzole'
      ImageIndex = 2
      object E_Konzole: TEdit
        Left = 0
        Top = 128
        Width = 209
        Height = 21
        TabOrder = 0
        OnKeyPress = E_KonzoleKeyPress
      end
      object M_Konzole: TMemo
        Left = 0
        Top = 0
        Width = 293
        Height = 121
        Align = alTop
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object B_Apply: TButton
        Left = 216
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Pou'#382#237't'
        TabOrder = 2
        OnClick = B_ApplyClick
      end
    end
  end
end
