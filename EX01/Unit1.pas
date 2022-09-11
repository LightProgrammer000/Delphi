unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
    // Objetos
    TFrmLem = class(TForm)
    btnMen: TButton;
    btnAlt: TButton;
    lblMen: TLabel;

    // Procedimentos
    procedure btnMenClick(Sender: TObject);
    procedure btnAltClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// VARI�VEIS GLOBAIS
var
  FrmLem: TFrmLem;

implementation

{$R *.dfm}

//////////////////// BOTAO MENSAGEM ////////////////////
procedure TFrmLem.btnMenClick(Sender: TObject);

// Processamento
begin
  { Colocar Mensagem no Label, Obs: #13 = Concatena��o }
  lblMensagem.Caption := 'Leandro voc� tem m�dico' + #13 + 'Dia: Sexta-Feira,19' + #13 + 'Hor�rio: 10:00 H';
end;

//////////////////// BOT�O ALTERAR ////////////////////
procedure TFrmLem.btnAltClick(Sender: TObject);

// Processamento
begin
  lblMensagem.Font.Color:= clRed;// A mensagem adquiri cor vermelha
  lblMensagem.Font.Style:= [fsBold];// A mensagem fica em negrito
  lblMensagem.Alignment:= taCenter;// A mensagem fica alinhada no centro
  lblMensagem.Font.Size:= 10;// A mensagem fica com tamanho 10
end;

end.
