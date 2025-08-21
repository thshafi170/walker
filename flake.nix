{
  description = ''
    Multi-Purpose Launcher with a lot of features. Highly Customizable and fast.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    ...
  }: let
    inherit (nixpkgs) lib;
    eachSystem = f:
      lib.genAttrs (import systems)
      (system: f nixpkgs.legacyPackages.${system});
  in {
    formatter = eachSystem (pkgs: pkgs.alejandra);

    devShells = eachSystem (pkgs: {
      default = pkgs.mkShell {
        name = "walker";
        inputsFrom = [self.packages.${pkgs.system}.walker];
      };
    });

    packages = eachSystem (pkgs: {
      default = self.packages.${pkgs.system}.walker;
      walker = pkgs.callPackage ./nix/package.nix {};
    });

    homeManagerModules = {
      default = self.homeManagerModules.walker;
      walker = import ./nix/modules/home-manager.nix self;
    };

    nixosModules = {
      default = self.nixosModules.walker;
      walker = import ./nix/modules/nixos.nix self;
    };
  };
}