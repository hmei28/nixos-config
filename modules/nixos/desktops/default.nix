{ lib, ... }:
{
  imports = [
    ./hyprland.nix
  ];

  options.desktop = lib.mkOption {
    type = lib.types.str;
    description = "Choose which desktop environment should be configured for the user";
  };
}
