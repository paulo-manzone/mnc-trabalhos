unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RetanguloEsquerda;
    procedure RetanguloDireita;
    procedure Trapezio;
    procedure UmTercoSimpson;
    procedure TresOitavosSimpson;
    procedure QuadraturaGauss;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


function FxR1(f: String; x: Extended; var y: Extended): Word; stdcall; external 'Interpretador.dll';
{ TForm1 }

//============================================================================
//                            Métodos
//============================================================================
//Retângulos a Esquerda
procedure TForm1.RetanguloEsquerda;
var
  fx: string;
  y,x: Extended;
  a, b, h, area: Extended;
  i,n: Integer;
begin
   area:=0;
   fx:=Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   n:=StrToInt(Edit4.Text);
   h:=(b-a)/n;
   for i:=0 to n-1 do
   begin
       x:=a+i*h;
       FxR1(fx,x,y);
       area := area+(y);
   end;
   area:=area*h;
   StringGrid1.Cells[1,1]:=FloatToStr(area);

end;

//Retângulos a Direita
procedure TForm1.RetanguloDireita;
var
  fx: string;
  y,x: Extended;
  a, b, h, area: Extended;
  i,n: Integer;
begin
   area:=0;
   fx:=Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   n:=StrToInt(Edit4.Text);
   h:=(b-a)/n;
   for i:=1 to n do
   begin
       x:=a + i*h;
       FxR1(fx,x,y);
       area := area+(y);
   end;
   area:= area*h;
   StringGrid1.Cells[1,2]:=FloatToStr(area);

end;


//Trapézio
procedure TForm1.Trapezio;
var
  fx: string;
  y, ya, yb,x: Extended;
  a, b, h, area: Extended;
  i,n: Integer;
begin
   fx:=Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   n:=StrToInt(Edit4.Text);
   h:=(b-a)/n;
   FxR1(fx,a,ya);
   FxR1(fx,b,yb);
   area:=(ya + yb)/2;
   for i:=1 to n-1 do
   begin
       x:=a + i*h;
       FxR1(fx,x,y);
       area := area+(y);
   end;
   area:= area*h;
   StringGrid1.Cells[1,3]:=FloatToStr(area);

end;

//1/3 Simpson
procedure TForm1.UmTercoSimpson;
var
  fx: string;
  y,ya,yb,x: Extended;
  a, b, h, area, a4, a2: Extended;
  i,n, k: Integer;
begin
   area:=0;
   fx:=Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   n:=StrToInt(Edit4.Text);
   h:=(b-a)/n;
   i:=0;
   k:=0;
   a4:=0;
   a2:=0;
   //pegando inteiro
   while k+1<=(n/2) do
   begin
       k:= k+1;;
   end;
   for i:=1 to (k) do
   begin
       x:=a + (2*i-1)*h;
       FxR1(fx,x,y);
       a4 := a4+y;
   end;
   k:=0;
   //pegando inteiro
   while k+1<=n/2-1 do
   begin
       k:= k+1;;
   end;
   for i:=1 to (k) do
   begin
       x:=a+(2*i)*h;
       FxR1(fx,x,y);
       a2:=a2 + y;
   end;
   FxR1(fx, a, ya);
   FxR1(fx, b, yb);
   area:= h*(ya+yb+4*a4+2*a2)/3;
   StringGrid1.Cells[1,4]:=FloatToStr(area);

end;
//3/8 Simpson
procedure TForm1.TresOitavosSimpson;
var
  fx: string;
  y,ya,yb,x: Extended;
  a, b, h, area, a3, a2: Extended;
  i,n, k: Integer;
begin
   area:=0;
   fx:=Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   n:=StrToInt(Edit4.Text);
   h:=(b-a)/n;
   i:=0;
   k:=0;
   a3:=0;
   a2:=0;
   //pegando inteiro
   while k+1<=(n/3) do
   begin
       k:= k+1;;
   end;
   for i:=1 to (k) do
   begin
       x:= a + (3*i-2)*h;
       FxR1(fx,x,y);
       a3:= a3+y;
       x:= a + (3*i-1)*h;
       FxR1(fx, x, y);
       a3:= a3 + (y)
   end;
   k:=0;
   //pegando inteiro
   while k+1<=n/3-1 do
   begin
       k:= k+1;;
   end;
   for i:=1 to (k) do
   begin
       x:=a+(3*i)*h;
       FxR1(fx,x,y);
       a2:=a2 + y;
   end;
   FxR1(fx, a, ya);
   FxR1(fx, b, yb);
   area:= 3*h*(ya+yb+3*a3+2*a2)/8;
   StringGrid1.Cells[1,5]:=FloatToStr(area);

end;

//Gauss
procedure TForm1.QuadraturaGauss;
var
   fx: string;
   x,y, integral, Aux, a, b: Extended;
   w2ptos, w4ptos, w8ptos: array of Extended;
   t2ptos, t4ptos, t8ptos: array of Extended;
   i,n: Integer;
