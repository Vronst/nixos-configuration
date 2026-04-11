{ pkgs, username, config, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.verver = {
    isNormalUser = true;
    description = "verver";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
