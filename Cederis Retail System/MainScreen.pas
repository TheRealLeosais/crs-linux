unit MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ColorGrd, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.Buttons, PassKeypad;

type
  TfrmMain = class(TForm)
    pnlMainDisplay: TPanel;
    lblMainDisplay: TLabel;
    btnNumpad7: TButton;
    btnNumpad8: TButton;
    btnNumpad9: TButton;
    btnNumpad4: TButton;
    btnNumpad5: TButton;
    btnNumpad6: TButton;
    btnNumpad1: TButton;
    btnNumpad2: TButton;
    btnNumpad3: TButton;
    btnNumpad00: TButton;
    btnNumpadVoidLast: TButton;
    btnNumpadVoidSale: TButton;
    btnNumpad0: TButton;
    btnNumpadComma: TButton;
    btnNumpadEnter: TButton;
    btnNumpadAdd: TButton;
    pnlNumpad: TPanel;
    tmrUpdateScreen: TTimer;
    pnlSubDisplay: TPanel;
    lblSubDisplay: TLabel;
    pnlMainDisplayTitle: TPanel;
    pnlSubDisplayTitle: TPanel;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    tmrComms: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrUpdateScreenTimer(Sender: TObject);
    procedure btnNumpad0Click(Sender: TObject);
    procedure btnNumpadAddClick(Sender: TObject);
    procedure btnNumpad1Click(Sender: TObject);
    procedure btnNumpad00Click(Sender: TObject);
    procedure btnNumpadCommaClick(Sender: TObject);
    procedure btnNumpad2Click(Sender: TObject);
    procedure btnNumpad3Click(Sender: TObject);
    procedure btnNumpad4Click(Sender: TObject);
    procedure btnNumpad5Click(Sender: TObject);
    procedure btnNumpad6Click(Sender: TObject);
    procedure btnNumpad7Click(Sender: TObject);
    procedure btnNumpad8Click(Sender: TObject);
    procedure btnNumpad9Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNumpadVoidLastClick(Sender: TObject);
    procedure btnNumpadVoidSaleClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tmrCommsTimer(Sender: TObject);
  private
    { Private declarations }
    procedure WritingEvent(sSymbol: string);
    procedure WriteToBuffer(sBuffer: string);
    procedure BtnNumpadClick(Sender: TObject);
    procedure StartKeypad(iDigits: integer; sMessage: string);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  rTotalPrice: real = 0;
  rEnteredPrice: real = 0;
  sScreenOutput: string = '';
  sOutputBuffer: string = '';
  bWritingToBuffer: boolean = false;
  bUserInput: boolean = false;
  cUserConfirm: char = 'U';        // U = Undefined; Y = Yes; N = No
  iKeypadDigits: integer = 0;
  sKeypadMessage: string = '';
  sPinFromKeypad: string = '';
  tf: TextFile;

implementation

{$R *.dfm}

procedure TfrmMain.btnNumpad00Click(Sender: TObject);
begin
   WritingEvent('00');
end;

procedure TfrmMain.btnNumpad0Click(Sender: TObject);
begin
  WritingEvent('0');
end;

procedure TfrmMain.btnNumpad1Click(Sender: TObject);
begin
  WritingEvent('1');
end;

procedure TfrmMain.btnNumpad2Click(Sender: TObject);
begin
  WritingEvent('2');
end;

procedure TfrmMain.btnNumpad3Click(Sender: TObject);
begin
  WritingEvent('3');
end;

procedure TfrmMain.btnNumpad4Click(Sender: TObject);
begin
  WritingEvent('4');
end;

procedure TfrmMain.btnNumpad5Click(Sender: TObject);
begin
  WritingEvent('5');
end;

procedure TfrmMain.btnNumpad6Click(Sender: TObject);
begin
  WritingEvent('6');
end;

procedure TfrmMain.btnNumpad7Click(Sender: TObject);
begin
  WritingEvent('7');
end;

procedure TfrmMain.btnNumpad8Click(Sender: TObject);
begin
  WritingEvent('8');
