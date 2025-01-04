{ ... }:
{
  imports = [
    ./apps
    ./desktops
    ./system
    ./virtualisation
  ];
  environment.localBinInPath = true;
  programs.nix-ld.enable = true;
}
