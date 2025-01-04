{
  pkgs,
  config,
  username,
  lib,
  ...
}:{
  options.docker.enable =
    lib.mkEnableOption "Enable docker";

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = [ "${username}" ];
    environment.systemPackages = with pkgs; [
      docker-compose
      docker-buildx
    ];
  };
}
