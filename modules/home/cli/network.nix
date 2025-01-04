{ pkgs, ... }:
{
  home.packages = with pkgs; [
    iftop
    iperf3
    rclone
    rsync
  ];
}
