unit PassKeypad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnNum1: TButton;
    btnNum2: TButton;
    btnNum3: TButton;
    btnNum4: TButton;
    btnNum5: TButton;
    btnNum6: TButton;
    btnNum7: TButton;
    btnNum8: TButton;
    btnNum9: TButton;
    btnNum0: TButton;
    btnNumYes: TButton;
    btnNumNo: TButton;
    tmrClock: TTimer;
    lblScreen: TLabel;
    pnlScreen: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure btnNum1Click(Sender: TObject);
    procedure btnNum2Click(Sender: TObject);
    procedure btnNum3Click(Sender: TObject);
    procedure btnNum4Click(Sender: TObject);
    procedure btnNum5Click(Sender: TObject);
    procedure btnNum6Click(Sender: TObject);
    procedure btnNum7Click(Sender: TObject);
    procedure btnNum8Click(Sender: TObject);
    procedure btnNum9Click(Sender: TObject);
    procedure btnNum0Click(Sender: TObject);
    procedure btnNumNoClick(Sender: TObject);
    procedure btnNumYesClick(Sender: TObject);
  private
    { Private declarations }
    procedure ButtonPress(cNum: char);
  public
    { Public declarations }
    sDataBuffer, sSentMessage: string;
    bKeypadBusy, bMainBusy: boolean;
  end;

var
  frmPassKeypad: TForm1;
  iDigitsSet: integer = 0;
  iDigitsEntered: integer = 0;
  sPin: string = '';
  bPinDone: boolean = false;
  bRanPin: boolean = false;
  tf: TextFile;

implementation

{$R *.dfm}

procedure TForm1.btnNum0Click(Sender: TObject);
begin
  ButtonPress('0');
end;

procedure TForm1.btnNum1Click(Sender: TObject);
begin
  ButtonPress('1');
end;

procedure TForm1.btnNum2Click(Sender: TObject);
begin
  ButtonPress('2');
end;

procedure TForm1.btnNum3Click(Sender: TObject);
begin
  ButtonPress('3');
end;

procedure TForm1.btnNum4Click(Sender: TObject);
begin
  ButtonPress('4');
end;

procedure TForm1.btnNum5Click(Sender: TObject);
begin
  ButtonPress('5');
end;

procedure TForm1.btnNum6Click(Sender: TObject);
begin
  ButtonPress('6');
end;

procedure TForm1.btnNum7Click(Sender: TObject);
begin
  ButtonPress('7');
end;

procedure TForm1.btnNum8Click(Sender: TObject);
begin
  ButtonPress('8');
end;

procedure TForm1.btnNum9Click(Sender: TObject);
begin
  ButtonPress('9');
end;

procedure TForm1.btnNumNoClick(Sender: TObject);
begin
  btnNum1.Enabled := false;
  btnNum2.Enabled := false;
  btnNum3.Enabled := false;
  btnNum4.Enabled := false;
  btnNum5.Enabled := false;
  btnNum6.Enabled := false;
  btnNum7.Enabled := false;
  btnNum8.Enabled := false;
  btnNum9.Enabled := false;
  btnNum0.Enabled := false;
  btnNumYes.Enabled := false;
  btnNumNo.Enabled := false;

  bKeypadBusy := true;
  sDataBuffer := 'USR-CANCEL';
  bKeypadBusy := false;
end;

procedure TForm1.btnNumYesClick(Sender: TObject);
begin
  bPinDone := true;
  btnNum1.Enabled := false;
  btnNum2.Enabled := false;
  btnNum3.Enabled := false;
  btnNum4.Enabled := false;
  btnNum5.Enabled := false;
  btnNum6.Enabled := false;
  btnNum7.Enabled := false;
  btnNum8.Enabled := false;
  btnNum9.Enabled := false;
  btnNum0.Enabled := false;
  btnNumYes.Enabled := false;
  btnNumNo.Enabled := false;
end;

