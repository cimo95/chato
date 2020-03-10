unit uutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, shellapi, filectrl, xpman, jpeg, pngimage, ExtCtrls,
  StdCtrls, ComCtrls, Menus, inifiles;

type
  T_0 = class(TForm)
    _5: TImage;
    _6: TLabel;
    _7: TLabel;
    _d: TRichEdit;
    _2: TGroupBox;
    _3: TScrollBox;
    _8: TMainMenu;
    _9: TMenuItem;
    _a: TMenuItem;
    _b: TMenuItem;
    _c: TMenuItem;
    _1: TButton;
    _e: TTimer;
    _4: TListBox;
    _f: TRichEdit;
    procedure FormDestroy(Sender: TObject);
    procedure _1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
  public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  end;

var
  _0: T_0;

implementation

uses
  upf;

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

procedure T_0.FormDestroy(Sender: TObject);
begin
  va.Free;
end;

procedure T_0._1Click(Sender: TObject);
begin
  try
    p4(_4.ItemIndex);
  except
    MessageBox(Handle, 'The dialogue is over.', PChar(caption), 16);
  end;
end;

procedure T_0.FormShow(Sender: TObject);
begin
  va := TIniFile.Create(ChangeFileExt(application.ExeName, '.ini'));
  vb := va.ReadInteger('settings', 'kudcount', 0);
  _0.Caption := 'Chato - ' + va.ReadString('settings', 'title', 'untitled');

  _6.Caption := va.ReadString('settings', 'header', 'Un-Headered');
  _7.Caption := va.ReadString('settings', 'subHeader', 'Un-SubHeadered');
  vc := 0;
  vd := false;
  p3;
  vlo := v13;
  p0(vc);
end;

end.

