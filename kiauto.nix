{ lib, buildPythonPackage, fetchPypi, psutil, xvfbwrapper, kicad }:

buildPythonPackage rec {
  pname = "kiauto";
  version = "1.5.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-bqeZgUn4ltVvpRqdEMu/Ur4Fxs7in5zg5NJkwFHEf7I=";
  };

  propagatedBuildInputs = [ psutil xvfbwrapper kicad ];

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
