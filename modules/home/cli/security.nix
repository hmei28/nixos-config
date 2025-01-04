{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    rbw
    vault
  ];
}
