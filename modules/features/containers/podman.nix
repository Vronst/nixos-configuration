{ self, config, pkgs, ... }:
{
  flake.nixosModules.vodman = { pkgs, ... }: {
    virtualisation.podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    environment.systemPackages = with pkgs; [
      podman-compose
    ];
  };
}
