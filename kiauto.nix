{ lib, pkgs, buildPythonPackage, fetchFromGitHub, psutil, xvfbwrapper, recordmydesktop, xdotool, xorg, x11vnc, kicad-combined, pytest, coverage, imagemagick, ghostscript, librsvg, fluxbox }:

buildPythonPackage rec {
  pname = "kiauto";
  version = "1.5.8";

  src = fetchFromGitHub {
    owner = "INTI-CMNB";
    repo = "KiAuto";
    rev = "v${version}";
    sha256 = "sha256-pRDc8E1ju9ZKnI0DhPUA0GP4SN0F3WjGPgCwEq7ar/8=";
  };

  patchPhase = ''
    sed -i 's/COVERAGE_SCRIPT =.*/COVERAGE_SCRIPT = "coverage"/' tests/utils/context.py
    sed -i 's|/usr/share/kicad/|${kicad-combined}/share/kicad/|' src/* kiauto/*
    sed -i 's|cmd = \[PROG,|\0 "--record",|' tests/eeschema/* tests/pcbnew/*
  '';

  propagatedBuildInputs = [ psutil xvfbwrapper kicad-combined recordmydesktop xdotool xorg.setxkbmap x11vnc pkgs.libxslt imagemagick ghostscript librsvg fluxbox ];

  makeWrapperArgs = [ "--unset GTK_USE_PORTAL" ];

  checkInputs = [ pytest coverage ] ++ propagatedBuildInputs;
  installCheckPhase = ''
    export HOME=$(mktemp -d)
    mkdir $HOME/.config
    cp -r ${./kicad_config} $HOME/.config/kicad
    chmod -R u+w $HOME/.config

    pytest --test_dir output \
      -k 'not test_print_pcb_good_dwg_2'
  '';

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
