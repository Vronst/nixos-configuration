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
    home = home-manager.nixosModules.home-manager;
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
        home
      ];
    };

    # nixosConfigurations.server = nixpkgs.lib.nixosSystem {
    #   inherit system;
    #   specialArgs = {
    #     inherit inputs;
    #     username = "verver";
    #   };
    #   modules = [
    #     ./hosts/server
    #     home
    #   ];
    # };
  };
}
