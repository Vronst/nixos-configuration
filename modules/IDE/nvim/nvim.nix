{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
    ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
