{ config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.file.".config/niri/config.kdl".source = ./configs/config.kdl;
  };
}
