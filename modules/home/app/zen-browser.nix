{
  pkgs,
  inputs,
  # username,
  ...
}:{
    programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      DisplayBookmarksToolbar = "always";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        #"*".installation_mode = "blocked";
  
        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = moz "bitwarden-password-manager";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "navbar";
        };
        # languagetool
        "languagetool-webextension@languagetool.org" = {
          install_url = moz "languagetool";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # darkreader
        "addon@darkreader.org" = {
          install_url = moz "darkreader";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        # tampermonkey
        "firefox@tampermonkey.net" = {
          install_url = moz "tampermonkey";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Wappalyzer
        "wappalyzer@crunchlabz.com" = {
          install_url = moz "wappalyzer";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
    # profiles.default.extensions.packages =
    #   with pkgs.nur.repos.rycee.firefox-addons; [
    #     bitwarden
    #     bionic-reader
    #   ];
  };
}
