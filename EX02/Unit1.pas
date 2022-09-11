unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
   // Objetos
    TfrmCal = class(TForm)
    EdtNum_1: TEdit;
    EdtNum_2: TEdit;
    EdtRes: TEdit;
    lblMul: TLabel;
    btnLim: TButton;
    btnIgu: TButton;

    // Procedimentos
    procedure btnIguClick(Sender: TObject);
    procedure btnLimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// VARIÁVEIS GLOBAIS
var
  frmCal: TfrmCal;

implementation

{$R *.dfm}

//////////////////// BOTÃO IGUAL ////////////////////
procedure TfrmCal.btnIguClick(Sender: TObject);

// Variáveis Locais
var
  Valor1: Real;
  Valor2: Real;

// Procedimento
begin

  // Conversão de String --> Float ( Para realização das operações matemáticas )
  Valor1 := StrToFloat( EdtNum_1.Text );
  Valor2 := StrToFloat( EdtNum_2.Text );

  // Conversão de Float --> String ( Devolvendo para o campo EdtResult )
  EdtRes.Text := FloatToStr( Valor1 * Valor2 );
end;

//////////////////// BOTÃO LIMPAR ////////////////////
procedure TfrmCal.btnLimClick(Sender: TObject);

// Procedimento
begin

  EdtNum_1.Text := '';// Limpar campos do EdtNum_1
  EdtNum_2.Text := '';// Limpar campos do EdtNum_2
  EdtRes.Text := '';// Limpar campos do EdtRes
  EdtNum_1.SetFocus;// Colocar o cursor no EdtNum_1
end;

end.
