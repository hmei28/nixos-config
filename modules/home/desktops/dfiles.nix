{ inputs, config, lib, ... }: {
  imports = [ inputs.dfiles.homeModules.dux-files ];

  config = lib.mkIf (config.desktop == "hyprland") {
    programs.dux-files = {
      enable = true;
      # Instance résidente : fenêtres qui s'ouvrent vite + portail réactif
      systemd.enable = true;

      # dfiles est le backend FileChooser préféré de la session Hyprland :
      # les dialogues Ouvrir/Enregistrer des apps passent par lui.
      portal = {
        enable = true;
        preferred = true;
        desktop = "hyprland";
      };
    };
  };
}
