{ config, pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file.".config/noctalia/noctalia-settings.json".source = ./configs/noctalia.json;
  };
}
