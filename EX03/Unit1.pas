unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, ExtCtrls;

type
    // Objetos
    TCalculadora = class(TForm)
    EdtOpeBasNum_1: TEdit;
    EdtOpeBasNum_2: TEdit;
    EdtOpeBasRes: TEdit;
    btnLim: TButton;
    btnMul: TButton;
    btnSom: TButton;
    lblOpeBasNum_1: TLabel;
    lblOpeBasNum_2: TLabel;
    lblOpeBasRes: TLabel;
    btnDiv: TButton;
    btnPot: TButton;
    btnSub: TButton;
    EdtPotBas: TEdit;
    EdtPotExp: TEdit;
    lblPotBas: TLabel;
    lblPotExp: TLabel;
    btnRad: TButton;
    EdtRadNum: TEdit;
    EdtRadInd: TEdit;
    lblRadInd: TLabel;
    lblRadNum: TLabel;
    lblPotRes: TLabel;
    EdtPotRes: TEdit;
    lblRadRes: TLabel;
    EdtRadRes: TEdit;
    lblRad: TLabel;
    lblOpeBas: TLabel;
    lblPot: TLabel;
    lblPri: TLabel;
    Image4: TImage;
    EdtPriNum: TEdit;
    btnPri: TButton;
    EdtPriRes: TEdit;
    lblPriRes: TLabel;
    lstBoxPrgArt: TListBox;
    lblProgArt: TLabel;
    EdtProgArtNum: TEdit;
    EdtProgArtRaz: TEdit;
    EdtProgArtQua: TEdit;
    lblProgArt_a1: TLabel;
    lblProgArt_r: TLabel;
    lblProgArt_n: TLabel;
    lstBoxPrgGeo: TListBox;
    lblProgGeo: TLabel;
    EdtProGeoNum: TEdit;
    EdtProGeoRaz: TEdit;
    EdtProGeoQua: TEdit;
    lblProgGeo_a1: TLabel;
    lblProgGeo_q: TLabel;
    lblProgGeo_n: TLabel;
    btnPrgArt: TButton;
    btnPrgGeo: TButton;
    btnProgArtLim: TButton;
    btnProgGeoLim: TButton;
    lblPriNum: TLabel;

    // Procedimentos
    procedure btnLimClick(Sender: TObject);
    procedure btnMulClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnSomClick(Sender: TObject);
    procedure btnSubClick(Sender: TObject);
    procedure btnPriClick(Sender: TObject);
    procedure btnPotClick(Sender: TObject);
    procedure btnRadClick(Sender: TObject);
    procedure btnPrgArtClick(Sender: TObject);
    procedure btnPrgGeoClick(Sender: TObject);
    procedure btnProgArtLimClick(Sender: TObject);
    procedure btnProgGeoLimClick(Sender: TObject);

    private
   { Private declarations }
   public
   { Public declarations }
end;

// VARI�VEIS GLOBAIS
var
  Calculadora: TCalculadora;

implementation

// VARI�VEIS GLOBAIS
var
  Valor1: Real;
  Valor2: Real;
  a1: Real;
  n: Integer;

{$R *.dfm}

//////////////////// BOT�O MULTIPLICA��O ////////////////////
procedure TCalculadora.btnMulClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // C�lculo da multiplica��o e formata��o do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 * Valor2 ) );
end;

//////////////////// BOT�O DIVIS�O ////////////////////
procedure TCalculadora.btnDivClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // C�lculo da divis�o e formata��o do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 / Valor2 ) );
end;

//////////////////// BOT�O SOMA ////////////////////
procedure TCalculadora.btnSomClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // C�lculo da soma e formata��o do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 + Valor2 ) );
end;

//////////////////// BOT�O SUBTRA��O ////////////////////
procedure TCalculadora.btnSubClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // C�lculo da subtra��o e formata��o do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 - Valor2 ) );
end;

//////////////////// BOT�O PRIMO ////////////////////
procedure TCalculadora.btnPriClick(Sender: TObject);

// Vari�vel local
var
  i: Integer;// Vari�vel de controle da estrutura de repeti��o
  contador: Integer;
  Primo: Integer;

// Processamento
begin
  contador := 0;// Atribui��o inicial de valor ao contador

  // Convers�o de String --> Float
  Primo := StrToInt( EdtPriNum.Text );

  // Estrura de repeti��o
  for i:= 1 to Primo do
  begin

    // Se "Primo" dividido por "i" restar "0" adicionar 1 ao contador
    if ( ( Primo mod i ) = 0 ) then
    begin
      contador := contador + 1;
    end;

    { Se a divis�o restar "0" por mais de 2 vezes, o contador vai ser maior que 2
    ent�o n�o � primo, da� parar de calcular com o comando --> break }
    if ( contador > 2 ) then
    begin
      EdtPriRes.Text := ' N�O ';
      break; // Quebrando sequ�ncia para otimizar programa
    end;
  end;

  { Se depois de todo o processo anterior de divis�o sucessiva o contador for
  igual a 2, ent�o � primo, ou seja o n�mero se divide por ele mesmo e por 1 }
  if( contador = 2 ) then
  begin
    EdtPriRes.Text := ' SIM ';
  end

  else
  begin
  end;

