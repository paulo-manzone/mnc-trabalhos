unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    //function VerificaDados(k: Byte): Boolean;
    //procedure DesenhaGrafico(k: Byte);
    //procedure DesenhaRaiz;
    //procedure Derivada;
    function UniformeSepara: Boolean;
    procedure Uniforme;
    procedure Bissecao;
    procedure Cordas;
    procedure CordasModificado;
    procedure Newton;
    procedure NewtonModificado;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
uses
 Windows, LCLIntf;


//===============================
//          INTERPRETADOR
//===============================
function FxR1(f: String; x: Extended; var y: Extended): Word; stdcall; external 'Interpretador.dll';


procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

//============================================================
//            *        PARTE IMPORTANTE       *
//============================================================


procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //  *  *  *  *  *  *  *  INICIALIZAÇÃO *  *  *  *  *  *  *

  StringGrid1.Cells[0,0] :='i';
  StringGrid1.Cells[0,1] :='a[i]';
  StringGrid1.Cells[0,2] :='b[i]';
  StringGrid1.Cells[0,3] :='Raiz';
  StringGrid1.ColCount:=7;
  StringGrid1.RowCount:=4;
  RadioButton1.Checked;
  for i:=1 to StringGrid1.ColCount-1 do
  begin
       StringGrid1.Cells[i,0] := IntToStr(i);
  end;




end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

//===========================================================
//                  SEPARAÇÃO DOS INTERVALOS DE RAÍZES
//===========================================================

function TForm1.UniformeSepara: Boolean;
var
 i: Integer;
 p, q, f_p, f_q: Extended;
 a, b, Delta, Epsilon: Extended;
 fx: String;
begin
  UniformeSepara:=False;
  StringGrid1.ColCount:=1;
  i:=1;

    //Verificações:

  if(Edit1.Text='') then
  begin
     showmessage('Informe uma funcao');
     exit;
  end;
  if(Edit2.Text='') then
  begin
     showmessage('Informe um a');
     exit;
  end;
  if(Edit3.Text='') then
  begin
     showmessage('Informe um b');
     exit;
  end;
  if(Edit4.Text='') then
  begin
     showmessage('Informe um Delta');
     exit;
  end;
  if(Edit5.Text='') then
  begin
     showmessage('Informe um Epsilon');
     exit;
  end;

  try
  fx:=Edit1.Text;
  a:=StrToFloat(Edit2.Text);
  b:=StrToFloat(Edit3.Text);
  Delta:=StrToFloat(Edit4.Text);
  Epsilon:=StrToFloat(Edit5.Text);
  except
    showmessage('Algo de errado aconteceu!');
  end;

  if(Epsilon<0.0000001)or(Epsilon>0.001) then
  begin
     showmessage('Informe um Epsilon válido');
     exit;
  end;
  if(Delta<(b-a)/10000) or (Delta>(b-a)/4) then
  begin
     showmessage('Informe um Delta Válido');
     exit;
  end;




  //---Metodo---
  p:=a;
  q:=a+Delta;
  FxR1(fx,p,f_p);
  FxR1(fx,q,f_q);
  if (f_q*f_p<0) or (abs(f_p)<Epsilon) then
  begin
    StringGrid1.ColCount:= StringGrid1.ColCount+1;
    StringGrid1.Cells[i,1]:= FloatToStr(p);
    StringGrid1.Cells[i,2]:= FloatToStr(q);
    i:= i+1;
  end;
  repeat
    p:=q;
    q:=p+Delta;
    FxR1(fx,p,f_p);
    FxR1(fx,q,f_q);
    if (f_q*f_p<0) or (abs(f_p)<Epsilon) then
    begin
      StringGrid1.ColCount:= StringGrid1.ColCount+1;
      StringGrid1.Cells[i,1]:= FloatToStr(p);
      StringGrid1.Cells[i,2]:= FloatToStr(q);
      i:=i+1;
    end;
  until p>b ;
  //Ajustando Grid
  StringGrid1.Width:= i*66;
  for i:=1 to StringGrid1.ColCount-1 do
  begin
       StringGrid1.Cells[i,0] := IntToStr(i);
  end;

  UniformeSepara:=True;
  StringGrid1.Height:=100;

end;


//===========================================================
//                         MÉTODO BUSCA UNIFORME
//===========================================================

procedure TForm1.Uniforme;
var
 i: Integer;
 Epsilon, p, q, f_p, f_q, a, b: Extended;
 fx: String;
 label fim;

