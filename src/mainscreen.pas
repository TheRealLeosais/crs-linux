unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls;

type

 { TfrmMain }
 TfrmMain = class(TForm)

  spbKey: TSpeedButton;

  tmrUpdateScreen: TTimer;

  procedure FormCreate(Sender: TObject);
  procedure FormKeyPress(Sender: TObject; var Key: char);

  procedure spbKeyClick(Sender: TObject);

 private

 public

end;

var
 frmMain: TfrmMain;
 tfMLog: TextFile;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);

begin

 tmrUpdateScreen.Enabled := True;



 AssignFile(tfMLog, 'mlog' + DateToStr(Now) + '.txt');
 Rewrite(tfMLog);

end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: char);

begin



end;

procedure TfrmMain.spbKeyClick(Sender: TObject);

begin



end;

end.
