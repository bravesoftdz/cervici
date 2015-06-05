unit Ovladani;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, AppEvnts, StdCtrls;

type
  TForm1 = class(TForm)
    MM_1: TMainMenu;
    PM_Game: TMenuItem;
    M_Options: TMenuItem;
    PM_Go: TMenuItem;
    PM_Pause: TMenuItem;
    PM_Gamers: TMenuItem;
    T_Function: TTimer;
    I_Program: TImage;
    PM_DeleteObrz: TMenuItem;
    T_Odpocet: TTimer;
    N1: TMenuItem;
    PM_Exit: TMenuItem;
    PM_EndKolo: TMenuItem;
    procedure PM_GamersClick(Sender: TObject);
    procedure PM_GoClick(Sender: TObject);
    procedure T_FunctionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PM_PauseClick(Sender: TObject);
    procedure PM_DeleteObrzClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure T_OdpocetTimer(Sender: TObject);
    procedure PM_ExitClick(Sender: TObject);
    procedure PM_EndKoloClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Start;
    procedure Pause;
    procedure DetekujKlavesy;
    procedure Odpocet;
    function KontrolaNarazeni:boolean;
    function Win(Winner:integer):boolean;
    function GetRychlost(RychIndex:Integer):Smallint;
  end;

TCervik=record
 PoziceX,PoziceY:Real;
 VychoziX,VychoziY:integer;
 Spusteno:boolean;
 Barva:TColor;
 Nazev:String;
 Uhel:real;
 Jmeno:Tlabel;
 Cheat:Boolean;
end;

var
  Form1: TForm1;
  Cervik:array[0..4] of TCervik;
  Paused:boolean;
  PocetCerv:integer = 2;
  Rychlost:Shortint;

implementation

uses Nastaveni, StartSet, Odpocet;

{$R *.dfm}
procedure TForm1.Start;
var cyklus:integer;
 begin
  F_Options.LV_Hrac.Enabled:=false;
  for cyklus := 0 to PocetCerv-1 do
   begin
    Cervik[cyklus].Spusteno := true;
   end;
  PM_Go.Enabled     := false;
  PM_Pause.Enabled  := true;
  M_Options.Enabled := false;

  if (Paused) then
   begin
    Paused := false;
   end else begin
    I_program.Canvas.Pen.Color    := Form1.Color;
    I_program.Canvas.Brush.Color  := Form1.Color;
    I_program.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);
    for cyklus := 0 to PocetCerv-1 do
     begin
      Cervik[cyklus].PoziceX := Cervik[cyklus].VychoziX;
      Cervik[cyklus].PoziceY := Cervik[cyklus].VychoziY;
      Cervik[cyklus].Uhel    := (270/180)*pi;
     end;
   end;
 end;//procedure

procedure TForm1.Pause;
var cyklus:integer;
 begin
  M_Options.Enabled := true; 
  Paused := true;
  F_Options.LV_Hrac.Enabled := true;
  PM_Go.Enabled    := true;
  PM_Pause.Enabled := false;
  for cyklus := 0 to PocetCerv-1 do
   begin
    Cervik[cyklus].Spusteno := false;
   end;
 end;//procedure

procedure TForm1.PM_GamersClick(Sender: TObject);
 begin
  F_Options.ShowModal;
 end;//procedure

procedure TForm1.PM_GoClick(Sender: TObject);
 begin
  Start;
 end;//procedure

