{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];
  
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
}
