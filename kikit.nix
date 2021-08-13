{ lib, pkgs, buildPythonPackage, fetchPypi, versioneer, PyMeta3, click, markdown2, numpy, pybars3, shapely, solidpython, kicad, wxPython_4_0, PcbDraw }:

buildPythonPackage rec {
  pname = "KiKit";
  version = "0.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-47YcpkDsyJCWeaw4kX7RTRXFsTjLd5l+ESe6ljMBXLw=";
  };

  buildInputs = [ versioneer ];
  propagatedBuildInputs = [ pkgs.zip PyMeta3 click markdown2 pybars3 shapely solidpython kicad wxPython_4_0 PcbDraw ];

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
