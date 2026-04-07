program CRS;

uses
  Vcl.Forms,
  MainScreen in 'MainScreen.pas' {frmMain},
  PassKeypad in 'PassKeypad.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, frmPassKeypad);
  Application.Run;
end.
