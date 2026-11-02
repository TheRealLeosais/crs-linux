unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
 StdCtrls, Grids;

type

 { TfrmMain }
 TfrmMain = class(TForm)

  lblBuildInfo: TLabel;
  pnlSTitle: TPanel;
  pnlMTitle: TPanel;
  pnlSub: TPanel;
  pnlMain: TPanel;

  pnlDisplay: TPanel;


  pnlNumpad: TPanel;

   btnNumpad0: TButton;
   btnNumpad00: TButton;
   btnNumpad1: TButton;
   btnNumpad2: TButton;
   btnNumpad3: TButton;
   btnNumpad4: TButton;
   btnNumpad5: TButton;
   btnNumpad6: TButton;
   btnNumpad7: TButton;
   btnNumpad8: TButton;
   btnNumpad9: TButton;
   btnNumpadAdd: TButton;
   btnNumpadEnter: TButton;
   btnNumpadComma: TButton;
   btnNumpadVoidLast: TButton;
   btnNumpadVoidSale: TButton;

  spbKey: TSpeedButton;
  stgItems: TStringGrid;

  tmrUpdateScreen: TTimer;

  procedure btnNumpad3Click(Sender: TObject);
  procedure btnNumpad00Click(Sender: TObject);
  procedure btnNumpad0Click(Sender: TObject);
  procedure btnNumpad1Click(Sender: TObject);
  procedure btnNumpad2Click(Sender: TObject);
  procedure btnNumpad4Click(Sender: TObject);
  procedure btnNumpad5Click(Sender: TObject);
  procedure btnNumpad6Click(Sender: TObject);
  procedure btnNumpad7Click(Sender: TObject);
  procedure btnNumpad8Click(Sender: TObject);
  procedure btnNumpad9Click(Sender: TObject);
  procedure btnNumpadAddClick(Sender: TObject);
  procedure btnNumpadCommaClick(Sender: TObject);
  procedure btnNumpadEnterClick(Sender: TObject);
  procedure btnNumpadVoidLastClick(Sender: TObject);
  procedure btnNumpadVoidSaleClick(Sender: TObject);

  procedure FormActivate(Sender: TObject);
  procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  procedure FormCreate(Sender: TObject);
  procedure FormKeyPress(Sender: TObject; var Key: char);

  procedure spbKeyClick(Sender: TObject);

 private

  procedure WriteMLog(sMSG: String);

 public

end;

var
 frmMain: TfrmMain;
 tfMLog: TextFile;
 bMLogOpen: Boolean;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);

var
 sVersion: String;

begin

 { Main Log file }
 bMLogOpen := False;
 WriteMLog('----- Main Form Log -----');
 WriteMLog('Cederis Retail System started.');

 { Build Information }
 sVersion := '26.11';
 lblBuildInfo.Caption := lblBuildInfo.Caption + ' ' + sVersion;

 // tmrUpdateScreen.Enabled := True;

end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);

begin

 WriteLn(tfMLog, '----- Log End -----');
 CloseFile(tfMLog);

 CloseAction := caFree;

end;

procedure TfrmMain.btnNumpad0Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('0 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad1Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('1 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad2Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('2 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad3Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('3 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad4Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('4 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad5Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('5 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad6Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('6 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad7Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('7 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad8Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('8 - But no feature yet!');

end;

procedure TfrmMain.btnNumpad9Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('9 - But no feature yet!');

end;

procedure TfrmMain.btnNumpadAddClick(Sender: TObject);

begin

 // Placeholder

 WriteMLog('Add - But no feature yet!');

end;

procedure TfrmMain.btnNumpadCommaClick(Sender: TObject);

begin

 // Placeholder

 WriteMLog(', - But no feature yet!');

end;

procedure TfrmMain.btnNumpadEnterClick(Sender: TObject);

begin

 // Placeholder

 WriteMLog('Enter - But no feature yet!');

end;

procedure TfrmMain.btnNumpadVoidLastClick(Sender: TObject);

begin

 // Placeholder

 if btnNumpadVoidLast.Enabled = False then
  begin

   Exit;

  end;

 WriteMLog('Void Last - But no feature yet!');

end;

procedure TfrmMain.btnNumpadVoidSaleClick(Sender: TObject);

begin

 // Placeholder

 if btnNumpadVoidSale.Enabled = False then
  begin

   Exit;

  end;

 WriteMLog('Void Sale - But no feature yet!');

end;

procedure TfrmMain.FormActivate(Sender: TObject);

begin

 btnNumpadAdd.SetFocus;

end;

procedure TfrmMain.btnNumpad00Click(Sender: TObject);

begin

 // Placeholder

 WriteMLog('00 - But no feature yet!');

end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: char);

begin

 CASE Key OF

  '0':
   begin

    btnNumpad0.Click;

   end;

  '*', 'q': // Variants for Numpad and WASD control
   begin

    btnNumpad00.Click;

   end;

  '1':
   begin;

    btnNumpad1.Click;

   end;

  '2':
   begin

    btnNumpad2.Click;

   end;

  '3':
   begin

    btnNumpad3.Click;

   end;

  '4':
   begin

    btnNumpad4.Click;

   end;

  '5':
   begin

    btnNumpad5.Click;

   end;

  '6':
   begin

    btnNumpad6.Click;

   end;

  '7':
   begin

    btnNumpad7.Click;

   end;

  '8':
   begin

    btnNumpad8.Click;

   end;

  '9':
   begin

    btnNumpad9.Click;

   end;

  '.', ',':
   begin

    btnNumpadComma.Click;

   end;

  'A', 'a':
   begin

    btnNumpadAdd.Click;

   end;

  'S', 's':
   begin

    btnNumpadVoidSale.Click;

   end;

  'D', 'd':
   begin

    btnNumpadVoidLast.Click;

   end;

  'W', 'w':
   begin

    btnNumpadEnter.Click;

   end;

 END;

end;

procedure TfrmMain.spbKeyClick(Sender: TObject);

begin

 // Placeholder procedure for bringing up the Keypad form

 WriteMLog('Keypad Form not yet implemented!');

end;

procedure TfrmMain.WriteMLog(sMSG: String);

begin

 if bMLogOpen = False then // If file for session hasn't been made yet
  begin

   AssignFile(tfMLog, 'mlog_' + DatetoStr(Now) + '_' + TimetoStr(Now) + '.txt');
   Rewrite(tfMLog); // Create the file
   WriteLn(tfMLog, sMSG);
   Flush(tfMLog); // Writes to disk

   bMLogOpen := True;

  end
   else // If file for session has been made
    begin

     WriteLn(tfMLog, TimetoStr(Now) + ' - ' + sMSG);
     Flush(tfMLog);

    end;

end;

end.
