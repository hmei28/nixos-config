{ lib, ... }:
{
  options.desktop = lib.mkOption {
    type = lib.types.str;
    default = "hyprland";
    description = "Desktop environment à configurer au niveau système";
    example = "hyprland";
  };

  imports = [
    ./hyprland.nix
    ./dms.nix
    ./dms-settings.nix
    ./filemanager.nix
    ./cursor.nix
    ./espanso.nix
    ./wallpapers.nix
  ];
}
