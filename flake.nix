{
  description = "A personal NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    dfiles = {
      url = "github:duxlabs-dev/dux-files";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dsearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Deliberate exception to the follows rule: the package is consumed
    # straight from upstream's flake (packages.<system>.openchamber) and is
    # CI-tested against its own locked nixpkgs/bun2nix/opencode, so those
    # inputs stay autonomous. Tag-pinned; no hash to re-bake since v2.7.0
    # (deps derive from bun.lock, see upstream nix/README.md).
    openchamber.url = "github:openchamber/openchamber/v2.7.0";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    #hyprland-plugins,
    dms,
    zen-browser,
    sops-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      localSystem = system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosModules.default = ./modules/nixos;
    homeModules.default = ./modules/home/home.nix;
    nixosConfigurations = import ./hosts {
      inherit
        inputs
        nixpkgs
        system
        pkgs
        self;
        lib = nixpkgs.lib;
    };
  };
}
