program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmBlocoNotas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBlocoNotas, frmBlocoNotas);
  Application.Run;
end.
