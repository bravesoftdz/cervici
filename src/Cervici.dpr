program Cervici;

uses
  Forms,
  Ovladani in 'Ovladani.pas' {Form1},
  Nastaveni in 'Nastaveni.pas' {F_Options},
  NasatveniHrace in 'NasatveniHrace.pas' {F_GamerData},
  StartSet in 'StartSet.pas' {F_StartSet},
  Odpocet in 'Odpocet.pas' {F_Odpocet};

{$R *.res}

begin
  Application.Title := 'Èervíci';
  Application.Initialize;
  Application.CreateForm(TF_StartSet, F_StartSet);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TF_Options, F_Options);
  Application.CreateForm(TF_GamerData, F_GamerData);
  Application.CreateForm(TF_Odpocet, F_Odpocet);
  Application.Run;
end.
