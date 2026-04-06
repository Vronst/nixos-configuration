{ self, inputs, ... }: {
  flake.nixosConfigurations.vixos = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.vixosConfiguration
      { _module.args.user = "vronst"; }
    ];
  };
}
