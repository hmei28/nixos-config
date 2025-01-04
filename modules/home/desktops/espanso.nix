{ config, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    services.espanso = {
      enable = false;
    };
  };
}
