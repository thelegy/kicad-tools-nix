{ lib, buildPythonPackage, fetchFromGitHub, XlsxWriter }:

buildPythonPackage rec {
  pname = "kibom";
  version = "1.8.0-2";

  src = fetchFromGitHub {
    owner = "INTI-CMNB";
    repo = "KiBoM";
    rev = "v${version}";
    sha256 = "sha256-fLJXoBcBYFN7xJLJOC/05EXrToOUbIMxkKnSTALAcWo=";
  };

  propagatedBuildInputs = [ XlsxWriter ];

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
