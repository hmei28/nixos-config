{ ... }:

{
  imports =
    [ # Add desktop
      ./hardware-configuration.nix
      ./configuration.nix
    ];
  desktop = "hyprland";
  yubikey.enable = true;
  virtualbox.enable = false;
  docker.enable = true;
  steam.enable = false;
}
