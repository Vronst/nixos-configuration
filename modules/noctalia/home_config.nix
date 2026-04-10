{ config, pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file.".config/noctalia/settings.json".source = ./configs/settings.json;
  };
}