end;

procedure TfrmMain.btnNumpad9Click(Sender: TObject);
begin
  WritingEvent('9');
end;

procedure TfrmMain.btnNumpadAddClick(Sender: TObject);
var
  sTemp, sTrunc, sFrac: string;
  rTest: real;
begin
  if sOutputBuffer = '' then
    begin
      ShowMessage('Please enter a value!');
      Exit;
    end;

  rTest := strtofloat(sOutputBuffer);
  if rTest = 0 then
    begin
      ShowMessage('Please enter a value!');
      Exit;
    end;

  sTemp := sOutputBuffer;

  if length(sTemp) = 1 then
    begin
      rEnteredPrice := strtofloat('0,0' + sTemp);
    end else
  if length(sTemp) = 2 then
    begin
      rEnteredPrice := strtofloat('0,' + sTemp);
    end else
  if (length(sTemp) > 2) and (pos(',', sTemp) = 0) then
    begin
      sFrac := copy(sTemp, length(sTemp) -1, length(sTemp));
      sTrunc := copy(sTemp, 1, length(sTemp) -2);
      sTemp := sTrunc + ',' + sFrac;
      rEnteredPrice := strtofloat(sTemp);
    end else
  if (length(sTemp) > 2) and (pos(',', sTemp) > 0) then
    begin
      rEnteredPrice := StrToFloat(sTemp);
    end;

  rTotalPrice := rTotalPrice + rEnteredPrice;
  bUserInput := false;
  lblMainDisplay.BiDiMode := bdLeftToRight;
  WriteToBuffer(FloatToStrF(rTotalPrice, ffCurrency, 10, 2));
  btnNumpadVoidLast.Enabled := true;
  btnNumpadVoidSale.Enabled := true;
end;

procedure TfrmMain.BtnNumpadClick(Sender: TObject);
begin
  WritingEvent((Sender as TButton).Caption);
end;

procedure TfrmMain.btnNumpadCommaClick(Sender: TObject);
begin
   WritingEvent(',');
end;

procedure TfrmMain.btnNumpadVoidLastClick(Sender: TObject);
begin
  rTotalPrice := rTotalPrice - rEnteredPrice;
  WriteToBuffer(FloatToStrF(rTotalPrice, ffCurrency, 10, 2));
  btnNumpadVoidLast.Enabled := false;
end;

