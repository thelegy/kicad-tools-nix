{ lib, pkgs, buildPythonPackage, fetchFromGitHub, lxml, beautifulsoup4, tqdm, requests, XlsxWriter, validators, colorama, wxPython_4_0 }:

buildPythonPackage rec {
  pname = "KiCost";
  version = "1.1.5rc5";

  src = fetchFromGitHub {
    owner = "INTI-CMNB";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-tHDva3rAoIEMG7ypYm+dqFp3pdvugWh2NNxvZLA0jbc=";
  };

  propagatedBuildInputs = [ lxml beautifulsoup4 tqdm requests XlsxWriter validators colorama wxPython_4_0 ];

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
