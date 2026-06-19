unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.DFM}

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  ShowMessage('Hello, this is Delphi 5');
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  ShowMessage('Hola, esto es Delphi 5');
end;

end.
