{ lib, symlinkJoin, kicad }:

symlinkJoin {
  name = "${kicad.pname}-combined-${kicad.version}";
  paths = [
    kicad
    kicad.base
  ];
}
