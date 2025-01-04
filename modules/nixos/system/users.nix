{ config, pkgs, username, ... }:
{
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      # to manage external monitor (brightness)
      "i2c"
    ];
    shell = pkgs.zsh;
  };


  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
