{ lib, ... }:

{
  # customise /etc/nix/nix.conf declaratively via `nix.settings`
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    builders-use-substitutes = true;
    download-buffer-size = 1073741824;

    # Keep builds from saturating all cores/RAM (14 GiB, no disk swap):
    # 4 parallel jobs x 4 threads each instead of 12 jobs x ~12 threads
    max-jobs = 4;
    cores = 4;
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages (needed for nixosSystem evaluation)
  nixpkgs.config.allowUnfree = true;
}
