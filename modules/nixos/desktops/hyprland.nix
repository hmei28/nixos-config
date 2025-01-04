{config, pkgs, inputs, lib, username, ... }:

{
  config = lib.mkIf (config.desktop == "hyprland") {

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
        "https://walker.cachix.org"
      ];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      trusted-users = ["root" "@wheel"];
    };
    programs.hyprland = {
      enable = true;
      #xwayland.enable = true;
      withUWSM = true;
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    programs.dank-material-shell.greeter = {
      enable = true;
      compositor = {
        name = "hyprland";
        customConfig = ''
          hl.env("DMS_RUN_GREETER", "1")
          
          hl.config({
              misc = {
                  disable_hyprland_logo = true
              },
              input = {
                  kb_layout = "fr"
              }
          })
        '';
      };
      configHome = "/home/${username}";
      logs = {
        save = true; 
        path = "/tmp/dms-greeter.log";
      };
    };
    security.pam.services.greetd.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;
  };
}
