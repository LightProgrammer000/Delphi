unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmRelogio = class(TForm)
    lblHora: TLabel;
    lblData: TLabel;
    Label3: TLabel;
    edtHora: TEdit;
    rdgControle: TRadioGroup;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure rdgControleClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelogio: TfrmRelogio;

implementation
var
  Ligado: Boolean;
  Tecla: Char;

{$R *.dfm}

procedure TfrmRelogio.FormCreate(Sender: TObject);

// Processamento
begin

  // O formulário começa colocando no botão desligado
  rdgControle.ItemIndex := 0;

  // O lblData muda o Caption para a data formatada de hoje
  lblData.Caption := FormatDateTime('dddd , dd "de" mmmm "de" yyy ' , Date );
end;

procedure TfrmRelogio.rdgControleClick(Sender: TObject);

// Processamento
begin
  // Estrutura de decisão
  if ( rdgControle.ItemIndex = 1 ) then
  begin
    Ligado := True;
  end

  else
    begin
      Ligado := False;
    end;
end;

procedure TfrmRelogio.FormKeyPress(Sender: TObject; var Key: Char);

// Processamento
begin
  Tecla := Key;

  // Obrigatoriedade neste formato --> 00:00:00   
  if( ( Tecla < '0' ) or ( Tecla > '9' ) ) and ( Tecla <> ':' ) then
  begin
    Beep;
    Key := chr(0);
  end

  else
  begin
  end;

end;

procedure TfrmRelogio.Timer1Timer(Sender: TObject);
begin
  if( edtHora.Text <= TimeToStr(Time) ) and ( Ligado ) then
  begin
    Beep;
    Beep;
  end

  else
  begin
  end;

  lblHora.Caption := TimeToStr(Time);
  
end;

end.