procedure TForm1.T_FunctionTimer(Sender: TObject);
var cyklus:integer;
begin
 DetekujKlavesy;
 if (PM_Go.Enabled = false) then
  begin
   KontrolaNarazeni;
  end;  
 for cyklus := 0 to PocetCerv-1 do
  begin
   if (Cervik[cyklus].Spusteno) then
    begin
     Cervik[cyklus].PoziceX := Cervik[cyklus].PoziceX + cos(Cervik[cyklus].Uhel)*((Rychlost+2) div 2);
     Cervik[cyklus].PoziceY := Cervik[cyklus].PoziceY + sin(Cervik[cyklus].Uhel)*((Rychlost+2) div 2);
     I_program.Canvas.Pen.Color   := Cervik[cyklus].Barva;
     I_program.Canvas.Brush.Color := Cervik[cyklus].Barva;
     I_program.Canvas.Ellipse(Round(Cervik[cyklus].PoziceX-5),Round(Cervik[cyklus].PoziceY-5),Round(Cervik[cyklus].PoziceX+5),Round(Cervik[cyklus].PoziceY+5));

     Cervik[cyklus].Jmeno.Font.Color  := Cervik[cyklus].Barva;
     Cervik[cyklus].Jmeno.Caption     := Cervik[cyklus].Nazev;
     Cervik[cyklus].Jmeno.Left        := Round(Cervik[cyklus].PoziceX)-Round(Cervik[cyklus].Jmeno.Width/2);
     Cervik[cyklus].Jmeno.Top         := Round(Cervik[cyklus].PoziceY-25);
    end else begin
     I_program.Canvas.Pen.Color   := Form1.Color;
     I_program.Canvas.Brush.Color := Form1.Color;
     I_program.Canvas.Ellipse(Cervik[cyklus].VychoziX-5,Cervik[cyklus].VychoziY-5,Cervik[cyklus].VychoziX+5,Cervik[cyklus].VychoziY+5);

     I_program.Canvas.Pen.Color   := Cervik[cyklus].Barva;
     I_program.Canvas.Brush.Color := Cervik[cyklus].Barva;
     I_program.Canvas.Ellipse(Round(Cervik[cyklus].VychoziX-5),Round(Cervik[cyklus].VychoziY-5),Round(Cervik[cyklus].VychoziX+5),Round(Cervik[cyklus].VychoziY+5));
    end;
  end;
end;//procedure

procedure TForm1.DetekujKlavesy;
 begin
  if GetKeyState(Ord('A'))and 128 = 128 then
   begin
    Cervik[0].Uhel := Cervik[0].Uhel - 0.05;
   end;
  if GetKeyState(Ord('D'))and 128 = 128 then
   begin
    Cervik[0].Uhel := Cervik[0].Uhel + 0.05;
   end;
  if GetKeyState(37)and 128 = 128 then
   begin
    Cervik[1].Uhel := Cervik[1].Uhel - 0.05;
   end;
  if GetKeyState(39)and 128 = 128 then
   begin
    Cervik[1].Uhel := Cervik[1].Uhel + 0.05;
   end;
  if GetKeyState(Ord('4'))and 128 = 128 then
   begin
    Cervik[2].Uhel := Cervik[2].Uhel - 0.05;
   end;
  if GetKeyState(Ord('6'))and 128 = 128 then
   begin
    Cervik[2].Uhel := Cervik[2].Uhel + 0.05;
   end;
 end;

function TForm1.KontrolaNarazeni:boolean;
var cyklus:integer;
 begin
  for cyklus := 0 to PocetCerv-1 do
   begin
    if (Canvas.Pixels[Round(Cervik[cyklus].PoziceX + Cos(Cervik[cyklus].Uhel) * 7),Round(Cervik[cyklus].PoziceY + Sin(Cervik[cyklus].Uhel) * 7)] <> Form1.Color) and (not Cervik[cyklus].Cheat) then
     begin
      Result := true;
      Win(Cyklus);
      Break;
     end;
   end;//for
 end;//procedure

