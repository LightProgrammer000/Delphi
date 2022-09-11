unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrmBlocoNotas = class(TForm)
    MainMenu: TMainMenu;
    Arquivo: TMenuItem;
    itmNovo: TMenuItem;
    itmAbrir: TMenuItem;
    itmSalvar: TMenuItem;
    N1: TMenuItem;
    itmSair: TMenuItem;
    Editar: TMenuItem;
    itmRecortar: TMenuItem;
    itmCopiar: TMenuItem;
    itmColar: TMenuItem;
    N2: TMenuItem;
    itmFormatarFonte: TMenuItem;
    itmFonte: TMenuItem;
    itmCor: TMenuItem;
    N3: TMenuItem;
    itmNegrito: TMenuItem;
    itmItlico: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    memTexto: TMemo;
    procedure itmNovoClick(Sender: TObject);
    procedure itmAbrirClick(Sender: TObject);
    procedure itmSalvarClick(Sender: TObject);
    procedure itmFonteClick(Sender: TObject);
    procedure itmCorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure memTextoChange(Sender: TObject);
    procedure itmRecortarClick(Sender: TObject);
    procedure itmCopiarClick(Sender: TObject);
    procedure itmColarClick(Sender: TObject);
    procedure Fonte;
    procedure itmNegritoClick(Sender: TObject);
    procedure itmItlicoClick(Sender: TObject);
    procedure itmSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlocoNotas: TfrmBlocoNotas;

implementation

{$R *.dfm}

////////// ABRIR -- NOVO //////////
procedure TfrmBlocoNotas.itmNovoClick(Sender: TObject);

// Processamento
begin

  memTexto.Clear;
  itmRecortar.Enabled := False;
  itmCopiar.Enabled := False;
  itmColar.Enabled := False;
  
end;

////////// ARQUIVO -- ABRIR //////////
procedure TfrmBlocoNotas.itmAbrirClick(Sender: TObject);

// Processamento
begin

  // Estrura de Decis�o --> Se Clicar no item Abrir --> Abrir� uma caixa para carregar
  // O arquivo ser� carregado em forma de texto.
  if ( OpenDialog.Execute )  then
  begin
    memTexto.Lines.LoadFromFile( OpenDialog.FileName );
  end

  else
  begin
  end;

end;

////////// ARQUIVO -- SALVAR  //////////
procedure TfrmBlocoNotas.itmSalvarClick(Sender: TObject);

// Processamento
begin

  { Estrura de Decis�o --> Se Clicar no item Salvar  --> Abrir� uma caixa para salvar
  o arquivo que ser� salvo em forma de texto. }
  if ( SaveDialog.Execute ) then
  begin
    memTexto.Lines.SaveToFile( SaveDialog.FileName );
  end

  else
  begin
  end;

end;

////////// EDITAR --> FORMATAR FONTE --> FONTE... //////////
procedure TfrmBlocoNotas.itmFonteClick(Sender: TObject);
begin

  { A fonte da memTexto � reconhecida pelo FontDialog }
  FontDialog.Font := memTexto.Font;

  { Caso o usu�rio mudar a fonte, ent�o a FontDialog vai ser atribuida ao memTexo }
  if ( FontDialog.Execute ) then
  begin
    memTexto.Font := FontDialog.Font;
  end

  else
  begin
  end;

end;

////////// EDITAR --> FORMATAR FONTE --> COR... //////////
procedure TfrmBlocoNotas.itmCorClick(Sender: TObject);

// Processamento
begin

  { A cor do memTexto � reconhecida e atribuida ao ColorDialog }
  ColorDialog.Color := memTexto.Color;

  { O usu�rio mudar� a cor da memTexto, ent�o a caixa ColorDialog atribuir� um cor ao
  memTexto }
  if ( ColorDialog.Execute ) then
  begin
    //memTexto.Color := ColorDialog.Color;// Essa linha mudar� o formul�rio inteiro (erro)
    memTexto.Font.Color := ColorDialog.Color;// Esse comando mudar� a fonte do texto
  end

  else
  begin
  end;

end;

////////// EVENTO CREATE --> RODA QUANDO O PROGRAMA COME�A //////////
////////// LIMPAR CAMPO DO MEMO E DESABILITAR OP��ES DO MENU EDITAR //////////
procedure TfrmBlocoNotas.FormCreate(Sender: TObject);

// Processamento
begin
  memTexto.Clear;
  itmRecortar.Enabled := False;
  itmCopiar.Enabled := False;
  itmColar.Enabled := False;
end;

////////// EVENTO ONCHANGE --> APARECE OS ITENS COPIAR E COLAR //////////
procedure TfrmBlocoNotas.memTextoChange(Sender: TObject);

// Processamento
begin

  itmRecortar.Enabled := True;// Aparece este item
  itmCopiar.Enabled := True;// Aparece este item
  
end;

////////// M�TODO PARA CORTAR UM TEXTO //////////
procedure TfrmBlocoNotas.itmRecortarClick(Sender: TObject);

// Processamento
begin

  memTexto.CutToClipboard;// Tarefa de Cortar um texto
  itmColar.Enabled := True;// Aparece o item "Colar" 

end;

////////// M�TODO PARA COPIAR UM TEXTO //////////
procedure TfrmBlocoNotas.itmCopiarClick(Sender: TObject);

// Processamento
begin

  memTexto.CopyToClipboard;// Tarefa para copiar um texto
  itmColar.Enabled := True;// Aparece o item colar

end;

////////// M�TODO PARA O ITEM COLAR //////////
procedure TfrmBlocoNotas.itmColarClick(Sender: TObject);

// Processamento
begin

  memTexto.PasteFromClipboard;
  
end;



////////// ITEM NEGRITO //////////
procedure TfrmBlocoNotas.itmNegritoClick(Sender: TObject);

// Processamento
begin

  itmNegrito.Checked:= not itmNegrito.Checked;
  Fonte;

end;

////////// ITEM IT�LICO //////////
procedure TfrmBlocoNotas.itmItlicoClick(Sender: TObject);

// Processamento
begin

  itmItlico.Checked := not itmItlico.Checked;
  Fonte;

end;


////////// AN�LISE DE FONTE NEGRITO E IT�LICO //////////
procedure TfrmBlocoNotas.Fonte;

// Processamento
begin

  // Se n�o est� checado como negrito e n�o est� checado como it�lico --> Normal
  if not ( itmNegrito.Checked ) and not ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [];
  end

  // Se est� negrito e n�o est� it�lico --> Negrito
  else
  if ( itmNegrito.Checked ) and not ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsBold];
  end

  // Se n�o est� negrito e est� it�lico
  else
  if not ( itmNegrito.Checked ) and ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsItalic];
  end

  // Se est� negrito e est� it�lico
  else
  if ( itmNegrito.Checked ) and ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsBold, fsItalic];
  end
  
end;

////////// M�TODO SAIR //////////
procedure TfrmBlocoNotas.itmSairClick(Sender: TObject);

// Processamento
begin

  Close;
  
end;

end.
