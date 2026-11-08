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
        bongoCat.enable = true;
        calculator.enable = true;
        dankActions.enable = true;
        dankBitwarden.enable = true;
        dankGifSearch.enable = true;
        emojiLauncher.enable = true;
        handMirror.enable = true;
        ocrScanner.enable = true;
        powerUsagePlugin.enable = true;
        quickCapture.enable = true;
        screenkey.enable = true;
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
