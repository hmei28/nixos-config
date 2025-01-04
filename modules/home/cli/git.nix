{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    # git est aussi installé au niveau système (nixos/system/packages.nix)
    # programs.git gère la config utilisateur (.gitconfig, aliases, etc.)
  };

  home.packages = with pkgs; [
    git-credential-manager
    gitlab-ci-local
  ];
}
