object Form1: TForm1
  Left = 534
  Top = 174
  Width = 775
  Height = 624
  BorderIcons = [biSystemMenu]
  Caption = #268'erv'#237'ci'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MM_1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object I_Program: TImage
    Left = 0
    Top = 0
    Width = 767
    Height = 570
    Align = alClient
  end
  object MM_1: TMainMenu
    Left = 8
    Top = 536
    object PM_Game: TMenuItem
      Caption = 'Hra'
      object PM_Go: TMenuItem
        Caption = 'Start'
        ShortCut = 16467
        OnClick = PM_GoClick
      end
      object PM_Pause: TMenuItem
        Caption = 'Pozastavit'
        Enabled = False
        ShortCut = 16464
        OnClick = PM_PauseClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PM_EndKolo: TMenuItem
        Caption = 'Konec kola'
        OnClick = PM_EndKoloClick
      end
      object PM_Exit: TMenuItem
        Caption = 'Konec aplikace'
        OnClick = PM_ExitClick
      end
    end
    object M_Options: TMenuItem
      Caption = 'Nastaven'#237
      object PM_Gamers: TMenuItem
        Caption = 'Nastaven'#237
        OnClick = PM_GamersClick
      end
      object PM_DeleteObrz: TMenuItem
        Caption = 'Smazat zobrazen'#237
        Visible = False
        OnClick = PM_DeleteObrzClick
      end
    end
  end
  object T_Function: TTimer
    Enabled = False
    Interval = 10
    OnTimer = T_FunctionTimer
    Left = 40
    Top = 536
  end
  object T_Odpocet: TTimer
    Enabled = False
    OnTimer = T_OdpocetTimer
    Left = 72
    Top = 536
  end
end