end;

//////////////////// BOT�O POT�NCIA ////////////////////
procedure TCalculadora.btnPotClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float para a Base
  Valor1 := StrToFloat( EdtPotBas.Text );

  // Convers�o de String --> Float para o expoente
  Valor2 := StrToFloat( EdtPotExp.Text );

  // C�lculo da pot�ncia --> ( Base, Expoente )
  EdtPotRes.Text := FormatFloat( '###.00' , Power( Valor1, Valor2 ) );
end;

//////////////////// BOT�O RADICIA��O ////////////////////
procedure TCalculadora.btnRadClick(Sender: TObject);

// Processamento
begin

  // Convers�o de String --> Float para o �ndice
  Valor1 := StrToFloat( EdtRadInd.Text );

  // Convers�o de String --> Float para o n�mero
  Valor2 := StrToFloat( EdtRadNum.Text );

  // C�lculo da Radicia��o --> ( Base, 1/Expoente )
  EdtRadRes.Text := FormatFloat( '###.00' , Power( Valor2, ( 1/Valor1 ) ) );
end;

//////////////////// BOT�O PROGRESS�O ARITM�TICA ////////////////////
procedure TCalculadora.btnPrgArtClick(Sender: TObject);

// Vari�vel local
var
  i: Integer;// Vari�vel de controle da estrutura de repeti��o
  r: Real;// Raz�o
  ProgArt: Real;// Progress�o Artim�tica

// Processamento
begin

  // Convers�o de String --> Float para a1
  a1 := StrToFloat( EdtProgArtNum.Text );

  // Convers�o de String --> Float para r
  r := StrToFloat( EdtProgArtRaz.Text );

  // Convers�o de String --> Integer para n
  n := StrToInt( EdtProgArtQua.Text ) ;

  // Estrutura de repeti��o i de 1 at� n
  for i := 1 to n do
  begin

    // C�lculo da progres�o aritm�tica
    ProgArt := ( a1 + ( i - 1 ) * r );

    // Adicionar na lista a sequ�ncia da progress�o aritm�tica e formatar para Float
    LstBoxPrgArt.Items.Add( FormatFloat( '###.00', ProgArt ) );
  end;
end;

//////////////////// BOT�O LIMPAR PROGRESS�O ARITM�TICA ////////////////////
procedure TCalculadora.btnProgArtLimClick(Sender: TObject);

// Processamento
begin
  LstBoxPrgArt.Items.Clear;
end;

//////////////////// BOT�O PROGRESS�O GEOM�TRICA ////////////////////
procedure TCalculadora.btnPrgGeoClick(Sender: TObject);

var
  i: Integer;// Vari�vel de controle da estrutura de repeti��o
  q: Real;
  ProgGeo: Real;

// Processamento
begin

  // Convers�o de String --> Float para a1
  a1 := StrToFloat( EdtProGeoNum.Text );

  // Convers�o de String --> Float para r
  q := StrToFloat( EdtProGeoRaz.Text );

  // Convers�o de String --> Integer para n
  n := StrToInt( EdtProGeoQua.Text );

  // Estrutura de repeti��o i de 1 at� n
  for i := 1 to n do
  begin

    // C�lculo da progres�o geom�tica
    ProgGeo := a1 * ( Power ( q , ( i - 1 ) ) );

    // Adicionar na lista a sequ�ncia da progress�o geom�trica e formatar Float
    LstBoxPrgGeo.Items.Add( FormatFloat( '###.00' , ProgGeo ) );
  end;
end;

//////////////////// BOT�O LIMPAR PROGRESS�O GEOM�TRICA ////////////////////
procedure TCalculadora.btnProgGeoLimClick(Sender: TObject);

// Processamento
begin
  LstBoxPrgGeo.Items.Clear;
end;

//////////////////// BOT�O LIMPAR ////////////////////
procedure TCalculadora.btnLimClick(Sender: TObject);

// Processamento
begin

  // Limpar campos das opera��es b�sicas
  EdtOpeBasNum_1.Text := '';
  EdtOpeBasNum_2.Text := '';
  EdtOpeBasRes.Text := '';

  // Limpar campos da identifica��o do n�mero primo
  EdtPriNum.Text := '';
  EdtPriRes.Text := '';

  // Limpar campos da potencia��o
  EdtPotBas.Text := '';
  EdtPotExp.Text := '';
  EdtPotRes.Text := '';

  // Limpar campos de radicia��o
  EdtRadInd.Text := '';
  EdtRadNum.Text := '';
  EdtRadRes.Text := '';

  // Limpar campos de progress�o aritm�tica
  EdtProgArtNum.Text := '';
  EdtProgArtRaz.Text := '';
  EdtProgArtQua.Text := '';
  
  // Limpar campos de progress�o geom�trica
  EdtProGeoNum.Text := '';
  EdtProGeoRaz.Text := '';
  EdtProGeoQua.Text := '';

  // Cursor do campo EdtNum1
  EdtOpeBasNum_1.SetFocus;
end;

end.


