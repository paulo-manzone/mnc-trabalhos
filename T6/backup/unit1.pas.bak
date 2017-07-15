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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
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

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text:= '4x^2+3';
  Edit2.Text:= '-1';
  Edit3.Text:= '1';
  Edit4.Text:= '20';
  RadioButton2.Checked:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label5.Caption:= Edit2.Text;
  Label6.Caption:= Edit3.Text;
  Label7.Caption:= '(' + Edit1.Text + ') . dx ';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:= '';
  Edit2.Text:= '';
  Edit3.Text:= '';
  Edit4.Text:= '';
  RadioButton1.Checked:=True;
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

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

end.

