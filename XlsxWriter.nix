{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "XlsxWriter";
  version = "3.0.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Pzm/WBxV860UOLwXDX9MRknO6La3qA0h95UIEY7upSo=";
  };

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
