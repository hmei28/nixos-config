{ pkgs, config, ... }:
{
  desktop = "hyprland";
  yubikey.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
  sops = {
    age = {
      keyFile = "${config.home.homeDirectory}/.config/age/age.key";
    };
  };
  sops.secrets = {
    sshConfig = {
      sopsFile = ./secret.sops.yaml;
      key = "ssh_config";
      path = "${config.home.homeDirectory}/.ssh/config";
      mode = "0600";
    };
  };
  home.file.".ssh/config".force = true;

  home.packages = with pkgs; [
    sops
    commitizen
    hunspell
    hunspellDicts.fr-any
  ];
}
