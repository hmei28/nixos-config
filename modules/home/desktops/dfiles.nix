{ inputs, config, lib, ... }: {
  imports = [ inputs.dfiles.homeModules.dux-files ];

  config = lib.mkIf (config.desktop == "hyprland") {
    programs.dux-files = {
      enable = true;
      # Instance résidente : fenêtres qui s'ouvrent vite + portail réactif
      systemd.enable = true;

      # Enregistre le backend dfiles auprès de xdg-desktop-portal.
      # Passer preferred = true (desktop = "hyprland") plus tard pour
      # en faire le backend FileChooser par défaut.
      portal.enable = true;
    };
  };
}
