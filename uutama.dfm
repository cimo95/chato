object _0: T_0
  Left = 580
  Top = 93
  BorderIcons = [biSystemMenu]
  Caption = 'Chato - Untitled'
  ClientHeight = 518
  ClientWidth = 507
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = _8
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    507
    518)
  PixelsPerInch = 96
  TextHeight = 13
  object _5: TImage
    Left = 8
    Top = 8
    Width = 50
    Height = 50
    Stretch = True
  end
  object _6: TLabel
    Left = 64
    Top = 14
    Width = 100
    Height = 23
    Caption = '<Header>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object _7: TLabel
    Left = 64
    Top = 38
    Width = 70
    Height = 13
    Caption = '<sub header>'
  end
  object _d: TRichEdit
    Left = 8
    Top = 62
    Width = 479
    Height = 297
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    Zoom = 100
  end
  object _2: TGroupBox
    Left = 8
    Top = 365
    Width = 479
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Your'#39's Panel'
    TabOrder = 2
    object _3: TScrollBox
      Left = 2
      Top = 15
      Width = 475
      Height = 88
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object _4: TListBox
        Left = 0
        Top = 0
        Width = 475
        Height = 88
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object _1: TButton
    Left = 415
    Top = 480
    Width = 75
    Height = 25
    Anchors = [akTop]
    Caption = 'Send'
    TabOrder = 3
    OnClick = _1Click
  end
  object _f: TRichEdit
    Left = 272
    Top = 192
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    WordWrap = False
    Zoom = 100
  end
  object _8: TMainMenu
    Left = 144
    Top = 128
    object _9: TMenuItem
      Caption = 'Chat'
    end
    object _a: TMenuItem
      Caption = 'Contact'
    end
    object _b: TMenuItem
      Caption = 'Setting'
    end
    object _c: TMenuItem
      Caption = 'Help'
    end
  end
  object _e: TTimer
    Enabled = False
    Left = 144
    Top = 184
  end
end
