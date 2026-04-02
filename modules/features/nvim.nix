{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lig, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.nv;
    };
  };
  
  perSystem = { pkgs, lib, self', ... }: {
    packages.nv = inputs.wrapper-modules.wrappers.nvim.wrap {
      inherit pkgs;
      settings = {
        binds = {
	};
      };
    };
  };
}
