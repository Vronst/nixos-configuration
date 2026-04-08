{ config, pkgs, lib, username, ... }:
{
  imports =
    [
    ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # users.users.eve.isNormalUser = true;
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      unzip
      p7zip
      python314
      brave
      wget
      curl
    ];
    programs.bash.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
