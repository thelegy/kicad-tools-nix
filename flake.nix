{

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux"] (system: let
    pkgs = import nixpkgs {inherit system; overlays = [ self.overlay ]; };
  in rec {
    packages.kibot = pkgs.kibot;
    packages.kibom = pkgs.kibom;
    packages.kikit = pkgs.kikit;
    packages.ibom = pkgs.ibom;
    apps.kikit = { type = "app"; program = "${packages.kikit}/bin/kikit"; };
    apps.kikit-info = { type = "app"; program = "${packages.kikit}/bin/kikit-info"; };
    apps.kikit-plugin = { type = "app"; program = "${packages.kikit}/bin/kikit-plugin"; };
  }) // {
    overlay = import ./.;
  };

}
