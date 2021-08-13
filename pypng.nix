{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pypng";
  version = "0.0.19";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-MUXQQpR/qBIea9Wn5ZFJhxv4wTZ1xCNx4Sl3SZ1/OSY=";
  };

  buildInputs = [ ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
