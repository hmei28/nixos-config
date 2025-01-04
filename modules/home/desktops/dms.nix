{ config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
      systemd.restartIfChanged = true;

      # Core features
      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;

      plugins = {
        aiAssistant.enable = true;
        calculator.enable = true;
        dankActions.enable = true;
        dankBitwarden.enable = true;
        emojiLauncher.enable = true;
        powerUsagePlugin.enable = true;
        webSearch.enable = true;
      };
    };

    home.packages = with pkgs; [
      hyprcursor
      nwg-displays
      wl-clipboard
      wtype
    ];
  };
}
