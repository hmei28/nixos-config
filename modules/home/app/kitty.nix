{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf

      scrollback_lines -1
    '';
  };
}
