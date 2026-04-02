
{ self, config, pkgs, ... }:
{
  flake.nixosModules.vbox = { pkgs, ... }: {
    users.users.vronst.extraGroups = [ "vboxusers" ];

    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensions = true;
    };
  };
}
