{ config, pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file.".config/zed/keymap.json".source = ./configs/keymap.json;
    home.file.".config/zed/settings.json".source = ./configs/settings.json;
  };
}
