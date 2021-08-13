{ lib, buildPythonPackage, fetchPypi, versioneer, kicad }:

buildPythonPackage rec {
  pname = "pcbnewTransition";
  version = "0.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-X1BhVa4PYLCjFCwPy0EE3VtQRkEM3k8WAkDTY4IUVjk=";
  };

  buildInputs = [ versioneer ];
  propagatedBuildInputs = [ kicad ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
