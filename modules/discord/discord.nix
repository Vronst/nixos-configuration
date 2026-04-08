{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
