final: prev:

with final;

{

  python3 = prev.python3.override {
    packageOverrides = pfinal: pprev: {
      PcbDraw = pfinal.callPackage ./PcbDraw.nix {};
      PyMeta3 = pfinal.callPackage ./pymeta3.nix {};
      euclid3 = pfinal.callPackage ./euclid3.nix {};
      kikit = pfinal.callPackage ./kikit.nix {};
      pybars3 = pfinal.callPackage ./pybars3.nix {};
      pypng = pfinal.callPackage ./pypng.nix {};
      solidpython = pfinal.callPackage ./solidpython.nix {};
      svgpathtools = pfinal.callPackage ./svgpathtools.nix {};
      pcbnewTransition = pfinal.callPackage ./pcbnewTransition.nix {};
    };
  };

  kikit = with python3Packages; toPythonApplication kikit;

}
