{ lib, pkgs, buildPythonPackage, fetchFromGitHub, wxPython_4_0, kicad }:

buildPythonPackage rec {
  pname = "InteractiveHtmlBom";
  version = "2.3.4-2";

  src = fetchFromGitHub {
    owner = "INTI-CMNB";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-5PFs9x+cG9PY0i2c4vvBvkkC3LpMfEtzBByCCrC68vU=";
  };

  propagatedBuildInputs = [ wxPython_4_0 kicad pkgs.git ];
  checkInputs = [ pkgs.git ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
