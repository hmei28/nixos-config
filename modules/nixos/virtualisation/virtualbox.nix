{
  pkgs,
  config,
  username,
  lib,
  ...
}:{
  options.virtualbox.enable =
    lib.mkEnableOption "Enable virtualbox";

  config = lib.mkIf config.virtualbox.enable {
    virtualisation.virtualbox.host.enableExtensionPack = true;
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "${username}" ];
  };
}