procedure TForm1.ButtonPress(cNum: char);
begin
  sPin := sPin + cNum;
  iDigitsEntered := iDigitsEntered + 1;

  if iDigitsEntered = iDigitsSet then
    begin
      btnNum1.Enabled := false;
      btnNum2.Enabled := false;
      btnNum3.Enabled := false;
      btnNum4.Enabled := false;
      btnNum5.Enabled := false;
      btnNum6.Enabled := false;
      btnNum7.Enabled := false;
      btnNum8.Enabled := false;
      btnNum9.Enabled := false;
      btnNum0.Enabled := false;
      btnNumYes.Enabled := true;
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  assignfile(tf, 'klog.txt');
  rewrite(tf);

  btnNum1.Enabled := true;
  btnNum2.Enabled := true;
  btnNum3.Enabled := true;
  btnNum4.Enabled := true;
  btnNum5.Enabled := true;
  btnNum6.Enabled := true;
  btnNum7.Enabled := true;
  btnNum8.Enabled := true;
  btnNum9.Enabled := true;
  btnNum0.Enabled := true;
  btnNumNo.Enabled := true;
  sDataBuffer := '';
  bMainBusy := false;
  bKeypadBusy := true;
  sDataBuffer := 'REQ-MESS';
  sSentMessage := sDataBuffer;
  writeln(tf, sDataBuffer);
  bKeypadBusy := false;
end;

procedure TForm1.tmrClockTimer(Sender: TObject);
var
  iDigits: integer;
  sMessage: string;
begin
  if (sSentMessage = 'REQ-MESS') and (sDataBuffer <> sSentMessage) and (bMainBusy = false) and (bKeypadBusy = false) then
    begin
      sMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      lblScreen.Caption := sMessage;
      bKeypadBusy := true;
      sDataBuffer := 'REQ-MAX-DIGITS';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
    end;

  if (sSentMessage = 'REQ-MAX-DIGITS') and (sDataBuffer <> sSentMessage) and (bMainBusy = false) and (bKeypadBusy = false) and (trystrtoint(sDataBuffer, iDigits) = true) then
    begin
      iDigits := strtoint(sDataBuffer);
      writeln(tf, sDataBuffer);
      iDigitsSet := iDigits;
      bKeypadBusy := true;
      sDataBuffer := 'KACK';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
      bRanPin := false;
    end;

  if (bPinDone = true) and (bRanPin = false) then
    begin
      bKeypadBusy := true;
      sDataBuffer := 'PIN-RDY';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
      bRanPin := true;
    end;

  if (sSentMessage = 'PIN-RDY') and (sDataBuffer = 'MACK') and (bMainBusy = false) and (bPinDone = true) then
    begin
      writeln(tf, sDataBuffer);
      bKeypadBusy := true;
      sDataBuffer := 'KACK';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
    end;

  if (sDataBuffer = 'REQ-PIN') and (bMainBusy = false) then
    begin
      writeln(tf, sDataBuffer);
      bKeypadBusy := true;
      sDataBuffer := sPin;
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
      bPinDone := false;
    end;

  if (sDataBuffer = 'MACK') and (sSentMessage = sPin) and (bMainBusy = false) then
    begin
      writeln(tf, sDataBuffer);
      bKeypadBusy := true;
      sDataBuffer := 'KACK';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
    end;

  if (sDataBuffer = 'PIN-OK') and (bMainBusy = false) then
    begin
      writeln(tf, sDataBuffer);
      bKeypadBusy := true;
      sDataBuffer := 'KACK';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;
          ShowMessage('Pin OK');
    end;

  if (sDataBuffer = 'PIN-FAIL') and (bMainBusy = false) then
    begin
      writeln(tf, sDataBuffer);
      bKeypadBusy := true;
      sDataBuffer := 'KACK';
      sSentMessage := sDataBuffer;
      writeln(tf, sDataBuffer);
      bKeypadBusy := false;

      lblScreen.Caption := 'Pin Incorrect - Try Again';
      btnNum1.Enabled := true;
      btnNum2.Enabled := true;
      btnNum3.Enabled := true;
      btnNum4.Enabled := true;
      btnNum5.Enabled := true;
      btnNum6.Enabled := true;
      btnNum7.Enabled := true;
      btnNum8.Enabled := true;
      btnNum9.Enabled := true;
      btnNum0.Enabled := true;
      btnNumNo.Enabled := true;
    end;

  if (sDataBuffer = 'PRG-CANCEL') and (bMainBusy = false) then
    begin
      btnNum1.Enabled := false;
      btnNum2.Enabled := false;
      btnNum3.Enabled := false;
      btnNum4.Enabled := false;
      btnNum5.Enabled := false;
      btnNum6.Enabled := false;
      btnNum7.Enabled := false;
      btnNum8.Enabled := false;
      btnNum9.Enabled := false;
      btnNum0.Enabled := false;
      btnNumYes.Enabled := false;
      btnNumNo.Enabled := false;

      bKeypadBusy := true;
      sDataBuffer := 'CANCEL-KACK';
      sSentMessage := sDataBuffer;
      bKeypadBusy := false;
    end;

end;

end.
