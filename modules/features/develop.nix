{ self, inputs, ... }: {
  # 1. This part makes "nix run .#develop" work
  perSystem = { self', pkgs, ... }: {
    packages.develop = pkgs.symlinkJoin {
      name = "develop-tools";
      paths = [
        pkgs.neovim pkgs.git pkgs.gnupg
        pkgs.unzip pkgs.p7zip pkgs.python314
      ];
    };

    apps.develop = {
      type = "app";
      program = "${self'.packages.develop}/bin/git";
    };
  };

  # 2. This part makes "nixos-rebuild" install them
  flake.nixosModules.develop = { pkgs, ... }: {
    # System-wide packages
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.develop
    ];

    # System-wide GnuPG settings
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    # Note: Git user settings belong in Home Manager.
    # For now, we just enable the git program system-wide.
    programs.git.enable = true;
  };
}
