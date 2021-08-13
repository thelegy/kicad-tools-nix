{ lib, buildPythonPackage, fetchPypi, regex, prettytable, pypng, euclid3 }:

buildPythonPackage rec {
  pname = "solidpython";
  version = "1.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-a9jsirM5hkGz45MauqOLdImT2HmKudkBtwC0U0keLtk=";
  };

  patchPhase = ''
    sed -i "s/'regex>=2019\\.4,<2020\\.0'/'regex>=2019.4'/" setup.py
    sed -i "s/'PrettyTable==0\\.7\\.2'/'PrettyTable>=0.7.2'/" setup.py
  '';

  propagatedBuildInputs = [ regex prettytable pypng euclid3 ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
