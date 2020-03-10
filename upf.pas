unit upf;

interface

uses
  Windows, Variants, Classes, SysUtils, inifiles, Forms, Graphics,
  Dialogs, comctrls;

function f0(v0: string; v1: array of string): Integer;

function f1(v2: string): string;

function f3(v7: string; v8: Char): TStringlist;

procedure p0(v3: integer);

procedure p1(v4, v5: string);

procedure p2(v6: integer);

procedure p3;

procedure p4(v9: Integer);

var
  va: Tinifile;
  vb, vc: Integer;
  vd: Boolean;
  ve, vf: string;
  v12, v13, vlo: tfont;

implementation

uses
  uutama;

const
  c0 = '|Bold';
  c1 = '|Italic';
  c2 = '|Underline';
  c3 = '|Strikeout';

var
  v10, v11: array of string;

procedure p5(v14: string; v15: TFont);
var
  v16: integer;
  v17: string;
begin
  try
    with v15 do
    begin
      v16 := Pos(',', v14);
      Name := Copy(v14, 2, v16 - 3);
      Delete(v14, 1, v16);
      v16 := Pos(',', v14);
      Size := StrToInt(Copy(v14, 2, v16 - 2));
      Delete(v14, 1, v16);
      v16 := Pos(',', v14);
      v17 := '|' + Copy(v14, 3, v16 - 4);
      Delete(v14, 1, v16);
      Color := StringToColor(Copy(v14, 3, Length(v14) - 3));
      Style := [];

      if (Pos(c0, v17) > 0) then
        Style := Style + [fsBold];

      if (Pos(c1, v17) > 0) then
        Style := Style + [fsItalic];

      if (Pos(c2, v17) > 0) then
        Style := Style + [fsUnderline];

      if (Pos(c3, v17) > 0) then
        Style := Style + [fsStrikeout];
    end;
  except
  end;
end;

function f4(v15: TFont): string;
var
  v18: string;
begin
  with v15 do
  begin
    v18 := '';
    if (fsBold in Style) then
      v18 := v18 + c0;
    if (fsItalic in Style) then
      v18 := v18 + c1;
    if (fsUnderline in Style) then
      v18 := v18 + c2;
    if (fsStrikeout in Style) then
      v18 := v18 + c3;
    if ((Length(v18) > 0) and ('|' = v18[1])) then
    begin
      v18 := Copy(v18, 2, Length(v18) - 1);
    end;
    Result := Format('"%s", %d, [%s], [%s]', [Name, Size, v18,
      ColorToString(Color)]);
  end;
end;

function f0(v0: string; v1: array of string): Integer;
var
  v21: integer;
begin
  Result := -1;
  for v21 := 0 to Length(v1) - 1 do
  begin
    if CompareText(v0, v1[v21]) = 0 then
    begin
      Result := v21;
      Break;
    end;
  end;
end;

function f1(v2: string): string;
var
  v22: Integer;
