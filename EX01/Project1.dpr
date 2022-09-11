program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FrmLem};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLem, FrmLem);
  Application.Run;
end.
