{config, pkgs, inputs, ... }:

{
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;

    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
    };
    
    environment.systemPackages = with pkgs; [
      wdisplays
      wl-clipboard
      xdg-utils
      wofi
      elegant-sddm
    ];

    # # Display manager
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.theme = "Elegant";


    programs.waybar.enable = true;
    programs.hyprlock.enable = true;
    #services.xserver.displayManager.startx.enable = true;

    # services.greetd = {
    #   enable = true;
    #   settings.default_session = {
    #     command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
    #   };
    # };

    services.hypridle.enable = true;
}