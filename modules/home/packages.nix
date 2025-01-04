{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
    tree
    pinentry-gnome3
  ];

  programs = {
    jq.enable = true;
    uv.enable = true;
    go.enable = true;
    bat.enable = true;
    gpg.enable = true;
  };
}
