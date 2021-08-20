{

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    wat = {
      url = gitlab:beini/wat?host=git.c3pb.de;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, wat, ... }:
  wat.lib.eachSystem ["x86_64-linux" "aarch64-linux"] (system: pkgs: rec {
    systemOverlays = [ self.overlay ];
    packages = { inherit (pkgs)
      ibom
      kibom
      kibot
      kikit
      kicad-combined
      recordmydesktop
      python3Packages
      ;
    };
    apps.kikit = { type = "app"; program = "${packages.kikit}/bin/kikit"; };
    apps.kikit-info = { type = "app"; program = "${packages.kikit}/bin/kikit-info"; };
    apps.kikit-plugin = { type = "app"; program = "${packages.kikit}/bin/kikit-plugin"; };
  }) // {
    overlay = import ./.;
  };

}
