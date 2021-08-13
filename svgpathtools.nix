{ lib, buildPythonPackage, fetchPypi, svgwrite, numpy }:

buildPythonPackage rec {
  pname = "svgpathtools";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-equgeSOthbZigwHpLl5y/Q0KUFdiDhQjUJs6C2CbdIU=";
  };

  propagatedBuildInputs = [ svgwrite numpy ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
