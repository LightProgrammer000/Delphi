program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmRelogio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRelogio, frmRelogio);
  Application.Run;
end.
