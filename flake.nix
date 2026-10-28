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
    # Deliberate exception to the follows rule: openchamber bakes its
    # fixed-output dependency hashes (nix/hashes.json) in its CI and they
    # only reproduce against its own locked nixpkgs. The rev is also pinned:
    # any bun.lock move upstream invalidates the locally re-baked hash set
    # in modules/home/app/openchamber.nix.
    openchamber.url = "github:openchamber/openchamber/b9f2c2281aca1e0652878a82d1e90deb655df1d0";
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
