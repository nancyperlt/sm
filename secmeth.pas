unit SecMeth;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TScalarFunction = function (x: Extended): Extended;
  ENoZero = class(Exception)

  end;

function Solve(F: TScalarFunction; a, b, e: Extended): Extended;

implementation

function Next(F: TScalarFunction; a, b: Extended): Extended;
var
  D: Extended;
begin
  if F(a) = 0 then Result := a
  else if F(b) = 0 then Result := b
  else begin
    D := F(b) - F(a);
    if D = 0 then Result := (a + b) / 2
    else Result := b - (b - a) / (F(b) - F(a)) * F(b)
  end
end;

function Solve(F: TScalarFunction; a, b, e: Extended): Extended;
begin
  Result := Next(F, a, b);
  while Abs(F(Result)) >= e do begin
    if (a = b) or (a = Result) or (b = Result) then
      {precision limit reached}
      raise ENoZero.CreateFmt('No zero in [%g, %g] gefunden',
        [a, b]);
    a := b; b := Result;
    Result := Next(F, a, b);
  end;
end;

end.

