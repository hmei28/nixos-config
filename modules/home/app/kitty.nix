{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf

      scrollback_lines -1

      # kitty 0.49+ restore aussi l'état maximized/fullscreen mémorisé (#10308)
      # -> chaque nouvelle fenêtre demandait le plein écran au compositeur
      remember_window_size no
    '';
  };
}
