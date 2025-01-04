{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rtk
    opencode
  ];
}
