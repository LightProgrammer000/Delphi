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

  // Estrura de Decisão --> Se Clicar no item Abrir --> Abrirá uma caixa para carregar
  // O arquivo será carregado em forma de texto.
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

  { Estrura de Decisão --> Se Clicar no item Salvar  --> Abrirá uma caixa para salvar
  o arquivo que será salvo em forma de texto. }
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

  { A fonte da memTexto é reconhecida pelo FontDialog }
  FontDialog.Font := memTexto.Font;

  { Caso o usuário mudar a fonte, então a FontDialog vai ser atribuida ao memTexo }
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

  { A cor do memTexto é reconhecida e atribuida ao ColorDialog }
  ColorDialog.Color := memTexto.Color;

  { O usuário mudará a cor da memTexto, então a caixa ColorDialog atribuirá um cor ao
  memTexto }
  if ( ColorDialog.Execute ) then
  begin
    //memTexto.Color := ColorDialog.Color;// Essa linha mudará o formulário inteiro (erro)
    memTexto.Font.Color := ColorDialog.Color;// Esse comando mudará a fonte do texto
  end

  else
  begin
  end;

end;

////////// EVENTO CREATE --> RODA QUANDO O PROGRAMA COMEÇA //////////
////////// LIMPAR CAMPO DO MEMO E DESABILITAR OPÇÕES DO MENU EDITAR //////////
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

////////// MÉTODO PARA CORTAR UM TEXTO //////////
procedure TfrmBlocoNotas.itmRecortarClick(Sender: TObject);

// Processamento
begin

  memTexto.CutToClipboard;// Tarefa de Cortar um texto
  itmColar.Enabled := True;// Aparece o item "Colar" 

end;

////////// MÉTODO PARA COPIAR UM TEXTO //////////
procedure TfrmBlocoNotas.itmCopiarClick(Sender: TObject);

// Processamento
begin

  memTexto.CopyToClipboard;// Tarefa para copiar um texto
  itmColar.Enabled := True;// Aparece o item colar

end;

////////// MÉTODO PARA O ITEM COLAR //////////
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

////////// ITEM ITÁLICO //////////
procedure TfrmBlocoNotas.itmItlicoClick(Sender: TObject);

// Processamento
begin

  itmItlico.Checked := not itmItlico.Checked;
  Fonte;

end;


////////// ANÁLISE DE FONTE NEGRITO E ITÁLICO //////////
procedure TfrmBlocoNotas.Fonte;

// Processamento
begin

  // Se não está checado como negrito e não está checado como itálico --> Normal
  if not ( itmNegrito.Checked ) and not ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [];
  end

  // Se está negrito e não está itálico --> Negrito
  else
  if ( itmNegrito.Checked ) and not ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsBold];
  end

  // Se não está negrito e está itálico
  else
  if not ( itmNegrito.Checked ) and ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsItalic];
  end

  // Se está negrito e está itálico
  else
  if ( itmNegrito.Checked ) and ( itmItlico.Checked ) then
  begin
    memTexto.Font.Style := [fsBold, fsItalic];
  end
  
end;

////////// MÉTODO SAIR //////////
procedure TfrmBlocoNotas.itmSairClick(Sender: TObject);

// Processamento
begin

  Close;
  
end;

end.
