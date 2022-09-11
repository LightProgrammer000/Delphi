// Nome da unidade
unit JogoVelhaUnt;

// Interface
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  jpeg, ExtCtrls;

type
    TfrmJogo = class(TForm) // Objeto frmJogo da classe Form
    Button1: TButton;       // Objeto Button1 da classe Button
    Button2: TButton;       // Objeto Button2 da classe Button
    Button3: TButton;       // Objeto Button3 da classe Button
    Button4: TButton;       // Objeto Button4 da classe Button
    Button5: TButton;       // Objeto Button5 da classe Button
    Button6: TButton;       // Objeto Button6 da classe Button
    Button7: TButton;       // Objeto Button7 da classe Button
    Button8: TButton;       // Objeto Button8 da classe Button
    Button9: TButton;
    Image1: TImage;       // Objeto Button9 da classe Button

    // Métodos
    procedure JogoNovo;
    procedure Verificar;
    procedure Formulario(Sender: TObject);
    procedure Click(Sender: TObject);
        
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJogo: TfrmJogo;
  Botao: array [1..9] of TButton; // Variável de controle do botão
  NumeroVezes: Integer; // Variável de controle de jogadas

implementation
{$R *.dfm}

//////////////////// FORMULÁRIO ////////////////////
procedure TfrmJogo.Formulario(Sender: TObject);

// Processamento
begin

  // Procedimento interno ( Randomize ): Valores Aleatórios
  Randomize; // Inicia o gerado de números para o RANDOM

  // A variável Botao[] recebe o valor de Button
  Botao[1] := Button1;
  Botao[2] := Button2;
  Botao[3] := Button3;
  Botao[4] := Button4;
  Botao[5] := Button5;
  Botao[6] := Button6;
  Botao[7] := Button7;
  Botao[8] := Button8;
  Botao[9] := Button9;

  // Chama de Método: JogoNovo
  JogoNovo;
  
end;

//////////////////// JOGO NOVO ////////////////////
procedure TfrmJogo.JogoNovo();

// Variáveis locais
var
  M: Integer;
  I: Integer;

// Processamento
begin

  // Estrura de repetição --> Limpar os 9 botões
  for I:= 1 to 9 do
  begin
    Botao[I].Caption := '';
  end;

  // Limpando numero de vezes e ( Iniciando a contagem de jogadas )
  NumeroVezes := 0;

  // Computador realiza 1 jogada aleatória
  M:= Trunc( Random * 10 ); // Valores de M entre 1 e 9
  Botao[M].Caption := 'O'; // Computador começa jogando o "O" aleatório
  
end;

//////////////////// CLICK ////////////////////
procedure TfrmJogo.Click(Sender: TObject);

// Processamento
begin

  NumeroVezes := NumeroVezes + 1; // Número de vezes que pode jogar = 3

  // Sender as TButton --> Vários objetos executando a mesma função
  ( Sender as TButton ).Caption := 'X'; // Coloque a variável "x" no Botão ( trocando o caption )

  Verificar; // Método para verificar quem ganhou, e o computador fazer um lance
  
end; 

//////////////////// VERIFICAÇÃO ////////////////////
procedure TfrmJogo.Verificar();

label 1; // Definir um local de desvio " 1: "
label 2; // Definir um local de descio " 2: "

var
  I: Integer;
  Resposta: Integer;

begin

  // Estrutura de decisão --> Humano ganhando com 'X' na horizontal
  if ( Button1.Caption = 'X' ) and ( Button2.Caption = 'X' ) and ( Button3.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  else
  if ( Button4.Caption = 'X' ) and ( Button5.Caption = 'X' ) and ( Button6.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  else
  if ( Button7.Caption = 'X' ) and ( Button8.Caption = 'X' ) and ( Button9.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  // Continuando a estrutura de decisão --> Humano ganhando com 'X' na vertical
  else
  if ( Button1.Caption = 'X' ) and ( Button4.Caption = 'X' ) and ( Button7.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  else
  if ( Button2.Caption = 'X' ) and ( Button5.Caption = 'X' ) and ( Button8.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  else
  if ( Button3.Caption = 'X' ) and ( Button6.Caption = 'X' ) and ( Button9.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  // Continuando com a estrutura de decisão --> Humano ganhando com 'X' na Diagonal
  else
  if ( Button1.Caption = 'X' ) and ( Button5.Caption = 'X' ) and ( Button9.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end

  else
  if ( Button3.Caption = 'X' ) and ( Button5.Caption = 'X' ) and ( Button7.Caption = 'X' ) then
  begin
    goto 1; // Desvio para "1:"
  end;

  // Estrutura de repetição --> A máquina irá analisar se tem algum botão vazio mediante a um "chute"
  // aleatório, e vai repetir esse processo até encontrar um botão vazio para poder jogar o 'O'
  repeat
  begin
    I:= Trunc( Random * 10 );
  end;
  until ( Botao[I].Caption = '' );

  // Máquina marca um 'O'
  Botao[I].Caption := 'O';

  // Estrutura de decisão --> Máquina ganhando com 'O' na horizontal
  if( Button1.Caption = 'O' ) and ( Button2.Caption = 'O' ) and ( Button3.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  else
  if ( Button4.Caption = 'O' ) and ( Button5.Caption = 'O' ) and ( Button6.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  else
  if ( Button7.Caption = 'O' ) and ( Button8.Caption = 'O' ) and ( Button9.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  // Continuando a estrutura de decisão --> Máquina ganhando com 'O' na vertical
  else
  if ( Button1.Caption = 'O' ) and ( Button4.Caption = 'O' ) and ( Button7.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  else
  if ( Button2.Caption = 'O' ) and ( Button5.Caption = 'O' ) and ( Button8.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  else
  if ( Button3.Caption = 'O' ) and ( Button6.Caption = 'O' ) and ( Button9.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  // Continuando com a estrutura de decisão --> Máquina ganhando com 'O' na Diagonal
  else
  if ( Button1.Caption = 'O' ) and ( Button5.Caption = 'O' ) and ( Button9.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end

  else
  if ( Button3.Caption = 'O' ) and ( Button5.Caption = 'O' ) and ( Button7.Caption = 'O' ) then
  begin
    goto 2; // Desvio para "2:"
  end;

  // Estrutura de decisão --> Analisando o número de vezes de jogada
  if( NumeroVezes = 4 ) then
  begin
    ShowMessage(' Partida Empatada ');
    JogoNovo;
    //Exit;
  end

  else
  begin
  end;

  // Todo a estrutura lógica termina aqui com " Exit "
  Exit;

  //////////////////// SEÇÃO DE DESVIOS --> Goto 1 e Goto 2 ////////////////////

  // Desvio 1 --> goto 1
  1:
    begin

      //ShowMessage('Você ganhou');
      Resposta := Application.MessageBox(' Você ganhou, quer jogar novamente ? ', ' Vencedor ', 36 );

      // Estrutura de decisão caso "não" queira mais jogar
      if ( Resposta = 7 ) then
      begin
        Close;
      end

      else
      begin
        JogoNovo;
        Exit; // A saída é importante para a instrução não continuar no desvio 2
      end;

    end;

  // Desvio 2 --> goto 2
  2:
    begin

      //ShowMessage('Máquina ganhou');
      Resposta := Application.MessageBox('A Velha ganhou, quer jogar novamente ? ', ' Vencedor ', 36 );

      if ( Resposta = 7 ) then
      begin
        Close;
      end

      else
      begin
        JogoNovo;
        //Exit;
      end;

    end;

end; // Término do Processamento


end.

