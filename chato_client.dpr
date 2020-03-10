program chato_client;

uses
  Forms,
  uutama in 'uutama.pas' {_0},
  upf in 'upf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Chato';
  Application.CreateForm(T_0, _0);
  Application.Run;
end.
