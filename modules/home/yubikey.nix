{ config, lib, pkgs, ... }:

{
  options.yubikey.enable =
    lib.mkEnableOption "Enable YubiKey support";

  config = lib.mkIf config.yubikey.enable {

    home.packages = [ pkgs.yubikey-personalization ];
    # This avoids the problem where GnuPG will repeatedly prompt for the insertion of an already-inserted YubiKey
    programs.gpg.scdaemonSettings.disable-ccid = true;
  };
}