begin
  i:=1;
    //Verificações:

  if(Edit1.Text='') then
  begin
     exit;
  end;
  if(Edit2.Text='') then
  begin
     exit;
  end;
  if(Edit3.Text='') then
  begin
     exit;
  end;
  if(Edit4.Text='') then
  begin
     exit;
  end;
  if(Edit5.Text='') then
  begin
     exit;
  end;

   //-Metodo-
  StringGrid1.ColCount:= StringGrid1.ColCount+1;
  while (StringGrid1.Cells[i,1]<>'') do
  begin
    StringGrid1.ColCount:= StringGrid1.ColCount+1;
    a:=StrToFloat(StringGrid1.Cells[i,1]);
    b:=StrToFloat(StringGrid1.Cells[i,2]);
    Epsilon:=StrToFloat(Edit5.Text);

    p:=a;
    q:=p+Epsilon;
    FxR1(fx,p,f_p);
    FxR1(fx,q,f_q);


    if (f_q*f_p<0) or (abs(f_p)<Epsilon) then
    begin
      StringGrid1.Cells[i,3]:= FloatToStr((p+q)/2);
      goto fim;
    end;

    repeat
      p:=q;
      q:=p+Epsilon;
      FxR1(fx,p,f_p);
      FxR1(fx,q,f_q);
      if (f_q*f_p<0) or (abs(f_p)<Epsilon) then
      begin
        StringGrid1.ColCount:= StringGrid1.ColCount+1;
        StringGrid1.Cells[i,3]:= FloatToStr((p+q)/2);
        goto fim;
      end;
    until p>b;
    fim:
    i := i+1;

  end;
  StringGrid1.Height:=100;
end;


//===============================================================
// Derivada Primeira
//===============================================================
function DerivadaPrimeira(f: string;  Epsilon,x: Extended; var d: Extended): Word;
var
     k: Integer;
     h: Extended;
     p, q: Extended;
     y1, y2: Extended;
begin
     h:=1024*Epsilon;
     FxR1(f,(x+h),y1);
     FxR1(f,(x-h),y2);
     p:=(y1 - y2)/(2*h);
     for k:=0 to 10 do
     begin
       q:= p;
       h:=h/2;
       FxR1(f,(x+h),y1);
       FxR1(f,(x-h),y2);
       p:=(y1-y2)/(2*h);
       if(abs(p-q)<=Epsilon) then
           break;
     end;
     d:= p;
end;


//===========================================================
//                         MÉTODO NEWTON
//===========================================================
procedure TForm1.Newton;
var
 i: Integer;
 x: Extended;
 fa, fb, fp, a, b, p, dp: Extended;
 f: String;
begin
     i:=1;
     StringGrid1.ColCount:= StringGrid1.ColCount+1;
     f:= Edit1.text;
     while(StringGrid1.Cells[i,1]<>'')do
     begin
       a:=StrToFloat(StringGrid1.Cells[i,1]);
       b:=StrToFloat(StringGrid1.Cells[i,2]);
       p:= a;
       FxR1(f,p,fp);
       while (abs(fp)>StrToFloat(Edit5.text)) do
       begin
         DerivadaPrimeira(f,0.00001,p,dp);
         p:= p - (fp/dp);
       end;
       StringGrid1.Cells[i,3]:=FloatToStr(p);
       i:=i+1;
     end;


end;




//===========================================================
//                         MÉTODO  NEWTON MODIFICADO
//===========================================================
procedure TForm1.NewtonModificado;
var
 i, k: Integer;
 x: Extended;
 fa, fb, fp, a, b, p, dp, resto: Extended;
 f: String;
begin
     i:=1;
     k:=0;
     StringGrid1.ColCount:= StringGrid1.ColCount+1;
     f:= Edit1.text;
     while(StringGrid1.Cells[i,1]<>'')do
     begin
       a:=StrToFloat(StringGrid1.Cells[i,1]);
       b:=StrToFloat(StringGrid1.Cells[i,2]);
       p:= a;
       FxR1(f,p,fp);
       DerivadaPrimeira(f,0.00001,p,dp);
       while (abs(fp)>StrToFloat(Edit5.text)) do
       begin
         k:=k+1;
         if k mod 5 = 0 then
         begin
            DerivadaPrimeira(f,0.00001,p,dp);
            k:=0;
         end;
         p:= p - (fp/dp);
       end;
       StringGrid1.Cells[i,3]:=FloatToStr(p);
       i:=i+1;
     end;
end;





//===========================================================
//                         MÉTODO  CORDAS
//===========================================================
procedure TForm1.Cordas;
var
 i: Integer;
 x: Extended;
 fa, fb, fp, a, b, p: Extended;
 f: String;
begin
     StringGrid1.ColCount:= StringGrid1.ColCount+1;
     f:=Edit1.Text;
     i:=1;
     while (StringGrid1.Cells[i,1]<>'') do
     begin
          a:= StrToFloat(StringGrid1.Cells[i,1]);
          b:=StrToFloat(StringGrid1.Cells[i,2]);
          fp:=5000;
           StringGrid1.ColCount:= StringGrid1.ColCount+1;
           while((abs(a-b)>StrToFloat(Edit5.text)) and (fp>StrToFloat(Edit5.text))) do
           begin
             FxR1(f,a,fa);
             FxR1(f,b,fb);
             p:= (a*fb - b*fa)/ (fb-fa);
             FxR1(f,p,fp);
             if(fa*fp<=0) then
             begin
                  b:=p;
             end
             else
             begin
                  a:=p;
             end;

           end;
           StringGrid1.Cells[i,3]:= FloatToStr(p);
           i:=i+1;
     end;
end;




