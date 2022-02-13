{

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    wat = {
      url = github:thelegy/wat;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, wat, ... }: with nixpkgs.lib; let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    overlay = import ./.;
    pkgs = wat.lib.withPkgsFor systems nixpkgs [overlay] id;
  in rec {

    inherit overlay;

    packages = genAttrs systems (system: {
      inherit (pkgs.${system})
      ibom
      kibom
      kibot
      kikit
      kicad-combined
      recordmydesktop
      ;
    });

    legacyPackages = genAttrs systems (system: { inherit (pkgs.${system}) python3Packages; });

    apps = genAttrs systems (system: {
      kikit = { type = "app"; program = "${packages.${system}.kikit}/bin/kikit"; };
      kikit-info = { type = "app"; program = "${packages.${system}.kikit}/bin/kikit-info"; };
      kikit-plugin = { type = "app"; program = "${packages.${system}.kikit}/bin/kikit-plugin"; };
    });

  };

}
