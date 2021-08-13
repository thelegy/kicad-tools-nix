{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "PyMeta3";
  version = "0.5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-GL2jJtmpu/WHv8DuC8loZJZNeLBnKIvPVdTZhoHQW8s=";
  };

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