procedure TfrmMain.btnNumpadVoidSaleClick(Sender: TObject);
begin
  if MessageDlg('Are You Sure?', TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      rTotalPrice := rTotalPrice - rTotalPrice;
      WriteToBuffer(FloatToStrF(rTotalPrice, ffCurrency, 10, 2));
      btnNumpadVoidSale.Enabled := false;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  SetBounds(0, 0, Screen.Width, Screen.Height);
  ShowInTaskBar := false;
  tmrUpdateScreen.Enabled := true;

  // Assign shared handler
  btnNumpad0.OnClick := BtnNumpadClick;
  btnNumpad1.OnClick := BtnNumpadClick;
  btnNumpad2.OnClick := BtnNumpadClick;
  btnNumpad3.OnClick := BtnNumpadClick;
  btnNumpad4.OnClick := BtnNumpadClick;
  btnNumpad5.OnClick := BtnNumpadClick;
  btnNumpad6.OnClick := BtnNumpadClick;
  btnNumpad7.OnClick := BtnNumpadClick;
  btnNumpad8.OnClick := BtnNumpadClick;
  btnNumpad9.OnClick := BtnNumpadClick;
  btnNumpad00.OnClick := BtnNumpadClick;
  btnNumpadComma.OnClick := BtnNumpadClick;

  AssignFile(tf, 'mlog.txt');
  Rewrite(tf);
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  btnNumpadAdd.SetFocus;
  case Key of
    '0': btnNumpad0.Click;
    '1': btnNumpad1.Click;
    '2': btnNumpad2.Click;
    '3': btnNumpad3.Click;
    '4': btnNumpad4.Click;
    '5': btnNumpad5.Click;
    '6': btnNumpad6.Click;
    '7': btnNumpad7.Click;
    '8': btnNumpad8.Click;
    '9': btnNumpad9.Click;
    '.': btnNumpadComma.Click;
    ',': btnNumpadComma.Click;
    #13: btnNumpadAdd.SetFocus;
  end;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  StartKeypad(4, 'Works')
end;

procedure TfrmMain.StartKeypad(iDigits: integer; sMessage: string);
begin
  frmPassKeypad.Visible := true;
  iKeypadDigits := iDigits;
  sKeypadMessage := sMessage;
  tmrComms.Enabled := true;
  frmPassKeypad.tmrClock.Enabled := true;
end;

procedure TfrmMain.tmrCommsTimer(Sender: TObject);
var sLastMessage: string; bPinReady: boolean;
begin
  if (frmPassKeypad.sDataBuffer = 'REQ-MESS') and (frmPassKeypad.bKeypadBusy = false) then
    begin
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := true;
      frmPassKeypad.sDataBuffer := sKeypadMessage;
      sLastMessage := frmPassKeypad.sDataBuffer;
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := false;
      bPinReady := false;
    end;

  if (frmPassKeypad.sDataBuffer = 'REQ-MAX-DIGITS') and (frmPassKeypad.bKeypadBusy = false) then
    begin
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := true;
      frmPassKeypad.sDataBuffer := inttostr(iKeypadDigits);
      sLastMessage := frmPassKeypad.sDataBuffer;
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := false;
    end;

  if (frmPassKeypad.sDataBuffer = 'PIN-RDY') and (frmPassKeypad.bKeypadBusy = false) then
    begin
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := true;
      frmPassKeypad.sDataBuffer := 'MACK';
      sLastMessage := frmPassKeypad.sDataBuffer;
      writeln(tf, frmPassKeypad.sDataBuffer);
      bPinReady := true;
      frmPassKeypad.bMainBusy := false;
    end;

  if (bPinReady = true) and (frmPassKeypad.sDataBuffer = 'KACK') and (frmPassKeypad.bKeypadBusy = false) then
    begin
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := true;
      frmPassKeypad.sDataBuffer := 'REQ-PIN';
      sLastMessage := frmPassKeypad.sDataBuffer;
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := false;
    end;

  if (sLastMessage = 'REQ-PIN') and (frmPassKeypad.sDataBuffer <> sLastMessage) and (frmPassKeypad.bKeypadBusy = false) then
    begin
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := true;
      sPinFromKeypad := frmPassKeypad.sDataBuffer;
      frmPassKeypad.sDataBuffer := 'MACK';
      sLastMessage := frmPassKeypad.sDataBuffer;
      writeln(tf, frmPassKeypad.sDataBuffer);
      frmPassKeypad.bMainBusy := false;
    end;

  // TESTING CODE
  if (sPinFromKeypad = '1234') and (frmPassKeypad.bKeypadBusy = false) then
    begin
      frmPassKeypad.bMainBusy := true;
      frmPassKeypad.sDataBuffer := 'PIN-OK';
      sLastMessage := frmPassKeypad.sDataBuffer;
      frmPassKeypad.bMainBusy := false;
      ShowMessage('Keypad Works!');
    end;

end;

procedure TfrmMain.tmrUpdateScreenTimer(Sender: TObject);
begin
  sScreenOutput := sOutputBuffer;
  lblMainDisplay.Caption := sScreenOutput;
end;

procedure TfrmMain.WriteToBuffer(sBuffer: string);
begin
  sOutputBuffer := sBuffer;
end;

procedure TfrmMain.WritingEvent(sSymbol: string);
begin
  if bUserInput = false then
    begin
      bUserInput := true;
      lblMainDisplay.BiDiMode := bdRightToLeft;
      sOutputBuffer := '';
    end;

  WriteToBuffer(sOutputBuffer + sSymbol);
end;

end.
