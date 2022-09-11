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

// VARIÁVEIS GLOBAIS
var
  Calculadora: TCalculadora;

implementation

// VARIÁVEIS GLOBAIS
var
  Valor1: Real;
  Valor2: Real;
  a1: Real;
  n: Integer;

{$R *.dfm}

//////////////////// BOTÃO MULTIPLICAÇÃO ////////////////////
procedure TCalculadora.btnMulClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // Cálculo da multiplicação e formatação do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 * Valor2 ) );
end;

//////////////////// BOTÃO DIVISÃO ////////////////////
procedure TCalculadora.btnDivClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // Cálculo da divisão e formatação do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 / Valor2 ) );
end;

//////////////////// BOTÃO SOMA ////////////////////
procedure TCalculadora.btnSomClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // Cálculo da soma e formatação do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 + Valor2 ) );
end;

//////////////////// BOTÃO SUBTRAÇÃO ////////////////////
procedure TCalculadora.btnSubClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float
  Valor1 := StrToFloat( EdtOpeBasNum_1.Text );
  Valor2 := StrToFloat( EdtOpeBasNum_2.Text );

  // Cálculo da subtração e formatação do Float --> String
  EdtOpeBasRes.Text := FormatFloat( '###.00' , ( Valor1 - Valor2 ) );
end;

//////////////////// BOTÃO PRIMO ////////////////////
procedure TCalculadora.btnPriClick(Sender: TObject);

// Variável local
var
  i: Integer;// Variável de controle da estrutura de repetição
  contador: Integer;
  Primo: Integer;

// Processamento
begin
  contador := 0;// Atribuição inicial de valor ao contador

  // Conversão de String --> Float
  Primo := StrToInt( EdtPriNum.Text );

  // Estrura de repetição
  for i:= 1 to Primo do
  begin

    // Se "Primo" dividido por "i" restar "0" adicionar 1 ao contador
    if ( ( Primo mod i ) = 0 ) then
    begin
      contador := contador + 1;
    end;

    { Se a divisão restar "0" por mais de 2 vezes, o contador vai ser maior que 2
    então não é primo, daí parar de calcular com o comando --> break }
    if ( contador > 2 ) then
    begin
      EdtPriRes.Text := ' NÃO ';
      break; // Quebrando sequência para otimizar programa
    end;
  end;

  { Se depois de todo o processo anterior de divisão sucessiva o contador for
  igual a 2, então é primo, ou seja o número se divide por ele mesmo e por 1 }
  if( contador = 2 ) then
  begin
    EdtPriRes.Text := ' SIM ';
  end

  else
  begin
  end;

end;

//////////////////// BOTÃO POTÊNCIA ////////////////////
procedure TCalculadora.btnPotClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float para a Base
  Valor1 := StrToFloat( EdtPotBas.Text );

  // Conversão de String --> Float para o expoente
  Valor2 := StrToFloat( EdtPotExp.Text );

  // Cálculo da potência --> ( Base, Expoente )
  EdtPotRes.Text := FormatFloat( '###.00' , Power( Valor1, Valor2 ) );
end;

//////////////////// BOTÃO RADICIAÇÃO ////////////////////
procedure TCalculadora.btnRadClick(Sender: TObject);

// Processamento
begin

  // Conversão de String --> Float para o Índice
  Valor1 := StrToFloat( EdtRadInd.Text );

  // Conversão de String --> Float para o número
  Valor2 := StrToFloat( EdtRadNum.Text );

  // Cálculo da Radiciação --> ( Base, 1/Expoente )
  EdtRadRes.Text := FormatFloat( '###.00' , Power( Valor2, ( 1/Valor1 ) ) );
end;

//////////////////// BOTÃO PROGRESSÃO ARITMÉTICA ////////////////////
procedure TCalculadora.btnPrgArtClick(Sender: TObject);

// Variável local
var
  i: Integer;// Variável de controle da estrutura de repetição
  r: Real;// Razão
  ProgArt: Real;// Progressão Artimética

// Processamento
begin

  // Conversão de String --> Float para a1
  a1 := StrToFloat( EdtProgArtNum.Text );

  // Conversão de String --> Float para r
  r := StrToFloat( EdtProgArtRaz.Text );

  // Conversão de String --> Integer para n
  n := StrToInt( EdtProgArtQua.Text ) ;

  // Estrutura de repetição i de 1 até n
  for i := 1 to n do
  begin

    // Cálculo da progresão aritmética
    ProgArt := ( a1 + ( i - 1 ) * r );

    // Adicionar na lista a sequência da progressão aritmética e formatar para Float
    LstBoxPrgArt.Items.Add( FormatFloat( '###.00', ProgArt ) );
  end;
end;

//////////////////// BOTÃO LIMPAR PROGRESSÃO ARITMÉTICA ////////////////////
procedure TCalculadora.btnProgArtLimClick(Sender: TObject);

// Processamento
begin
  LstBoxPrgArt.Items.Clear;
end;

//////////////////// BOTÃO PROGRESSÃO GEOMÉTRICA ////////////////////
procedure TCalculadora.btnPrgGeoClick(Sender: TObject);

var
  i: Integer;// Variável de controle da estrutura de repetição
  q: Real;
  ProgGeo: Real;

// Processamento
begin

  // Conversão de String --> Float para a1
  a1 := StrToFloat( EdtProGeoNum.Text );

  // Conversão de String --> Float para r
  q := StrToFloat( EdtProGeoRaz.Text );

  // Conversão de String --> Integer para n
  n := StrToInt( EdtProGeoQua.Text );

  // Estrutura de repetição i de 1 até n
  for i := 1 to n do
  begin

    // Cálculo da progresão geomética
    ProgGeo := a1 * ( Power ( q , ( i - 1 ) ) );

    // Adicionar na lista a sequência da progressão geométrica e formatar Float
    LstBoxPrgGeo.Items.Add( FormatFloat( '###.00' , ProgGeo ) );
  end;
end;

//////////////////// BOTÃO LIMPAR PROGRESSÃO GEOMÉTRICA ////////////////////
procedure TCalculadora.btnProgGeoLimClick(Sender: TObject);

// Processamento
begin
  LstBoxPrgGeo.Items.Clear;
end;

//////////////////// BOTÃO LIMPAR ////////////////////
procedure TCalculadora.btnLimClick(Sender: TObject);

// Processamento
begin

  // Limpar campos das operações básicas
  EdtOpeBasNum_1.Text := '';
  EdtOpeBasNum_2.Text := '';
  EdtOpeBasRes.Text := '';

  // Limpar campos da identificação do número primo
  EdtPriNum.Text := '';
  EdtPriRes.Text := '';

  // Limpar campos da potenciação
  EdtPotBas.Text := '';
  EdtPotExp.Text := '';
  EdtPotRes.Text := '';

  // Limpar campos de radiciação
  EdtRadInd.Text := '';
  EdtRadNum.Text := '';
  EdtRadRes.Text := '';

  // Limpar campos de progressão aritmética
  EdtProgArtNum.Text := '';
  EdtProgArtRaz.Text := '';
  EdtProgArtQua.Text := '';
  
  // Limpar campos de progressão geométrica
  EdtProGeoNum.Text := '';
  EdtProGeoRaz.Text := '';
  EdtProGeoQua.Text := '';

  // Cursor do campo EdtNum1
  EdtOpeBasNum_1.SetFocus;
end;

end.


