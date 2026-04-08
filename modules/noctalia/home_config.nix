{ config, pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file.".config/noctalia/noctalia.json".source = ./configs/noctalia.json;
  };
}
