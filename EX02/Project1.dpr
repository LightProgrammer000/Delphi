program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmCal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCal, frmCal);
  Application.Run;
end.
