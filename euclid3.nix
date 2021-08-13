{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "euclid3";
  version = "0.01";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-JbgnpXrb/Zo/qGJeQ6vD6Qf2HeYiND5+U4SC75tG/Qs=";
  };

  buildInputs = [ ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
