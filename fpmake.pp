{
   File generated automatically by Lazarus Package Manager

   fpmake.pp for sm 0.0

   This file was generated on 24.09.2018
}

{$ifndef ALLPACKAGES} 
{$mode objfpc}{$H+}
program fpmake;

uses fpmkunit;
{$endif ALLPACKAGES}

procedure add_sm(const ADirectory: string);

var
  P : TPackage;
  T : TTarget;

begin
  with Installer do
    begin
    P:=AddPackage('sm');
    P.Version:='0.0';

    P.Directory:=ADirectory;

    P.Dependencies.Add('fcl');
    P.Options.Add('-MObjFPC');
    P.Options.Add('-Scghi');
    P.Options.Add('-O1');
    P.Options.Add('-g');
    P.Options.Add('-gl');
    P.Options.Add('-l');
    P.Options.Add('-vewnhibq');
    P.UnitPath.Add('.');
    T:=P.Targets.AddUnit('sm.pas');
    t.Dependencies.AddUnit('secmeth');

    T:=P.Targets.AddUnit('secmeth.pas');

    // copy the compiled file, so the IDE knows how the package was compiled
    P.InstallFiles.Add('sm.compiled',AllOSes,'$(unitinstalldir)');

    end;
end;

{$ifndef ALLPACKAGES}
begin
  add_sm('');
  Installer.Run;
end.
{$endif ALLPACKAGES}