begin
  Result := v2;
  for v22 := 0 to Length(v10) - 1 do
  begin
    if Pos(v10[v22], Result) <> 0 then
      if (Result[Pos(v10[v22], Result) - 1] <> '\') then
        Result := StringReplace(Result, v10[v22], v11[v22], [rfReplaceAll]);
  end;
end;

procedure p6(v19: string; v20: integer);
begin
  if vc = 0 then
    exit;
  _0._d.Lines.Add(v19);
  application.ProcessMessages;
  sleep(100 * v20);
  application.ProcessMessages;
  _0._d.Lines.Delete(_0._d.Lines.Count - 1);
end;

procedure p0(v3: integer);
var
  tf: tfont;
  s: string;
begin
  with _0 do
  begin
    p6(f1(va.ReadString('settings', 'typingText', '. . .')), length(va.ReadString
      ('settings', 'typingText', '. . .')));
    _d.WordWrap := false;
    s := f1(va.ReadString('role', IntToStr(v3) + 'text', ''));
    if s <> '' then
    begin
      _d.SelStart := _d.GetTextLen;
      _d.Lines.Add(s);
      _d.SelLength := Length(s);
      _d.SelAttributes.Name := v13.Name;
      _d.SelAttributes.Size := v13.Size;
      _d.SelAttributes.Style := v13.Style;
      _d.SelAttributes.Color := v13.Color;
    end;
      p2(v3);
      vlo := v13;
      p6('', 10);
    _d.WordWrap := true;
  end;
end;

function f5(v23: array of string; v24: string): integer;
var
  v25: integer;
begin
  result := -1;
  v25 := -1;
  while result = -1 do
  begin
    if v23[v25] = v24 then
      result := v25
    else
      Inc(v25, 1);
  end;
end;

procedure p1(v4, v5: string);
label
  l0;
const
  c4: array[0..2] of string = ('!SKIP', '!END', '!QUERY');
var
  v26: tstringlist;
  v27: string;
  v28: integer;
begin
  v26 := tstringlist.Create;
  v26.Text := stringreplace(v4, ' ', #13#10, [rfreplaceall]);
  case f0(AnsiUpperCase(v26.Strings[0]), c4) of
    0:
      begin
        vc := StrToInt(v5);
        p0(vc);
      end;
    1:
      begin
        vc := -1;
      end;
    2:
      begin
l0:
        repeat
          inputquery('Chato', v5, v27);
        until v27 <> '';
        v11[f5(v10, v26.Strings[1])] := v27;
        _0.SetFocus;
        vc := StrToInt(v26.Strings[2]);
        p0(vc);
      end;
  end;
end;

procedure p4(v9: Integer);
var
  v29: Integer;
  v30: tfont;
  v36: string;
begin
  v29 := va.ReadInteger('sel-' + ve, IntToStr(v9) + 'par', -1);
  with _0 do
  begin
    p6(f1(va.ReadString('settings', 'typingText', '. . .')), length(va.ReadString
      ('settings', 'typingText', '. . .')));
    _d.WordWrap := false;
    v36 := f1(_4.Items.Strings[_4.itemindex]);
    if v36 <> '' then
    begin
      _d.SelStart := _d.GetTextLen;
      _d.Lines.Add(v36);
      _d.SelLength := Length(v36);
      _d.SelAttributes.Name := v12.Name;
      _d.SelAttributes.Size := v12.Size;
      _d.SelAttributes.Style := v12.Style;
      _d.SelAttributes.Color := v12.Color;
    end;
      vlo := v12;
      p6('', 10);
    _d.WordWrap := true;

  end;
  p0(v29);
end;

procedure p2(v6: integer);
var
  v31, v32: integer;
begin
  ve := va.ReadString('role', IntToStr(v6) + 'sel', '!NOTHING');
  v31 := va.ReadInteger('sel-' + ve, 'count', 0);
  _0._4.Items.Clear;
  for v32 := 0 to v31 - 1 do
    if va.ReadString('sel-' + ve, IntToStr(v32) + 'opt', '')[1] <> '!' then
      _0._4.Items.Add(f1(va.ReadString('sel-' + ve, IntToStr(v32) + 'opt', '')))
    else
      p1(va.ReadString('sel-' + ve, IntToStr(v32) + 'opt', ''), va.ReadString
        ('sel-' + ve, IntToStr(v32) + 'par', ''));
end;

function f3(v7: string; v8: Char): TStringlist;
begin
  Result := TStringList.Create;
  Result.Text := stringreplace(v7, v8, #13#10, [rfreplaceall]);
end;

procedure p3;
var
  v33, v34: Integer;
begin
  v33 := va.ReadInteger('variables', 'Count', 0);
  setlength(v10, v33);
  setlength(v11, v33);
  for v34 := 0 to v33 - 1 do
  begin
    v10[v34] := va.ReadString('variables', inttostr(v34) + 'name', '');
    v11[v34] := va.ReadString('variables', inttostr(v34) + 'init', '');
  end;
  v13 := tfont.Create;
  v12 := tfont.Create;
  p5(va.ReadString('settings', 'partnerFont',
    '"Tahoma", 10, [], [clRed]'), v13);
  p5(va.ReadString('settings', 'yourFont', '"Tahoma", 10, [], [clGreen]'), v12);
end;

end.

