unit Odpocet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TF_Odpocet = class(TForm)
    L_Cas: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Odpocet: TF_Odpocet;

implementation

uses Ovladani;

{$R *.dfm}

procedure TF_Odpocet.FormShow(Sender: TObject);
 begin
  Form1.MM_1.Items.Items[0].Visible := false;
  Form1.MM_1.Items.Items[1].Visible := false;
 end;//procedure

procedure TF_Odpocet.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Form1.MM_1.Items.Items[0].Visible := true;
  Form1.MM_1.Items.Items[1].Visible := true;
 end;//procedure

end.//unit
