{ config, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    home.file."Pictures/wallpaper".source = ../../../assets/wallpapers;
  };
}
