unit FctDef;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function F(x: Extended): Extended;

implementation

function F(x: Extended): Extended;
begin
  x := x - 2;
  Result := x * x * x
end;

end.