begin
   //Setando tamanho dos vetores
   SetLength(w2ptos,2);
   SetLength(t2ptos,2);
   SetLength(w4ptos,4);
   SetLength(t4ptos,4);
   SetLength(w8ptos,8);
   SetLength(t8ptos,8);
   //====Preenchendo tabelas====
   // - 2 pontos
   w2ptos[0]:= 1;
   w2ptos[1]:= 1;
   t2ptos[0]:= -0.5773502691;
   t2ptos[1]:= 0.5773502691;


   // - 4 pontos
   w4ptos[0]:= 0.3478548451;
   w4ptos[1]:= 0.6521451548;
   w4ptos[2]:= 0.6521451548;
   w4ptos[3]:= 0.3478548451;
   t4ptos[0]:= -0.8611363115;
   t4ptos[1]:= -0.3399810435;
   t4ptos[2]:= 0.3399810435;
   t4ptos[3]:= 0.8611363115;

   // - 8 pontos

   w8ptos[0]:= 0.1012285362;
   w8ptos[1]:= 0.2223810344;
   w8ptos[2]:= 0.3137066458;
   w8ptos[3]:= 0.3626837833;
   w8ptos[4]:= 0.3626837833;
   w8ptos[5]:= 0.3137066458;
   w8ptos[6]:= 0.2223810344;
   w8ptos[7]:= 0.1012285362;
   t8ptos[0]:= -0.9602898564;
   t8ptos[1]:= -0.7966664774;
   t8ptos[2]:= -0.5255324099;
   t8ptos[3]:= -0.1834346424;
   t8ptos[4]:= 0.1834346424;
   t8ptos[5]:= 0.5255324099;
   t8ptos[6]:= 0.7966664774;
   t8ptos[7]:= 0.9602898564;

   //===Metodo em si =====

   fx:= Edit1.Text;
   a:=StrToFloat(Edit2.Text);
   b:=StrToFloat(Edit3.Text);
   Aux:=0;

   //Para dois pontos
   if(RadioButton1.Checked = true) then
   begin
         n:= 2;
         for i:=0 to n-1 do
         begin
             x:=(a*(1-t2ptos[i]) + b*(1+t2ptos[i]))/2;
             FxR1(fx,x,y);
             Aux:= Aux + w2ptos[i]*y;
         end;
         integral:= (b-a)*Aux/2;
   end;

    //Para quatro pontos
   if(RadioButton2.Checked = true) then
   begin
         n:= 4;
         for i:=0 to n-1 do
         begin
             x:=(a*(1-t4ptos[i]) + b*(1+t4ptos[i]))/2;
             FxR1(fx,x,y);
             Aux:= Aux + w4ptos[i]*y;
         end;
         integral:= (b-a)*Aux/2;
   end;

   //Para oito pontos
   if(RadioButton3.Checked = true) then
   begin
         n:= 8;
         for i:=0 to n-1 do
         begin
             x:=(a*(1-t8ptos[i]) + b*(1+t8ptos[i]))/2;
             FxR1(fx,x,y);
             Aux:= Aux + w8ptos[i]*y;
         end;
         integral:= (b-a)*Aux/2;
   end;
   StringGrid1.Cells[1,6]:= FloatToStr(integral);

end;

//============================================================================
//                            Controles de Forma
//============================================================================

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text:= '4*x*x+3';
  Edit2.Text:= '-1';
  Edit3.Text:= '1';
  Edit4.Text:= '24';
  RadioButton2.Checked:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
        if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') then
        begin
              ShowMessage('Preencha os campos!');
              exit();
        end;

        Label5.Caption:= Edit3.Text;
        Label6.Caption:= Edit2.Text;
        Label7.Caption:= '(' + Edit1.Text + ') . dx ';
        //Chamando métodos

        RetanguloEsquerda;
        RetanguloDireita;
        Trapezio;
        if StrToInt(Edit4.Text) mod 2 = 0 then
        begin
           UmTercoSimpson;
        end
        else
        begin
           StringGrid1.Cells[1,4]:= 'Intervalo não é par'
        end;
        if StrToInt(Edit4.Text) mod 3 = 0 then
        begin
           TresOitavosSimpson;
        end
        else
        begin
           StringGrid1.Cells[1,5]:= 'Intervalo não é multiplo de 3'
        end;
        QuadraturaGauss;
  except
    showmessage('Ocorreu algum erro!');
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:= '';
  Edit2.Text:= '';
  Edit3.Text:= '';
  Edit4.Text:= '';
  Label5.Caption:='b';
  Label6.Caption:='a';
  Label7.Caption:='f(x) . dx';
  RadioButton1.Checked:=True;
  StringGrid1.Cells[1,1]:='';
  StringGrid1.Cells[1,2]:='';
  StringGrid1.Cells[1,3]:='';
  StringGrid1.Cells[1,4]:='';
  StringGrid1.Cells[1,5]:='';
  StringGrid1.Cells[1,6]:='';


end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[0,0]:= 'Método';
    StringGrid1.Cells[1,0]:= 'Resultado';
    StringGrid1.Cells[0,1]:='Retângulos à esquerda';
    StringGrid1.Cells[0,2]:='Retângulos à direita';
    StringGrid1.Cells[0,3]:='Trapézios';
    StringGrid1.Cells[0,4]:='1/3 de Simpson';
    StringGrid1.Cells[0,5]:='3/8 de Simpson';
    StringGrid1.Cells[0,6]:='Gauss';
    RadioButton1.Checked:=True;
end;

procedure TForm1.GroupBox4Click(Sender: TObject);
begin

end;

procedure TForm1.Label10Click(Sender: TObject);
begin

end;

procedure TForm1.Label8Click(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

end.

