{ pkgs, ... }:
{
  home.packages = with pkgs; [
    glances
    htop
  ];
}
