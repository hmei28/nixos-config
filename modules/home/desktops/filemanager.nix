{ config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    home.packages = with pkgs; [
      nautilus
      sushi
      file-roller
    ];

    services.gnome-keyring.enable = true;
    programs.yazi.enable = true;

    # enable nextcloud client
    services.nextcloud-client.enable = true;
    services.nextcloud-client.startInBackground = true;
  };
}