//===========================================================
//                         MÉTODO   CORDAS MODIFICADO
//===========================================================
procedure TForm1.CordasModificado;
var
 i: Integer;
 conta, contb: Integer;
 x: Extended;
 fa, fb, fp, a, b, p: Extended;
 f: String;

begin
     conta:=0;
     contb:=0;
     StringGrid1.ColCount:= StringGrid1.ColCount+1;
     f:=Edit1.Text;
     i:=1;
     while (StringGrid1.Cells[i,1]<>'') do
     begin
          a:= StrToFloat(StringGrid1.Cells[i,1]);
          b:=StrToFloat(StringGrid1.Cells[i,2]);
          fp:=5000;
           StringGrid1.ColCount:= StringGrid1.ColCount+1;
           while((abs(a-b)>StrToFloat(Edit5.text)) and (fp>StrToFloat(Edit5.text))) do
           begin
             FxR1(f,a,fa);
             FxR1(f,b,fb);
             if((conta<5) and (contb<5))then
             begin
                  p:= (a*fb - b*fa)/ (fb-fa);
             end
             else
             begin
                 if(conta>5) then
                 begin
                      p:= (a*fb/2 - b*fa)/ (fb/2-fa);
                 end
                 else
                 begin
                      p:= (a*fb - b*fa/2)/ (fb-fa/2);
                 end;
             end;
             FxR1(f,p,fp);
             if(fa*fp<=0) then
             begin
                  b:=p;
                  contb:=contb+1;
                  conta:=0
             end
             else
             begin
                  a:=p;
                  conta:=conta+1;
                  contb:=0;
             end;

           end;
           StringGrid1.Cells[i,3]:= FloatToStr(p);
           i:=i+1;
     end;

end;




//===========================================================
//                         MÉTODO   BISSEÇÃO
//===========================================================
procedure TForm1.Bissecao;
var
 cont: Integer;
 i: Integer;
 x: Extended;
 a, b: Extended;
 p: Extended;
 fa, fb, fp: Extended;
 f: String;
begin

     i:=1;
     while (StringGrid1.Cells[i,1]<>'') do
     begin
       StringGrid1.ColCount:= StringGrid1.ColCount+1;
       a:=StrToFloat(StringGrid1.Cells[i,1]);
       b:=StrToFloat(StringGrid1.Cells[i,2]);
       p:=(a+b)/2;
       FxR1(f,p,fp);
       cont:=0;
       while ((abs(a-b)>StrToFloat(Edit5.text))and (cont<100)) do
       begin
           p:=(a+b)/2;
           FxR1(f,a,fa);
           FxR1(f,p,fp);
           if(fa*fp<=0) then
           begin
             b:=p;
           end
           else
           begin
             a:=p;
           end;
           cont:=cont+1;
       end;
       StringGrid1.Cells[i,3]:= FloatToStr(p);
       i:=i+1;
     end;
end;






//-----------------------------------------------------------------
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
//--------*-------------------BOTÕES-----------------*-------------
//--------*------------------------------------------*-------------
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
//-----------------------------------------------------------------



//===========================================================
//                         BOTÃO GRÁFICO
//===========================================================
procedure TForm1.SpeedButton1Click(Sender: TObject);
var
 x: Extended;
begin
    showmessage('Implement');
end;




//===========================================================
//                         BOTÃO CALCULAR
//===========================================================
procedure TForm1.SpeedButton2Click(Sender: TObject);
var
 i: Integer;
begin
     i:=1;
     if(UniformeSepara()<>true) then exit;

    //SWITCH RADIO BUTTON
    //Case 1:
    if(RadioButton1.Checked=true) then
    begin
      Uniforme;
    end;

    //Case 2:
    if(RadioButton2.Checked=true) then
    begin
      Bissecao;

    end;

    //Case 3:
    if(RadioButton3.Checked=true) then
    begin
      Cordas;

    end;

    //Case 4:
    if(RadioButton4.Checked=true) then
    begin
      CordasModificado;

    end;

    //Case 5:
    if(RadioButton5.Checked=true) then
    begin
      Newton;

    end;

    //Case 6:
    if(RadioButton6.Checked=true) then
    begin
      NewtonModificado;

    end;

    //Ajusta grid
    while(StringGrid1.Cells[i,2]<>'') do
    begin
         i:=i+1;
    end;
    StringGrid1.ColCount:= i;
end;




//===========================================================
//                         BOTÃO PARAR
//===========================================================
procedure TForm1.SpeedButton3Click(Sender: TObject);
var
 x: Extended;
begin
   showmessage('Implement');
end;




//===========================================================
//                         BOTÃO  LIMPAR
//===========================================================
procedure TForm1.SpeedButton4Click(Sender: TObject);
var
 x: Extended;
begin
   Edit1.text:='';
   Edit2.text:='';
   Edit3.text:='';
   Edit4.text:='';
   Edit5.text:='';
   StringGrid1.Clean;
   StringGrid1.Cells[0,0] :='i';
   StringGrid1.Cells[0,1] :='a[i]';
   StringGrid1.Cells[0,2] :='b[i]';
   StringGrid1.Cells[0,3] :='Raiz';
end;

end.

