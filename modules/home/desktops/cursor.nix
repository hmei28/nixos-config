{ config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    home.pointerCursor = {
      enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
    };
  };
}
