{ lib, buildPythonPackage, fetchPypi, PyMeta3 }:

buildPythonPackage rec {
  pname = "pybars3";
  version = "0.9.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-ashH6QXlO5xbk2rxEskQR14nv3Z/efRSjBb5rx7A4lI=";
  };

  buildInputs = [ PyMeta3 ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
