{
  pkgs,
  config,
  username,
  lib,
  ...
}:{
  options.steam.enable =
    lib.mkEnableOption "Enable steam";

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
