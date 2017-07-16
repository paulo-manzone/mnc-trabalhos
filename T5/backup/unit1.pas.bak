unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
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

//==========================================================
//                 Inicializando Formulário
//==========================================================

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  // == StringGrid1 ==
  StringGrid1.Cells[0,0]:='i';
  StringGrid1.Cells[1,0]:='x(i)';
  StringGrid1.Cells[2,0]:='y(i)';
  //Indices i
  for i:=1 to 99 do
  begin
      StringGrid1.Cells[0,i]:=IntToStr(i);
  end;
  // == StringGrid2 ==
  StringGrid2.Cells[0,0]:='Polinômio';
  StringGrid2.Cells[1,0]:='Grau';
  StringGrid2.Cells[2,0]:='Check';
  StringGrid2.Cells[3,0]:='a[0]';
  StringGrid2.Cells[4,0]:='a[1]';
  StringGrid2.Cells[5,0]:='a[2]';
  StringGrid2.Cells[6,0]:='a[3]';
  StringGrid2.Cells[7,0]:='a[4]';
  StringGrid2.Cells[8,0]:='a[5]';
  for i:=1 to 5 do
  begin
      StringGrid2.Cells[0,i]:=IntToStr(i);
      StringGrid2.Cells[1,i]:=IntToStr(i+1);
  end;

  // == StringGrid3 ==
  StringGrid3.Cells[0,0]:='Equação';
  StringGrid3.Cells[1,0]:='a';
  StringGrid3.Cells[2,0]:='b';
  StringGrid3.Cells[3,0]:='R';
  StringGrid3.Cells[0,1]:='y=a+bx';
  StringGrid3.Cells[0,2]:='y=a*b^x';
  StringGrid3.Cells[0,3]:='y=a*e(b*x)';
  StringGrid3.Cells[0,4]:='y=a*b^(e*x)';



end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CheckBox1.Checked:=True;
  CheckBox2.Checked:=True;
  CheckBox3.Checked:=True;
  CheckBox4.Checked:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
end;

end.

