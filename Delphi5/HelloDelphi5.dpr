program HelloDelphi5;

uses
  VirtualUI_SDK,
  Forms,
  main in 'main.pas' {FrmMain};

{$R *.RES}

begin
  VirtualUI.Start();
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
