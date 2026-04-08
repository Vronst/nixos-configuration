{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
          url = "github:nix-community/home-manager/release-25.11";
          inputs.nixpkgs.follows = "nixpkgs"; # Keeps HM and NixOS on the same nixpkgs version
        };
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {

    # whole vixos
    nixosConfigurations.vixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        username = "vronst";
      };
      modules = [
        ./hosts/vixos
        home-manager.nixosModules.home-manager
      ];
    };

    #packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    #packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
