unit Nastaveni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TF_Options = class(TForm)
    PC_Options: TPageControl;
    TS_Hraci: TTabSheet;
    TS_Rychlost: TTabSheet;
    TS_Konzole: TTabSheet;
    LV_Hrac: TListView;
    CB_Rychlost: TComboBox;
    E_Konzole: TEdit;
    M_Konzole: TMemo;
    B_Apply: TButton;
    procedure FormCreate(Sender: TObject);
    procedure LV_HracDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LV_HracCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure PC_OptionsChange(Sender: TObject);
    procedure CB_RychlostChange(Sender: TObject);
    procedure B_ApplyClick(Sender: TObject);
    procedure E_KonzoleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure NactiHrace(Pocet:integer);
    procedure UpdateTable;

    function IntToBool(Int:Integer):Boolean;
    function BoolToInt(Bool:Boolean):Integer;
  end;

var
  F_Options: TF_Options;

implementation

uses NasatveniHrace, Ovladani;

{$R *.dfm}

procedure TF_Options.NactiHrace(Pocet:integer);
var LVHrac:TListItem;
    cyklus:Integer;
 begin
  for cyklus := 0 to Pocet-1 do
   begin
    case cyklus of
     0:begin
        Cervik[cyklus].PoziceX := 100;
       end;
    1:begin
       Cervik[cyklus].PoziceX := Form1.Width-100;
      end;//case 1
    end;//case

    Cervik[cyklus].PoziceY  := Form1.ClientHeight - 50;
    Cervik[cyklus].VychoziX := Round(Cervik[cyklus].PoziceX);
    Cervik[cyklus].VychoziY := Round(Cervik[cyklus].PoziceY);
    Cervik[cyklus].Nazev    := IntToStr(cyklus);
    Cervik[cyklus].Uhel     := (270/180)*pi;

    LVHrac := LV_Hrac.Items.Add;
    LVHrac.Caption := IntToStr(cyklus+1);
    LVHrac.SubItems.Add(IntToStr(Cyklus+1));
    LVHrac.SubItems.Add('clBlack');

    Cervik[cyklus].Jmeno            := TLabel.Create(Form1);
    Cervik[cyklus].Jmeno.Font.Color := Cervik[cyklus].Barva;
    Cervik[cyklus].Jmeno.Caption    := Cervik[cyklus].Nazev;
    Cervik[cyklus].Jmeno.Left       := Round(Cervik[cyklus].PoziceX)-Round(Cervik[cyklus].Jmeno.Width/2);
    Cervik[cyklus].Jmeno.Top        := Round(Cervik[cyklus].PoziceY-10);
    Cervik[cyklus].Jmeno.Visible    := true;
    Cervik[cyklus].Jmeno.Parent     := Form1;
    Cervik[cyklus].Jmeno.BringToFront;
   end;
 end;

procedure TF_Options.FormCreate(Sender: TObject);
 begin
  NactiHrace(PocetCerv);
 end;

procedure TF_Options.LV_HracDblClick(Sender: TObject);
begin
 F_GamerData.OpenGamer(LV_Hrac.ItemIndex);
end;

procedure TF_Options.FormShow(Sender: TObject);
 begin
  UpdateTable;
  PC_Options.ActivePage := TS_Hraci;
 end;//procedure

procedure TF_Options.UpdateTable;
var cyklus:Integer;
    LI:TListItem;
 begin
  F_Options.LV_Hrac.Clear;
  for cyklus := 0 to PocetCerv-1 do
   begin
    LI := LV_Hrac.Items.Add;
    LI.Caption:=IntToStr(cyklus+1);
    LI.SubItems.Add(Cervik[cyklus].Nazev);
    LI.SubItems.Add(ColorToString(Cervik[cyklus].Barva));
   end;//for cyklus
 end;//procedure

procedure TF_Options.LV_HracCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
 begin
  LV_Hrac.Canvas.Brush.Color := Cervik[Item.Index].Barva;
 end;//procedure

procedure TF_Options.PC_OptionsChange(Sender: TObject);
 begin
  if (PC_Options.ActivePage = TS_Rychlost) then
   begin
    CB_Rychlost.ItemIndex := Rychlost;
   end;//if PC_Options.ActivePage = TS_Rychlost
 end;//procedure

procedure TF_Options.CB_RychlostChange(Sender: TObject);
 begin
  Rychlost := CB_Rychlost.ItemIndex;
  Form1.T_Function.Interval := Form1.GetRychlost(Rychlost);  
 end;//procedure

procedure TF_Options.B_ApplyClick(Sender: TObject);
var cyklus,cyklus1:integer;
    pole_dat:TStrings;
 begin
  pole_dat := TStringList.Create;
  ExtractStrings([' ','(',')'], [],PChar(LowerCase(E_Konzole.Text)),pole_dat);

  if (pole_dat.Count <> 0) then
   begin
    if ((pole_dat[0] = 'cheat') and (pole_dat.Count = 3)) then
     begin
      Cervik[StrToIntDef(pole_dat[1],0)].Cheat := IntToBool(StrToIntDef(pole_dat[2],0));
     end;
    M_Konzole.Lines.Add('Cerv '+Cervik[StrToIntDef(pole_dat[1],0)].Nazev+' (index = '+IntToStr(StrToIntDef(pole_dat[1],0))+') cheat = '+IntToStr(BoolToInt(Cervik[StrToIntDef(pole_dat[1],0)].Cheat)));

   end;//Count <> 0

  E_Konzole.Text := '';
  pole_dat.Free;
 end;//procedure

function TF_Options.IntToBool(Int:Integer):Boolean;
 begin
  if (Int = 1) then
   begin
    Result := true;
   end else begin
    Result := false;
   end;
 end;//function
 
procedure TF_Options.E_KonzoleKeyPress(Sender: TObject; var Key: Char);
 begin
  if (Key = #13) then
   begin
    B_ApplyClick(Self);
   end;//Key = #13
 end;//procedure

function TF_Options.BoolToInt(Bool:Boolean):Integer;
 begin
  if (Bool) then
   begin
    Result := 1;
   end else begin
    Result := 0;
   end;
 end;//function
 
end.//unit
