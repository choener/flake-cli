{
  description = "CLI tools missing in nixpkgs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: let

    # each system
    eachSystem = system: let
      config = { allowUnfree = true;};
      pkgs = import nixpkgs {
        inherit system;
        inherit config;
        overlays = [ self.overlay ];
      };

    in rec {
      #apps.mates = { type = "app"; program = "${mates}/bin/mates"; };
      # by default, we get the @fhs@ environment to play around in.
      packages = { mates = pkgs.callPackage ./mates.nix {};
                 };
    }; # eachSystem

  in
    flake-utils.lib.eachDefaultSystem eachSystem // { overlay = final: prev: {
      mates = final.callPackage ./mates.nix {};
    };};
}

