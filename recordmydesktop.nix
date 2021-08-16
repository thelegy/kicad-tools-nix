{ stdenv, fetchFromGitHub, autoreconfHook, autoconf, zlib, popt, xorg, libvorbis, libtheora }:

stdenv.mkDerivation rec {
  pname = "recordmydesktop";
  version = "0.4.0";
  src = fetchFromGitHub {
    owner = "Enselic";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-hvl0cCaWQYSof8POxWSIwM0Q/wMZZZtwwXQxUt85Uzc=";
  };
  postUnpack = "sourceRoot=\${sourceRoot}/recordmydesktop";
  buildInputs = [ autoreconfHook autoconf zlib popt xorg.libICE xorg.libSM xorg.libX11 xorg.libXext xorg.libXfixes xorg.libXdamage libvorbis libtheora ];
}
