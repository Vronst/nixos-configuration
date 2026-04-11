{ username, pkgs, ... }:
{
  users.users.${username}.extraGroups = [ "vboxusers" ];

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
}
