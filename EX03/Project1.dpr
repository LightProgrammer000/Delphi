program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Calculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculadora, Calculadora);
  Application.Run;
end.
