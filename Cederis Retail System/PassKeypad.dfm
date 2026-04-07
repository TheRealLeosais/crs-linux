object Form1: TForm1
  Left = 203
  Top = 89
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 375
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poDesigned
  OnActivate = FormActivate
  TextHeight = 15
  object btnNum1: TButton
    Left = 0
    Top = 225
    Width = 75
    Height = 75
    Caption = '1'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnNum1Click
  end
  object btnNum2: TButton
    Left = 75
    Top = 225
    Width = 75
    Height = 75
    Caption = '2'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnNum2Click
  end
  object btnNum3: TButton
    Left = 150
    Top = 225
    Width = 75
    Height = 75
    Caption = '3'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnNum3Click
  end
  object btnNum4: TButton
    Left = 0
    Top = 150
    Width = 75
    Height = 75
    Caption = '4'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnNum4Click
  end
  object btnNum5: TButton
    Left = 75
    Top = 150
    Width = 75
    Height = 75
    Caption = '5'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnNum5Click
  end
  object btnNum6: TButton
    Left = 150
    Top = 150
    Width = 75
    Height = 75
    Caption = '6'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnNum6Click
  end
  object btnNum7: TButton
    Left = 0
    Top = 75
    Width = 75
    Height = 75
    Caption = '7'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnNum7Click
  end
  object btnNum8: TButton
    Left = 75
    Top = 75
    Width = 75
    Height = 75
    Caption = '8'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnNum8Click
  end
  object btnNum9: TButton
    Left = 150
    Top = 75
    Width = 75
    Height = 75
    Caption = '9'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnNum9Click
  end
  object btnNum0: TButton
    Left = 75
    Top = 300
    Width = 75
    Height = 75
    Caption = '0'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnNum0Click
  end
  object btnNumYes: TButton
    Left = 150
    Top = 300
    Width = 75
    Height = 75
    Caption = #61692
    Enabled = False
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clLime
    Font.Height = -53
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnNumYesClick
  end
  object btnNumNo: TButton
    Left = 0
    Top = 300
    Width = 75
    Height = 75
    Caption = #215
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -64
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnNumNoClick
  end
  object pnlScreen: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 75
    Color = clBlack
    ParentBackground = False
    TabOrder = 12
    object lblScreen: TLabel
      Left = 1
      Top = 1
      Width = 223
      Height = 73
      Align = alClient
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -60
      Font.Name = 'Calibri'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 14
    end
  end
  object tmrClock: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrClockTimer
    Left = 192
  end
end
