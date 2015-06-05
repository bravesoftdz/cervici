unit NasatveniHrace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, ComCtrls;

type
  TF_GamerData = class(TForm)
    E_Nazev: TEdit;
    L_Gamer1: TLabel;
    L_Gamer2: TLabel;
    CB_Barva: TColorBox;
    B_SaveData: TButton;
    L_Gamer4: TLabel;
    L_Gamer3: TLabel;
    E_X: TEdit;
    E_Y: TEdit;
    B_Storno: TButton;
    procedure B_SaveDataClick(Sender: TObject);
    procedure E_XKeyPress(Sender: TObject; var Key: Char);
    procedure B_StornoClick(Sender: TObject);
  private
    CervikIndex:integer;
  public
    procedure OpenGamer(Gamer:integer);
  end;

var
  F_GamerData: TF_GamerData;

implementation

{$R *.dfm}

uses Ovladani, Nastaveni;

procedure TF_GamerData.OpenGamer(Gamer:integer);
 begin
  CervikIndex                   := Gamer;
  E_Nazev.Text                  := Cervik[Gamer].Nazev;
  Cervik[CervikIndex].Spusteno  := false;
  E_X.Text := IntToStr(Round(Cervik[CervikIndex].VychoziX));
  E_Y.Text := IntToStr(Round(Cervik[CervikIndex].VychoziY));
  CB_Barva.Selected := Cervik[CervikIndex].Barva;
  F_GamerData.ShowModal;
 end;

procedure TF_GamerData.B_SaveDataClick(Sender: TObject);
begin
 if (E_Nazev.Text = '') then
  begin
   MessageBox(F_GamerData.Handle,'Vyplnte jmeno hrace','Nelze ulozit',MB_OK OR MB_ICONWARNING);
   Exit;
  end;
 if (CB_Barva.ItemIndex = -1) then
  begin
   MessageBox(F_GamerData.Handle,'Vyplnte barvu hrace','Nelze ulozit',MB_OK OR MB_ICONWARNING);
   Exit;
  end;

 //samotne ukaldani dat
 Cervik[CervikIndex].Nazev    := E_Nazev.Text;
 Cervik[CervikIndex].Barva    := CB_Barva.Selected;
 Cervik[CervikIndex].Spusteno := false;
 Cervik[CervikIndex].VychoziX := StrToIntDef(E_X.Text,100);
 Cervik[CervikIndex].VychoziY := StrToIntDef(E_Y.Text,100);
 Cervik[CervikIndex].Barva    := CB_Barva.Colors[CB_Barva.ItemIndex];
 F_Options.LV_Hrac.Items.Item[CervikIndex].SubItems.Strings[0] := Cervik[CervikIndex].Nazev;
 F_Options.LV_Hrac.Items.Item[CervikIndex].SubItems.Strings[1] := CB_Barva.Items.Strings[CB_Barva.ItemIndex];

 Cervik[CervikIndex].Jmeno.Font.Color := Cervik[CervikIndex].Barva;
 Cervik[CervikIndex].Jmeno.Caption    := Cervik[CervikIndex].Nazev;
 Cervik[CervikIndex].Jmeno.Left       := Round(Cervik[CervikIndex].PoziceX)-Round(Cervik[CervikIndex].Jmeno.Width/2);
 Cervik[CervikIndex].Jmeno.Top        := Round(Cervik[CervikIndex].PoziceY-20);
 Cervik[CervikIndex].Jmeno.Visible    := true;

 F_GamerData.Close;
end;

procedure TF_GamerData.E_XKeyPress(Sender: TObject; var Key: Char);
 begin
  Key := Key;
  case Key of
   '0'..'9',#9,#8:begin
                  end else begin
                   Key := #0;
                  end;
   end;//case
 end;//procedure

procedure TF_GamerData.B_StornoClick(Sender: TObject);
 begin
  F_GamerData.Close;
 end;//procedure

end.//unit
