object Form1: TForm1
  Left = 222
  Top = 162
  BorderStyle = bsToolWindow
  Caption = 'FindMacServer'
  ClientHeight = 77
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 0
    Top = 0
    Width = 261
    Height = 58
    Caption = #1057#1077#1088#1074#1077#1088' '#1084#1072#1082' '#1072#1076#1088#1077#1089#1086#1074'!'#13#10#1053#1045' '#1042#1067#1056#1059#1041#1040#1058#1068'!!!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object stat1: TStatusBar
    Left = 0
    Top = 58
    Width = 264
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object IdTCPServer1: TIdTCPServer
    Active = True
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 777
      end>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = IdTCPServer1Connect
    OnExecute = IdTCPServer1Execute
    OnDisconnect = IdTCPServer1Disconnect
    OnException = IdTCPServer1Exception
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 224
    Top = 24
  end
end
