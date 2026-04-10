{ pkgs, ... }:
{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    # support for x11
    xwayland-satellite
  ];
}
