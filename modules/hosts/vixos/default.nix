{ self, inputs, ... }: {
  flake.nixosConfigurations.vixos = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.vixosConfiguration
      self.nixosModules.identity

      ({ ... }: {username = "vronst";})
    ];

  };
}
