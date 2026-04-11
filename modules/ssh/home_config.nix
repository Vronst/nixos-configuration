{ config, pkgs, username, ... }:
{
    home-manager.users.${username} = {
      home.file.".ssh/config".source = ./configs/config;
    };
}
