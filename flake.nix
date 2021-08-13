{

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux"] (system: let
    pkgs = import nixpkgs {inherit system; overlays = [ self.overlay ]; };
  in rec {
    packages.kikit = pkgs.kikit;
    defaultPackage = packages.kikit;
  }) // {
    overlay = import ./.;
  };

}
