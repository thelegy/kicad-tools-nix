{ lib, buildPythonPackage, fetchPypi, versioneer, PyMeta3, Wand, lxml, svgpathtools, click, pybars3, pyyaml, pcbnewTransition, mistune }:

buildPythonPackage rec {
  pname = "PcbDraw";
  version = "0.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-2SE7J+z3jd0TZ8dazAVHmdfRodbXMle2fxRvcVTRuMk=";
  };

  buildInputs = [ versioneer ];
  propagatedBuildInputs = [ PyMeta3 Wand lxml svgpathtools click pybars3 pyyaml pcbnewTransition mistune ];

  doCheck = false;

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
