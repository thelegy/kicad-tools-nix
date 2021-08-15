final: prev:

with final;

{

  python3 = prev.python3.override {
    packageOverrides = pfinal: pprev: {
      PcbDraw = pfinal.callPackage ./PcbDraw.nix {};
      PyMeta3 = pfinal.callPackage ./pymeta3.nix {};
      euclid3 = pfinal.callPackage ./euclid3.nix {};
      kibot = pfinal.callPackage ./kibot.nix {};
      kikit = pfinal.callPackage ./kikit.nix {};
      pcbnewTransition = pfinal.callPackage ./pcbnewTransition.nix {};
      pybars3 = pfinal.callPackage ./pybars3.nix {};
      pypng = pfinal.callPackage ./pypng.nix {};
      solidpython = pfinal.callPackage ./solidpython.nix {};
      svgpathtools = pfinal.callPackage ./svgpathtools.nix {};
      XlsxWriter = pfinal.callPackage ./XlsxWriter.nix {};
      kiauto = pfinal.callPackage ./kiauto.nix {};
      kibom = pfinal.callPackage ./kibom.nix {};
      InteractiveHtmlBom = pfinal.callPackage ./InteractiveHtmlBom.nix {};
      KiCost = pfinal.callPackage ./KiCost.nix {};
    };
  };

  kibom = with python3Packages; toPythonApplication kibom;
  kibot = with python3Packages; toPythonApplication kibot;
  kikit = with python3Packages; toPythonApplication kikit;
  ibom = with python3Packages; toPythonApplication InteractiveHtmlBom;

}
