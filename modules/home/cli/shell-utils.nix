{ pkgs, ... }:
{
  programs = {
    ripgrep.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    # direnv est aussi activé au niveau système (nixos/system/shell.nix)
    # le module home-manager gère la config utilisateur (hooks shell, nix-direnv)
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    dust
    fd
    glow
    screen
    tldr
    yq
  ];
}
