{ lib, pkgs, buildPythonPackage, fetchFromGitHub, pytest, pytest-cov, coverage, pyyaml, XlsxWriter, requests, colorama, kiauto, kibom, kicad-combined, InteractiveHtmlBom, KiCost, PcbDraw, librsvg, imagemagick }:

buildPythonPackage rec {
  pname = "kibot";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "INTI-CMNB";
    repo = "KiBot";
    rev = "v${version}";
    sha256 = "sha256-uTiAQUxu2xMkZlaMJbgW8UlkKnQkTmFwFrki/omIEYc=";
  };

  patchPhase = ''
    sed -i 's/COVERAGE_SCRIPT =.*/COVERAGE_SCRIPT = "coverage"/' tests/utils/context.py
  '';

  nativeBuildInputs = [ coverage ];
  buildPhase = ''
    python3 setup.py sdist bdist_wheel
    coverage run -a src/kibot --help-outputs > /dev/null
  '';
  propagatedBuildInputs = [ pyyaml XlsxWriter requests colorama kiauto kibom pkgs.zip pkgs.unzip pkgs.gnutar InteractiveHtmlBom KiCost pkgs.xlsx2csv PcbDraw librsvg imagemagick pkgs.libxslt kicad-combined ];
  checkInputs = [ pytest pytest-cov coverage ] ++ propagatedBuildInputs;
  # test_gerber_inner_ok uses the `rar` command wich is not available
  # test_kicad_conf_* tests may fail due to the way kicad works on nix
  checkPhase = ''
    export HOME=$(mktemp -d)
    mkdir $HOME/.config
    cp -r ${./kicad_config} $HOME/.config/kicad
    chmod -R u+w $HOME/.config
    pytest --no-cov \
      -k 'not test_gerber_inner_ok'\
    ' and not test_kicad_conf_guess_libs'\
    ' and not test_kicad_conf_local_conf'\
    ' and not test_kicost_simple'\
    ' and not test_kicost_bom_simple'\
    ' and not test_makefile_1'\
    ' and not test_makefile_2'\
    ' and not test_pre_xrc_fail'\
    ' and not test_step_fail'\
    ' and not test_pcbdraw_variant_1'\
    ' and not test_pcbdraw_variant_2'\
    ' and not test_pcbdraw_variant_3'\
    ' and not test_pdf_refill'\
    ' and not test_pdf_variant_1'\
    ' and not test_erc_fail_1'\
    ' and not test_erc_warning_1'\
    ' and not test_erc_warning_2'\
    ' and not test_print_sch_variant_ni_1'\
    ' and not test_print_sch_svg_variant_ni_1'\
    ' and not test_print_sch_variant_ni_2'\
    ' and not test_step_1'\
    ' and not test_step_3'\
    ' and not test_step_variant_1'
  '';

  pipInstallFlags = [ "--no-compile" ];

  meta = with lib; {
    maintainers = with maintainers; [ thelegy ];
  };
}
