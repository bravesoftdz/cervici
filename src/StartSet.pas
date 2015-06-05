unit StartSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TF_StartSet = class(TForm)
    B_Start: TButton;
    GB_Hraci: TGroupBox;
    GB_Hrac1: TGroupBox;
    GB_Hrac2: TGroupBox;
    E_Hr1_Name: TEdit;
    Label1: TLabel;
    CB_Hr1Col: TColorBox;
    Label2: TLabel;
    Label3: TLabel;
    E_Hr2_Name: TEdit;
    CB_Hr2Col: TColorBox;
    Label4: TLabel;
    M_Info: TMemo;
    Label5: TLabel;
    CB_Rychlost: TComboBox;
    Memo1: TMemo;
    procedure B_StartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_StartSet: TF_StartSet;

implementation

uses Ovladani, Odpocet;

{$R *.dfm}

procedure TF_StartSet.B_StartClick(Sender: TObject);
var Start:Boolean;
 begin
  Start := true;
  if (Start) and (E_Hr1_Name.Text = '') then
   begin
    Start := false;
    MessageBox(F_StartSet.Handle,'Vyplnte Nick hrace 1','Nelze spustit',MB_OK OR MB_ICONWARNING);
   end;
  if (Start) and (E_Hr2_Name.Text = '') then
   begin
    Start := false;
    MessageBox(F_StartSet.Handle,'Vyplnte Nick hrace 2','Nelze spustit',MB_OK OR MB_ICONWARNING);
   end;
  if (Start) then
   begin
    Cervik[0].Barva := CB_Hr1Col.Selected;
    Cervik[1].Barva := CB_Hr2Col.Selected;
    Cervik[0].Nazev := E_Hr1_Name.Text;
    Cervik[1].Nazev := E_Hr2_Name.Text;
    Cervik[0].Jmeno.Font.Color := Cervik[0].Barva;
    Cervik[1].Jmeno.Font.Color := Cervik[1].Barva;
    Cervik[0].Jmeno.Caption := Cervik[0].Nazev;
    Cervik[1].Jmeno.Caption := Cervik[1].Nazev;
    Cervik[0].Jmeno.Left  := Round(Cervik[0].PoziceX)-Round(Cervik[0].Jmeno.Width/2);
    Cervik[0].Jmeno.Top   := Round(Cervik[0].PoziceY-25);
    Cervik[1].Jmeno.Left  := Round(Cervik[1].PoziceX)-Round(Cervik[1].Jmeno.Width/2);
    Cervik[1].Jmeno.Top   := Round(Cervik[1].PoziceY-25);

    Rychlost := CB_Rychlost.ItemIndex;

    Form1.Show;
    F_StartSet.Hide;
    Form1.Odpocet;
    Form1.T_Function.Interval := Form1.GetRychlost(Rychlost);
   end;//if Start
 end;//procedure

end.//unit
