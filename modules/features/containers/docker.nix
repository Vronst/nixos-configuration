{ self, config, pkgs, ... }:
{
  flake.nixosModules.vocker = { pkgs, ... }: {
    virtualisation.docker.enable = true;

    users.users.vronst.extraGroups = ["docker"];

    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
