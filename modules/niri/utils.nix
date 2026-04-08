{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
    wofi
    grim
    slurp
  ];

  programs.xwayland.enable = true;
}