function TForm1.Win(Winner:integer):boolean;
var cyklus:integer;
    Spusteno,SpustenoPr:boolean;
    NewPlay:Boolean;
 begin
  NewPlay := false;
  Result:=false;
  Spusteno:=false;
  Cervik[Winner].Spusteno:=false;
  for cyklus := 0 to PocetCerv-1 do
   begin
    if (Cervik[cyklus].Spusteno = true) then
     begin
      if not (SpustenoPr) then
       begin
        SpustenoPr:=true;
       end else begin
        Spusteno:=true;
       end;
     end;//if
   end;//
  if (not Spusteno) and (SpustenoPr) then
   begin
    PM_Go.Enabled:=true;
    PM_Pause.Enabled:=false;
    for cyklus := 0 to PocetCerv-1 do
     begin
      if Cervik[cyklus].Spusteno then
       begin
        Result:=true;
        Cervik[cyklus].Spusteno:=false;
        Beep;
        if (MessageBox(Form1.Handle,PChar('Vyhr·l hr·Ë '+Cervik[cyklus].Nazev+', chcete hr·t znovu?'),'Informace',MB_YESNO OR MB_ICONQUESTION) = mrYes) then
         begin
          NewPlay := true;
         end;
        F_Options.LV_Hrac.Enabled:=true;
        Break;
       end;
     end;
   end;
  if (NewPlay) then
   begin
    PM_DeleteObrzClick(PM_DeleteObrz);
    Form1.Odpocet;
   end else begin//procedure
    Form1.Close;
   end;
 end;//procedure

procedure TForm1.FormCreate(Sender: TObject);
begin
 Randomize;
end;

procedure TForm1.PM_PauseClick(Sender: TObject);
begin
 Pause;
end;

procedure TForm1.PM_DeleteObrzClick(Sender: TObject);
var cyklus:integer;
begin
 Form1.I_program.Canvas.Pen.Color:=Form1.Color;
 Form1.I_program.Canvas.Brush.Color:=Form1.Color;
 Form1.I_program.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);

 for cyklus := 0 to PocetCerv-1 do
  begin
   Cervik[cyklus].PoziceX           := Cervik[cyklus].VychoziX;
   Cervik[cyklus].PoziceY           := Cervik[cyklus].VychoziY;
   Cervik[cyklus].Jmeno.Font.Color  := Cervik[cyklus].Barva;
   Cervik[cyklus].Jmeno.Caption     := Cervik[cyklus].Nazev;
   Cervik[cyklus].Jmeno.Left        := Round(Cervik[cyklus].PoziceX)-Round(Cervik[cyklus].Jmeno.Width/2);
   Cervik[cyklus].Jmeno.Top         := Round(Cervik[cyklus].PoziceY-20);
   Cervik[cyklus].Jmeno.Visible     := true;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 begin
  CanClose := true;
  F_StartSet.Close;
 end;//procedure

procedure TForm1.T_OdpocetTimer(Sender: TObject);
 begin
  F_Odpocet.L_Cas.Caption := IntToStr(StrToInt(F_Odpocet.L_Cas.Caption)-1);
  Beep;
  if (StrToInt(F_Odpocet.L_Cas.Caption) = 0) then
   begin
    F_Odpocet.Close;
    T_Odpocet.Enabled := false;
    PM_GoClick(PM_Go);
   end;//if StrToInt(L_Cas.Caption = 0)
 end;//procedure

procedure TForm1.Odpocet;
 begin
  F_Odpocet.Show;
  F_Odpocet.BringToFront;
  F_Odpocet.L_Cas.Caption := '3';
  Form1.T_Odpocet.Enabled := true;
  Beep;
 end;//procedure

function TForm1.GetRychlost(RychIndex:Integer):Smallint;
 begin
  case RychIndex of
   0:begin
      Result := 25;
     end;
   1:begin
      Result := 20;
     end;
   2:begin
      Result := 15;
     end;
   3:begin
      Result := 10;
     end;
   4:begin
      Result := 5;
     end;
  end;
 end;//procedure

procedure TForm1.PM_ExitClick(Sender: TObject);
 begin
  Form1.Close;
 end;//procedure

procedure TForm1.PM_EndKoloClick(Sender: TObject);
var cyklus:integer;
 begin
  for cyklus := 0 to PocetCerv-1 do
   begin
    Cervik[cyklus].Spusteno := false;
   end;
  PM_Go.Enabled    := true;
  PM_Pause.Enabled := false;
  PM_DeleteObrzClick(PM_DeleteObrz);
  Form1.Odpocet;
 end;//procedure

procedure TForm1.FormShow(Sender: TObject);
 begin
  T_Function.Enabled := true;
 end;//procedure

end.//program
